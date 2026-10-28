#include "exponent_kernel.h"
float logbf(float x)
{
    uint32_t a;
    GET_FLOAT_WORD(a, x);
    a &= 0x7fffffffUL;
    if (!a) { errno = ERANGE; return __math_oflowf(1); }
    if (a >= 0x7f800000UL) return a > 0x7f800000UL ? x+x : __math_oflowf(0);
    return (float)avm_float_exponent(a);
}
