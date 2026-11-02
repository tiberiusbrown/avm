/* C++ exception unwinder for typed catches, catch-all handlers, and cleanups.
 *
 * llvm-avm-image writes the AVEH4 block from the linked ELF. Its address is
 * stored in __avm_eh_metadata_ptr, a three-byte program-space anchor that the
 * packer patches. Each frame is unwound from the CFI rows in AVEH4, and every
 * frame's call sites are checked against its action lists.
 *
 * The packer validates the whole block. A throw checks each record it consumes,
 * with the same record checks that avm_eh_validate_block applies to all records.
 * A corrupt record fails the throw, and it never ends the search at a handler
 * that the record does not name.
 *
 * AVEH4 layout (little-endian, 24-bit program addresses):
 *   header:   "AVEH4" (5), u16 function_count, u24 block_size
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
 *             The entries are in clause order, so the first match wins.
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

#define AVEH4_HEADER_SIZE 10
#define AVEH4_FUNCTION_HEADER_SIZE 18
#define AVEH4_ROW_HEADER_SIZE 5
#define AVEH4_ROW_MAX_SIZE 13
#define AVEH4_SITE_SIZE 12
#define AVEH4_CALL_SIZE 5
#define AVEH4_ACTION_HEADER_SIZE 3
#define AVEH4_CATCH_SIZE 5
#define AVEH4_ACTION_CLEANUP 0x01
#define AVEH4_FLAG_R3_BASE 0x80
#define AVEH4_FLAG_RESERVED 0x70
#define AVEH4_FLAG_SAVED_MASK 0x0f
#define AVEH4_ADDRESS_LIMIT 0x1000000ul
/* Type descriptors lie above the reserved header of the program image. */
#define AVEH4_TYPE_BASE 0x100ul
/* A call's stack arguments fit in the 256-byte guest stack. */
#define AVEH4_ARGUMENT_LIMIT 256
/* A saved return record is three bytes, below the caller's CFA. */
#define AVEH4_RETURN_RECORD 3
/* Returned by the record lookups when a record is malformed. Address 0 means no
 * record, and no valid record lies at this address. */
#define AVEH4_BAD 0xfffffffful
#define AVEH4_INLINE static inline __attribute__((always_inline))
#define AVEH4_NOINLINE static __attribute__((noinline))

/* Anchor for the metadata block. The packer patches these three bytes with the
 * AVEH4 address, and zero means the block is missing. */
const uint8_t AVM_PROGMEM __avm_eh_metadata_ptr[3] = {0, 0, 0};

/* Flash reads follow trap_lookup.c. LDP24 reads a full program address, and
 * host builds read the same bytes through memcpy_P. */
#ifdef __AVM__
AVEH4_INLINE uint8_t read_flash_u8(uint32_t address) {
    return *(uint8_t const AVM_PROGMEM *)address;
}

AVEH4_INLINE uint16_t read_flash_u16(uint32_t address) {
    return *(uint16_t const AVM_PROGMEM *)address;
}

AVEH4_INLINE uint32_t read_flash_u24(uint32_t address) {
    uint32_t value;
    __asm__ volatile("ldp24 %0, [%1]" : "=q"(value) : "q"(address));
    return value;
}
#else
AVEH4_INLINE uint8_t read_flash_u8(uint32_t address) {
    uint8_t value;
    memcpy_P(&value, (uint8_t const AVM_PROGMEM *)address, 1);
    return value;
}

AVEH4_INLINE uint16_t read_flash_u16(uint32_t address) {
    uint8_t bytes[2];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 2);
    return (uint16_t)(bytes[0] | (bytes[1] << 8));
}

AVEH4_INLINE uint32_t read_flash_u24(uint32_t address) {
    uint8_t bytes[3];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 3);
    return bytes[0] | ((uint32_t)bytes[1] << 8) | ((uint32_t)bytes[2] << 16);
}
#endif

/* Stack and frame memory are data-space addresses, which fit in 16 bits. */
AVEH4_INLINE uint8_t read_ram_u8(uint16_t address) {
    return *(uint8_t *)(uintptr_t)address;
}

AVEH4_INLINE uint16_t read_ram_u16(uint16_t address) {
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

AVEH4_INLINE uint32_t context_pc(const struct avm_eh_context *context) {
    return context->pc_low | ((uint32_t)context->pc_high << 16);
}

AVEH4_INLINE void set_context_pc(struct avm_eh_context *context, uint32_t pc) {
    context->pc_low = (uint16_t)pc;
    context->pc_high = (uint8_t)(pc >> 16);
}

AVEH4_INLINE uint8_t popcount4(uint8_t mask) {
    return (uint8_t)((mask & 1) + ((mask >> 1) & 1) + ((mask >> 2) & 1) +
                     ((mask >> 3) & 1));
}

/* Record sizes times a count, by shifts and adds. A 32-bit multiply would call the
 * shared __avm_umulhisi3 helper from the search path. The empty asm makes its
 * second operand opaque, so the optimizer cannot fold the sum back into a multiply. */
AVEH4_INLINE uint32_t times5(uint32_t count) {
    uint32_t shifted = count << 2;
    __asm__("" : "+q"(count));
    return shifted + count;
}

AVEH4_INLINE uint32_t times12(uint32_t count) {
    uint32_t shifted = count << 3;
    __asm__("" : "+q"(count));
    return shifted + (count << 2);
}

AVEH4_INLINE uint32_t times13(uint32_t count) {
    uint32_t eighth = count << 3;
    __asm__("" : "+q"(count));
    uint32_t quarter = count << 2;
    __asm__("" : "+q"(count));
    return eighth + quarter + count;
}

/* Size of one row record, which depends on the number of saved registers. */
AVEH4_INLINE uint32_t row_size(uint8_t flags) {
    return AVEH4_ROW_HEADER_SIZE +
           ((uint32_t)popcount4(flags & AVEH4_FLAG_SAVED_MASK) << 1);
}

/* The first site of a function record. The sites follow the rows at sites_offset,
 * which the record's header gives directly. */
AVEH4_INLINE uint32_t sites_of(uint32_t fh) {
    return fh + read_flash_u24(fh + 12);
}

/* The first call of a function record. The calls follow the sites. */
AVEH4_INLINE uint32_t calls_of(uint32_t fh) {
    return sites_of(fh) + times12(read_flash_u16(fh + 8));
}

/* The action pool, as an offset from the function record. It follows the calls
 * and fills the rest of the record. */
AVEH4_INLINE uint32_t pool_offset(uint32_t fh) {
    return read_flash_u24(fh + 12) + times12(read_flash_u16(fh + 8)) +
           times5(read_flash_u16(fh + 10));
}

/* Opens the block. Returns its end address, or 0 when the anchor does not name
 * a well-formed AVEH4 header. */
static inline uint32_t open_block(uint32_t block) {
    if (block == 0 || block >= AVEH4_ADDRESS_LIMIT)
        return 0;
    if (read_flash_u8(block) != 'A' || read_flash_u8(block + 1) != 'V' ||
        read_flash_u8(block + 2) != 'E' || read_flash_u8(block + 3) != 'H' ||
        read_flash_u8(block + 4) != '4')
        return 0;
    uint32_t size = read_flash_u24(block + 7);
    if (size < AVEH4_HEADER_SIZE || size > AVEH4_ADDRESS_LIMIT - block)
        return 0;
    return block + size;
}

/* Decodes the header of the function record at fh and returns the address of the
 * next record, or 0 when the header is malformed or the record extends past limit.
 * The header sizes are checked here, in constant time. The rows, sites, calls, and
 * actions are checked when a lookup consumes them. */
static inline uint32_t record_next(uint32_t fh, uint32_t limit) {
    if (limit - fh < AVEH4_FUNCTION_HEADER_SIZE)
        return 0;
    uint32_t rows = read_flash_u16(fh + 6);
    uint32_t sites_offset = read_flash_u24(fh + 12);
    uint32_t next_offset = read_flash_u24(fh + 15);
    /* The rows fill the bytes from the header to sites_offset. Each row is five to
     * thirteen bytes. */
    if (rows == 0 ||
        sites_offset < AVEH4_FUNCTION_HEADER_SIZE + times5(rows) ||
        sites_offset > AVEH4_FUNCTION_HEADER_SIZE + times13(rows))
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
    if (row > rows_end || rows_end - row < AVEH4_ROW_HEADER_SIZE)
        return 0;
    uint8_t flags = read_flash_u8(row + 2);
    if (row_size(flags) > rows_end - row)
        return 0;
    uint32_t delta = read_flash_u16(row);
    if (flags & AVEH4_FLAG_RESERVED)
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
AVEH4_NOINLINE uint8_t site_ok(uint32_t fh, uint32_t site, uint32_t previous) {
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
AVEH4_INLINE uint8_t call_ok(uint32_t fh, uint32_t call, uint32_t previous) {
    uint32_t start = read_flash_u24(fh);
    uint32_t end = read_flash_u24(fh + 3);
    uint32_t return_pc = read_flash_u24(call);
    uint32_t previous_return = previous ? read_flash_u24(previous) : start;
    if (return_pc <= start || return_pc > end || return_pc <= previous_return)
        return 0;
    return read_flash_u16(call + 3) < AVEH4_ARGUMENT_LIMIT;
}

/* Returns 1 when one of the count call records from calls returns inside site.
 * The packer enforces the same rule, and the call that threw must have a record
 * whatever the site's action. */
AVEH4_NOINLINE uint8_t site_has_call(uint32_t site, uint32_t calls, uint16_t count) {
    uint32_t start = read_flash_u24(site);
    uint32_t end = read_flash_u24(site + 3);
    for (uint16_t c = 0; c < count; c++) {
        uint32_t pc = read_flash_u24(calls + times5(c));
        if (pc > start && pc <= end)
            return 1;
    }
    return 0;
}

/* Returns the function record that covers lookup. Returns 0 when no record does,
 * which includes a gap between records and a lookup past the last record. Each
 * record that the walk passes is checked. The walk reads at most function_count
 * records, and it fails at the block end if a record is missing. */
AVEH4_NOINLINE uint32_t find_function(uint32_t lookup) {
    uint32_t block = read_flash_u24((uint32_t)__avm_eh_metadata_ptr);
    uint32_t limit = open_block(block);
    if (!limit)
        return 0;
    uint32_t fh = block + AVEH4_HEADER_SIZE;
    uint32_t previous_end = 0;
    for (uint16_t f = read_flash_u16(block + 5); f > 0; f--) {
        uint32_t next = record_next(fh, limit);
        if (!next)
            return 0;
        uint32_t start = read_flash_u24(fh);
        uint32_t end = read_flash_u24(fh + 3);
        if (start >= end || start < previous_end || lookup < start)
            return 0;
        if (lookup < end)
            return fh;
        previous_end = end;
        fh = next;
    }
    return 0;
}

/* Returns the row that covers lookup, which is the last row that starts at or
 * before it, or AVEH4_BAD when a row that the walk reads is malformed. The rows lie
 * between the header and sites_offset, and each row must fit there. The walk stops
 * at the first row past lookup, so later rows are not read. */
AVEH4_NOINLINE uint32_t find_row(uint32_t fh, uint32_t lookup) {
    /* found is the covering row so far, and it is the predecessor of the next row.
     * It is 0 before the first row. The next row follows it directly, so no separate
     * cursor is kept. */
    uint32_t found = 0;
    for (uint16_t r = 0, count = read_flash_u16(fh + 6); r < count; r++) {
        uint32_t address = found ? found + row_size(read_flash_u8(found + 2))
                                 : fh + AVEH4_FUNCTION_HEADER_SIZE;
        if (!row_ok(fh, address, found))
            return AVEH4_BAD;
        if (read_flash_u24(fh) + read_flash_u16(address) > lookup)
            break;
        found = address;
    }
    return found;
}

/* Returns the site record that covers lookup, 0 when no record does (a gap between
 * records has no handler), or AVEH4_BAD when a site the scan reads is malformed.
 * The sites are sorted, so the scan stops at the first site past lookup. */
AVEH4_NOINLINE uint32_t find_site(uint32_t fh, uint32_t lookup) {
    uint32_t address = sites_of(fh);
    for (uint16_t s = 0, count = read_flash_u16(fh + 8); s < count;
         s++, address += AVEH4_SITE_SIZE) {
        if (!site_ok(fh, address, s ? address - AVEH4_SITE_SIZE : 0))
            return AVEH4_BAD;
        if (lookup < read_flash_u24(address))
            return 0;
        if (lookup < read_flash_u24(address + 3))
            return address;
    }
    return 0;
}

/* Returns the outgoing argument bytes of the call whose return PC is return_pc. A
 * site with a handler or cleanup needs this record, so a missing or malformed one
 * returns AVEH4_BAD and fails the throw. The calls follow the sites directly. */
AVEH4_NOINLINE uint32_t find_call(uint32_t fh, uint32_t return_pc) {
    uint32_t address = calls_of(fh);
    for (uint16_t c = 0, count = read_flash_u16(fh + 10); c < count;
         c++, address += AVEH4_CALL_SIZE) {
        if (!call_ok(fh, address, c ? address - AVEH4_CALL_SIZE : 0))
            return AVEH4_BAD;
        uint32_t pc = read_flash_u24(address);
        if (pc == return_pc)
            return read_flash_u16(address + 3);
        if (pc > return_pc)
            return AVEH4_BAD;
    }
    return AVEH4_BAD;
}

/* Evaluates the action list at list for thrown_type. The list lies in the pool of
 * the function at fh, and the whole list is checked: its flags, catch count, and
 * entries must lie inside the record, the flags may set only the cleanup bit, each
 * selector is nonzero and distinct, and a catch-all is last. Returns AVEH4_BAD when
 * the list is malformed. Otherwise it returns the selector of the first entry that
 * matches, which is zero when none does. A valid list that matches nothing is not an
 * error, and the cleanup flag is read from the list by the caller that needs it. */
AVEH4_NOINLINE uint32_t match_list(uint32_t fh, uint32_t list, uint32_t thrown_type) {
    uint32_t end = fh + read_flash_u24(fh + 15);
    if (list < fh + pool_offset(fh) || list > end || end - list < AVEH4_ACTION_HEADER_SIZE)
        return AVEH4_BAD;
    uint8_t flags = read_flash_u8(list);
    uint16_t count = read_flash_u16(list + 1);
    if ((flags & ~AVEH4_ACTION_CLEANUP) || (flags == 0 && count == 0))
        return AVEH4_BAD;
    if (end - list - AVEH4_ACTION_HEADER_SIZE < times5(count))
        return AVEH4_BAD;
    uint32_t selected = 0;
    uint32_t entry = list + AVEH4_ACTION_HEADER_SIZE;
    uint32_t stop = entry + times5(count);
    for (; entry != stop; entry += AVEH4_CATCH_SIZE) {
        uint16_t selector = read_flash_u16(entry);
        uint32_t type = read_flash_u24(entry + 2);
        if (selector == 0 || (type == 0 && entry + AVEH4_CATCH_SIZE != stop))
            return AVEH4_BAD;
        if (type != 0 && type < AVEH4_TYPE_BASE)
            return AVEH4_BAD;
        for (uint32_t prior = list + AVEH4_ACTION_HEADER_SIZE; prior != entry;
             prior += AVEH4_CATCH_SIZE)
            if (read_flash_u16(prior) == selector)
                return AVEH4_BAD;
        /* The first match wins, and the later entries are still validated above. */
        if (!selected && (type == 0 || type == thrown_type))
            selected = selector;
    }
    return selected;
}

/* The selector of the site's action for thrown_type. A site with no action selects
 * nothing, which is zero, and otherwise the action is the list that match_list
 * checks. Inlined into its callers, so the matcher adds no frame of its own. */
AVEH4_INLINE uint32_t match_action(uint32_t fh, uint32_t site, uint32_t thrown_type) {
    uint32_t action = read_flash_u24(site + 9);
    return action ? match_list(fh, fh + action, thrown_type) : 0;
}

/* True when the site's action has the cleanup flag. A site with no action has none. */
AVEH4_INLINE uint8_t action_has_cleanup(uint32_t fh, uint32_t site) {
    uint32_t action = read_flash_u24(site + 9);
    return action && (read_flash_u8(fh + action) & AVEH4_ACTION_CLEANUP);
}

/* The thrown type is the 24-bit descriptor address that the throw shim stored. */
AVEH4_INLINE uint32_t thrown_type_of(const struct avm_eh_exception *header) {
    return header->type_address[0] | ((uint32_t)header->type_address[1] << 8) |
           ((uint32_t)header->type_address[2] << 16);
}

/* True when a stack address lies in the guest stack window. */
AVEH4_INLINE uint8_t stack_address(int32_t address) {
    return address >= AVM_TRAP_STACK_BASE && address < AVM_TRAP_STACK_TOP;
}

/* Returns 1 when some site of the function names the action list at the function
 * offset action. The validator uses it, so every list must be used. */
AVEH4_NOINLINE uint8_t list_named(uint32_t sites, uint16_t site_count, uint32_t action) {
    for (uint16_t s = 0; s < site_count; s++)
        if (read_flash_u24(sites + times12(s) + 9) == action)
            return 1;
    return 0;
}

/* Checks the action pool of the function at fh, from its start to next. Every list
 * must be complete and valid, every list must be used by a site, every site's
 * action must name the start of a list, and the lists must end at next. */
AVEH4_NOINLINE uint8_t pool_ok(uint32_t fh, uint32_t sites, uint16_t site_count,
                               uint32_t next) {
    uint32_t list = fh + pool_offset(fh);
    while (list < next) {
        if (match_list(fh, list, 0) == AVEH4_BAD)
            return 0;
        if (!list_named(sites, site_count, list - fh))
            return 0;
        list += AVEH4_ACTION_HEADER_SIZE + times5(read_flash_u16(list + 1));
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
            start += AVEH4_ACTION_HEADER_SIZE + times5(read_flash_u16(start + 1));
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
    uint32_t fh = block + AVEH4_HEADER_SIZE;
    uint32_t previous_end = 0;
    for (uint16_t f = 0; f < count; f++) {
        uint32_t next = record_next(fh, limit);
        if (!next)
            return 0;
        uint32_t start = read_flash_u24(fh);
        uint32_t end = read_flash_u24(fh + 3);
        if (start >= end || start < previous_end)
            return 0;
        previous_end = end;

        uint16_t row_count = read_flash_u16(fh + 6);
        uint16_t site_count = read_flash_u16(fh + 8);
        uint16_t call_count = read_flash_u16(fh + 10);
        uint32_t rows_end = sites_of(fh);
        uint32_t address = fh + AVEH4_FUNCTION_HEADER_SIZE;
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
        for (uint16_t s = 0; s < site_count; s++, address += AVEH4_SITE_SIZE) {
            if (!site_ok(fh, address, previous))
                return 0;
            previous = address;
        }
        uint32_t calls = address;
        previous = 0;
        for (uint16_t c = 0; c < call_count; c++, address += AVEH4_CALL_SIZE) {
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
        for (uint32_t s = rows_end; s < calls; s += AVEH4_SITE_SIZE) {
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
AVEH4_NOINLINE uint8_t unwind_frame(struct avm_eh_context *context, uint32_t row) {
    uint8_t flags = read_flash_u8(row + 2);
    uint16_t frame_base = (flags & AVEH4_FLAG_R3_BASE) ? context->r[3]
                                                        : context->sp;
    int32_t cfa = (uint16_t)(frame_base + read_flash_u16(row + 3));
    if (cfa <= context->sp || cfa > AVM_TRAP_STACK_TOP ||
        cfa < AVM_TRAP_STACK_BASE + AVEH4_RETURN_RECORD)
        return 0;
    uint32_t return_pc = read_ram_u16((uint16_t)(cfa - AVEH4_RETURN_RECORD)) |
                         ((uint32_t)read_ram_u8((uint16_t)(cfa - 1)) << 16);
    /* The slots follow the header in register order, so one pointer walks them. */
    uint32_t slot = row + AVEH4_ROW_HEADER_SIZE;
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
AVEH4_INLINE uint8_t land_at(struct avm_eh_context *landing,
                             const struct avm_eh_context *cursor, uint32_t fh,
                             uint32_t pad) {
    uint32_t outgoing = find_call(fh, context_pc(cursor));
    if (outgoing == AVEH4_BAD)
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
 * handler: the header records the matched selector, and its resume context becomes
 * the landing state of the handler's pad. Any other frame, including a frame with
 * only a cleanup, unwinds to its caller with its CFI row.
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

        uint32_t fh = find_function(lookup);
        if (!fh)
            return 0;

        uint32_t row = find_row(fh, lookup);
        uint32_t site = find_site(fh, lookup);
        if (row == AVEH4_BAD || row == 0 || site == AVEH4_BAD)
            return 0;

        if (site) {
            uint32_t selector = match_action(fh, site, thrown_type_of(header));
            if (selector == AVEH4_BAD)
                return 0;
            if (selector) {
                header->handler_selector = (uint16_t)selector;
                return land_at(cursor, cursor, fh, read_flash_u24(site + 6));
            }
        }

        /* Unwind to the caller. The CFA must lie above the current SP, so every
         * unwind step moves toward the top of the stack. */
        if (!unwind_frame(cursor, row))
            return 0;
    }
}

/* Phase two. Prepares the next landing pad of a propagating exception, from the
 * header's resume context. A frame whose action list matches the thrown type enters
 * the handler, and its selector must equal the one that phase one recorded. A frame
 * whose list has only a cleanup enters the cleanup with selector zero, and its
 * resume context moves to the caller before the pad runs. The moved cursor is saved
 * before the pad runs, so a cleanup's _Unwind_Resume continues from the caller and
 * not from the pad. Any other frame unwinds without running anything.
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

        uint32_t fh = find_function(lookup);
        if (!fh)
            return AVM_EH_STEP_INVALID;
        uint32_t row = find_row(fh, lookup);
        uint32_t site = find_site(fh, lookup);
        if (row == AVEH4_BAD || row == 0 || site == AVEH4_BAD)
            return AVM_EH_STEP_INVALID;

        if (site) {
            uint32_t selector = match_action(fh, site, thrown_type_of(header));
            if (selector == AVEH4_BAD)
                return AVM_EH_STEP_INVALID;
            uint32_t pad = read_flash_u24(site + 6);
            if (selector) {
                if (selector != header->handler_selector)
                    return AVM_EH_STEP_INVALID;
                if (!land_at(&header->context, cursor, fh, pad))
                    return AVM_EH_STEP_INVALID;
                header->context.exception = (uint16_t)(uintptr_t)header;
                return AVM_EH_STEP_CATCH;
            }
            if (action_has_cleanup(fh, site)) {
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
