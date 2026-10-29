#include <stdio.h>
int vscanf(const char *restrict format, va_list args) {
    return vfscanf(stdin, format, args);
}
int scanf(const char *restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vscanf(format, args);
    va_end(args);
    return result;
}
