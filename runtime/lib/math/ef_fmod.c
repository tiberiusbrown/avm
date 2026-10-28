/* ef_fmod.c -- float version of e_fmod.c.
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

/* 
 * __ieee754_fmodf(x,y)
 * Return x mod y in exact arithmetic
 * Method: shift and subtract
 */

#include "fdlibm.h"

#ifdef __AVM__
#include "native_math.h"
static __attribute__((noinline)) float avm_fmod_special(float x, float y)
{
    avm_math_remainder_domain(x, y);
    return avm_native_fmod(x, y);
}
float fmodf(float x, float y)
{
    if (AVM_MATH_UNLIKELY(avm_math_high(x) >= 0x7f80U))
        __attribute__((musttail)) return avm_fmod_special(x, y);
    uint32_t bits;
    GET_FLOAT_WORD(bits, y);
    if (AVM_MATH_UNLIKELY(!(uint16_t)bits && avm_math_high(y) == 0))
        __attribute__((musttail)) return avm_fmod_special(x, y);
    return avm_native_fmod(x, y);
}
#else
static __attribute__((always_inline)) inline int avm_fmod_subnormal_exponent(uint32_t word)
{
    /* Count in native words: AVM has a 16-bit clz, with no 32-bit helper.
       The input is nonzero, so neither builtin receives zero. */
    unsigned high = (uint16_t)(word >> 16);
    return high ? (int)(sizeof(unsigned)*8)-134-__builtin_clz(high)
                : (int)(sizeof(unsigned)*8)-150-__builtin_clz((unsigned)word);
}

	float __ieee754_fmodf(float x, float y)
{
    avm_math_remainder_domain(x, y);
	__int32_t hx,hy,hz,sx;
	int n,ix,iy;

	GET_FLOAT_WORD(hx,x);
	GET_FLOAT_WORD(hy,y);
	sx = hx&0x80000000;		/* sign of x */
	hx ^=sx;		/* |x| */
	hy &= 0x7fffffff;	/* |y| */

    /* purge off exception values */
	if(FLT_UWORD_IS_ZERO(hy)||
	   !FLT_UWORD_IS_FINITE(hx)||
	   FLT_UWORD_IS_NAN(hy))
	    return (x*y)/(x*y);
	if(hx<hy) return x;			/* |x|<|y| return x */
	if(hx==hy)
	    return __builtin_copysignf(0.0f, x);	/* |x|=|y| return x*0*/

    /* For y < x < 2*y, subtraction is exact by Sterbenz's lemma.
       Normal y permits testing this interval directly in its IEEE words. */
    if (hy >= 0x00800000L && (uint32_t)hx < (uint32_t)hy + 0x00800000UL) {
        return __builtin_copysignf(__builtin_fabsf(x) - __builtin_fabsf(y), x);
    }

    /* Note: y cannot be zero if we reach here. */

    /* determine ix = ilogb(x) */
	if(FLT_UWORD_IS_SUBNORMAL(hx)) {	/* subnormal x */
	    ix = avm_fmod_subnormal_exponent((uint32_t)hx);
	} else ix = (hx>>23)-127;

    /* determine iy = ilogb(y) */
	if(FLT_UWORD_IS_SUBNORMAL(hy)) {	/* subnormal y */
	    iy = avm_fmod_subnormal_exponent((uint32_t)hy);
	} else iy = (hy>>23)-127;

    /* set up {hx,lx}, {hy,ly} and align y to x */
	if(ix >= -126) 
	    hx = 0x00800000|(0x007fffff&hx);
	else {		/* subnormal x, shift x to normal */
	    n = -126-ix;
	    hx = hx<<n;
	}
	if(iy >= -126) 
	    hy = 0x00800000|(0x007fffff&hy);
	else {		/* subnormal y, shift y to normal */
	    n = -126-iy;
	    hy = hy<<n;
	}

    /* fix point fmod */
	n = ix - iy;
	while(n--) {
	    hz=hx-hy;
	    if(hz<0){hx = hx+hx;}
	    else {
	    	if(hz==0) 		/* return sign(x)*0 */
		    return __builtin_copysignf(0.0f, x);
	    	hx = hz+hz;
	    }
	}
	hz=hx-hy;
	if(hz>=0) {hx=hz;}

    /* convert back to floating value and restore the sign */
	if(hx==0) 			/* return sign(x)*0 */
	    return __builtin_copysignf(0.0f, x);	
	while(hx<0x00800000) {		/* normalize x */
	    hx = hx+hx;
	    iy -= 1;
	}
	if(iy>= -126) {		/* normalize output */
	    hx = ((hx-0x00800000)|((uint32_t)(iy+127)<<23));
	    SET_FLOAT_WORD(x,hx|sx);
	} else {		/* subnormal output */
	    /* If denormals are not supported, this code will generate a
	       zero representation.  */
	    n = -126 - iy;
	    hx >>= n;
	    SET_FLOAT_WORD(x,hx|sx);
	    x *= 1.0f;		/* create necessary signal */
	}
	return x;		/* exact output */
}

#endif
