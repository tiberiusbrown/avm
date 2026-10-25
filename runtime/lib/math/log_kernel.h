#ifndef AVM_LOG_KERNEL_H
#define AVM_LOG_KERNEL_H
/* ef_log.c -- float version of e_log.c.
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

	static __attribute__((always_inline)) inline float avm_log_kernel(float x)
{
	float hfsq,f,s,z,R,w,t1,t2,dk;
	__int32_t ix,i,j;
	int k;

	GET_FLOAT_WORD(ix,x);

	k=0;
	if (FLT_UWORD_IS_ZERO(ix&0x7fffffff))
	    return -3.355443200e+07f/0.0f;		/* log(+-0)=-inf */
        if (ix<0) return (x-x)/0.0f;	/* log(-#) = NaN */
	if (!FLT_UWORD_IS_FINITE(ix)) return x+x;
	if (FLT_UWORD_IS_SUBNORMAL(ix)) {
	    k -= 25; x *= 3.355443200e+07f; /* subnormal number, scale up x */
	    GET_FLOAT_WORD(ix,x);
	} 
	k += (ix>>23)-127;
	ix &= 0x007fffff;
	i = (ix+(0x95f64<<3))&0x800000;
	SET_FLOAT_WORD(x,ix|(i^0x3f800000));	/* normalize x or x/2 */
	k += (i>>23);
	f = x-(float)1.0;
	if((0x007fffff&(15+ix))<16) {	/* |f| < 2**-20 */
           if(f==0.0f) { if(k==0) return 0.0f;  else {dk=(float)k;
                                return dk*6.9313812256e-01f+dk*9.0580006145e-06f;}}
	    R = f*f*((float)0.5-(float)0.33333333333333333*f);
	    if(k==0) return f-R; else {dk=(float)k;
                     return dk*6.9313812256e-01f-((R-dk*9.0580006145e-06f)-f);}
	}
 	s = f/((float)2.0+f); 
	dk = (float)k;
	z = s*s;
	i = ix-(0x6147a<<3);
	w = z*z;
	j = (0x6b851<<3)-ix;
        t1= w*(4.0000000596e-01f+w*(2.2222198546e-01f+w*1.5313838422e-01f));
        t2= z*(6.6666668653e-01f+w*(2.8571429849e-01f+w*(1.8183572590e-01f+w*1.4798198640e-01f)));
	i |= j;
	R = t2+t1;
	if(i>0) {
	    hfsq=(float)0.5*f*f;
	    if(k==0) return f-(hfsq-s*(hfsq+R)); else
		     return dk*6.9313812256e-01f-((hfsq-(s*(hfsq+R)+dk*9.0580006145e-06f))-f);
	} else {
	    if(k==0) return f-s*(f-R); else
		     return dk*6.9313812256e-01f-((s*(f-R)-dk*9.0580006145e-06f)-f);
	}
}

#endif
