/* ef_atan2.c -- float version of e_atan2.c.
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
#include "atan_kernel.h"

	float __ieee754_atan2f(float y, float x)
{  
	float z;
	__int32_t hx,hy,ix,iy;
	int k,m;

	GET_FLOAT_WORD(hx,x);
	ix = hx&0x7fffffff;
	GET_FLOAT_WORD(hy,y);
	iy = hy&0x7fffffff;
	if(FLT_UWORD_IS_NAN(ix)||
	   FLT_UWORD_IS_NAN(iy))	/* x or y is NaN */
	   return x+y;
	if(hx==0x3f800000) return avm_atan_kernel(y);   /* x=1.0 */
	m = ((hy>>31)&1)|((hx>>30)&2);	/* 2*sign(x)+sign(y) */

    /* when y = 0 */
	if(FLT_UWORD_IS_ZERO(iy)) {
	    switch(m) {
		case 0: 
		case 1: return y; 	/* atan(+-0,+anything)=+-0 */
		case 2: return  3.1415927410e+00f+1.0e-30f;/* atan(+0,-anything) = pi */
		case 3: return -3.1415927410e+00f-1.0e-30f;/* atan(-0,-anything) =-pi */
	    }
	}
    /* when x = 0 */
	if(FLT_UWORD_IS_ZERO(ix)) return (hy<0)?  -1.5707963705e+00f-1.0e-30f: 1.5707963705e+00f+1.0e-30f;
	    
    /* when x is INF */
	if(FLT_UWORD_IS_INFINITE(ix)) {
	    if(FLT_UWORD_IS_INFINITE(iy)) {
		switch(m) {
		    case 0: return  7.8539818525e-01f+1.0e-30f;/* atan(+INF,+INF) */
		    case 1: return -7.8539818525e-01f-1.0e-30f;/* atan(-INF,+INF) */
		    case 2: return  (float)3.0*7.8539818525e-01f+1.0e-30f;/*atan(+INF,-INF)*/
		    case 3: return (float)-3.0*7.8539818525e-01f-1.0e-30f;/*atan(-INF,-INF)*/
		}
	    } else {
		switch(m) {
		    case 0: return  0.0f  ;	/* atan(+...,+INF) */
		    case 1: return -0.0f  ;	/* atan(-...,+INF) */
		    case 2: return  3.1415927410e+00f+1.0e-30f  ;	/* atan(+...,-INF) */
		    case 3: return -3.1415927410e+00f-1.0e-30f  ;	/* atan(-...,-INF) */
		}
	    }
	}
    /* when y is INF */
	if(FLT_UWORD_IS_INFINITE(iy)) return (hy<0)? -1.5707963705e+00f-1.0e-30f: 1.5707963705e+00f+1.0e-30f;

    /* compute y/x */
	k = (iy-ix)>>23;
	if(k > 60) z=1.5707963705e+00f+(float)0.5*(-8.7422776573e-08f); 	/* |y/x| >  2**60 */
	else if(hx<0&&k<-60) z=0.0; 	/* |y|/x < -2**60 */
	else {
	    /* A quotient at most one avoids the atan reciprocal reduction.
	       Share the polynomial evaluation across both magnitude orderings. */
	    int invert = iy>ix;
	    float quotient = invert ? __builtin_fabsf(x/y) : __builtin_fabsf(y/x);
	    z=avm_atan_kernel(quotient);
	    /* Subtract from split pi/2 to retain the low constant bits. */
	    if(invert) z=1.5707962513e+00f-(z-7.5497894159e-08f);
	}
	switch (m) {
	    case 0: return       z  ;	/* atan(+,+) */
	    case 1: {
	    	      __uint32_t zh;
		      GET_FLOAT_WORD(zh,z);
		      SET_FLOAT_WORD(z,zh ^ 0x80000000);
		    }
		    return       z  ;	/* atan(-,+) */
	    case 2: return  3.1415927410e+00f-(z-(-8.7422776573e-08f));/* atan(+,-) */
	    default: /* case 3 */
                    return  (z-(-8.7422776573e-08f))-3.1415927410e+00f;/* atan(-,-) */
	}
}
