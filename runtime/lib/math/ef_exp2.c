#include "exp2_kernel.h"
#include "c99_poly.h"

float exp2f(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint16_t high = (uint16_t)(u >> 16);
    uint16_t magnitude_high = high & 0x7fffU;
    if (AVM_MATH_UNLIKELY(magnitude_high >= 0x7f80U)) {
        if (magnitude_high != 0x7f80U || (uint16_t)u) return x+x;
        return high & 0x8000U ? 0.0f : x;
    }
    if (AVM_MATH_UNLIKELY((int16_t)high >= 0x4300)) { errno = ERANGE; return __math_oflowf(0); }
    if (AVM_MATH_UNLIKELY(high >= 0xc316U)) { errno = ERANGE; return 0.0f; }
    float bias;
    SET_FLOAT_WORD(bias, (u & 0x80000000UL) | 0x3f000000UL);
    int k = (int)(x+bias);
    /* P(0)=1 preserves exact powers without integer-input dispatch. */
    float result = avm_exp2_scale(avm_exp2_polynomial(x-(float)k), k);
    return AVM_MATH_UNLIKELY(k < -125) ? avm_math_check_range(result) : result;
}
