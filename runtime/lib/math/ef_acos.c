#include "asin_kernel.h"

float acosf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if (a > 0x3f800000UL) { SET_FLOAT_WORD(x, u | 0x7fc00000UL); return x; }
    if (a <= 0x3f000000UL) return 0x1.921fb6p0f-avm_asin_small(x);
    float y = 2.0f*avm_asin_small(avm_native_sqrt((1.0f-__builtin_fabsf(x))*0.5f));
    return u >> 31 ? 0x1.921fb6p1f-y : y;
}
