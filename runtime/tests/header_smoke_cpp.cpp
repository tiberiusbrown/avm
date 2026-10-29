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
