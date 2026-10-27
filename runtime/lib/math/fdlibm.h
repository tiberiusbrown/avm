/* AVM adaptation layer for the accompanying Newlib/fdlibm float kernels. */
#ifndef AVM_FDLIBM_H
#define AVM_FDLIBM_H

#include <stdint.h>
#include <math.h>

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
