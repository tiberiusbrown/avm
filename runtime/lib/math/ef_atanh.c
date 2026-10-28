#include "fdlibm.h"
#include "hyperbolic_poly.h"

float atanhf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if (a <= 0x3f000000UL) return x*avm_atanh_small(x*x);
    if (a > 0x7f800000UL) return x+x;
    if (AVM_MATH_UNLIKELY(a >= 0x3f800000UL)) {
        errno = a == 0x3f800000UL ? ERANGE : EDOM;
        if (a == 0x3f800000UL) return __math_oflowf(u >> 31);
        SET_FLOAT_WORD(x, 0x7fc00000UL);
        return x;
    }
    float t, r;
    SET_FLOAT_WORD(t, a);
    r = 0.5f*log1pf((2.0f*t)/(1.0f-t));
    GET_FLOAT_WORD(a, r);
    SET_FLOAT_WORD(r, a | (u & 0x80000000UL));
    return r;
}
