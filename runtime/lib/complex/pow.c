#include "complex_internal.h"
extern float complex __mulsc3(float,float,float,float);
static __attribute__((noinline)) float complex cx_pow_zero(float complex z,float complex w) {
    float a=__real__ w,phase=atan2f(__imag__ z,__real__ z),s,c;
    if(phase==0) { s=copysignf(0,a*phase);c=1; }
    else if(fabsf(a)>=0x1p24f) {
        /* These binary32 exponents are even integers. */
        s=copysignf(0,-a*phase);c=1;
    } else {
        float t=2*fmodf(a,2);
        int q=(int)t;
        if(t==(float)q) {
            if(phase<0) q=-q;
            q&=3;
            if(q&1) {s=q==1?1:-1;c=copysignf(0,s*a*phase);}
            else {c=q==0?1:-1;s=copysignf(0,-c*a*phase);}
        } else sincosf(a*phase,&s,&c);
    }
    return CX(cx_product(a>0?0:INFINITY,c),cx_product(a>0?0:INFINITY,s));
}
/* AVM chooses 0**0 = 1 and 1**w = 1, including nonfinite w.
   Separate paths keep their scalar and complex temporaries independent. */
float complex cpowf(float complex z,float complex w) {
    float x=__real__ z,y=__imag__ z,a=__real__ w,b=__imag__ w;
    if(a==0 && b==0) return CX(1,0);
    if(x==1 && y==0) return CX(1,isfinite(a)&&isfinite(b)?a*y+b*0.0f:0);
    if(x==0 && y==0 && b==0 && isfinite(a)) {
        return cx_pow_zero(z,w);
    }
    float complex l=clogf(z);
    return cx_exp(__mulsc3(a,b,__real__ l,__imag__ l));
}
