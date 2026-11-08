#include <stdlib.h>
#include <limits.h>

static int (*volatile abs_call)(int) = abs;
static div_t (*volatile div_call)(int, int) = div;

__attribute__((noinline)) static int test_abs_int(void)
{
    return abs_call(0) || abs_call(-1) != 1 ||
        abs_call(INT_MIN + 1) != INT_MAX ||
        abs_call(INT_MAX) != INT_MAX || abs(-42) != 42;
}

__attribute__((noinline)) static int test_div_int(void)
{
    for(int n = -19; n <= 19; ++n) {
        for(int d = -7; d <= 7; ++d) {
            if(!d) continue;
            /* Independent reference using repeated subtraction. */
            int magnitude = n < 0 ? -n : n;
            int denominator = d < 0 ? -d : d;
            int quotient = 0;
            while(magnitude >= denominator) {
                magnitude -= denominator;
                ++quotient;
            }
            if((n < 0) != (d < 0)) quotient = -quotient;
            int remainder = n < 0 ? -magnitude : magnitude;
            div_t value = div_call(n, d);
            if(value.quot != quotient || value.rem != remainder) return 1;
        }
    }
    return 0;
}

__attribute__((noinline)) static int test_limits_int(void)
{
    div_t value = div_call(INT_MIN, 1);
    if(value.quot != INT_MIN || value.rem) return 1;
    value = div_call(INT_MAX, -INT_MAX);
    if(value.quot != -1 || value.rem) return 2;
    value = div(-7, -3);
    return value.quot != 2 || value.rem != -1;
}

static long (*volatile labs_call)(long) = labs;
static ldiv_t (*volatile ldiv_call)(long, long) = ldiv;

__attribute__((noinline)) static int test_abs_long(void)
{
    return labs_call(0) || labs_call(-1) != 1 ||
        labs_call(LONG_MIN + 1) != LONG_MAX ||
        labs_call(LONG_MAX) != LONG_MAX || labs(-42) != 42;
}

__attribute__((noinline)) static int test_div_long(void)
{
    for(int n = -19; n <= 19; ++n) {
        for(int d = -7; d <= 7; ++d) {
            if(!d) continue;
            /* Independent reference using repeated subtraction. */
            int magnitude = n < 0 ? -n : n;
            int denominator = d < 0 ? -d : d;
            int quotient = 0;
            while(magnitude >= denominator) {
                magnitude -= denominator;
                ++quotient;
            }
            if((n < 0) != (d < 0)) quotient = -quotient;
            int remainder = n < 0 ? -magnitude : magnitude;
            ldiv_t value = ldiv_call(n, d);
            if(value.quot != quotient || value.rem != remainder) return 1;
        }
    }
    return 0;
}

__attribute__((noinline)) static int test_limits_long(void)
{
    ldiv_t value = ldiv_call(LONG_MIN, 1);
    if(value.quot != LONG_MIN || value.rem) return 1;
    value = ldiv_call(LONG_MAX, -LONG_MAX);
    if(value.quot != -1 || value.rem) return 2;
    value = ldiv_call(-123456789L, 12345L);
    if(value.quot != -10000L || value.rem != -6789L) return 3;
    value = ldiv(-7, -3);
    return value.quot != 2 || value.rem != -1;
}

static long long (*volatile llabs_call)(long long) = llabs;
static lldiv_t (*volatile lldiv_call)(long long, long long) = lldiv;

__attribute__((noinline)) static int test_abs_llong(void)
{
    return llabs_call(0) || llabs_call(-1) != 1 ||
        llabs_call(LLONG_MIN + 1) != LLONG_MAX ||
        llabs_call(LLONG_MAX) != LLONG_MAX || llabs(-42) != 42;
}

__attribute__((noinline)) static int test_div_llong(void)
{
    for(int n = -19; n <= 19; ++n) {
        for(int d = -7; d <= 7; ++d) {
            if(!d) continue;
            /* Independent reference using repeated subtraction. */
            int magnitude = n < 0 ? -n : n;
            int denominator = d < 0 ? -d : d;
            int quotient = 0;
            while(magnitude >= denominator) {
                magnitude -= denominator;
                ++quotient;
            }
            if((n < 0) != (d < 0)) quotient = -quotient;
            int remainder = n < 0 ? -magnitude : magnitude;
            lldiv_t value = lldiv_call(n, d);
            if(value.quot != quotient || value.rem != remainder) return 1;
        }
    }
    return 0;
}

__attribute__((noinline)) static int test_limits_llong(void)
{
    lldiv_t value = lldiv_call(LLONG_MIN, 1);
    if(value.quot != LLONG_MIN || value.rem) return 1;
    value = lldiv_call(LLONG_MAX, -LLONG_MAX);
    if(value.quot != -1 || value.rem) return 2;
    value = lldiv_call(-123456789012345LL, 1234567LL);
    if(value.quot != -100000072LL || value.rem != -123521LL) return 3;
    value = lldiv(-7, -3);
    return value.quot != 2 || value.rem != -1;
}

int avm_test_main(void)
{
    return test_abs_int() || test_abs_long() || test_abs_llong() ||
        test_div_int() || test_div_long() || test_div_llong() ||
        test_limits_int() || test_limits_long() || test_limits_llong();
}
