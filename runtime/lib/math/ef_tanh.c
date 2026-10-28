#include "fdlibm.h"
#include "hyperbolic_poly.h"

float tanhf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    uint16_t high = (uint16_t)(a >> 16);
    if (high < 0x3f80U) return x*avm_tanh_small(x*x);
    if (a > 0x7f800000UL) return x+x;
    float t, r;
    if (high >= 0x4118U) r = 1.0f; /* tanh(9.5) rounds to one. */
    else {
        SET_FLOAT_WORD(t, a);
        t = __avm_expf_noerrno(-2.0f*t);
        r = (1.0f-t)/(1.0f+t);
    }
    GET_FLOAT_WORD(a, r);
    SET_FLOAT_WORD(r, a | (u & 0x80000000UL));
    return r;
}
