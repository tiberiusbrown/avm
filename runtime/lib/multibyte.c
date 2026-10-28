#include <stdlib.h>

_Static_assert(sizeof(wchar_t) == 1 && (wchar_t)-1 == 255,
               "AVM C-locale wide characters are unsigned bytes");

int mbtowc(wchar_t* pwc, const char* s, size_t n) {
    if(!s) return 0; /* No shift state. */
    if(!n) return -1;
    unsigned char c = (unsigned char)*s;
    if(pwc) *pwc = (wchar_t)c;
    return c != 0;
}

int mblen(const char* s, size_t n) {
    return mbtowc(NULL, s, n);
}

int wctomb(char* s, wchar_t wc) {
    if(!s) return 0;
    *s = (char)(unsigned char)wc;
    return 1;
}

size_t mbstowcs(wchar_t* pwcs, const char* s, size_t n) {
    size_t count = 0;
    while(count < n) {
        unsigned char c = (unsigned char)s[count];
        pwcs[count] = (wchar_t)c;
        if(!c) break;
        ++count;
    }
    return count;
}

size_t wcstombs(char* s, const wchar_t* pwcs, size_t n) {
    size_t count = 0;
    while(count < n) {
        wchar_t wc = pwcs[count];
        s[count] = (char)(unsigned char)wc;
        if(!wc) break;
        ++count;
    }
    return count;
}
