#include "math_test.h"
#include <errno.h>
#include <limits.h>

/* C23 classification, comparison, logb, and canonicalization interfaces. */

static uint32_t bits_of(float x)
{
    union { float f; uint32_t u; } v = { x };
    return v.u;
}

static int evaluations;

static float counted(float x)
{
    ++evaluations;
    return x;
}

_Static_assert(FP_INT_UPWARD != FP_INT_DOWNWARD && FP_INT_UPWARD != FP_INT_TOWARDZERO &&
               FP_INT_UPWARD != FP_INT_TONEARESTFROMZERO && FP_INT_UPWARD != FP_INT_TONEAREST &&
               FP_INT_DOWNWARD != FP_INT_TOWARDZERO && FP_INT_DOWNWARD != FP_INT_TONEARESTFROMZERO &&
               FP_INT_DOWNWARD != FP_INT_TONEAREST && FP_INT_TOWARDZERO != FP_INT_TONEARESTFROMZERO &&
               FP_INT_TOWARDZERO != FP_INT_TONEAREST && FP_INT_TONEARESTFROMZERO != FP_INT_TONEAREST,
               "fromfp rounding macros must be distinct");

int avm_test_main(void)
{
    volatile float qnan = from_bits(0x7fc00000UL);
    volatile float snan = from_bits(0x7fa00000UL);
    volatile float one = 1.0f;
    volatile float zero = 0.0f;
    volatile float nzero = -0.0f;
    volatile float least = from_bits(0x00000001UL);
    volatile float inf = from_bits(0x7f800000UL);

    /* Classification macros return nonzero exactly for their classes. */
    if (!issignaling(snan) || issignaling(qnan) || issignaling(one) || issignaling(inf)) return 1;
    if (!issubnormal(least) || issubnormal(zero) || issubnormal(one) || issubnormal(qnan)) return 2;
    if (!iszero(zero) || !iszero(nzero) || iszero(least) || iszero(qnan)) return 3;

    /* Every binary32 encoding is canonical, and the argument is evaluated once. */
    evaluations = 0;
    if (!iscanonical(counted(qnan)) || evaluations != 1) return 4;
    if (!iscanonical(snan) || !iscanonical(least)) return 5;

    /* iseqsig compares quietly for ordinary operands. A NaN operand is a domain error. */
    errno = 0;
    if (iseqsig(one, one) != 1 || errno != 0) return 6;
    if (iseqsig(one, zero) != 0 || iseqsig(zero, nzero) != 1) return 7;
    errno = 0;
    if (iseqsig(qnan, one) != 0 || errno != EDOM) return 8;
    errno = 0;
    if (iseqsig(one, snan) != 0 || errno != EDOM) return 9;

    /* llogb returns the exponent as long, with defined results for special values. */
    if (llogb(1.0) != 0 || llogbf(0.75f) != -1) return 10;
    if (llogbl(from_bits(0x4f000000UL)) != 31) return 11;
    if (llogbf(least) != -149 || llogbf(from_bits(0x00400000UL)) != -127) return 12;
    if (FP_LLOGB0 != LONG_MIN || FP_LLOGBNAN != LONG_MIN) return 13;
    errno = 0;
    if (llogbf(zero) != FP_LLOGB0 || errno != EDOM) return 14;
    errno = 0;
    if (llogbf(inf) != LONG_MAX || errno != EDOM) return 15;
    errno = 0;
    if (llogbf(qnan) != FP_LLOGBNAN || errno != EDOM) return 16;

    /* canonicalize copies canonical values and quiets signaling NaNs. */
    float out = 0.0f;
    float normal = 2.0f;
    if (canonicalizef(&out, &normal) != 0 || bits_of(out) != 0x40000000UL) return 17;
    if (canonicalizef(&out, (const float *)&snan) != 0 || bits_of(out) != 0x7fe00000UL) return 18;
    double dout = 0.0, din = 4.0;
    if (canonicalize(&dout, &din) != 0 || dout != 4.0) return 19;
    long double lout = 0.0L, lin = 8.0L;
    if (canonicalizel(&lout, &lin) != 0 || lout != 8.0L) return 20;
    double dsnan = (double)from_bits(0x7fa00000UL);
    if (canonicalize(&dout, &dsnan) != 0 || bits_of((float)dout) != 0x7fe00000UL) return 21;
    return 0;
}
