#include <avm/pgmspace.h>
#include <stdint.h>

#include "test_hex_output.h"

extern uint32_t __avm_ashlsi3(uint32_t, uint32_t);
extern uint32_t __avm_lshrsi3(uint32_t, uint32_t);
extern int32_t __avm_ashrsi3(int32_t, uint32_t);

#define NOINLINE __attribute__((noinline))
#define CHECK(condition) do {                                      \
    if (!(condition)) { test_line16("FAIL", __LINE__); return 1; }  \
} while (0)

typedef union {
    uint32_t value;
    struct {
        uint16_t low, high;
    } words;
} words32;

static const uint32_t AVM_PROGMEM values[] = {
    UINT32_C(0), UINT32_C(1), UINT32_MAX,
    UINT32_C(0x80000000), UINT32_C(0x7fffffff),
    UINT32_C(0x0000ffff), UINT32_C(0xffff0000),
    UINT32_C(0x00010000), UINT32_C(0x80008000),
    UINT32_C(0x5555aaaa), UINT32_C(0xaaaa5555),
    UINT32_C(0x01234567), UINT32_C(0x89abcdef)
};

static const uint32_t AVM_PROGMEM large_counts[] = {
    32, 33, 63, 255, 256, 65535,
    UINT32_C(0x10000), UINT32_C(0x10001),
    UINT32_C(0x10010), UINT32_C(0x1001f), UINT32_C(0x10020),
    UINT32_C(0x80000000), UINT32_MAX
};

/* Also exercise compiler-generated calls with runtime counts. */
static NOINLINE uint32_t source_left(uint32_t value, uint32_t count)
{
    return value << count;
}

static NOINLINE uint32_t source_logical(uint32_t value, uint32_t count)
{
    return value >> count;
}

static NOINLINE int32_t source_arithmetic(int32_t value, uint32_t count)
{
    return value >> count;
}

/* Each switch arm keeps the source shift count literal. */
#define SHIFT_CASE(N, OP) case N: return value OP N
#define SHIFT_CASES(OP) \
    SHIFT_CASE(0, OP); SHIFT_CASE(1, OP); SHIFT_CASE(2, OP); SHIFT_CASE(3, OP); \
    SHIFT_CASE(4, OP); SHIFT_CASE(5, OP); SHIFT_CASE(6, OP); SHIFT_CASE(7, OP); \
    SHIFT_CASE(8, OP); SHIFT_CASE(9, OP); SHIFT_CASE(10, OP); SHIFT_CASE(11, OP); \
    SHIFT_CASE(12, OP); SHIFT_CASE(13, OP); SHIFT_CASE(14, OP); SHIFT_CASE(15, OP); \
    SHIFT_CASE(16, OP); SHIFT_CASE(17, OP); SHIFT_CASE(18, OP); SHIFT_CASE(19, OP); \
    SHIFT_CASE(20, OP); SHIFT_CASE(21, OP); SHIFT_CASE(22, OP); SHIFT_CASE(23, OP); \
    SHIFT_CASE(24, OP); SHIFT_CASE(25, OP); SHIFT_CASE(26, OP); SHIFT_CASE(27, OP); \
    SHIFT_CASE(28, OP); SHIFT_CASE(29, OP); SHIFT_CASE(30, OP); SHIFT_CASE(31, OP)

static NOINLINE uint32_t constant_left(uint32_t value, uint16_t count)
{
    switch (count) { SHIFT_CASES(<<); }
    return 0;
}

static NOINLINE uint32_t constant_logical(uint32_t value, uint16_t count)
{
    switch (count) { SHIFT_CASES(>>); }
    return 0;
}

static NOINLINE int32_t constant_arithmetic(int32_t value, uint16_t count)
{
    switch (count) { SHIFT_CASES(>>); }
    return 0;
}

#undef SHIFT_CASES
#undef SHIFT_CASE

static NOINLINE int check_value(uint32_t value)
{
    words32 left = {.value = value};
    words32 logical = {.value = value};
    words32 arithmetic = {.value = value};

    for (uint16_t n = 0; n <= 33; ++n) {
        CHECK(__avm_ashlsi3(value, n) == left.value);
        CHECK(__avm_lshrsi3(value, n) == logical.value);
        CHECK((uint32_t)__avm_ashrsi3((int32_t)value, n) == arithmetic.value);
        if (n < 32) {
            CHECK(source_left(value, n) == left.value);
            CHECK(source_logical(value, n) == logical.value);
            CHECK((uint32_t)source_arithmetic((int32_t)value, n) ==
                  arithmetic.value);

            CHECK(constant_left(value, n) == left.value);
            CHECK(constant_logical(value, n) == logical.value);
            CHECK((uint32_t)constant_arithmetic((int32_t)value, n) ==
                  arithmetic.value);
        }

        /* Independent single-bit reference, without variable 32-bit shifts. */
        left.words.high = (uint16_t)((left.words.high << 1) |
                                    (left.words.low >> 15));
        left.words.low = (uint16_t)(left.words.low << 1);
        logical.words.low = (uint16_t)((logical.words.low >> 1) |
                                      (logical.words.high << 15));
        logical.words.high >>= 1;
        arithmetic.words.low = (uint16_t)((arithmetic.words.low >> 1) |
                                         (arithmetic.words.high << 15));
        arithmetic.words.high = (uint16_t)((int16_t)arithmetic.words.high >> 1);
    }

    uint32_t fill = (int32_t)value < 0 ? UINT32_MAX : 0;
    for (uint16_t i = 0; i < sizeof(large_counts) / sizeof(large_counts[0]); ++i) {
        uint32_t n = large_counts[i];
        CHECK(__avm_ashlsi3(value, n) == 0);
        CHECK(__avm_lshrsi3(value, n) == 0);
        CHECK((uint32_t)__avm_ashrsi3((int32_t)value, n) == fill);
    }
    return 0;
}

int avm_test_main(void)
{
    for (uint16_t i = 0; i < sizeof(values) / sizeof(values[0]); ++i)
        CHECK(check_value(values[i]) == 0);

    /* Every bit must cross the word boundary and shift out correctly. */
    words32 bit = {.value = 1};
    for (uint16_t i = 0; i < 32; ++i) {
        CHECK(check_value(bit.value) == 0);
        CHECK(check_value(~bit.value) == 0);
        bit.words.high = (uint16_t)((bit.words.high << 1) | (bit.words.low >> 15));
        bit.words.low = (uint16_t)(bit.words.low << 1);
    }
    return 0;
}
