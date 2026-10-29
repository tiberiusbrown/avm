#include <wchar.h>
#include <string.h>

wchar_t * wcscpy(wchar_t *restrict dst, const wchar_t *restrict src) {
    return (wchar_t *)strcpy((char *)dst, (const char *)src);
}
wchar_t * wcscat(wchar_t *restrict dst, const wchar_t *restrict src) {
    return (wchar_t *)strcat((char *)dst, (const char *)src);
}
wchar_t * wcsncpy(wchar_t *restrict dst, const wchar_t *restrict src, size_t n) {
    return (wchar_t *)strncpy((char *)dst, (const char *)src, n);
}
wchar_t * wcsncat(wchar_t *restrict dst, const wchar_t *restrict src, size_t n) {
    return (wchar_t *)strncat((char *)dst, (const char *)src, n);
}
wchar_t * wmemcpy(wchar_t *restrict dst, const wchar_t *restrict src, size_t n) {
    return (wchar_t *)memcpy(dst, src, n);
}
wchar_t * wmemmove(wchar_t *dst, const wchar_t *src, size_t n) {
    return (wchar_t *)memmove(dst, src, n);
}
int wcscmp(const wchar_t *a, const wchar_t *b) {
    return strcmp((const char *)a, (const char *)b);
}
int wcscoll(const wchar_t *a, const wchar_t *b) {
    return wcscmp(a, b);
}
int wcsncmp(const wchar_t *a, const wchar_t *b, size_t n) {
    return strncmp((const char *)a, (const char *)b, n);
}
int wmemcmp(const wchar_t *a, const wchar_t *b, size_t n) {
    return memcmp(a, b, n);
}
size_t wcsxfrm(wchar_t *restrict dst, const wchar_t *restrict src, size_t n) {
    return strxfrm((char *)dst, (const char *)src, n);
}
wchar_t * wcschr(const wchar_t *s, wchar_t wc) {
    return (wchar_t *)strchr((const char *)s, wc);
}
wchar_t * wcsrchr(const wchar_t *s, wchar_t wc) {
    return (wchar_t *)strrchr((const char *)s, wc);
}
size_t wcscspn(const wchar_t *s, const wchar_t *set) {
    return strcspn((const char *)s, (const char *)set);
}
size_t wcsspn(const wchar_t *s, const wchar_t *set) {
    return strspn((const char *)s, (const char *)set);
}
wchar_t * wcspbrk(const wchar_t *s, const wchar_t *set) {
    return (wchar_t *)strpbrk((const char *)s, (const char *)set);
}
wchar_t * wcsstr(const wchar_t *s, const wchar_t *set) {
    return (wchar_t *)strstr((const char *)s, (const char *)set);
}
wchar_t * wmemchr(const wchar_t *s, wchar_t wc, size_t n) {
    return (wchar_t *)memchr(s, wc, n);
}
size_t wcslen(const wchar_t *s) {
    return strlen((const char *)s);
}
wchar_t * wmemset(wchar_t *s, wchar_t wc, size_t n) {
    return (wchar_t *)memset(s, wc, n);
}
wchar_t *wcstok(wchar_t *restrict s, const wchar_t *restrict delim,
                 wchar_t **restrict ptr) {
    if(!s) s = *ptr;
    if(!s) return NULL;
    s += wcsspn(s, delim);
    if(!*s) { *ptr = NULL; return NULL; }
    wchar_t *end = s + wcscspn(s, delim);
    if(*end) { *end++ = 0; *ptr = end; }
    else *ptr = NULL;
    return s;
}
