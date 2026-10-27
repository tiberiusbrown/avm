#ifndef AVM_COS_KERNEL_H
#define AVM_COS_KERNEL_H
/* kf_cos.c -- float version of k_cos.c
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

static __attribute__((always_inline)) inline float avm_cos_kernel(float x)
{
    return avm_cos_polynomial(x*x);
}
#endif
