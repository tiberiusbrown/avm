#include "fdlibm.h"

/* The iseqsig macro reports a domain error for a NaN operand and otherwise
   compares for equality. AVM has no floating-point exception flags. */
int __avm_iseqsigf(float x, float y)
{
    if (AVM_MATH_UNLIKELY(avm_math_nan(x) || avm_math_nan(y))) {
        errno = EDOM;
        return 0;
    }
    return x == y;
}
