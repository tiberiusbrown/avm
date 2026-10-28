#ifndef AVM_FPOLY_H
#define AVM_FPOLY_H

#include <stdint.h>

/* Coefficients are constants, highest degree first. Fixed-register operands
   let allocation/coalescing supply q2 directly, or insert cheap MOV32s. */
#if defined(__AVM__)
#define AVM_POLY_BITS(c) "i" (__builtin_bit_cast(uint32_t, (float)(c)))
#define AVM_FPOLY2(x, c0, c1) \
    __extension__ ({ \
        register float avm_poly_value __asm__("q2") = (x); \
        __asm__("fpoly 2, %1, %2" \
                : "+r" (avm_poly_value) : AVM_POLY_BITS(c0), AVM_POLY_BITS(c1)); \
        avm_poly_value; \
    })
#define AVM_FPOLY3(x, c0, c1, c2) \
    __extension__ ({ \
        register float avm_poly_value __asm__("q2") = (x); \
        __asm__("fpoly 3, %1, %2, %3" \
                : "+r" (avm_poly_value) : AVM_POLY_BITS(c0), AVM_POLY_BITS(c1), AVM_POLY_BITS(c2)); \
        avm_poly_value; \
    })
#define AVM_FPOLY4(x, c0, c1, c2, c3) \
    __extension__ ({ \
        register float avm_poly_value __asm__("q2") = (x); \
        __asm__("fpoly 4, %1, %2, %3, %4" \
                : "+r" (avm_poly_value) : AVM_POLY_BITS(c0), AVM_POLY_BITS(c1), AVM_POLY_BITS(c2), AVM_POLY_BITS(c3)); \
        avm_poly_value; \
    })
#define AVM_FPOLY5(x, c0, c1, c2, c3, c4) \
    __extension__ ({ \
        register float avm_poly_value __asm__("q2") = (x); \
        __asm__("fpoly 5, %1, %2, %3, %4, %5" \
                : "+r" (avm_poly_value) : AVM_POLY_BITS(c0), AVM_POLY_BITS(c1), AVM_POLY_BITS(c2), AVM_POLY_BITS(c3), AVM_POLY_BITS(c4)); \
        avm_poly_value; \
    })
#define AVM_FPOLY6(x, c0, c1, c2, c3, c4, c5) \
    __extension__ ({ \
        register float avm_poly_value __asm__("q2") = (x); \
        __asm__("fpoly 6, %1, %2, %3, %4, %5, %6" \
                : "+r" (avm_poly_value) : AVM_POLY_BITS(c0), AVM_POLY_BITS(c1), AVM_POLY_BITS(c2), AVM_POLY_BITS(c3), AVM_POLY_BITS(c4), AVM_POLY_BITS(c5)); \
        avm_poly_value; \
    })
#define AVM_FPOLY7(x, c0, c1, c2, c3, c4, c5, c6) \
    __extension__ ({ \
        register float avm_poly_value __asm__("q2") = (x); \
        __asm__("fpoly 7, %1, %2, %3, %4, %5, %6, %7" \
                : "+r" (avm_poly_value) : AVM_POLY_BITS(c0), AVM_POLY_BITS(c1), AVM_POLY_BITS(c2), AVM_POLY_BITS(c3), AVM_POLY_BITS(c4), AVM_POLY_BITS(c5), AVM_POLY_BITS(c6)); \
        avm_poly_value; \
    })
#define AVM_FPOLY8(x, c0, c1, c2, c3, c4, c5, c6, c7) \
    __extension__ ({ \
        register float avm_poly_value __asm__("q2") = (x); \
        __asm__("fpoly 8, %1, %2, %3, %4, %5, %6, %7, %8" \
                : "+r" (avm_poly_value) : AVM_POLY_BITS(c0), AVM_POLY_BITS(c1), AVM_POLY_BITS(c2), AVM_POLY_BITS(c3), AVM_POLY_BITS(c4), AVM_POLY_BITS(c5), AVM_POLY_BITS(c6), AVM_POLY_BITS(c7)); \
        avm_poly_value; \
    })
#else
/* The production source is also compiled for the independent host libm
   reference tests. Model the native 32-bit significand, truncating only its
   extra precision after each operation and rounding to float on return. */
static inline double avm_poly_extended(double x)
{
    union { double d; uint64_t u; } v = {x};
    unsigned exponent = (unsigned)((v.u >> 52) & 2047);
    if (exponent == 2047) return x;
    if (exponent >= 1151) {
        v.u = (v.u & UINT64_C(0x8000000000000000)) | UINT64_C(0x7ff0000000000000);
        return v.d;
    }
    if (exponent < 866) {
        v.u &= UINT64_C(0x8000000000000000);
        return v.d;
    }
    unsigned shift = 21 + (exponent < 897 ? 897 - exponent : 0);
    v.u &= ~((UINT64_C(1) << shift) - 1);
    return v.d;
}
/* Model __addsf3x's alignment sticky byte and cancellation normalization.
   The AVR helper fills discarded alignment bits with sticky ones; simply
   truncating a host double sum differs after cancellation. */
static inline double avm_poly_add(double a, double b, int final)
{
    union { double d; uint64_t u; } va = {a}, vb = {b};
    unsigned ea = (unsigned)((va.u >> 52) & 2047);
    unsigned eb = (unsigned)((vb.u >> 52) & 2047);
    if (ea == 2047 || eb == 2047) return a+b;
    /* Match __addsf3x: sufficiently large exponent differences
       discard the smaller operand before sticky subtraction. */
    unsigned aa = ea < 897 ? 897 : ea;
    unsigned bb = eb < 897 ? 897 : eb;
    if (aa > bb + 32) return final ? a : avm_poly_extended(a);
    if (bb > aa + 32) return final ? b : avm_poly_extended(b);
    uint32_t ma = ea ? (uint32_t)(((va.u & UINT64_C(0xfffffffffffff)) |
                                 UINT64_C(0x10000000000000)) >> 21) : 0;
    uint32_t mb = eb ? (uint32_t)(((vb.u & UINT64_C(0xfffffffffffff)) |
                                 UINT64_C(0x10000000000000)) >> 21) : 0;
    if (ea < 897) { ma = 897-ea < 32 ? ma >> (897-ea) : 0; ea = 897; }
    if (eb < 897) { mb = 897-eb < 32 ? mb >> (897-eb) : 0; eb = 897; }
    unsigned sa = (unsigned)(va.u >> 63), sb = (unsigned)(vb.u >> 63);
    if (ea < eb || (ea == eb && ma < mb)) {
        unsigned t = ea; ea = eb; eb = t;
        t = sa; sa = sb; sb = t;
        uint32_t m = ma; ma = mb; mb = m;
    }
    unsigned shift = ea-eb;
    unsigned sticky = shift >= 32 ? mb != 0 :
        (shift && (mb & ((UINT32_C(1) << shift)-1)) != 0);
    mb = shift >= 32 ? 0 : mb >> shift;
    unsigned tail = sticky ? 255 : 0;
    uint64_t m;
    if (sa == sb) {
        m = (uint64_t)ma + mb;
        if (m >> 32) { tail = (tail >> 1) | ((unsigned)m & 1) * 128; m >>= 1; ++ea; }
    } else {
        m = (uint64_t)ma - mb - sticky;
        if (!m && !tail) return 0.0;
        while (m < UINT64_C(0x80000000) && ea > 897) {
            m = (m << 1) | (tail >> 7);
            tail = (tail << 1) & 255;
            --ea;
        }
    }
    union { uint64_t u; double d; } scale = {(uint64_t)(ea-31) << 52};
    double result = (double)m * scale.d;
    if (final) result += (double)tail * (scale.d * (1.0/256.0));
    return final ? (sa ? -result : result) : avm_poly_extended(sa ? -result : result);
}
static inline float avm_poly_host(float x, const float *c, unsigned n)
{
    double y = c[0];
    for (unsigned i = 1; i < n; ++i) {
        y = avm_poly_add(avm_poly_extended(y * (double)x), (double)c[i], i+1 == n);
        if (i + 1 == n) return (float)y;
    }
    return (float)y;
}
#define AVM_FPOLY2(x, c0, c1) avm_poly_host((x), (const float[]){c0, c1}, 2)
#define AVM_FPOLY3(x, c0, c1, c2) avm_poly_host((x), (const float[]){c0, c1, c2}, 3)
#define AVM_FPOLY4(x, c0, c1, c2, c3) avm_poly_host((x), (const float[]){c0, c1, c2, c3}, 4)
#define AVM_FPOLY5(x, c0, c1, c2, c3, c4) avm_poly_host((x), (const float[]){c0, c1, c2, c3, c4}, 5)
#define AVM_FPOLY6(x, c0, c1, c2, c3, c4, c5) avm_poly_host((x), (const float[]){c0, c1, c2, c3, c4, c5}, 6)
#define AVM_FPOLY7(x, c0, c1, c2, c3, c4, c5, c6) avm_poly_host((x), (const float[]){c0, c1, c2, c3, c4, c5, c6}, 7)
#define AVM_FPOLY8(x, c0, c1, c2, c3, c4, c5, c6, c7) avm_poly_host((x), (const float[]){c0, c1, c2, c3, c4, c5, c6, c7}, 8)

#endif
#endif
