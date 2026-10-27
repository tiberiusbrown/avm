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
#include "native_math.h"

typedef struct { uint16_t w0,w1,w2,w3; } avm_hypot_words;

/* Exact 24-bit significand square, shifted left two. Six native 8x8
   products and bounded byte-column sums replace guest 64-bit helpers. */
static __attribute__((always_inline)) inline avm_hypot_words avm_hypot_square(uint32_t a)
{
    uint8_t a0=(uint8_t)a, a1=(uint8_t)(a>>8), a2=(uint8_t)(a>>16)|0x80U;
    uint16_t p00=(uint16_t)a0*a0, p01=(uint16_t)a0*a1, p02=(uint16_t)a0*a2;
    uint16_t p11=(uint16_t)a1*a1, p12=(uint16_t)a1*a2, p22=(uint16_t)a2*a2;
    uint16_t c=(p00>>8)+2U*(p01&255U);
    uint16_t w0=(p00&255U)|((c&255U)<<8);
    c=(c>>8)+2U*(p01>>8)+2U*(p02&255U)+(p11&255U);
    uint16_t w1=c&255U;
    c=(c>>8)+2U*(p02>>8)+(p11>>8)+2U*(p12&255U);
    w1|=(c&255U)<<8;
    c=(c>>8)+2U*(p12>>8)+(p22&255U);
    uint16_t w2=(c&255U)|(((c>>8)+(p22>>8))<<8);
    avm_hypot_words result={(uint16_t)(w0<<2),(uint16_t)((w1<<2)|(w0>>14)),
        (uint16_t)((w2<<2)|(w1>>14)),(uint16_t)(w2>>14)};
    return result;
}

/* Only called at the overflow rounding boundary. With a's exponent 127,
   a=A*2^104 and b=B*2^(104-gap). Compare the exact squared norm with
   (2^128-2^103)^2, the round-to-nearest overflow threshold. Flooring the
   shifted smaller square preserves comparison with the integer threshold. */
static __attribute__((noinline)) int avm_hypot_overflows(uint32_t ha, uint32_t hb)
{
    unsigned gap=254-(unsigned)(hb>>23);
    /* At gap 12 even both maximal significands fall short of the threshold:
       the smaller square contributes at most 2^26-8, versus 2^26-3 needed. */
    if (gap>=12) return 0;
    avm_hypot_words a=avm_hypot_square(ha), b=avm_hypot_square(hb);
    unsigned shift=2*gap;
    if (shift>=16) { b.w0=b.w1; b.w1=b.w2; b.w2=b.w3; b.w3=0; shift-=16; }
    if (shift) {
        unsigned left=16-shift;
        b.w0=(uint16_t)((b.w0>>shift)|(b.w1<<left));
        b.w1=(uint16_t)((b.w1>>shift)|(b.w2<<left));
        b.w2=(uint16_t)((b.w2>>shift)|(b.w3<<left));
        b.w3>>=shift;
    }
    uint32_t sum=(uint32_t)a.w0+b.w0;
    uint16_t w0=(uint16_t)sum;
    sum=(sum>>16)+(uint32_t)a.w1+b.w1;
    uint16_t w1=(uint16_t)sum;
    sum=(sum>>16)+(uint32_t)a.w2+b.w2;
    uint16_t w2=(uint16_t)sum;
    unsigned w3=(unsigned)(sum>>16)+a.w3+b.w3;
    if (w3!=3) return w3>3;
    if (w2!=0xffffU) return 0;
    if (w1!=0xfc00U) return w1>0xfc00U;
    return w0>=1;
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
        return avm_native_sqrt(a*a+b*b);
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
        float w=avm_native_sqrt(a*a+b*b);
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
        return avm_native_sqrt(a*a+b*b)*0x1p-126f;
    }
    a*=0x1p68f;
    b*=0x1p68f;
    return avm_native_sqrt(a*a+b*b)*0x1p-68f;
}
