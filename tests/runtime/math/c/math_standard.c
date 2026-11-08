#include "math_test.h"
#include <errno.h>

static uint32_t bits(float x)
{
    union { float f; uint32_t u; } value = {x};
    return value.u;
}

/* Volatile function pointers require linkable functions and check their types.
   Compare both return values and output parameters with the existing kernels. */
#define DEFINE_ONE(TYPE, SUFFIX, NAME, RETURN, PARAMS, ARGS, FLOAT_ARGS) \
static __attribute__((noinline)) int test_##NAME##SUFFIX(float x, float y, float z) { \
    (void)x; (void)y; (void)z; \
    typedef TYPE real; \
    RETURN (*volatile function) PARAMS = &NAME##SUFFIX; \
    real integral = 0; \
    float float_integral = 0; \
    int exponent = 0, float_exponent = 0; \
    float actual = (float)function ARGS; \
    float expected = (float)NAME##f FLOAT_ARGS; \
    if (check_result(actual, bits(expected), 0, __LINE__) || \
        check_result((float)integral, bits(float_integral), 0, __LINE__) || \
        exponent != float_exponent) return 1; \
    return 0; \
}
#define DEFINE_PAIR(NAME, RETURN, PARAMS, ARGS, FLOAT_ARGS) \
    DEFINE_ONE(double, , NAME, RETURN, PARAMS, ARGS, FLOAT_ARGS) \
    DEFINE_ONE(long double, l, NAME, RETURN, PARAMS, ARGS, FLOAT_ARGS)

/* Keep integer results exact without requiring an unrelated i64-to-float helper. */
#define DEFINE_INTEGER_ONE(TYPE, SUFFIX, NAME, RETURN) \
static __attribute__((noinline)) int test_##NAME##SUFFIX(float x, float y, float z) { \
    (void)y; (void)z; \
    RETURN (*volatile function)(TYPE) = &NAME##SUFFIX; \
    return function((TYPE)x) != NAME##f(x); \
}
#define DEFINE_INTEGER_PAIR(NAME, RETURN) \
    DEFINE_INTEGER_ONE(double, , NAME, RETURN) \
    DEFINE_INTEGER_ONE(long double, l, NAME, RETURN)

DEFINE_PAIR(sqrt, real, (real), (x), (x))
DEFINE_PAIR(sinh, real, (real), (x), (x))
DEFINE_PAIR(cosh, real, (real), (x), (x))
DEFINE_PAIR(tanh, real, (real), (x), (x))
DEFINE_PAIR(asinh, real, (real), (x), (x))
DEFINE_PAIR(acosh, real, (real), (x), (x))
DEFINE_PAIR(atanh, real, (real), (x), (x))
DEFINE_PAIR(sin, real, (real), (x), (x))
DEFINE_PAIR(cos, real, (real), (x), (x))
DEFINE_PAIR(atan2, real, (real, real), (y, x), (y, x))
DEFINE_PAIR(tan, real, (real), (x), (x))
DEFINE_PAIR(lgamma, real, (real), (x), (x))
DEFINE_PAIR(tgamma, real, (real), (x), (x))
DEFINE_PAIR(erf, real, (real), (x), (x))
DEFINE_PAIR(erfc, real, (real), (x), (x))
DEFINE_PAIR(exp, real, (real), (x), (x))
DEFINE_PAIR(exp2, real, (real), (x), (x))
DEFINE_PAIR(expm1, real, (real), (x), (x))
DEFINE_PAIR(log1p, real, (real), (x), (x))
DEFINE_PAIR(cbrt, real, (real), (x), (x))
DEFINE_PAIR(asin, real, (real), (x), (x))
DEFINE_PAIR(acos, real, (real), (x), (x))
DEFINE_PAIR(log, real, (real), (x), (x))
DEFINE_PAIR(log2, real, (real), (x), (x))
DEFINE_PAIR(log10, real, (real), (x), (x))
DEFINE_PAIR(pow, real, (real, real), (x, y), (x, y))
DEFINE_PAIR(hypot, real, (real, real), (x, y), (x, y))
DEFINE_PAIR(fmod, real, (real, real), (x, y), (x, y))
DEFINE_PAIR(fma, real, (real, real, real), (x, y, z), (x, y, z))
DEFINE_PAIR(atan, real, (real), (x), (x))
DEFINE_PAIR(fabs, real, (real), (x), (x))
DEFINE_PAIR(copysign, real, (real, real), (x, y), (x, y))
DEFINE_PAIR(scalbn, real, (real, int), (x, 3), (x, 3))
DEFINE_PAIR(scalbln, real, (real, long), (x, 3), (x, 3))
DEFINE_PAIR(ldexp, real, (real, int), (x, 3), (x, 3))
DEFINE_PAIR(frexp, real, (real, int *), (x, &exponent), (x, &float_exponent))
DEFINE_PAIR(modf, real, (real, real *), (x, &integral), (x, &float_integral))
DEFINE_PAIR(nextafter, real, (real, real), (x, y), (x, y))
DEFINE_PAIR(nexttoward, real, (real, long double), (x, y), (x, y))
DEFINE_PAIR(fdim, real, (real, real), (x, y), (x, y))
DEFINE_PAIR(remainder, real, (real, real), (x, y), (x, y))
DEFINE_PAIR(remquo, real, (real, real, int *), (x, y, &exponent), (x, y, &float_exponent))
DEFINE_PAIR(nearbyint, real, (real), (x), (x))
DEFINE_PAIR(rint, real, (real), (x), (x))
DEFINE_INTEGER_PAIR(lrint, long)
DEFINE_INTEGER_PAIR(lround, long)
DEFINE_INTEGER_PAIR(llrint, long long)
DEFINE_INTEGER_PAIR(llround, long long)
DEFINE_PAIR(nan, real, (const char *), (""), (""))
DEFINE_INTEGER_PAIR(ilogb, int)
DEFINE_PAIR(logb, real, (real), (x), (x))
DEFINE_PAIR(trunc, real, (real), (x), (x))
DEFINE_PAIR(floor, real, (real), (x), (x))
DEFINE_PAIR(ceil, real, (real), (x), (x))
DEFINE_PAIR(round, real, (real), (x), (x))
DEFINE_PAIR(fmin, real, (real, real), (x, y), (x, y))
DEFINE_PAIR(fmax, real, (real, real), (x, y), (x, y))

#ifdef __cplusplus
extern "C"
#endif
int avm_test_main(void)
{
    volatile float x = 0.75f, y = 1.25f, z = -0.5f;
    float_t evaluated_float = x;
    double_t evaluated_double = y;
    if (sizeof(evaluated_float) != sizeof(float) ||
        sizeof(evaluated_double) != sizeof(double)) return 1;
    static const AVM_PROGMEM float inputs[] = {0.75f, 1.75f, -1.75f, -0.0f, INFINITY, NAN, 0x1p-149f};
    for (unsigned i = 0; i < sizeof(inputs)/sizeof(inputs[0]); ++i) {
        x = inputs[i];
        if (test_sqrt(x,y,z) || test_sqrtl(x,y,z)) return 1;
        if (test_sinh(x,y,z) || test_sinhl(x,y,z)) return 1;
        if (test_cosh(x,y,z) || test_coshl(x,y,z)) return 1;
        if (test_tanh(x,y,z) || test_tanhl(x,y,z)) return 1;
        if (test_asinh(x,y,z) || test_asinhl(x,y,z)) return 1;
        if (test_acosh(x,y,z) || test_acoshl(x,y,z)) return 1;
        if (test_atanh(x,y,z) || test_atanhl(x,y,z)) return 1;
        if (test_sin(x,y,z) || test_sinl(x,y,z)) return 1;
        if (test_cos(x,y,z) || test_cosl(x,y,z)) return 1;
        if (test_atan2(x,y,z) || test_atan2l(x,y,z)) return 1;
        if (test_tan(x,y,z) || test_tanl(x,y,z)) return 1;
        if (test_lgamma(x,y,z) || test_lgammal(x,y,z)) return 1;
        if (test_tgamma(x,y,z) || test_tgammal(x,y,z)) return 1;
        if (test_erf(x,y,z) || test_erfl(x,y,z)) return 1;
        if (test_erfc(x,y,z) || test_erfcl(x,y,z)) return 1;
        if (test_exp(x,y,z) || test_expl(x,y,z)) return 1;
        if (test_exp2(x,y,z) || test_exp2l(x,y,z)) return 1;
        if (test_expm1(x,y,z) || test_expm1l(x,y,z)) return 1;
        if (test_log1p(x,y,z) || test_log1pl(x,y,z)) return 1;
        if (test_cbrt(x,y,z) || test_cbrtl(x,y,z)) return 1;
        if (test_asin(x,y,z) || test_asinl(x,y,z)) return 1;
        if (test_acos(x,y,z) || test_acosl(x,y,z)) return 1;
        if (test_log(x,y,z) || test_logl(x,y,z)) return 1;
        if (test_log2(x,y,z) || test_log2l(x,y,z)) return 1;
        if (test_log10(x,y,z) || test_log10l(x,y,z)) return 1;
        if (test_pow(x,y,z) || test_powl(x,y,z)) return 1;
        if (test_hypot(x,y,z) || test_hypotl(x,y,z)) return 1;
        if (test_fmod(x,y,z) || test_fmodl(x,y,z)) return 1;
        if (test_fma(x,y,z) || test_fmal(x,y,z)) return 1;
        if (test_atan(x,y,z) || test_atanl(x,y,z)) return 1;
        if (test_fabs(x,y,z) || test_fabsl(x,y,z)) return 1;
        if (test_copysign(x,y,z) || test_copysignl(x,y,z)) return 1;
        if (test_scalbn(x,y,z) || test_scalbnl(x,y,z)) return 1;
        if (test_scalbln(x,y,z) || test_scalblnl(x,y,z)) return 1;
        if (test_ldexp(x,y,z) || test_ldexpl(x,y,z)) return 1;
        if (test_frexp(x,y,z) || test_frexpl(x,y,z)) return 1;
        if (test_modf(x,y,z) || test_modfl(x,y,z)) return 1;
        if (test_nextafter(x,y,z) || test_nextafterl(x,y,z)) return 1;
        if (test_nexttoward(x,y,z) || test_nexttowardl(x,y,z)) return 1;
        if (test_fdim(x,y,z) || test_fdiml(x,y,z)) return 1;
        if (test_remainder(x,y,z) || test_remainderl(x,y,z)) return 1;
        if (test_remquo(x,y,z) || test_remquol(x,y,z)) return 1;
        if (test_nearbyint(x,y,z) || test_nearbyintl(x,y,z)) return 1;
        if (test_rint(x,y,z) || test_rintl(x,y,z)) return 1;
        if (test_lrint(x,y,z) || test_lrintl(x,y,z)) return 1;
        if (test_lround(x,y,z) || test_lroundl(x,y,z)) return 1;
        if (test_llrint(x,y,z) || test_llrintl(x,y,z)) return 1;
        if (test_llround(x,y,z) || test_llroundl(x,y,z)) return 1;
        if (test_nan(x,y,z) || test_nanl(x,y,z)) return 1;
        if (test_ilogb(x,y,z) || test_ilogbl(x,y,z)) return 1;
        if (test_logb(x,y,z) || test_logbl(x,y,z)) return 1;
        if (test_trunc(x,y,z) || test_truncl(x,y,z)) return 1;
        if (test_floor(x,y,z) || test_floorl(x,y,z)) return 1;
        if (test_ceil(x,y,z) || test_ceill(x,y,z)) return 1;
        if (test_round(x,y,z) || test_roundl(x,y,z)) return 1;
        if (test_fmin(x,y,z) || test_fminl(x,y,z)) return 1;
        if (test_fmax(x,y,z) || test_fmaxl(x,y,z)) return 1;
    }
    long double integral_zero;
    errno = 0;
    double (*volatile domain)(double) = &sqrt;
    if (!isnan(domain(-1.0)) || errno != EDOM) return 1;
    errno = 0;
    long double (*volatile pole)(long double) = &logl;
    if (!isinf(pole(0.0L)) || errno != ERANGE) return 1;
    if (!signbit(copysign(0.0, -1.0)) || !signbit(modfl(-0.0L, &integral_zero))) return 1;
    return 0;
}
