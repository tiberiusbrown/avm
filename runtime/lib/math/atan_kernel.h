#ifndef AVM_ATAN_KERNEL_H
#define AVM_ATAN_KERNEL_H
/* sf_atan.c -- float version of s_atan.c.
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

	static __attribute__((always_inline)) inline float avm_atan_kernel(float x)
{
	float correction,z;
	__int32_t ix,hx;
	int id;

	GET_FLOAT_WORD(hx,x);
	ix = hx&0x7fffffff;
	if(ix>=0x50800000) {	/* if |x| >= 2^34 */
	    if(FLT_UWORD_IS_NAN(ix))
		return x+x;		/* NaN */
	    if(hx>0) return  (1.5707962513e+00f)+(7.5497894159e-08f);
	    else     return -(1.5707962513e+00f)-(7.5497894159e-08f);
	} if (ix < 0x3ee00000) {	/* |x| < 0.4375 */
	    if (ix < 0x31000000) {	/* |x| < 2^-29 */
		return x;	/* raise inexact */
	    }
	    id = -1;
	} else {
	x = __builtin_fabsf(x);
	if (ix < 0x3f980000) {		/* |x| < 1.1875 */
	    if (ix < 0x3f300000) {	/* 7/16 <=|x|<11/16 */
                id = 0; x = ((float)2.0*x-1.0f)/((float)2.0+x);
	    } else {			/* 11/16<=|x|< 19/16 */
                id = 1; x  = (x-1.0f)/(x+1.0f);
	    }
	} else {
	    if (ix < 0x401c0000) {	/* |x| < 2.4375 */
		id = 2; x  = (x-(float)1.5)/(1.0f+(float)1.5*x);
	    } else {			/* 2.4375 <= |x| < 2^66 */
		id = 3; x  = -(float)1.0/x;
	    }
	}}
    /* end of argument reduction */
	z = x*x;
    /* Remez fit of (x-atan(x))/x^3 for |x| <= 7/16, rounded to
       binary32. Reproduce with tests/math/generate_minimax.py. */
	correction = z*(0x1.555554p-2f+z*(-0x1.99962cp-3f+
	    z*(0x1.23fdc2p-3f+z*(-0x1.b540dcp-4f+z*0x1.fea3a2p-5f))));
	if (id<0) return x - x*correction;
	else {
	    z = ((id == 0 ? 4.6364760399e-01f : (id == 1 ? 7.8539812565e-01f : (id == 2 ? 9.8279368877e-01f : 1.5707962513e+00f)))) - ((x*correction - ((id == 0 ? 5.0121582440e-09f : (id == 1 ? 3.7748947079e-08f : (id == 2 ? 3.4473217170e-08f : 7.5497894159e-08f))))) - x);
	    return (hx<0)? -z:z;
	}
}

#endif
