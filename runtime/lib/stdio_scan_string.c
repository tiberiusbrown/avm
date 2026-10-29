#include "stdio_scan_internal.h"
typedef struct { const char *p; } string_cursor;
static int string_read(void *context) {
    string_cursor *c = context;
    return *c->p ? (unsigned char)*c->p++ : EOF;
}
static int string_unread(void *context, int ch) {
    --((string_cursor *)context)->p;
    return ch;
}
int vsscanf(const char *restrict text, const char *restrict format, va_list args) {
    string_cursor cursor = {text};
    avm_scan_reader reader = {&cursor, string_read, string_unread};
    return __avm_vscan(reader, format, args);
}
int sscanf(const char *restrict text, const char *restrict format, ...) {
    va_list args;
    va_start(args, format);
    int result = vsscanf(text, format, args);
    va_end(args);
    return result;
}
