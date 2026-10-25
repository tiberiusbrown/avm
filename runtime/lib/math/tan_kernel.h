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
	w 	=  z*z;
    /* Break x^5*((1.3333334029e-01f)+x^2*(5.3968254477e-02f)+...) into
     *	  x^5((1.3333334029e-01f)+x^4*(2.1869488060e-02f)+...+x^20*(-1.8558637748e-05f)) +
     *	  x^5(x^2*((5.3968254477e-02f)+x^4*(8.8632395491e-03f)+...+x^22*[T12]))
     */
	r = (1.3333334029e-01f)+w*((2.1869488060e-02f)+w*((3.5920790397e-03f)+w*((5.8804126456e-04f)+w*((7.8179444245e-05f)+w*(-1.8558637748e-05f)))));
	v = z*((5.3968254477e-02f)+w*((8.8632395491e-03f)+w*((1.4562094584e-03f)+w*((2.4646313977e-04f)+w*((7.1407252108e-05f)+w*(2.5907305826e-05f))))));
	s = z*x;
	r = y + z*(s*(r+v)+y);
	r += (3.3333334327e-01f)*s;
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
