#ifndef AVM_ASIN_KERNEL_H
#define AVM_ASIN_KERNEL_H
#include "fdlibm.h"
#include "c99_poly.h"
#include "native_math.h"

/* Only [0,1/2] reaches this odd degree-nine approximation. */
static __attribute__((always_inline)) inline float avm_asin_small(float x)
{
    float z = x*x;
    return x + (x*z)*avm_asin_tail(z);
}

#endif
