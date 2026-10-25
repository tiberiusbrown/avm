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

	float __ieee754_log10f(float x)
{
	float y,z;
	__int32_t hx;
	int i,k;

	GET_FLOAT_WORD(hx,x);

        k=0;
        if (FLT_UWORD_IS_ZERO(hx&0x7fffffff))
            return -3.3554432000e+07f/0.0f;             /* log(+-0)=-inf */
        if (hx<0) return (x-x)/0.0f;        /* log(-#) = NaN */
	if (!FLT_UWORD_IS_FINITE(hx)) return x+x;
        if (FLT_UWORD_IS_SUBNORMAL(hx)) {
            k -= 25; x *= 3.3554432000e+07f; /* subnormal number, scale up x */
	    GET_FLOAT_WORD(hx,x);
        }
	k += (hx>>23)-127;
	i = k < 0;
        hx = (hx&0x007fffff)|((int32_t)(0x7f-i)<<23);
        y  = (float)(k+i);
	SET_FLOAT_WORD(x,hx);
	z  = y*7.9034151668e-07f + 4.3429449201e-01f*avm_log_kernel(x);
	return  z+y*3.0102920532e-01f;
}
