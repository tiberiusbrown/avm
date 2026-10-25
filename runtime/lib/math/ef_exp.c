/* ef_exp.c -- float version of e_exp.c.
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

	float __ieee754_expf(float x)	/* default IEEE double exp */
{
	float y,hi,lo,c,t;
	__int32_t sx;
	int k = 0,xsb;
	__uint32_t hx;

	GET_FLOAT_WORD(sx,x);
	xsb = (sx>>31)&1;		/* sign bit of x */
	hx = sx & 0x7fffffff;		/* high word of |x| */

    /* filter out non-finite argument */
        if(FLT_UWORD_IS_NAN(hx))
            return x+x;	 	/* NaN */
        if(FLT_UWORD_IS_INFINITE(hx))
	    return (xsb==0)? x:0.0;		/* exp(+-inf)={inf,0} */
	if(sx > FLT_UWORD_LOG_MAX)
	    return __math_oflowf(0); /* overflow */
	if(sx < 0 && hx > FLT_UWORD_LOG_MIN)
	    return __math_uflowf(0); /* underflow */
	
    /* argument reduction */
	if(hx > 0x3eb17218) {		/* if  |x| > 0.5 ln2 */ 
	    if(hx < 0x3F851592) {	/* and |x| < 1.5 ln2 */
		hi = x-((xsb == 0 ? 6.9313812256e-01f : -6.9313812256e-01f)); lo=((xsb == 0 ? 9.0580006145e-06f : -9.0580006145e-06f)); k = 1-xsb-xsb;
	    } else {
		k  = 1.4426950216e+00f*x+((xsb == 0 ? 0.5f : -0.5f));
		t  = k;
		hi = x - t*(6.9313812256e-01f);	/* t*ln2HI is exact here */
		lo = t*(9.0580006145e-06f);
	    }
	    x  = hi - lo;
	} 
	else if(hx < 0x34000000)  {	/* when |x|<2**-23 */
	    return 1.0f+x;/* trigger inexact */
	}

    /* x is now in primary range */
	t  = x*x;
	c  = x - t*(1.6666667163e-01f+t*((-2.7777778450e-03f)+t*(6.6137559770e-05f+t*((-1.6533901999e-06f)+t*4.1381369442e-08f))));
        if(k==0) 	return 1.0f-((x*c)/(c-(float)2.0)-x);
	else 		y = 1.0f-((lo-(x*c)/((float)2.0-c))-hi);
	if(k >= -125) {
	    __uint32_t hy;
	    GET_FLOAT_WORD(hy,y);
	    SET_FLOAT_WORD(y,hy+((int32_t)k<<23));	/* add k to y's exponent */
	    return y;
	} else {
	    __uint32_t hy;
	    GET_FLOAT_WORD(hy,y);
	    SET_FLOAT_WORD(y,hy+((int32_t)(k+100)<<23));	/* add k to y's exponent */
	    return y*7.8886090522e-31f;
	}
}
