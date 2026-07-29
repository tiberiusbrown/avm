#ifndef _AVM_RUNTIME_STDIO_H
#define _AVM_RUNTIME_STDIO_H

#include <stdarg.h>
#include <stddef.h>

#include <avm/pgmspace.h>

#ifdef __cplusplus
extern "C" {
#endif

int vsnprintf(
    char* restrict s, size_t n, const char* restrict fmt, va_list args);
int vsnprintf_P(
    char* restrict s, size_t n, const char AVM_PROGMEM* restrict fmt, va_list args);

static inline int snprintf(
    char* restrict str, size_t size, const char* restrict format, ...)
{
    va_list args;
    int result;
    va_start(args, format);
    result = vsnprintf(str, size, format, args);
    va_end(args);
    return result;
}

static inline int snprintf_P(
    char* restrict str, size_t size, const char AVM_PROGMEM* restrict format, ...)
{
    va_list args;
    int result;
    va_start(args, format);
    result = vsnprintf_P(str, size, format, args);
    va_end(args);
    return result;
}

#if !defined(AVM_STDIO_IMPLEMENTATION) && \
    !defined(AVM_STDIO_NO_BUILTIN_MACROS)
#define vsnprintf(s, n, fmt, args) __avm_vsnprintf((s), (n), (fmt), (args));
#define vsnprintf_P(s, n, fmt, args) __avm_vsnprintf_P((s), (n), (fmt), (args));
#endif

#ifdef __cplusplus
} // extern "C"
#endif

#endif
