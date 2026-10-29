#include "complex_internal.h"
float complex csinhf(float complex z) {
    float x=__real__ z,y=__imag__ z,s,c;
    if(y==0) return CX(sinhf(x),y);
    if(!isfinite(y)) return CX(x==0?x:(isinf(x)?INFINITY:NAN),NAN);
    sincosf(y,&s,&c);
    if(fabsf(x)>80) {
        float t=fabsf(x)-CX_LN2;
        return CX(copysignf(1,x)*cx_exp_product(t,c),cx_exp_product(t,s));
    }
    return CX(sinhf(x)*c,coshf(x)*s);
}
float complex ccoshf(float complex z) {
    float x=__real__ z,y=__imag__ z,s,c;
    if(y==0) return CX(coshf(x),isnan(x)?copysignf(0,y):cx_product(sinhf(x),y));
    if(!isfinite(y)) return CX(isinf(x)?INFINITY:NAN,x==0?0:NAN);
    sincosf(y,&s,&c);
    if(fabsf(x)>80) {
        float t=fabsf(x)-CX_LN2;
        return CX(cx_exp_product(t,c),copysignf(1,x)*cx_exp_product(t,s));
    }
    return CX(coshf(x)*c,sinhf(x)*s);
}
float complex ctanhf(float complex z) {
    float x=__real__ z,y=__imag__ z,s,c,t,d;
    if(y==0) return CX(tanhf(x),y);
    if(isinf(x)) return CX(copysignf(1,x),copysignf(0,isfinite(y)?sinf(y)*cosf(y):y));
    if(!isfinite(x)||!isfinite(y)) return CX(x==0?x:NAN,NAN);
    sincosf(y,&s,&c);
    if(fabsf(x)>10) return CX(copysignf(1,x),4*s*c*expf(-2*fabsf(x)));
    t=sinhf(x);d=t*t+c*c;
    return CX(t*coshf(x)/d,s*c/d);
}
