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
    /* C23 b conversion and the binary prefix accepted by i. */
    CHECK(sscanf("1011 0b11 -0B1", "%b%i%i", &u, &v, &a) == 3 && u == 11 && v == 3 && a == -1);
    CHECK(sscanf("0b101 0b", "%i%n", &a, &n) == 1 && a == 5 && n == 5);
    CHECK(sscanf("0b12", "%i%n", &a, &n) == 1 && a == 1 && n == 3);
    CHECK(sscanf("-0b11", "%i", &a) == 1 && a == -3);
    CHECK(sscanf("0b", "%b", &u) == 0 && sscanf("0bx", "%i", &a) == 0);
    CHECK(sscanf("101", "%b%n", &u, &n) == 1 && u == 5 && n == 3);
    CHECK(sscanf("102", "%b%n", &u, &n) == 1 && u == 2 && n == 2);
    CHECK(sscanf("1011", "%2b%n", &u, &n) == 1 && u == 2 && n == 2);
    CHECK(sscanf("0b1", "%1b%n%c", &u, &n, &sc) == 2 && u == 0 && n == 1 && sc == 'b');
    CHECK(sscanf("0b1", "%2b", &u) == 0);
    CHECK(sscanf("0B10!", "%3i%n%c", &a, &n, &sc) == 2 && a == 1 && n == 3 && sc == '0');
    CHECK(sscanf("11 101", "%*b%b", &u) == 1 && u == 5);
    CHECK(sscanf("-1", "%b", &u) == 1 && u == 65535u);
    CHECK(sscanf("11111111", "%hhb", &uc) == 1 && uc == UCHAR_MAX);
    CHECK(sscanf("11111111111111111111111111111111", "%lb", &ul) == 1 && ul == ULONG_MAX);
    CHECK(sscanf("1111111111111111111111111111111111111111111111111111111111111111", "%llb",
                 &ull) == 1 && ull == ULLONG_MAX);
    CHECK(sscanf("0b1111111111111111111111111111111111111111111111111111111111111111", "%jb",
                 &uj) == 1 && uj == UINTMAX_MAX);
    CHECK(sscanf("11", "%zb", &z) == 1 && z == 3);
    /* C23 wN and wfN length modifiers. */
    CHECK(sscanf("-128 255", "%w8d%wf8u", &sc, &uc) == 2 && sc == SCHAR_MIN && uc == UCHAR_MAX);
    CHECK(sscanf("-32768 65535", "%w16d%w16u", &a, &u) == 2 && a == INT_MIN && u == UINT_MAX);
    CHECK(sscanf("-32768 0x7f", "%wf16d%w8x", &sh, &uc) == 2 && sh == SHRT_MIN && uc == 127);
    CHECK(sscanf("-2147483648 4294967295", "%w32d%wf32u", &l, &ul) == 2 &&
          l == LONG_MIN && ul == ULONG_MAX);
    CHECK(sscanf("-9223372036854775808 18446744073709551615", "%w64d%wf64u", &ll, &ull) == 2 &&
          ll == LLONG_MIN && ull == ULLONG_MAX);
    CHECK(sscanf("1011", "%w8b%n", &uc, &n) == 1 && uc == 11 && n == 4);
    CHECK(sscanf("12 1", "%w8d%n", &sc, &n) == 1 && sc == 12 && n == 2);
    CHECK(sscanf("abc", "abc%w8n", &sc) == 0 && sc == 3);
    CHECK(sscanf("abc", "abc%wf32n", &l) == 0 && l == 3);
    CHECK(sscanf("abcd", "abcd%w16n", &a) == 0 && a == 4);
    CHECK(sscanf("abc", "abc%w64n", &ll) == 0 && ll == 3);
    /* Unsupported widths and missing widths fail the conversion. */
    CHECK(sscanf("1", "%w7d", &a) == 0 && sscanf("1", "%w0d", &a) == 0);
    CHECK(sscanf("1", "%w", &a) == 0 && sscanf("1", "%wf", &a) == 0);
    CHECK(sscanf("1", "%w128d", &a) == 0 && sscanf("1", "%w08d", &a) == 0);
    return 0;
}

int avm_test_main(void) { return integers(); }
