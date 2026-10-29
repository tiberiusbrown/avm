#include <wchar.h>
#include <wctype.h>
#include <stdlib.h>
#include <assert.h>
#include <inttypes.h>
#include <math.h>
#include <tgmath.h>
#include <new>
#include <avm.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <locale.h>

struct cpp_smoke_object {
    int value;
};

extern "C" cpp_smoke_object* cpp_place_object(void* storage) {
    return ::new (storage) cpp_smoke_object{7};
}

extern "C" float cpp_direct_math(float x) {
    return cosf(x);
}

extern "C" float (*cpp_math_address(void))(float) {
    return &cosf;
}

extern "C" void *cpp_parenthesized_copy(
    void *dst, const void *src, size_t size) {
    return (memmove)(dst, src, size);
}

extern "C" int cpp_stdio_expression(
    char *dst, size_t size, const char *format, va_list args) {
    return (vsnprintf(dst, size, format, args) + 1);
}

extern "C" int cpp_stdio_program_expression(
    char *dst, size_t size, const char AVM_PROGMEM *format, va_list args) {
    return (vsnprintf_P(dst, size, format, args) + 1);
}

extern "C" int cpp_stdio_parenthesized(
    char *dst, size_t size, const char *format, va_list args) {
    return (vsnprintf)(dst, size, format, args);
}

extern "C" int (*cpp_stdio_address(void))(
    char *, size_t, const char *, va_list) {
    return &vsnprintf;
}

extern "C" int (*cpp_snprintf_address(void))(
    char *, size_t, const char *, ...) {
    return &snprintf;
}

extern "C" int (*cpp_snprintf_program_address(void))(
    char *, size_t, const char AVM_PROGMEM *, ...) {
    return &snprintf_P;
}

// Every paired interface accepts either source address space under its
// ordinary C++ name. Explicit _P spellings remain available.
extern "C" void cpp_address_space_calls(
    char* dst, const char* ram, const char AVM_PROGMEM* flash,
    size_t n, va_list args) {
    memcpy(dst, ram, n);
    memcpy(dst, flash, n);
    memcmp(dst, ram, n);
    memcmp(dst, flash, n);
    strcmp(dst, ram);
    strcmp(dst, flash);
    strlen(ram);
    strlen(flash);
    strncpy(dst, ram, n);
    strncpy(dst, flash, n);
    strncat(dst, ram, n);
    strncat(dst, flash, n);
    strcpy(dst, ram);
    strcpy(dst, flash);
    strcat(dst, ram);
    strcat(dst, flash);
    vsnprintf(dst, n, ram, args);
    vsnprintf(dst, n, flash, args);
    snprintf(dst, n, ram, 7);
    snprintf(dst, n, flash, 7);
    avm_draw_text(0, 10, ram);
    avm_draw_text(0, 10, flash);
    avm_text_width(ram);
    avm_text_width(flash);
    avm_draw_textfv(0, 10, ram, args);
    avm_draw_textfv(0, 10, flash, args);
    avm_draw_textf(0, 10, ram, 7);
    avm_draw_textf(0, 10, flash, 7);
    strlen(F("abc"));
    strlen(PSTR("abc"));
    strcpy(dst, PSTR("abc"));
    avm_draw_text(0, 10, F("hello"));
    avm_draw_text(0, 10, PSTR("hello"));
    avm_text_width(F("hello"));
    avm_text_width(PSTR("hello"));
    avm_draw_textf(0, 10, F("%u"), 7u);
    avm_draw_textf(0, 10, PSTR("%u"), 7u);
    snprintf(dst, n, F("%u"), 7u);
    snprintf(dst, n, PSTR("%u"), 7u);
    memcpy_P(dst, flash, n);
    avm_draw_text_P(0, 10, flash);
    avm_text_width_P(flash);
    avm_draw_textfv_P(0, 10, flash, args);
    avm_draw_textf_P(0, 10, flash, 7);
}

extern "C" void cpp_address_space_pointers(
    char* dst, const void* ram, const void AVM_PROGMEM* flash, size_t n) {
    void* (*ram_copy)(void*, const void*, size_t) = &memcpy;
    void* (*flash_copy)(void*, const void AVM_PROGMEM*, size_t) = &memcpy;
    void* (*explicit_copy)(void*, const void AVM_PROGMEM*, size_t) = &memcpy_P;
    char* (*flash_strcpy)(char*, const char AVM_PROGMEM*) = &strcpy;
    (memcpy)(dst, ram, n);
    (memcpy)(dst, flash, n);
    ram_copy(dst, ram, n);
    flash_copy(dst, flash, n);
    explicit_copy(dst, flash, n);
    flash_strcpy(dst, (const char AVM_PROGMEM*)flash);
    const char* typed_ram = nullptr;
    const char AVM_PROGMEM* typed_flash = nullptr;
    (void)strlen(typed_ram);
    (void)strlen(typed_flash);
}

int termination_header_smoke(void (*fn)(void)) { return atexit(fn); }
extern "C" intmax_t (*cpp_intmax_parse_address(void))(const char*, char**, int) {
    return &strtoimax;
}
extern "C" char* (*cpp_strerror_address(void))(int) { return &strerror; }

extern "C" clock_t cpp_time_direct(void) { return clock(); }
extern "C" clock_t (*cpp_time_address(void))(void) { return &clock; }
extern "C" clock_t cpp_time_constant(void) { return CLOCKS_PER_SEC; }
extern "C" char *cpp_locale_direct(void) { return setlocale(LC_ALL, "C"); }
extern "C" char *(*cpp_locale_setlocale_address(void))(int, const char *) {
    return &setlocale;
}
extern "C" struct lconv *cpp_localeconv_direct(void) { return localeconv(); }
extern "C" struct lconv *(*cpp_localeconv_address(void))(void) {
    return &localeconv;
}

/* Calendar ABI and addressable ordinary C entry points. */
static_assert(sizeof(time_t) == 8 && (time_t)-1 < 0, "signed 64-bit time_t");
static_assert(sizeof(clock_t) == 4 && (clock_t)-1 > 0, "unsigned 32-bit clock_t");
static_assert(CLOCKS_PER_SEC == 1000, "clock scale");
static_assert(sizeof(struct tm) == 18, "nine 16-bit fields");
#define TM_FIELD(field, index) static_assert(sizeof(((struct tm *)0)->field) == sizeof(int) && offsetof(struct tm, field) == (index)*2, "tm field ABI")
TM_FIELD(tm_sec,0); TM_FIELD(tm_min,1); TM_FIELD(tm_hour,2);
TM_FIELD(tm_mday,3); TM_FIELD(tm_mon,4); TM_FIELD(tm_year,5);
TM_FIELD(tm_wday,6); TM_FIELD(tm_yday,7); TM_FIELD(tm_isdst,8);
#undef TM_FIELD
extern "C" void cpp_time_interface_smoke(void)
{
    clock_t (*volatile c)(void) = &clock;
    time_t (*volatile a)(time_t *) = &time;
    double (*volatile b)(time_t,time_t) = &difftime;
    time_t (*volatile d)(struct tm *) = &mktime;
    struct tm *(*volatile e)(const time_t *) = &gmtime;
    struct tm *(*volatile f)(const time_t *) = &localtime;
    char *(*volatile g)(const struct tm *) = &asctime;
    char *(*volatile h)(const time_t *) = &ctime;
    size_t (*volatile i)(char *,size_t,const char *,const struct tm *) = &strftime;
    void *null_value = NULL;
    (void)c;(void)a;(void)b;(void)d;(void)e;(void)f;(void)g;(void)h;(void)i;(void)null_value;
}
#include <setjmp.h>
static_assert(sizeof(jmp_buf) == 13, "jmp_buf size");
static_assert(alignof(jmp_buf) == 1, "jmp_buf alignment");
static void jump_header_helper(jmp_buf env) { longjmp(env, 1); }
void jump_header_smoke(void) {
    jmp_buf env;
    if (setjmp(env) == 0) jump_header_helper(env);
}
#include <signal.h>
static_assert(sizeof(sig_atomic_t) == 1 && (sig_atomic_t)-1 < 0, "signal atomic ABI");
static_assert(sizeof(__avm_sighandler_t) == 3, "packed code pointer ABI");
static_assert(SIGABRT == 1 && SIGFPE == 2 && SIGILL == 3 && SIGINT == 4 &&
        SIGSEGV == 5 && SIGTERM == 6, "standard signal numbers");
/* Static initializers exercise address constants, including the sentinels. */
static __avm_sighandler_t signal_constants[] = { SIG_DFL, SIG_IGN, SIG_ERR };
void signal_interface_smoke(void) {
    __avm_sighandler_t (*volatile install)(int, __avm_sighandler_t) = &signal;
    int (*volatile deliver)(int) = &raise;
    (void)install(SIGINT, signal_constants[0]);
    (void)deliver(SIGINT);
    (void)signal(SIGTERM, SIG_IGN);
    (void)raise(SIGTERM);
}

#include <wctype.h>
#ifdef __cplusplus
extern "C"
#endif
wint_t wide_header_smoke(wint_t c) {
    return iswctype(c, wctype("alpha")) ? towctrans(c, wctrans("tolower")) : WEOF;
}

/* Compile the complete stream API and its standard external symbols. */
int avm_stdio_header_smoke(FILE* stream, fpos_t* pos) {
    int (*read_byte)(FILE*) = &fgetc;
    int (*write_byte)(int, FILE*) = &fputc;
    int (*format)(FILE*, const char*, ...) = &fprintf;
    int (*bounded)(char*, size_t, const char*, ...) = &snprintf;
    char buffer[8];
    (void)bounded;
    (void)read_byte;
    (void)write_byte;
    (void)format;
    (void)buffer;
    return fgetpos(stream, pos) + _IONBF + SEEK_END + EOF;
}

static_assert(sizeof(wchar_t) == 1, "wide ABI");
static_assert((wchar_t)-1 == 255, "wide ABI");
static_assert(sizeof(wint_t) == 2, "wide ABI");
static_assert((wint_t)-1 < 0, "wide ABI");
static_assert(WCHAR_MIN == 0, "wide ABI");
static_assert(WCHAR_MAX == 255, "wide ABI");
static_assert(sizeof(mbstate_t) == 1, "wide ABI");
static_assert(MB_CUR_MAX == 1, "wide ABI");
int (*wide_type_fwprintf)(FILE *__restrict stream, const wchar_t *__restrict format, ...) = &fwprintf;
int (*wide_type_fwscanf)(FILE *__restrict stream, const wchar_t *__restrict format, ...) = &fwscanf;
int (*wide_type_swprintf)(wchar_t *__restrict s, size_t n, const wchar_t *__restrict format, ...) = &swprintf;
int (*wide_type_swscanf)(const wchar_t *__restrict s, const wchar_t *__restrict format, ...) = &swscanf;
int (*wide_type_vfwprintf)(FILE *__restrict stream, const wchar_t *__restrict format, va_list args) = &vfwprintf;
int (*wide_type_vfwscanf)(FILE *__restrict stream, const wchar_t *__restrict format, va_list args) = &vfwscanf;
int (*wide_type_vswprintf)(wchar_t *__restrict s, size_t n, const wchar_t *__restrict format, va_list args) = &vswprintf;
int (*wide_type_vswscanf)(const wchar_t *__restrict s, const wchar_t *__restrict format, va_list args) = &vswscanf;
int (*wide_type_vwprintf)(const wchar_t *__restrict format, va_list args) = &vwprintf;
int (*wide_type_vwscanf)(const wchar_t *__restrict format, va_list args) = &vwscanf;
int (*wide_type_wprintf)(const wchar_t *__restrict format, ...) = &wprintf;
int (*wide_type_wscanf)(const wchar_t *__restrict format, ...) = &wscanf;
wint_t (*wide_type_fgetwc)(FILE *stream) = &fgetwc;
wint_t (*wide_type_getwc)(FILE *stream) = &getwc;
wchar_t * (*wide_type_fgetws)(wchar_t *__restrict s, int n, FILE *__restrict stream) = &fgetws;
wint_t (*wide_type_fputwc)(wchar_t wc, FILE *stream) = &fputwc;
wint_t (*wide_type_putwc)(wchar_t wc, FILE *stream) = &putwc;
int (*wide_type_fputws)(const wchar_t *__restrict s, FILE *__restrict stream) = &fputws;
int (*wide_type_fwide)(FILE *stream, int mode) = &fwide;
wint_t (*wide_type_getwchar)(void) = &getwchar;
wint_t (*wide_type_putwchar)(wchar_t wc) = &putwchar;
wint_t (*wide_type_ungetwc)(wint_t wc, FILE *stream) = &ungetwc;
float (*wide_type_wcstof)(const wchar_t *__restrict s, wchar_t **__restrict endptr) = &wcstof;
double (*wide_type_wcstod)(const wchar_t *__restrict s, wchar_t **__restrict endptr) = &wcstod;
long double (*wide_type_wcstold)(const wchar_t *__restrict s, wchar_t **__restrict endptr) = &wcstold;
long (*wide_type_wcstol)(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base) = &wcstol;
long long (*wide_type_wcstoll)(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base) = &wcstoll;
unsigned long (*wide_type_wcstoul)(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base) = &wcstoul;
unsigned long long (*wide_type_wcstoull)(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base) = &wcstoull;
wchar_t * (*wide_type_wcscpy)(wchar_t *__restrict dst, const wchar_t *__restrict src) = &wcscpy;
wchar_t * (*wide_type_wcscat)(wchar_t *__restrict dst, const wchar_t *__restrict src) = &wcscat;
wchar_t * (*wide_type_wcsncpy)(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n) = &wcsncpy;
wchar_t * (*wide_type_wcsncat)(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n) = &wcsncat;
wchar_t * (*wide_type_wmemcpy)(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n) = &wmemcpy;
wchar_t * (*wide_type_wmemmove)(wchar_t *dst, const wchar_t *src, size_t n) = &wmemmove;
int (*wide_type_wcscmp)(const wchar_t *a, const wchar_t *b) = &wcscmp;
int (*wide_type_wcscoll)(const wchar_t *a, const wchar_t *b) = &wcscoll;
int (*wide_type_wcsncmp)(const wchar_t *a, const wchar_t *b, size_t n) = &wcsncmp;
int (*wide_type_wmemcmp)(const wchar_t *a, const wchar_t *b, size_t n) = &wmemcmp;
size_t (*wide_type_wcsxfrm)(wchar_t *__restrict dst, const wchar_t *__restrict src, size_t n) = &wcsxfrm;
wchar_t * (*wide_type_wcschr)(const wchar_t *s, wchar_t wc) = &wcschr;
wchar_t * (*wide_type_wcsrchr)(const wchar_t *s, wchar_t wc) = &wcsrchr;
size_t (*wide_type_wcscspn)(const wchar_t *s, const wchar_t *set) = &wcscspn;
size_t (*wide_type_wcsspn)(const wchar_t *s, const wchar_t *set) = &wcsspn;
wchar_t * (*wide_type_wcspbrk)(const wchar_t *s, const wchar_t *set) = &wcspbrk;
wchar_t * (*wide_type_wcsstr)(const wchar_t *s, const wchar_t *set) = &wcsstr;
wchar_t * (*wide_type_wcstok)(wchar_t *__restrict s, const wchar_t *__restrict delim, wchar_t **__restrict ptr) = &wcstok;
wchar_t * (*wide_type_wmemchr)(const wchar_t *s, wchar_t wc, size_t n) = &wmemchr;
size_t (*wide_type_wcslen)(const wchar_t *s) = &wcslen;
wchar_t * (*wide_type_wmemset)(wchar_t *s, wchar_t wc, size_t n) = &wmemset;
size_t (*wide_type_wcsftime)(wchar_t *__restrict s, size_t maxsize, const wchar_t *__restrict format, const struct tm *__restrict timeptr) = &wcsftime;
wint_t (*wide_type_btowc)(int c) = &btowc;
int (*wide_type_wctob)(wint_t wc) = &wctob;
int (*wide_type_mbsinit)(const mbstate_t *ps) = &mbsinit;
size_t (*wide_type_mbrlen)(const char *__restrict s, size_t n, mbstate_t *__restrict ps) = &mbrlen;
size_t (*wide_type_mbrtowc)(wchar_t *__restrict pwc, const char *__restrict s, size_t n, mbstate_t *__restrict ps) = &mbrtowc;
size_t (*wide_type_wcrtomb)(char *__restrict s, wchar_t wc, mbstate_t *__restrict ps) = &wcrtomb;
size_t (*wide_type_mbsrtowcs)(wchar_t *__restrict dst, const char **__restrict src, size_t len, mbstate_t *__restrict ps) = &mbsrtowcs;
size_t (*wide_type_wcsrtombs)(char *__restrict dst, const wchar_t **__restrict src, size_t len, mbstate_t *__restrict ps) = &wcsrtombs;
