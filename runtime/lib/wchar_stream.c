#include "stdio_internal.h"
#include <wchar.h>

int fwide(FILE *stream, int mode) {
    if(!__avm_stdio_validate(stream, 0)) return 0;
    unsigned char orientation = stream->flags & (BYTE_ORIENTED | WIDE_ORIENTED);
    if(!orientation && mode) {
        orientation = mode > 0 ? WIDE_ORIENTED : BYTE_ORIENTED;
        stream->flags |= orientation;
    }
    return orientation == WIDE_ORIENTED ? 1 : orientation == BYTE_ORIENTED ? -1 : 0;
}
wint_t fgetwc(FILE *stream) {
    if(!__avm_stdio_oriented_io(stream, READABLE, WIDE_ORIENTED)) return WEOF;
    return __avm_stdio_raw_getc(stream);
}
wint_t fputwc(wchar_t wc, FILE *stream) {
    if(!__avm_stdio_oriented_io(stream, WRITABLE, WIDE_ORIENTED)) return WEOF;
    return __avm_stdio_raw_putc(wc, stream);
}
wchar_t *fgetws(wchar_t *restrict s, int n, FILE *restrict stream) {
    if(!__avm_stdio_oriented_io(stream, READABLE, WIDE_ORIENTED) || n <= 0)
        return NULL;
    int i = 0;
    while(i < n - 1) {
        int c = __avm_stdio_raw_getc(stream);
        if(c == EOF) {
            if(!i) return NULL;
            break;
        }
        s[i++] = (wchar_t)c;
        if(c == '\n') break;
    }
    s[i] = 0;
    return s;
}
int fputws(const wchar_t *restrict s, FILE *restrict stream) {
    if(!__avm_stdio_oriented_io(stream, WRITABLE, WIDE_ORIENTED)) return WEOF;
    while(*s) __avm_stdio_raw_putc(*s++, stream);
    return 0;
}
wint_t getwc(FILE *stream) { return fgetwc(stream); }
wint_t getwchar(void) { return fgetwc(stdin); }
wint_t putwc(wchar_t wc, FILE *stream) { return fputwc(wc, stream); }
wint_t putwchar(wchar_t wc) { return fputwc(wc, stdout); }
wint_t ungetwc(wint_t wc, FILE *stream) {
    if(wc == WEOF) return WEOF;
    if(!__avm_stdio_oriented_io(stream, READABLE, WIDE_ORIENTED)) return WEOF;
    return __avm_stdio_raw_ungetc(wc, stream);
}
