#include <assert.h>
#include <errno.h>
#include <inttypes.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

static int disabled_count;
#define NDEBUG
#include <assert.h>
static void disabled_assertion(void) {
    assert(++disabled_count);
    assert(undeclared_under_NDEBUG);
}
#undef NDEBUG
#include <assert.h>

static intmax_t (*volatile absolute_max)(intmax_t) = imaxabs;
static imaxdiv_t (*volatile divide_max)(intmax_t, intmax_t) = imaxdiv;
static double (*volatile float_conversion)(const char*) = atof;

#ifdef __cplusplus
#define CHECK_TYPE(value, type) static_assert(__is_same(decltype(value), type), "constant type")
#else
#define CHECK_TYPE(value, type) _Static_assert(__builtin_types_compatible_p(__typeof__(value), type), "constant type")
#endif
CHECK_TYPE(HUGE_VAL, double);
CHECK_TYPE(HUGE_VALF, float);
CHECK_TYPE(HUGE_VALL, long double);
CHECK_TYPE(INFINITY, float);
CHECK_TYPE(NAN, float);

int avm_test_main(void) {
    int side_effect = 0;
    assert(++side_effect == 1);
    disabled_assertion();
    if(side_effect != 1 || disabled_count != 0) return 1;
    if(EXIT_SUCCESS != 0 || EXIT_FAILURE != 1 || MB_CUR_MAX != 1) return 2;
    if(!isinf(HUGE_VAL) || !isinf(HUGE_VALF) || !isinf(HUGE_VALL) ||
       !isinf(INFINITY) || !isnan(NAN)) return 3;
    if(atof("1.5") != 1.5 || float_conversion("-2.5") != -2.5) return 4;
    if(MATH_ERRNO != 1 || MATH_ERREXCEPT != 2 || signbit(HUGE_VAL) ||
       signbit(HUGE_VALF) || signbit(HUGE_VALL) || signbit(INFINITY)) return 15;
    if(absolute_max(-42) != 42) return 7;
    imaxdiv_t d = divide_max(-17, 5);
    if(d.quot != -3 || d.rem != -2) return 8;
    return 0;
}
