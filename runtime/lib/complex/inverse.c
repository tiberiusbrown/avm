#include "complex_internal.h"
/* Inputs here are bounded by 1e15; the ratio keeps squares in [0,1].
   This avoids both underflow of the dominant component and hypot's general
   overflow machinery on a domain where overflow is impossible. */
static __attribute__((always_inline)) inline float cx_bounded_norm(float x,float y) {
    float a=fabsf(x),b=fabsf(y),t;
    if(a<b) {t=a;a=b;b=t;}
    if(a==0) return 0;
    t=b/a;return a*sqrtf(1+t*t);
}
/* Elliptic coordinates avoid squaring z and cancellation in log(z+sqrt(z*z+1)).
   a=(hypot(x+1,y)+hypot(x-1,y))/2; rationalized differences retain tiny y. */
static float complex cx_acos(float x,float y) {
    float ax=fabsf(x),ay=fabsf(y),a,m,d,r,s,t,h,angle;
    if(isinf(ax)||isinf(ay)) {
        angle=isinf(ax)?(isinf(ay)?CX_PI*0.25f:0):CX_PI_2;
        if(x<0) angle=CX_PI-angle;
        if(isnan(x)||isnan(y)) angle=NAN;
        return CX(angle,-copysignf(INFINITY,y));
    }
    if(isnan(x)||isnan(y)) {
        if(x==0) return CX(CX_PI_2,NAN);
        return CX(NAN,NAN);
    }
    if(ay==0) {
        if(ax<=1) return CX(acosf(x),-y);
        return CX(x<0?CX_PI:0,-copysignf(acoshf(ax),y));
    }
    if(ax>1.0e15f || ay>1.0e15f) {
        float hi=fmaxf(ax,ay),lo=fminf(ax,ay),q=lo/hi;
        h=logf(hi)+0.5f*log1pf(q*q)+CX_LN2;
        return CX(atan2f(ay,x),-copysignf(h,y));
    }
    if(ax==1 && ay<1.0e-5f) {
        h=sqrtf(ay);
        return CX(x>0?h:CX_PI-h,-copysignf(h,y));
    }
    r=cx_bounded_norm(ax+1,ay);s=cx_bounded_norm(ax-1,ay);
    a=0.5f*r+0.5f*s;
    t=0.5f*(ay/(r+ax+1))*ay;
    if(ax>=1) {
        d=t+0.5f*(ay/(s+(ax-1)))*ay;
        m=ax-1+d;
    } else {
        m=t+0.5f*(ay/(s+(1-ax)))*ay;
        d=1-ax+m;
    }
    /* sqrt(d)*sqrt(a+ax) also works when their product would underflow. */
    t=sqrtf(d)*sqrtf(a+ax);
    angle=atan2f(t,x);
    h=log1pf(m+sqrtf(m)*sqrtf(m+2));
    /* m may round to zero for subnormal y; acosh(a) ~ |y|/sqrt(1-x*x). */
    if(m==0 && ax<1) h=ay/(sqrtf(1-ax)*sqrtf(1+ax));
    return CX(angle,-copysignf(h,y));
}
float complex cacosf(float complex z) { return cx_acos(__real__ z,__imag__ z); }
/* Keep the real angle away from pi/2 subtraction when it is small. */
static float cx_asin_angle(float x,float y,float complement) {
    if(isfinite(x)&&isfinite(y)&&(fabsf(x)<0.5f || fabsf(y)>2*fabsf(x))) {
        if(fabsf(x)>1.0e15f||fabsf(y)>1.0e15f) return atan2f(x,fabsf(y));
        float r=cx_bounded_norm(x+1,y),s=cx_bounded_norm(x-1,y);
        return asinf(x/(0.5f*r+0.5f*s));
    }
    return copysignf(CX_PI_2-complement,x);
}
float complex casinf(float complex z) {
    float x=__real__ z,y=__imag__ z;
    float complex w=cx_acos(fabsf(x),y);
    return CX(cx_asin_angle(x,y,__real__ w),-__imag__ w);
}
float complex cacoshf(float complex z) {
    float complex w=cx_acos(__real__ z,__imag__ z);
    return CX(fabsf(__imag__ w),copysignf(__real__ w,__imag__ z));
}
static __attribute__((noinline)) float complex cx_asinh_small(float x,float y) {
        float qr=x*x-y*y,qi=2*x*y,pr=3.0f/40-(5.0f/112)*qr,pi=-(5.0f/112)*qi,t;
        t=qr*pr-qi*pi;pi=qr*pi+qi*pr;pr=t-1.0f/6;
        t=qr*pr-qi*pi;pi=qr*pi+qi*pr;pr=t;
        return CX(copysignf(x+x*pr-y*pi,x),copysignf(y+x*pi+y*pr,y));
}
float complex casinhf(float complex z) {
    float x=__real__ z,y=__imag__ z;
    if(y==0) return CX(asinhf(x),y);
    if(x==0 && fabsf(y)<=1) return CX(x,asinf(y));
    if(fabsf(x)<=0.125f && fabsf(y)<=0.125f && x*x+y*y<=0.015625f) {
        return cx_asinh_small(x,y);
    }
    float complex w=cx_acos(fabsf(y),x);
    return CX(-__imag__ w,cx_asin_angle(y,x,__real__ w));
}
float complex catanhf(float complex z) {
    float x=__real__ z,y=__imag__ z,ax=fabsf(x),ay=fabsf(y),r,i,d;
    if(isinf(x)||isinf(y)) return CX(copysignf(0,x),isnan(y)?y:copysignf(CX_PI_2,y));
    if(isnan(x)||isnan(y)) {
        if(x==0) return CX(x,NAN);
        return CX(NAN,NAN);
    }
    if(ay==0) {
        if(ax==1) return CX(copysignf(INFINITY,x),y);
        if(ax<1) return CX(atanhf(x),y);
        return CX(copysignf(0.5f*log1pf(2/(ax-1)),x),copysignf(CX_PI_2,y));
    }
    if(ax>1.0e18f || ay>1.0e18f) {
        float m=fmaxf(ax,ay),u=ax/m,v=ay/m;
        r=(u/(u*u+v*v))/m;
        return CX(copysignf(r,x),copysignf(CX_PI_2,y));
    }
    d=(1-ax)*(1-ax)+ay*ay;
    if(d<1.0e-30f) r=0.5f*(logf(hypotf(1+ax,ay))-logf(hypotf(1-ax,ay)));
    else r=0.25f*log1pf(4*ax/d);
    i=0.5f*atan2f(2*ay,(1-ax)*(1+ax)-ay*ay);
    return CX(copysignf(r,x),copysignf(i,y));
}
float complex catanf(float complex z) {
    float complex w=catanhf(CX(-__imag__ z,__real__ z));
    return CX(__imag__ w,-__real__ w);
}
