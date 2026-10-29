#include "stdio_internal.h"
#include <wchar.h>

int vfwprintf(FILE *restrict stream, const wchar_t *restrict format, va_list args) {
    if(!__avm_stdio_oriented_io(stream, WRITABLE, WIDE_ORIENTED)) return -1;
    int result = __avm_debug_printfv((const char *)format, args);
    if(result < 0) { stream->flags |= ERROR_SEEN; errno = EIO; }
    return result;
}
int vswprintf(wchar_t *restrict s, size_t n,
              const wchar_t *restrict format, va_list args) {
    int result = __avm_vsnprintf((char *)s, n, (const char *)format, args);
    if(result < 0 || (size_t)result >= n) return -1;
    return result;
}
int vwprintf(const wchar_t *restrict format, va_list args) {
    return vfwprintf(stdout, format, args);
}
int fwprintf(FILE *restrict stream, const wchar_t *restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vfwprintf(stream, format, args);
    va_end(args);
    return result;
}
int swprintf(wchar_t *restrict s, size_t n, const wchar_t *restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vswprintf(s, n, format, args);
    va_end(args);
    return result;
}
int wprintf(const wchar_t *restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vwprintf(format, args);
    va_end(args);
    return result;
}
