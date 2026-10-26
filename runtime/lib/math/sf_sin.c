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

float sinf(float x)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    if ((bits&0x7fffffffUL) <= 0x3f490fdaUL) return avm_sin_kernel(x);
    int n;
    x = avm_rem_pio2f(x, &n);
    float r = (n&1) ? avm_cos_kernel(x) : avm_sin_kernel(x);
    return (n&2) ? -r : r;
}
