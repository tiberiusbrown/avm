#include "complex_internal.h"
float complex cexpf(float complex z) {return cx_exp(z);}
float complex clogf(float complex z) {
    float x=__real__ z,y=__imag__ z,a=fabsf(x),b=fabsf(y),r;
    if(a<b) { float t=a;a=b;b=t; }
    if(isinf(a)||isinf(b)) r=INFINITY;
    else if(isnan(a)||isnan(b)) r=NAN;
    else if(a>0.5f && a<1.5f && b<0.5f)
        r=0.5f*log1pf((a-1)*(a+1)+b*b);
    else if(a!=0) r=logf(a)+0.5f*log1pf((b/a)*(b/a));
    else r=logf(a);
    return CX(r,atan2f(y,x));
}
