/* ef_sqrtf.c -- float version of e_sqrt.c.
 * Conversion to float by Ian Lance Taylor, Cygnus Support, ian@cygnus.com.
 */

/*
 * ====================================================
 * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
 *
 * Developed at SunPro, a Sun Microsystems, Inc. business.
 * Permission to use, copy, modify, and distribute this
 * software is freely granted, provided that this notice 
 * is preserved.
 * ====================================================
 */

#include "fdlibm.h"
#include "sqrt_table.h"
#ifdef __AVM__
#include <avm/pgmspace.h>
#endif

/* Table interpolation; exponent scaling is exact. Exhaustive significand,
   parity and subnormal tests enforce the two-ULP acceptance bound. */
float __ieee754_sqrtf(float x)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint32_t magnitude = bits & 0x7fffffffUL;
    if (magnitude == 0) return x;
    if (bits >> 31) {
        SET_FLOAT_WORD(x, 0x7fc00000UL);
        return x;
    }
    if (magnitude >= 0x7f800000UL) return x+x;
    int exponent_adjust = 0;
    if (magnitude < 0x00800000UL) {
        x *= 0x1p24f;
        GET_FLOAT_WORD(bits, x);
        exponent_adjust = -24;
    }
    int exponent = (int)(bits >> 23) - 127 + exponent_adjust;
    uint32_t normalized = (bits & 0x007fffffUL) |
                          (0x3f800000UL + ((uint32_t)(exponent & 1) << 23));
    uint16_t index = (uint16_t)((normalized - 0x3f800000UL) >> (23-AVM_SQRT_INTERVAL_BITS));
    float coefficients[AVM_SQRT_DEGREE+1];
#ifdef __AVM__
    /* Keep one uninterrupted program-space read. Without this dependency,
       scalar replacement turns the copy back into three separate LDP32s. */
    uint16_t coefficient_bytes = sizeof(coefficients);
    __asm__("" : "+r"(coefficient_bytes));
    /* The complete byte offset fits in a native word (at most 8184). */
    uint16_t offset = index * sizeof(sqrt_table[0]);
    memcpy_P(coefficients, (const char AVM_PROGMEM *)sqrt_table + offset,
             coefficient_bytes);
#else
    for (unsigned i = 0; i < AVM_SQRT_DEGREE+1; ++i) coefficients[i] = sqrt_table[index][i];
#endif
    float a, r;
    SET_FLOAT_WORD(a, normalized);
    float bucket;
    SET_FLOAT_WORD(bucket, normalized & ~((1UL << (23-AVM_SQRT_INTERVAL_BITS))-1));
    float t = a-bucket;
#if AVM_SQRT_DEGREE == 1
    r = coefficients[0] + t*coefficients[1];
#else
    r = coefficients[0] + t*(coefficients[1] + t*coefficients[2]);
#endif

    uint32_t root_bits;
    GET_FLOAT_WORD(root_bits, r);
    root_bits += (uint32_t)(int32_t)(exponent >> 1) << 23;
    SET_FLOAT_WORD(r, root_bits);
    return r;
}
