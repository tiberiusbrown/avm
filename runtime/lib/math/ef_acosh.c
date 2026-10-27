#include "fdlibm.h"
#include "native_math.h"
#include "hyperbolic_poly.h"

float acoshf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    if ((u & 0x7fffffffUL) > 0x7f800000UL) return x+x;
    uint16_t high = (uint16_t)(u >> 16);
    if ((int16_t)high < 0x3f80) {
        SET_FLOAT_WORD(x, 0x7fc00000UL);
        return x;
    }
    if (high >= 0x4580U) return logf(x)+0x1.62e43p-1f;
    if (high >= 0x4000U) return logf(x+avm_native_sqrt(x*x-1.0f));
    /* Unity-anchored acosh(1+d)/sqrt(2*d) fit on [0,1]. The factored
       endpoint avoids cancellation and replaces the small log1p call. */
    float d = x-1.0f;
    return avm_native_sqrt(2.0f*d)*avm_acosh_small(d);
}
