#include <wchar.h>
static wint_t (*volatile call_btowc)(int c) = btowc;
#define btowc(...) call_btowc(__VA_ARGS__)
static int (*volatile call_wctob)(wint_t wc) = wctob;
#define wctob(...) call_wctob(__VA_ARGS__)
static int (*volatile call_mbsinit)(const mbstate_t *ps) = mbsinit;
#define mbsinit(...) call_mbsinit(__VA_ARGS__)
static size_t (*volatile call_mbrlen)(const char *__restrict s, size_t n, mbstate_t *__restrict ps) = mbrlen;
#define mbrlen(...) call_mbrlen(__VA_ARGS__)
static size_t (*volatile call_mbrtowc)(wchar_t *__restrict pwc, const char *__restrict s, size_t n, mbstate_t *__restrict ps) = mbrtowc;
#define mbrtowc(...) call_mbrtowc(__VA_ARGS__)
static size_t (*volatile call_wcrtomb)(char *__restrict s, wchar_t wc, mbstate_t *__restrict ps) = wcrtomb;
#define wcrtomb(...) call_wcrtomb(__VA_ARGS__)
static size_t (*volatile call_mbsrtowcs)(wchar_t *__restrict dst, const char **__restrict src, size_t len, mbstate_t *__restrict ps) = mbsrtowcs;
#define mbsrtowcs(...) call_mbsrtowcs(__VA_ARGS__)
static size_t (*volatile call_wcsrtombs)(char *__restrict dst, const wchar_t **__restrict src, size_t len, mbstate_t *__restrict ps) = wcsrtombs;
#define wcsrtombs(...) call_wcsrtombs(__VA_ARGS__)
#include "wchar_multibyte.c"
