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

#include "native_math.h"
#include "tan_kernel.h"

float tanf(float x)
{
    int n;
    x = avm_native_rempio2(x, &n);
    return avm_tan_kernel(x, n&1);
}
