/* ef_atan2.c -- float version of e_atan2.c.
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
 *
 */

#include "fdlibm.h"
#include "atan_kernel.h"

float __ieee754_atan2f(float y, float x)
{
    uint32_t hx,hy;
    GET_FLOAT_WORD(hx,x);
    GET_FLOAT_WORD(hy,y);
    uint32_t ix=hx&0x7fffffffUL, iy=hy&0x7fffffffUL;
    if (ix>0x7f800000UL || iy>0x7f800000UL) return x+y;
    if (!iy) return hx>>31 ? __builtin_copysignf(0x1.921fb6p1f,y) : y;
    if (!ix) return __builtin_copysignf(0x1.921fb6p0f,y);
    float z;
    if (iy==0x7f800000UL) z=ix==iy ? 0x1.921fb6p-1f : 0x1.921fb6p0f;
    else if (ix==0x7f800000UL) z=0.0f;
    else {
        float a=__builtin_fabsf(x), b=__builtin_fabsf(y);
        if (iy>ix) z=0x1.921fb6p0f-avm_atan_unit(a/b);
        else z=avm_atan_unit(b/a);
    }
    if (hx>>31) z=0x1.921fb6p1f-z;
    return __builtin_copysignf(z,y);
}
