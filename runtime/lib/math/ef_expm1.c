#include "fdlibm.h"
#include "fpoly.h"

float expm1f(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if (a < 0x33800000UL) return x;
    if (a <= 0x3f000000UL) {
        /* Degree-six Taylor on [-1/2,1/2], factored to retain tiny x. */
        float p = AVM_FPOLY5(x, 1.0f/720, 1.0f/120, 1.0f/24, 1.0f/6, 0.5f);
        return x + (x*x)*p;
    }
    return expf(x) - 1.0f;
}
