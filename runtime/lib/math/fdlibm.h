/* AVM adaptation layer for the accompanying Newlib/fdlibm float kernels. */
#ifndef AVM_FDLIBM_H
#define AVM_FDLIBM_H

#include <stdint.h>
#include <errno.h>
#include <math.h>

/* Error-path layout hints; the host reference build also supports MSVC. */
#if defined(__clang__) || defined(__GNUC__)
#define AVM_MATH_UNLIKELY(condition) __builtin_expect(!!(condition), 0)
#else
#define AVM_MATH_UNLIKELY(condition) (!!(condition))
#endif

typedef int32_t __int32_t;
typedef uint32_t __uint32_t;

#define GET_FLOAT_WORD(i, x) do { union { float f; uint32_t u; } v = { (x) }; (i) = v.u; } while (0)
#define SET_FLOAT_WORD(x, i) do { union { uint32_t u; float f; } v = { (uint32_t)(i) }; (x) = v.f; } while (0)
#define FLT_UWORD_IS_FINITE(x) ((x) < 0x7f800000L)
#define FLT_UWORD_IS_NAN(x) ((x) > 0x7f800000L)
#define FLT_UWORD_IS_INFINITE(x) ((x) == 0x7f800000L)
#define FLT_UWORD_IS_ZERO(x) ((x) == 0)
#define FLT_UWORD_IS_SUBNORMAL(x) ((x) < 0x00800000L)
#define FLT_UWORD_LOG_MAX 0x42b17217L
#define FLT_UWORD_LOG_MIN 0x42cff1b5L
#define FLT_UWORD_EXP_MAX 0x43000000L
#define FLT_UWORD_EXP_MIN 0x43160000L
#define FLT_LARGEST_EXP 254
/* Biased exponent -23 still rounds to the smallest subnormal when the
   significand exceeds one. Let the final multiply resolve the midpoint. */
#define FLT_SMALLEST_EXP (-23)

#define __ieee754_sqrtf sqrtf
#define __ieee754_atan2f atan2f
#define __ieee754_expf expf
#define __ieee754_logf logf
#define __ieee754_log10f log10f
#define __ieee754_powf powf
#define __ieee754_hypotf hypotf
#define __ieee754_fmodf fmodf

float __ieee754_rem_pio2f(float, int *);
float __kernel_rem_pio2f(float, int *);
float __kernel_sinf(float);
float __kernel_cosf(float);
float __kernel_tanf(float, int);

/* Bit classification also keeps the host reference builds independent of
   compiler-specific classification builtins. */
static inline uint32_t avm_math_magnitude(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    return u & 0x7fffffffUL;
}
static inline int avm_math_finite(float x) { return avm_math_magnitude(x) < 0x7f800000UL; }
static inline int avm_math_nan(float x) { return avm_math_magnitude(x) > 0x7f800000UL; }
static inline int avm_math_inf(float x) { return avm_math_magnitude(x) == 0x7f800000UL; }
static inline float avm_math_abs(float x)
{
    SET_FLOAT_WORD(x, avm_math_magnitude(x));
    return x;
}

/* Reconstruct a quadrant sign directly in the binary32 sign bit. */
static inline float avm_math_flip_sign(float x, unsigned negative)
{
#ifdef __AVM__
    register float value __asm__("q2") = x;
    register uint16_t mask __asm__("r6") = negative ? 0x8000U : 0;
    /* q2's high word is r5. Keep its low word intact and avoid a float
       select or full-width bit reconstruction; XOR updates VM condition flags. */
    __asm__("xor r5, %1" : "+r"(value) : "r"(mask) : "cc");
    return value;
#else
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    if (negative) u ^= 0x80000000UL;
    SET_FLOAT_WORD(x, u);
    return x;
#endif
}

/* Native-word tests avoid expensive float classification on the common path. */
static inline uint16_t avm_math_high_word(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    return (uint16_t)(u >> 16);
}
static inline uint16_t avm_math_high(float x)
{
    return avm_math_high_word(x) & 0x7fffU;
}
/* Only for results of finite, nonzero mathematical operations. */
static inline float avm_math_check_range(float x)
{
    uint16_t high = avm_math_high(x);
    if (AVM_MATH_UNLIKELY(high < 0x0080U || high >= 0x7f80U)) errno = ERANGE;
    return x;
}
static inline void avm_math_remainder_domain(float x, float y)
{
    if (AVM_MATH_UNLIKELY(avm_math_high(x) >= 0x7f80U || avm_math_high(y) == 0)) {
        uint32_t a = avm_math_magnitude(x), b = avm_math_magnitude(y);
        if (AVM_MATH_UNLIKELY(a <= 0x7f800000UL && b <= 0x7f800000UL &&
            (a == 0x7f800000UL || !b))) errno = EDOM;
    }
}
/* Private exponential engine for intermediate operations. */
float __avm_expf_noerrno(float x);

static inline int issignalingf_inline(float x)
{
    uint32_t u;
    GET_FLOAT_WORD(u, x);
    return (u & 0x7fffffffUL) > 0x7f800000UL && !(u & 0x00400000UL);
}

static inline float __math_oflowf(int sign)
{
    float x;
    SET_FLOAT_WORD(x, 0x7f800000UL | ((uint32_t)sign << 31));
    return x;
}

static inline float __math_uflowf(int sign)
{
    float x;
    SET_FLOAT_WORD(x, (uint32_t)sign << 31);
    return x;
}

#endif
