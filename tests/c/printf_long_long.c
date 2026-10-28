#include <avm.h>
#include <limits.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "test_hex_output.h"

#define NOINLINE __attribute__((noinline))

struct integer_vector {
    unsigned long long value;
    char format[16];
    char expected[48];
    int width, precision;
    unsigned char kind; /* signed=1, dynamic width/precision=2 */
};
#include "printf_long_long_vectors.h"

/* Keep the reference corpus in program memory and O0 frames small. */
static struct integer_vector current;
static char buffer[96];
static unsigned failures;
static int (*volatile ram_function)(char *, size_t, const char *, va_list) =
    &vsnprintf;
static int (*volatile program_function)(
    char *, size_t, const char AVM_PROGMEM *, va_list) = &vsnprintf_P;

NOINLINE static int ram_v(unsigned indirect, char *dst, size_t size,
                          const char *format, ...)
{
    va_list ap;
    int result;
    va_start(ap, format);
    result = indirect ? ram_function(dst, size, format, ap)
                      : vsnprintf(dst, size, format, ap);
    va_end(ap);
    return result;
}

NOINLINE static int program_v(unsigned indirect, char *dst, size_t size,
                              const char AVM_PROGMEM *format, ...)
{
    va_list ap;
    int result;
    va_start(ap, format);
    result = indirect ? program_function(dst, size, format, ap)
                      : vsnprintf_P(dst, size, format, ap);
    va_end(ap);
    return result;
}

static void check(int result, const char *expected)
{
    if(result != (int)strlen(expected) || strcmp(buffer, expected)) {
        if(failures < 4) {
            test_puts("expected:"); test_puts(expected);
            test_puts(" actual:"); test_puts(buffer); test_putc('\n');
        }
        ++failures;
    }
}

NOINLINE static void vectors(void)
{
    unsigned i;
    for(i = 0; i < sizeof(integer_vectors) / sizeof(integer_vectors[0]); ++i) {
        const char AVM_PROGMEM *pf = integer_vectors[i].format;
        unsigned indirect;
        memcpy_P(&current, &integer_vectors[i], sizeof(current));
        /* Exercise true-variadic builtins and both real va_list ABI functions
           for every vector, in C and through the C++ typed overloads. */
        if(current.kind & 1) {
            long long value = (long long)current.value;
            if(current.kind & 2)
                check(snprintf(buffer, sizeof(buffer), current.format,
                               current.width, current.precision, value), current.expected);
            else
                check(snprintf(buffer, sizeof(buffer), current.format, value), current.expected);
            for(indirect = 0; indirect < 2; ++indirect) {
                if(current.kind & 2) {
                    check(ram_v(indirect, buffer, sizeof(buffer), current.format,
                                current.width, current.precision, value), current.expected);
                    check(program_v(indirect, buffer, sizeof(buffer), pf,
                                    current.width, current.precision, value), current.expected);
                } else {
                    check(ram_v(indirect, buffer, sizeof(buffer), current.format, value), current.expected);
                    check(program_v(indirect, buffer, sizeof(buffer), pf, value), current.expected);
                }
            }
        } else {
            unsigned long long value = current.value;
            if(current.kind & 2)
                check(snprintf(buffer, sizeof(buffer), current.format,
                               current.width, current.precision, value), current.expected);
            else
                check(snprintf(buffer, sizeof(buffer), current.format, value), current.expected);
            for(indirect = 0; indirect < 2; ++indirect) {
                if(current.kind & 2) {
                    check(ram_v(indirect, buffer, sizeof(buffer), current.format,
                                current.width, current.precision, value), current.expected);
                    check(program_v(indirect, buffer, sizeof(buffer), pf,
                                    current.width, current.precision, value), current.expected);
                } else {
                    check(ram_v(indirect, buffer, sizeof(buffer), current.format, value), current.expected);
                    check(program_v(indirect, buffer, sizeof(buffer), pf, value), current.expected);
                }
            }
        }
    }
}

NOINLINE static void mixed(void)
{
    const char AVM_PROGMEM *p = F("program string beyond twelve bytes");
    char pointer[9];
    int n;
    snprintf(pointer, sizeof(pointer), "%P", p);
    n = snprintf(buffer, sizeof(buffer), "%u|%P|%llu|%ld|%d",
                 1u, p, ULLONG_MAX, -123456L, 42);
    if(n != 42 || strncmp(buffer, "1|", 2) || strncmp(buffer + 2, pointer, 8) ||
       strcmp(buffer + 10, "|18446744073709551615|-123456|42"))
        ++failures;
    n = program_v(1, buffer, sizeof(buffer), F("%u|%P|%llu|%ld|%d"),
                  1u, p, ULLONG_MAX, -123456L, 42);
    if(n != 42 || strncmp(buffer + 2, pointer, 8) ||
       strcmp(buffer + 10, "|18446744073709551615|-123456|42"))
        ++failures;
    check(snprintf(buffer, sizeof(buffer), "%lld|%ld|%d", LLONG_MIN, -123456L, 42),
          "-9223372036854775808|-123456|42");
    check(ram_v(0, buffer, sizeof(buffer), "%u|%llu|%u", 1u, ULLONG_MAX, 2u),
          "1|18446744073709551615|2");
    check(snprintf(buffer, sizeof(buffer), "%llu|%u", ULLONG_MAX, 1234u),
          "18446744073709551615|1234");
}

NOINLINE static void intmax_format(void)
{
    check(snprintf(buffer, sizeof(buffer), "%jd", (-LLONG_MAX - 1LL)),
          "-9223372036854775808");
    check(snprintf(buffer, sizeof(buffer), "%ji", LLONG_MAX),
          "9223372036854775807");
    check(snprintf(buffer, sizeof(buffer), "%ju", ULLONG_MAX),
          "18446744073709551615");
    check(snprintf(buffer, sizeof(buffer), "%jo", ULLONG_MAX),
          "1777777777777777777777");
    check(snprintf(buffer, sizeof(buffer), "%jx", ULLONG_MAX),
          "ffffffffffffffff");
    check(snprintf(buffer, sizeof(buffer), "%jX", ULLONG_MAX),
          "FFFFFFFFFFFFFFFF");
    check(snprintf(buffer, sizeof(buffer), "%d|%jd|%u", 7, (-LLONG_MAX - 1LL), 9u),
          "7|-9223372036854775808|9");
}

NOINLINE static void mixed_scratch(void)
{
    const char AVM_PROGMEM *p = F("program string beyond twelve bytes");
    /* Maximal octal overwrites all shared string state. Float, %S and the
       still-live format cache/cursor must be reinitialized or preserved. */
    check(snprintf(buffer, sizeof(buffer), "%.2f|%llo|%S|%.2f",
                   1.5f, ULLONG_MAX, p, -2.25f),
          "1.50|1777777777777777777777|program string beyond twelve bytes|-2.25");
    check(program_v(0, buffer, sizeof(buffer),
                    F("123456789ABCDEF%S|%llo|%S|%.1f|%llu"),
                    F("before"), ULLONG_MAX, F("after"), 3.5f, ULLONG_MAX),
          "123456789ABCDEFbefore|1777777777777777777777|after|3.5|18446744073709551615");
}

NOINLINE static void sign_flags(void)
{
    /* AVM retains its existing ignored unsigned sign flags; these extension
       cases are intentionally separate from the standard host-reference set. */
    check(snprintf(buffer, sizeof(buffer), "%+llu|% llu|%+ lld",
                   42ULL, 42ULL, 42LL), "42|42|+42");
}

NOINLINE static void narrow_widths(void)
{
    /* Promoted high bytes must be consumed but excluded from hh sign/zero
       tests. Narrow values now share the same SRAM engine as long long. */
    check(snprintf(buffer, sizeof(buffer), "%hhd|%hhu|%hhi|%d",
                   0x5a80u, 0x5affu, 0x5a00u, -32768), "-128|255|0|-32768");
    check(snprintf(buffer, sizeof(buffer), "%.0hhu|%#.0hho|%ld|%lu",
                   0x5a00u, 0x5a00u, (-2147483647L - 1), 4294967295UL),
          "|0|-2147483648|4294967295");
}

NOINLINE static void program_builtin(void)
{
    /* A cache refill separates the two 'l' bytes. Maximal octal then reuses
       all 22 digit bytes before %S and %u. */
    check(snprintf_P(buffer, sizeof(buffer), F("123456789ABCDE%llo|%S|%u"),
                     ULLONG_MAX, F("ok"), 1234u),
          "123456789ABCDE1777777777777777777777|ok|1234");
}

NOINLINE static void truncation(void)
{
    unsigned size, i;
    const char *expected = "   -9223372036854775808|1234";
    const unsigned length = 28;
    for(size = 0; size <= length + 1; ++size) {
        int result;
        memset(buffer, 0xa5, sizeof(buffer));
        result = snprintf(size ? buffer + 1 : (char *)0, size,
                          "%23lld|%u", LLONG_MIN, 1234u);
        if(result != length || (unsigned char)buffer[0] != 0xa5 ||
           (unsigned char)buffer[size + 1] != 0xa5)
            ++failures;
        for(i = 0; i < (size ? size - 1 : 0); ++i)
            if(buffer[i + 1] != expected[i]) ++failures;
        if(size && buffer[size] != 0) ++failures;
    }
    /* Logical count overflow remains sticky after destination exhaustion. */
    if(snprintf(buffer, 1, "%32768llu|%u", ULLONG_MAX, 42u) != -1 || buffer[0])
        ++failures;
}

NOINLINE static void invalid(void)
{
    static const char AVM_PROGMEM bad[][8] = {
        "%ll", "%lls", "%llc", "%llp", "%llf", "%llld", "%llS", "%llP", "%ll%",
        "%Ld", "%Lu", "%Lx", "%Lo", "%jf", "%jF", "%js", "%llF", "%lls", "%hf", "%zf"
    };
    unsigned i;
    for(i = 0; i < sizeof(bad) / sizeof(bad[0]); ++i) {
        char format[8];
        memcpy_P(format, bad[i], sizeof(format));
        if(snprintf(buffer, sizeof(buffer), format, ULLONG_MAX) != -1 || buffer[0])
            ++failures;
        if(program_v(1, buffer, sizeof(buffer), bad[i], ULLONG_MAX) != -1 || buffer[0])
            ++failures;
    }
}

/* One pixel glyph, '1', advance two. Missing glyphs have zero advance. This
   independently checks pixels as well as cursor results with T set. */
static const uint8_t AVM_PROGMEM pixel_font[] = {
    2, '1', 1, 1, 0, 1, 0, 7, 0, 2, 1
};

NOINLINE static void percent_n_sinks(void)
{
    volatile uint8_t *fb = (volatile uint8_t *)(uintptr_t)0x500;
    avm_text_cursor_t cursor;
    uint16_t reference_hash = 0;
    uint16_t formatted_hash = 0;
    int emitted = -1;
    unsigned i;
    int debug_result = avm_debug_printf_P(F("abc%nZ"), &emitted);
    if(debug_result != 4 || emitted != 3) ++failures;

    avm_set_text_font(AVM_FONT_5X7);
    for(i = 0; i < 1024; ++i) fb[i] = 0;
    (void)avm_draw_text(0, 48, "AB");
    for(i = 0; i < 1024; ++i)
        reference_hash = (uint16_t)((reference_hash * 33u) ^ fb[i]);
    for(i = 0; i < 1024; ++i) fb[i] = 0;
    emitted = -1;
    cursor = avm_draw_textf(0, 48, "A%nB", &emitted);
    if(emitted != 1 || cursor.x != 12 || cursor.baseline_y != 48) ++failures;
    for(i = 0; i < 1024; ++i)
        formatted_hash = (uint16_t)((formatted_hash * 33u) ^ fb[i]);
    if(formatted_hash != reference_hash) ++failures;
    emitted = -1;
    cursor = avm_draw_textf_P(0, 48, F("AB%n"), &emitted);
    if(emitted != 2 || cursor.x != 12 || cursor.baseline_y != 48) ++failures;

    emitted = -1;
    (void)avm_draw_text(0, 56, "A\nB");
    cursor = avm_draw_textf(0, 56, "A\nB%n", &emitted);
    if(emitted != 3 || cursor.x != 6 || cursor.baseline_y != 64) ++failures;
    emitted = -1;
    (void)avm_draw_text(0, 56, "     ");
    cursor = avm_draw_textf(0, 56, "%5s%n", "", &emitted);
    if(emitted != 5 || cursor.x != 30) ++failures;
    emitted = -1;
    cursor = avm_draw_textf(10, 56, "%c%n", 0, &emitted);
    if(emitted != 1 || cursor.x != 10 || cursor.baseline_y != 56) ++failures;

    avm_set_text_font((const avm_font_t AVM_PROGMEM *)0);
    emitted = 1234;
    cursor = avm_draw_textf(7, 56, "%n", &emitted);
    if(emitted != 1234 || cursor.x != 7 || cursor.baseline_y != 56) ++failures;
}

NOINLINE static void sinks(void)
{
    avm_text_cursor_t cursor;
    avm_text_cursor_t reference;
    volatile uint8_t *fb = (volatile uint8_t *)(uintptr_t)0x500;
    unsigned i;
    int count = avm_debug_printf_P(F("j:%jd|%ju|%#jX|%jo\n"),
                                  LLONG_MIN, ULLONG_MAX, ULLONG_MAX, ULLONG_MAX);
    if(count != 86) ++failures;
    avm_set_text_font((const avm_font_t AVM_PROGMEM *)pixel_font);
    avm_set_text_mode(AVM_TEXT_WHITE_TRANSPARENT);
    for(i = 0; i < 1024; ++i) fb[i] = 0;
    cursor = avm_draw_textf(3, 0, "%ju", 11ULL);
    if(cursor.x != 7 || cursor.baseline_y != 0 || fb[3] != 1 || fb[5] != 1)
        ++failures;
    cursor = avm_draw_textf_P(3, 8, F("%jo"), 9ULL);
    if(cursor.x != 7 || cursor.baseline_y != 8 || fb[128 + 3] != 1 || fb[128 + 5] != 1)
        ++failures;
    for(i = 0; i < 1024; ++i)
        if(fb[i] != (uint8_t)((i == 3 || i == 5 || i == 131 || i == 133) ? 1 : 0))
            ++failures;
    /* Decimal division, signs, prefix, precision and maximal octal on both
       text sources also verify that helper calls preserve the sink T bit. */
    avm_set_text_font(AVM_FONT_5X7);
    reference = avm_draw_text(-100, 32, "-000009223372036854775808");
    cursor = avm_draw_textf(-100, 32, "%+025lld", LLONG_MIN);
    if(cursor.x != reference.x || cursor.baseline_y != 32) ++failures;
    reference = avm_draw_text_P(-100, 40, F("0001777777777777777777777"));
    cursor = avm_draw_textf_P(-100, 40, F("%#025llo"), ULLONG_MAX);
    if(cursor.x != reference.x || cursor.baseline_y != 40) ++failures;
    avm_set_text_font((const avm_font_t AVM_PROGMEM *)0);
}

int avm_test_main(void)
{
    vectors();
    mixed();
    intmax_format();
    mixed_scratch();
    sign_flags();
    narrow_widths();
    program_builtin();
    truncation();
    invalid();
    sinks();
    percent_n_sinks();
    test_line16("failures", failures);
    return failures != 0;
}
