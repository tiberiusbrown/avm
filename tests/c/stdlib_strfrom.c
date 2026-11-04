#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "test_hex_output.h"

#define CHECK(expr) do { if(!(expr)) { test_line16("LINE", __LINE__); return 1; } } while(0)

/* Volatile pointers keep each interface addressable and ordinary. */
static int (*volatile call_d)(char*, size_t, const char*, double) = strfromd;
static int (*volatile call_f)(char*, size_t, const char*, float) = strfromf;
static int (*volatile call_l)(char*, size_t, const char*, long double) = strfroml;

int avm_test_main(void) {
    char buf[64];
    int n;

    /* The default precision is six digits, as in snprintf. */
    n = call_d(buf, sizeof buf, "%f", 1.0);
    CHECK(n == 8 && strcmp(buf, "1.000000") == 0);
    n = call_f(buf, sizeof buf, "%.3f", 1.0f);
    CHECK(n == 5 && strcmp(buf, "1.000") == 0);
    n = call_d(buf, sizeof buf, "%f", -1.234567);
    CHECK(n == 9 && strcmp(buf, "-1.234567") == 0);
    n = call_l(buf, sizeof buf, "%f", 1.5L);
    CHECK(n == 8 && strcmp(buf, "1.500000") == 0);

    /* Truncation keeps the first n-1 characters but returns the full length. */
    memset(buf, '?', sizeof buf);
    n = call_d(buf, 5, "%f", 1234567890.0);
    CHECK(n == 17 && strcmp(buf, "1234") == 0);
    n = call_d(buf, 5, "%.5f", 1.05);
    CHECK(n == 7 && strcmp(buf, "1.05") == 0);
    n = call_d(buf, 1, "%f", 1.0);
    CHECK(n == 8 && buf[0] == '\0');

    /* With n zero nothing is written, so the buffer may be null. */
    strcpy(buf, "unchanged");
    n = call_d(buf, 0, "%g", 1.0);
    CHECK(n == 1 && strcmp(buf, "unchanged") == 0);
    n = call_d(NULL, 0, "%e", 1.0);
    CHECK(n == 12);

    /* Every supported conversion, including the uppercase forms. */
    n = call_d(buf, sizeof buf, "%.2e", 1234.5);
    CHECK(n == 8 && strcmp(buf, "1.23e+03") == 0);
    n = call_d(buf, sizeof buf, "%E", 1234.5);
    CHECK(n == 12 && strcmp(buf, "1.234500E+03") == 0);
    n = call_d(buf, sizeof buf, "%g", 0.0001);
    CHECK(n == 6 && strcmp(buf, "0.0001") == 0);
    n = call_d(buf, sizeof buf, "%G", 1e20);
    CHECK(n == 5 && strcmp(buf, "1E+20") == 0);
    n = call_d(buf, sizeof buf, "%a", 1.0);
    CHECK(n == 6 && strcmp(buf, "0x1p+0") == 0);
    n = call_d(buf, sizeof buf, "%A", 1.0);
    CHECK(n == 6 && strcmp(buf, "0X1P+0") == 0);
    n = call_f(buf, sizeof buf, "%a", 1234567890.0f);
    CHECK(n == 14 && strcmp(buf, "0x1.26580cp+30") == 0);

    /* Non-finite values use the uppercase spelling for %F. */
    n = call_d(buf, sizeof buf, "%F", (double)INFINITY);
    CHECK(n == 3 && strcmp(buf, "INF") == 0);
    n = call_d(buf, sizeof buf, "%F", -(double)INFINITY);
    CHECK(n == 4 && strcmp(buf, "-INF") == 0);

    /* Other formats are copied without conversion. */
    n = call_d(buf, sizeof buf, "%1f", 1234567890.0);
    CHECK(n == 3 && strcmp(buf, "%1f") == 0);
    n = call_d(buf, sizeof buf, "%*f", 1.0);
    CHECK(n == 3 && strcmp(buf, "%*f") == 0);
    n = call_d(buf, sizeof buf, "%d", 1.0);
    CHECK(n == 2 && strcmp(buf, "%d") == 0);
    n = call_d(buf, sizeof buf, "%fx", 1.0);
    CHECK(n == 3 && strcmp(buf, "%fx") == 0);
    n = call_d(buf, sizeof buf, "plain text", 1.0);
    CHECK(n == 10 && strcmp(buf, "plain text") == 0);
    n = call_d(buf, 4, "abcdef", 1.0);
    CHECK(n == 6 && strcmp(buf, "abc") == 0);

    return 0;
}
