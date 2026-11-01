/* Stage 1 C++ exception unwinder for catch-all handlers.
 *
 * llvm-avm-image writes the AVEH3 block from the linked ELF. Its address is
 * stored in __avm_eh_metadata_ptr, a three-byte program-space anchor that the
 * packer patches. Each frame is unwound from the CFI rows in AVEH3, and every
 * frame's call sites are checked against its catch-all records.
 *
 * The packer validates the whole block. A throw checks each record it consumes,
 * with the same record checks that avm_eh_validate_block applies to all records.
 * A corrupt record fails the throw, and it never ends the search at a handler
 * that the record does not name.
 *
 * AVEH3 layout (little-endian, 24-bit program addresses):
 *   header:   "AVEH3" (5), u16 function_count, u24 block_size
 *   function: u24 start, u24 end, u16 row_count, u16 site_count,
 *             u16 call_count, u24 sites_offset, u24 next_offset,
 *             row_count rows, site_count sites, call_count calls
 *   row:      u16 pc_delta from start (0 for the first row), u8 flags,
 *             i16 cfa_offset, then one i16 slot for each saved register.
 *             flags bit 7: CFA base is r3 (else SP). Bits 3:0: saved r0-r3.
 *             Bits 6:4 are reserved and must be zero.
 *   site:     u24 start, u24 end, u24 landing pad, u8 action
 *             action 0: no handler, landing pad 0
 *             action 1: catch-all handler, landing pad inside the function
 *   call:     u24 return PC, u16 outgoing argument bytes. The return PC is the
 *             address after the call instruction, which is the saved return PC
 *             of the callee's frame. The bytes are the stack arguments that the
 *             call left on the stack.
 *
 * sites_offset and next_offset are measured from the start of their function
 * record. The rows fill the bytes from the header to sites_offset, the sites
 * follow, then the calls, and next_offset is the start of the next record. A
 * lookup therefore reaches the sites and calls without reading any row.
 *
 * The record walks and the site and call checks are kept out of line, so each
 * frame holds only its own live values. The header and row checks are inlined,
 * which keeps their walks smaller. */

#include <avm/pgmspace.h>
#include <avm/trap.h>
#include <string.h>

#include "eh_unwind_internal.h"

#define AVEH3_HEADER_SIZE 10
#define AVEH3_FUNCTION_HEADER_SIZE 18
#define AVEH3_ROW_HEADER_SIZE 5
#define AVEH3_ROW_MAX_SIZE 13
#define AVEH3_SITE_SIZE 10
#define AVEH3_CALL_SIZE 5
#define AVEH3_ACTION_NONE 0
#define AVEH3_ACTION_CATCH_ALL 1
#define AVEH3_FLAG_R3_BASE 0x80
#define AVEH3_FLAG_RESERVED 0x70
#define AVEH3_FLAG_SAVED_MASK 0x0f
#define AVEH3_ADDRESS_LIMIT 0x1000000ul
/* A call's stack arguments fit in the 256-byte guest stack. */
#define AVEH3_ARGUMENT_LIMIT 256
/* A saved return record is three bytes, below the caller's CFA. */
#define AVEH3_RETURN_RECORD 3
/* Returned by the record lookups when a record is malformed. Address 0 means no
 * record, and no valid record lies at this address. */
#define AVEH3_BAD 0xfffffffful
#define AVEH3_INLINE static inline __attribute__((always_inline))
#define AVEH3_NOINLINE static __attribute__((noinline))

/* Anchor for the metadata block. The packer patches these three bytes with the
 * AVEH3 address, and zero means the block is missing. */
const uint8_t AVM_PROGMEM __avm_eh_metadata_ptr[3] = {0, 0, 0};

/* Flash reads follow trap_lookup.c. LDP24 reads a full program address, and
 * host builds read the same bytes through memcpy_P. */
#ifdef __AVM__
AVEH3_INLINE uint8_t read_flash_u8(uint32_t address) {
    return *(uint8_t const AVM_PROGMEM *)address;
}

AVEH3_INLINE uint16_t read_flash_u16(uint32_t address) {
    return *(uint16_t const AVM_PROGMEM *)address;
}

AVEH3_INLINE uint32_t read_flash_u24(uint32_t address) {
    uint32_t value;
    __asm__ volatile("ldp24 %0, [%1]" : "=q"(value) : "q"(address));
    return value;
}
#else
AVEH3_INLINE uint8_t read_flash_u8(uint32_t address) {
    uint8_t value;
    memcpy_P(&value, (uint8_t const AVM_PROGMEM *)address, 1);
    return value;
}

AVEH3_INLINE uint16_t read_flash_u16(uint32_t address) {
    uint8_t bytes[2];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 2);
    return (uint16_t)(bytes[0] | (bytes[1] << 8));
}

AVEH3_INLINE uint32_t read_flash_u24(uint32_t address) {
    uint8_t bytes[3];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 3);
    return bytes[0] | ((uint32_t)bytes[1] << 8) | ((uint32_t)bytes[2] << 16);
}
#endif

/* Stack and frame memory are data-space addresses, which fit in 16 bits. */
AVEH3_INLINE uint8_t read_ram_u8(uint16_t address) {
    return *(uint8_t *)(uintptr_t)address;
}

AVEH3_INLINE uint16_t read_ram_u16(uint16_t address) {
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

AVEH3_INLINE uint32_t context_pc(const struct avm_eh_context *context) {
    return context->pc_low | ((uint32_t)context->pc_high << 16);
}

AVEH3_INLINE void set_context_pc(struct avm_eh_context *context, uint32_t pc) {
    context->pc_low = (uint16_t)pc;
    context->pc_high = (uint8_t)(pc >> 16);
}

AVEH3_INLINE uint8_t popcount4(uint8_t mask) {
    return (uint8_t)((mask & 1) + ((mask >> 1) & 1) + ((mask >> 2) & 1) +
                     ((mask >> 3) & 1));
}

/* Record sizes times a count, by shifts and adds. A 32-bit multiply would call the
 * shared __avm_umulhisi3 helper from the search path. The empty asm makes its
 * second operand opaque, so the optimizer cannot fold the sum back into a multiply. */
AVEH3_INLINE uint32_t times5(uint32_t count) {
    uint32_t shifted = count << 2;
    __asm__("" : "+q"(count));
    return shifted + count;
}

AVEH3_INLINE uint32_t times10(uint32_t count) {
    uint32_t shifted = count << 3;
    __asm__("" : "+q"(count));
    return shifted + (count << 1);
}

AVEH3_INLINE uint32_t times13(uint32_t count) {
    uint32_t eighth = count << 3;
    __asm__("" : "+q"(count));
    uint32_t quarter = count << 2;
    __asm__("" : "+q"(count));
    return eighth + quarter + count;
}

/* Size of one row record, which depends on the number of saved registers. */
AVEH3_INLINE uint32_t row_size(uint8_t flags) {
    return AVEH3_ROW_HEADER_SIZE +
           ((uint32_t)popcount4(flags & AVEH3_FLAG_SAVED_MASK) << 1);
}

/* The first site of a function record. The sites follow the rows at sites_offset,
 * which the record's header gives directly. */
AVEH3_INLINE uint32_t sites_of(uint32_t fh) {
    return fh + read_flash_u24(fh + 12);
}

/* Opens the block. Returns its end address, or 0 when the anchor does not name
 * a well-formed AVEH3 header. */
static inline uint32_t open_block(uint32_t block) {
    if (block == 0 || block >= AVEH3_ADDRESS_LIMIT)
        return 0;
    if (read_flash_u8(block) != 'A' || read_flash_u8(block + 1) != 'V' ||
        read_flash_u8(block + 2) != 'E' || read_flash_u8(block + 3) != 'H' ||
        read_flash_u8(block + 4) != '3')
        return 0;
    uint32_t size = read_flash_u24(block + 7);
    if (size < AVEH3_HEADER_SIZE || size > AVEH3_ADDRESS_LIMIT - block)
        return 0;
    return block + size;
}

/* Decodes the header of the function record at fh and returns the address of the
 * next record, or 0 when the header is malformed or the record extends past limit.
 * The header sizes are checked here, in constant time. The rows, sites, and calls
 * are checked when a lookup consumes them. */
static inline uint32_t record_next(uint32_t fh, uint32_t limit) {
    if (limit - fh < AVEH3_FUNCTION_HEADER_SIZE)
        return 0;
    uint32_t rows = read_flash_u16(fh + 6);
    uint32_t sites_offset = read_flash_u24(fh + 12);
    uint32_t next_offset = read_flash_u24(fh + 15);
    /* The rows fill the bytes from the header to sites_offset. Each row is five to
     * thirteen bytes. */
    if (rows == 0 ||
        sites_offset < AVEH3_FUNCTION_HEADER_SIZE + times5(rows) ||
        sites_offset > AVEH3_FUNCTION_HEADER_SIZE + times13(rows))
        return 0;
    /* The sites and calls fill the rest of the record, which ends at next_offset. */
    if (next_offset < sites_offset ||
        next_offset - sites_offset !=
            times10(read_flash_u16(fh + 8)) + times5(read_flash_u16(fh + 10)))
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
    if (row > rows_end || rows_end - row < AVEH3_ROW_HEADER_SIZE)
        return 0;
    uint8_t flags = read_flash_u8(row + 2);
    if (row_size(flags) > rows_end - row)
        return 0;
    uint32_t delta = read_flash_u16(row);
    if (flags & AVEH3_FLAG_RESERVED)
        return 0;
    if (previous ? delta <= read_flash_u16(previous) : delta != 0)
        return 0;
    return read_flash_u24(fh) + delta < read_flash_u24(fh + 3);
}

/* One site. Sites are ordered and lie inside the function. A catch-all landing
 * pad lies inside the function, and a site without a handler has no pad. */
AVEH3_NOINLINE uint8_t site_ok(uint32_t fh, uint32_t site, uint32_t previous) {
    uint32_t previous_end = previous ? read_flash_u24(previous + 3) : read_flash_u24(fh);
    if (read_flash_u24(site) >= read_flash_u24(site + 3) ||
        read_flash_u24(site) < previous_end || read_flash_u24(site + 3) > read_flash_u24(fh + 3))
        return 0;
    uint8_t action = read_flash_u8(site + 9);
    if (action == AVEH3_ACTION_NONE)
        return read_flash_u24(site + 6) == 0;
    if (action == AVEH3_ACTION_CATCH_ALL)
        return read_flash_u24(site + 6) >= read_flash_u24(fh) &&
               read_flash_u24(site + 6) < read_flash_u24(fh + 3);
    return 0;
}

/* One call. Return PCs strictly increase inside (start, end], and the stack
 * arguments fit in the guest stack. */
AVEH3_NOINLINE uint8_t call_ok(uint32_t fh, uint32_t call, uint32_t previous) {
    uint32_t start = read_flash_u24(fh);
    uint32_t end = read_flash_u24(fh + 3);
    uint32_t return_pc = read_flash_u24(call);
    uint32_t previous_return = previous ? read_flash_u24(previous) : start;
    if (return_pc <= start || return_pc > end || return_pc <= previous_return)
        return 0;
    return read_flash_u16(call + 3) < AVEH3_ARGUMENT_LIMIT;
}

/* Returns the function record that covers lookup. Returns 0 when no record does,
 * which includes a gap between records and a lookup past the last record. Each
 * record that the walk passes is checked. The walk reads at most function_count
 * records, and it fails at the block end if a record is missing. */
AVEH3_NOINLINE uint32_t find_function(uint32_t lookup) {
    uint32_t block = read_flash_u24((uint32_t)__avm_eh_metadata_ptr);
    uint32_t limit = open_block(block);
    if (!limit)
        return 0;
    uint32_t fh = block + AVEH3_HEADER_SIZE;
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
 * before it, or AVEH3_BAD when a row that the walk reads is malformed. The rows
 * lie between the header and sites_offset, and each row must fit there. The walk
 * stops at the first row past lookup, so later rows are not read. */
AVEH3_NOINLINE uint32_t find_row(uint32_t fh, uint32_t lookup) {
    /* found is the covering row so far, and it is the predecessor of the next row.
     * It is 0 before the first row. The next row follows it directly, so no separate
     * cursor is kept. */
    uint32_t found = 0;
    for (uint16_t r = 0, count = read_flash_u16(fh + 6); r < count; r++) {
        uint32_t address = found ? found + row_size(read_flash_u8(found + 2))
                                 : fh + AVEH3_FUNCTION_HEADER_SIZE;
        if (!row_ok(fh, address, found))
            return AVEH3_BAD;
        if (read_flash_u24(fh) + read_flash_u16(address) > lookup)
            break;
        found = address;
    }
    return found;
}

/* Returns the site record that covers lookup, 0 when no record does (a gap between
 * records has no handler), or AVEH3_BAD when a site the scan reads is malformed.
 * The sites are sorted, so the scan stops at the first site past lookup. */
AVEH3_NOINLINE uint32_t find_site(uint32_t fh, uint32_t lookup) {
    uint32_t address = sites_of(fh);
    for (uint16_t s = 0, count = read_flash_u16(fh + 8); s < count;
         s++, address += AVEH3_SITE_SIZE) {
        if (!site_ok(fh, address, s ? address - AVEH3_SITE_SIZE : 0))
            return AVEH3_BAD;
        if (lookup < read_flash_u24(address))
            return 0;
        if (lookup < read_flash_u24(address + 3))
            return address;
    }
    return 0;
}

/* Returns the outgoing argument bytes of the call whose return PC is return_pc. A
 * catch-all site needs this record, so a missing or malformed one returns
 * AVEH3_BAD and fails the throw. The calls follow the sites directly, at
 * sites_offset plus ten bytes per site. */
AVEH3_NOINLINE uint32_t find_call(uint32_t fh, uint32_t return_pc) {
    uint32_t address = sites_of(fh) + times10(read_flash_u16(fh + 8));
    for (uint16_t c = 0, count = read_flash_u16(fh + 10); c < count;
         c++, address += AVEH3_CALL_SIZE) {
        if (!call_ok(fh, address, c ? address - AVEH3_CALL_SIZE : 0))
            return AVEH3_BAD;
        uint32_t pc = read_flash_u24(address);
        if (pc == return_pc)
            return read_flash_u16(address + 3);
        if (pc > return_pc)
            return AVEH3_BAD;
    }
    return AVEH3_BAD;
}

/* True when a stack address lies in the guest stack window. */
AVEH3_INLINE uint8_t stack_address(int32_t address) {
    return address >= AVM_TRAP_STACK_BASE && address < AVM_TRAP_STACK_TOP;
}

/* Checks the whole block. It applies the record checks above to every record, so
 * it is the complete form of the checks that a throw applies as it consumes
 * records. Throws do not call it. Each record must also end exactly where its rows,
 * sites, and calls end, and the last record must end at the block end. */
uint8_t avm_eh_validate_block(uint32_t block) {
    uint32_t limit = open_block(block);
    if (!limit)
        return 0;
    uint16_t count = read_flash_u16(block + 5);
    uint32_t fh = block + AVEH3_HEADER_SIZE;
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
        uint32_t address = fh + AVEH3_FUNCTION_HEADER_SIZE;
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
        for (uint16_t s = 0; s < site_count; s++, address += AVEH3_SITE_SIZE) {
            if (!site_ok(fh, address, previous))
                return 0;
            previous = address;
        }
        previous = 0;
        for (uint16_t c = 0; c < call_count; c++, address += AVEH3_CALL_SIZE) {
            if (!call_ok(fh, address, previous))
                return 0;
            previous = address;
        }
        if (address != next)
            return 0;
        fh = next;
    }
    return fh == limit;
}

/* Unwinds one frame with its CFI row. The CFA is the frame base plus the row's
 * offset, and the caller's PC is the 24-bit value at CFA-3. The saved r0-r3 values
 * come from the row's slots, in register order. Returns 0 when the CFA or a slot
 * is outside the stack window or does not move toward the top of the stack. */
AVEH3_NOINLINE uint8_t unwind_frame(struct avm_eh_context *context, uint32_t row) {
    uint8_t flags = read_flash_u8(row + 2);
    uint16_t frame_base = (flags & AVEH3_FLAG_R3_BASE) ? context->r[3]
                                                        : context->sp;
    int32_t cfa = (uint16_t)(frame_base + read_flash_u16(row + 3));
    if (cfa <= context->sp || cfa > AVM_TRAP_STACK_TOP ||
        cfa < AVM_TRAP_STACK_BASE + AVEH3_RETURN_RECORD)
        return 0;
    uint32_t return_pc = read_ram_u16((uint16_t)(cfa - AVEH3_RETURN_RECORD)) |
                         ((uint32_t)read_ram_u8((uint16_t)(cfa - 1)) << 16);
    /* The slots follow the header in register order, so one pointer walks them. */
    uint32_t slot = row + AVEH3_ROW_HEADER_SIZE;
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

/* Finds a catch-all handler for the exception that is being thrown.
 *
 * On entry, *context is the state of the frame that executed the throw: its
 * continuation PC, its SP, and its r0-r3. The walk changes *context only while it
 * unwinds, and it fails without a handler. Each step looks up the call site at
 * PC-1 in the current frame. A catch-all site enters the handler. Any other frame
 * unwinds to its caller with its CFI row.
 *
 * The landing SP is the frame's SP at the call plus the call's outgoing argument
 * bytes. The landing pad expects the stack with those bytes released, and the
 * dynamic allocations of the frame stay in place. The SP is never derived from
 * r3, because r3 gives the frame base and not the dynamic SP.
 *
 * Returns 0 when no handler exists, or when a frame or record is malformed. */
uint8_t avm_eh_find_handler(struct avm_eh_context *context) {
    for (;;) {
        if (context->sp < AVM_TRAP_STACK_BASE || context->sp >= AVM_TRAP_STACK_TOP)
            return 0;
        /* The PC is a return address, so the call instruction is one byte
         * earlier. The throw frame's continuation follows the same rule. */
        uint32_t lookup = context_pc(context) - 1;

        uint32_t fh = find_function(lookup);
        if (!fh)
            return 0;

        uint32_t row = find_row(fh, lookup);
        uint32_t site = find_site(fh, lookup);
        if (row == AVEH3_BAD || row == 0 || site == AVEH3_BAD)
            return 0;

        if (site && read_flash_u8(site + 9) == AVEH3_ACTION_CATCH_ALL) {
            uint32_t outgoing = find_call(fh, context_pc(context));
            if (outgoing == AVEH3_BAD)
                return 0;
            uint32_t sp = (uint32_t)context->sp + outgoing;
            if (sp > AVM_TRAP_STACK_TOP)
                return 0;
            context->sp = (uint16_t)sp;
            set_context_pc(context, read_flash_u24(site + 6));
            return 1;
        }

        /* Unwind to the caller. The CFA must lie above the current SP, so every
         * unwind step moves toward the top of the stack. */
        if (!unwind_frame(context, row))
            return 0;
    }
}
