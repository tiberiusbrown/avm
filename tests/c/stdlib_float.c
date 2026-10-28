#include <stdlib.h>
#include <errno.h>
#include <float.h>
#include <math.h>
#include <stdint.h>

#include "test_hex_output.h"

static float (*volatile float_call)(const char*, char**) = strtof;
static double (*volatile double_call)(const char*, char**) = strtod;
static long double (*volatile long_double_call)(const char*, char**) = strtold;

#ifdef __cplusplus
static_assert(sizeof(double) == sizeof(float) && DBL_MANT_DIG == FLT_MANT_DIG &&
              sizeof(long double) == sizeof(float) && LDBL_MANT_DIG == FLT_MANT_DIG,
              "AVM double and long double must be binary32");
#else
_Static_assert(sizeof(double) == sizeof(float) && DBL_MANT_DIG == FLT_MANT_DIG &&
              sizeof(long double) == sizeof(float) && LDBL_MANT_DIG == FLT_MANT_DIG,
               "AVM double and long double must be binary32");
#endif

static uint32_t bits(float f) {
    union { float f; uint32_t u; } value = {f};
    return value.u;
}

static int check(const char* text, uint32_t expected, unsigned int offset,
                 int error, unsigned int tolerance) {
    char* end = NULL;
    errno = EDOM;
    uint32_t actual = bits(float_call(text, &end));
    if(end != text + offset || errno != (error ? error : EDOM)) return 0;
    uint32_t difference = actual > expected ? actual - expected : expected - actual;
    if(difference > tolerance) {
        test_line16("ACTHI", (uint16_t)(actual >> 16));
        test_line16("ACTLO", (uint16_t)actual);
        return 0;
    }
    errno = EDOM;
    end = NULL;
    if(bits((float)long_double_call(text, &end)) != actual ||
       end != text + offset || errno != (error ? error : EDOM)) return 0;
    errno = EDOM;
    end = NULL;
    return bits((float)double_call(text, &end)) == actual &&
        end == text + offset && errno == (error ? error : EDOM);
}

#define CHECK(text, expected, offset, error, tolerance) do { \
    if(!check(text, expected, offset, error, tolerance)) { \
        test_line16("LINE", __LINE__); return 1; \
    } \
} while(0)

int avm_test_main(void) {
    CHECK("", 0x0UL, 0, 0, 0);
    CHECK(" \t+", 0x0UL, 0, 0, 0);
    CHECK(".e3", 0x0UL, 0, 0, 0);
    CHECK("-x", 0x0UL, 0, 0, 0);
    CHECK("0", 0x0UL, 1, 0, 0);
    CHECK("-0", 0x80000000UL, 2, 0, 0);
    CHECK("-0e999999999", 0x80000000UL, 12, 0, 0);
    CHECK(" \t-12.5!", 0xc1480000UL, 7, 0, 0);
    CHECK(".5z", 0x3f000000UL, 2, 0, 0);
    CHECK("1.", 0x3f800000UL, 2, 0, 0);
    CHECK("1e+", 0x3f800000UL, 1, 0, 0);
    CHECK("1e-2x", 0x3c23d70aUL, 4, 0, 2);
    CHECK("1..2", 0x3f800000UL, 2, 0, 0);
    CHECK("0x", 0x0UL, 1, 0, 0);
    CHECK("0x.p1", 0x0UL, 1, 0, 0);
    CHECK("0x.8p+1!", 0x3f800000UL, 7, 0, 0);
    CHECK("-0X1.8P2", 0xc0c00000UL, 8, 0, 0);
    CHECK("0x1p-", 0x3f800000UL, 3, 0, 0);
    CHECK("0x1p-149", 0x1UL, 8, ERANGE, 0);
    CHECK("0x1p-150", 0x0UL, 8, ERANGE, 0);
    CHECK("-0x1p-99999", 0x80000000UL, 11, ERANGE, 0);
    CHECK("0x1.000001p0", 0x3f800000UL, 12, 0, 0);
    CHECK("0x1.000003p0", 0x3f800002UL, 12, 0, 0);
    CHECK("0x1.0000010000000001p0", 0x3f800001UL, 22, 0, 0);
    CHECK("0x1.fffffep127", 0x7f7fffffUL, 14, 0, 0);
    CHECK("0x1.ffffffp127", 0x7f800000UL, 14, ERANGE, 0);
    CHECK("0x1p-126", 0x800000UL, 8, 0, 0);
    CHECK("0x1.fffffep-127", 0x800000UL, 15, 0, 0);
    CHECK("1e999999999999x", 0x7f800000UL, 14, ERANGE, 0);
    CHECK("-1e-99999999", 0x80000000UL, 12, ERANGE, 0);
    CHECK("1e-45", 0x1UL, 5, ERANGE, 0);
    CHECK("1e-46", 0x0UL, 5, ERANGE, 0);
    CHECK("3.4028234663852886e38", 0x7f7fffffUL, 21, 0, 2);
    CHECK("3.4028235e38", 0x7f7fffffUL, 12, 0, 2);
    CHECK("3.4028236e38", 0x7f800000UL, 12, ERANGE, 0);
    CHECK("340282356779733661637539395458142568447", 0x7f7fffffUL, 39, 0, 2);
    CHECK("340282356779733661637539395458142568448", 0x7f800000UL, 39, ERANGE, 0);
    CHECK("1.1754943508222875e-38", 0x800000UL, 22, 0, 2);
    CHECK("inf!", 0x7f800000UL, 3, 0, 0);
    CHECK("-INFINITY!", 0xff800000UL, 9, 0, 0);
    CHECK("infinite", 0x7f800000UL, 3, 0, 0);
    CHECK("+NaN", 0x7fc00000UL, 4, 0, 0);
    CHECK("nan(payload_123)!", 0x7fc00000UL, 16, 0, 0);
    CHECK("nan(bad-thing)", 0x7fc00000UL, 3, 0, 0);
    CHECK("nan(unclosed", 0x7fc00000UL, 3, 0, 0);
    CHECK("-nan()", 0xffc00000UL, 6, 0, 0);
    CHECK("0.1", 0x3dcccccdUL, 3, 0, 3);
    CHECK("123.456", 0x42f6e979UL, 7, 0, 3);
    CHECK("-123.456", 0xc2f6e979UL, 8, 0, 3);
    CHECK("6.02214076e23", 0x66ff0c2eUL, 13, 0, 3);
    CHECK("1.23456789e-20", 0x1e69340aUL, 14, 0, 3);
    CHECK("9.99999999e30", 0x72fc6f7cUL, 13, 0, 3);
    CHECK("2.718281828459045", 0x402df854UL, 17, 0, 3);
    CHECK("3.141592653589793", 0x40490fdbUL, 17, 0, 3);
    CHECK("16777217", 0x4b800000UL, 8, 0, 3);
    CHECK("0.0000000000000000123456789", 0x2363bcd2UL, 27, 0, 3);
    CHECK("12345678901234567890123456789e-30", 0x3c4a4588UL, 33, 0, 3);
    static char large[128];
    for(unsigned int i = 0; i < 120; ++i) large[i] = '0';
    large[0] = '1';
    large[120] = 'e'; large[121] = '-'; large[122] = '1';
    large[123] = '1'; large[124] = '9'; large[125] = 0;
    CHECK(large, 0x3f800000UL, 125, 0, 0);
    errno = EDOM;
    if(float_call("1.5", NULL) != 1.5f || double_call("2.5", NULL) != 2.5 ||
       strtof("3.5", NULL) != 3.5f || strtod("4.5", NULL) != 4.5 || strtold("5.5", NULL) != 5.5L || errno != EDOM)
        return 2;
    return 0;
}
