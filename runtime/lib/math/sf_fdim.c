#include "fdlibm.h"

static __attribute__((noinline, cold)) float avm_fdim_special(float x, float y)
{
    if (avm_math_nan(x) || avm_math_nan(y)) return x+y;
    return x > y ? x-y : 0.0f;
}

float fdimf(float x, float y)
{
    if (AVM_MATH_UNLIKELY(avm_math_high(x) >= 0x7f80U || avm_math_high(y) >= 0x7f80U))
        __attribute__((musttail)) return avm_fdim_special(x, y);
    /* Finite inputs: the zero branch cannot overflow, and no original
       operands need to stay live while classifying the subtraction. */
    if (x <= y) return 0.0f;
    float result = x-y;
    if (AVM_MATH_UNLIKELY(avm_math_high(result) == 0x7f80U)) errno = ERANGE;
    return result;
}
