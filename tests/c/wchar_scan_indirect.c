#include <wchar.h>
static int (*volatile call_fwscanf)(FILE *__restrict stream, const wchar_t *__restrict format, ...) = fwscanf;
#define fwscanf(...) call_fwscanf(__VA_ARGS__)
static int (*volatile call_swscanf)(const wchar_t *__restrict s, const wchar_t *__restrict format, ...) = swscanf;
#define swscanf(...) call_swscanf(__VA_ARGS__)
static int (*volatile call_vfwscanf)(FILE *__restrict stream, const wchar_t *__restrict format, va_list args) = vfwscanf;
#define vfwscanf(...) call_vfwscanf(__VA_ARGS__)
static int (*volatile call_vswscanf)(const wchar_t *__restrict s, const wchar_t *__restrict format, va_list args) = vswscanf;
#define vswscanf(...) call_vswscanf(__VA_ARGS__)
static int (*volatile call_vwscanf)(const wchar_t *__restrict format, va_list args) = vwscanf;
#define vwscanf(...) call_vwscanf(__VA_ARGS__)
static int (*volatile call_wscanf)(const wchar_t *__restrict format, ...) = wscanf;
#define wscanf(...) call_wscanf(__VA_ARGS__)
static wint_t (*volatile call_fgetwc)(FILE *stream) = fgetwc;
#define fgetwc(...) call_fgetwc(__VA_ARGS__)
static int (*volatile call_fwide)(FILE *stream, int mode) = fwide;
#define fwide(...) call_fwide(__VA_ARGS__)
static wint_t (*volatile call_ungetwc)(wint_t wc, FILE *stream) = ungetwc;
#define ungetwc(...) call_ungetwc(__VA_ARGS__)
static int (*volatile call_wcscmp)(const wchar_t *a, const wchar_t *b) = wcscmp;
#define wcscmp(...) call_wcscmp(__VA_ARGS__)
#include "wchar_scan.c"
