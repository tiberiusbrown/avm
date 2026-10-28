#include <stdlib.h>
#include <assert.h>
#include <inttypes.h>
#include <math.h>
#include <avm.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <locale.h>

float direct_math(float x, float y) {
    return sinf(x) + powf(x, y);
}

float parenthesized_math(float x) {
    return (sinf)(x);
}

float (*math_address(void))(float) {
    return &sinf;
}

void *direct_copy(void *dst, const void *src, size_t size) {
    return memcpy(dst, src, size);
}

void *(*copy_address(void))(void *, const void *, size_t) {
    return &memcpy;
}

int stdio_expression(char *dst, size_t size, const char *format, va_list args) {
    return (vsnprintf(dst, size, format, args) + 1);
}

int stdio_program_expression(char *dst, size_t size,
                             const char AVM_PROGMEM *format, va_list args) {
    return (vsnprintf_P(dst, size, format, args) + 1);
}

int stdio_parenthesized(char *dst, size_t size,
                        const char *format, va_list args) {
    return (vsnprintf)(dst, size, format, args);
}

int (*stdio_address(void))(char *, size_t, const char *, va_list) {
    return &vsnprintf;
}

int (*snprintf_address(void))(char *, size_t, const char *, ...) {
    return &snprintf;
}

int (*snprintf_program_address(void))(
    char *, size_t, const char AVM_PROGMEM *, ...) {
    return &snprintf_P;
}

void c_explicit_program_calls(
    char *dst, const char *ram, const char AVM_PROGMEM *flash,
    size_t n, va_list args) {
    memcpy(dst, ram, n);
    memcpy_P(dst, flash, n);
    (void)strlen(ram);
    (void)strlen_P(flash);
    (void)avm_draw_text(0, 10, ram);
    (void)avm_draw_text_P(0, 10, flash);
    (void)avm_text_width(ram);
    (void)avm_text_width_P(flash);
    (void)avm_draw_textfv(0, 10, ram, args);
    (void)avm_draw_textfv_P(0, 10, flash, args);
    (void)avm_draw_textf(0, 10, ram, 7);
    (void)avm_draw_textf_P(0, 10, flash, 7);
}

int termination_header_smoke(void (*fn)(void)) { return atexit(fn); }
intmax_t (*intmax_parse_address(void))(const char*, char**, int) { return &strtoimax; }
char* (*strerror_address(void))(int) { return &strerror; }

clock_t time_direct(void) { return clock(); }
clock_t (*time_address(void))(void) { return &clock; }
clock_t time_constant(void) { return CLOCKS_PER_SEC; }

char *locale_direct(void) { return setlocale(LC_ALL, "C"); }
char *(*locale_setlocale_address(void))(int, const char *) { return &setlocale; }
struct lconv *localeconv_direct(void) { return localeconv(); }
struct lconv *(*localeconv_address(void))(void) { return &localeconv; }
