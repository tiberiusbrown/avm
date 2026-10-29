#include <math.h>

/* These adapters depend on AVM's common representation, not pointer casts. */
#if __SIZEOF_DOUBLE__ != 4 || __SIZEOF_LONG_DOUBLE__ != 4
#error "AVM math adapters require binary32 double and long double"
#endif

double sqrt(double x)
{
    return (double)sqrtf((float)x);
}

long double sqrtl(long double x)
{
    return (long double)sqrtf((float)x);
}

double sinh(double x)
{
    return (double)sinhf((float)x);
}

long double sinhl(long double x)
{
    return (long double)sinhf((float)x);
}

double cosh(double x)
{
    return (double)coshf((float)x);
}

long double coshl(long double x)
{
    return (long double)coshf((float)x);
}

double tanh(double x)
{
    return (double)tanhf((float)x);
}

long double tanhl(long double x)
{
    return (long double)tanhf((float)x);
}

double asinh(double x)
{
    return (double)asinhf((float)x);
}

long double asinhl(long double x)
{
    return (long double)asinhf((float)x);
}

double acosh(double x)
{
    return (double)acoshf((float)x);
}

long double acoshl(long double x)
{
    return (long double)acoshf((float)x);
}

double atanh(double x)
{
    return (double)atanhf((float)x);
}

long double atanhl(long double x)
{
    return (long double)atanhf((float)x);
}

double sin(double x)
{
    return (double)sinf((float)x);
}

long double sinl(long double x)
{
    return (long double)sinf((float)x);
}

double cos(double x)
{
    return (double)cosf((float)x);
}

long double cosl(long double x)
{
    return (long double)cosf((float)x);
}

double atan2(double y, double x)
{
    return (double)atan2f((float)y, (float)x);
}

long double atan2l(long double y, long double x)
{
    return (long double)atan2f((float)y, (float)x);
}

double tan(double x)
{
    return (double)tanf((float)x);
}

long double tanl(long double x)
{
    return (long double)tanf((float)x);
}

double lgamma(double x)
{
    return (double)lgammaf((float)x);
}

long double lgammal(long double x)
{
    return (long double)lgammaf((float)x);
}

double tgamma(double x)
{
    return (double)tgammaf((float)x);
}

long double tgammal(long double x)
{
    return (long double)tgammaf((float)x);
}

double erf(double x)
{
    return (double)erff((float)x);
}

long double erfl(long double x)
{
    return (long double)erff((float)x);
}

double erfc(double x)
{
    return (double)erfcf((float)x);
}

long double erfcl(long double x)
{
    return (long double)erfcf((float)x);
}

double exp(double x)
{
    return (double)expf((float)x);
}

long double expl(long double x)
{
    return (long double)expf((float)x);
}

double exp2(double x)
{
    return (double)exp2f((float)x);
}

long double exp2l(long double x)
{
    return (long double)exp2f((float)x);
}

double expm1(double x)
{
    return (double)expm1f((float)x);
}

long double expm1l(long double x)
{
    return (long double)expm1f((float)x);
}

double log1p(double x)
{
    return (double)log1pf((float)x);
}

long double log1pl(long double x)
{
    return (long double)log1pf((float)x);
}

double cbrt(double x)
{
    return (double)cbrtf((float)x);
}

long double cbrtl(long double x)
{
    return (long double)cbrtf((float)x);
}

double asin(double x)
{
    return (double)asinf((float)x);
}

long double asinl(long double x)
{
    return (long double)asinf((float)x);
}

double acos(double x)
{
    return (double)acosf((float)x);
}

long double acosl(long double x)
{
    return (long double)acosf((float)x);
}

double log(double x)
{
    return (double)logf((float)x);
}

long double logl(long double x)
{
    return (long double)logf((float)x);
}

double log2(double x)
{
    return (double)log2f((float)x);
}

long double log2l(long double x)
{
    return (long double)log2f((float)x);
}

double log10(double x)
{
    return (double)log10f((float)x);
}

long double log10l(long double x)
{
    return (long double)log10f((float)x);
}

double pow(double x, double y)
{
    return (double)powf((float)x, (float)y);
}

long double powl(long double x, long double y)
{
    return (long double)powf((float)x, (float)y);
}

double hypot(double x, double y)
{
    return (double)hypotf((float)x, (float)y);
}

long double hypotl(long double x, long double y)
{
    return (long double)hypotf((float)x, (float)y);
}

double fmod(double x, double y)
{
    return (double)fmodf((float)x, (float)y);
}

long double fmodl(long double x, long double y)
{
    return (long double)fmodf((float)x, (float)y);
}

double fma(double x, double y, double z)
{
    return (double)fmaf((float)x, (float)y, (float)z);
}

long double fmal(long double x, long double y, long double z)
{
    return (long double)fmaf((float)x, (float)y, (float)z);
}

double atan(double x)
{
    return (double)atanf((float)x);
}

long double atanl(long double x)
{
    return (long double)atanf((float)x);
}

double fabs(double x)
{
    return (double)fabsf((float)x);
}

long double fabsl(long double x)
{
    return (long double)fabsf((float)x);
}

double copysign(double x, double y)
{
    return (double)copysignf((float)x, (float)y);
}

long double copysignl(long double x, long double y)
{
    return (long double)copysignf((float)x, (float)y);
}

double scalbn(double x, int n)
{
    return (double)scalbnf((float)x, n);
}

long double scalbnl(long double x, int n)
{
    return (long double)scalbnf((float)x, n);
}

double scalbln(double x, long n)
{
    return (double)scalblnf((float)x, n);
}

long double scalblnl(long double x, long n)
{
    return (long double)scalblnf((float)x, n);
}

double ldexp(double x, int exponent)
{
    return (double)ldexpf((float)x, exponent);
}

long double ldexpl(long double x, int exponent)
{
    return (long double)ldexpf((float)x, exponent);
}

double frexp(double x, int *exponent)
{
    return (double)frexpf((float)x, exponent);
}

long double frexpl(long double x, int *exponent)
{
    return (long double)frexpf((float)x, exponent);
}

double modf(double x, double *integer_part)
{
    float integral;
    float result = modff((float)x, &integral);
    *integer_part = (double)integral;
    return (double)result;
}

long double modfl(long double x, long double *integer_part)
{
    float integral;
    float result = modff((float)x, &integral);
    *integer_part = (long double)integral;
    return (long double)result;
}

double nextafter(double x, double y)
{
    return (double)nextafterf((float)x, (float)y);
}

long double nextafterl(long double x, long double y)
{
    return (long double)nextafterf((float)x, (float)y);
}

double nexttoward(double x, long double y)
{
    return (double)nexttowardf((float)x, y);
}

long double nexttowardl(long double x, long double y)
{
    return (long double)nexttowardf((float)x, y);
}

double fdim(double x, double y)
{
    return (double)fdimf((float)x, (float)y);
}

long double fdiml(long double x, long double y)
{
    return (long double)fdimf((float)x, (float)y);
}

double remainder(double x, double y)
{
    return (double)remainderf((float)x, (float)y);
}

long double remainderl(long double x, long double y)
{
    return (long double)remainderf((float)x, (float)y);
}

double remquo(double x, double y, int *quotient)
{
    return (double)remquof((float)x, (float)y, quotient);
}

long double remquol(long double x, long double y, int *quotient)
{
    return (long double)remquof((float)x, (float)y, quotient);
}

double nearbyint(double x)
{
    return (double)nearbyintf((float)x);
}

long double nearbyintl(long double x)
{
    return (long double)nearbyintf((float)x);
}

double rint(double x)
{
    return (double)rintf((float)x);
}

long double rintl(long double x)
{
    return (long double)rintf((float)x);
}

long lrint(double x)
{
    return (long)lrintf((float)x);
}

long lrintl(long double x)
{
    return (long)lrintf((float)x);
}

long lround(double x)
{
    return (long)lroundf((float)x);
}

long lroundl(long double x)
{
    return (long)lroundf((float)x);
}

long long llrint(double x)
{
    return (long long)llrintf((float)x);
}

long long llrintl(long double x)
{
    return (long long)llrintf((float)x);
}

long long llround(double x)
{
    return (long long)llroundf((float)x);
}

long long llroundl(long double x)
{
    return (long long)llroundf((float)x);
}

double nan(const char *tag)
{
    return (double)nanf(tag);
}

long double nanl(const char *tag)
{
    return (long double)nanf(tag);
}

int ilogb(double x)
{
    return (int)ilogbf((float)x);
}

int ilogbl(long double x)
{
    return (int)ilogbf((float)x);
}

double logb(double x)
{
    return (double)logbf((float)x);
}

long double logbl(long double x)
{
    return (long double)logbf((float)x);
}

double trunc(double x)
{
    return (double)truncf((float)x);
}

long double truncl(long double x)
{
    return (long double)truncf((float)x);
}

double floor(double x)
{
    return (double)floorf((float)x);
}

long double floorl(long double x)
{
    return (long double)floorf((float)x);
}

double ceil(double x)
{
    return (double)ceilf((float)x);
}

long double ceill(long double x)
{
    return (long double)ceilf((float)x);
}

double round(double x)
{
    return (double)roundf((float)x);
}

long double roundl(long double x)
{
    return (long double)roundf((float)x);
}

double fmin(double x, double y)
{
    return (double)fminf((float)x, (float)y);
}

long double fminl(long double x, long double y)
{
    return (long double)fminf((float)x, (float)y);
}

double fmax(double x, double y)
{
    return (double)fmaxf((float)x, (float)y);
}

long double fmaxl(long double x, long double y)
{
    return (long double)fmaxf((float)x, (float)y);
}
