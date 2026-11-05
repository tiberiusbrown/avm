#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include <stdint.h>
#include <limits.h>
#include <avm.h>
#include "test_hex_output.h"
#define CHECK(x) do { if(!(x)) { test_line16("LINE", __LINE__); return 1; } } while(0)
static int variants(char* dst, const char* format, ...) {
    va_list args;
    va_start(args, format);
    int result = (vsprintf)(dst, format, args);
    va_end(args);
    return result;
}
static int output(int which, const char* format, ...) {
    va_list args;
    va_start(args, format);
    int result = which ? (vfprintf)(stderr, format, args) : (vprintf)(format, args);
    va_end(args);
    return result;
}
int avm_test_main(void) {
    char buf[48]; int n = -1;
    int (*volatile fn)(char*, size_t, const char*, ...) = &snprintf;
    CHECK(fn(buf, sizeof buf, "%04x:%d%n", 42, -7, &n) == 7 && n == 7);
    CHECK(strcmp(buf, "002a:-7") == 0);
    CHECK((snprintf)(buf, sizeof buf, "%lc:%ls", (int)'A', L"BC") == 4);
    CHECK(strcmp(buf, "A:BC") == 0);
    CHECK((snprintf_P)(buf, sizeof buf, F("%lc:%ls"), (int)'A', L"BC") == 4);
    CHECK((snprintf)(buf, sizeof buf, "%5.1ls:%lc", L"BC", 255) == 7);
    CHECK(memcmp(buf, "    B:\xff", 8) == 0);
    CHECK((snprintf)(buf, sizeof buf, "%ls", L"") == 0 && buf[0] == 0);
    CHECK((sprintf)(buf, "%lld", -1234567890123LL) == 14);
    CHECK(strcmp(buf, "-1234567890123") == 0);
    CHECK((snprintf)(buf, sizeof buf, "%b|%#B|%08.3b|%-6bx", 10u, 10u, 5u, 5u) == 28);
    CHECK(strcmp(buf, "1010|0B1010|     101|101   x") == 0);
    CHECK((snprintf_P)(buf, sizeof buf, F("%#b|%llb"), 5u, 1ULL << 36) == 43);
    CHECK(strcmp(buf, "0b101|1000000000000000000000000000000000000") == 0);
    CHECK(variants(buf, "%hhb|%hb|%lb|%zb|%tb|%jb", 0x5a85u, 0x1234u, 5ul, (size_t)6,
                   (ptrdiff_t)7, (uintmax_t)9) == 39);
    CHECK(strcmp(buf, "10000101|1001000110100|101|110|111|1001") == 0);
    /* C23 wN and wfN: each width reads its promoted argument and converts it. */
    CHECK((snprintf)(buf, sizeof buf, "%w8d|%w16d|%w32d|%w64d", 0x1ff, INT_MIN, (long)LONG_MIN,
                     (long long)LLONG_MIN) == 42);
    CHECK(strcmp(buf, "-1|-32768|-2147483648|-9223372036854775808") == 0);
    CHECK((snprintf)(buf, sizeof buf, "%w8u|%wf16u|%w32x|%#wf8X|%#w64b", 0x1ff, 65535u,
                     0xbeefL, 0xabu, 5ULL) == 25);
    CHECK(strcmp(buf, "255|65535|beef|0XAB|0b101") == 0);
    CHECK((snprintf)(buf, sizeof buf, "%w32o|%w16o|%#w8o", 0777L, 8, 8) == 10);
    CHECK(strcmp(buf, "777|10|010") == 0);
    CHECK((snprintf_P)(buf, sizeof buf, F("%w32d|%w8x"), -5L, 0x1ff) == 5);
    CHECK(strcmp(buf, "-5|ff") == 0);
    signed char c8 = -1; int i16 = -1; long i32 = -1; long long i64 = -1;
    CHECK((snprintf)(buf, sizeof buf, "abc%w8n", &c8) == 3 && c8 == 3);
    CHECK((snprintf)(buf, sizeof buf, "abcd%w16n", &i16) == 4 && i16 == 4);
    CHECK((snprintf)(buf, sizeof buf, "ab%wf32n", &i32) == 2 && i32 == 2);
    CHECK((snprintf)(buf, sizeof buf, "ab%w64n", &i64) == 2 && i64 == 2);
    /* Unsupported widths, missing digits, and non-integer pairs are invalid. */
    static const char *const malformed[] = {"%w7d", "%w0d", "%w08d", "%w128d", "%w", "%wf",
        "%wf7x", "%w32s", "%w32f", "%w8c", "%w16f", "%w64s", "%w8%", "%w32ld", "%w32hd", "%wq"};
    for(unsigned i = 0; i < sizeof malformed / sizeof *malformed; ++i)
        CHECK((snprintf)(buf, sizeof buf, malformed[i], 1) < 0);
    CHECK(variants(buf, "%6.2f", 1.25) == 6 && strcmp(buf, "  1.25") == 0);
    CHECK(printf("%d:%x%n|", 12, 42, &n) == 6 && n == 5);
    CHECK(fprintf(stderr, "%lc:%ls|", (int)'A', L"BC") == 5);
    CHECK(output(0, "%s|", "ram") == 4);
    CHECK(output(1, "%6.2f|", 1.25) == 7);
    CHECK(avm_debug_printf("%d:%S|", 7, F("flash")) == 8);
    CHECK(avm_debug_printf_P(F("%d:%S|"), 7, F("flash")) == 8);
    n = -1;
    CHECK(avm_debug_printf("%n", &n) == 0 && n == 0);
    n = -1;
    CHECK(avm_debug_printf_P(F("%n"), &n) == 0 && n == 0);
    CHECK(printf("") == 0);
    CHECK(fprintf(stdout, "%") < 0 && ferror(stdout));
    clearerr(stdout);
    return 0;
}
