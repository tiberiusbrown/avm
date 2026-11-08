/* C23 type-generic <stdbit.h> macros accept unsigned bit-precise types whose
 * width matches a standard unsigned type. Each such argument must give the
 * result of the standard type with that width: 8, 16, 32 and 64 bits. */

#include <stdbit.h>
#include <stdbool.h>
#include "test_hex_output.h"

#define CHECK(expr) do { if (!(expr)) { test_line16("LINE", (uint16_t)__LINE__); return 1; } } while (0)

/* Compares every macro for one bit-precise value and its standard twin. Each
 * value is a function of its own, so that its frame stays within the AVM stack. */
#define STDBIT_SAME(NAME, BT, ST, VALUE)                                      \
    static int NAME(void)                                                     \
    {                                                                         \
        BT b = (BT)(VALUE);                                                   \
        ST s = (ST)(VALUE);                                                   \
        CHECK(stdc_leading_zeros(b) == stdc_leading_zeros(s));                \
        CHECK(stdc_leading_ones(b) == stdc_leading_ones(s));                  \
        CHECK(stdc_trailing_zeros(b) == stdc_trailing_zeros(s));              \
        CHECK(stdc_trailing_ones(b) == stdc_trailing_ones(s));                \
        CHECK(stdc_first_leading_zero(b) == stdc_first_leading_zero(s));      \
        CHECK(stdc_first_leading_one(b) == stdc_first_leading_one(s));        \
        CHECK(stdc_first_trailing_zero(b) == stdc_first_trailing_zero(s));    \
        CHECK(stdc_first_trailing_one(b) == stdc_first_trailing_one(s));      \
        CHECK(stdc_count_zeros(b) == stdc_count_zeros(s));                    \
        CHECK(stdc_count_ones(b) == stdc_count_ones(s));                      \
        CHECK(stdc_has_single_bit(b) == stdc_has_single_bit(s));              \
        CHECK(stdc_bit_width(b) == stdc_bit_width(s));                        \
        CHECK(stdc_bit_floor(b) == (BT)stdc_bit_floor(s));                    \
        CHECK(stdc_bit_ceil(b) == (BT)stdc_bit_ceil(s));                      \
        return 0;                                                             \
    }

/* The result types follow the argument, as the standard requires. */
_Static_assert(_Generic(stdc_bit_floor((unsigned _BitInt(8))3),
                        unsigned _BitInt(8): 1, default: 0), "floor type 8");
_Static_assert(_Generic(stdc_bit_ceil((unsigned _BitInt(16))3),
                        unsigned _BitInt(16): 1, default: 0), "ceil type 16");
_Static_assert(_Generic(stdc_bit_floor((unsigned _BitInt(32))3),
                        unsigned _BitInt(32): 1, default: 0), "floor type 32");
_Static_assert(_Generic(stdc_bit_ceil((unsigned _BitInt(64))3),
                        unsigned _BitInt(64): 1, default: 0), "ceil type 64");
_Static_assert(_Generic(stdc_has_single_bit((unsigned _BitInt(16))3),
                        bool: 1, default: 0), "predicate type 16");
_Static_assert(_Generic(stdc_bit_width((unsigned _BitInt(64))3),
                        unsigned int: 1, default: 0), "width type 64");

STDBIT_SAME(stdbit_w8_1, unsigned _BitInt(8), unsigned char, 0)
STDBIT_SAME(stdbit_w8_2, unsigned _BitInt(8), unsigned char, 1)
STDBIT_SAME(stdbit_w8_3, unsigned _BitInt(8), unsigned char, 0x2A)
STDBIT_SAME(stdbit_w8_4, unsigned _BitInt(8), unsigned char, 0x80)
STDBIT_SAME(stdbit_w8_5, unsigned _BitInt(8), unsigned char, 0xFE)
STDBIT_SAME(stdbit_w8_6, unsigned _BitInt(8), unsigned char, 0xFF)

STDBIT_SAME(stdbit_w16_1, unsigned _BitInt(16), unsigned short, 0)
STDBIT_SAME(stdbit_w16_2, unsigned _BitInt(16), unsigned short, 1)
STDBIT_SAME(stdbit_w16_3, unsigned _BitInt(16), unsigned short, 0x0300)
STDBIT_SAME(stdbit_w16_4, unsigned _BitInt(16), unsigned short, 0x8001)
STDBIT_SAME(stdbit_w16_5, unsigned _BitInt(16), unsigned short, 0xFFF0)
STDBIT_SAME(stdbit_w16_6, unsigned _BitInt(16), unsigned short, 0xFFFF)

STDBIT_SAME(stdbit_w32_1, unsigned _BitInt(32), unsigned long, 0UL)
STDBIT_SAME(stdbit_w32_2, unsigned _BitInt(32), unsigned long, 1UL)
STDBIT_SAME(stdbit_w32_3, unsigned _BitInt(32), unsigned long, 0x00100000UL)
STDBIT_SAME(stdbit_w32_4, unsigned _BitInt(32), unsigned long, 0x80000001UL)
STDBIT_SAME(stdbit_w32_5, unsigned _BitInt(32), unsigned long, 0xFFFF0000UL)
STDBIT_SAME(stdbit_w32_6, unsigned _BitInt(32), unsigned long, 0xFFFFFFFFUL)

STDBIT_SAME(stdbit_w64_1, unsigned _BitInt(64), unsigned long long, 0ULL)
STDBIT_SAME(stdbit_w64_2, unsigned _BitInt(64), unsigned long long, 1ULL)
STDBIT_SAME(stdbit_w64_3, unsigned _BitInt(64), unsigned long long, 0x0000000100000000ULL)
STDBIT_SAME(stdbit_w64_4, unsigned _BitInt(64), unsigned long long, 0x8000000000000001ULL)
STDBIT_SAME(stdbit_w64_5, unsigned _BitInt(64), unsigned long long, 0xFFFFFFFF00000000ULL)
STDBIT_SAME(stdbit_w64_6, unsigned _BitInt(64), unsigned long long, 0xFFFFFFFFFFFFFFFFULL)

/* Known results, independent of the standard-type twins. */
static int stdbit_known(void)
{
    CHECK(stdc_leading_zeros((unsigned _BitInt(8))1) == 7);
    CHECK(stdc_leading_zeros((unsigned _BitInt(64))1) == 63);
    CHECK(stdc_count_ones((unsigned _BitInt(32))0xF0F0F0F0UL) == 16);
    CHECK(stdc_bit_floor((unsigned _BitInt(16))0x1234) == 0x1000);
    CHECK(stdc_bit_ceil((unsigned _BitInt(16))0x1001) == 0x2000);
    return 0;
}

int avm_test_main(void)
{
    if (stdbit_w8_1())
        return 1;
    if (stdbit_w8_2())
        return 1;
    if (stdbit_w8_3())
        return 1;
    if (stdbit_w8_4())
        return 1;
    if (stdbit_w8_5())
        return 1;
    if (stdbit_w8_6())
        return 1;
    if (stdbit_w16_1())
        return 1;
    if (stdbit_w16_2())
        return 1;
    if (stdbit_w16_3())
        return 1;
    if (stdbit_w16_4())
        return 1;
    if (stdbit_w16_5())
        return 1;
    if (stdbit_w16_6())
        return 1;
    if (stdbit_w32_1())
        return 1;
    if (stdbit_w32_2())
        return 1;
    if (stdbit_w32_3())
        return 1;
    if (stdbit_w32_4())
        return 1;
    if (stdbit_w32_5())
        return 1;
    if (stdbit_w32_6())
        return 1;
    if (stdbit_w64_1())
        return 1;
    if (stdbit_w64_2())
        return 1;
    if (stdbit_w64_3())
        return 1;
    if (stdbit_w64_4())
        return 1;
    if (stdbit_w64_5())
        return 1;
    if (stdbit_w64_6())
        return 1;
    return stdbit_known();
}
