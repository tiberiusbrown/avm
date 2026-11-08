#include <stdbit.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include <limits.h>

#define TYPE_IS(expr, type) _Generic((expr), type: 1, default: 0)
static char text[] = "ababa";
static const char ctext[] = "ababa";
static const struct { int x; } object = {0};
_Static_assert(TYPE_IS(memchr(&object, 0, 1), const void*), "const object");
_Static_assert(TYPE_IS(memchr(text, 0, 1), void*), "mutable bytes");
_Static_assert(TYPE_IS(strchr(ctext, 0), const char*), "const strchr");
_Static_assert(TYPE_IS(strchr(text, 0), char*), "mutable strchr");
_Static_assert(TYPE_IS(strrchr(ctext, 0), const char*), "const strrchr");
_Static_assert(TYPE_IS(strrchr(text, 0), char*), "mutable strrchr");
_Static_assert(TYPE_IS(strpbrk(ctext, ""), const char*), "const strpbrk");
_Static_assert(TYPE_IS(strpbrk(text, ""), char*), "mutable strpbrk");
_Static_assert(TYPE_IS(strstr(ctext, ""), const char*), "const strstr");
_Static_assert(TYPE_IS(strstr(text, ""), char*), "mutable strstr");
_Static_assert(TYPE_IS(stdc_bit_floor((unsigned char)3), unsigned char), "floor type");
_Static_assert(TYPE_IS(stdc_bit_ceil(3UL), unsigned long), "ceil type");
_Static_assert(TYPE_IS(stdc_has_single_bit(3U), _Bool), "predicate type");

#define CHECK_TYPE(T, S) do { \
    volatile T input = 0; \
    unsigned int width = sizeof(T) * CHAR_BIT; \
    T (*volatile floor_fn)(T) = stdc_bit_floor_##S; \
    for (unsigned int bit = 0; bit < width; ++bit) { \
        input = (T)((T)1 << bit); \
        if (stdc_leading_zeros_##S(input) != width - bit - 1 || \
            stdc_trailing_zeros_##S(input) != bit || \
            stdc_first_leading_one_##S(input) != width - bit || \
            stdc_first_trailing_one_##S(input) != bit + 1 || \
            stdc_count_ones_##S(input) != 1 || \
            stdc_count_zeros_##S(input) != width - 1 || \
            !stdc_has_single_bit_##S(input) || \
            stdc_bit_width_##S(input) != bit + 1 || \
            floor_fn(input) != input || stdc_bit_ceil_##S(input) != input) return 1; \
        input = (T)~input; \
        if (stdc_leading_ones_##S(input) != width - bit - 1 || \
            stdc_trailing_ones_##S(input) != bit || \
            stdc_first_leading_zero_##S(input) != width - bit || \
            stdc_first_trailing_zero_##S(input) != bit + 1) return 2; \
    } \
    input = 0; \
    if (stdc_leading_zeros_##S(input) != width || stdc_trailing_zeros_##S(input) != width || \
        stdc_first_leading_one_##S(input) || stdc_first_trailing_one_##S(input) || \
        stdc_bit_width_##S(input) || stdc_has_single_bit_##S(input) || \
        stdc_bit_floor_##S(input) || stdc_bit_ceil_##S(input) != 1) return 3; \
    input = (T)~(T)0; \
    if (stdc_leading_ones_##S(input) != width || stdc_trailing_ones_##S(input) != width || \
        stdc_first_leading_zero_##S(input) || stdc_first_trailing_zero_##S(input) || \
        stdc_count_ones_##S(input) != width || stdc_count_zeros_##S(input) || \
        stdc_bit_floor_##S(input) != (T)((T)1 << (width - 1))) return 4; \
} while (0)

#define CHECK_WRAPPER(T, S) \
    static __attribute__((noinline)) int check_##S(void) { \
        CHECK_TYPE(T, S); \
        return 0; \
    }
CHECK_WRAPPER(unsigned char, uc)
CHECK_WRAPPER(unsigned short, us)
CHECK_WRAPPER(unsigned int, ui)
CHECK_WRAPPER(unsigned long, ul)
CHECK_WRAPPER(unsigned long long, ull)

int avm_test_main(void) {
    if (memchr(&object, 0, sizeof object) != &object) return 21;
    /* Exhaust every byte value against a simple per-bit reference. */
    for (unsigned int v = 0; v < 256; ++v) {
        unsigned char b = (unsigned char)v;
        unsigned int ones = 0, lz = 0, tz = 0;
        unsigned int lo = 0, to = 0;
        for (unsigned int bit = 0; bit < 8; ++bit) ones += (v >> bit) & 1;
        while (lz < 8 && !(v & (128U >> lz))) ++lz;
        while (tz < 8 && !(v & (1U << tz))) ++tz;
        while (lo < 8 && (v & (128U >> lo))) ++lo;
        while (to < 8 && (v & (1U << to))) ++to;
        if (stdc_count_ones(b) != ones || stdc_count_zeros(b) != 8 - ones ||
            stdc_leading_zeros(b) != lz || stdc_trailing_zeros(b) != tz ||
            stdc_leading_ones(b) != lo || stdc_trailing_ones(b) != to ||
            stdc_first_leading_zero(b) != (lo == 8 ? 0 : lo + 1) ||
            stdc_first_leading_one(b) != (v ? lz + 1 : 0) ||
            stdc_first_trailing_zero(b) != (to == 8 ? 0 : to + 1) ||
            stdc_first_trailing_one(b) != (v ? tz + 1 : 0) ||
            stdc_has_single_bit(b) != (ones == 1) ||
            stdc_bit_width(b) != 8 - lz ||
            stdc_bit_floor(b) != (v ? 128U >> lz : 0)) return 19;
        if (v <= 128) {
            unsigned int ceiling = 1;
            while (ceiling < v) ceiling <<= 1;
            if (stdc_bit_ceil(b) != ceiling) return 20;
        }
    }
    if (check_uc() || check_us() || check_ui() || check_ul() || check_ull()) return 22;
    unsigned int x = 3;
    x = 3;
    if (stdc_leading_zeros(x++) != stdc_leading_zeros_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_leading_ones(x++) != stdc_leading_ones_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_trailing_zeros(x++) != stdc_trailing_zeros_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_trailing_ones(x++) != stdc_trailing_ones_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_first_leading_zero(x++) != stdc_first_leading_zero_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_first_leading_one(x++) != stdc_first_leading_one_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_first_trailing_zero(x++) != stdc_first_trailing_zero_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_first_trailing_one(x++) != stdc_first_trailing_one_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_count_zeros(x++) != stdc_count_zeros_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_count_ones(x++) != stdc_count_ones_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_has_single_bit(x++) != stdc_has_single_bit_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_bit_width(x++) != stdc_bit_width_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_bit_floor(x++) != stdc_bit_floor_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_bit_ceil(x++) != stdc_bit_ceil_ui(3) || x != 4) return 17;
    x = 3;
    if (stdc_bit_ceil(x++) != 4 || x != 4) return 5;
    char *p = text;
    if (strchr(p++, 'b') != text + 1 || p != text + 1) return 6;
    p = text;
    if (memchr(p++, 'b', 5) != text + 1 || p != text + 1) return 7;
    if ((strchr)(ctext, 'b') != ctext + 1 ||
        (strrchr)(ctext, 'a') != ctext + 4 ||
        (strpbrk)(ctext, "b") != ctext + 1 ||
        (strstr)(ctext, "ba") != ctext + 1 ||
        (memchr)(ctext, 'b', 5) != ctext + 1) return 8;
    char buf[6] = {'?', '?', '?', '?', '?', '!'};
    void* (*volatile copy)(void*, const void*, int, size_t) = memccpy;
    void* (*volatile clear)(void*, int, size_t) = memset_explicit;
    if (copy(buf, "abcd", 'b' + 256, 4) != buf + 2 ||
        buf[0] != 'a' || buf[1] != 'b' || buf[2] != '?') return 9;
    if (memccpy(buf, "abcd", 'z', 4) || memcmp(buf, "abcd", 4) ||
        memccpy(buf, "", 0, 0) || memccpy(buf, "", 0, 1) != buf + 1) return 10;
    if (clear(buf, 0x100, 5) != buf || buf[5] != '!') return 11;
    for (unsigned int i = 0; i < 5; ++i) if (buf[i]) return 12;
    if (memset_explicit(buf, 3, 0) != buf || buf[0]) return 13;
    size_t (*volatile alignment)(const void*) = memalignment;
    if (alignment(NULL) != 0) return 14;
    for (uintptr_t i = 1; i < 1024; ++i)
        if (alignment((const void*)i) != (size_t)(i & (uintptr_t)(0 - i))) return 15;
    if (__STDC_ENDIAN_NATIVE__ != __STDC_ENDIAN_LITTLE__) return 16;
    return 0;
}
