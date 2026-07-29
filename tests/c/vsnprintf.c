#include <avm/pgmspace.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

#include "test_hex_output.h"

#if defined(__clang__) || defined(__GNUC__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

static const char AVM_PROGMEM program_long[] =
    "abcdefghijklmnopqrst";

/* The first '%' is byte 15, so its conversion character begins a new
   16-byte program-format cache refill. */
static const char AVM_PROGMEM program_format[] =
    "123456789ABCDEF%d|%s|%S|%ld";

NOINLINE static int call_vsnprintf(char *dst, size_t size,
                                   const char *format, ...)
{
    va_list args;
    int result;

    va_start(args, format);
    result = vsnprintf(dst, size, format, args);
    va_end(args);
    return result;
}

NOINLINE static int call_vsnprintf_P(
    char *dst, size_t size,
    const char AVM_PROGMEM *format, ...)
{
    va_list args;
    int result;

    va_start(args, format);
    result = vsnprintf_P(dst, size, format, args);
    va_end(args);
    return result;
}

static int text_equal(const char *lhs, const char *rhs)
{
    while(*lhs == *rhs) {
        if(*lhs == '\0')
            return 1;
        ++lhs;
        ++rhs;
    }
    return 0;
}

static void report_text(const char *label, int result, const char *text)
{
    test_puts(label);
    test_putc('=');
    test_hex16((uint16_t)result);
    test_puts(":[");
    test_puts(text);
    test_puts("]\n");
}

static char lower_hex_digit(uint8_t value)
{
    value &= 0x0f;
    return (char)(value < 10 ? (uint8_t)('0' + value)
                             : (uint8_t)('a' + value - 10));
}

static int pointer_text_matches(const char *text, const void *pointer)
{
    const uintptr_t value = (uintptr_t)pointer;

    return text[0] == '0' && text[1] == 'x' &&
           text[2] == lower_hex_digit((uint8_t)(value >> 12)) &&
           text[3] == lower_hex_digit((uint8_t)(value >> 8)) &&
           text[4] == lower_hex_digit((uint8_t)(value >> 4)) &&
           text[5] == lower_hex_digit((uint8_t)value) &&
           text[6] == '\0';
}

int avm_test_main(void)
{
    static const char ram_text[] = "ram";
    char buffer[80];
    char trunc_storage[10];
    char one_byte[2];
    uint16_t failures = 0;
    int result;
    int pointer_valid;
    size_t i;

    result = call_vsnprintf(
        buffer, sizeof(buffer), "A:%c:%s:%S:%%",
        'Z', ram_text, F("flash"));
    report_text("R0", result, buffer);
    if(result != 15 || !text_equal(buffer, "A:Z:ram:flash:%"))
        failures |= (uint16_t)(1u << 0);

    result = call_vsnprintf_P(
        buffer, sizeof(buffer), program_format,
        -42, ram_text, program_long, 123456789L);
    report_text("P0", result, buffer);
    if(result != 53 ||
       !text_equal(buffer,
                   "123456789ABCDEF-42|ram|abcdefghijklmnopqrst|123456789"))
        failures |= (uint16_t)(1u << 1);

    result = call_vsnprintf(
        buffer, sizeof(buffer),
        "%+06d|%-5u|%#06x|%#o|%.0u|%hhd|%hd|%ld|%zu|%td",
        12, 7u, 0x2au, 9u, 0u, 0xfe, -1234,
        -123456789L, (size_t)65530u, (ptrdiff_t)-321);
    report_text("I0", result, buffer);
    if(result != 55 ||
       !text_equal(buffer,
                   "+00012|7    |0x002a|011||-2|-1234|-123456789|65530|-321"))
        failures |= (uint16_t)(1u << 2);

    result = call_vsnprintf(
        buffer, sizeof(buffer), "%*.*s|%0*d|%.*S",
        -8, 3, "abcdef", 6, -42, 4, program_long);
    report_text("D0", result, buffer);
    if(result != 20 || !text_equal(buffer, "abc     |-00042|abcd"))
        failures |= (uint16_t)(1u << 3);

    for(i = 0; i < sizeof(trunc_storage); ++i)
        trunc_storage[i] = (char)0xa5;
    trunc_storage[0] = (char)0x5a;
    trunc_storage[9] = (char)0x69;
    result = call_vsnprintf(
        &trunc_storage[1], 8, "abcdef:%u", 12345u);
    report_text("T0", result, &trunc_storage[1]);
    if(result != 12 || !text_equal(&trunc_storage[1], "abcdef:") ||
       (uint8_t)trunc_storage[0] != 0x5a ||
       (uint8_t)trunc_storage[8] != 0x00 ||
       (uint8_t)trunc_storage[9] != 0x69)
        failures |= (uint16_t)(1u << 4);

    one_byte[0] = 'x';
    one_byte[1] = 'y';
    result = call_vsnprintf(one_byte, 1, "hello");
    report_text("N1", result, one_byte);
    if(result != 5 || one_byte[0] != '\0' || one_byte[1] != 'y')
        failures |= (uint16_t)(1u << 5);

    result = call_vsnprintf((char *)0, 0, "zero:%u", 1234u);
    test_line16("N0", (uint16_t)result);
    if(result != 9)
        failures |= (uint16_t)(1u << 6);

    result = call_vsnprintf(
        buffer, sizeof(buffer), "before:%q:after", 123u);
    report_text("E0", result, buffer);
    if(result != -1 || !text_equal(buffer, "before:"))
        failures |= (uint16_t)(1u << 7);

    one_byte[0] = 'x';
    one_byte[1] = 'y';
    result = call_vsnprintf(one_byte, 1, "%32768d", 1);
    report_text("O0", result, one_byte);
    if(result != -1 || one_byte[0] != '\0' || one_byte[1] != 'y')
        failures |= (uint16_t)(1u << 8);

    result = call_vsnprintf(buffer, sizeof(buffer), "%p", ram_text);
    pointer_valid = pointer_text_matches(buffer, ram_text);
    test_line16("PR", (uint16_t)result);
    test_line16("PV", (uint16_t)pointer_valid);
    if(result != 6)
        failures |= (uint16_t)(1u << 9);
    if(!pointer_valid)
        failures |= (uint16_t)(1u << 10);

    test_line16("FM", failures);
    return failures != 0;
}
