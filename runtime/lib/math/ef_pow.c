/* ef_pow.c -- float version of e_pow.c.
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
#include "log_kernel.h"

	float __ieee754_powf(float x, float y)
{
	float z,ax,z_h,z_l,p_h,p_l;
	float y1,t1,t2,r,s,t,u,v,w;
	__int32_t i,j,k,yisint,n;
	__int32_t hx,hy,ix,iy,is;

	GET_FLOAT_WORD(hx,x);
	GET_FLOAT_WORD(hy,y);
	ix = hx&0x7fffffff;  iy = hy&0x7fffffff;

    /* y==zero: x**0 = 1 */
	if(FLT_UWORD_IS_ZERO(iy)) {
	    if (issignalingf_inline(x)) return x + y;
	    return 1.0f;
	}

    /* x|y==NaN return NaN unless x==1 then return 1 */
	if(FLT_UWORD_IS_NAN(ix) ||
	   FLT_UWORD_IS_NAN(iy)) {
	    if(hx==0x3f800000 && !issignalingf_inline(y)) return 1.0f;
	    else return x + y;
	}

    /* determine if y is an odd int when x < 0
     * yisint = 0	... y is not an integer
     * yisint = 1	... y is an odd int
     * yisint = 2	... y is an even int
     */
	yisint  = 0;
	if(hx<0) {	
	    if(iy>=0x4b800000) yisint = 2; /* even integer y */
	    else if(iy>=0x3f800000) {
		k = (iy>>23)-0x7f;	   /* exponent */
		j = iy>>(23-k);
		if((j<<(23-k))==iy) yisint = 2-(j&1);
	    }		
	} 

    /* special value of y */
	if (FLT_UWORD_IS_INFINITE(iy)) {	/* y is +-inf */
	    if (ix==0x3f800000)
		return 1.0f;		/* +-1**+-inf = 1 */
	    else if (ix > 0x3f800000)/* (|x|>1)**+-inf = inf,0 */
	        return (hy>=0)? y: 0.0f;
	    else			/* (|x|<1)**-,+inf = inf,0 */
	        return (hy<0)?-y: 0.0f;
	} 
	if(iy==0x3f800000) {	/* y is  +-1 */
	    if(hy<0) return 1.0f/x; else return x;
	}
	if(hy==0x40000000) return x*x; /* y is  2 */
	/* Integer powers +/-3, +/-4 and +/-5 need no logarithm or exponential.
	   Repeated squaring at +/-6..8 can exceed the four-ULP error budget.
	   Bounds keep every intermediate and its reciprocal normal and finite. Values outside
	   this interval retain the full overflow/subnormal handling below. */
	if(iy>=0x40400000 && iy<=0x40a00000 &&
	   ix>=0x38000000 && ix<=0x47000000 &&
	   (iy==0x40400000 || iy==0x40800000 || iy==0x40a00000)) {
	    float square = x*x;
	    float product;
	    if(iy==0x40400000) product = square*x;
	    else {
	        product = square*square;
	        if(iy==0x40a00000) product *= x;
	    }
	    return hy<0 ? 1.0f/product : product;
	}
	if(hy==0x3f000000) {	/* y is  0.5 */
	    if(hx>=0)	/* x >= +0 */
	    return __ieee754_sqrtf(x);	
	}
	/* In this bounded positive interval, log(x)*y has magnitude below
	   0.867. Its error is not amplified by a large exponent, and exp cannot
	   overflow or underflow. Difficult ranges retain the split fdlibm path. */
	if(iy<=0x3fa00000 && (uint32_t)hx>=0x3f000000UL &&
	   (uint32_t)hx<=0x40000000UL)
	    return __ieee754_expf(y*avm_log_kernel(x));

	ax   = __builtin_fabsf(x);
    /* special value of x */
	if(FLT_UWORD_IS_INFINITE(ix)||FLT_UWORD_IS_ZERO(ix)||ix==0x3f800000){
	    z = ax;			/*x is +-0,+-inf,+-1*/
	    if(hy<0) z = 1.0f/z;	/* z = (1/|x|) */
	    if(hx<0) {
		if(((ix-0x3f800000)|yisint)==0) {
		    z = (z-z)/(z-z); /* (-1)**non-int is NaN */
		} else if(yisint==1) 
		    z = -z;		/* (x<0)**odd = -(|x|**odd) */
	    }
	    return z;
	}
    
    /* (x<0)**(non-int) is NaN */
	if(((((__uint32_t)hx>>31)-1)|yisint)==0) return (x-x)/(x-x);

    /* |y| is huge */
	if(iy>0x4d000000) { /* if |y| > 2**27 */
	/* over/underflow if x is not close to one */
	    if(ix<0x3f7ffff4) return (hy<0)? __math_oflowf(0):__math_uflowf(0);
	    if(ix>0x3f800007) return (hy>0)? __math_oflowf(0):__math_uflowf(0);
	/* now |1-x| is tiny <= 2**-20, suffice to compute 
	   log(x) by x-x^2/2+x^3/3-x^4/4 */
	    t = ax-1;		/* t has 20 trailing zeros */
	    w = (t*t)*((float)0.5-t*((float)0.333333333333-t*(float)0.25));
	    u = 1.4426879883e+00f*t;	/* ivln2_h has 16 sig. bits */
	    v = t*7.0526075433e-06f-w*1.4426950216e+00f;
	    t1 = u+v;
	    GET_FLOAT_WORD(is,t1);
	    SET_FLOAT_WORD(t1,is&0xfffff000);
	    t2 = v-(t1-u);
	} else {
	    float s2,s_h,s_l,t_h,t_l;
	    n = 0;
	/* take care subnormal number */
	    if(FLT_UWORD_IS_SUBNORMAL(ix))
		{ax *= 16777216.0f; n -= 24; GET_FLOAT_WORD(ix,ax); }
	    n  += ((ix)>>23)-0x7f;
	    j  = ix&0x007fffff;
	/* determine interval */
	    ix = j|0x3f800000;		/* normalize ix */
	    if(j<=0x1cc471) k=0;	/* |x|<sqrt(3/2) */
	    else if(j<0x5db3d7) k=1;	/* |x|<sqrt(3)   */
	    else {k=0;n+=1;ix -= 0x00800000;}
	    SET_FLOAT_WORD(ax,ix);

	/* compute s = s_h+s_l = (x-1)/(x+1) or (x-1.5)/(x+1.5) */
	    u = ax-((k == 0 ? 1.0f : 1.5f));		/* (1.0f)=1.0, (1.5f)=1.5 */
	    v = 1.0f/(ax+((k == 0 ? 1.0f : 1.5f)));
	    s = u*v;
	    s_h = s;
	    GET_FLOAT_WORD(is,s_h);
	    SET_FLOAT_WORD(s_h,is&0xfffff000);
	/* t_h=ax+((k == 0 ? 1.0f : 1.5f)) High */
        is = ((ix >> 1) & 0xfffff000U) | 0x20000000;
        SET_FLOAT_WORD(t_h, is + 0x00400000 + (k << 21));
	    t_l = ax - (t_h-((k == 0 ? 1.0f : 1.5f)));
	    s_l = v*((u-s_h*t_h)-s_h*t_l);
	/* compute log(ax) */
	    s2 = s*s;
	    r = s2*s2*(6.0000002384e-01f+s2*(4.2857143283e-01f+s2*(3.3333334327e-01f+s2*(2.7272811532e-01f+s2*(2.3066075146e-01f+s2*2.0697501302e-01f)))));
	    r += s_l*(s_h+s);
	    s2  = s_h*s_h;
	    t_h = (float)3.0+s2+r;
	    GET_FLOAT_WORD(is,t_h);
	    SET_FLOAT_WORD(t_h,is&0xfffff000);
	    t_l = r-((t_h-(float)3.0)-s2);
	/* u+v = s*(1+...) */
	    u = s_h*t_h;
	    v = s_l*t_h+t_l*s;
	/* 2/(3log2)*(s+...) */
	    p_h = u+v;
	    GET_FLOAT_WORD(is,p_h);
	    SET_FLOAT_WORD(p_h,is&0xfffff000);
	    p_l = v-(p_h-u);
	    z_h = 9.6191406250e-01f*p_h;		/* cp_h+cp_l = 2/(3*log2) */
	    z_l = (-1.1736857402e-04f)*p_h+p_l*9.6179670095e-01f+((k == 0 ? 0.0f : 1.56322085e-06f));
	/* log2(ax) = (s+..)*2/(3*log2) = n + dp_h + z_h + z_l */
	    t = (float)n;
	    t1 = (((z_h+z_l)+((k == 0 ? 0.0f : 5.84960938e-01f)))+t);
	    GET_FLOAT_WORD(is,t1);
	    SET_FLOAT_WORD(t1,is&0xfffff000);
	    t2 = z_l-(((t1-t)-((k == 0 ? 0.0f : 5.84960938e-01f)))-z_h);
	}

	s = 1.0f; /* s (sign of result -ve**odd) = -1 else = 1 */
	if(((((__uint32_t)hx>>31)-1)|(yisint-1))==0)
	    s = -1.0f;	/* (-ve)**(odd int) */

    /* split up y into y1+y2 and compute (y1+y2)*(t1+t2) */
	GET_FLOAT_WORD(is,y);
	SET_FLOAT_WORD(y1,is&0xfffff000);
	p_l = (y-y1)*t1+y*t2;
	p_h = y1*t1;
	z = p_l+p_h;
	GET_FLOAT_WORD(j,z);
	i = j&0x7fffffff;
	if (j>0) {
	    if (i>FLT_UWORD_EXP_MAX)
	        return __math_oflowf(s<0);			/* overflow */
	    else if (i==FLT_UWORD_EXP_MAX)
	        if(p_l+4.2995665694e-08f>z-p_h) return __math_oflowf(s<0);	/* overflow */
        } else {
	    if (i>FLT_UWORD_EXP_MIN)
	        return __math_uflowf(s<0);			/* underflow */
	    else if (i==FLT_UWORD_EXP_MIN)
		if(p_l<=z-p_h) return __math_uflowf(s<0);	/* underflow */
	}
    /*
     * compute 2**(p_h+p_l)
     */
	k = (i>>23)-0x7f;
	n = 0;
	if(i>0x3f000000) {		/* if |z| > 0.5, set n = [z+0.5] */
	    n = j+(0x00800000>>(k+1));
	    k = ((n&0x7fffffff)>>23)-0x7f;	/* new k for n */
	    SET_FLOAT_WORD(t,n&~(0x007fffff>>k));
	    n = ((n&0x007fffff)|0x00800000)>>(23-k);
	    if(j<0) n = -n;
	    p_h -= t;
	} 
	t = p_l+p_h;
	GET_FLOAT_WORD(is,t);
	SET_FLOAT_WORD(t,is&0xffff8000);
	u = t*6.93145752e-01f;
	v = (p_l-(t-p_h))*6.9314718246e-01f+t*1.42860654e-06f;
	z = u+v;
	w = v-(z-u);
	t  = z*z;
	t1  = z - t*(1.6666667163e-01f+t*((-2.7777778450e-03f)+t*(6.6137559770e-05f+t*((-1.6533901999e-06f)+t*4.1381369442e-08f))));
	r  = (z*t1)/(t1-2.0f)-(w+z*w);
	z  = 1.0f-(r-z);
	GET_FLOAT_WORD(j,z);
	uint32_t scaled = (uint32_t)j+((uint32_t)n<<23);
	if(scaled<0x00800000UL || scaled>=0x80000000UL)
	    z = scalbnf(z,(int)n);	/* subnormal output */
	else SET_FLOAT_WORD(z,scaled);
	return s*z;
}
