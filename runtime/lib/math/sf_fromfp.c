#include "rint_kernel.h"

/* 2^k for 0 <= k <= 127 is an exact binary32 power of two. */
static inline float avm_pow2(unsigned k)
{
    float power;
    SET_FLOAT_WORD(power, (uint32_t)(127U + k) << 23);
    return power;
}

/* r is integral after rounding and must be finite. A signed width w accepts
   [-2^(w-1), 2^(w-1)-1], and an unsigned width w accepts [0, 2^w-1]. Bounds
   beyond the binary32 range contain every finite value. */
static inline int avm_fromfp_fits(float r, unsigned width, int is_unsigned)
{
    if (!avm_math_finite(r)) return 0;
    if (is_unsigned) return r >= 0.0f && (width >= 128U || r < avm_pow2(width));
    unsigned k = width - 1U;
    return k >= 128U || (r >= -avm_pow2(k) && r < avm_pow2(k));
}

/* Round with the named direction, then range-check against the width. A zero
   width, a NaN, an infinity, or an out-of-range integer is a domain error. */
static float avm_fromfp(float x, int rnd, unsigned int width, int is_unsigned)
{
    float rounded;
    switch (rnd) {
    case FP_INT_UPWARD: rounded = ceilf(x); break;
    case FP_INT_DOWNWARD: rounded = floorf(x); break;
    case FP_INT_TOWARDZERO: rounded = truncf(x); break;
    case FP_INT_TONEARESTFROMZERO: rounded = avm_round_away(x); break;
    default: rounded = avm_rint(x); break; /* FP_INT_TONEAREST and unspecified values */
    }
    if (width != 0 && avm_fromfp_fits(rounded, width, is_unsigned)) return rounded;
    errno = EDOM;
    SET_FLOAT_WORD(rounded, 0x7fc00000UL);
    return rounded;
}

float fromfpf(float x, int rnd, unsigned int width)
{
    return avm_fromfp(x, rnd, width, 0);
}

float ufromfpf(float x, int rnd, unsigned int width)
{
    return avm_fromfp(x, rnd, width, 1);
}

/* AVM has no floating-point exception flags, so the x forms cannot raise the
   inexact exception. Their values and domain errors match the plain forms. */
float fromfpxf(float x, int rnd, unsigned int width)
{
    return avm_fromfp(x, rnd, width, 0);
}

float ufromfpxf(float x, int rnd, unsigned int width)
{
    return avm_fromfp(x, rnd, width, 1);
}
