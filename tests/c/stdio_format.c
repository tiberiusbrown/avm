#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include <stdint.h>
#include <avm.h>
#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)
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
