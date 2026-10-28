#ifndef AVM_LOG_KERNEL_H
#define AVM_LOG_KERNEL_H
/* ef_log.c -- float version of e_log.c.
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
#include "fpoly.h"

/* Callers classify once, then share normalization and the mantissa kernel. */
static __attribute__((always_inline)) inline float avm_log_special(float x, uint32_t ix)
{
    if (AVM_MATH_UNLIKELY((ix & 0x7fffffffUL) == 0)) { errno = ERANGE; SET_FLOAT_WORD(x, 0xff800000UL); return x; }
    if (AVM_MATH_UNLIKELY(ix & 0x80000000UL)) {
        if (AVM_MATH_UNLIKELY((ix & 0x7fffffffUL) <= 0x7f800000UL)) errno = EDOM;
        SET_FLOAT_WORD(x, ix | 0x7fc00000UL); return x; }
    return x+x;
}

static __attribute__((always_inline)) inline float avm_log_normalize(float x, uint32_t ix, int *k)
{
    int exponent = 0;
    if (ix < 0x00800000UL) {
        x *= 0x1p25f;
        exponent = -25;
        GET_FLOAT_WORD(ix, x);
    }
    exponent += (int)(ix >> 23) - 127;
    ix &= 0x007fffffUL;
    uint32_t half = (ix + 0x4afb20UL) & 0x00800000UL;
    SET_FLOAT_WORD(x, ix | (half ^ 0x3f800000UL));
    *k = exponent + (int)(half >> 23);
    return x;
}

#include "log_poly.h"

/* A stable log1p-style mantissa core is available for future log1pf work. */
static __attribute__((always_inline)) inline float avm_log_mantissa(float x)
{
    return avm_log2_mantissa(x)*0x1.62e43p-1f;
}

static __attribute__((always_inline)) inline float avm_log_kernel(float x)
{
    uint32_t ix;
    GET_FLOAT_WORD(ix, x);
    if (AVM_MATH_UNLIKELY(ix-1U >= 0x7f7fffffUL)) return avm_log_special(x, ix);
    int k;
    x = avm_log_normalize(x, ix, &k);
    return ((float)k+avm_log2_mantissa(x))*0x1.62e43p-1f;
}

#endif
