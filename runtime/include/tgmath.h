#ifndef _AVM_RUNTIME_TGMATH_H
#define _AVM_RUNTIME_TGMATH_H

#include <math.h>

/* C99 7.22, real arguments. Complex dispatch awaits the complex library.
   Clang supports generic selection as an extension in C99 mode. The selection
   expressions are unevaluated, so every call evaluates each argument once.
   Integer arguments have double rank, even when combined with float. */
#ifndef __cplusplus
#define __AVM_TG_PROMOTE(x) (__extension__ _Generic((x), \
    float: (float)0, long double: (long double)0, default: (double)0))
#define __AVM_TG_SELECT(name, rank) (__extension__ _Generic((rank), \
    float: name##f, double: name, long double: name##l))
#define __AVM_TG1(name, x) __AVM_TG_SELECT(name, __AVM_TG_PROMOTE(x))(x)
#define __AVM_TG2(name, x, y) \
    __AVM_TG_SELECT(name, __AVM_TG_PROMOTE(x) + __AVM_TG_PROMOTE(y))(x, y)
#define __AVM_TG3(name, x, y, z) \
    __AVM_TG_SELECT(name, __AVM_TG_PROMOTE(x) + __AVM_TG_PROMOTE(y) + \
                          __AVM_TG_PROMOTE(z))(x, y, z)

#define acos(x) __AVM_TG1(acos, (x))
#define asin(x) __AVM_TG1(asin, (x))
#define atan(x) __AVM_TG1(atan, (x))
#define acosh(x) __AVM_TG1(acosh, (x))
#define asinh(x) __AVM_TG1(asinh, (x))
#define atanh(x) __AVM_TG1(atanh, (x))
#define cos(x) __AVM_TG1(cos, (x))
#define sin(x) __AVM_TG1(sin, (x))
#define tan(x) __AVM_TG1(tan, (x))
#define cosh(x) __AVM_TG1(cosh, (x))
#define sinh(x) __AVM_TG1(sinh, (x))
#define tanh(x) __AVM_TG1(tanh, (x))
#define exp(x) __AVM_TG1(exp, (x))
#define log(x) __AVM_TG1(log, (x))
#define sqrt(x) __AVM_TG1(sqrt, (x))
#define fabs(x) __AVM_TG1(fabs, (x))
#define cbrt(x) __AVM_TG1(cbrt, (x))
#define ceil(x) __AVM_TG1(ceil, (x))
#define erf(x) __AVM_TG1(erf, (x))
#define erfc(x) __AVM_TG1(erfc, (x))
#define exp2(x) __AVM_TG1(exp2, (x))
#define expm1(x) __AVM_TG1(expm1, (x))
#define floor(x) __AVM_TG1(floor, (x))
#define ilogb(x) __AVM_TG1(ilogb, (x))
#define lgamma(x) __AVM_TG1(lgamma, (x))
#define llrint(x) __AVM_TG1(llrint, (x))
#define llround(x) __AVM_TG1(llround, (x))
#define log10(x) __AVM_TG1(log10, (x))
#define log1p(x) __AVM_TG1(log1p, (x))
#define log2(x) __AVM_TG1(log2, (x))
#define logb(x) __AVM_TG1(logb, (x))
#define lrint(x) __AVM_TG1(lrint, (x))
#define lround(x) __AVM_TG1(lround, (x))
#define nearbyint(x) __AVM_TG1(nearbyint, (x))
#define rint(x) __AVM_TG1(rint, (x))
#define round(x) __AVM_TG1(round, (x))
#define tgamma(x) __AVM_TG1(tgamma, (x))
#define trunc(x) __AVM_TG1(trunc, (x))
#define pow(x, y) __AVM_TG2(pow, (x), (y))
#define atan2(x, y) __AVM_TG2(atan2, (x), (y))
#define copysign(x, y) __AVM_TG2(copysign, (x), (y))
#define fdim(x, y) __AVM_TG2(fdim, (x), (y))
#define fmax(x, y) __AVM_TG2(fmax, (x), (y))
#define fmin(x, y) __AVM_TG2(fmin, (x), (y))
#define fmod(x, y) __AVM_TG2(fmod, (x), (y))
#define hypot(x, y) __AVM_TG2(hypot, (x), (y))
#define nextafter(x, y) __AVM_TG2(nextafter, (x), (y))
#define remainder(x, y) __AVM_TG2(remainder, (x), (y))
#define fma(x, y, z) __AVM_TG3(fma, (x), (y), (z))

/* Only parameters corresponding to real floating parameters in the double
   prototype are generic. In particular, nexttoward's direction is fixed. */
#define frexp(x, p) __AVM_TG_SELECT(frexp, __AVM_TG_PROMOTE(x))((x), (p))
#define ldexp(x, n) __AVM_TG_SELECT(ldexp, __AVM_TG_PROMOTE(x))((x), (n))
#define scalbn(x, n) __AVM_TG_SELECT(scalbn, __AVM_TG_PROMOTE(x))((x), (n))
#define scalbln(x, n) __AVM_TG_SELECT(scalbln, __AVM_TG_PROMOTE(x))((x), (n))
#define nexttoward(x, y) __AVM_TG_SELECT(nexttoward, __AVM_TG_PROMOTE(x))((x), (y))
#define remquo(x, y, p) \
    __AVM_TG_SELECT(remquo, __AVM_TG_PROMOTE(x) + __AVM_TG_PROMOTE(y))((x), (y), (p))
#endif /* !__cplusplus */
#endif
