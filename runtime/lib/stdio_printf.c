#define AVM_STDIO_IMPLEMENTATION
#include <stdio.h>

int vprintf(const char* restrict format, va_list args) {
    return vfprintf(stdout, format, args);
}
int printf(const char* restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vprintf(format, args);
    va_end(args);
    return result;
}
