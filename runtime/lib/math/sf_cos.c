/* sf_cos.c -- float version of s_cos.c.
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
#include "sin_kernel.h"
#include "cos_kernel.h"

float cosf(float x)
{
    if (AVM_MATH_UNLIKELY(avm_math_high(x) == 0x7f80U)) {
        uint32_t u;
        GET_FLOAT_WORD(u, x);
        if (AVM_MATH_UNLIKELY(!(uint16_t)u)) errno = EDOM;
    }
    int n;
    x = avm_native_rempio2(x, &n);
    float r = (n&1) ? avm_sin_kernel(x) : avm_cos_kernel(x);
    return avm_math_flip_sign(r, ((unsigned)n+1U) & 2U);
}
