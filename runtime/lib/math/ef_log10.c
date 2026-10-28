/* ef_log10.c -- float version of e_log10.c.
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
#include "log_kernel.h"

	float log10f(float x)
{
    uint32_t ix;
    GET_FLOAT_WORD(ix, x);
    if (AVM_MATH_UNLIKELY(ix-1U >= 0x7f7fffffUL)) return avm_log_special(x, ix);
    int k;
    x = avm_log_normalize(x, ix, &k);
    return ((float)k+avm_log2_mantissa(x))*0x1.344136p-2f;
}
