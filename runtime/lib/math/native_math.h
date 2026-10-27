#ifndef AVM_NATIVE_MATH_H
#define AVM_NATIVE_MATH_H
#include "fdlibm.h"
#ifdef __AVM__
static __attribute__((always_inline)) inline float avm_native_fma(float a, float b, float c)
{
    register float product __asm__("q2") = a;
    register float factor __asm__("q3") = b;
    register float addend __asm__("q0") = c;
    __asm__("fma" : "+r"(product) : "r"(factor), "r"(addend));
    return product;
}
#else
#include "fpoly.h"
static inline float avm_native_fma(float a, float b, float c)
{
    double product = avm_poly_extended((double)a*b);
    union { double d; uint64_t u; } p = {product}, z = {(double)c};
    unsigned ep = (unsigned)((p.u >> 52) & 2047);
    unsigned ez = (unsigned)((z.u >> 52) & 2047);
    /* __addsf3x discards the smaller operand outright for exponent gaps
       above 32. Model that avr-libc behavior even at a rounding midpoint. */
    if (ep != 2047 && ez != 2047) {
        unsigned ap = ep < 897 ? 897 : ep, az = ez < 897 ? 897 : ez;
        if (ap > az+32) return (float)product;
        if (az > ap+32) return c;
    }
    return (float)avm_poly_add(product, (double)c, 1);
}
#endif

static inline float avm_native_rempio2(float x, int *q)
{
#ifdef __AVM__
    /* The builtin returns an SSA pair. Its local quadrant store disappears
       under promotion; both physical outputs are explicit before allocation. */
    return __builtin_avm_rempio2(x, q);
#else
    /* Exact integer model of the native flt40_t constant, not host pi. */
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    uint32_t a = u & 0x7fffffffU;
    *q = 0;
    if (a >= 0x7f800000U) { SET_FLOAT_WORD(x, 0x7fc00000U); return x; }
    if (a <= 0x3f490fdaU) return x;
    int e = (int)(a >> 23) - 127;
    uint64_t r = (uint64_t)((a & 0x7fffffU) | 0x800000U) << 8;
    unsigned n = 0;
    const uint32_t d = 0xc90fdaa2U;
    if (e < 0) r >>= 1;
    else for (;;) {
        if (r >= d) { r -= d; ++n; }
        if (!e--) break;
        r <<= 1;
        n <<= 1;
    }
    int64_t signed_r = (int64_t)r;
    if (r >= d/2) { signed_r -= d; ++n; }
    if (u >> 31) { signed_r = -signed_r; n = 0U-n; }
    *q = (int)(n & 3U);
    return (float)((double)signed_r * 0x1p-31);
#endif
}
#endif
