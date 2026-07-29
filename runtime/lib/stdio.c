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
