/* Stage 1 C++ exception unwinder for catch-all handlers.
 *
 * llvm-avm-image writes the AVEH2 block from the linked ELF. Its address is
 * stored in __avm_eh_metadata_ptr, a three-byte program-space anchor that the
 * packer patches. Each frame is unwound from the CFI rows in AVEH2, and every
 * frame's call sites are checked against its catch-all records.
 *
 * The packer validates the whole block. A throw checks each record it consumes,
 * with the same record checks that avm_eh_validate_block applies to all records.
 * A corrupt record fails the throw, and it never ends the search at a handler
 * that the record does not name.
 *
 * AVEH2 layout (little-endian, 24-bit program addresses):
 *   header:   "AVEH2" (5), u16 function_count, u24 block_size
 *   function: u24 start, u24 end, u16 row_count, u16 site_count,
 *             u16 call_count, row_count rows, site_count sites, call_count calls
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
 * The throw path is one function. Every helper here is always_inline, so the
 * search runs in a single frame. A separate call would add a return record and
 * a register save at each level, which the 256-byte guest stack cannot spare. */

#include <avm/pgmspace.h>
#include <avm/trap.h>
#include <string.h>

#include "eh_unwind_internal.h"

#define AVEH2_HEADER_SIZE 10
#define AVEH2_FUNCTION_HEADER_SIZE 12
#define AVEH2_ROW_HEADER_SIZE 5
#define AVEH2_SITE_SIZE 10
#define AVEH2_CALL_SIZE 5
#define AVEH2_ACTION_NONE 0
#define AVEH2_ACTION_CATCH_ALL 1
#define AVEH2_FLAG_R3_BASE 0x80
#define AVEH2_FLAG_RESERVED 0x70
#define AVEH2_FLAG_SAVED_MASK 0x0f
#define AVEH2_ADDRESS_LIMIT 0x1000000ul
/* A call's stack arguments fit in the 256-byte guest stack. */
#define AVEH2_ARGUMENT_LIMIT 256
/* A saved return record is three bytes, below the caller's CFA. */
#define AVEH2_RETURN_RECORD 3
/* Returned by the record lookups when a record is malformed. Address 0 means no
 * record, and no valid record lies at this address. */
#define AVEH2_BAD 0xfffffffful
#define AVEH2_INLINE static inline __attribute__((always_inline))

/* Anchor for the metadata block. The packer patches these three bytes with the
 * AVEH2 address, and zero means the block is missing. */
const uint8_t AVM_PROGMEM __avm_eh_metadata_ptr[3] = {0, 0, 0};

/* Flash reads follow trap_lookup.c. LDP24 reads a full program address, and
 * host builds read the same bytes through memcpy_P. */
#ifdef __AVM__
AVEH2_INLINE uint8_t read_flash_u8(uint32_t address) {
    return *(uint8_t const AVM_PROGMEM *)address;
}

AVEH2_INLINE uint16_t read_flash_u16(uint32_t address) {
    return *(uint16_t const AVM_PROGMEM *)address;
}

AVEH2_INLINE uint32_t read_flash_u24(uint32_t address) {
    uint32_t value;
    __asm__ volatile("ldp24 %0, [%1]" : "=q"(value) : "q"(address));
    return value;
}
#else
AVEH2_INLINE uint8_t read_flash_u8(uint32_t address) {
    uint8_t value;
    memcpy_P(&value, (uint8_t const AVM_PROGMEM *)address, 1);
    return value;
}

AVEH2_INLINE uint16_t read_flash_u16(uint32_t address) {
    uint8_t bytes[2];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 2);
    return (uint16_t)(bytes[0] | (bytes[1] << 8));
}

AVEH2_INLINE uint32_t read_flash_u24(uint32_t address) {
    uint8_t bytes[3];
    memcpy_P(bytes, (uint8_t const AVM_PROGMEM *)address, 3);
    return bytes[0] | ((uint32_t)bytes[1] << 8) | ((uint32_t)bytes[2] << 16);
}
#endif

/* Stack and frame memory are data-space addresses, which fit in 16 bits. */
AVEH2_INLINE uint8_t read_ram_u8(uint16_t address) {
    return *(uint8_t *)(uintptr_t)address;
}

AVEH2_INLINE uint16_t read_ram_u16(uint16_t address) {
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

AVEH2_INLINE uint32_t context_pc(const struct avm_eh_context *context) {
    return context->pc_low | ((uint32_t)context->pc_high << 16);
}

AVEH2_INLINE void set_context_pc(struct avm_eh_context *context, uint32_t pc) {
    context->pc_low = (uint16_t)pc;
    context->pc_high = (uint8_t)(pc >> 16);
}

AVEH2_INLINE uint8_t popcount4(uint8_t mask) {
    return (uint8_t)((mask & 1) + ((mask >> 1) & 1) + ((mask >> 2) & 1) +
                     ((mask >> 3) & 1));
}

/* Size of one row record, which depends on the number of saved registers. */
AVEH2_INLINE uint32_t row_size(uint8_t mask) {
    return AVEH2_ROW_HEADER_SIZE + ((uint32_t)popcount4(mask) << 1);
}

/* Bytes in count site records, and in count call records. A 16-bit count times a
 * constant size is one multiply. */
AVEH2_INLINE uint32_t site_bytes(uint16_t count) {
    return (uint32_t)count * AVEH2_SITE_SIZE;
}

AVEH2_INLINE uint32_t call_bytes(uint16_t count) {
    return (uint32_t)count * AVEH2_CALL_SIZE;
}

/* Opens the block. Returns its end address, or 0 when the anchor does not name
 * a well-formed AVEH2 header. */
AVEH2_INLINE uint32_t open_block(uint32_t block) {
    if (block == 0 || block >= AVEH2_ADDRESS_LIMIT)
        return 0;
    if (read_flash_u8(block) != 'A' || read_flash_u8(block + 1) != 'V' ||
        read_flash_u8(block + 2) != 'E' || read_flash_u8(block + 3) != 'H' ||
        read_flash_u8(block + 4) != '2')
        return 0;
    uint32_t size = read_flash_u24(block + 7);
    if (size < AVEH2_HEADER_SIZE || size > AVEH2_ADDRESS_LIMIT - block)
        return 0;
    return block + size;
}

/* Returns the address after the whole record of the function at fh, which holds
 * its rows, sites, and calls. Returns 0 when any part extends past limit. This
 * checks sizes only, which is what skipping a record needs. The contents are
 * checked when a lookup consumes them. */
AVEH2_INLINE uint32_t record_end(uint32_t fh, uint32_t limit) {
    if (fh >= limit || limit - fh < AVEH2_FUNCTION_HEADER_SIZE)
        return 0;
    uint16_t rows = read_flash_u16(fh + 6);
    uint32_t address = fh + AVEH2_FUNCTION_HEADER_SIZE;
    for (uint16_t r = 0; r < rows; r++) {
        if (limit - address < AVEH2_ROW_HEADER_SIZE)
            return 0;
        address += row_size(read_flash_u8(address + 2) & AVEH2_FLAG_SAVED_MASK);
        if (address > limit)
            return 0;
    }
    uint32_t sites = site_bytes(read_flash_u16(fh + 8));
    if (sites > limit - address)
        return 0;
    address += sites;
    uint32_t calls = call_bytes(read_flash_u16(fh + 10));
    if (calls > limit - address)
        return 0;
    return address + calls;
}

/* Returns the first site record of a function whose size record_end accepted. */
AVEH2_INLINE uint32_t sites_of(uint32_t fh) {
    uint16_t rows = read_flash_u16(fh + 6);
    uint32_t address = fh + AVEH2_FUNCTION_HEADER_SIZE;
    for (uint16_t r = 0; r < rows; r++)
        address += row_size(read_flash_u8(address + 2) & AVEH2_FLAG_SAVED_MASK);
    return address;
}

/* The record checks below are shared by the throw path, which applies them to the
 * records it consumes, and by avm_eh_validate_block, which applies them to all.
 * Each returns 1 only when the record is well formed. */

/* One row. The first row starts at the function start, and rows strictly
 * increase. The row lies inside its function. */
AVEH2_INLINE uint8_t row_ok(uint32_t row, uint32_t start, uint32_t end,
                            uint32_t previous_delta, uint8_t first) {
    uint8_t flags = read_flash_u8(row + 2);
    uint32_t delta = read_flash_u16(row);
    if (flags & AVEH2_FLAG_RESERVED)
        return 0;
    if (first ? delta != 0 : delta <= previous_delta)
        return 0;
    return start + delta < end;
}

/* One site. Sites are ordered and lie inside the function. A catch-all landing
 * pad lies inside the function, and a site without a handler has no pad. */
AVEH2_INLINE uint8_t site_ok(uint32_t site, uint32_t start, uint32_t end,
                             uint32_t previous_end) {
    uint32_t site_start = read_flash_u24(site);
    uint32_t site_end = read_flash_u24(site + 3);
    uint32_t landing_pad = read_flash_u24(site + 6);
    uint8_t action = read_flash_u8(site + 9);
    if (site_start >= site_end || site_start < previous_end || site_end > end)
        return 0;
    if (action == AVEH2_ACTION_NONE)
        return landing_pad == 0;
    if (action == AVEH2_ACTION_CATCH_ALL)
        return landing_pad >= start && landing_pad < end;
    return 0;
}

/* One call. Return PCs strictly increase inside (start, end], and the stack
 * arguments fit in the guest stack. */
AVEH2_INLINE uint8_t call_ok(uint32_t call, uint32_t start, uint32_t end,
                             uint32_t previous_return) {
    uint32_t return_pc = read_flash_u24(call);
    if (return_pc <= start || return_pc > end || return_pc <= previous_return)
        return 0;
    return read_flash_u16(call + 3) < AVEH2_ARGUMENT_LIMIT;
}

/* Returns the last row that starts at or before pc, 0 when pc precedes the first
 * row, or AVEH2_BAD when a row the scan reads is malformed. */
AVEH2_INLINE uint32_t find_row(uint32_t fh, uint32_t pc) {
    uint32_t start = read_flash_u24(fh);
    uint32_t end = read_flash_u24(fh + 3);
    uint16_t count = read_flash_u16(fh + 6);
    uint32_t address = fh + AVEH2_FUNCTION_HEADER_SIZE;
    uint32_t found = 0;
    uint32_t previous_delta = 0;
    for (uint16_t r = 0; r < count; r++) {
        if (!row_ok(address, start, end, previous_delta, r == 0))
            return AVEH2_BAD;
        if (start + read_flash_u16(address) > pc)
            break;
        found = address;
        previous_delta = read_flash_u16(address);
        address += row_size(read_flash_u8(address + 2) & AVEH2_FLAG_SAVED_MASK);
    }
    return found;
}

/* Returns the site record that covers pc, 0 when no record does (a gap between
 * records has no handler), or AVEH2_BAD when a site the scan reads is malformed. */
AVEH2_INLINE uint32_t find_site(uint32_t fh, uint32_t pc) {
    uint32_t start = read_flash_u24(fh);
    uint32_t end = read_flash_u24(fh + 3);
    uint16_t count = read_flash_u16(fh + 8);
    uint32_t address = sites_of(fh);
    uint32_t previous_end = start;
    for (uint16_t s = 0; s < count; s++, address += AVEH2_SITE_SIZE) {
        if (!site_ok(address, start, end, previous_end))
            return AVEH2_BAD;
        if (pc >= read_flash_u24(address) && pc < read_flash_u24(address + 3))
            return address;
        previous_end = read_flash_u24(address + 3);
    }
    return 0;
}

/* Returns the outgoing argument bytes of the call whose return PC is pc. A
 * catch-all site needs this record, so a missing or malformed one returns
 * AVEH2_BAD and fails the throw. The bytes are below 256, so the sentinel
 * cannot be a valid value. */
AVEH2_INLINE uint32_t find_call(uint32_t fh, uint32_t pc) {
    uint32_t start = read_flash_u24(fh);
    uint32_t end = read_flash_u24(fh + 3);
    uint16_t count = read_flash_u16(fh + 10);
    uint32_t address = sites_of(fh) + site_bytes(read_flash_u16(fh + 8));
    uint32_t previous_return = start;
    for (uint16_t c = 0; c < count; c++, address += AVEH2_CALL_SIZE) {
        if (!call_ok(address, start, end, previous_return))
            return AVEH2_BAD;
        if (read_flash_u24(address) == pc)
            return read_flash_u16(address + 3);
        previous_return = read_flash_u24(address);
    }
    return AVEH2_BAD;
}

/* The CFA-relative slot of saved register r. Slots are stored in register order,
 * so the index is the number of saved registers below r. */
AVEH2_INLINE int16_t row_slot(uint32_t row, uint8_t flags, uint8_t r) {
    uint8_t below = (flags & AVEH2_FLAG_SAVED_MASK) & ((1u << r) - 1u);
    return (int16_t)read_flash_u16(row + AVEH2_ROW_HEADER_SIZE +
                                   ((uint16_t)popcount4(below) << 1));
}

/* True when a stack address lies in the guest stack window. */
AVEH2_INLINE uint8_t stack_address(int32_t address) {
    return address >= AVM_TRAP_STACK_BASE && address < AVM_TRAP_STACK_TOP;
}

/* Checks the whole block. It applies the record checks above to every record, so
 * it is the complete form of the checks that a throw applies as it consumes
 * records. Throws do not call it. */
uint8_t avm_eh_validate_block(uint32_t block) {
    uint32_t limit = open_block(block);
    if (!limit)
        return 0;
    uint16_t count = read_flash_u16(block + 5);
    uint32_t fh = block + AVEH2_HEADER_SIZE;
    uint32_t previous_end = 0;
    for (uint16_t f = 0; f < count; f++) {
        uint32_t next = record_end(fh, limit);
        if (!next)
            return 0;
        uint32_t start = read_flash_u24(fh);
        uint32_t end = read_flash_u24(fh + 3);
        if (start >= end || start < previous_end || end > AVEH2_ADDRESS_LIMIT)
            return 0;
        previous_end = end;

        uint16_t row_count = read_flash_u16(fh + 6);
        uint16_t site_count = read_flash_u16(fh + 8);
        uint16_t call_count = read_flash_u16(fh + 10);
        if (row_count == 0)
            return 0;
        uint32_t address = fh + AVEH2_FUNCTION_HEADER_SIZE;
        uint32_t previous_delta = 0;
        for (uint16_t r = 0; r < row_count; r++) {
            if (!row_ok(address, start, end, previous_delta, r == 0))
                return 0;
            previous_delta = read_flash_u16(address);
            address += row_size(read_flash_u8(address + 2) & AVEH2_FLAG_SAVED_MASK);
        }
        uint32_t previous_site_end = start;
        for (uint16_t s = 0; s < site_count; s++, address += AVEH2_SITE_SIZE) {
            if (!site_ok(address, start, end, previous_site_end))
                return 0;
            previous_site_end = read_flash_u24(address + 3);
        }
        uint32_t previous_return = start;
        for (uint16_t c = 0; c < call_count; c++, address += AVEH2_CALL_SIZE) {
            if (!call_ok(address, start, end, previous_return))
                return 0;
            previous_return = read_flash_u24(address);
        }
        fh = next;
    }
    return fh == limit;
}

/* The function record that covers lookup. A gap or a record past the last one has
 * no unwind entry, so the walk returns 0. Records are sorted, and each skipped
 * record is size-checked. */
AVEH2_INLINE uint32_t locate_function(uint32_t block, uint32_t limit,
                                        uint32_t lookup) {
    uint32_t fh = block + AVEH2_HEADER_SIZE;
    uint32_t previous_end = 0;
    for (;;) {
        if (fh >= limit)
            return 0;
        uint32_t next = record_end(fh, limit);
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
    uint32_t block = read_flash_u24((uint32_t)__avm_eh_metadata_ptr);
    uint32_t limit = open_block(block);
    if (!limit)
        return 0;

    for (;;) {
        if (context->sp < AVM_TRAP_STACK_BASE || context->sp >= AVM_TRAP_STACK_TOP)
            return 0;
        /* The PC is a return address, so the call instruction is one byte
         * earlier. The throw frame's continuation follows the same rule. */
        uint32_t lookup = context_pc(context) - 1;

        uint32_t fh = locate_function(block, limit, lookup);
        if (!fh)
            return 0;

        uint32_t row = find_row(fh, lookup);
        uint32_t site = find_site(fh, lookup);
        if (row == AVEH2_BAD || site == AVEH2_BAD || row == 0)
            return 0;

        if (site && read_flash_u8(site + 9) == AVEH2_ACTION_CATCH_ALL) {
            uint32_t outgoing = find_call(fh, context_pc(context));
            if (outgoing == AVEH2_BAD)
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
        uint8_t flags = read_flash_u8(row + 2);
        uint16_t frame_base = (flags & AVEH2_FLAG_R3_BASE) ? context->r[3]
                                                            : context->sp;
        int32_t cfa = (uint16_t)(frame_base + read_flash_u16(row + 3));
        if (cfa <= context->sp || cfa > AVM_TRAP_STACK_TOP ||
            cfa < AVM_TRAP_STACK_BASE + AVEH2_RETURN_RECORD)
            return 0;
        uint32_t return_pc = read_ram_u16((uint16_t)(cfa - AVEH2_RETURN_RECORD)) |
                             ((uint32_t)read_ram_u8((uint16_t)(cfa - 1)) << 16);
        for (uint8_t r = 0; r < 4; r++) {
            if (!((flags >> r) & 1))
                continue;
            int32_t address = cfa + row_slot(row, flags, r);
            if (!stack_address(address) || address > AVM_TRAP_STACK_TOP - 2)
                return 0;
            context->r[r] = read_ram_u16((uint16_t)address);
        }
        context->sp = (uint16_t)cfa;
        set_context_pc(context, return_pc);
    }
}
