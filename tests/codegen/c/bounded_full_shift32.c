#include <avm.h>
#include <stdint.h>
#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))
#define CHECK(condition) do {                                     \
    if (!(condition)) { test_line16("FAIL", __LINE__); return 1; } \
} while (0)

#define SHIFTS(SUFFIX, BOUND)                                      \
static NOINLINE uint32_t left_##SUFFIX(uint32_t x, uint32_t n)      \
{ return x << (BOUND); }                                          \
static NOINLINE uint32_t logical_##SUFFIX(uint32_t x, uint32_t n)   \
{ return x >> (BOUND); }                                          \
static NOINLINE int32_t arithmetic_##SUFFIX(int32_t x, uint32_t n)  \
{ return x >> (BOUND); }

SHIFTS(small, n & 15u)
SHIFTS(nonzero, (n & 15u) | 1u)
SHIFTS(large, (n & 15u) | 16u)
SHIFTS(full, n & 31u)

static NOINLINE uint32_t signed_word(int16_t x, uint32_t n)
{
    return (uint32_t)(int32_t)x << (n & 15u);
}

static NOINLINE int32_t arithmetic_word(int16_t x, uint32_t n)
{
    return (int32_t)x >> (n & 31u);
}

static NOINLINE int check(uint32_t x)
{
    /* An independent reference advances each result by one constant bit. */
    uint32_t left = x, logical = x;
    int32_t arithmetic = (int32_t)x;
    int32_t word_arithmetic = (int16_t)x;
    uint32_t word_left = (uint32_t)(int32_t)(int16_t)x;
    for (uint16_t n = 0; n < 32; ++n) {
        uint32_t dirty_count = 0xffffffe0UL | n;
        CHECK(left_full(x, dirty_count) == left);
        CHECK(logical_full(x, dirty_count) == logical);
        CHECK(arithmetic_full((int32_t)x, dirty_count) == arithmetic);
        CHECK(arithmetic_word((int16_t)x, dirty_count) == word_arithmetic);
        if (n < 16) {
            CHECK(left_small(x, dirty_count) == left);
            CHECK(logical_small(x, dirty_count) == logical);
            CHECK(arithmetic_small((int32_t)x, dirty_count) == arithmetic);
            CHECK(signed_word((int16_t)x, dirty_count) == word_left);
            if (n & 1) {
                CHECK(left_nonzero(x, dirty_count) == left);
                CHECK(logical_nonzero(x, dirty_count) == logical);
                CHECK(arithmetic_nonzero((int32_t)x, dirty_count) == arithmetic);
            }
        } else {
            CHECK(left_large(x, dirty_count) == left);
            CHECK(logical_large(x, dirty_count) == logical);
            CHECK(arithmetic_large((int32_t)x, dirty_count) == arithmetic);
        }
        left <<= 1;
        logical >>= 1;
        arithmetic >>= 1;
        word_arithmetic >>= 1;
        word_left <<= 1;
    }
    return 0;
}

int avm_test_main(void)
{
    CHECK(check(0) == 0);
    CHECK(check(UINT32_MAX) == 0);
    CHECK(check(0x01234567UL) == 0);
    CHECK(check(0x89abcdefUL) == 0);
    CHECK(check(0x5555aaaaUL) == 0);
    uint32_t bit = 1;
    for (uint16_t i = 0; i < 32; ++i) {
        CHECK(check(bit) == 0);
        CHECK(check(~bit) == 0);
        bit <<= 1;
    }
    return 0;
}
