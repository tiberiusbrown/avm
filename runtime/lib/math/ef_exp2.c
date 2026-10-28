#include "exp2_kernel.h"
#include "c99_poly.h"

float exp2f(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    if (AVM_MATH_UNLIKELY((u & 0x7fffffffUL) >= 0x7f800000UL))
        return (u & 0x7fffffffUL) > 0x7f800000UL ? x+x : (u >> 31 ? 0.0f : x);
    uint16_t high = (uint16_t)(u >> 16);
    if (AVM_MATH_UNLIKELY((int16_t)high >= 0x4300)) { errno = ERANGE; return __math_oflowf(0); }
    if (AVM_MATH_UNLIKELY(high >= 0xc316U)) { errno = ERANGE; return 0.0f; }
    int k = (int)(x+(u >> 31 ? -0.5f : 0.5f));
    /* P(0)=1 preserves exact powers without integer-input dispatch. */
    float result = avm_exp2_scale(avm_exp2_polynomial(x-(float)k), k);
    return AVM_MATH_UNLIKELY(k < -125) ? avm_math_check_range(result) : result;
}
