#include <stdint.h>

#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))
#define CHECK(expression) do { if (!(expression)) return __LINE__; } while (0)

static volatile uint32_t wide_input;
static volatile int16_t signed_input;

/* Keep the reference independent of constant-multiply code generation. */
static __attribute__((noinline, optnone))
uint32_t reference_product(uint32_t value, uint32_t factor)
{
    uint32_t result = 0;
    while (factor) {
        if (factor & 1u)
            result += value;
        value += value;
        factor >>= 1;
    }
    return result;
}

#define FACTORS(X) \
    X(three, 3UL) \
    X(five, 5UL) \
    X(nine, 9UL) \
    X(fifteen, 15UL) \
    X(seventeen, 17UL) \
    X(negative_three, (uint32_t)-3L) \
    X(negative_fifteen, (uint32_t)-15L) \
    X(two, 2UL) \
    X(four, 4UL) \
    X(sixteen, 16UL) \
    X(byte_shift, 256UL) \
    X(word_shift, 65536UL) \
    X(sign_bit, 0x80000000UL) \
    X(word_minus_one, 65535UL) \
    X(word_plus_one, 65537UL) \
    X(large_shift_plus_one, 16777217UL) \
    X(over_budget, 31UL) \
    X(dense, 0x55555555UL)

#define DEFINE_PRODUCT(name, factor) \
    static NOINLINE uint32_t times_##name(uint32_t value) \
    { return value * (factor); }
FACTORS(DEFINE_PRODUCT)
#undef DEFINE_PRODUCT

static NOINLINE int16_t saturated_expression(int16_t b, uint16_t a)
{
    int32_t value = (int32_t)b * 3 + a;
    if (value > INT16_MAX)
        return INT16_MAX;
    if (value < INT16_MIN)
        return INT16_MIN;
    return (int16_t)value;
}

int avm_test_main(void)
{
    static const uint32_t patterns[] = {
        0, 1, 2, 3, 127, 128, 255, 256, 32767, 32768,
        65535, 65536, 65537, 0x7fffffffUL, 0x80000000UL,
        0x80000001UL, 0xffff0000UL, 0xfffffffeUL, 0xffffffffUL,
        0x55555555UL, 0xaaaaaaaaUL
    };
    /* Carries, wraparound, every bit position and its complement. */
    for (uint16_t i = 0; i < 85; ++i) {
        uint32_t value = i < 21 ? patterns[i] : 1UL << ((i - 21) / 2);
        if (i >= 21 && (i & 1u) == 0)
            value = ~value;
        wide_input = value;
#define CHECK_PRODUCT(name, factor) \
        CHECK(times_##name(wide_input) == reference_product(value, factor));
        FACTORS(CHECK_PRODUCT)
#undef CHECK_PRODUCT
    }

    static const int16_t signed_words[] = {
        -32768, -32767, -21846, -10923, -10922, -1, 0, 1,
        10922, 10923, 21845, 21846, 32766, 32767
    };
    static const uint16_t addends[] = {0, 1, 32767, 32768, 65535};
    for (uint8_t i = 0; i < sizeof(signed_words) / sizeof(signed_words[0]); ++i) {
        signed_input = signed_words[i];
        for (uint8_t j = 0; j < sizeof(addends) / sizeof(addends[0]); ++j) {
            int32_t expected = (int32_t)reference_product(
                (uint32_t)(int32_t)signed_input, 3) + addends[j];
            if (expected > INT16_MAX)
                expected = INT16_MAX;
            if (expected < INT16_MIN)
                expected = INT16_MIN;
            CHECK(saturated_expression(signed_input, addends[j]) == expected);
        }
    }

    test_puts("constant-multiply=ok\n");
    return 0;
}
