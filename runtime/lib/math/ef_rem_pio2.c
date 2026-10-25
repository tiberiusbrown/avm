/* ef_rem_pio2.c -- float version of e_rem_pio2.c
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

/* __ieee754_rem_pio2f(x,y)
 * 
 * return the remainder of x rem pi/2 in y[0]+y[1] 
 * use __kernel_rem_pio2f()
 */

#include "fdlibm.h"

/* This array is like the one in e_rem_pio2.c, but the numbers are
   single precision and the last 8 bits are forced to 0.  */

/*
 * invpio2:  24 bits of 2/pi
 * pio2_1:   first  17 bit of pi/2
 * pio2_1t:  pi/2 - pio2_1
 * pio2_2:   second 17 bit of pi/2
 * pio2_2t:  pi/2 - (pio2_1+pio2_2)
 * pio2_3:   third  17 bit of pi/2
 * pio2_3t:  pi/2 - (pio2_1+pio2_2+pio2_3)
 */

	int __ieee754_rem_pio2f(float x, float *y)
{
	float z,w,t,r,fn;
	__int32_t ix,hx;
	int i,j,n;

	GET_FLOAT_WORD(hx,x);
	ix = hx&0x7fffffff;
	if(ix<=0x3f490fd8)   /* |x| ~<= pi/4 , no need for reduction */
	    {y[0] = x; y[1] = 0; return 0;}
	if(ix<0x4016cbe4) {  /* |x| < 3pi/4, special case with n=+-1 */
	    if(hx>0) { 
		z = x - 1.5707855225e+00f;
		if((ix&0xfffffff0)!=0x3fc90fd0) { /* 24+24 bit pi OK */
		    y[0] = z - 1.0804334124e-05f;
		    y[1] = (z-y[0])-1.0804334124e-05f;
		} else {		/* near pi/2, use 24+24+24 bit pi */
		    z -= 1.0804273188e-05f;
		    y[0] = z - 6.0770999344e-11f;
		    y[1] = (z-y[0])-6.0770999344e-11f;
		}
		return 1;
	    } else {	/* negative x */
		z = x + 1.5707855225e+00f;
		if((ix&0xfffffff0)!=0x3fc90fd0) { /* 24+24 bit pi OK */
		    y[0] = z + 1.0804334124e-05f;
		    y[1] = (z-y[0])+1.0804334124e-05f;
		} else {		/* near pi/2, use 24+24+24 bit pi */
		    z += 1.0804273188e-05f;
		    y[0] = z + 6.0770999344e-11f;
		    y[1] = (z-y[0])+6.0770999344e-11f;
		}
		return -1;
	    }
	}
	if(ix<=0x43490f80) { /* |x| ~<= 2^7*(pi/2), medium size */
	    t  = __builtin_fabsf(x);
	    n  = (__int32_t) (t*6.3661980629e-01f+5.0000000000e-01f);
	    fn = (float)n;
	    r  = t-fn*1.5707855225e+00f;
	    w  = fn*1.0804334124e-05f;	/* 1st round good to 40 bit */
	    { /* Check actual cancellation without an indexed coefficient table. */
	        __uint32_t high;
	        j  = ix>>23;
	        y[0] = r-w; 
		GET_FLOAT_WORD(high,y[0]);
	        i = j-((high>>23)&0xff);
	        if(i>8) {  /* 2nd iteration needed, good to 57 */
		    t  = r;
                    w  = fn*1.0804273188e-05f;
		    r  = t-w;
                    w  = fn*6.0770999344e-11f-((t-r)-w);
		    y[0] = r-w;
		    GET_FLOAT_WORD(high,y[0]);
		    i = j-((high>>23)&0xff);
		    if(i>25)  {	/* 3rd iteration need, 74 bits acc */
		    	t  = r;	/* will cover all possible cases */
                        w  = fn*6.0770943833e-11f;
		    	r  = t-w;
                        w  = fn*6.1232342629e-17f-((t-r)-w);
		    	y[0] = r-w;
		    }
		}
	    }
	    y[1] = (r-y[0])-w;
	    if(hx<0) 	{y[0] = -y[0]; y[1] = -y[1]; return -n;}
	    else	 return n;
	}
    /* 
     * all other (large) arguments
     */
	if(!FLT_UWORD_IS_FINITE(ix)) {
	    y[0]=y[1]=x-x; return 0;
	}
    __attribute__((musttail)) return __kernel_rem_pio2f(x, y);
}
