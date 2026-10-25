#ifndef AVM_TAN_KERNEL_H
#define AVM_TAN_KERNEL_H
/* kf_tan.c -- float version of k_tan.c
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
#include "fpoly.h"

	static __attribute__((always_inline)) inline float avm_tan_kernel(float x, float y, int iy)
{
	float z,r,v,w,s;
	__int32_t ix,hx;
	GET_FLOAT_WORD(hx,x);
	ix = hx&0x7fffffff;	/* high word of |x| */
	if(ix<0x31800000)			/* x < 2**-28 */
	    {if((int)x==0) {			/* generate inexact */
		if((ix|(iy+1))==0) return 1.0000000000e+00f/__builtin_fabsf(x);
		else return (iy==1)? x: -1.0000000000e+00f/x;
	    }
	    }
	if(ix>=0x3f2ca140) { 			/* |x|>=0.6744 */
	    if(hx<0) {x = -x; y = -y;}
	    z = 7.8539812565e-01f-x;
	    w = 3.7748947079e-08f-y;
	    x = z+w; y = 0.0;
	}
	z	=  x*x;
    /* Float-specific Remez correction on |x| < 0.6744. The pi/4
       transform, reduction tail and compensated reciprocal stay intact.
       Reproduce with tests/math/generate_minimax.py. */
    r = AVM_FPOLY5(z, 0x1.ad4488p-8f, 0x1.d49c2ap-8f, 0x1.6d605ep-6f, 0x1.b9b6dep-5f, 0x1.111216p-3f);
    s = z*x;
    r = y + z*(s*r+y);
    r += 0x1.555554p-2f*s;
	w = x+r;
	if(ix>=0x3f2ca140) {
	    v = (float)iy;
	    return (float)(1-((hx>>30)&2))*(v-(float)2.0*(x-(w*w/(w+v)-r)));
	}
	if(iy==1) return w;
	else {		/* if allow error up to 2 ulp, 
			   simply return -1.0/(x+r) here */
     /*  compute -1.0/(x+r) accurately */
	    float a,t;
	    __int32_t i;
	    z  = w;
	    GET_FLOAT_WORD(i,z);
	    SET_FLOAT_WORD(z,i&0xfffff000);
	    v  = r-(z - x); 	/* z+v = r+x */
	    t = a  = -(float)1.0/w;	/* a = -1.0/w */
	    GET_FLOAT_WORD(i,t);
	    SET_FLOAT_WORD(t,i&0xfffff000);
	    s  = (float)1.0+t*z;
	    return t+a*(s+t*v);
	}
}

#endif
