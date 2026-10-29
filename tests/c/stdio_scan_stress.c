#include "stdio_scan_helpers.h"
/* Long input has static literal storage, never a token-sized stack array. */
#define DIGITS "12345678901234567890123456789012345678901234567890"
static int stress(void) {
    float f; int a, n;
    CHECK(sscanf(DIGITS DIGITS DIGITS DIGITS DIGITS DIGITS, "%*999999999999999999999d%n", &n) == 0 && n == 300);
    CHECK(sscanf("0." DIGITS DIGITS DIGITS DIGITS DIGITS DIGITS, "%f%n", &f, &n) == 1 && n == 302 && f > .12f && f < .13f);
    CHECK(sscanf("1 2 3 4 5 6 7 8 9", "%*d%*d%*d%*d%*d%*d%*d%*d%d", &a) == 1 && a == 9);
    CHECK(sscanf(DIGITS DIGITS DIGITS DIGITS DIGITS DIGITS,
        "%*[12345678901234567890123456789012345678901234567890123456789012345678901234567890]%n", &n) == 0 && n == 300);
    for(int i = 0; i < 50; ++i) CHECK(forward(0, "12", "%d", &a) == 1 && a == 12);
    return 0;
}

int avm_test_main(void) { return stress(); }
