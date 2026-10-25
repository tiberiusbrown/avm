#ifndef AVM_COS_KERNEL_H
#define AVM_COS_KERNEL_H
/* kf_cos.c -- float version of k_cos.c
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

	static __attribute__((always_inline)) inline float avm_cos_kernel(float x, float y)
{
	float a,hz,z,r,qx;
	__int32_t ix;
	GET_FLOAT_WORD(ix,x);
	ix &= 0x7fffffff;			/* ix = |x|'s high word*/
	if(ix<0x32000000) {			/* if |x| < 2**-27 */
	    return 1.0f;
	}
	z  = x*x;
	r  = z*(4.1666667908e-02f + z*(-1.3888889225e-03f +
	     z*(2.4801587642e-05f + z*(-2.7557314297e-07f +
	     z*(2.0875723372e-09f + z*(-1.1359647598e-11f))))));
	if(ix < 0x3e99999a) 			/* if |x| < 0.3 */ 
	    return 1.0f - (0.5f*z - (z*r - x*y));
	else {
	    if(ix > 0x3f480000) {		/* x > 0.78125 */
		qx = 0.28125f;
	    } else {
	        SET_FLOAT_WORD(qx,ix-0x01000000);	/* x/4 */
	    }
	    hz = 0.5f*z-qx;
	    a  = 1.0f-qx;
	    return a - (hz - (z*r-x*y));
	}
}

#endif
