#include "stdio_scan_internal.h"
static int stream_read(void *stream) { return fgetc(stream); }
static int stream_unread(void *stream, int ch) { return ungetc(ch, stream); }
int vfscanf(FILE *restrict stream, const char *restrict format, va_list args) {
    avm_scan_reader reader = {stream, stream_read, stream_unread};
    return __avm_vscan(reader, format, args);
}
int fscanf(FILE *restrict stream, const char *restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vfscanf(stream, format, args);
    va_end(args);
    return result;
}
