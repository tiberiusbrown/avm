#ifndef _AVM_RUNTIME_WCHAR_H
#define _AVM_RUNTIME_WCHAR_H
#include <stddef.h>
#include <stdarg.h>
#include <stdio.h>
#include <avm/wide_types.h>

typedef unsigned char mbstate_t;
struct tm;
#ifndef WCHAR_MIN
#define WCHAR_MIN 0
#endif
#ifndef WCHAR_MAX
#define WCHAR_MAX 255
#endif

#ifdef __cplusplus
extern "C" {
#endif

int fwprintf(FILE *__restrict stream, const wchar_t *__restrict format, ...);
int fwscanf(FILE *__restrict stream, const wchar_t *__restrict format, ...);
int swprintf(wchar_t *__restrict s, size_t n, const wchar_t *__restrict format, ...);
int swscanf(const wchar_t *__restrict s, const wchar_t *__restrict format, ...);
int vfwprintf(FILE *__restrict stream, const wchar_t *__restrict format, va_list args);
int vfwscanf(FILE *__restrict stream, const wchar_t *__restrict format, va_list args);
int vswprintf(wchar_t *__restrict s, size_t n, const wchar_t *__restrict format, va_list args);
int vswscanf(const wchar_t *__restrict s, const wchar_t *__restrict format, va_list args);
int vwprintf(const wchar_t *__restrict format, va_list args);
int vwscanf(const wchar_t *__restrict format, va_list args);
int wprintf(const wchar_t *__restrict format, ...);
int wscanf(const wchar_t *__restrict format, ...);
wint_t fgetwc(FILE *stream);
wint_t getwc(FILE *stream);
wchar_t * fgetws(wchar_t *__restrict s, int n, FILE *__restrict stream);
wint_t fputwc(wchar_t wc, FILE *stream);
wint_t putwc(wchar_t wc, FILE *stream);
int fputws(const wchar_t *__restrict s, FILE *__restrict stream);
int fwide(FILE *stream, int mode);
wint_t getwchar(void);
wint_t putwchar(wchar_t wc);
wint_t ungetwc(wint_t wc, FILE *stream);
float wcstof(const wchar_t *__restrict s, wchar_t **__restrict endptr);
double wcstod(const wchar_t *__restrict s, wchar_t **__restrict endptr);
long double wcstold(const wchar_t *__restrict s, wchar_t **__restrict endptr);
long wcstol(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base);
long long wcstoll(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base);
unsigned long wcstoul(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base);
unsigned long long wcstoull(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base);
wchar_t * wcscpy(wchar_t *__restrict dst, const wchar_t *__restrict src);
wchar_t * wcscat(wchar_t *__restrict dst, const wchar_t *__restrict src);
wchar_t * wcsncpy(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n);
wchar_t * wcsncat(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n);
wchar_t * wmemcpy(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n);
wchar_t * wmemmove(wchar_t *dst, const wchar_t *src, size_t n);
int wcscmp(const wchar_t *a, const wchar_t *b);
int wcscoll(const wchar_t *a, const wchar_t *b);
int wcsncmp(const wchar_t *a, const wchar_t *b, size_t n);
int wmemcmp(const wchar_t *a, const wchar_t *b, size_t n);
size_t wcsxfrm(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n);
wchar_t * wcschr(const wchar_t *s, wchar_t wc);
wchar_t * wcsrchr(const wchar_t *s, wchar_t wc);
size_t wcscspn(const wchar_t *s, const wchar_t *set);
size_t wcsspn(const wchar_t *s, const wchar_t *set);
wchar_t * wcspbrk(const wchar_t *s, const wchar_t *set);
wchar_t * wcsstr(const wchar_t *s, const wchar_t *set);
wchar_t * wcstok(wchar_t *__restrict s, const wchar_t *__restrict delim, wchar_t **__restrict ptr);
wchar_t * wmemchr(const wchar_t *s, wchar_t wc, size_t n);
size_t wcslen(const wchar_t *s);
wchar_t * wmemset(wchar_t *s, wchar_t wc, size_t n);
size_t wcsftime(wchar_t *__restrict s, size_t maxsize, const wchar_t *__restrict format, const struct tm *__restrict timeptr);
wint_t btowc(int c);
int wctob(wint_t wc);
int mbsinit(const mbstate_t *ps);
size_t mbrlen(const char *__restrict s, size_t n, mbstate_t *__restrict ps);
size_t mbrtowc(wchar_t *__restrict pwc, const char *__restrict s, size_t n, mbstate_t *__restrict ps);
size_t wcrtomb(char *__restrict s, wchar_t wc, mbstate_t *__restrict ps);
size_t mbsrtowcs(wchar_t *__restrict dst, const char **__restrict src, size_t len, mbstate_t *__restrict ps);
size_t wcsrtombs(char *__restrict dst, const wchar_t **__restrict src, size_t len, mbstate_t *__restrict ps);

#ifdef __cplusplus
}
#endif
#endif
