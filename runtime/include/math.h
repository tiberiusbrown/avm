#ifndef _AVM_RUNTIME_MATH_H
#define _AVM_RUNTIME_MATH_H
#define __STDC_VERSION_MATH_H__ 202311L

#define HUGE_VAL (__builtin_huge_val())
#define HUGE_VALF (__builtin_huge_valf())
#define HUGE_VALL (__builtin_huge_vall())
#define INFINITY (__builtin_inff())
#define NAN (__builtin_nanf(""))
#define MATH_ERRNO 1
#define MATH_ERREXCEPT 2
#define math_errhandling MATH_ERRNO

#if defined(__INT_MAX__)
#define FP_ILOGB0 (-__INT_MAX__-1)
#define FP_ILOGBNAN (-__INT_MAX__-1)
#else
#include <limits.h>
#define FP_ILOGB0 INT_MIN
#define FP_ILOGBNAN INT_MIN
#endif

/* Rounding directions for fromfp and related functions. Their values are
   implementation-defined, but they must be distinct. */
#define FP_INT_UPWARD 0
#define FP_INT_DOWNWARD 1
#define FP_INT_TOWARDZERO 2
#define FP_INT_TONEARESTFROMZERO 3
#define FP_INT_TONEAREST 4

/* llogb returns LONG_MIN for zero and NaN because FP_ILOGB0 and FP_ILOGBNAN are INT_MIN. */
#if defined(__LONG_MAX__)
#define FP_LLOGB0 (-__LONG_MAX__-1L)
#define FP_LLOGBNAN (-__LONG_MAX__-1L)
#else
#include <limits.h>
#define FP_LLOGB0 LONG_MIN
#define FP_LLOGBNAN LONG_MIN
#endif

/* AVM evaluates all real floating types in their binary32 representation. */
#if __FLT_EVAL_METHOD__ == 0
typedef float float_t;
typedef double double_t;
#elif __FLT_EVAL_METHOD__ == 1
typedef double float_t;
typedef double double_t;
#else
typedef long double float_t;
typedef long double double_t;
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
float lgammaf(float x);
float tgammaf(float x);
float erff(float x);
float erfcf(float x);
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
float scalblnf(float x, long n);
float ldexpf(float x, int exponent);
float frexpf(float x, int *exponent);
float modff(float x, float *integer_part);
float nextafterf(float x, float y);
float nexttowardf(float x, long double y);
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

/* Standard real functions retain their declared types even though AVM uses
   the same representation for float, double, and long double. */
double sqrt(double x);
long double sqrtl(long double x);
double sinh(double x);
long double sinhl(long double x);
double cosh(double x);
long double coshl(long double x);
double tanh(double x);
long double tanhl(long double x);
double asinh(double x);
long double asinhl(long double x);
double acosh(double x);
long double acoshl(long double x);
double atanh(double x);
long double atanhl(long double x);
double sin(double x);
long double sinl(long double x);
double cos(double x);
long double cosl(long double x);
double atan2(double y, double x);
long double atan2l(long double y, long double x);
double tan(double x);
long double tanl(long double x);
double lgamma(double x);
long double lgammal(long double x);
double tgamma(double x);
long double tgammal(long double x);
double erf(double x);
long double erfl(long double x);
double erfc(double x);
long double erfcl(long double x);
double exp(double x);
long double expl(long double x);
double exp2(double x);
long double exp2l(long double x);
double expm1(double x);
long double expm1l(long double x);
double log1p(double x);
long double log1pl(long double x);
double cbrt(double x);
long double cbrtl(long double x);
double asin(double x);
long double asinl(long double x);
double acos(double x);
long double acosl(long double x);
double log(double x);
long double logl(long double x);
double log2(double x);
long double log2l(long double x);
double log10(double x);
long double log10l(long double x);
double pow(double x, double y);
long double powl(long double x, long double y);
double hypot(double x, double y);
long double hypotl(long double x, long double y);
double fmod(double x, double y);
long double fmodl(long double x, long double y);
double fma(double x, double y, double z);
long double fmal(long double x, long double y, long double z);
double atan(double x);
long double atanl(long double x);
double fabs(double x);
long double fabsl(long double x);
double copysign(double x, double y);
long double copysignl(long double x, long double y);
double scalbn(double x, int n);
long double scalbnl(long double x, int n);
double scalbln(double x, long n);
long double scalblnl(long double x, long n);
double ldexp(double x, int exponent);
long double ldexpl(long double x, int exponent);
double frexp(double x, int *exponent);
long double frexpl(long double x, int *exponent);
double modf(double x, double *integer_part);
long double modfl(long double x, long double *integer_part);
double nextafter(double x, double y);
long double nextafterl(long double x, long double y);
double nexttoward(double x, long double y);
long double nexttowardl(long double x, long double y);
double fdim(double x, double y);
long double fdiml(long double x, long double y);
double remainder(double x, double y);
long double remainderl(long double x, long double y);
double remquo(double x, double y, int *quotient);
long double remquol(long double x, long double y, int *quotient);
double nearbyint(double x);
long double nearbyintl(long double x);
double rint(double x);
long double rintl(long double x);
long lrint(double x);
long lrintl(long double x);
long lround(double x);
long lroundl(long double x);
long long llrint(double x);
long long llrintl(long double x);
long long llround(double x);
long long llroundl(long double x);
double nan(const char *tag);
long double nanl(const char *tag);
int ilogb(double x);
int ilogbl(long double x);
double logb(double x);
long double logbl(long double x);
double trunc(double x);
long double truncl(long double x);
double floor(double x);
long double floorl(long double x);
double ceil(double x);
long double ceill(long double x);
double round(double x);
long double roundl(long double x);
double fmin(double x, double y);
long double fminl(long double x, long double y);
double fmax(double x, double y);
long double fmaxl(long double x, long double y);

/* C23 interfaces. Narrowing functions are named by their result type: f for
   float and d for double. A trailing l selects long double parameters. */
float roundevenf(float x);
double roundeven(double x);
long double roundevenl(long double x);
float fromfpf(float x, int rnd, unsigned int width);
double fromfp(double x, int rnd, unsigned int width);
long double fromfpl(long double x, int rnd, unsigned int width);
float ufromfpf(float x, int rnd, unsigned int width);
double ufromfp(double x, int rnd, unsigned int width);
long double ufromfpl(long double x, int rnd, unsigned int width);
float fromfpxf(float x, int rnd, unsigned int width);
double fromfpx(double x, int rnd, unsigned int width);
long double fromfpxl(long double x, int rnd, unsigned int width);
float ufromfpxf(float x, int rnd, unsigned int width);
double ufromfpx(double x, int rnd, unsigned int width);
long double ufromfpxl(long double x, int rnd, unsigned int width);
long llogbf(float x);
long llogb(double x);
long llogbl(long double x);
float nextupf(float x);
double nextup(double x);
long double nextupl(long double x);
float nextdownf(float x);
double nextdown(double x);
long double nextdownl(long double x);
int canonicalizef(float *cx, const float *x);
int canonicalize(double *cx, const double *x);
int canonicalizel(long double *cx, const long double *x);
float fmaximumf(float x, float y);
double fmaximum(double x, double y);
long double fmaximuml(long double x, long double y);
float fminimumf(float x, float y);
double fminimum(double x, double y);
long double fminimuml(long double x, long double y);
float fmaximum_magf(float x, float y);
double fmaximum_mag(double x, double y);
long double fmaximum_magl(long double x, long double y);
float fminimum_magf(float x, float y);
double fminimum_mag(double x, double y);
long double fminimum_magl(long double x, long double y);
float fmaximum_numf(float x, float y);
double fmaximum_num(double x, double y);
long double fmaximum_numl(long double x, long double y);
float fminimum_numf(float x, float y);
double fminimum_num(double x, double y);
long double fminimum_numl(long double x, long double y);
float fmaximum_mag_numf(float x, float y);
double fmaximum_mag_num(double x, double y);
long double fmaximum_mag_numl(long double x, long double y);
float fminimum_mag_numf(float x, float y);
double fminimum_mag_num(double x, double y);
long double fminimum_mag_numl(long double x, long double y);
float fadd(double x, double y);
float faddl(long double x, long double y);
double daddl(long double x, long double y);
float fsub(double x, double y);
float fsubl(long double x, long double y);
double dsubl(long double x, long double y);
float fmul(double x, double y);
float fmull(long double x, long double y);
double dmull(long double x, long double y);
float fdiv(double x, double y);
float fdivl(long double x, long double y);
double ddivl(long double x, long double y);
float ffma(double x, double y, double z);
float ffmal(long double x, long double y, long double z);
double dfmal(long double x, long double y, long double z);
float fsqrt(double x);
float fsqrtl(long double x);
double dsqrtl(long double x);
/* Implementation support for the iseqsig macro: a domain error for NaN operands. */
int __avm_iseqsigf(float x, float y);

#ifdef __cplusplus
} // extern "C"
#endif

/* Clang lowers classification to native integer bit tests and comparisons to FCMP.
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
/* C23 type-generic macros. They are C-only: these names would otherwise become
   function-like macros in C++ code that includes <cmath>. */
#ifndef __cplusplus
#define issignaling(x) __builtin_issignaling(__AVM_MATH_REAL(x))
#define issubnormal(x) __builtin_issubnormal(__AVM_MATH_REAL(x))
#define iszero(x) __builtin_iszero(__AVM_MATH_REAL(x))
/* Every binary32 encoding is canonical. The argument is still evaluated once. */
#define iscanonical(x) ((void)__AVM_MATH_REAL(x), 1)
#define iseqsig(x, y) __avm_iseqsigf(__AVM_MATH_REAL(x), __AVM_MATH_REAL(y))
#endif
#endif

#endif // AVM_RUNTIME_MATH_H
