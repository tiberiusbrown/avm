#include "stdio_scan_helpers.h"
#include <errno.h>
static int floats(void) {
    float f; double d; long double l; int n;
    static const char *const formats[] = {"%f", "%e", "%g", "%a", "%F", "%E", "%G", "%A"};
    for(unsigned i = 0; i < sizeof formats / sizeof *formats; ++i) {
        CHECK(sscanf("  -0x1.8p+2", formats[i], &f) == 1 && f == -6);
        CHECK(sscanf("1.25e2", formats[i], &f) == 1 && f == 125);
    }
    CHECK(sscanf("1 2 3 4", "%lf%le%lg%la", &d, &d, &d, &d) == 4 && d == 4);
    CHECK(sscanf("1 2 3 4", "%Lf%Le%Lg%La", &l, &l, &l, &l) == 4 && l == 4);
    errno = EDOM;
    CHECK(sscanf("1.25", "%f", &f) == 1 && f == 1.25f && errno == EDOM);
    CHECK(sscanf("-0", "%f", &f) == 1 && f == 0 && signbit(f));
    CHECK(sscanf("InfINity!", "%f%n", &f, &n) == 1 && isinf(f) && n == 8);
    CHECK(sscanf("-nan(a_123)!", "%f%n", &f, &n) == 1 && isnan(f) && n == 11);
    CHECK(sscanf("nan()", "%f", &f) == 1 && isnan(f));
    CHECK(sscanf("1e99999", "%f", &f) == 1 && isinf(f) && errno == ERANGE);
    CHECK(sscanf("-1e-99999", "%f", &f) == 1 && f == 0 && signbit(f) && errno == ERANGE);
    static const char *const bad[] = {"1e+", "0x1p-", "0x", ".", "+", "infi", "na", "nan(foo"};
    for(unsigned i = 0; i < sizeof bad / sizeof *bad; ++i) CHECK(sscanf(bad[i], "%f", &f) == 0);
    CHECK(sscanf("1e+2", "%3f", &f) == 0);
    CHECK(sscanf("1.5x", "%f%n", &f, &n) == 1 && f == 1.5f && n == 3);
    static const char *const numbers[] = {"1.23456789e-30", "0x1.fffffep127", "0x1p-149", "340282346638528859811704183484516925440", "0.00012345", "0001.25"};
    for(unsigned i = 0; i < sizeof numbers / sizeof *numbers; ++i) {
        float reference = strtof(numbers[i], 0);
        CHECK(sscanf(numbers[i], "%f", &f) == 1);
        CHECK(f == reference || fabsf(f - reference) <= fabsf(reference) * 0.000001f);
    }
    return 0;
}

int avm_test_main(void) { return floats(); }
