#include <stdint.h>

#include "test_hex_output.h"

#if defined(__clang__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

typedef uint16_t (*binary_function)(uint16_t, uint16_t);

static uint16_t rotate_left16(uint16_t value, uint8_t count)
{
    return (uint16_t)((uint16_t)(value << count) |
                      (uint16_t)(value >> (uint8_t)(16 - count)));
}

static NOINLINE uint16_t
many_arguments(uint16_t a, uint16_t b, uint16_t c, uint16_t d,
               uint16_t e, uint16_t f, uint16_t g, uint16_t h)
{
    return (uint16_t)(a + (uint16_t)(3u * b) + (uint16_t)(5u * c) +
                      (uint16_t)(7u * d) + (uint16_t)(11u * e) +
                      (uint16_t)(13u * f) + (uint16_t)(17u * g) +
                      (uint16_t)(19u * h));
}

static NOINLINE uint16_t add_values(uint16_t a, uint16_t b)
{
    return (uint16_t)(a + b);
}

static NOINLINE uint16_t xor_values(uint16_t a, uint16_t b)
{
    return (uint16_t)(a ^ rotate_left16(b, 3));
}

static NOINLINE uint16_t
call_indirect(binary_function function, uint16_t a, uint16_t b)
{
    return function(a, b);
}

static NOINLINE uint32_t make_u32(uint16_t high, uint16_t low)
{
    uint32_t value = ((uint32_t)high << 16) | low;
    value ^= value << 7;
    value ^= value >> 11;
    return value;
}

static NOINLINE uint8_t return_u8(uint16_t value)
{
    return (uint8_t)(value ^ (value >> 8));
}

static NOINLINE int8_t return_i8(int16_t value)
{
    return (int8_t)(value >> 3);
}

int avm_test_main(void)
{
    volatile uint16_t input = 1;

    const uint16_t a0 =
        many_arguments(input, 2, 3, 4, 5, 6, 7, 8);
    const uint16_t a1 =
        (uint16_t)(call_indirect(add_values, 0x1234, 0x4567) ^
                   call_indirect(xor_values, 0xabcd, 0x0f0f));
    const uint32_t a2 = make_u32(0x1357, 0x9bdf);
    const uint16_t a3 =
        (uint16_t)(return_u8(0xbeef) |
                   (uint16_t)((uint16_t)(uint8_t)return_i8(-1234) << 8));

    test_line16("A0", a0);
    test_line16("A1", a1);
    test_line32("A2", a2);
    test_line16("A3", a3);

    return a0 != 0x01c6 || a1 != 0x842e ||
           a2 != UINT32_C(0xb88d6711) || a3 != 0x6551;
}
