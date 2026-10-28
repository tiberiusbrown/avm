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

#include "native_math.h"
#include "trig_poly.h"

static __attribute__((always_inline)) inline float avm_sin_kernel(float x)
{
    /* FPOLY leaves its result in q2 and preserves x in q3. Keeping that
       operand order avoids swapping them through a callee-saved pair. */
    return avm_native_mul(avm_sin_polynomial(x*x), x);
}
#endif
