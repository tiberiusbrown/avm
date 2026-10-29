#include <wchar.h>
static int (*volatile call_fwprintf)(FILE *__restrict stream, const wchar_t *__restrict format, ...) = fwprintf;
#define fwprintf(...) call_fwprintf(__VA_ARGS__)
static int (*volatile call_swprintf)(wchar_t *__restrict s, size_t n, const wchar_t *__restrict format, ...) = swprintf;
#define swprintf(...) call_swprintf(__VA_ARGS__)
static int (*volatile call_vfwprintf)(FILE *__restrict stream, const wchar_t *__restrict format, va_list args) = vfwprintf;
#define vfwprintf(...) call_vfwprintf(__VA_ARGS__)
static int (*volatile call_vswprintf)(wchar_t *__restrict s, size_t n, const wchar_t *__restrict format, va_list args) = vswprintf;
#define vswprintf(...) call_vswprintf(__VA_ARGS__)
static int (*volatile call_vwprintf)(const wchar_t *__restrict format, va_list args) = vwprintf;
#define vwprintf(...) call_vwprintf(__VA_ARGS__)
static int (*volatile call_wprintf)(const wchar_t *__restrict format, ...) = wprintf;
#define wprintf(...) call_wprintf(__VA_ARGS__)
static int (*volatile call_fwide)(FILE *stream, int mode) = fwide;
#define fwide(...) call_fwide(__VA_ARGS__)
static int (*volatile call_wcscmp)(const wchar_t *a, const wchar_t *b) = wcscmp;
#define wcscmp(...) call_wcscmp(__VA_ARGS__)
static int (*volatile call_wmemcmp)(const wchar_t *a, const wchar_t *b, size_t n) = wmemcmp;
#define wmemcmp(...) call_wmemcmp(__VA_ARGS__)
#include "wchar_format.c"
