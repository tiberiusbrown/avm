#include "stdio_internal.h"

int vfprintf(FILE* restrict stream, const char* restrict format, va_list args) {
    if(!__avm_stdio_io(stream, WRITABLE)) return -1;
    int result = __avm_debug_printfv(format, args);
    if(result < 0) { stream->flags |= ERROR_SEEN; errno = EIO; }
    return result;
}
int fprintf(FILE* restrict stream, const char* restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vfprintf(stream, format, args);
    va_end(args);
    return result;
}
