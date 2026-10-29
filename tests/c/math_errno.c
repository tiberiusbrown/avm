#include <math.h>
#include <errno.h>
#include <limits.h>
#include "test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)
/* Volatile indirect calls exercise the actual library at every optimization. */
static __attribute__((noinline)) int unary(float (*volatile call)(float),
                                         float x, int error)
{
    errno = 71;
    volatile float result = call(x);
    (void)result;
    return errno == (error ? error : 71);
}
static __attribute__((noinline)) int binary(float (*volatile call)(float, float),
                                          float x, float y, int error)
{
    errno = 71;
    volatile float result = call(x, y);
    (void)result;
    return errno == (error ? error : 71);
}
static float math_value(uint32_t bits)
{
    union { uint32_t u; float f; } value = {bits};
    return value.f;
}

#define UNARY(fn, x, error) CHECK(unary(fn, x, error))
#define BINARY(fn, x, y, error) CHECK(binary(fn, x, y, error))

#ifdef __cplusplus
extern "C"
#endif
int avm_test_main(void)
{
    CHECK(math_errhandling == MATH_ERRNO);
    UNARY(erff, 0.0f, 0);
    UNARY(erff, -0.0f, 0);
    UNARY(erff, 1, 0);
    UNARY(erff, -1, 0);
    UNARY(erff, 4, 0);
    UNARY(erff, -4, 0);
    UNARY(erff, INFINITY, 0);
    UNARY(erff, -INFINITY, 0);
    UNARY(erff, NAN, 0);
    UNARY(erff, math_value(0x007fffffUL), 0);
    UNARY(erff, -math_value(0x007fffffUL), 0);
    UNARY(erfcf, 0.0f, 0);
    UNARY(erfcf, -0.0f, 0);
    UNARY(erfcf, 1, 0);
    UNARY(erfcf, -1, 0);
    UNARY(erfcf, 8, 0);
    UNARY(erfcf, -11, 0);
    UNARY(erfcf, INFINITY, 0);
    UNARY(erfcf, -INFINITY, 0);
    UNARY(erfcf, NAN, 0);
    UNARY(erff, 0x1p-149f, ERANGE);
    UNARY(erff, -0x1p-149f, ERANGE);
    UNARY(erfcf, 9.5f, ERANGE);
    UNARY(erfcf, 11, ERANGE);
    float (*volatile erf_call)(float) = erff;
    float (*volatile erfc_call)(float) = erfcf;
    CHECK(signbit(erf_call(-0.0f)));
    CHECK(!signbit(erf_call(0.0f)));
    CHECK(erf_call(4) == 1 && erf_call(-4) == -1);
    CHECK(erf_call(INFINITY) == 1 && erf_call(-INFINITY) == -1);
    CHECK(isnan(erf_call(NAN)) && isnan(erfc_call(NAN)));
    CHECK(erfc_call(0) == 1 && erfc_call(-0.0f) == 1);
    CHECK(erfc_call(INFINITY) == 0 && erfc_call(-INFINITY) == 2);
    CHECK(erfc_call(11) == 0 && erfc_call(-11) == 2);
    CHECK(erfc_call(9.5f) > 0 && erfc_call(9.5f) < 0x1p-126f);
    UNARY(sqrtf, -1, EDOM);
    UNARY(sqrtf, -INFINITY, EDOM);
    UNARY(asinf, 2, EDOM);
    UNARY(acosf, -2, EDOM);
    UNARY(acoshf, 0, EDOM);
    UNARY(atanhf, 2, EDOM);
    UNARY(atanhf, 1, ERANGE);
    UNARY(atanhf, -1, ERANGE);
    UNARY(log1pf, -2, EDOM);
    UNARY(log1pf, -1, ERANGE);
    UNARY(logf, -1, EDOM);
    UNARY(logf, 0, ERANGE);
    UNARY(logf, -0.0f, ERANGE);
    UNARY(logf, 1, 0);
    UNARY(logf, INFINITY, 0);
    UNARY(logf, NAN, 0);
    UNARY(log2f, -1, EDOM);
    UNARY(log2f, 0, ERANGE);
    UNARY(log2f, -0.0f, ERANGE);
    UNARY(log2f, 1, 0);
    UNARY(log2f, INFINITY, 0);
    UNARY(log2f, NAN, 0);
    UNARY(log10f, -1, EDOM);
    UNARY(log10f, 0, ERANGE);
    UNARY(log10f, -0.0f, ERANGE);
    UNARY(log10f, 1, 0);
    UNARY(log10f, INFINITY, 0);
    UNARY(log10f, NAN, 0);
    UNARY(sinf, INFINITY, EDOM);
    UNARY(sinf, NAN, 0);
    UNARY(cosf, INFINITY, EDOM);
    UNARY(cosf, NAN, 0);
    UNARY(tanf, INFINITY, EDOM);
    UNARY(tanf, NAN, 0);
    UNARY(expf, 1000, ERANGE);
    UNARY(expf, INFINITY, 0);
    UNARY(expf, NAN, 0);
    UNARY(exp2f, 1000, ERANGE);
    UNARY(exp2f, INFINITY, 0);
    UNARY(exp2f, NAN, 0);
    UNARY(expm1f, 1000, ERANGE);
    UNARY(expm1f, INFINITY, 0);
    UNARY(expm1f, NAN, 0);
    UNARY(sinhf, 1000, ERANGE);
    UNARY(sinhf, INFINITY, 0);
    UNARY(sinhf, NAN, 0);
    UNARY(coshf, 1000, ERANGE);
    UNARY(coshf, INFINITY, 0);
    UNARY(coshf, NAN, 0);
    UNARY(expf, -1000, ERANGE);
    UNARY(expf, -90, ERANGE);
    UNARY(exp2f, -150, ERANGE);
    UNARY(exp2f, -140, ERANGE);
    UNARY(expm1f, -1000, 0);
    UNARY(expm1f, 0x1p-149f, ERANGE);
    UNARY(expm1f, -0x1p-149f, ERANGE);
    UNARY(expm1f, math_value(0x007fffffUL), ERANGE);
    UNARY(expm1f, math_value(0x807fffffUL), ERANGE);
    UNARY(expm1f, 0x1p-126f, 0);
    UNARY(expm1f, -0x1p-126f, 0);
    UNARY(expm1f, 0.0f, 0);
    UNARY(expm1f, -0.0f, 0);
    UNARY(sinhf, 0x1.65a9f8p6f, 0);
    UNARY(coshf, 0x1.65a9f8p6f, 0);
    UNARY(sqrtf, -NAN, 0);
    UNARY(sqrtf, math_value(0xff800001UL), 0);
    UNARY(sqrtf, math_value(0xff80ffffUL), 0);
    UNARY(sqrtf, math_value(0xff810000UL), 0);
    UNARY(sqrtf, math_value(0x80000001UL), EDOM);
    UNARY(sqrtf, math_value(0x80010000UL), EDOM);
    UNARY(sqrtf, math_value(0xff7fffffUL), EDOM);
    UNARY(sinf, -NAN, 0);
    UNARY(logf, -NAN, 0);
    UNARY(log1pf, -NAN, 0);
    UNARY(asinf, -NAN, 0);
    UNARY(atanhf, -NAN, 0);
    BINARY(fmodf, INFINITY, NAN, 0);
    BINARY(fmodf, -NAN, 0, 0);
    BINARY(fmodf, 1, 0x1p-149f, 0);
    BINARY(fmodf, 1, -0.0f, EDOM);
    BINARY(powf, 0, -2, ERANGE);
    BINARY(powf, 0x1p-149f, 1, ERANGE);
    BINARY(powf, 0x1p-149f, -1, ERANGE);
    BINARY(powf, 0x1p-149f, 2, ERANGE);
    BINARY(powf, INFINITY, -1, 0);
    BINARY(powf, INFINITY, 2, 0);
    BINARY(fmodf, 1, 0, EDOM);
    BINARY(fmodf, INFINITY, 2, EDOM);
    BINARY(fmodf, NAN, 0, 0);
    BINARY(fmodf, 2, INFINITY, 0);
    BINARY(fmodf, 4, 2, 0);
    BINARY(remainderf, 1, 0, EDOM);
    BINARY(remainderf, INFINITY, 2, EDOM);
    BINARY(remainderf, NAN, 0, 0);
    BINARY(remainderf, 2, INFINITY, 0);
    BINARY(remainderf, 4, 2, 0);
    BINARY(remainderf, INFINITY, NAN, 0);
    BINARY(remainderf, 1, 0x1p-149f, 0);
    BINARY(remainderf, 1, 0x1.fffffep127f, 0);
    BINARY(powf, -2, 0.5f, EDOM);
    BINARY(powf, 0, -1, ERANGE);
    BINARY(powf, 2, 128, ERANGE);
    BINARY(powf, 2, -150, ERANGE);
    BINARY(powf, -2, 3, 0);
    BINARY(powf, NAN, 0, 0);
    BINARY(powf, 1, NAN, 0);
    BINARY(powf, 0, 0, 0);
    BINARY(powf, 2, INFINITY, 0);
    BINARY(powf, 0, -INFINITY, ERANGE);
    BINARY(hypotf, 0x1.fffffep127f, 0x1.fffffep127f, ERANGE);
    BINARY(hypotf, INFINITY, NAN, 0);
    BINARY(fdimf, 0x1.fffffep127f, -0x1.fffffep127f, ERANGE);
    BINARY(fdimf, INFINITY, 0, 0);
    BINARY(fdimf, -INFINITY, INFINITY, 0);
    BINARY(fdimf, INFINITY, INFINITY, 0);
    BINARY(fdimf, -NAN, 1, 0);
    BINARY(fdimf, 1, NAN, 0);
    BINARY(nextafterf, 0, 1, ERANGE);
    BINARY(nextafterf, 0x1.fffffep127f, INFINITY, ERANGE);
    BINARY(nextafterf, 0x1p-149f, 0, ERANGE);
    BINARY(nextafterf, 1, 2, 0);
    BINARY(nextafterf, INFINITY, 0, 0);
    BINARY(nextafterf, -INFINITY, 0, 0);
    BINARY(nextafterf, 0, 0, 0);
    BINARY(nextafterf, 0x1p-149f, 0x1p-149f, 0);
    BINARY(nextafterf, 0x1p-126f, 0, ERANGE);
    BINARY(nextafterf, math_value(0x007fffffUL), 1, 0);
    BINARY(nextafterf, -0x1p-126f, 0, ERANGE);
    BINARY(nextafterf, math_value(0x807fffffUL), -1, 0);
    float (*volatile scale)(float, int) = scalbnf;
    float (*volatile ldexp_call)(float, int) = ldexpf;
    errno = 71; CHECK(isinf(scale(1, INT_MAX)) && errno == ERANGE);
    errno = 71; CHECK(scale(1, INT_MIN) == 0 && errno == ERANGE);
    errno = 71; CHECK(scale(1, -140) > 0 && errno == ERANGE);
    errno = 71; CHECK(scale(0x1p-149f, 0) == 0x1p-149f && errno == 71);
    errno = 71; CHECK(scale(0, INT_MIN) == 0 && errno == 71);
    errno = 71; CHECK(scale(INFINITY, 100) == INFINITY && errno == 71);
    errno = 71; CHECK(ldexp_call(1, 200) == INFINITY && errno == ERANGE);
    int (*volatile ilogb_call)(float) = ilogbf;
    errno = 71; CHECK(ilogb_call(0) == FP_ILOGB0 && errno == EDOM);
    errno = 71; CHECK(ilogb_call(INFINITY) == INT_MAX && errno == EDOM);
    errno = 71; CHECK(ilogb_call(NAN) == FP_ILOGBNAN && errno == EDOM);
    UNARY(logbf, 0, ERANGE);
    UNARY(logbf, INFINITY, 0);
    long (*volatile round_long)(float) = lroundf;
    long long (*volatile round_llong)(float) = llrintf;
    errno = 71; CHECK(round_long(0x1p31f) == LONG_MIN && errno == EDOM);
    errno = 71; CHECK(round_long(-0x1p31f) == LONG_MIN && errno == 71);
    errno = 71; CHECK(round_llong(0x1p63f) == LLONG_MIN && errno == EDOM);
    errno = 71; CHECK(round_llong(-0x1p63f) == LLONG_MIN && errno == 71);
    float (*volatile fma_call)(float, float, float) = fmaf;
    errno = 71; CHECK(isnan(fma_call(0, INFINITY, 1)) && errno == EDOM);
    errno = 71; CHECK(isnan(fma_call(INFINITY, 1, -INFINITY)) && errno == EDOM);
    errno = 71; CHECK(isinf(fma_call(0x1p127f, 4, 0)) && errno == ERANGE);
    errno = 71; CHECK(isnan(fma_call(NAN, 1, 0)) && errno == 71);
    int q;
    float (*volatile remquo_call)(float, float, int *) = remquof;
    q = 17;
    errno = 71; CHECK(isnan(remquo_call(1, 0, &q)) && errno == EDOM && q == 0);
    q = 17;
    errno = 71; CHECK(isnan(remquo_call(NAN, 0, &q)) && errno == 71 && q == 0);
    q = 17;
    errno = 71; CHECK(isnan(remquo_call(INFINITY, 1, &q)) && errno == EDOM && q == 0);
    q = 17;
    errno = 71; CHECK(remquo_call(1, 0x1.fffffep127f, &q) == 1 && errno == 71 && q == 0);
    errno = 71; CHECK(remquo_call(-3, 2, &q) == 1 && errno == 71 && q == -2);
    float a, b;
    void (*volatile sincos_call)(float, float *, float *) = sincosf;
    errno = 71; sincos_call(INFINITY, &a, &b);
    CHECK(isnan(a) && isnan(b) && errno == EDOM);
    UNARY(sqrtf, -0.0f, 0);
    UNARY(expf, 1, 0);
    return 0;
}
