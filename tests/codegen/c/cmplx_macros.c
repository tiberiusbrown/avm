#include <complex.h>
#include <math.h>
#include "test_hex_output.h"

#define CHECK(expr) do { if(!(expr)) { test_line16("LINE", __LINE__); return 1; } } while(0)
#define IS_TYPE(expr, type) _Generic((expr), type: 1, default: 0)

/* The macros are constant expressions, so they can initialize static objects. */
static const double _Complex static_double = CMPLX(1.5, -2.0);
static const float _Complex static_float = CMPLXF(3.0f, 4.0f);
static const long double _Complex static_long = CMPLXL(5.0L, 6.0L);

_Static_assert(IS_TYPE(CMPLX(1, 2), double _Complex), "CMPLX type");
_Static_assert(IS_TYPE(CMPLXF(1, 2), float _Complex), "CMPLXF type");
_Static_assert(IS_TYPE(CMPLXL(1, 2), long double _Complex), "CMPLXL type");

/* File-scope storage keeps each check's stack frame within AVM's limit. */
static volatile double one = 1.0;
static volatile double inf = INFINITY;
static volatile double nan_value = NAN;
static double _Complex scratch;

__attribute__((noinline)) static int check_static_values(void) {
    CHECK(creal(static_double) == 1.5 && cimag(static_double) == -2.0);
    CHECK(creal(static_float) == 3.0f && cimag(static_float) == 4.0f);
    CHECK(creal(static_long) == 5.0L && cimag(static_long) == 6.0L);
    return 0;
}

/* Arguments convert to the component type before the value is built. */
__attribute__((noinline)) static int check_runtime_parts(void) {
    scratch = CMPLX(7, 8);
    CHECK(creal(scratch) == 7.0 && cimag(scratch) == 8.0);
    scratch = CMPLX(one * 2.0, one * -3.0);
    CHECK(creal(scratch) == 2.0 && cimag(scratch) == -3.0);
    return 0;
}

/* Infinite or NaN parts remain in their own component. */
__attribute__((noinline)) static int check_non_finite(void) {
    scratch = CMPLX(one, inf);
    CHECK(creal(scratch) == 1.0 && isinf(cimag(scratch)) && cimag(scratch) > 0.0);
    scratch = CMPLX(inf, 0.0);
    CHECK(isinf(creal(scratch)) && creal(scratch) > 0.0 && cimag(scratch) == 0.0);
    scratch = CMPLX(0.0, nan_value);
    CHECK(creal(scratch) == 0.0 && isnan(cimag(scratch)));
    scratch = CMPLX(nan_value, one);
    CHECK(isnan(creal(scratch)) && cimag(scratch) == 1.0);
    scratch = CMPLX(-one * inf, one);
    CHECK(isinf(creal(scratch)) && creal(scratch) < 0.0 && cimag(scratch) == 1.0);
    return 0;
}

/* The single-precision and extended forms keep the same component rules. */
__attribute__((noinline)) static int check_precision_forms(void) {
    float _Complex f = CMPLXF(one, nan_value);
    long double _Complex l = CMPLXL(inf, one);
    CHECK(crealf(f) == 1.0f && isnan(cimagf(f)));
    CHECK(creall(l) > 0.0L && cimagl(l) == 1.0L);
    return 0;
}

/* The result equals the complex value built from its parts. */
__attribute__((noinline)) static int check_identities(void) {
    scratch = CMPLX(2.0, 3.0);
    CHECK(scratch == 2.0 + 3.0 * I);
    scratch = CMPLX(1, 0);
    CHECK(scratch == 1.0);
    return 0;
}

int avm_test_main(void) {
    return check_static_values() || check_runtime_parts() || check_non_finite() ||
           check_precision_forms() || check_identities();
}
