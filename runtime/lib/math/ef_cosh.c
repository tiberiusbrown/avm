#include "fdlibm.h"
#include "hyperbolic_poly.h"
#include "hyperbolic_kernel.h"

float coshf(float x)
{
    uint32_t a;
    GET_FLOAT_WORD(a, x);
    a &= 0x7fffffffUL;
    if (a <= 0x3f800000UL) return avm_cosh_small(x*x);
    if (a > 0x7f800000UL) return x+x;
    float t;
    SET_FLOAT_WORD(t, a);
    if (a < 0x41100000UL) {
        t = expf(t);
        return 0.5f*(t+1.0f/t);
    }
    if (a > 0x42b2d4fcUL) return __math_oflowf(0);
    return avm_exp_half(t);
}
