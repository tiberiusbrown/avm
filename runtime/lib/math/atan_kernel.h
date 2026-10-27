#ifndef AVM_ATAN_KERNEL_H
#define AVM_ATAN_KERNEL_H
/* sf_atan.c -- float version of s_atan.c.
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
 *
 */

#include "fdlibm.h"
#include "atan_poly.h"

static __attribute__((always_inline)) inline float avm_atan_kernel(float x)
{
    uint32_t hx;
    GET_FLOAT_WORD(hx,x);
    uint32_t ix=hx&0x7fffffffUL;
    if (ix>0x7f800000UL) return x+x;
    float a=__builtin_fabsf(x), result;
    if (ix>0x3f800000UL) result=0x1.921fb6p0f-avm_atan_unit(1.0f/a);
    else result=avm_atan_unit(a);
    return hx>>31 ? -result : result;
}
#endif
