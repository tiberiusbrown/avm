#include <math.h>
#include <stdio.h>
#include <string.h>

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
