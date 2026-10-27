#ifndef AVM_EXPONENT_KERNEL_H
#define AVM_EXPONENT_KERNEL_H
#include "fdlibm.h"
#include <limits.h>

/* Nonzero finite magnitude. Count subnormal leading zeros in native words. */
static __attribute__((always_inline)) inline int avm_float_exponent(uint32_t a)
{
    unsigned high = (uint16_t)(a >> 16);
    unsigned e = high >> 7;
    if (e) return (int)e-127;
    return high ? (int)(sizeof(unsigned)*8)-134-__builtin_clz(high)
                : (int)(sizeof(unsigned)*8)-150-__builtin_clz((unsigned)a);
}
#endif
