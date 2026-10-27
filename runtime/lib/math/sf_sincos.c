#include "native_math.h"
#include "trig_poly.h"

/* The paired path shares one reduction and one squared argument. */
void sincosf(float x, float *sine, float *cosine)
{
    int n;
    x=avm_native_rempio2(x,&n);
    float z=x*x;
    float s=x*avm_sin_polynomial(z);
    float c=avm_cos_polynomial(z);
    if (n&1) { float t=s; s=c; c=-t; }
    if (n&2) { s=-s; c=-c; }
    *sine=s;
    *cosine=c;
}
