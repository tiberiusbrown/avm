#include "fdlibm.h"
#include "c99_poly.h"

float expm1f(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if (a <= 0x3f800000UL) {
        /* Unity-anchored expm1(x)/x fit on [-1,1]: no tiny-input dispatch. */
        return x*avm_expm1_small(x);
    }
    return expf(x) - 1.0f;
}
