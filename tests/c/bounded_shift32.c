#include <stdint.h>

#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))
#define CHECK(condition) do {                                      \
    if (!(condition)) { test_line16("FAIL", __LINE__); return 1; }  \
} while (0)

typedef union {
    uint32_t value;
    struct { uint16_t low, high; } words;
} words32;

static NOINLINE uint32_t shift7(uint16_t value, uint16_t count)
{
    return (uint32_t)value << (count & 7u);
}

static NOINLINE uint32_t shift15(uint16_t value, uint32_t count)
{
    return (uint32_t)value << (count & 15u);
}

static NOINLINE uint32_t shift_nonzero(uint16_t value, uint16_t count)
{
    return (uint32_t)value << ((count & 15u) | 1u);
}

static NOINLINE uint32_t shift_masked(uint32_t value, uint32_t count)
{
    return (value & UINT32_C(65535)) << (count & 15u);
}

static NOINLINE uint32_t shift_byte(uint8_t value, uint16_t count)
{
    return (uint32_t)value << (count & 7u);
}

static NOINLINE uint32_t shift_self(uint16_t value)
{
    return (uint32_t)value << (value & 7u);
}

/* Independent word-at-a-time reference with only constant one-bit shifts. */
static NOINLINE uint32_t reference(uint16_t value, uint16_t count)
{
    words32 result = {.value = value};
    while (count--) {
        result.words.high = (uint16_t)((result.words.high << 1) |
                                       (result.words.low >> 15));
        result.words.low = (uint16_t)(result.words.low << 1);
    }
    return result.value;
}

static NOINLINE int check_word(uint16_t value)
{
    for (uint16_t n = 0; n < 16; ++n) {
        uint32_t expected = reference(value, n);
        CHECK(shift15(value, n) == expected);
        CHECK(shift15(value, UINT32_C(0xfffffff0) | n) == expected);
        CHECK(shift_nonzero(value, n) == reference(value, n | 1u));
        CHECK(shift_masked(UINT32_C(0xa5a50000) | value,
                           UINT32_C(0xfffffff0) | n) == expected);
        CHECK(shift7(value, n) == reference(value, n & 7u));
        CHECK(shift_byte((uint8_t)value, n) ==
              reference((uint8_t)value, n & 7u));
    }
    CHECK(shift_self(value) == reference(value, value & 7u));
    return 0;
}

int avm_test_main(void)
{
    CHECK(check_word(0) == 0);
    CHECK(check_word(UINT16_MAX) == 0);
    CHECK(check_word(0x5555) == 0);
    CHECK(check_word(0xaaaa) == 0);
    uint16_t bit = 1;
    for (uint16_t i = 0; i < 16; ++i) {
        CHECK(check_word(bit) == 0);
        CHECK(check_word((uint16_t)~bit) == 0);
        bit = (uint16_t)(bit << 1);
    }
    /* Exercise all byte inputs, and every count in the benchmark's mask. */
    for (uint16_t value = 0; value < 256; ++value) {
        for (uint16_t n = 0; n < 8; ++n)
            CHECK(shift_byte((uint8_t)value, n) == reference(value, n));
        CHECK(shift_self(value) == reference(value, value & 7u));
    }
    return 0;
}
