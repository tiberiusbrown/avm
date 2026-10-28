#include <inttypes.h>
#include <errno.h>
#include <stdio.h>
#include <string.h>
#include "test_hex_output.h"

#ifdef __cplusplus
#define STATIC_CHECK static_assert
#else
#define STATIC_CHECK _Static_assert
#endif

/* Input formats must expand to valid strings even without a scanf library. */
#define INPUT_FORMATS(w) SCNd##w SCNi##w SCNo##w SCNu##w SCNx##w
STATIC_CHECK(sizeof(INPUT_FORMATS(8)) == sizeof("hhdhhihhohhuhhx"), "8-bit scan types");
STATIC_CHECK(sizeof(INPUT_FORMATS(16)) == sizeof("dioux"), "16-bit scan types");
STATIC_CHECK(sizeof(INPUT_FORMATS(32)) == sizeof("ldlilolulx"), "32-bit scan types");
STATIC_CHECK(sizeof(INPUT_FORMATS(64)) == sizeof("lldllillollullx"), "64-bit scan types");
#define CHECK_ALIASES(w) \
    STATIC_CHECK(sizeof(INPUT_FORMATS(LEAST##w)) == sizeof(INPUT_FORMATS(w)), "least scan types"); \
    STATIC_CHECK(sizeof(INPUT_FORMATS(FAST##w)) == sizeof(INPUT_FORMATS(w)), "fast scan types")
CHECK_ALIASES(8);
CHECK_ALIASES(16);
CHECK_ALIASES(32);
CHECK_ALIASES(64);
STATIC_CHECK(sizeof(INPUT_FORMATS(MAX)) == sizeof("lldllillollullx"), "maximum scan types");
STATIC_CHECK(sizeof(INPUT_FORMATS(PTR)) == sizeof("dioux"), "pointer scan types");
STATIC_CHECK(sizeof(imaxdiv_t) == 2 * sizeof(intmax_t), "packed maximum division ABI");

static intmax_t (*volatile signed_call)(const char*, char**, int) = strtoimax;
static uintmax_t (*volatile unsigned_call)(const char*, char**, int) = strtoumax;
static intmax_t (*volatile wide_signed_call)(const wchar_t*, wchar_t**, int) = wcstoimax;
static uintmax_t (*volatile wide_unsigned_call)(const wchar_t*, wchar_t**, int) = wcstoumax;

#define CHECK(c) do { if(!(c)) { test_line16("LINE", __LINE__); return 1; } } while(0)

static int check_signed(const char* str, int base, intmax_t expected,
                        unsigned int offset, int error) {
    char* end = NULL;
    errno = EDOM;
    intmax_t value = signed_call(str, &end, base);
    return value == expected && end == str + offset && errno == (error ? error : EDOM);
}

static int check_unsigned(const char* str, int base, uintmax_t expected,
                          unsigned int offset, int error) {
    char* end = NULL;
    errno = EDOM;
    uintmax_t value = unsigned_call(str, &end, base);
    return value == expected && end == str + offset && errno == (error ? error : EDOM);
}

static int check_wide_signed(const wchar_t* str, int base, intmax_t expected,
                             unsigned int offset, int error) {
    wchar_t* end = NULL;
    errno = EDOM;
    intmax_t value = wide_signed_call(str, &end, base);
    return value == expected && end == str + offset && errno == (error ? error : EDOM);
}

static int check_wide_unsigned(const wchar_t* str, int base, uintmax_t expected,
                               unsigned int offset, int error) {
    wchar_t* end = NULL;
    errno = EDOM;
    uintmax_t value = wide_unsigned_call(str, &end, base);
    return value == expected && end == str + offset && errno == (error ? error : EDOM);
}

static char format_buffer[48];
/* Separate calls keep O0's typed-format argument packs within the VM stack. */
#define DEFINE_FORMAT_TEST(w, st, ut) \
static __attribute__((noinline)) int format_##w(void) { \
    CHECK(snprintf(format_buffer, sizeof format_buffer, "%" PRId##w "/%" PRIi##w "/%" PRIo##w "/%" PRIu##w "/%" PRIx##w "/%" PRIX##w, \
                   (st)-1, (st)-2, (ut)8, (ut)10, (ut)10, (ut)10) == 15); \
    CHECK(strcmp(format_buffer, "-1/-2/10/10/a/A") == 0); \
    return 0; \
}
DEFINE_FORMAT_TEST(8, int8_t, uint8_t)
DEFINE_FORMAT_TEST(16, int16_t, uint16_t)
DEFINE_FORMAT_TEST(32, int32_t, uint32_t)
DEFINE_FORMAT_TEST(64, int64_t, uint64_t)
DEFINE_FORMAT_TEST(LEAST8, int_least8_t, uint_least8_t)
DEFINE_FORMAT_TEST(LEAST16, int_least16_t, uint_least16_t)
DEFINE_FORMAT_TEST(LEAST32, int_least32_t, uint_least32_t)
DEFINE_FORMAT_TEST(LEAST64, int_least64_t, uint_least64_t)
DEFINE_FORMAT_TEST(FAST8, int_fast8_t, uint_fast8_t)
DEFINE_FORMAT_TEST(FAST16, int_fast16_t, uint_fast16_t)
DEFINE_FORMAT_TEST(FAST32, int_fast32_t, uint_fast32_t)
DEFINE_FORMAT_TEST(FAST64, int_fast64_t, uint_fast64_t)
DEFINE_FORMAT_TEST(MAX, intmax_t, uintmax_t)
DEFINE_FORMAT_TEST(PTR, intptr_t, uintptr_t)

static int check_formats(void) {
    CHECK(format_8() == 0 && format_16() == 0 && format_32() == 0 && format_64() == 0);
    CHECK(format_LEAST8() == 0 && format_LEAST16() == 0 && format_LEAST32() == 0 && format_LEAST64() == 0);
    CHECK(format_FAST8() == 0 && format_FAST16() == 0 && format_FAST32() == 0 && format_FAST64() == 0);
    CHECK(format_MAX() == 0 && format_PTR() == 0);
    return 0;
}

static int check_maximum_formats(void) {
    CHECK(snprintf(format_buffer, sizeof format_buffer, "%" PRIdMAX "|%" PRIuMAX,
                   INTMAX_MIN, UINTMAX_MAX) == 41);
    CHECK(strcmp(format_buffer, "-9223372036854775808|18446744073709551615") == 0);
    CHECK(snprintf(format_buffer, sizeof format_buffer, "%jd|%ju", INTMAX_MIN, UINTMAX_MAX) == 41);
    return 0;
}

int avm_test_main(void) {
    CHECK(check_formats() == 0);
    CHECK(check_maximum_formats() == 0);
    CHECK(check_signed("9223372036854775807!", 10, INTMAX_MAX, 19, 0));
    CHECK(check_signed("-9223372036854775808!", 10, INTMAX_MIN, 20, 0));
    CHECK(check_signed("9223372036854775808!", 10, INTMAX_MAX, 19, ERANGE));
    CHECK(check_signed("-9223372036854775809!", 10, INTMAX_MIN, 20, ERANGE));
    CHECK(check_unsigned("18446744073709551615!", 10, UINTMAX_MAX, 20, 0));
    CHECK(check_unsigned("18446744073709551616!", 10, UINTMAX_MAX, 20, ERANGE));
    CHECK(check_unsigned("-18446744073709551615!", 10, 1, 21, 0));
    CHECK(check_unsigned("-18446744073709551616!", 10, UINTMAX_MAX, 21, ERANGE));
    CHECK(check_wide_signed(L"9223372036854775807!", 10, INTMAX_MAX, 19, 0));
    CHECK(check_wide_signed(L"-9223372036854775808!", 10, INTMAX_MIN, 20, 0));
    CHECK(check_wide_signed(L"9223372036854775808!", 10, INTMAX_MAX, 19, ERANGE));
    CHECK(check_wide_signed(L"-9223372036854775809!", 10, INTMAX_MIN, 20, ERANGE));
    CHECK(check_wide_unsigned(L"18446744073709551615!", 10, UINTMAX_MAX, 20, 0));
    CHECK(check_wide_unsigned(L"18446744073709551616!", 10, UINTMAX_MAX, 20, ERANGE));
    CHECK(check_wide_unsigned(L"-18446744073709551615!", 10, 1, 21, 0));
    CHECK(check_wide_unsigned(L"-18446744073709551616!", 10, UINTMAX_MAX, 21, ERANGE));
    CHECK(check_wide_signed(L" \t\n\v\f\r-0x2a!", 0, -42, 11, 0));
    CHECK(check_wide_signed(L"0779", 0, 63, 3, 0));
    CHECK(check_wide_signed(L"0x", 0, 0, 1, 0));
    CHECK(check_wide_signed(L"0xg", 16, 0, 1, 0));
    CHECK(check_wide_signed(L"+", 0, 0, 0, 0));
    CHECK(check_wide_signed(L"  -!", 10, 0, 0, 0));
    CHECK(check_wide_signed(L"", 0, 0, 0, 0));
    CHECK(check_wide_signed(L"\u0100", 10, 0, 0, 0));
    CHECK(check_wide_unsigned(L"-1", 10, UINTMAX_MAX, 2, 0));
    CHECK(check_wide_unsigned(L"+0Xff!", 0, 255, 5, 0));
    CHECK(check_wide_unsigned(L"zZ!", 36, 1295, 2, 0));
    for(int base = -1; base <= 37; ++base) {
        if(base == 0 || (base >= 2 && base <= 36)) continue;
        CHECK(check_wide_signed(L"123", base, 0, 0, EINVAL));
        CHECK(check_wide_unsigned(L"123", base, 0, 0, EINVAL));
    }
    errno = EDOM;
    CHECK(strtoimax("-42", NULL, 10) == -42 && strtoumax("42", NULL, 10) == 42);
    CHECK(wcstoimax(L"-42", NULL, 10) == -42 && wcstoumax(L"42", NULL, 10) == 42);
    CHECK(errno == EDOM && imaxabs(-42) == 42);
    imaxdiv_t d = imaxdiv(-17, 5);
    CHECK(d.quot == -3 && d.rem == -2);
    return 0;
}
