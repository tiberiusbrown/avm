/* Exercise the production row lookup through avm_eh_find_handler. Synthetic
 * function ranges reach past the 16-bit row-delta limit without large code
 * images. Only the expected covering row can unwind a three-byte fake frame
 * to the caller's catch-all; all other rows have a nonadvancing CFA. */
#include <avm/pgmspace.h>
#include <stdint.h>
#include <string.h>

#include "../../runtime/lib/eh_unwind_internal.h"

#define U16(x) (uint8_t)(x), (uint8_t)((uint32_t)(x) >> 8)
#define U24(x) U16(x), (uint8_t)((uint32_t)(x) >> 16)
#define START 0x120000ul
#define CALLER 0xf00000ul
#define ROW(delta, cfa) U16(delta), 0, U16(cfa)
#define ROW_ONE(delta, cfa) U16(delta), 1, U16(cfa), U16(-3)
#define ROW_FOUR(delta, cfa) \
    U16(delta), 15, U16(cfa), U16(-3), U16(-3), U16(-3), U16(-3)

/* Two indexed records: the function being unwound, then a caller with a
 * catch-all action. The caller's return PC is CALLER+2 and its pad is CALLER+4.
 * Each record's row area has the size declared by its header, even for mutants. */
#define BLOCK(name, span, count, bytes, ...) \
    static const uint8_t AVM_PROGMEM name[] = { \
        'A', 'V', 'E', 'H', '5', U16(2), U24(88 + (bytes)), \
        U24(START), U24(22), \
        U24(CALLER), U24(40 + (bytes)), \
        U24(START), U24(START + (span)), U16(count), U16(0), U16(0), \
        U24(18 + (bytes)), U24(18 + (bytes)), \
        __VA_ARGS__, \
        U24(CALLER), U24(CALLER + 16), U16(1), U16(1), U16(1), \
        U24(23), U24(48), \
        ROW(0, 3), \
        U24(CALLER + 1), U24(CALLER + 2), U24(CALLER + 4), U24(40), \
        U24(CALLER + 2), U16(0), \
        0, U16(1), U16(1), U24(0) \
    }

BLOCK(one_byte, 1, 1, 5, ROW(0, 3));
BLOCK(below_limit, 0xfffful, 2, 10, ROW(0, 0), ROW(0xfffe, 3));
BLOCK(at_limit, 0x10000ul, 2, 10, ROW(0, 0), ROW(0xffff, 3));
BLOCK(above_limit, 0x10001ul, 2, 10, ROW(0, 0), ROW(0xffff, 3));
BLOCK(wide_lookup, 0x20002ul, 2, 10, ROW(0, 0), ROW(0xffff, 3));
BLOCK(before_next, 0x10000ul, 2, 10, ROW(0, 3), ROW(0xffff, 0));
BLOCK(mixed_sizes, 80, 4, 30,
      ROW(0, 0), ROW_ONE(20, 0), ROW_FOUR(40, 3), ROW(60, 0));
BLOCK(last_row, 80, 3, 25,
      ROW(0, 0), ROW_ONE(20, 0), ROW_FOUR(40, 3));

BLOCK(first_nonzero, 10, 1, 5, ROW(1, 3));
BLOCK(duplicate_delta, 30, 3, 15, ROW(0, 0), ROW(20, 0), ROW(20, 3));
BLOCK(decreasing_delta, 30, 3, 15, ROW(0, 0), ROW(20, 0), ROW(10, 3));
BLOCK(delta_at_end, 20, 2, 10, ROW(0, 3), ROW(20, 0));
BLOCK(delta_past_end, 20, 2, 10, ROW(0, 3), ROW(21, 0));
BLOCK(wide_bad_delta, 0xfffful, 2, 10, ROW(0, 3), ROW(0xffff, 0));
BLOCK(reserved_next, 30, 2, 10, ROW(0, 3), U16(10), 0x10, U16(0));
BLOCK(truncated_slots, 30, 2, 10, ROW(0, 3), U16(10), 15, U16(0));
/* The scanner checks the first row past lookup, but does not consume later
 * rows. This malformed third row must not invalidate the executed path. */
BLOCK(unread_reserved, 30, 3, 15,
      ROW(0, 3), ROW(10, 0), U16(20), 0x10, U16(0));

static struct avm_eh_exception header;

static void store24(uint8_t bytes[3], uint32_t value) {
    bytes[0] = (uint8_t)value;
    bytes[1] = (uint8_t)(value >> 8);
    bytes[2] = (uint8_t)(value >> 16);
}

static int check(const uint8_t AVM_PROGMEM *block, uint16_t size,
                 uint32_t lookup, uint8_t expected) {
    /* This buffer is inside the guest stack but above the runtime's frames.
     * The unwinder reads it as the selected row's saved caller return PC. */
    uint8_t returns[6] = {U24(CALLER + 2), 0, 0, 0};
    memset(&header, 0, sizeof header);
    store24(header.eh_block_address, (uint32_t)block);
    store24(header.eh_block_end, (uint32_t)block + size);
    header.eh_function_count = 2;
    header.state = AVM_EH_STATE_THROWN;
    if (!avm_eh_set_context_sp(&header.resume_context, (uint16_t)(uintptr_t)returns))
        return 1;
    uint32_t pc = START + lookup + 1;
    header.resume_context.pc_low = (uint16_t)pc;
    header.resume_context.pc_high = (uint8_t)(pc >> 16);
    uint8_t found = avm_eh_find_handler(&header);
    if (found != expected)
        return 1;
    if (!found)
        return 0;
    return header.handler_selector != 1 ||
           avm_eh_context_sp(&header.resume_context) != (uint16_t)(uintptr_t)(returns + 3) ||
           header.resume_context.pc_low != (uint16_t)(CALLER + 4) ||
           header.resume_context.pc_high != (uint8_t)(CALLER >> 16);
}

#define CHECK(name, lookup, expected) \
    failures += check(name, sizeof name, lookup, expected)

int avm_test_main(void) {
    int failures = 0;
    CHECK(one_byte, 0, 1);
    CHECK(below_limit, 0xfffeul, 1);
    CHECK(at_limit, 0xfffful, 1);
    CHECK(above_limit, 0x10000ul, 1);
    CHECK(wide_lookup, 0x20000ul, 1);
    CHECK(before_next, 0xfffeul, 1);
    CHECK(mixed_sizes, 41, 1);
    CHECK(last_row, 79, 1);
    CHECK(first_nonzero, 1, 0);
    CHECK(duplicate_delta, 20, 0);
    CHECK(decreasing_delta, 20, 0);
    CHECK(delta_at_end, 10, 0);
    CHECK(delta_past_end, 10, 0);
    CHECK(wide_bad_delta, 0xfffeul, 0);
    CHECK(reserved_next, 0, 0);
    CHECK(truncated_slots, 0, 0);
    CHECK(unread_reserved, 0, 1);
    return failures;
}
