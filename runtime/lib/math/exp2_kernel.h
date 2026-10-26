#ifndef AVM_EXP2_KERNEL_H
#define AVM_EXP2_KERNEL_H
#include "fdlibm.h"
#include "exp_poly.h"

/* Direct base-two evaluation, shared with the phase-2 exponential fit.
   Classify before converting: pow's product can itself overflow. */
static __attribute__((always_inline)) inline float avm_exp2_kernel(float u)
{
    if (u >= 128.0f) return __math_oflowf(0);
    if (u <= -150.0f) return 0.0f;
    int k=(int)(u+(u < 0 ? -0.5f : 0.5f));
    float r=u-(float)k;
    float result=avm_exp_polynomial(r);
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
#endif
