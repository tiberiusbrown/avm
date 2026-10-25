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







	static const float AVM_MATH_RODATA 
avm_atan_one = 1.0;

	static __attribute__((always_inline)) inline float avm_atan_kernel(float x)
{
	float w,s1,s2,z;
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
		id = 0; x = ((float)2.0*x-avm_atan_one)/((float)2.0+x); 
	    } else {			/* 11/16<=|x|< 19/16 */
		id = 1; x  = (x-avm_atan_one)/(x+avm_atan_one); 
	    }
	} else {
	    if (ix < 0x401c0000) {	/* |x| < 2.4375 */
		id = 2; x  = (x-(float)1.5)/(avm_atan_one+(float)1.5*x);
	    } else {			/* 2.4375 <= |x| < 2^66 */
		id = 3; x  = -(float)1.0/x;
	    }
	}}
    /* end of argument reduction */
	z = x*x;
	w = z*z;
    /* break sum from i=0 to 10 ((i == 0 ? 3.3333334327e-01f : (i == 1 ? -2.0000000298e-01f : (i == 2 ? 1.4285714924e-01f : (i == 3 ? -1.1111110449e-01f : (i == 4 ? 9.0908870101e-02f : (i == 5 ? -7.6918758452e-02f : (i == 6 ? 6.6610731184e-02f : (i == 7 ? -5.8335702866e-02f : (i == 8 ? 4.9768779427e-02f : (i == 9 ? -3.6531571299e-02f : 1.6285819933e-02f)))))))))))z**(i+1) into odd and even poly */
	s1 = z*((3.3333334327e-01f)+w*((1.4285714924e-01f)+w*((9.0908870101e-02f)+w*((6.6610731184e-02f)+w*((4.9768779427e-02f)+w*(1.6285819933e-02f))))));
	s2 = w*((-2.0000000298e-01f)+w*((-1.1111110449e-01f)+w*((-7.6918758452e-02f)+w*((-5.8335702866e-02f)+w*(-3.6531571299e-02f)))));
	if (id<0) return x - x*(s1+s2);
	else {
	    z = ((id == 0 ? 4.6364760399e-01f : (id == 1 ? 7.8539812565e-01f : (id == 2 ? 9.8279368877e-01f : 1.5707962513e+00f)))) - ((x*(s1+s2) - ((id == 0 ? 5.0121582440e-09f : (id == 1 ? 3.7748947079e-08f : (id == 2 ? 3.4473217170e-08f : 7.5497894159e-08f))))) - x);
	    return (hx<0)? -z:z;
	}
}


#endif
