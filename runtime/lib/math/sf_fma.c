/* AVM uses avr-libc flt40_t multiply/add precision with one final rounding. */
#include "fdlibm.h"
#ifndef __AVM__
#include "native_math.h"
#endif
static float avm_impl_fmaf(float x, float y, float z)
{
#ifdef __AVM__
    register float a __asm__("q2") = x;
    register float b __asm__("q3") = y;
    register float c __asm__("q0") = z;
    __asm__("fma" : "+r"(a) : "r"(b), "r"(c));
    return a;
#else
    return avm_native_fma(x, y, z);
#endif
}

/* Report errors from the public operation, not intermediate helpers. */
float fmaf(float x, float y, float z)
{
    float result = avm_impl_fmaf(x, y, z);
    if (AVM_MATH_UNLIKELY(avm_math_high(result) >= 0x7f80U)) {
        if (AVM_MATH_UNLIKELY(!avm_math_nan(x) && !avm_math_nan(y) && !avm_math_nan(z) && avm_math_nan(result))) errno = EDOM;
        else if (AVM_MATH_UNLIKELY(avm_math_finite(x) && avm_math_finite(y) && avm_math_finite(z) && avm_math_inf(result))) errno = ERANGE;
    }
    return result;
}
