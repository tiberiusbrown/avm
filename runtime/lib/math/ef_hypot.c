/* ef_hypot.c -- float version of e_hypot.c.
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

	float __ieee754_hypotf(float x, float y)
{
	float a=x,b=y,t1,w;
	__int32_t j,k,ha,hb;

	GET_FLOAT_WORD(ha,x);
	ha &= 0x7fffffffL;
	GET_FLOAT_WORD(hb,y);
	hb &= 0x7fffffffL;
	if(hb > ha) { j = ha; ha = hb; hb = j; }
	SET_FLOAT_WORD(a,ha);	/* a <- |a| */
	SET_FLOAT_WORD(b,hb);	/* b <- |b| */
	if((ha-hb)>0xf000000L) {return a+b;} /* x/y > 2**30 */
	k=0;
	if(ha > 0x58800000L) {	/* a>2**50 */
	   if(!FLT_UWORD_IS_FINITE(ha)) {	/* Inf or NaN */
	       w = a+b;			/* for sNaN */
	       if(FLT_UWORD_IS_INFINITE(ha)) w = a;
	       if(FLT_UWORD_IS_INFINITE(hb)) w = b;
	       return w;
	   }
	   /* scale a and b by 2**-68 */
	   ha -= 0x22000000L; hb -= 0x22000000L;	k += 68;
	   SET_FLOAT_WORD(a,ha);
	   SET_FLOAT_WORD(b,hb);
	}
	if(hb < 0x26800000L) {	/* b < 2**-50 */
	    if(FLT_UWORD_IS_ZERO(hb)) {
	        return a;
	    } else if(FLT_UWORD_IS_SUBNORMAL(hb)) {
		SET_FLOAT_WORD(t1,0x7e800000L);	/* t1=2^126 */
		b *= t1;
		a *= t1;
		k -= 126;
	    } else {		/* scale a and b by 2^68 */
	        ha += 0x22000000; 	/* a *= 2^68 */
		hb += 0x22000000;	/* b *= 2^68 */
		k -= 68;
		SET_FLOAT_WORD(a,ha);
		SET_FLOAT_WORD(b,hb);
	    }
	}
    /* Scaling above keeps the sum of squares in the normal finite range.
       Binary32 products suffice for the runtime's four-ULP contract. */
	w = __ieee754_sqrtf(a*a+b*b);
	if(k!=0) {
	    SET_FLOAT_WORD(t1,0x3f800000UL+((uint32_t)k<<23));
	    return t1*w;
	} else return w;
}
