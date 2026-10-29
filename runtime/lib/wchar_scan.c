#include "stdio_internal.h"
#include "stdio_scan_internal.h"
#include <wchar.h>

typedef struct { const wchar_t *p; } wide_cursor;
static int wide_read(void *context) {
    wide_cursor *cursor = context;
    return *cursor->p ? *cursor->p++ : EOF;
}
static int wide_unread(void *context, int ch) {
    --((wide_cursor *)context)->p;
    return ch;
}
static int stream_read(void *context) { return fgetwc(context); }
static int stream_unread(void *context, int ch) { return ungetwc(ch, context); }
int vswscanf(const wchar_t *restrict s, const wchar_t *restrict format, va_list args) {
    wide_cursor cursor = {s};
    avm_scan_reader reader = {&cursor, wide_read, wide_unread};
    return __avm_vscan(reader, (const char *)format, args);
}
int vfwscanf(FILE *restrict stream, const wchar_t *restrict format, va_list args) {
    if(!__avm_stdio_oriented_io(stream, READABLE, WIDE_ORIENTED)) return EOF;
    avm_scan_reader reader = {stream, stream_read, stream_unread};
    return __avm_vscan(reader, (const char *)format, args);
}
int vwscanf(const wchar_t *restrict format, va_list args) {
    return vfwscanf(stdin, format, args);
}
int fwscanf(FILE *restrict stream, const wchar_t *restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vfwscanf(stream, format, args);
    va_end(args);
    return result;
}
int swscanf(const wchar_t *restrict s, const wchar_t *restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vswscanf(s, format, args);
    va_end(args);
    return result;
}
int wscanf(const wchar_t *restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vwscanf(format, args);
    va_end(args);
    return result;
}
