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

/* Callers classify once, then share normalization and the mantissa kernel. */
static __attribute__((always_inline)) inline float avm_log_special(float x, uint32_t ix)
{
    if ((ix & 0x7fffffffUL) == 0) return -1.0f/0.0f;
    if (ix & 0x80000000UL) return (x-x)/0.0f;
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

/* x is a positive normalized mantissa near one; no classification or scaling. */
static __attribute__((always_inline)) inline float avm_log_mantissa(float x)
{
    float f = x-1.0f;
    if (__builtin_fabsf(f) <= 0x1p-4f) {
        /* Degree-six log1p polynomial. Keeping f outside the correction
           preserves tiny results and exact log(1), including reduced powers. */
        float correction = f*f*(0.5f+f*(-0x1.555556p-2f+
            f*(0.25f+f*(-0.2f+f*0x1.555556p-3f))));
        return f-correction;
    }
    float s = f/(2.0f+f);
    float z = s*s;
    float w = z*z;
    float t1 = w*(4.0000000596e-01f+w*(2.2222198546e-01f+w*1.5313838422e-01f));
    float t2 = z*(6.6666668653e-01f+w*(2.8571429849e-01f+w*(1.8183572590e-01f+w*1.4798198640e-01f)));
    float hfsq = 0.5f*f*f;
    return f-(hfsq-s*(hfsq+t1+t2));
}

static __attribute__((always_inline)) inline float avm_log_kernel(float x)
{
    uint32_t ix;
    GET_FLOAT_WORD(ix, x);
    if (ix-1U >= 0x7f7fffffUL) return avm_log_special(x, ix);
    int k;
    x = avm_log_normalize(x, ix, &k);
    float mantissa = avm_log_mantissa(x);
    float exponent = (float)k;
    return exponent*6.9313812256e-01f+(mantissa+exponent*9.0580006145e-06f);
}

#endif
