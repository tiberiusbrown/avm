#include <stdint.h>
#include <string.h>

#include "test_hex_output.h"

#if defined(__clang__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

static uint32_t float_bits(float value)
{
    uint32_t bits;
    memcpy(&bits, &value, sizeof(bits));
    return bits;
}

static NOINLINE float arithmetic(float a, float b, float c)
{
    return a * b + c;
}

static NOINLINE float divide_exact(float a, float b)
{
    return a / b;
}

static NOINLINE float sqrt_exact(float value)
{
    return __builtin_sqrtf(value);
}

static NOINLINE float select_min(float a, float b)
{
    return a < b ? a : b;
}

static NOINLINE float select_max(float a, float b)
{
    return a > b ? a : b;
}

static NOINLINE int16_t convert_signed(float value)
{
    return (int16_t)value;
}

static NOINLINE uint16_t convert_unsigned(float value)
{
    return (uint16_t)value;
}

static NOINLINE float from_integers(int16_t a, uint16_t b)
{
    return (float)a + (float)b * 0.5f;
}

int avm_test_main(void)
{
    volatile float f15 = 1.5f;
    volatile float fn2 = -2.0f;
    volatile float f5 = 5.0f;
    volatile float f75 = 7.5f;
    volatile float f25 = 2.5f;
    volatile float f81 = 81.0f;
    volatile float fn35 = -3.5f;
    volatile float f225 = 2.25f;
    volatile float fn1275 = -12.75f;
    volatile float f2505 = 250.5f;

    const uint32_t f0 = float_bits(arithmetic(f15, fn2, f5));
    const uint32_t f1 = float_bits(divide_exact(f75, f25));
    const uint32_t f2 = float_bits(sqrt_exact(f81));
    const uint32_t f3 = float_bits(select_min(fn35, f225));
    const uint32_t f4 = float_bits(select_max(fn35, f225));
    const uint32_t f5_bits =
        ((uint32_t)(uint16_t)convert_signed(fn1275) << 16) |
        convert_unsigned(f2505);
    const uint32_t f6 = float_bits(from_integers(-12, 50));

    test_line32("F0", f0);
    test_line32("F1", f1);
    test_line32("F2", f2);
    test_line32("F3", f3);
    test_line32("F4", f4);
    test_line32("F5", f5_bits);
    test_line32("F6", f6);

    return f0 != UINT32_C(0x40000000) ||
           f1 != UINT32_C(0x40400000) ||
           f2 != UINT32_C(0x41100000) ||
           f3 != UINT32_C(0xc0600000) ||
           f4 != UINT32_C(0x40100000) ||
           f5_bits != UINT32_C(0xfff400fa) ||
           f6 != UINT32_C(0x41500000);
}
