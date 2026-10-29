#include <fenv.h>
#include <errno.h>
#include <float.h>
#include <math.h>
#include "test_hex_output.h"

#if FE_TONEAREST != 0 || FE_ALL_EXCEPT != 0
#error Invalid invariant environment macros
#endif
#if defined(FE_INVALID) || defined(FE_DIVBYZERO) || defined(FE_OVERFLOW) || defined(FE_UNDERFLOW) || defined(FE_INEXACT) || defined(FE_DOWNWARD) || defined(FE_UPWARD) || defined(FE_TOWARDZERO)
#error Unsupported floating-point capability advertised
#endif
#ifdef __STDC_IEC_559__
#error AVM does not provide full IEC 60559 conformance
#endif
#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

/* Run the same operations with default and explicitly enabled FENV_ACCESS. */
#define FP_CHECKS() \
    volatile float one = 1.0f, half_ulp = 0x1p-24f; \
    volatile float odd = 0x1.000002p0f, factor = 0x1.000002p0f; \
    volatile float three = 3.0f; \
    volatile unsigned long integer = 16777217UL; \
    volatile unsigned int narrow = 65535U; \
    volatile int negative = -3; \
    volatile float zero = 0.0f, largest = FLT_MAX, smallest = FLT_MIN; \
    volatile float result = one + half_ulp; \
    CHECK(result == 1.0f); \
    result = odd + half_ulp; CHECK(result == 0x1.000004p0f); \
    result = factor * factor; CHECK(result == 0x1.000004p0f); \
    result = one / three; CHECK(result == 0x1.555556p-2f); \
    result = (float)integer; CHECK(result == 16777216.0f); \
    volatile int converted = (int)three; CHECK(converted == 3); \
    result = (float)narrow; CHECK(result == 65535.0f); \
    result = (float)negative; CHECK(result == -3.0f); \
    volatile unsigned int unsigned_converted = (unsigned int)three; \
    CHECK(unsigned_converted == 3); \
    result = one / zero; CHECK(isinf(result)); \
    result = zero / zero; CHECK(isnan(result)); \
    result = largest * largest; CHECK(isinf(result)); \
    result = smallest * smallest; CHECK(result == 0.0f); \
    CHECK(fetestexcept(FE_ALL_EXCEPT) == 0); \
    CHECK(fegetround() == FE_TONEAREST)

static int default_arithmetic(void)
{
    FP_CHECKS();
    return 0;
}
static int enabled_arithmetic(void)
{
#pragma clang diagnostic error "-Wignored-pragmas"
#pragma STDC FENV_ACCESS ON
    FP_CHECKS();
    return 0;
}

int avm_test_main(void)
{
    int (*volatile clear)(int) = feclearexcept;
    int (*volatile getflag)(fexcept_t *, int) = fegetexceptflag;
    int (*volatile raise)(int) = feraiseexcept;
    int (*volatile setflag)(const fexcept_t *, int) = fesetexceptflag;
    int (*volatile test)(int) = fetestexcept;
    int (*volatile getround)(void) = fegetround;
    int (*volatile setround)(int) = fesetround;
    int (*volatile getenv_call)(fenv_t *) = fegetenv;
    int (*volatile hold)(fenv_t *) = feholdexcept;
    int (*volatile setenv_call)(const fenv_t *) = fesetenv;
    int (*volatile update)(const fenv_t *) = feupdateenv;
    const fenv_t *default_env = FE_DFL_ENV;
    fenv_t saved = 99, held = 77;
    fexcept_t flags = 55;
    CHECK(sizeof(fenv_t) == 1 && sizeof(fexcept_t) == 1);
    CHECK(FLT_ROUNDS == 1);
    CHECK(math_errhandling == MATH_ERRNO);
    errno = 71;
    CHECK(getround() == FE_TONEAREST);
    CHECK(setround(FE_TONEAREST) == 0);
    CHECK(setround(-1) != 0 && getround() == FE_TONEAREST);
    CHECK(setround(1) != 0 && getround() == FE_TONEAREST);
    CHECK(clear(FE_ALL_EXCEPT) == 0);
    CHECK(raise(FE_ALL_EXCEPT) == 0);
    CHECK(getflag(&flags, FE_ALL_EXCEPT) == 0 && flags == 0);
    CHECK(setflag(&flags, FE_ALL_EXCEPT) == 0);
    CHECK(test(FE_ALL_EXCEPT) == 0);
    CHECK(getenv_call(&saved) == 0 && saved == 0);
    CHECK(hold(&held) == 0 && held == 0);
    CHECK(setenv_call(&saved) == 0 && update(&held) == 0);
    CHECK(setenv_call(default_env) == 0 && update(default_env) == 0);
    for (int i = 0; i < 3; ++i) {
        held = 42;
        CHECK(hold(&held) == 0 && held == 0);
        CHECK(update(&held) == 0);
        CHECK(getenv_call(&saved) == 0 && setenv_call(&saved) == 0);
        flags = 42;
        CHECK(getflag(&flags, 0) == 0 && flags == 0);
        CHECK(setflag(&flags, 0) == 0 && test(0) == 0);
    }
    /* Defensive failures are outside the supported C99 mask set. */
    flags = 42;
    CHECK(clear(1) != 0 && raise(1) != 0 && setflag(&flags, 1) != 0);
    CHECK(getflag(&flags, 1) != 0 && flags == 42);
    CHECK(default_arithmetic() == 0 && enabled_arithmetic() == 0);
    CHECK(errno == 71);
    return 0;
}
