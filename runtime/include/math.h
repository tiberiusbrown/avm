#ifndef _AVM_RUNTIME_MATH_H
#define _AVM_RUNTIME_MATH_H

#define HUGE_VAL (__builtin_huge_val())
#define HUGE_VALF (__builtin_huge_valf())
#define HUGE_VALL (__builtin_huge_vall())
#define INFINITY (__builtin_inff())
#define NAN (__builtin_nanf(""))
#define MATH_ERRNO 1
#define MATH_ERREXCEPT 2

#if defined(__INT_MAX__)
#define FP_ILOGB0 (-__INT_MAX__-1)
#define FP_ILOGBNAN (-__INT_MAX__-1)
#else
#include <limits.h>
#define FP_ILOGB0 INT_MIN
#define FP_ILOGBNAN INT_MIN
#endif

#ifdef __cplusplus
extern "C" {
#endif

float sqrtf(float x);
float sinhf(float x);
float coshf(float x);
float tanhf(float x);
float asinhf(float x);
float acoshf(float x);
float atanhf(float x);
float sinf(float x);
float cosf(float x);
void sincosf(float x, float *sine, float *cosine);
float atan2f(float y, float x);
float tanf(float x);
float expf(float x);
float exp2f(float x);
float expm1f(float x);
float log1pf(float x);
float cbrtf(float x);
float asinf(float x);
float acosf(float x);
float logf(float x);
float log2f(float x);
float log10f(float x);
float powf(float x, float y);
float hypotf(float x, float y);
float fmodf(float x, float y);
/* avr-libc extended multiply/add precision, rounded once at the end. */
float fmaf(float x, float y, float z);
float atanf(float x);
float fabsf(float x);
float copysignf(float x, float y);
float scalbnf(float x, int n);
float ldexpf(float x, int exponent);
float frexpf(float x, int *exponent);
float modff(float x, float *integer_part);
float nextafterf(float x, float y);
float fdimf(float x, float y);
float remainderf(float x, float y);
float remquof(float x, float y, int *quotient);
float nearbyintf(float x);
float rintf(float x);
long lrintf(float x);
long lroundf(float x);
long long llrintf(float x);
long long llroundf(float x);
float nanf(const char *tag);
int ilogbf(float x);
float logbf(float x);
float fmaxmagf(float x, float y);
float fminmagf(float x, float y);
float truncf(float x);
float floorf(float x);
float ceilf(float x);
float roundf(float x);
float fminf(float x, float y);
float fmaxf(float x, float y);

#ifdef __cplusplus
} // extern "C"
#endif

/* Clang lowers these builtins to the existing FCLASS/FCMP instructions.
   typeof is unevaluated: promote integers while retaining wider host types,
   without doing floating arithmetic or evaluating an argument twice. */
#if defined(__clang__) || defined(__GNUC__)
#define FP_NAN 0
#define FP_INFINITE 1
#define FP_ZERO 2
#define FP_SUBNORMAL 3
#define FP_NORMAL 4
#define __AVM_MATH_REAL(x) ((__typeof__((x) + 0.0f))(x))
#define fpclassify(x) __builtin_fpclassify(FP_NAN, FP_INFINITE, FP_NORMAL, FP_SUBNORMAL, FP_ZERO, __AVM_MATH_REAL(x))
#define isfinite(x) __builtin_isfinite(__AVM_MATH_REAL(x))
#define isinf(x) __builtin_isinf(__AVM_MATH_REAL(x))
#define isnan(x) __builtin_isnan(__AVM_MATH_REAL(x))
#define isnormal(x) __builtin_isnormal(__AVM_MATH_REAL(x))
#define signbit(x) __builtin_signbit(__AVM_MATH_REAL(x))
#define isgreater(x,y) __builtin_isgreater(__AVM_MATH_REAL(x), __AVM_MATH_REAL(y))
#define isgreaterequal(x,y) __builtin_isgreaterequal(__AVM_MATH_REAL(x), __AVM_MATH_REAL(y))
#define isless(x,y) __builtin_isless(__AVM_MATH_REAL(x), __AVM_MATH_REAL(y))
#define islessequal(x,y) __builtin_islessequal(__AVM_MATH_REAL(x), __AVM_MATH_REAL(y))
#define islessgreater(x,y) __builtin_islessgreater(__AVM_MATH_REAL(x), __AVM_MATH_REAL(y))
#define isunordered(x,y) __builtin_isunordered(__AVM_MATH_REAL(x), __AVM_MATH_REAL(y))
#endif

#endif // AVM_RUNTIME_MATH_H
