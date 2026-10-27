#include "fdlibm.h"
#include "native_math.h"
#include "hyperbolic_poly.h"

float asinhf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    uint16_t high = (uint16_t)(a >> 16);
    if (high < 0x3f80U) return x*avm_asinh_small(x*x);
    if (high >= 0x7f80U) return x+x;
    float t, r;
    SET_FLOAT_WORD(t, a);
    /* Above 2^12, the omitted correction is below float precision;
       this also avoids overflow in the square and sum. */
    if (high >= 0x4580U) r = logf(t)+0x1.62e43p-1f;
    else r = logf(t+avm_native_sqrt(t*t+1.0f));
    GET_FLOAT_WORD(a, r);
    SET_FLOAT_WORD(r, a | (u & 0x80000000UL));
    return r;
}
