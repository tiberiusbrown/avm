#include <math.h>
#include <stdint.h>

#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))
#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)

static NOINLINE float divide(float a, float b) { return a / b; }
static NOINLINE float conditional_div(float a, float b, int c)
{
    return c ? a / b : a;
}
static NOINLINE float reciprocal(float a, int c)
{
    return c ? -1.0f / a : a;
}
static NOINLINE float nested(float a, float b, int c, int d)
{
    return c ? (d ? a / b : a) : a;
}
static NOINLINE float live(float a, float b, int c)
{
    float selected = c ? a / b : a;
    return selected + b;
}
static NOINLINE float both_paths(float a, float b, int c)
{
    float quotient = a / b;
    return (c ? quotient : a) + quotient;
}
static NOINLINE float constant_divisor(float a, int c)
{
    return c ? a / 3.0f : a;
}
static NOINLINE float power_of_two(float a, int c)
{
    return c ? a / 2.0f : a;
}
static NOINLINE int integer_div(int a, int b, int c)
{
    return c ? a / b : a;
}
static NOINLINE int integer_rem(int a, int b, int c)
{
    return c ? a % b : a;
}
static NOINLINE float remainder(float a, float b, int c)
{
    return c ? fmodf(a, b) : a;
}
static NOINLINE float helper(float a, int c)
{
    return c ? __builtin_sqrtf(a) : a;
}

static uint32_t word(float a) { return __builtin_bit_cast(uint32_t, a); }
static float value(uint32_t a) { return __builtin_bit_cast(float, a); }
static int same(float a, float b)
{
    return word(a) == word(b) || (__builtin_isnan(a) && __builtin_isnan(b));
}

int avm_test_main(void)
{
    static const uint32_t inputs[] = {
        0, 0x80000000UL, 1, 0x80000001UL, 0x007fffffUL,
        0x3f000000UL, 0xbf000000UL, 0x3f800000UL, 0x40000000UL,
        0x7f7fffffUL, 0x7f800000UL, 0xff800000UL, 0x7fc12345UL,
        0xffc12345UL, 0x7f812345UL
    };
    for (unsigned i = 0; i < sizeof(inputs) / sizeof(inputs[0]); ++i) {
        float a = value(inputs[i]);
        for (int c = 0; c < 2; ++c) {
            float expected = c ? divide(a, 3.0f) : a;
            CHECK(same(conditional_div(a, 3.0f, c), expected));
            CHECK(same(constant_divisor(a, c), expected));
            CHECK(same(power_of_two(a, c), c ? divide(a, 2.0f) : a));
            CHECK(same(reciprocal(a, c), c ? divide(-1.0f, a) : a));
            CHECK(same(live(a, 3.0f, c), expected + 3.0f));
            float q = divide(a, 3.0f);
            CHECK(same(both_paths(a, 3.0f, c), (c ? q : a) + q));
            for (int d = 0; d < 2; ++d)
                CHECK(same(nested(a, 3.0f, c, d), c && d ? q : a));
            CHECK(same(remainder(a, 3.0f, c), c ? fmodf(a, 3.0f) : a));
            CHECK(same(helper(a, c), c ? sqrtf(a) : a));
        }
        // An unselected value must retain even a signaling NaN's exact bits.
        CHECK(word(conditional_div(a, 0.0f, 0)) == inputs[i]);
        CHECK(word(reciprocal(a, 0)) == inputs[i]);
        CHECK(word(nested(a, 0.0f, 0, 1)) == inputs[i]);
    }
    for (int a = -31; a <= 31; ++a) {
        CHECK(integer_div(a, 0, 0) == a);
        CHECK(integer_rem(a, 0, 0) == a);
        for (int b = -3; b <= 3; ++b) {
            if (!b) continue;
            for (int c = 0; c < 2; ++c) {
                CHECK(integer_div(a, b, c) == (c ? a / b : a));
                CHECK(integer_rem(a, b, c) == (c ? a % b : a));
            }
        }
    }
    test_puts("select-expensive-operands=ok\n");
    return 0;
}
