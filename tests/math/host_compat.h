#ifndef AVM_MATH_HOST_COMPAT_H
#define AVM_MATH_HOST_COMPAT_H

/* Only the host reference target uses this shim. AVM retains inlining and
   musttail attributes; MSVC needs ordinary C functions for the same source. */
#if defined(_MSC_VER) && !defined(__clang__)
#include <stdint.h>
#define __attribute__(attributes)
static inline float avm_host_fabsf(float x)
{
    union { float f; uint32_t u; } v = {x};
    v.u &= 0x7fffffffU;
    return v.f;
}
static inline float avm_host_copysignf(float x, float y)
{
    union { float f; uint32_t u; } a = {x}, b = {y};
    a.u = (a.u & 0x7fffffffU) | (b.u & 0x80000000U);
    return a.f;
}
#define __builtin_fabsf avm_host_fabsf
#define __builtin_copysignf avm_host_copysignf
static inline int avm_host_clz(unsigned x)
{
    unsigned mask = 1U << (sizeof(unsigned)*8-1);
    int count = 0;
    while (!(x & mask)) { ++count; mask >>= 1; }
    return count;
}
#define __builtin_clz avm_host_clz
#endif

#endif
