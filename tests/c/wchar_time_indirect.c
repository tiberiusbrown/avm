#include <wchar.h>
static int (*volatile call_wcscmp)(const wchar_t *a, const wchar_t *b) = wcscmp;
#define wcscmp(...) call_wcscmp(__VA_ARGS__)
static size_t (*volatile call_wcsftime)(wchar_t *__restrict s, size_t maxsize, const wchar_t *__restrict format, const struct tm *__restrict timeptr) = wcsftime;
#define wcsftime(...) call_wcsftime(__VA_ARGS__)
#include "wchar_time.c"
