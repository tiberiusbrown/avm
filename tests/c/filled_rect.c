#include <stdint.h>

#include "test_hex_output.h"

extern void __avm_draw_filled_rect_white(
    int x, int y, unsigned char width, unsigned char height);
extern void __avm_draw_filled_rect_black(
    int x, int y, unsigned char width, unsigned char height);

#define FRAMEBUFFER ((uint8_t *)(uintptr_t)0x0500u)
#define FRAMEBUFFER_WIDTH 128
#define FRAMEBUFFER_HEIGHT 64
#define FRAMEBUFFER_SIZE 1024u

#define GUARD_BEFORE ((volatile uint8_t *)(uintptr_t)0x04fcu)
#define GUARD_AFTER ((volatile uint8_t *)(uintptr_t)0x0900u)
#define GUARD_SIZE 4u

typedef struct clipped_rect_t {
    int left;
    int top;
    int right;
    int bottom;
} clipped_rect_t;

static uint8_t initial_byte(uint16_t index, uint8_t seed)
{
    return (uint8_t)((uint8_t)(index * 37u) ^
                     (uint8_t)(index >> 2) ^ seed);
}

static uint8_t guard_before_byte(uint8_t index, uint8_t seed)
{
    return (uint8_t)(seed ^ (uint8_t)(0xa5u + index * 17u));
}

static uint8_t guard_after_byte(uint8_t index, uint8_t seed)
{
    return (uint8_t)(seed ^ (uint8_t)(0x5au + index * 29u));
}

static void prepare_memory(uint8_t seed)
{
    uint16_t i;
    uint8_t guard;

    for(guard = 0; guard != GUARD_SIZE; ++guard) {
        GUARD_BEFORE[guard] = guard_before_byte(guard, seed);
        GUARD_AFTER[guard] = guard_after_byte(guard, seed);
    }

    for(i = 0; i != FRAMEBUFFER_SIZE; ++i)
        FRAMEBUFFER[i] = initial_byte(i, seed);
}

static clipped_rect_t clip_rect(
    int x, int y, unsigned char width, unsigned char height)
{
    clipped_rect_t result;

    result.left = x;
    result.top = y;
    result.right = x + (int)width;
    result.bottom = y + (int)height;

    if(result.left < 0)
        result.left = 0;
    if(result.top < 0)
        result.top = 0;
    if(result.right > FRAMEBUFFER_WIDTH)
        result.right = FRAMEBUFFER_WIDTH;
    if(result.bottom > FRAMEBUFFER_HEIGHT)
        result.bottom = FRAMEBUFFER_HEIGHT;

    if(result.left >= result.right || result.top >= result.bottom) {
        result.left = 0;
        result.top = 0;
        result.right = 0;
        result.bottom = 0;
    }

    return result;
}

static uint8_t byte_mask(uint16_t index, clipped_rect_t rect)
{
    int x = (int)(index & 127u);
    int page_top = (int)(index >> 7) * 8;
    uint8_t mask = 0;
    uint8_t bit;

    if(x < rect.left || x >= rect.right)
        return 0;

    for(bit = 0; bit != 8u; ++bit) {
        int y = page_top + (int)bit;
        if(y >= rect.top && y < rect.bottom)
            mask |= (uint8_t)(1u << bit);
    }
    return mask;
}

static int fail_case(uint16_t case_index, uint16_t address,
                     uint8_t expected, uint8_t actual)
{
    test_line16("CASE", case_index);
    test_line16("ADDR", address);
    test_line16("WANT", expected);
    test_line16("GOT", actual);
    return 1;
}

static int check_guards(uint16_t case_index, uint8_t seed)
{
    uint8_t i;

    for(i = 0; i != GUARD_SIZE; ++i) {
        uint8_t expected = guard_before_byte(i, seed);
        uint8_t actual = GUARD_BEFORE[i];
        if(actual != expected)
            return fail_case(case_index, (uint16_t)(0x04fcu + i),
                             expected, actual);
    }

    for(i = 0; i != GUARD_SIZE; ++i) {
        uint8_t expected = guard_after_byte(i, seed);
        uint8_t actual = GUARD_AFTER[i];
        if(actual != expected)
            return fail_case(case_index, (uint16_t)(0x0900u + i),
                             expected, actual);
    }

    return 0;
}

static int check_case(uint16_t case_index, int white,
                      int x, int y, unsigned char width,
                      unsigned char height, uint8_t seed)
{
    clipped_rect_t rect = clip_rect(x, y, width, height);
    uint16_t i;

    prepare_memory(seed);
    if(white)
        __avm_draw_filled_rect_white(x, y, width, height);
    else
        __avm_draw_filled_rect_black(x, y, width, height);

    if(check_guards(case_index, seed))
        return 1;

    for(i = 0; i != FRAMEBUFFER_SIZE; ++i) {
        uint8_t original = initial_byte(i, seed);
        uint8_t mask = byte_mask(i, rect);
        uint8_t expected = white ? (uint8_t)(original | mask)
                                 : (uint8_t)(original & (uint8_t)~mask);
        if(FRAMEBUFFER[i] != expected)
            return fail_case(case_index, (uint16_t)(0x0500u + i),
                             expected, FRAMEBUFFER[i]);
    }
    return 0;
}

static int check_round_trip(uint16_t case_index,
                            int x, int y, unsigned char width,
                            unsigned char height, uint8_t seed)
{
    clipped_rect_t rect = clip_rect(x, y, width, height);
    uint16_t i;

    prepare_memory(seed);
    __avm_draw_filled_rect_white(x, y, width, height);
    __avm_draw_filled_rect_black(x, y, width, height);

    if(check_guards(case_index, seed))
        return 1;

    for(i = 0; i != FRAMEBUFFER_SIZE; ++i) {
        uint8_t expected =
            (uint8_t)(initial_byte(i, seed) & (uint8_t)~byte_mask(i, rect));
        if(FRAMEBUFFER[i] != expected)
            return fail_case(case_index, (uint16_t)(0x0500u + i),
                             expected, FRAMEBUFFER[i]);
    }
    return 0;
}

int avm_test_main(void)
{
    /* Basic aligned single-page rectangles. */
    if(check_case(0u, 1, 10, 8, 13u, 8u, 0x31u))
        return 1;
    if(check_case(1u, 0, 10, 8, 13u, 8u, 0xc7u))
        return 1;

    /* Unaligned rectangles spanning several framebuffer pages. */
    if(check_case(2u, 1, 20, 5, 17u, 19u, 0x5au))
        return 1;
    if(check_case(3u, 0, 20, 5, 17u, 19u, 0xa5u))
        return 1;

    /* Partial clipping at opposing corners. */
    if(check_case(4u, 1, -7, -3, 12u, 10u, 0x96u))
        return 1;
    if(check_case(5u, 0, 124, 60, 20u, 20u, 0x69u))
        return 1;

    /* Page-boundary and one-pixel edge cases. */
    if(check_case(6u, 1, 40, 7, 9u, 2u, 0x3cu))
        return 1;
    if(check_case(7u, 0, 127, 63, 1u, 1u, 0xc3u))
        return 1;

    /* Full-screen results, including maximum byte-sized dimensions. */
    if(check_case(8u, 1, -127, -191, 255u, 255u, 0x55u))
        return 1;
    if(check_case(9u, 0, 0, 0, 128u, 64u, 0xaau))
        return 1;

    /* Zero dimensions must be complete no-ops. */
    if(check_case(10u, 1, 30, 12, 0u, 17u, 0x0fu))
        return 1;
    if(check_case(11u, 0, 30, 12, 17u, 0u, 0xf0u))
        return 1;

    /* Fully clipped rectangles must also be complete no-ops. */
    if(check_case(12u, 1, 128, 12, 17u, 9u, 0x87u))
        return 1;
    if(check_case(13u, 0, -20, 12, 20u, 9u, 0x78u))
        return 1;
    if(check_case(14u, 1, 30, -9, 17u, 9u, 0x1eu))
        return 1;
    if(check_case(15u, 0, 30, 64, 17u, 9u, 0xe1u))
        return 1;

    /* Extreme clipping that leaves exactly one visible column or row. */
    if(check_case(16u, 1, -254, 11, 255u, 9u, 0x42u))
        return 1;
    if(check_case(17u, 0, 30, -254, 5u, 255u, 0x24u))
        return 1;

    /* Maximum dimensions clipped at the lower-right and upper-left. */
    if(check_case(18u, 1, 120, 60, 255u, 255u, 0x66u))
        return 1;
    if(check_case(19u, 0, -200, -200, 255u, 255u, 0x99u))
        return 1;

    /* Consecutive services also exercise the post-SYS instruction cadence. */
    if(check_round_trip(20u, 37, 6, 43u, 27u, 0x5du))
        return 1;

    return 0;
}
