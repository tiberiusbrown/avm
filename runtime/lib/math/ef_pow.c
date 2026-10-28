/* ef_pow.c -- float version of e_pow.c.
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
#include "log_kernel.h"
#include "exp2_kernel.h"
#include "pow_log_poly.h"
#include "pow_boundary.h"
#include "native_math.h"

float powf(float x, float y)
{
    uint32_t hx,hy;
    GET_FLOAT_WORD(hx,x);
    GET_FLOAT_WORD(hy,y);
    uint32_t ix=hx&0x7fffffffUL, iy=hy&0x7fffffffUL;
    if (!iy) return issignalingf_inline(x) ? x+y : 1.0f;
    if (ix>0x7f800000UL || iy>0x7f800000UL)
        return hx==0x3f800000UL && !issignalingf_inline(y) ? 1.0f : x+y;
    if (iy==0x7f800000UL) {
        if (AVM_MATH_UNLIKELY(!ix && (hy >> 31))) errno = ERANGE;
        if (ix==0x3f800000UL) return 1.0f;
        return (ix>0x3f800000UL)==!(hy>>31) ? __math_oflowf(0) : 0.0f;
    }
    if (hy==0x3f800000UL) {
        if (AVM_MATH_UNLIKELY(ix && ix < 0x00800000UL)) errno = ERANGE;
        return x;
    }
    if (hy==0xbf800000UL) {
        if (AVM_MATH_UNLIKELY(!ix)) errno = ERANGE;
        float z = 1.0f/x;
        return ix && ix < 0x7f800000UL ? avm_math_check_range(z) : z;
    }
    if (hy==0x40000000UL) {
        float z = x*x;
        return ix && ix < 0x7f800000UL ? avm_math_check_range(z) : z;
    }
    if (hy==0x3f000000UL && !(hx>>31)) return avm_native_sqrt(x);

    /* Integer classification uses the exponent/mantissa, including the fact
       that every binary32 integer at 2^24 and above is even. */
    unsigned parity=0;
    int integer=0;
    if (hx>>31) {
        if (iy>=0x4b800000UL) integer=1;
        else if (iy>=0x3f800000UL) {
            unsigned e=(unsigned)(iy>>23)-127;
            uint16_t low=(uint16_t)iy;
            if (e<8) {
                unsigned shift=7-e;
                unsigned mantissa=((unsigned)(iy>>16)&127U)|128U;
                if (!low && !(mantissa&((1U<<shift)-1U))) {
                    integer=1;
                    parity=(mantissa>>shift)&1U;
                }
            } else {
                unsigned shift=23-e;
                if (!(low&((1U<<shift)-1U))) {
                    integer=1;
                    parity=(low>>shift)&1U;
                }
            }
        }
    }
    unsigned sign=(unsigned)(hx>>31)&parity;
    float a;
    SET_FLOAT_WORD(a,ix);
    if (!ix || ix==0x7f800000UL) {
        if (AVM_MATH_UNLIKELY(!ix && (hy >> 31))) errno = ERANGE;
        float z=hy>>31 ? 1.0f/a : a;
        return sign ? -z : z;
    }
    if (AVM_MATH_UNLIKELY((hx>>31) && !integer)) { errno = EDOM; SET_FLOAT_WORD(x, hx | 0x7fc00000UL); return x; }
    if (ix==0x3f800000UL) return sign ? -1.0f : 1.0f;

    float u;
    if (ix>=0x3f700000UL && ix<=0x3f900000UL) {
        /* ln(1+f)/f through f^6 on |f|<=1/8. Form y*f first so
           neighboring-one inputs keep their significant bits for huge y. */
        float f=a-1.0f;
        float p=AVM_FPOLY7(f,0x1.24924ap-3f,-0x1.555556p-3f,0.2f,-0.25f,
                            0x1.555556p-2f,-0.5f,1.0f);
        u=(y*f)*p*0x1.715476p0f;
    } else {
        int exponent;
        a=avm_log_normalize(a,ix,&exponent);
        u=y*((float)exponent+(iy>0x41000000UL ? avm_pow_log2_mantissa(a) : avm_log2_mantissa(a)));
    }
    uint32_t ub;
    GET_FLOAT_WORD(ub,u);
    ub&=0x7fffffffUL;
    if (ub-0x42fffc00UL<=0x600UL || ub-0x4315fe00UL<=0x400UL) {
        avm_pow_pair refined=avm_pow_boundary(__builtin_fabsf(x),ix,y);
        u=refined.hi;
        if (u==128.0f) {
            float z;
            SET_FLOAT_WORD(z,refined.lo>=-0x1.715476p-25f ? 0x7f800000UL : 0x7f7fffffUL);
            if (AVM_MATH_UNLIKELY(avm_math_high(z) == 0x7f80U)) errno = ERANGE;
            return sign ? -z : z;
        }
        if (u==-150.0f) {
            float z;
            errno = ERANGE;
            SET_FLOAT_WORD(z,refined.lo>0 ? 1 : 0);
            return sign ? -z : z;
        }
    }
    float result=avm_exp2_kernel(u);
    return sign ? -result : result;
}
