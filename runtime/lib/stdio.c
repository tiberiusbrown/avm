#define AVM_STDIO_IMPLEMENTATION
#include <stdio.h>

int vsnprintf(
    char* restrict s, size_t n, const char* restrict fmt, va_list args)
{
    return __avm_vsnprintf(s, n, fmt, args);
}

int vsnprintf_P(
    char* restrict s, size_t n, const char AVM_PROGMEM* restrict fmt, va_list args)
{
    return __avm_vsnprintf_P(s, n, fmt, args);
}

int snprintf(char* restrict s, size_t n, const char* restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vsnprintf(s, n, format, args);
    va_end(args);
    return result;
}

int snprintf_P(char* restrict s, size_t n, const char AVM_PROGMEM* restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vsnprintf_P(s, n, format, args);
    va_end(args);
    return result;
}

int sprintf(char* restrict s, const char* restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vsprintf(s, format, args);
    va_end(args);
    return result;
}

int vsprintf(char* restrict s, const char* restrict format, va_list args) {
    return __avm_vsnprintf(s, (size_t)-1, format, args);
}
