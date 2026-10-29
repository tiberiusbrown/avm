#include <wchar.h>
static wchar_t * (*volatile call_wcscpy)(wchar_t *__restrict dst, const wchar_t *__restrict src) = wcscpy;
#define wcscpy(...) call_wcscpy(__VA_ARGS__)
static wchar_t * (*volatile call_wcscat)(wchar_t *__restrict dst, const wchar_t *__restrict src) = wcscat;
#define wcscat(...) call_wcscat(__VA_ARGS__)
static wchar_t * (*volatile call_wcsncpy)(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n) = wcsncpy;
#define wcsncpy(...) call_wcsncpy(__VA_ARGS__)
static wchar_t * (*volatile call_wcsncat)(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n) = wcsncat;
#define wcsncat(...) call_wcsncat(__VA_ARGS__)
static wchar_t * (*volatile call_wmemcpy)(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n) = wmemcpy;
#define wmemcpy(...) call_wmemcpy(__VA_ARGS__)
static wchar_t * (*volatile call_wmemmove)(wchar_t *dst, const wchar_t *src, size_t n) = wmemmove;
#define wmemmove(...) call_wmemmove(__VA_ARGS__)
static int (*volatile call_wcscmp)(const wchar_t *a, const wchar_t *b) = wcscmp;
#define wcscmp(...) call_wcscmp(__VA_ARGS__)
static int (*volatile call_wcscoll)(const wchar_t *a, const wchar_t *b) = wcscoll;
#define wcscoll(...) call_wcscoll(__VA_ARGS__)
static int (*volatile call_wcsncmp)(const wchar_t *a, const wchar_t *b, size_t n) = wcsncmp;
#define wcsncmp(...) call_wcsncmp(__VA_ARGS__)
static int (*volatile call_wmemcmp)(const wchar_t *a, const wchar_t *b, size_t n) = wmemcmp;
#define wmemcmp(...) call_wmemcmp(__VA_ARGS__)
static size_t (*volatile call_wcsxfrm)(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n) = wcsxfrm;
#define wcsxfrm(...) call_wcsxfrm(__VA_ARGS__)
static wchar_t * (*volatile call_wcschr)(const wchar_t *s, wchar_t wc) = wcschr;
#define wcschr(...) call_wcschr(__VA_ARGS__)
static wchar_t * (*volatile call_wcsrchr)(const wchar_t *s, wchar_t wc) = wcsrchr;
#define wcsrchr(...) call_wcsrchr(__VA_ARGS__)
static size_t (*volatile call_wcscspn)(const wchar_t *s, const wchar_t *set) = wcscspn;
#define wcscspn(...) call_wcscspn(__VA_ARGS__)
static size_t (*volatile call_wcsspn)(const wchar_t *s, const wchar_t *set) = wcsspn;
#define wcsspn(...) call_wcsspn(__VA_ARGS__)
static wchar_t * (*volatile call_wcspbrk)(const wchar_t *s, const wchar_t *set) = wcspbrk;
#define wcspbrk(...) call_wcspbrk(__VA_ARGS__)
static wchar_t * (*volatile call_wcsstr)(const wchar_t *s, const wchar_t *set) = wcsstr;
#define wcsstr(...) call_wcsstr(__VA_ARGS__)
static wchar_t * (*volatile call_wcstok)(wchar_t *__restrict s, const wchar_t *__restrict delim, wchar_t **__restrict ptr) = wcstok;
#define wcstok(...) call_wcstok(__VA_ARGS__)
static wchar_t * (*volatile call_wmemchr)(const wchar_t *s, wchar_t wc, size_t n) = wmemchr;
#define wmemchr(...) call_wmemchr(__VA_ARGS__)
static size_t (*volatile call_wcslen)(const wchar_t *s) = wcslen;
#define wcslen(...) call_wcslen(__VA_ARGS__)
static wchar_t * (*volatile call_wmemset)(wchar_t *s, wchar_t wc, size_t n) = wmemset;
#define wmemset(...) call_wmemset(__VA_ARGS__)
#include "wchar_string.c"
