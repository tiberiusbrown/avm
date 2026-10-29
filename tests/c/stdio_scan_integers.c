#include "stdio_scan_helpers.h"
static int integers(void) {
    int a = 99, b = 99, n = -1;
    static unsigned u, v, v2, neg; static long l; static unsigned long ul;
    static long long ll; static unsigned long long ull;
    static signed char sc; static unsigned char uc; static short sh; static unsigned short us;
    static intmax_t j; static uintmax_t uj; static size_t z; static ptrdiff_t t;
    CHECK(string_call("-32768 32767", "%d%d%n", &a, &b, &n) == 2 && a == INT_MIN && b == INT_MAX && n == 12);
    CHECK(sscanf("-128 255 -32768 65535", "%hhd%hhu%hd%hu", &sc, &uc, &sh, &us) == 4 && sc == SCHAR_MIN && uc == UCHAR_MAX && sh == SHRT_MIN && us == USHRT_MAX);
    CHECK(sscanf("-2147483648 4294967295", "%ld%lu", &l, &ul) == 2 && l == LONG_MIN && ul == ULONG_MAX);
    CHECK(sscanf("-9223372036854775808 18446744073709551615", "%lld%llu", &ll, &ull) == 2 && ll == LLONG_MIN && ull == ULLONG_MAX);
    CHECK(sscanf("-9223372036854775808 18446744073709551615", "%jd%ju", &j, &uj) == 2 && j == INTMAX_MIN && uj == UINTMAX_MAX);
    CHECK(sscanf("-32768 65535 -32768 65535", "%zd%zu%td%tu", &a, &z, &t, &u) == 4 && a == INT_MIN && z == UINT_MAX && t == INT_MIN && u == UINT_MAX);
    CHECK(sscanf("17 10 ff FF -1", "%o%u%x%X%u", &u, &z, &v, &v2, &neg) == 5 && u == 15 && z == 10 && v2 == 255 && v == 255 && neg == 65535);
    CHECK(sscanf("09", "%i%n%d", &a, &n, &b) == 2 && a == 0 && n == 1 && b == 9);
    CHECK(sscanf("0x1g", "%i%n", &a, &n) == 1 && a == 1 && n == 3);
    CHECK(sscanf("0xg", "%x", &u) == 0);
    CHECK(sscanf("+", "%d", &a) == 0);
    CHECK(sscanf("", "%d", &a) == EOF && sscanf("abc", "%d", &a) == 0);
    CHECK(sscanf("12 abc", "%d%d", &a, &b) == 1 && a == 12);
    CHECK(sscanf("12", "%d%d", &a, &b) == 1);
    CHECK(sscanf("12 34", "%*d%d", &b) == 1 && b == 34);
    CHECK(sscanf("12", "%*d%d", &b) == EOF);
    CHECK(sscanf("1234", "%2d%n%d", &a, &n, &b) == 2 && a == 12 && n == 2 && b == 34);
    CHECK(sscanf("0x1", "%2x", &u) == 0);
    CHECK((sscanf)("42", "%d", &a) == 1 && a == 42);
    return 0;
}

int avm_test_main(void) { return integers(); }
