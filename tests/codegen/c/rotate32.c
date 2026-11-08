#include <avm/pgmspace.h>
#include <stdint.h>

#include "test_hex_output.h"

extern uint32_t __avm_rotlsi3(uint32_t, uint16_t);
extern uint32_t __avm_rotrsi3(uint32_t, uint16_t);

#define NOINLINE __attribute__((noinline))
#define CHECK(condition) do {                                      \
    if (!(condition)) { test_line16("FAIL", __LINE__); return 1; }  \
} while (0)

typedef union {
    uint32_t value;
    struct { uint16_t low, high; } words;
} words32;

static const uint32_t AVM_PROGMEM values[] = {
    0, 1, UINT32_MAX, UINT32_C(0x80000000), UINT32_C(0x7fffffff),
    UINT32_C(0x0000ffff), UINT32_C(0xffff0000), UINT32_C(0x00010000),
    UINT32_C(0x80008000), UINT32_C(0x5555aaaa), UINT32_C(0xaaaa5555),
    UINT32_C(0x01234567), UINT32_C(0x89abcdef)
};

static const uint32_t AVM_PROGMEM large_counts[] = {
    255, 256, 65535, UINT32_C(0x10000), UINT32_C(0x10001),
    UINT32_C(0x10010), UINT32_C(0x1001f), UINT32_C(0x80000000), UINT32_MAX
};

static NOINLINE uint32_t builtin_left(uint32_t value, uint32_t count)
{
    return __builtin_rotateleft32(value, count);
}

static NOINLINE uint32_t builtin_right(uint32_t value, uint32_t count)
{
    return __builtin_rotateright32(value, count);
}

static NOINLINE uint32_t masked_left(uint32_t value, uint32_t count)
{
    return (value << (count & 31)) | (value >> ((0ul - count) & 31));
}

static NOINLINE uint32_t masked_right(uint32_t value, uint32_t count)
{
    return (value >> (count & 31)) | (value << ((0ul - count) & 31));
}

/* Match the benchmark's byte count and unmasked complementary count. */
static NOINLINE uint32_t source_left(uint32_t value, uint8_t count)
{
    return (value << count) | (value >> (32u - count));
}

static NOINLINE uint32_t source_right(uint32_t value, uint8_t count)
{
    return (value >> count) | (value << (32u - count));
}

#define ROTATE_CASE(N, DIR) case N: return __builtin_rotate##DIR##32(value, N)
#define ROTATE_CASES(DIR) \
    ROTATE_CASE(0, DIR); ROTATE_CASE(1, DIR); ROTATE_CASE(2, DIR); ROTATE_CASE(3, DIR); \
    ROTATE_CASE(4, DIR); ROTATE_CASE(5, DIR); ROTATE_CASE(6, DIR); ROTATE_CASE(7, DIR); \
    ROTATE_CASE(8, DIR); ROTATE_CASE(9, DIR); ROTATE_CASE(10, DIR); ROTATE_CASE(11, DIR); \
    ROTATE_CASE(12, DIR); ROTATE_CASE(13, DIR); ROTATE_CASE(14, DIR); ROTATE_CASE(15, DIR); \
    ROTATE_CASE(16, DIR); ROTATE_CASE(17, DIR); ROTATE_CASE(18, DIR); ROTATE_CASE(19, DIR); \
    ROTATE_CASE(20, DIR); ROTATE_CASE(21, DIR); ROTATE_CASE(22, DIR); ROTATE_CASE(23, DIR); \
    ROTATE_CASE(24, DIR); ROTATE_CASE(25, DIR); ROTATE_CASE(26, DIR); ROTATE_CASE(27, DIR); \
    ROTATE_CASE(28, DIR); ROTATE_CASE(29, DIR); ROTATE_CASE(30, DIR); ROTATE_CASE(31, DIR)

static NOINLINE uint32_t constant_left(uint32_t value, uint16_t count)
{
    switch (count) { ROTATE_CASES(left); }
    return 0;
}

static NOINLINE uint32_t constant_right(uint32_t value, uint16_t count)
{
    switch (count) { ROTATE_CASES(right); }
    return 0;
}

/* Independent single-bit reference, using only constant word shifts. */
static NOINLINE uint32_t reference_left(uint32_t value)
{
    words32 bits = {.value = value};
    uint16_t high = bits.words.high;
    bits.words.high = (uint16_t)((high << 1) | (bits.words.low >> 15));
    bits.words.low = (uint16_t)((bits.words.low << 1) | (high >> 15));
    return bits.value;
}

static NOINLINE uint32_t reference_right(uint32_t value)
{
    words32 bits = {.value = value};
    uint16_t low = bits.words.low;
    bits.words.low = (uint16_t)((low >> 1) | (bits.words.high << 15));
    bits.words.high = (uint16_t)((bits.words.high >> 1) | (low << 15));
    return bits.value;
}

static NOINLINE int check_value(uint32_t value)
{
    uint32_t left = value, right = value;
    for (uint16_t n = 0; n < 64; ++n) {
        CHECK(__avm_rotlsi3(value, n) == left);
        CHECK(__avm_rotrsi3(value, n) == right);
        CHECK(builtin_left(value, n) == left);
        CHECK(builtin_right(value, n) == right);
        CHECK(masked_left(value, n) == left);
        CHECK(masked_right(value, n) == right);
        if (n < 32) {
            CHECK(constant_left(value, n) == left);
            CHECK(constant_right(value, n) == right);
            if (n != 0) {
                CHECK(source_left(value, (uint8_t)n) == left);
                CHECK(source_right(value, (uint8_t)n) == right);
            }
        }
        left = reference_left(left);
        right = reference_right(right);
    }

    for (uint16_t i = 0; i < sizeof(large_counts) / sizeof(large_counts[0]); ++i) {
        uint32_t n = large_counts[i];
        left = right = value;
        for (uint16_t j = 0; j < (uint16_t)(n & 31); ++j) {
            left = reference_left(left);
            right = reference_right(right);
        }
        CHECK(__avm_rotlsi3(value, (uint16_t)n) == left);
        CHECK(__avm_rotrsi3(value, (uint16_t)n) == right);
        CHECK(builtin_left(value, n) == left);
        CHECK(builtin_right(value, n) == right);
        CHECK(masked_left(value, n) == left);
        CHECK(masked_right(value, n) == right);
    }
    return 0;
}

int avm_test_main(void)
{
    for (uint16_t i = 0; i < sizeof(values) / sizeof(values[0]); ++i)
        CHECK(check_value(values[i]) == 0);
    uint32_t bit = 1;
    for (uint16_t i = 0; i < 32; ++i) {
        CHECK(check_value(bit) == 0);
        CHECK(check_value(~bit) == 0);
        bit = reference_left(bit);
    }
    return 0;
}
