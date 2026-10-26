#ifndef AVM_TAN_KERNEL_H
#define AVM_TAN_KERNEL_H
/* kf_tan.c -- float version of k_tan.c
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

static __attribute__((always_inline)) inline float avm_tan_kernel(float x, float y, int iy)
{
    uint32_t ix;
    GET_FLOAT_WORD(ix,x);
    if (!(ix&0x7fffffffUL)) return iy==1 ? x : -1.0f/x;
    /* Include the low reduction term before the reciprocal. Near poles the
       tiny remainder makes the polynomial error negligible; pole neighbors
       retain the existing four-ULP regression budget. */
    float z=x*x;
    float w=x+(x*z)*avm_tan_polynomial(z);
    w+=y;
    return iy==1 ? w : -1.0f/w;
}
#endif
