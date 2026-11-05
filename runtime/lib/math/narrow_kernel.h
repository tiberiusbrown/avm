#ifndef AVM_NARROW_KERNEL_H
#define AVM_NARROW_KERNEL_H
#include "fdlibm.h"

/* A NaN result is a domain error unless an operand is already NaN. An infinite
   result from finite operands is a range or pole error. Infinite operands give
   exact infinities, which do not report an error. The report stays out of line
   so each operation's hot path carries only the nonfinite test. */
static __attribute__((noinline, cold)) float
avm_narrow_report(float result, float x, float y)
{
    if (avm_math_nan(result)) {
        if (!avm_math_nan(x) && !avm_math_nan(y)) errno = EDOM;
    } else if (avm_math_finite(x) && avm_math_finite(y)) {
        errno = ERANGE;
    }
    return result;
}

static __attribute__((always_inline)) inline float
avm_narrow_result2(float result, float x, float y)
{
    if (AVM_MATH_UNLIKELY(avm_math_high(result) >= 0x7f80U)) return avm_narrow_report(result, x, y);
    return result;
}
#endif
