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

#include "fdlibm.h"
#include "sin_kernel.h"
#include "cos_kernel.h"


	float cosf(float x)
{
	float y[2],z=0.0;
	__int32_t ix;
	int n;

	GET_FLOAT_WORD(ix,x);

    /* |x| ~< pi/4 */
	ix &= 0x7fffffff;
	if(ix <= 0x3f490fd8) return avm_cos_kernel(x,z);

    /* cos(Inf or NaN) is NaN */
	else if (!FLT_UWORD_IS_FINITE(ix)) return x-x;

    /* argument reduction needed */
	else {
	    n = __ieee754_rem_pio2f(x,y);
	    switch(n&3) {
		case 0: return  avm_cos_kernel(y[0],y[1]);
		case 1: return -avm_sin_kernel(y[0],y[1],1);
		case 2: return -avm_cos_kernel(y[0],y[1]);
		default:
		        return  avm_sin_kernel(y[0],y[1],1);
	    }
	}
}

