#ifndef AVM_EXP2_KERNEL_H
#define AVM_EXP2_KERNEL_H
#include "fdlibm.h"
#include "exp_poly.h"

/* Shared exponent reconstruction, with one final rounding for subnormals. */
static __attribute__((always_inline)) inline float avm_exp2_scale(float result, int k)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits,result);
    if (k >= -125) {
        bits += (uint32_t)k << 23;
        SET_FLOAT_WORD(result,bits);
        return result;
    }
    bits += (uint32_t)(k+100) << 23;
    SET_FLOAT_WORD(result,bits);
    return result*0x1p-100f;
}

/* Direct base-two evaluation, shared with the phase-2 exponential fit.
   Classify before converting: pow's product can itself overflow. */
static __attribute__((always_inline)) inline float avm_exp2_kernel(float u)
{
    uint32_t bits;
    GET_FLOAT_WORD(bits, u);
    /* Callers exclude NaNs. Both boundary encodings have zero low words,
       so native-word comparisons suffice. Negative encodings sort backward. */
    uint16_t high = (uint16_t)(bits >> 16);
    if ((int16_t)high >= 0x4300) return __math_oflowf(0);
    if (high >= 0xc316U) return 0.0f;
    int k=(int)(u+(u < 0 ? -0.5f : 0.5f));
    return avm_exp2_scale(avm_exp_polynomial(u-(float)k), k);
}
#endif
