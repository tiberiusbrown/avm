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

float __ieee754_powf(float x, float y)
{
    uint32_t hx,hy;
    GET_FLOAT_WORD(hx,x);
    GET_FLOAT_WORD(hy,y);
    uint32_t ix=hx&0x7fffffffUL, iy=hy&0x7fffffffUL;
    if (!iy) return issignalingf_inline(x) ? x+y : 1.0f;
    if (ix>0x7f800000UL || iy>0x7f800000UL)
        return hx==0x3f800000UL && !issignalingf_inline(y) ? 1.0f : x+y;
    if (iy==0x7f800000UL) {
        if (ix==0x3f800000UL) return 1.0f;
        return (ix>0x3f800000UL)==!(hy>>31) ? __math_oflowf(0) : 0.0f;
    }
    if (hy==0x3f800000UL) return x;
    if (hy==0xbf800000UL) return 1.0f/x;
    if (hy==0x40000000UL) return x*x;
    if (hy==0x3f000000UL && !(hx>>31)) return __ieee754_sqrtf(x);

    /* Integer classification uses the exponent/mantissa, including the fact
       that every binary32 integer at 2^24 and above is even. */
    unsigned parity=0;
    int integer=0;
    if ((hx>>31) || (iy>=0x40000000UL && iy<=0x41800000UL)) {
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
        float z=hy>>31 ? 1.0f/a : a;
        return sign ? -z : z;
    }
    if ((hx>>31) && !integer) return (x-x)/(x-x);
    if (ix==0x3f800000UL) return sign ? -1.0f : 1.0f;

    /* Invert first for negative powers. Squaring a large positive base and
       then taking its reciprocal can otherwise lose a representable result.
       Restrict this loop to bases whose reciprocal is normal: outside those
       bounds integer powers >=2 necessarily overflow or round to zero. */
    if (integer && iy<=0x41800000UL && ix>=0x00800000UL && ix<=0x7e800000UL) {
        unsigned n=(unsigned)__builtin_fabsf(y);
        if (hy>>31) a=1.0f/a;
        float product=1.0f;
        do {
            if (n&1) product*=a;
            n>>=1;
            if (!n) break;
            a*=a;
        } while (1);
        return sign ? -product : product;
    }
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
            return sign ? -z : z;
        }
        if (u==-150.0f) {
            float z;
            SET_FLOAT_WORD(z,refined.lo>0 ? 1 : 0);
            return sign ? -z : z;
        }
    }
    float result=avm_exp2_kernel(u);
    return sign ? -result : result;
}
