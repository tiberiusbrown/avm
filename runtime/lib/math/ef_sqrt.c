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

/* Table interpolation followed by an exact midpoint test. All arithmetic in
   the test is near one, so neither overflow nor subnormal arithmetic occurs. */
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
    uint16_t index = (uint16_t)((normalized - 0x3f800000UL) >> 17);
    float coefficients[3];
#ifdef __AVM__
    /* Keep one uninterrupted program-space read. Without this dependency,
       scalar replacement turns the copy back into three separate LDP32s. */
    uint16_t coefficient_bytes = sizeof(coefficients);
    __asm__("" : "+r"(coefficient_bytes));
    /* The complete byte offset fits in a native word (at most 1524). */
    uint16_t offset = index * sizeof(sqrt_table[0]);
    memcpy_P(coefficients, (const char AVM_PROGMEM *)sqrt_table + offset,
             coefficient_bytes);
#else
    for (unsigned i = 0; i < 3; ++i) coefficients[i] = sqrt_table[index][i];
#endif
    float a, r;
    SET_FLOAT_WORD(a, normalized);
    /* Quadratic interpolation at the left, middle and right of each of
       64 intervals per exponent has error below 0.137 ULP. Rounded table
       entries and arithmetic keep the total below 1.16 ULP, so the
       candidate is within one float of the correctly rounded root.
       a-bucket is exact by Sterbenz's lemma; no product is subnormal. */
    float bucket;
    SET_FLOAT_WORD(bucket, normalized & 0xfffe0000UL);
    float t = a-bucket;
    r = coefficients[0] + t*(coefficients[1] + t*coefficients[2]);

    /* Dekker's product error: r*r = product + error exactly. Splitting the
       24-bit significand into 12-bit parts makes the partial products exact. */
    uint32_t root_bits;
    GET_FLOAT_WORD(root_bits, r);
    if (root_bits == 0x40000000UL) {
        /* a < 4: even the largest a is below the midpoint that rounds to 2. */
        --root_bits;
    } else {
        float high;
        SET_FLOAT_WORD(high, root_bits & 0xfffff000UL);
        float low = r-high;
        float product = r*r;
        float error = ((high*high-product) + (high+high)*low) + low*low;
        float difference = a-product;
        /* All interior roots are in [1,2), with the same exact ULP. At r=1,
           a>=1 makes the lower test false even with this wider lower step. */
        float upper = (difference-r*0x1p-23f)-error;
        float lower = (difference+r*0x1p-23f)-error;
        if (upper > 0x1p-48f) ++root_bits;
        else if (lower < 0x1p-48f) --root_bits;
    }
    root_bits += (uint32_t)(int32_t)(exponent >> 1) << 23;
    SET_FLOAT_WORD(r, root_bits);
    return r;
}
