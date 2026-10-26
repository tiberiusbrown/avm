#include "fdlibm.h"
#include "trig_poly.h"

/* Standalone sin/cos retain their own kernels. A paired request shares both
   argument reduction and the squared reduced argument. */
void sincosf(float x, float *sine, float *cosine)
{
    uint32_t ix;
    GET_FLOAT_WORD(ix,x);
    ix&=0x7fffffffUL;
    float s,c;
    int n=0;
    if (ix<=0x3f490fd8UL) {
        if (ix<0x39800000UL) { *sine=x; *cosine=1.0f; return; }
    } else {
        if (ix>=0x7f800000UL) { *sine=x-x; *cosine=x-x; return; }
        float y[2];
        n=__ieee754_rem_pio2f(x,y);
        x=y[0];
    }
    float z=x*x;
    s=x*avm_sin_polynomial(z);
    c=avm_cos_polynomial(z);
    if (n&1) { float t=s; s=c; c=-t; }
    if (n&2) { s=-s; c=-c; }
    *sine=s;
    *cosine=c;
}
