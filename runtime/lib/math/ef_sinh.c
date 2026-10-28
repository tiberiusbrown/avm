#include "fdlibm.h"
#include "hyperbolic_poly.h"
#include "hyperbolic_kernel.h"

float sinhf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    uint16_t high = (uint16_t)(a >> 16);
    if (high < 0x3f80U) {
        if (AVM_MATH_UNLIKELY(a && high < 0x0080U)) errno = ERANGE;
        return x*avm_sinh_small(x*x);
    }
    if (high >= 0x7f80U) return x+x;
    float t, r;
    SET_FLOAT_WORD(t, a);
    if (high < 0x4110U) {
        /* One exponential and reciprocal, as in avr-libc's sinh/cosh. */
        t = __avm_expf_noerrno(t);
        r = 0.5f*(t-1.0f/t);
    } else {
        /* The reciprocal term is below binary32 precision here. Moving
           the factor 1/2 into the exponent keeps the full finite range. */
        if (AVM_MATH_UNLIKELY(a > 0x42b2d4fcUL)) { errno = ERANGE; return __math_oflowf(u >> 31); }
        r = avm_exp_half(t);
    }
    GET_FLOAT_WORD(a, r);
    SET_FLOAT_WORD(r, a | (u & 0x80000000UL));
    return r;
}
