/* sf_scalbn.c -- float version of s_scalbn.c.
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
#include <limits.h>
#include <float.h>

#if INT_MAX > 50000
#define OVERFLOW_INT 50000
#else
#define OVERFLOW_INT 30000
#endif

	float scalbnf (float x, int n)
{
	__int32_t  k,ix;
	__uint32_t hx;

	GET_FLOAT_WORD(ix,x);
	hx = ix&0x7fffffff;
        k = hx>>23;		/* extract exponent */
	if (FLT_UWORD_IS_ZERO(hx))
	    return x;
        if (!FLT_UWORD_IS_FINITE(hx))
	    return x+x;		/* NaN or Inf */
        if (FLT_UWORD_IS_SUBNORMAL(hx)) {
	    x *= 3.355443200e+07f;
	    GET_FLOAT_WORD(ix,x);
	    k = ((ix&0x7f800000)>>23) - 25; 
            if (n < -30000) return 1.0e-30f*x; 	/*underflow*/
        }
        if (n > OVERFLOW_INT) 	/* in case integer overflow in n+k */
	    return 1.0e+30f*__builtin_copysignf(1.0e+30f,x);	/*overflow*/
        k = k+n; 
        if (k > FLT_LARGEST_EXP) return 1.0e+30f*__builtin_copysignf(1.0e+30f,x); /* overflow  */
        if (k > 0) 				/* normal result */
	    {SET_FLOAT_WORD(x,(ix&0x807fffff)|(k<<23)); return x;}
        if (k < FLT_SMALLEST_EXP)
	    return 1.0e-30f*__builtin_copysignf(1.0e-30f,x);	/*underflow*/
        k += 25;				/* subnormal result */
	SET_FLOAT_WORD(x,(ix&0x807fffff)|(k<<23));
        return x*2.9802322388e-08f;
}

