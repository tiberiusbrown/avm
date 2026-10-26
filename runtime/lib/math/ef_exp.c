/* ef_exp.c -- float version of e_exp.c.
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
#include "exp_poly.h"

float __ieee754_expf(float x)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    uint32_t magnitude=bits & 0x7fffffffUL;
    if (magnitude >= 0x7f800000UL) {
        if (magnitude > 0x7f800000UL) return x+x;
        return bits >> 31 ? 0.0f : x;
    }
    if (!(bits >> 31) && magnitude > FLT_UWORD_LOG_MAX) return __math_oflowf(0);
    if ((bits >> 31) && magnitude > FLT_UWORD_LOG_MIN) return __math_uflowf(0);
    if (magnitude < 0x34000000UL) return 1.0f+x;
    /* Centered base-two reduction. Binary32 reduction error is included in
       the measured 1e-5 relative budget, including both scaling extremes. */
    float u=x*0x1.715476p0f;
    int k=0;
    float r=u;
    if (magnitude > 0x3eb17218UL) {
        k=(int)(u+(bits >> 31 ? -0.5f : 0.5f));
        r=u-(float)k;
    }
    float result=avm_exp_polynomial(r);
    GET_FLOAT_WORD(bits, result);
    if (k >= -125) {
        /* k=128 is safe: the finite-input threshold guarantees r<0. */
        bits += (uint32_t)k << 23;
        SET_FLOAT_WORD(result, bits);
        return result;
    }
    bits += (uint32_t)(k+100) << 23;
    SET_FLOAT_WORD(result, bits);
    return result*0x1p-100f;
}
