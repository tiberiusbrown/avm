#include <stdlib.h>
#include <wchar.h>

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

/* All byte values are valid in the stateless C locale. */
_Static_assert(sizeof(wint_t) == 2 && (wint_t)-1 < 0, "wint_t ABI");
_Static_assert(WCHAR_MIN == 0 && WCHAR_MAX == 255, "wchar_t limits");
_Static_assert(sizeof(mbstate_t) == 1 && MB_CUR_MAX == 1, "conversion ABI");
wint_t btowc(int c) { return c >= 0 && c <= 255 ? (wint_t)c : WEOF; }
int wctob(wint_t wc) { return wc >= 0 && wc <= 255 ? (int)wc : EOF; }
int mbsinit(const mbstate_t *ps) { (void)ps; return 1; }
size_t mbrtowc(wchar_t *restrict pwc, const char *restrict s, size_t n,
               mbstate_t *restrict ps) {
    (void)ps;
    if(!s) return 0;
    if(!n) return (size_t)-2;
    return (size_t)mbtowc(pwc, s, n);
}
size_t mbrlen(const char *restrict s, size_t n, mbstate_t *restrict ps) {
    return mbrtowc(NULL, s, n, ps);
}
size_t wcrtomb(char *restrict s, wchar_t wc, mbstate_t *restrict ps) {
    (void)ps;
    if(s) (void)wctomb(s, wc);
    return 1;
}
size_t mbsrtowcs(wchar_t *restrict dst, const char **restrict src, size_t len,
                 mbstate_t *restrict ps) {
    (void)ps;
    const char *s = *src;
    size_t count = 0;
    if(!dst) {
        while(*s++) ++count;
        return count;
    }
    while(count < len) {
        wchar_t wc = (unsigned char)*s++;
        dst[count] = wc;
        if(!wc) { *src = NULL; return count; }
        ++count;
    }
    *src = s;
    return count;
}
size_t wcsrtombs(char *restrict dst, const wchar_t **restrict src, size_t len,
                 mbstate_t *restrict ps) {
    (void)ps;
    const wchar_t *s = *src;
    size_t count = 0;
    if(!dst) {
        while(*s++) ++count;
        return count;
    }
    while(count < len) {
        wchar_t wc = *s++;
        dst[count] = (char)wc;
        if(!wc) { *src = NULL; return count; }
        ++count;
    }
    *src = s;
    return count;
}
size_t mbstowcs(wchar_t *restrict dst, const char *restrict s, size_t n) {
    const char *src = s;
    return mbsrtowcs(dst, &src, n, NULL);
}
size_t wcstombs(char *restrict dst, const wchar_t *restrict s, size_t n) {
    const wchar_t *src = s;
    return wcsrtombs(dst, &src, n, NULL);
}
