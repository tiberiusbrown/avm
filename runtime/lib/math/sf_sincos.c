#include "native_math.h"
#include "trig_poly.h"

/* The paired path shares one reduction and one squared argument. */
void sincosf(float x, float *sine, float *cosine)
{
    if (AVM_MATH_UNLIKELY(avm_math_high(x) == 0x7f80U)) {
        uint32_t u;
        GET_FLOAT_WORD(u, x);
        if (AVM_MATH_UNLIKELY(!(uint16_t)u)) errno = EDOM;
    }
    int n;
    x=avm_native_rempio2(x,&n);
    float z=x*x;
    float s=avm_native_mul(avm_sin_polynomial(z), x);
    float c=avm_cos_polynomial(z);
    if (n&1) { float t=s; s=c; c=-t; }
    if (n&2) { s=-s; c=-c; }
    *sine=s;
    *cosine=c;
}
