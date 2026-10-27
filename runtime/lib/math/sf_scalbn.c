/* sf_scalbn.c -- float version of s_scalbn.c.
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

float scalbnf(float x, int n)
{
    uint32_t u;
    GET_FLOAT_WORD(u,x);
    uint32_t magnitude=u&0x7fffffffUL;
    int e=(int)((uint16_t)(u>>16)&0x7fffU)>>7;
    if (!magnitude) return x;
    if (e==255) return x+x;
    /* Clamp before addition: even host INT_MIN/MAX cannot overflow the
       bounded native-word exponent. These limits cover every binary32 x. */
    if (n>276) return __math_oflowf((int)(u>>31));
    if (n<-277) return __math_uflowf((int)(u>>31));
    if (!e) {
        x*=0x1p25f;
        GET_FLOAT_WORD(u,x);
        e=(int)((uint16_t)(u>>16)&0x7fffU)>>7;
        e-=25;
    }
    e+=n;
    if (e>254) return __math_oflowf((int)(u>>31));
    if (e>0) {
        SET_FLOAT_WORD(x,(u&0x807fffffUL)|((uint32_t)e<<23));
        return x;
    }
    if (e<-23) return __math_uflowf((int)(u>>31));
    /* Exactly one rounding when the packed normal is scaled to subnormal. */
    SET_FLOAT_WORD(x,(u&0x807fffffUL)|((uint32_t)(e+25)<<23));
    return x*0x1p-25f;
}

