#include "exponent_kernel.h"
int ilogbf(float x)
{
    uint32_t a;
    GET_FLOAT_WORD(a, x);
    a &= 0x7fffffffUL;
    if (AVM_MATH_UNLIKELY(!a || a >= 0x7f800000UL)) errno = EDOM;
    if (!a) return FP_ILOGB0;
    if (a >= 0x7f800000UL) return a == 0x7f800000UL ? INT_MAX : FP_ILOGBNAN;
    return avm_float_exponent(a);
}
