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

static const float AVM_MATH_RODATA 
avm_sin_half =  5.0000000000e-01,/* 0x3f000000 */
avm_sin_S1  = -1.6666667163e-01, /* 0xbe2aaaab */
avm_sin_S2  =  8.3333337680e-03, /* 0x3c088889 */
avm_sin_S3  = -1.9841270114e-04, /* 0xb9500d01 */
avm_sin_S4  =  2.7557314297e-06, /* 0x3638ef1b */
avm_sin_S5  = -2.5050759689e-08, /* 0xb2d72f34 */
avm_sin_S6  =  1.5896910177e-10; /* 0x2f2ec9d3 */

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
	r	=  avm_sin_S2+z*(avm_sin_S3+z*(avm_sin_S4+z*(avm_sin_S5+z*avm_sin_S6)));
	if(iy==0) return x+v*(avm_sin_S1+z*r);
	else      return x-((z*(avm_sin_half*y-v*r)-y)-v*avm_sin_S1);
}

#endif
