#ifndef AVM_SIN_KERNEL_H
#define AVM_SIN_KERNEL_H
/* kf_sin.c -- float version of k_sin.c
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
#include "trig_poly.h"

static __attribute__((always_inline)) inline float avm_sin_kernel(float x, float y, int iy)
{
    (void)y; (void)iy;
    uint32_t ix;
    GET_FLOAT_WORD(ix,x);
    if ((ix&0x7fffffffUL)<0x39800000UL) return x;
    return x*avm_sin_polynomial(x*x);
}
#endif
