#include <stdint.h>

#include "test_hex_output.h"

#if defined(__clang__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

static uint16_t rotate_left16(uint16_t value, uint8_t count)
{
    return (uint16_t)((uint16_t)(value << count) |
                      (uint16_t)(value >> (uint8_t)(16 - count)));
}

static uint32_t rotate_left32(uint32_t value, uint8_t count)
{
    return (value << count) | (value >> (uint8_t)(32 - count));
}

static NOINLINE uint16_t
mix_u16(uint16_t x, uint16_t y, uint8_t rounds)
{
    for(uint8_t i = 0; i < rounds; ++i) {
        const uint16_t divisor = (uint16_t)(y | 1u);
        const uint16_t quotient = (uint16_t)(x / divisor);
        const uint16_t remainder = (uint16_t)(x % divisor);
        const uint8_t shift = (uint8_t)(i % 7u + 1u);
        x = (uint16_t)(rotate_left16(x, shift) +
                       (uint16_t)(quotient * 17u) +
                       (uint16_t)(remainder * 31u));
        y = (uint16_t)(((uint16_t)(y * 5u + 3u)) ^ x);
    }

    return (uint16_t)(x ^ y);
}

static NOINLINE uint16_t mix_s16(int16_t a, int16_t b)
{
    const int16_t quotient = (int16_t)(a / b);
    const int16_t remainder = (int16_t)(a % b);
    const int16_t shifted = (int16_t)(a >> 3);

    return (uint16_t)(((uint16_t)quotient * 257u) ^
                      ((uint16_t)remainder * 17u) ^
                      (uint16_t)shifted);
}

static NOINLINE uint32_t mix_u32(uint32_t x, uint32_t y)
{
    for(uint8_t i = 0; i < 7; ++i) {
        x += y;
        x ^= x << 5;
        x ^= x >> 7;
        x = rotate_left32(x, 9);
        y += UINT32_C(0x9e3779b9);
        y ^= x >> 3;
    }

    return x ^ y;
}

static NOINLINE uint16_t
comparison_mask(int16_t a, int16_t b, uint16_t x, uint16_t y)
{
    uint16_t mask = 0;
    mask |= (uint16_t)(a < b) << 0;
    mask |= (uint16_t)(a >= b) << 1;
    mask |= (uint16_t)(x < y) << 2;
    mask |= (uint16_t)(x >= y) << 3;
    mask |= (uint16_t)(x == 0x1234) << 4;
    mask |= (uint16_t)(y != 0x5678) << 5;

    const int16_t low = a < b ? a : b;
    const uint16_t high = x > y ? x : y;
    mask ^= (uint16_t)((uint16_t)low & 0xffu) << 8;
    mask ^= (uint16_t)(high & 0xffu);
    return mask;
}

int avm_test_main(void)
{
    volatile uint16_t x = 0xace1;
    volatile uint16_t y = 0x1357;
    volatile int16_t a = -23456;
    volatile int16_t b = 317;
    volatile uint32_t p = UINT32_C(0x12345678);
    volatile uint32_t q = UINT32_C(0x9abcdef0);

    const uint16_t i0 = mix_u16(x, y, 11);
    const uint16_t i1 = mix_s16(a, b);
    const uint32_t i2 = mix_u32(p, q);
    const uint16_t i3 = comparison_mask(-123, 77, 0x1234, 0x5678);

    test_line16("I0", i0);
    test_line16("I1", i1);
    test_line32("I2", i2);
    test_line16("I3", i3);

    return i0 != 0x84c6 || i1 != 0xa92e ||
           i2 != UINT32_C(0xb1cae0ed) || i3 != 0x856d;
}
