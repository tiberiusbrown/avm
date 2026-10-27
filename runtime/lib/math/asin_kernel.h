#ifndef AVM_ASIN_KERNEL_H
#define AVM_ASIN_KERNEL_H
#include "fdlibm.h"
#include "c99_poly.h"

/* Only [0,1/2] reaches this odd degree-nine approximation. */
static __attribute__((always_inline)) inline float avm_asin_small(float x)
{
    float z = x*x;
    return x + (x*z)*avm_asin_tail(z);
}

static __attribute__((always_inline)) inline float avm_asin_sqrt(float x)
{
#ifdef __AVM__
    register float y __asm__("q2") = x;
    __asm__("fsqrt" : "+r"(y));
    return y;
#else
    return sqrtf(x);
#endif
}
#endif
