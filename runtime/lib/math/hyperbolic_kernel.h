#ifndef AVM_HYPERBOLIC_KERNEL_H
#define AVM_HYPERBOLIC_KERNEL_H
#include "fdlibm.h"

/* The caller has already classified x <= the final finite sinh/cosh input.
   Rounding x-ln(2) can nevertheless cross expf's overflow threshold at that
   last input. Saturating that approximate result preserves the finite range
   within the same error budget, without extra reduction precision. */
static __attribute__((always_inline)) inline float avm_exp_half(float x)
{
    float y = __avm_expf_noerrno(x-0x1.62e43p-1f);
    uint32_t u;
    GET_FLOAT_WORD(u, y);
    if (u == 0x7f800000UL) SET_FLOAT_WORD(y, 0x7f7fffffUL);
    return y;
}
#endif
