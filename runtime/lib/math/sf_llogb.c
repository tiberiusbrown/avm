#include "exponent_kernel.h"

/* Matches ilogbf: zero, infinite, and NaN inputs are domain errors. */
long llogbf(float x)
{
    uint32_t a;
    GET_FLOAT_WORD(a, x);
    a &= 0x7fffffffUL;
    if (AVM_MATH_UNLIKELY(!a || a >= 0x7f800000UL)) errno = EDOM;
    if (!a) return FP_LLOGB0;
    if (a >= 0x7f800000UL) return a == 0x7f800000UL ? LONG_MAX : FP_LLOGBNAN;
    return (long)avm_float_exponent(a);
}
