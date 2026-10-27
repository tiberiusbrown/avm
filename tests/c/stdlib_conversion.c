#include <stdlib.h>
#include <errno.h>
#include <limits.h>
#include <stdint.h>

#include "test_hex_output.h"

static int (*volatile int_call)(const char*) = atoi;
static long (*volatile long_call)(const char*) = atol;
static long long (*volatile llong_call)(const char*) = atoll;
static long (*volatile sl)(const char*, char**, int) = strtol;
static unsigned long (*volatile ul)(const char*, char**, int) = strtoul;
static long long (*volatile sll)(const char*, char**, int) = strtoll;
static unsigned long long (*volatile ull)(const char*, char**, int) = strtoull;

#define CHECK(condition) do { if(!(condition)) { test_line16("LINE", __LINE__); return 1; } } while(0)

static int check_slong(const char* text, int base, long expected,
                         unsigned int offset, int error)
{
    char* end = NULL;
    errno = EDOM;
    long actual = sl(text, &end, base);
    return actual == expected && end == text + offset && errno == (error ? error : EDOM);
}

static int check_ulong(const char* text, int base, unsigned long expected,
                         unsigned int offset, int error)
{
    char* end = NULL;
    errno = EDOM;
    unsigned long actual = ul(text, &end, base);
    return actual == expected && end == text + offset && errno == (error ? error : EDOM);
}

static int check_sllong(const char* text, int base, long long expected,
                         unsigned int offset, int error)
{
    char* end = NULL;
    errno = EDOM;
    long long actual = sll(text, &end, base);
    return actual == expected && end == text + offset && errno == (error ? error : EDOM);
}

static int check_ullong(const char* text, int base, unsigned long long expected,
                         unsigned int offset, int error)
{
    char* end = NULL;
    errno = EDOM;
    unsigned long long actual = ull(text, &end, base);
    return actual == expected && end == text + offset && errno == (error ? error : EDOM);
}

int avm_test_main(void)
{
    CHECK(int_call("0") == 0 && int_call(" \t-32768!") == INT_MIN &&
          int_call("+32767") == INT_MAX && int_call("-12x") == -12 &&
          int_call("") == 0 && int_call("+") == 0 && int_call("0x10") == 0);
    CHECK(long_call("2147483647") == LONG_MAX &&
          long_call("-2147483648") == LONG_MIN && long_call(" \n+42z") == 42 &&
          long_call("xyz") == 0);
    CHECK(llong_call("9223372036854775807") == LLONG_MAX &&
          llong_call("-9223372036854775808") == LLONG_MIN &&
          llong_call(" -42!") == -42 && llong_call("") == 0);
    for(int base = 2; base <= 36; ++base) {
        CHECK(check_slong("10!", base, base, 2, 0));
        CHECK(check_ulong("10!", base, base, 2, 0));
        CHECK(check_sllong("10!", base, base, 2, 0));
        CHECK(check_ullong("10!", base, base, 2, 0));
    }
    CHECK(check_slong("", 0, 0, 0, 0));
    CHECK(check_slong(" \t+", 10, 0, 0, 0));
    CHECK(check_slong("xyz", 10, 0, 0, 0));
    CHECK(check_slong(" \t-0x1f!", 0, -31, 7, 0));
    CHECK(check_slong("0779", 0, 63, 3, 0));
    CHECK(check_slong("09", 0, 0, 1, 0));
    CHECK(check_slong("0x", 0, 0, 1, 0));
    CHECK(check_slong("0xg", 16, 0, 1, 0));
    CHECK(check_slong("0Xff!", 16, 255, 4, 0));
    CHECK(check_slong("0b11", 0, 0, 1, 0));
    CHECK(check_slong("Zz!", 36, 1295, 2, 0));
    CHECK(check_slong("2147483647!", 10, LONG_MAX, 10, 0));
    CHECK(check_slong("-2147483648!", 10, LONG_MIN, 11, 0));
    CHECK(check_slong("2147483648!", 10, LONG_MAX, 10, ERANGE));
    CHECK(check_slong("-2147483649!", 10, LONG_MIN, 11, ERANGE));
    CHECK(check_slong("9999999999999999999999!", 10, LONG_MAX, 22, ERANGE));
    CHECK(check_slong("80000000!", 16, LONG_MAX, 8, ERANGE));
    CHECK(check_slong("-80000000!", 16, LONG_MIN, 9, 0));
    CHECK(check_ulong("4294967295!", 10, ULONG_MAX, 10, 0));
    CHECK(check_ulong("4294967296!", 10, ULONG_MAX, 10, ERANGE));
    CHECK(check_ulong("-1", 10, ULONG_MAX, 2, 0));
    CHECK(check_ulong("-4294967295", 10, 1, 11, 0));
    CHECK(check_ulong("-4294967296", 10, ULONG_MAX, 11, ERANGE));
    CHECK(check_ulong("0xffffffff!", 0, ULONG_MAX, 10, 0));
    CHECK(check_ulong("-0", 10, 0, 2, 0));
    CHECK(check_ulong(" +", 10, 0, 0, 0));
    CHECK(check_sllong("9223372036854775807!", 10, LLONG_MAX, 19, 0));
    CHECK(check_sllong("-9223372036854775808!", 10, LLONG_MIN, 20, 0));
    CHECK(check_sllong("9223372036854775808!", 10, LLONG_MAX, 19, ERANGE));
    CHECK(check_sllong("-9223372036854775809!", 10, LLONG_MIN, 20, ERANGE));
    CHECK(check_sllong("-0x8000000000000000!", 0, LLONG_MIN, 19, 0));
    CHECK(check_sllong("999999999999999999999999999999!", 10, LLONG_MAX, 30, ERANGE));
    CHECK(check_sllong("0x", 16, 0, 1, 0));
    CHECK(check_sllong("  -", 0, 0, 0, 0));
    CHECK(check_ullong("18446744073709551615!", 10, ULLONG_MAX, 20, 0));
    CHECK(check_ullong("18446744073709551616!", 10, ULLONG_MAX, 20, ERANGE));
    CHECK(check_ullong("-18446744073709551615!", 10, 1, 21, 0));
    CHECK(check_ullong("-18446744073709551616!", 10, ULLONG_MAX, 21, ERANGE));
    CHECK(check_ullong("0xffffffffffffffff!", 0, ULLONG_MAX, 18, 0));
    CHECK(check_ullong("-1", 10, ULLONG_MAX, 2, 0));
    CHECK(check_ullong("", 0, 0, 0, 0));
    for(int base = -1; base <= 37; ++base) {
        if(base == 0 || (base >= 2 && base <= 36)) continue;
        CHECK(check_slong("123", base, 0, 0, EINVAL));
        CHECK(check_ulong("123", base, 0, 0, EINVAL));
        CHECK(check_sllong("123", base, 0, 0, EINVAL));
        CHECK(check_ullong("123", base, 0, 0, EINVAL));
    }
    const char high[] = {(char)0xff, '1', 0};
    CHECK(check_slong(high, 10, 0, 0, 0));
    errno = EDOM;
    CHECK(sl("42", NULL, 10) == 42 && ul("42", NULL, 10) == 42 &&
          sll("42", NULL, 10) == 42 && ull("42", NULL, 10) == 42 && errno == EDOM);
    CHECK(atoi("17") == 17 && atol("123456") == 123456L &&
          atoll("123456789012") == 123456789012LL &&
          strtol("ff", NULL, 16) == 255 && strtoul("ff", NULL, 16) == 255 &&
          strtoll("ff", NULL, 16) == 255 && strtoull("ff", NULL, 16) == 255);
    return 0;
}
