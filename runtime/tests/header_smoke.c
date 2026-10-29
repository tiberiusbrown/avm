#include <stdlib.h>
#include <assert.h>
#include <inttypes.h>
#include <math.h>
#include <tgmath.h>
#include <avm.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <locale.h>

float direct_math(float x, float y) {
    return sinf(x) + powf(x, y);
}

float parenthesized_math(float x) {
    return (sinf)(x);
}

float (*math_address(void))(float) {
    return &sinf;
}

void *direct_copy(void *dst, const void *src, size_t size) {
    return memcpy(dst, src, size);
}

void *(*copy_address(void))(void *, const void *, size_t) {
    return &memcpy;
}

int stdio_expression(char *dst, size_t size, const char *format, va_list args) {
    return (vsnprintf(dst, size, format, args) + 1);
}

int stdio_program_expression(char *dst, size_t size,
                             const char AVM_PROGMEM *format, va_list args) {
    return (vsnprintf_P(dst, size, format, args) + 1);
}

int stdio_parenthesized(char *dst, size_t size,
                        const char *format, va_list args) {
    return (vsnprintf)(dst, size, format, args);
}

int (*stdio_address(void))(char *, size_t, const char *, va_list) {
    return &vsnprintf;
}

int (*snprintf_address(void))(char *, size_t, const char *, ...) {
    return &snprintf;
}

int (*snprintf_program_address(void))(
    char *, size_t, const char AVM_PROGMEM *, ...) {
    return &snprintf_P;
}

void c_explicit_program_calls(
    char *dst, const char *ram, const char AVM_PROGMEM *flash,
    size_t n, va_list args) {
    memcpy(dst, ram, n);
    memcpy_P(dst, flash, n);
    (void)strlen(ram);
    (void)strlen_P(flash);
    (void)avm_draw_text(0, 10, ram);
    (void)avm_draw_text_P(0, 10, flash);
    (void)avm_text_width(ram);
    (void)avm_text_width_P(flash);
    (void)avm_draw_textfv(0, 10, ram, args);
    (void)avm_draw_textfv_P(0, 10, flash, args);
    (void)avm_draw_textf(0, 10, ram, 7);
    (void)avm_draw_textf_P(0, 10, flash, 7);
}

int termination_header_smoke(void (*fn)(void)) { return atexit(fn); }
intmax_t (*intmax_parse_address(void))(const char*, char**, int) { return &strtoimax; }
char* (*strerror_address(void))(int) { return &strerror; }

clock_t time_direct(void) { return clock(); }
clock_t (*time_address(void))(void) { return &clock; }
clock_t time_constant(void) { return CLOCKS_PER_SEC; }

char *locale_direct(void) { return setlocale(LC_ALL, "C"); }
char *(*locale_setlocale_address(void))(int, const char *) { return &setlocale; }
struct lconv *localeconv_direct(void) { return localeconv(); }
struct lconv *(*localeconv_address(void))(void) { return &localeconv; }

/* Calendar ABI and addressable ordinary C entry points. */
_Static_assert(sizeof(time_t) == 8 && (time_t)-1 < 0, "signed 64-bit time_t");
_Static_assert(sizeof(clock_t) == 4 && (clock_t)-1 > 0, "unsigned 32-bit clock_t");
_Static_assert(CLOCKS_PER_SEC == 1000, "clock scale");
_Static_assert(sizeof(struct tm) == 18, "nine 16-bit fields");
#define TM_FIELD(field, index) _Static_assert(sizeof(((struct tm *)0)->field) == sizeof(int) && offsetof(struct tm, field) == (index)*2, "tm field ABI")
TM_FIELD(tm_sec,0); TM_FIELD(tm_min,1); TM_FIELD(tm_hour,2);
TM_FIELD(tm_mday,3); TM_FIELD(tm_mon,4); TM_FIELD(tm_year,5);
TM_FIELD(tm_wday,6); TM_FIELD(tm_yday,7); TM_FIELD(tm_isdst,8);
#undef TM_FIELD
void time_interface_smoke(void)
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
_Static_assert(sizeof(jmp_buf) == 13, "jmp_buf size");
_Static_assert(_Alignof(jmp_buf) == 1, "jmp_buf alignment");
static void jump_header_helper(jmp_buf env) { longjmp(env, 1); }
void jump_header_smoke(void) {
    jmp_buf env;
    if (setjmp(env) == 0) jump_header_helper(env);
}
#include <signal.h>
_Static_assert(sizeof(sig_atomic_t) == 1 && (sig_atomic_t)-1 < 0, "signal atomic ABI");
_Static_assert(sizeof(__avm_sighandler_t) == 3, "packed code pointer ABI");
_Static_assert(SIGABRT == 1 && SIGFPE == 2 && SIGILL == 3 && SIGINT == 4 &&
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
