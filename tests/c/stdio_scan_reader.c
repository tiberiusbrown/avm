#include "../../runtime/lib/stdio_scan_internal.h"
#include <string.h>
#define CHECK(x) do { if(!(x)) return __LINE__; } while(0)
typedef struct { const char *text; unsigned position; unsigned unread; } cursor;
static int read_byte(void *p) {
    cursor *c = (cursor *)p;
    return c->text[c->position] ? (unsigned char)c->text[c->position++] : EOF;
}
static int unread_byte(void *p, int ch) {
    cursor *c = (cursor *)p;
    ++c->unread; --c->position;
    return ch;
}
static int scan(cursor *c, const char *format, ...) {
    avm_scan_reader r = {c, read_byte, unread_byte};
    va_list a; va_start(a, format);
    int result = __avm_vscan(r, format, a);
    va_end(a); return result;
}
static int prefix(const char *text, const char *fmt, unsigned consumed) {
    cursor c = {text, 0, 0};
    float f = 42;
    CHECK(scan(&c, fmt, &f) == 0 && f == 42);
    CHECK(c.position == consumed && c.unread <= 1);
    return 0;
}
typedef struct { unsigned long remaining; unsigned char token; } space_source;
static int space_read(void *p) {
    space_source *s = (space_source *)p;
    if(s->remaining) { --s->remaining; return ' '; }
    if(!s->token) { s->token = 1; return '7'; }
    return EOF;
}
static int space_unread(void *p, int ch) {
    space_source *s = (space_source *)p;
    if(ch == '7') s->token = 0;
    else ++s->remaining;
    return ch;
}
static int scan_spaces(unsigned long spaces, const char *fmt, ...) {
    space_source source = {spaces, 0};
    avm_scan_reader reader = {&source, space_read, space_unread};
    va_list args; va_start(args, fmt);
    int result = __avm_vscan(reader, fmt, args);
    va_end(args); return result;
}
int avm_test_main(void) {
    CHECK(!prefix("1e+x", "%f", 3));
    CHECK(!prefix("0x1p-x", "%f", 5));
    CHECK(!prefix("infinX", "%f", 5));
    CHECK(!prefix("nan(payload!", "%f", 11));
    CHECK(!prefix("1e+2", "%3f", 3));
    long count = -1; unsigned u = 77;
    /* Exercise the 32-bit count beyond the 16-bit object/address limit. */
    CHECK(scan_spaces(70000UL, "%u%ln", &u, &count) == 1 && u == 7 && count == 70001L);
    cursor c = {"0xg", 0, 0}; u = 77;
    CHECK(scan(&c, "%x", &u) == 0 && u == 77 && c.position == 2 && c.unread == 1);
    c.text = "123x"; c.position = c.unread = 0;
    CHECK(scan(&c, "%u", &u) == 1 && u == 123 && c.position == 3 && c.unread == 1);
    c.text = "z"; c.position = c.unread = 0;
    CHECK(scan(&c, "x") == 0 && c.position == 0 && c.unread == 1);
    c.text = " \tq"; c.position = c.unread = 0;
    CHECK(scan(&c, " ") == 0 && c.position == 2 && c.unread == 1);
    return 0;
}
