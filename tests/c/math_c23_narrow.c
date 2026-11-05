#include "math_test.h"
#include <errno.h>

/* Narrow-result operations round once to their named type. Range and pole errors
   set ERANGE, invalid results from non-NaN operands set EDOM, and infinite
   operands produce exact infinities without an error. */

static uint32_t bits_of(float x)
{
    union { float f; uint32_t u; } v = { x };
    return v.u;
}

static int expect_bits(float got, uint32_t want, int want_errno)
{
    return bits_of(got) != want || errno != want_errno;
}

static int expect_nan(float got, int want_errno)
{
    return (bits_of(got) & 0x7fffffffUL) <= 0x7f800000UL || errno != want_errno;
}

#define EXPECT_BITS(call, bits, err) do { errno = 0; if (expect_bits((call), (bits), (err))) return __LINE__; } while (0)
#define EXPECT_NAN(call, err) do { errno = 0; if (expect_nan((call), (err))) return __LINE__; } while (0)

int avm_test_main(void)
{
    const float inf = from_bits(0x7f800000UL);
    const float max_pow2 = from_bits(0x7f000000UL); /* 2^127 */

    /* Exact and correctly rounded binary32 results from double operands. */
    EXPECT_BITS(fadd(1.0, 2.0), 0x40400000UL, 0);
    EXPECT_BITS(fsub(1.0, 3.0), 0xc0000000UL, 0);
    EXPECT_BITS(fmul(0.5, 6.0), 0x40400000UL, 0);
    EXPECT_BITS(fdiv(1.0, 3.0), 0x3eaaaaabUL, 0);
    EXPECT_BITS(fadd(16777216.0, 1.0), 0x4b800000UL, 0); /* 2^24+1 ties to even */
    EXPECT_BITS(ffma(2.0, 3.0, 4.0), 0x41200000UL, 0);
    EXPECT_BITS(fsqrt(2.25), 0x3fc00000UL, 0);

    /* Range and pole errors return infinities and set ERANGE. */
    EXPECT_BITS(fmul(max_pow2, 2.0), 0x7f800000UL, ERANGE);
    EXPECT_BITS(fdiv(1.0, 0.0), 0x7f800000UL, ERANGE);
    EXPECT_BITS(fdiv(-1.0, 0.0), 0xff800000UL, ERANGE);

    /* Invalid results from non-NaN operands are NaNs and set EDOM. */
    EXPECT_NAN(fdiv(0.0, 0.0), EDOM);
    EXPECT_NAN(fsqrt(-1.0), EDOM);
    EXPECT_NAN(fadd(inf, -inf), EDOM);
    EXPECT_NAN(fmul(inf, 0.0), EDOM);

    /* Infinite operands and NaN operands propagate without a new error. */
    EXPECT_BITS(fadd(inf, 1.0), 0x7f800000UL, 0);
    EXPECT_NAN(fmul(from_bits(0x7fc00000UL), 1.0), 0);

    /* Long double operands select the l and d result types; values match. */
    EXPECT_BITS(faddl(1.5L, 2.25L), 0x40700000UL, 0);
    EXPECT_BITS(fdivl(1.0L, 4.0L), 0x3e800000UL, 0);
    EXPECT_BITS(fmull(1.5L, 2.0L), 0x40400000UL, 0);
    EXPECT_BITS(fsqrtl(2.25L), 0x3fc00000UL, 0);
    EXPECT_BITS(ffmal(2.0L, 3.0L, 4.0L), 0x41200000UL, 0);

    {
        errno = 0;
        double sum = daddl(1.5L, 2.25L);
        if (bits_of((float)sum) != 0x40700000UL || errno != 0) return __LINE__;
        errno = 0;
        double quotient = ddivl(1.0L, 8.0L);
        if (bits_of((float)quotient) != 0x3e000000UL || errno != 0) return __LINE__;
        errno = 0;
        double root = dsqrtl(2.25L);
        if (bits_of((float)root) != 0x3fc00000UL || errno != 0) return __LINE__;
        errno = 0;
        double fused = dfmal(2.0L, 3.0L, 4.0L);
        if (bits_of((float)fused) != 0x41200000UL || errno != 0) return __LINE__;
    }
    return 0;
}
