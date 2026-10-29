#include <wchar.h>
static wint_t (*volatile call_fgetwc)(FILE *stream) = fgetwc;
#define fgetwc(...) call_fgetwc(__VA_ARGS__)
static wint_t (*volatile call_getwc)(FILE *stream) = getwc;
#define getwc(...) call_getwc(__VA_ARGS__)
static wchar_t * (*volatile call_fgetws)(wchar_t *__restrict s, int n, FILE *__restrict stream) = fgetws;
#define fgetws(...) call_fgetws(__VA_ARGS__)
static wint_t (*volatile call_fputwc)(wchar_t wc, FILE *stream) = fputwc;
#define fputwc(...) call_fputwc(__VA_ARGS__)
static wint_t (*volatile call_putwc)(wchar_t wc, FILE *stream) = putwc;
#define putwc(...) call_putwc(__VA_ARGS__)
static int (*volatile call_fputws)(const wchar_t *__restrict s, FILE *__restrict stream) = fputws;
#define fputws(...) call_fputws(__VA_ARGS__)
static int (*volatile call_fwide)(FILE *stream, int mode) = fwide;
#define fwide(...) call_fwide(__VA_ARGS__)
static wint_t (*volatile call_getwchar)(void) = getwchar;
#define getwchar(...) call_getwchar(__VA_ARGS__)
static wint_t (*volatile call_putwchar)(wchar_t wc) = putwchar;
#define putwchar(...) call_putwchar(__VA_ARGS__)
static wint_t (*volatile call_ungetwc)(wint_t wc, FILE *stream) = ungetwc;
#define ungetwc(...) call_ungetwc(__VA_ARGS__)
#include "wchar_stream.c"
