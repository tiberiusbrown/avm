/* sf_tan.c -- float version of s_tan.c.
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
#include "tan_kernel.h"

float tanf(float x)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, x);
    if ((bits&0x7fffffffUL) <= 0x3f490fdaUL) return avm_tan_kernel(x, 0);
    if ((bits&0x7fffffffUL)<0x4016cbe4UL) {
        float r=(__builtin_fabsf(x)-0x1.921fb4p0f)-0x1.4442d2p-24f;
        return (bits>>31) ? -(avm_tan_kernel(r,1)) : (avm_tan_kernel(r,1));
    }
    int n;
    x = avm_rem_pio2f(x, &n);
    return avm_tan_kernel(x, n&1);
}
