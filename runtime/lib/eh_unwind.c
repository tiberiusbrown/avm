/* C++ exception unwinder for typed catches, catch-all handlers, and cleanups.
 *
 * llvm-avm-image writes the AVEH5 block from the linked ELF. Its address is
 * stored in __avm_eh_metadata_ptr, a three-byte program-space anchor that the
 * packer patches. Each frame is unwound from the CFI rows in AVEH5, and every
 * frame's call sites are checked against its action lists.
 *
 * The packer validates the whole block. A throw checks each record it consumes,
 * with the same record checks that avm_eh_validate_block applies to all records.
 * A corrupt record fails the throw, and it never ends the search at a handler
 * that the record does not name.
 *
 * AVEH5 layout (little-endian, 24-bit program addresses):
 *   header:   "AVEH5" (5), u16 function_count, u24 block_size
 *   index:    function_count entries of u24 start and u24 record offset, in
 *             ascending start order. The offset is measured from the block start.
 *             The first record follows the index, and each record follows the one
 *             before it, so the offsets cover the records exactly.
 *   function: u24 start, u24 end, u16 row_count, u16 site_count,
 *             u16 call_count, u24 sites_offset, u24 next_offset,
 *             row_count rows, site_count sites, call_count calls, then the
 *             action pool, which fills the bytes up to next_offset
 *   row:      u16 pc_delta from start (0 for the first row), u8 flags,
 *             i16 cfa_offset, then one i16 slot for each saved register.
 *             flags bit 7: CFA base is r3 (else SP). Bits 3:0: saved r0-r3.
 *             Bits 6:4 are reserved and must be zero.
 *   site:     u24 start, u24 end, u24 landing pad, u24 action
 *             action 0: no handler or cleanup, landing pad 0.
 *             otherwise: the offset from the function record of an action
 *             list in the pool, and the landing pad lies inside the function.
 *   call:     u24 return PC, u16 outgoing argument bytes. The return PC is the
 *             address after the call instruction, which is the saved return PC
 *             of the callee's frame. The bytes are the stack arguments that the
 *             call left on the stack.
 *   action:   u8 flags, u16 catch count, then catch count entries. Flag bit 0
 *             is a cleanup, and bits 7:1 must be zero. Each entry is a u16
 *             selector, which is nonzero and distinct within the list, and a
 *             u24 type address. The address is the program address of an RTTI
 *             descriptor, and zero is catch(...), which must be the last entry.
 *             The entries are in clause order, so the first match wins. An entry
 *             matches its exact type, or a public nonvirtual base subobject of the
 *             thrown class, which match_class_base finds from the RTTI.
 *
 * sites_offset and next_offset are measured from the start of their function
 * record. The rows fill the bytes from the header to sites_offset, the sites
 * follow, then the calls, then the action pool, and next_offset is the start of
 * the next record. A lookup therefore reaches the sites and calls without
 * reading any row, and the action lists are read from flash when a throw uses
 * them.
 *
 * The record walks and the site and call checks are kept out of line, so each
 * frame holds only its own live values. The header and row checks are inlined,
 * which keeps their walks smaller. */

#include <avm/pgmspace.h>
#include <avm/trap.h>
#include <string.h>

#include "eh_unwind_internal.h"

#define AVEH5_HEADER_SIZE 10
#define AVEH5_INDEX_ENTRY_SIZE 6
#define AVEH5_FUNCTION_HEADER_SIZE 18
#define AVEH5_ROW_HEADER_SIZE 5
#define AVEH5_ROW_MAX_SIZE 13
#define AVEH5_SITE_SIZE 12
#define AVEH5_CALL_SIZE 5
#define AVEH5_ACTION_HEADER_SIZE 3
#define AVEH5_CATCH_SIZE 5
#define AVEH5_ACTION_CLEANUP 0x01
#define AVEH5_FLAG_R3_BASE 0x80
#define AVEH5_FLAG_RESERVED 0x70
#define AVEH5_FLAG_SAVED_MASK 0x0f
#define AVEH5_ADDRESS_LIMIT 0x1000000ul
/* Type descriptors lie above the reserved header of the program image. */
#define AVEH5_TYPE_BASE 0x100ul
/* A call's stack arguments fit in the 256-byte guest stack. */
#define AVEH5_ARGUMENT_LIMIT 256
/* A saved return record is three bytes, below the caller's CFA. */
#define AVEH5_RETURN_RECORD 3
/* Returned by the record lookups when a record is malformed. Address 0 means no
 * record, and no valid record lies at this address. */
#define AVEH5_BAD 0xfffffffful
/* A match result. A matching clause puts its selector in bits 15:0 and its base
 * adjustment in bits 31:16. A result with no matching clause has a zero selector, and
 * it sets AVEH5_MATCH_CLEANUP in bit 16 when the list has a cleanup. A matching clause
 * never sets that bit, because its handler ends the search. The adjustment is below the
 * 16-bit object size, so a matching result never equals AVEH5_BAD. */
#define AVEH5_MATCH_CLEANUP 0x00010000ul
/* Set in the result of list_ok for a well-formed list, with the list's flags below it. */
#define AVEH5_LIST_VALID 0x80
#define AVEH5_INLINE static inline __attribute__((always_inline))
#define AVEH5_NOINLINE static __attribute__((noinline))

/* Anchor for the metadata block. The packer patches these three bytes with the
 * AVEH5 address, and zero means the block is missing. */
const uint8_t AVM_PROGMEM __avm_eh_metadata_ptr[3] = {0, 0, 0};

/* Flash reads follow trap_lookup.c. LDP24 reads a full program address, and
 * host builds read the same bytes through memcpy_P. */
#ifdef __AVM__
AVEH5_INLINE uint8_t read_flash_u8(uint32_t address) {
    return *(uint8_t const AVM_PROGMEM *)address;
}

AVEH5_INLINE uint16_t read_flash_u16(uint32_t address) {
    return *(uint16_t const AVM_PROGMEM *)address;
}

AVEH5_INLINE uint32_t read_flash_u24(uint32_t address) {
    uint32_t value;
    __asm__ volatile("ldp24 %0, [%1]" : "=q"(value) : "q"(address));
    return value;
}
#else
AVEH5_INLINE uint8_t read_flash_u8(uint32_t address) {
    uint8_t value;
    memcpy_P(&value, (uint8_t const AVM_PROGMEM *)address, 1);
    return value;
}

AVEH5_INLINE uint16_t read_flash_u16(uint32_t address) {
    uint8_t bytes[2];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 2);
    return (uint16_t)(bytes[0] | (bytes[1] << 8));
}

AVEH5_INLINE uint32_t read_flash_u24(uint32_t address) {
    uint8_t bytes[3];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 3);
    return bytes[0] | ((uint32_t)bytes[1] << 8) | ((uint32_t)bytes[2] << 16);
}
#endif

/* Stack and frame memory are data-space addresses, which fit in 16 bits. */
AVEH5_INLINE uint8_t read_ram_u8(uint16_t address) {
    return *(uint8_t *)(uintptr_t)address;
}

AVEH5_INLINE uint16_t read_ram_u16(uint16_t address) {
    return *(uint16_t *)(uintptr_t)address;
}

_Static_assert(sizeof(struct avm_eh_context) == 15,
               "eh_context.asm assumes a 15-byte context");
_Static_assert(offsetof(struct avm_eh_context, sp) == 0, "context SP offset");
_Static_assert(offsetof(struct avm_eh_context, pc_low) == 2,
               "context PC offset");
_Static_assert(offsetof(struct avm_eh_context, pc_high) == 4,
               "context PC high offset");
_Static_assert(offsetof(struct avm_eh_context, r) == 5, "context r0 offset");
_Static_assert(offsetof(struct avm_eh_context, exception) == 13,
               "context exception offset");
_Static_assert(sizeof(void (*)(void *)) == 3,
               "exception destructor must be a 24-bit program address");

AVEH5_INLINE uint32_t context_pc(const struct avm_eh_context *context) {
    return context->pc_low | ((uint32_t)context->pc_high << 16);
}

AVEH5_INLINE void set_context_pc(struct avm_eh_context *context, uint32_t pc) {
    context->pc_low = (uint16_t)pc;
    context->pc_high = (uint8_t)(pc >> 16);
}

AVEH5_INLINE uint8_t popcount4(uint8_t mask) {
    return (uint8_t)((mask & 1) + ((mask >> 1) & 1) + ((mask >> 2) & 1) +
                     ((mask >> 3) & 1));
}

/* Record sizes times a count, by shifts and adds. A 32-bit multiply would call the
 * shared __avm_umulhisi3 helper from the search path. The empty asm makes its
 * second operand opaque, so the optimizer cannot fold the sum back into a multiply. */
AVEH5_INLINE uint32_t times5(uint32_t count) {
    uint32_t shifted = count << 2;
    __asm__("" : "+q"(count));
    return shifted + count;
}

/* Six-byte index entries. The same opaque-operand pattern keeps the sum from folding
 * back into a multiply, which the search would otherwise call through __avm_umulhisi3. */
AVEH5_INLINE uint32_t times6(uint32_t count) {
    uint32_t shifted = count << 2;
    __asm__("" : "+q"(count));
    return shifted + (count << 1);
}

AVEH5_INLINE uint32_t times12(uint32_t count) {
    uint32_t shifted = count << 3;
    __asm__("" : "+q"(count));
    return shifted + (count << 2);
}

AVEH5_INLINE uint32_t times13(uint32_t count) {
    uint32_t eighth = count << 3;
    __asm__("" : "+q"(count));
    uint32_t quarter = count << 2;
    __asm__("" : "+q"(count));
    return eighth + quarter + count;
}

/* Size of one row record, which depends on the number of saved registers. */
AVEH5_INLINE uint32_t row_size(uint8_t flags) {
    return AVEH5_ROW_HEADER_SIZE +
           ((uint32_t)popcount4(flags & AVEH5_FLAG_SAVED_MASK) << 1);
}

/* The first site of a function record. The sites follow the rows at sites_offset,
 * which the record's header gives directly. */
AVEH5_INLINE uint32_t sites_of(uint32_t fh) {
    return fh + read_flash_u24(fh + 12);
}

/* The first call of a function record. The calls follow the sites. */
AVEH5_INLINE uint32_t calls_of(uint32_t fh) {
    return sites_of(fh) + times12(read_flash_u16(fh + 8));
}

/* The action pool, as an offset from the function record. It follows the calls
 * and fills the rest of the record. */
AVEH5_INLINE uint32_t pool_offset(uint32_t fh) {
    return read_flash_u24(fh + 12) + times12(read_flash_u16(fh + 8)) +
           times5(read_flash_u16(fh + 10));
}

/* Opens the block. Returns its end address, or 0 when the anchor does not name
 * a well-formed AVEH5 header. */
static inline uint32_t open_block(uint32_t block) {
    if (block == 0 || block >= AVEH5_ADDRESS_LIMIT)
        return 0;
    if (read_flash_u8(block) != 'A' || read_flash_u8(block + 1) != 'V' ||
        read_flash_u8(block + 2) != 'E' || read_flash_u8(block + 3) != 'H' ||
        read_flash_u8(block + 4) != '5')
        return 0;
    uint32_t size = read_flash_u24(block + 7);
    if (size < AVEH5_HEADER_SIZE || size > AVEH5_ADDRESS_LIMIT - block)
        return 0;
    return block + size;
}

/* Decodes the header of the function record at fh and returns the address of the
 * next record, or 0 when the header is malformed or the record extends past limit.
 * The header sizes are checked here, in constant time. The rows, sites, calls, and
 * actions are checked when a lookup consumes them. */
AVEH5_INLINE uint32_t record_next(uint32_t fh, uint32_t limit) {
    if (limit - fh < AVEH5_FUNCTION_HEADER_SIZE)
        return 0;
    uint32_t rows = read_flash_u16(fh + 6);
    uint32_t sites_offset = read_flash_u24(fh + 12);
    uint32_t next_offset = read_flash_u24(fh + 15);
    /* The rows fill the bytes from the header to sites_offset. Each row is five to
     * thirteen bytes. */
    if (rows == 0 ||
        sites_offset < AVEH5_FUNCTION_HEADER_SIZE + times5(rows) ||
        sites_offset > AVEH5_FUNCTION_HEADER_SIZE + times13(rows))
        return 0;
    /* The sites and calls come first, and the action pool fills the rest of the
     * record, so the record must hold at least the sites and calls. */
    if (next_offset < sites_offset ||
        next_offset - sites_offset <
            times12(read_flash_u16(fh + 8)) + times5(read_flash_u16(fh + 10)))
        return 0;
    if (next_offset > limit - fh)
        return 0;
    return fh + next_offset;
}

/* The record checks below are shared by the throw path, which applies them to the
 * records it consumes, and by avm_eh_validate_block, which applies them to all.
 * Each returns 1 only when the record is well formed. */

/* Each check takes the address of the record and the address of the record before
 * it in the same function, or 0 for the first. The function's start and end come
 * from its header, so a check needs no copies of them. */

/* One row. The row and its saved-register slots lie between the header and
 * sites_offset. The first row starts at the function start, and rows strictly
 * increase. The row lies inside its function. */
static inline uint8_t row_ok(uint32_t fh, uint32_t row, uint32_t previous) {
    uint32_t rows_end = sites_of(fh);
    if (row > rows_end || rows_end - row < AVEH5_ROW_HEADER_SIZE)
        return 0;
    uint8_t flags = read_flash_u8(row + 2);
    if (row_size(flags) > rows_end - row)
        return 0;
    uint32_t delta = read_flash_u16(row);
    if (flags & AVEH5_FLAG_RESERVED)
        return 0;
    if (previous ? delta <= read_flash_u16(previous) : delta != 0)
        return 0;
    return read_flash_u24(fh) + delta < read_flash_u24(fh + 3);
}

/* One site. Sites are ordered and lie inside the function. A site with an action
 * has a landing pad inside the function. A site with no action has no landing pad.
 * The action's offset is not checked here. Each reader of an action checks the
 * offset before it reads the list, in match_list, so a site that no throw reads
 * does not cost the scan a pool check. */
AVEH5_NOINLINE uint8_t site_ok(uint32_t fh, uint32_t site, uint32_t previous) {
    uint32_t previous_end = previous ? read_flash_u24(previous + 3) : read_flash_u24(fh);
    if (read_flash_u24(site) >= read_flash_u24(site + 3) ||
        read_flash_u24(site) < previous_end || read_flash_u24(site + 3) > read_flash_u24(fh + 3))
        return 0;
    if (read_flash_u24(site + 9) == 0)
        return read_flash_u24(site + 6) == 0;
    uint32_t pad = read_flash_u24(site + 6);
    return pad >= read_flash_u24(fh) && pad < read_flash_u24(fh + 3);
}

/* One call. Return PCs strictly increase inside (start, end], and the stack
 * arguments fit in the guest stack. */
AVEH5_INLINE uint8_t call_ok(uint32_t fh, uint32_t call, uint32_t previous) {
    uint32_t start = read_flash_u24(fh);
    uint32_t end = read_flash_u24(fh + 3);
    uint32_t return_pc = read_flash_u24(call);
    uint32_t previous_return = previous ? read_flash_u24(previous) : start;
    if (return_pc <= start || return_pc > end || return_pc <= previous_return)
        return 0;
    return read_flash_u16(call + 3) < AVEH5_ARGUMENT_LIMIT;
}

/* Returns 1 when one of the count call records from calls returns inside site.
 * The packer enforces the same rule, and the call that threw must have a record
 * whatever the site's action. */
AVEH5_NOINLINE uint8_t site_has_call(uint32_t site, uint32_t calls, uint16_t count) {
    uint32_t start = read_flash_u24(site);
    uint32_t end = read_flash_u24(site + 3);
    for (uint16_t c = 0; c < count; c++) {
        uint32_t pc = read_flash_u24(calls + times5(c));
        if (pc > start && pc <= end)
            return 1;
    }
    return 0;
}

/* Stores and loads a 24-bit program address held as three bytes in the header. */
AVEH5_INLINE void store24(uint8_t *bytes, uint32_t value) {
    bytes[0] = (uint8_t)value;
    bytes[1] = (uint8_t)(value >> 8);
    bytes[2] = (uint8_t)(value >> 16);
}

AVEH5_INLINE uint32_t load24(const uint8_t *bytes) {
    return bytes[0] | ((uint32_t)bytes[1] << 8) | ((uint32_t)bytes[2] << 16);
}

/* Opens the metadata of the exception at header. It reads the anchor, validates the
 * block header and the index bounds once, and caches the block address, the block end,
 * and the function count in the header. The index entries are not scanned here, and the
 * first record must follow the index. Returns 0 when the anchor does not name a
 * well-formed block, or when the index does not fit in it. */
uint8_t avm_eh_open_exception(struct avm_eh_exception *header) {
    uint32_t block = read_flash_u24((uint32_t)__avm_eh_metadata_ptr);
    uint32_t limit = open_block(block);
    if (!limit)
        return 0;
    uint32_t count = read_flash_u16(block + 5);
    if (AVEH5_HEADER_SIZE + times6(count) > limit - block)
        return 0;
    if (count && read_flash_u24(block + AVEH5_HEADER_SIZE + 3) != AVEH5_HEADER_SIZE + times6(count))
        return 0;
    store24(header->eh_block_address, block);
    store24(header->eh_block_end, limit);
    header->eh_function_count = (uint16_t)count;
    return 1;
}

/* Returns the function record that covers lookup, or 0 when no record does. A lookup
 * in a gap, or past the last record, returns 0. The index is searched by upper bound,
 * so the selected entry is the last one whose start is at or before lookup. The
 * selected entry must name a record that starts at its start, that contains lookup,
 * and that ends where the next entry begins, or at the block end for the last record.
 * The record header is checked with record_next. Only the entries that the search
 * reads, and the selected record, are read here. The packer checks the whole index.
 * The block and its count come from header, which avm_eh_open_exception validated. */
AVEH5_NOINLINE uint32_t find_function(const struct avm_eh_exception *header, uint32_t lookup) {
    uint32_t block = load24(header->eh_block_address);
    uint16_t lo = 0;
    uint16_t hi = header->eh_function_count;
    while (lo < hi) {
        uint16_t mid = lo + ((hi - lo) >> 1);
        if (read_flash_u24(block + AVEH5_HEADER_SIZE + times6(mid)) <= lookup)
            lo = mid + 1;
        else
            hi = mid;
    }
    if (lo == 0)
        return 0;
    uint32_t selected = block + AVEH5_HEADER_SIZE + times6(lo - 1);
    uint32_t offset = read_flash_u24(selected + 3);
    /* The first record follows the index, and no record lies past the block end. */
    if (offset < AVEH5_HEADER_SIZE + times6(header->eh_function_count) ||
        offset > load24(header->eh_block_end) - block)
        return 0;
    uint32_t fh = block + offset;
    uint32_t limit = load24(header->eh_block_end);
    if (limit - fh < AVEH5_FUNCTION_HEADER_SIZE)
        return 0;
    uint32_t start = read_flash_u24(selected);
    uint32_t end = read_flash_u24(fh + 3);
    if (read_flash_u24(fh) != start || end <= start || lookup < start || lookup >= end)
        return 0;
    /* The next record starts at or after this end, and it begins where the next entry
     * says. The last record ends at the block end. */
    uint32_t next = limit;
    if (lo < header->eh_function_count) {
        if (read_flash_u24(selected + AVEH5_INDEX_ENTRY_SIZE) < end)
            return 0;
        next = block + read_flash_u24(selected + AVEH5_INDEX_ENTRY_SIZE + 3);
    }
    if (record_next(fh, limit) != next)
        return 0;
    return fh;
}

/* Returns the row that covers lookup, which is the last row that starts at or
 * before it, or AVEH5_BAD when a row that the walk reads is malformed. The rows lie
 * between the header and sites_offset, and each row must fit there. The walk stops
 * at the first row past lookup, so later rows are not read. */
AVEH5_NOINLINE uint32_t find_row(uint32_t fh, uint32_t lookup) {
    /* The function's start and end, and the end of its rows, are read once. row_ok
     * checks each row against the same three values. */
    uint32_t start = read_flash_u24(fh);
    uint32_t end = read_flash_u24(fh + 3);
    uint32_t rows_end = sites_of(fh);
    /* found is the covering row so far, and it is the predecessor of the next row. It
     * is 0 before the first row, and previous_delta is then unused. */
    uint32_t found = 0;
    uint16_t previous_delta = 0;
    for (uint16_t r = 0, count = read_flash_u16(fh + 6); r < count; r++) {
        uint32_t row = found ? found + row_size(read_flash_u8(found + 2))
                             : fh + AVEH5_FUNCTION_HEADER_SIZE;
        if (rows_end < row || rows_end - row < AVEH5_ROW_HEADER_SIZE)
            return AVEH5_BAD;
        uint8_t flags = read_flash_u8(row + 2);
        uint16_t delta = read_flash_u16(row);
        if (row_size(flags) > rows_end - row || (flags & AVEH5_FLAG_RESERVED))
            return AVEH5_BAD;
        if (found ? delta <= previous_delta : delta != 0)
            return AVEH5_BAD;
        if (start + delta >= end)
            return AVEH5_BAD;
        if (start + delta > lookup)
            break;
        found = row;
        previous_delta = delta;
    }
    return found;
}

/* Returns the site record that covers lookup, 0 when no record does (a gap between
 * records has no handler), or AVEH5_BAD when a site the scan reads is malformed.
 * The sites are sorted, so the scan stops at the first site past lookup. */
AVEH5_NOINLINE uint32_t find_site(uint32_t fh, uint32_t lookup) {
    uint32_t address = sites_of(fh);
    for (uint16_t s = 0, count = read_flash_u16(fh + 8); s < count;
         s++, address += AVEH5_SITE_SIZE) {
        if (!site_ok(fh, address, s ? address - AVEH5_SITE_SIZE : 0))
            return AVEH5_BAD;
        if (lookup < read_flash_u24(address))
            return 0;
        if (lookup < read_flash_u24(address + 3))
            return address;
    }
    return 0;
}

/* Returns the outgoing argument bytes of the call whose return PC is return_pc. A
 * site with a handler or cleanup needs this record, so a missing or malformed one
 * returns AVEH5_BAD and fails the throw. The calls follow the sites directly. */
AVEH5_NOINLINE uint32_t find_call(uint32_t fh, uint32_t return_pc) {
    uint32_t address = calls_of(fh);
    for (uint16_t c = 0, count = read_flash_u16(fh + 10); c < count;
         c++, address += AVEH5_CALL_SIZE) {
        if (!call_ok(fh, address, c ? address - AVEH5_CALL_SIZE : 0))
            return AVEH5_BAD;
        uint32_t pc = read_flash_u24(address);
        if (pc == return_pc)
            return read_flash_u16(address + 3);
        if (pc > return_pc)
            return AVEH5_BAD;
    }
    return AVEH5_BAD;
}

/* The support vtables that eh_cxa.c defines for the class descriptors. A class
 * descriptor begins with its vtable address point, which lies six bytes into the
 * vtable of its kind. The three kinds below are the layouts that carry base
 * information. The other kinds are exact-match-only. */
extern const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv117__class_type_infoE[9];
extern const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv120__si_class_type_infoE[9];
extern const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv121__vmi_class_type_infoE[9];

#define AVM_RTTI_ADDRESS_POINT 6
/* An SI descriptor holds one base descriptor after its vtable and type name. */
#define AVM_RTTI_SI_BASE 6
/* A VMI descriptor holds its direct base count after its flags, and the base
 * entries follow the 10-byte header. */
#define AVM_RTTI_VMI_COUNT 8
#define AVM_RTTI_VMI_HEADER 10
/* The low byte of a base entry's offset-and-flags word. The upper 24 bits are the
 * signed byte offset of the base subobject within its containing subobject. */
#define AVM_RTTI_BASE_VIRTUAL 0x01
#define AVM_RTTI_BASE_PUBLIC 0x02
#define AVM_RTTI_BASE_RESERVED 0xfc
/* The walk holds the thrown class and up to seven levels of its bases, and it reads
 * at most this many base edges for one clause. */
#define AVM_RTTI_MAX_DEPTH 8
#define AVM_RTTI_MAX_BASES 32
#define AVM_RTTI_MAX_EDGES 512
/* Results of match_class_base. A virtual edge is UNSUPPORTED, and it matches
 * nothing. A walk that exceeds its limits is LIMIT, which cannot decide the clause,
 * so the throw fails. INVALID is a malformed descriptor, which also fails the throw. */
#define AVM_RTTI_NO_MATCH 0
#define AVM_RTTI_MATCH 1
#define AVM_RTTI_UNSUPPORTED 2
#define AVM_RTTI_INVALID 3
#define AVM_RTTI_LIMIT 4

enum avm_rtti_kind {
    AVM_RTTI_OTHER,
    AVM_RTTI_CLASS,
    AVM_RTTI_SI,
    AVM_RTTI_VMI
};

/* Seven times a count, by shifts and a subtraction. The empty asm keeps the optimizer
 * from folding the subtraction back into a multiply, as times5 does. */
AVEH5_INLINE uint32_t times7(uint32_t count) {
    uint32_t shifted = count << 3;
    __asm__("" : "+q"(count));
    return shifted - count;
}

/* Classifies the descriptor at address. An address below the reserved header, or
 * one too close to the 24-bit limit for the VMI header, is OTHER, so the walk never
 * reads outside program space. */
AVEH5_INLINE enum avm_rtti_kind rtti_kind(uint32_t address) {
    if (address < AVEH5_TYPE_BASE || address > AVEH5_ADDRESS_LIMIT - AVM_RTTI_VMI_HEADER)
        return AVM_RTTI_OTHER;
    uint32_t point = read_flash_u24(address);
    if (point == (uint32_t)_ZTVN10__cxxabiv117__class_type_infoE + AVM_RTTI_ADDRESS_POINT)
        return AVM_RTTI_CLASS;
    if (point == (uint32_t)_ZTVN10__cxxabiv120__si_class_type_infoE + AVM_RTTI_ADDRESS_POINT)
        return AVM_RTTI_SI;
    if (point == (uint32_t)_ZTVN10__cxxabiv121__vmi_class_type_infoE + AVM_RTTI_ADDRESS_POINT)
        return AVM_RTTI_VMI;
    return AVM_RTTI_OTHER;
}

/* Reads the base edge at position index in the class descriptor at descriptor, whose
 * kind is kind, and returns the base's descriptor address. An SI class has one base,
 * which lies at offset zero and is public. A VMI entry's offset-and-flags word holds
 * the flags in its low byte and the signed offset in its upper 24 bits. The flags are
 * read as their own byte, and the offset from the three bytes above them, so the
 * offset is never truncated to 16 bits. */
AVEH5_INLINE uint32_t read_base_edge(uint32_t descriptor, enum avm_rtti_kind kind,
                                     uint8_t index, int32_t *offset, uint8_t *flags) {
    if (kind == AVM_RTTI_SI) {
        *offset = 0;
        *flags = AVM_RTTI_BASE_PUBLIC;
        return read_flash_u24(descriptor + AVM_RTTI_SI_BASE);
    }
    uint32_t entry = descriptor + AVM_RTTI_VMI_HEADER + times7(index);
    int32_t edge = read_flash_u24(entry + 4);
    if (edge & 0x800000)
        edge -= 0x1000000;
    *offset = edge;
    *flags = read_flash_u8(entry + 3);
    return read_flash_u24(entry);
}

/* Decides whether catch_type is the unique public nonvirtual base subobject of the
 * thrown class. The walk is a depth-first search over the class descriptors. It keeps
 * one byte per level, the index of the next direct base to visit there, so its stack
 * is eight bytes. A level's descriptor, offset, and access are replayed from the
 * thrown class and those indices. Each distinct path to catch_type is a distinct
 * subobject. The walk records the first match and counts the rest, so two subobjects
 * make the conversion ambiguous, and a nonpublic path to the only one makes it
 * inaccessible. Both return NO_MATCH. The whole hierarchy is walked before the
 * decision, because a second match may lie past the first.
 *
 * A virtual edge returns UNSUPPORTED, since its offset locates a vtable entry and not
 * a subobject. A malformed descriptor or edge returns INVALID. A walk past its depth
 * or edge budget returns LIMIT. A cycle stays on one path until the depth limit, so
 * it also returns LIMIT. The adjustment is written only when the result is MATCH. */
AVEH5_NOINLINE uint8_t match_class_base(uint32_t thrown_type, uint32_t catch_type,
                                        uint16_t exception_size, uint16_t *adjustment) {
    uint8_t next[AVM_RTTI_MAX_DEPTH];
    uint8_t depth = 0;
    uint8_t matches = 0;
    uint8_t match_public = 0;
    uint16_t match_offset = 0;
    uint16_t edges = 0;

    if (rtti_kind(catch_type) == AVM_RTTI_OTHER || rtti_kind(thrown_type) == AVM_RTTI_OTHER)
        return AVM_RTTI_NO_MATCH;
    next[0] = 0;
    for (;;) {
        /* Replays the path to the top node. Each edge on the path was checked when the
         * walk pushed it, so the replay checks nothing again. */
        uint32_t descriptor = thrown_type;
        int32_t cumulative = 0;
        uint8_t public_path = 1;
        for (uint8_t level = 0; level < depth; level++) {
            int32_t offset;
            uint8_t flags;
            descriptor = read_base_edge(descriptor, rtti_kind(descriptor), next[level] - 1,
                                        &offset, &flags);
            cumulative += offset;
            if (!(flags & AVM_RTTI_BASE_PUBLIC))
                public_path = 0;
        }

        enum avm_rtti_kind kind = rtti_kind(descriptor);
        uint16_t count = 0;
        if (kind == AVM_RTTI_SI) {
            count = 1;
        } else if (kind == AVM_RTTI_VMI) {
            count = read_flash_u16(descriptor + AVM_RTTI_VMI_COUNT);
            if (count > AVM_RTTI_MAX_BASES ||
                descriptor > AVEH5_ADDRESS_LIMIT - (AVM_RTTI_VMI_HEADER + times7(count)))
                return AVM_RTTI_INVALID;
        }
        if (next[depth] >= count) {
            if (depth == 0)
                break;
            depth--;
            continue;
        }

        int32_t offset;
        uint8_t flags;
        uint32_t base = read_base_edge(descriptor, kind, next[depth]++, &offset, &flags);
        if (flags & AVM_RTTI_BASE_VIRTUAL)
            return AVM_RTTI_UNSUPPORTED;
        if (flags & AVM_RTTI_BASE_RESERVED)
            return AVM_RTTI_INVALID;
        int32_t child_offset = cumulative + offset;
        if (child_offset < 0 || child_offset >= exception_size)
            return AVM_RTTI_INVALID;
        if (rtti_kind(base) == AVM_RTTI_OTHER)
            return AVM_RTTI_INVALID;
        if (++edges > AVM_RTTI_MAX_EDGES || depth + 1 >= AVM_RTTI_MAX_DEPTH)
            return AVM_RTTI_LIMIT;

        uint8_t child_public = (public_path && (flags & AVM_RTTI_BASE_PUBLIC)) ? 1 : 0;
        if (base == catch_type) {
            if (matches < 2)
                matches++;
            if (matches == 1) {
                match_offset = (uint16_t)child_offset;
                match_public = child_public;
            }
        }
        depth++;
        next[depth] = 0;
    }

    if (matches != 1 || !match_public)
        return AVM_RTTI_NO_MATCH;
    *adjustment = match_offset;
    return AVM_RTTI_MATCH;
}

/* The thrown type is the 24-bit descriptor address that the throw shim stored. */
AVEH5_INLINE uint32_t thrown_type_of(const struct avm_eh_exception *header) {
    return load24(header->type_address);
}

/* Checks the action list at list of the function at fh. The list lies in the pool, and
 * its flags, catch count, and entries must lie inside the record. The flags may set
 * only the cleanup bit, each selector is nonzero and distinct, and a catch-all is last.
 * Returns 0 when the list is malformed. Otherwise it returns the list's flags with
 * AVEH5_LIST_VALID set, so a caller keeps one byte of the list's state. The block
 * validator and the throw path both call it, so the matcher is not on the validator's
 * call path. */
AVEH5_NOINLINE uint8_t list_ok(uint32_t fh, uint32_t list) {
    uint32_t end = fh + read_flash_u24(fh + 15);
    if (list < fh + pool_offset(fh) || list > end || end - list < AVEH5_ACTION_HEADER_SIZE)
        return 0;
    uint8_t flags = read_flash_u8(list);
    uint16_t count = read_flash_u16(list + 1);
    if ((flags & ~AVEH5_ACTION_CLEANUP) || (flags == 0 && count == 0))
        return 0;
    if (end - list - AVEH5_ACTION_HEADER_SIZE < times5(count))
        return 0;
    uint32_t entry = list + AVEH5_ACTION_HEADER_SIZE;
    uint32_t stop = entry + times5(count);
    for (; entry != stop; entry += AVEH5_CATCH_SIZE) {
        uint16_t selector = read_flash_u16(entry);
        uint32_t type = read_flash_u24(entry + 2);
        if (selector == 0 || (type == 0 && entry + AVEH5_CATCH_SIZE != stop))
            return 0;
        if (type != 0 && type < AVEH5_TYPE_BASE)
            return 0;
        for (uint32_t prior = list + AVEH5_ACTION_HEADER_SIZE; prior != entry;
             prior += AVEH5_CATCH_SIZE)
            if (read_flash_u16(prior) == selector)
                return 0;
    }
    return AVEH5_LIST_VALID | flags;
}

/* Matches the action list at list against the thrown object in header. The whole list
 * is checked first by list_ok, so a malformed list fails whichever entry would have
 * matched. The entries are then read in clause order, and the first one that matches
 * decides. Returns AVEH5_BAD when the list is malformed, or when the RTTI of a clause
 * cannot be decided. A matching clause returns its selector and base adjustment, as
 * AVEH5_MATCH_CLEANUP's comment describes. When no clause matches, the selector is zero,
 * and the result carries AVEH5_MATCH_CLEANUP if the list has a cleanup. The thrown type
 * and size are read from the header, so the loop keeps only the header pointer. */
AVEH5_NOINLINE uint32_t match_list(uint32_t fh, uint32_t list,
                                   const struct avm_eh_exception *header) {
    uint8_t valid = list_ok(fh, list);
    if (!valid)
        return AVEH5_BAD;
    uint32_t entry = list + AVEH5_ACTION_HEADER_SIZE;
    uint32_t stop = entry + times5(read_flash_u16(list + 1));
    for (; entry != stop; entry += AVEH5_CATCH_SIZE) {
        uint16_t selector = read_flash_u16(entry);
        uint32_t type = read_flash_u24(entry + 2);
        if (type == 0 || type == thrown_type_of(header))
            return selector;
        uint16_t adjustment = 0;
        uint8_t result = match_class_base(thrown_type_of(header), type, header->size,
                                          &adjustment);
        if (result == AVM_RTTI_INVALID || result == AVM_RTTI_LIMIT)
            return AVEH5_BAD;
        if (result == AVM_RTTI_MATCH)
            return selector | ((uint32_t)adjustment << 16);
    }
    return (valid & AVEH5_ACTION_CLEANUP) ? AVEH5_MATCH_CLEANUP : 0;
}

/* The match of the site's action for thrown_type, in match_list's encoding. A site
 * with no action selects nothing, which is zero, and otherwise the action is the list
 * that match_list checks. Inlined into its callers, so the matcher adds no frame of
 * its own. The callers read the site's action once, through this match. */
AVEH5_INLINE uint32_t match_action(uint32_t fh, uint32_t site,
                                   const struct avm_eh_exception *header) {
    uint32_t action = read_flash_u24(site + 9);
    return action ? match_list(fh, fh + action, header) : 0;
}

/* True when a stack address lies in the guest stack window. */
AVEH5_INLINE uint8_t stack_address(int32_t address) {
    return address >= AVM_TRAP_STACK_BASE && address < AVM_TRAP_STACK_TOP;
}

/* Returns 1 when some site of the function names the action list at the function
 * offset action. The validator uses it, so every list must be used. */
AVEH5_NOINLINE uint8_t list_named(uint32_t sites, uint16_t site_count, uint32_t action) {
    for (uint16_t s = 0; s < site_count; s++)
        if (read_flash_u24(sites + times12(s) + 9) == action)
            return 1;
    return 0;
}

/* Checks the action pool of the function at fh, from its start to next. Every list
 * must be complete and valid, every list must be used by a site, every site's
 * action must name the start of a list, and the lists must end at next. */
AVEH5_NOINLINE uint8_t pool_ok(uint32_t fh, uint32_t sites, uint16_t site_count,
                               uint32_t next) {
    uint32_t list = fh + pool_offset(fh);
    while (list < next) {
        if (!list_ok(fh, list))
            return 0;
        if (!list_named(sites, site_count, list - fh))
            return 0;
        list += AVEH5_ACTION_HEADER_SIZE + times5(read_flash_u16(list + 1));
    }
    if (list != next)
        return 0;
    for (uint16_t s = 0; s < site_count; s++) {
        uint32_t action = read_flash_u24(sites + times12(s) + 9);
        if (!action)
            continue;
        /* The lists from the pool start to next were checked above, so this walk reads
         * only validated lists, and it stops at the action or at next. An action past
         * the record never matches a list start. */
        uint32_t start = fh + pool_offset(fh);
        while (start < next && start < fh + action)
            start += AVEH5_ACTION_HEADER_SIZE + times5(read_flash_u16(start + 1));
        if (start != fh + action)
            return 0;
    }
    return 1;
}

/* Checks the whole block. It applies the record checks above to every record, so
 * it is the complete form of the checks that a throw applies as it consumes
 * records. Throws do not call it. Each record must also end exactly where its rows,
 * sites, calls, and action pool end, and the last record must end at the block end. */
uint8_t avm_eh_validate_block(uint32_t block) {
    uint32_t limit = open_block(block);
    if (!limit)
        return 0;
    uint16_t count = read_flash_u16(block + 5);
    /* The index fills the bytes after the header, and the first record follows it. */
    if (AVEH5_HEADER_SIZE + times6(count) > limit - block)
        return 0;
    uint32_t fh = block + AVEH5_HEADER_SIZE + times6(count);
    uint32_t previous_end = 0;
    for (uint16_t f = 0; f < count; f++) {
        uint32_t entry = block + AVEH5_HEADER_SIZE + times6(f);
        uint32_t next = record_next(fh, limit);
        if (!next)
            return 0;
        uint32_t start = read_flash_u24(fh);
        uint32_t end = read_flash_u24(fh + 3);
        if (start >= end || start < previous_end)
            return 0;
        /* The entry names this record by start and offset. The next entry names the
         * record that follows, and the last record ends at the block end. */
        if (read_flash_u24(entry) != start || read_flash_u24(entry + 3) != fh - block)
            return 0;
        uint32_t following = limit;
        if (f + 1 < count)
            following = block + read_flash_u24(entry + AVEH5_INDEX_ENTRY_SIZE + 3);
        if (next != following)
            return 0;
        previous_end = end;

        uint16_t row_count = read_flash_u16(fh + 6);
        uint16_t site_count = read_flash_u16(fh + 8);
        uint16_t call_count = read_flash_u16(fh + 10);
        uint32_t rows_end = sites_of(fh);
        uint32_t address = fh + AVEH5_FUNCTION_HEADER_SIZE;
        uint32_t previous = 0;
        for (uint16_t r = 0; r < row_count; r++) {
            if (!row_ok(fh, address, previous))
                return 0;
            previous = address;
            address += row_size(read_flash_u8(address + 2));
        }
        if (address != rows_end)
            return 0;
        previous = 0;
        uint32_t sites = address;
        for (uint16_t s = 0; s < site_count; s++, address += AVEH5_SITE_SIZE) {
            if (!site_ok(fh, address, previous))
                return 0;
            previous = address;
        }
        uint32_t calls = address;
        previous = 0;
        for (uint16_t c = 0; c < call_count; c++, address += AVEH5_CALL_SIZE) {
            if (!call_ok(fh, address, previous))
                return 0;
            previous = address;
        }
        if (address != fh + pool_offset(fh))
            return 0;
        if (!pool_ok(fh, sites, site_count, next))
            return 0;
        /* A site with a handler or a cleanup releases a call's stack arguments, so
         * one call record must return inside it. */
        for (uint32_t s = rows_end; s < calls; s += AVEH5_SITE_SIZE) {
            if (read_flash_u24(s + 9) && !site_has_call(s, calls, call_count))
                return 0;
        }
        fh = next;
    }
    return fh == limit;
}

/* Unwinds one frame with its CFI row. The CFA is the frame base plus the row's
 * offset, and the caller's PC is the 24-bit value at CFA-3. The saved r0-r3 values
 * come from the row's slots, in register order. Returns 0 when the CFA or a slot
 * is outside the stack window or does not move toward the top of the stack. */
AVEH5_NOINLINE uint8_t unwind_frame(struct avm_eh_context *context, uint32_t row) {
    uint8_t flags = read_flash_u8(row + 2);
    uint16_t frame_base = (flags & AVEH5_FLAG_R3_BASE) ? context->r[3]
                                                        : context->sp;
    int32_t cfa = (uint16_t)(frame_base + read_flash_u16(row + 3));
    if (cfa <= context->sp || cfa > AVM_TRAP_STACK_TOP ||
        cfa < AVM_TRAP_STACK_BASE + AVEH5_RETURN_RECORD)
        return 0;
    uint32_t return_pc = read_ram_u16((uint16_t)(cfa - AVEH5_RETURN_RECORD)) |
                         ((uint32_t)read_ram_u8((uint16_t)(cfa - 1)) << 16);
    /* The slots follow the header in register order, so one pointer walks them. */
    uint32_t slot = row + AVEH5_ROW_HEADER_SIZE;
    for (uint8_t r = 0; r < 4; r++) {
        if (!((flags >> r) & 1))
            continue;
        int32_t address = cfa + (int16_t)read_flash_u16(slot);
        slot += 2;
        if (!stack_address(address) || address > AVM_TRAP_STACK_TOP - 2)
            return 0;
        context->r[r] = read_ram_u16((uint16_t)address);
    }
    context->sp = (uint16_t)cfa;
    set_context_pc(context, return_pc);
    return 1;
}

/* Writes the landing state of the pad at pad into landing, for the call that
 * returned to the frame at cursor. The call is the one at the cursor's PC in the
 * function fh. Its outgoing argument bytes are released before the pad runs, so
 * the landing SP is the frame's SP at the call plus those bytes. The dynamic
 * allocations of the frame stay in place. The SP is never derived from r3, because
 * r3 gives the frame base and not the dynamic SP. landing may be cursor itself.
 * Returns 0 when the call has no record or the SP leaves the stack window. */
AVEH5_INLINE uint8_t land_at(struct avm_eh_context *landing,
                             const struct avm_eh_context *cursor, uint32_t fh,
                             uint32_t pad) {
    uint32_t outgoing = find_call(fh, context_pc(cursor));
    if (outgoing == AVEH5_BAD)
        return 0;
    uint32_t sp = (uint32_t)cursor->sp + outgoing;
    if (sp > AVM_TRAP_STACK_TOP)
        return 0;
    *landing = *cursor;
    landing->sp = (uint16_t)sp;
    set_context_pc(landing, pad);
    return 1;
}

/* Phase one. Finds the handler for the thrown type in the header, and it runs no
 * cleanup. The walk starts at the header's resume context, which the caller has
 * set to the throw site. A frame whose site has a matching catch enters the
 * handler: the header records the matched selector and the base adjustment, and its
 * resume context becomes the landing state of the handler's pad. A frame with only a
 * cleanup, or with no action, unwinds to its caller with its CFI row. A cleanup on
 * the way marks the header AVM_EH_STATE_SEARCH_HAS_CLEANUP, and __avm_eh_throw then
 * runs phase two. With no such mark, the resume context is already the handler's
 * landing state.
 *
 * Returns 0 when no handler exists, or when a frame or record is malformed. */
uint8_t avm_eh_find_handler(struct avm_eh_exception *header) {
    struct avm_eh_context *cursor = &header->resume_context;
    for (;;) {
        if (cursor->sp < AVM_TRAP_STACK_BASE || cursor->sp >= AVM_TRAP_STACK_TOP)
            return 0;
        /* The PC is a return address, so the call instruction is one byte
         * earlier. The throw frame's continuation follows the same rule. */
        uint32_t lookup = context_pc(cursor) - 1;

        uint32_t fh = find_function(header, lookup);
        if (!fh)
            return 0;

        uint32_t row = find_row(fh, lookup);
        uint32_t site = find_site(fh, lookup);
        if (row == AVEH5_BAD || row == 0 || site == AVEH5_BAD)
            return 0;

        if (site) {
            uint32_t match = match_action(fh, site, header);
            if (match == AVEH5_BAD)
                return 0;
            if ((uint16_t)match) {
                header->handler_selector = (uint16_t)match;
                header->handler_adjustment = (uint16_t)(match >> 16);
                return land_at(cursor, cursor, fh, read_flash_u24(site + 6));
            }
            /* A cleanup passed on the way to the handler needs phase two, which
             * runs it. The marker is idempotent, so later frames leave it set. */
            if (match & AVEH5_MATCH_CLEANUP)
                header->state = AVM_EH_STATE_SEARCH_HAS_CLEANUP;
        }

        /* Unwind to the caller. The CFA must lie above the current SP, so every
         * unwind step moves toward the top of the stack. */
        if (!unwind_frame(cursor, row))
            return 0;
    }
}

/* Phase two. Prepares the next landing pad of a propagating exception, from the
 * header's resume context. Throws enter it only when phase one saw a cleanup before
 * the handler, and each _Unwind_Resume continues it. A frame whose action list matches
 * the thrown type enters the handler, and its selector and adjustment must equal the
 * ones that phase one recorded. A frame whose list has only a cleanup enters the
 * cleanup with selector zero, and its resume context moves to the caller before the
 * pad runs. The moved cursor is saved before the pad runs, so a cleanup's
 * _Unwind_Resume continues from the caller and not from the pad. Any other frame
 * unwinds without running anything.
 *
 * Phase one has already established that a handler exists, so this walk reaches the
 * same handler. Every frame passed is checked as the walk reads it, and a malformed
 * frame returns AVM_EH_STEP_INVALID with no pad installed. */
uint8_t avm_eh_prepare_next(struct avm_eh_exception *header) {
    struct avm_eh_context *cursor = &header->resume_context;
    for (;;) {
        if (cursor->sp < AVM_TRAP_STACK_BASE || cursor->sp >= AVM_TRAP_STACK_TOP)
            return AVM_EH_STEP_INVALID;
        uint32_t lookup = context_pc(cursor) - 1;

        uint32_t fh = find_function(header, lookup);
        if (!fh)
            return AVM_EH_STEP_INVALID;
        uint32_t row = find_row(fh, lookup);
        uint32_t site = find_site(fh, lookup);
        if (row == AVEH5_BAD || row == 0 || site == AVEH5_BAD)
            return AVM_EH_STEP_INVALID;

        if (site) {
            uint32_t match = match_action(fh, site, header);
            if (match == AVEH5_BAD)
                return AVM_EH_STEP_INVALID;
            uint16_t selector = (uint16_t)match;
            uint16_t adjustment = (uint16_t)(match >> 16);
            uint32_t pad = read_flash_u24(site + 6);
            if (selector) {
                if (selector != header->handler_selector ||
                    adjustment != header->handler_adjustment)
                    return AVM_EH_STEP_INVALID;
                if (!land_at(&header->context, cursor, fh, pad))
                    return AVM_EH_STEP_INVALID;
                header->context.exception = (uint16_t)(uintptr_t)header;
                return AVM_EH_STEP_CATCH;
            }
            if (match & AVEH5_MATCH_CLEANUP) {
                if (!land_at(&header->context, cursor, fh, pad))
                    return AVM_EH_STEP_INVALID;
                header->context.exception = (uint16_t)(uintptr_t)header;
                if (!unwind_frame(cursor, row))
                    return AVM_EH_STEP_INVALID;
                return AVM_EH_STEP_CLEANUP;
            }
        }

        if (!unwind_frame(cursor, row))
            return AVM_EH_STEP_INVALID;
    }
}
