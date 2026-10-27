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
#include "native_math.h"

static __attribute__((always_inline)) inline float avm_tan_kernel(float x, int reciprocal)
{
    float z=x*x;
    float w=avm_native_fma(x*z, avm_tan_polynomial(z), x);
    return reciprocal ? -1.0f/w : w;
}
#endif
