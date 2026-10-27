#include "asin_kernel.h"

float asinf(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffUL;
    if (a > 0x3f800000UL) { SET_FLOAT_WORD(x, u | 0x7fc00000UL); return x; }
    if (a < 0x39800000UL) return x;
    float y = __builtin_fabsf(x);
    if (a <= 0x3f000000UL) y = avm_asin_small(y);
    else y = 0x1.921fb6p0f - 2.0f*avm_asin_small(avm_asin_sqrt((1.0f-y)*0.5f));
    GET_FLOAT_WORD(a, y);
    SET_FLOAT_WORD(y, a | (u & 0x80000000UL));
    return y;
}
