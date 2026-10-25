#ifndef AVM_SIN_KERNEL_H
#define AVM_SIN_KERNEL_H
/* kf_sin.c -- float version of k_sin.c
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

	static __attribute__((always_inline)) inline float avm_sin_kernel(float x, float y, int iy)
{
	float z,r,v;
	__int32_t ix;
	GET_FLOAT_WORD(ix,x);
	ix &= 0x7fffffff;			/* high word of x */
	if(ix<0x32000000)			/* |x| < 2**-27 */
	   {return x;}		/* generate inexact */
	z	=  x*x;
	v	=  z*x;
	r	=  8.3333337680e-03f+z*((-1.9841270114e-04f)+z*(2.7557314297e-06f+z*((-2.5050759689e-08f)+z*1.5896910177e-10f)));
	if(iy==0) return x+v*((-1.6666667163e-01f)+z*r);
	else      return x-((z*(5.0000000000e-01f*y-v*r)-y)-v*(-1.6666667163e-01f));
}

#endif
