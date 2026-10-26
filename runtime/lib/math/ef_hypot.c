/* ef_hypot.c -- float version of e_hypot.c.
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

/* Only called at the overflow rounding boundary. With a's exponent 127,
   a=A*2^104 and b=B*2^(104-gap). Compare the exact squared norm with
   (2^128-2^103)^2, the round-to-nearest overflow threshold. Flooring the
   shifted smaller square preserves comparison with the integer threshold. */
static __attribute__((noinline)) int avm_hypot_overflows(uint32_t ha, uint32_t hb)
{
    uint64_t a=(ha&0x007fffffUL)|0x00800000UL;
    uint64_t b=(hb&0x007fffffUL)|0x00800000UL;
    unsigned shift=(254-(unsigned)(hb>>23))*2;
    uint64_t square=(a*a)<<2;
    if (shift<64) square+=((b*b)<<2)>>shift;
    return square>=((UINT64_C(1)<<25)-1)*((UINT64_C(1)<<25)-1);
}

float __ieee754_hypotf(float x, float y)
{
    uint32_t ha,hb;
    GET_FLOAT_WORD(ha,x);
    GET_FLOAT_WORD(hb,y);
    ha&=0x7fffffffUL;
    hb&=0x7fffffffUL;
    float a=__builtin_fabsf(x), b=__builtin_fabsf(y);
    /* The ordinary path needs no sorting or scaling. Each square is normal
       and their sum is finite for magnitudes in [2^-60,2^60). */
    if (ha-0x21800000UL<0x3c000000UL && hb-0x21800000UL<0x3c000000UL)
        return __ieee754_sqrtf(a*a+b*b);
    if (ha==0x7f800000UL || hb==0x7f800000UL) return __math_oflowf(0);
    if (ha>0x7f800000UL || hb>0x7f800000UL) return a+b;
    if (hb>ha) {
        uint32_t t=ha; ha=hb; hb=t;
        float f=a; a=b; b=f;
    }
    /* A ratio below 2^-13 contributes less than half an ULP to the norm. */
    if (!hb || ha-hb>=0x07000000UL) return a;
    if (ha>=0x5d800000UL) {
        a*=0x1p-68f;
        b*=0x1p-68f;
        float w=__ieee754_sqrtf(a*a+b*b);
        uint32_t hw;
        GET_FLOAT_WORD(hw,w);
        if (hw-0x5d7ffffcUL<=8) {
            /* Include sum-of-squares rounding as well as sqrt's two ULP.
               Keep a finite approximation unless its final scaling would
               overflow; only that case needs clamping to the largest float. */
            if (avm_hypot_overflows(ha,hb)) return __math_oflowf(0);
            if (hw>=0x5d800000UL) {
                SET_FLOAT_WORD(w,0x7f7fffffUL);
                return w;
            }
        }
        return w*0x1p68f;
    }
    if (ha<0x00800000UL) {
        a*=0x1p126f;
        b*=0x1p126f;
        return __ieee754_sqrtf(a*a+b*b)*0x1p-126f;
    }
    a*=0x1p68f;
    b*=0x1p68f;
    return __ieee754_sqrtf(a*a+b*b)*0x1p-68f;
}
