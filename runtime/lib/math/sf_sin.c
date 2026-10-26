/* sf_sin.c -- float version of s_sin.c.
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

#include "rem_pio2_inline.h"
#include "sin_kernel.h"
#include "cos_kernel.h"

/* Classify small angles before entering the larger reduction frame. */
static __attribute__((noinline)) float avm_sin_reduced(float x)
{
#ifdef __AVM__
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    /* Only the public entry's classified fallthrough reaches this helper. */
    __builtin_assume((bits&0x7fffffffUL)>=0x4016cbe4UL);
#endif
    int n;
    x = avm_rem_pio2f_mode(x, &n, 0);
    float r = (n&1) ? avm_cos_kernel(x) : avm_sin_kernel(x);
    return (n&2) ? -r : r;
}

float sinf(float x)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits,x);
    if ((bits&0x7fffffffUL)<=0x3f490fdaUL) return avm_sin_kernel(x);
    if ((bits&0x7fffffffUL)<0x4016cbe4UL) {
        float r=(__builtin_fabsf(x)-0x1.921fb4p0f)-0x1.4442d2p-24f;
        return __builtin_copysignf(avm_cos_kernel(r),x);
    }
    __attribute__((musttail)) return avm_sin_reduced(x);
}
