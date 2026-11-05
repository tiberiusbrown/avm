#ifndef _AVM_RUNTIME_STDLIB_H
#define _AVM_RUNTIME_STDLIB_H
#define __STDC_VERSION_STDLIB_H__ 202311L

#include <stddef.h>

#define RAND_MAX 32767
#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1
#define MB_CUR_MAX 1

typedef struct { int quot; int rem; } div_t;
typedef struct { long quot; long rem; } ldiv_t;
typedef struct { long long quot; long long rem; } lldiv_t;

/* C++ declares these termination and registration functions noexcept. The
 * macro is empty in C, where the contract has no effect. */
#ifdef __cplusplus
#define AVM_STDLIB_NOEXCEPT noexcept
#else
#define AVM_STDLIB_NOEXCEPT
#endif

#ifdef __cplusplus
extern "C" {
#endif

int atexit(void (*func)(void)) AVM_STDLIB_NOEXCEPT;
/* quick_exit runs at_quick_exit registrations, not atexit registrations. AVM
 * keeps 32 quick-exit slots. Registration fails with a nonzero result when
 * they are full or when func is NULL. */
int at_quick_exit(void (*func)(void)) AVM_STDLIB_NOEXCEPT;
/* AVM has an empty environment-variable list. */
char *getenv(const char *name);

/* AVM has no command processor. NULL returns 0;
 * non-NULL commands return -1 without execution.
 * Neither function modifies errno. */
int system(const char *command);

void *malloc(size_t size);
void *calloc(size_t nmemb, size_t size);
void *realloc(void *ptr, size_t size);
void free(void *ptr);
/* AVM's heap guarantees only byte alignment, the fundamental alignment of
 * every type here. aligned_alloc returns NULL for any other alignment. */
void *aligned_alloc(size_t alignment, size_t size);
/* The size and alignment arguments must match the original allocation. AVM
 * allocations record their size internally, so these functions only free. */
void free_sized(void *ptr, size_t size);
void free_aligned_sized(void *ptr, size_t alignment, size_t size);
size_t memalignment(const void *ptr);
int rand(void);
void srand(unsigned int seed);
void qsort(void *base, size_t nmemb, size_t size,
           int (*compar)(const void *, const void *));
void *bsearch(const void *key, const void *base, size_t nmemb, size_t size,
              int (*compar)(const void *, const void *));
/* C23 makes bsearch generic in the qualification of base. A bare name, or a
 * name in parentheses, still denotes the addressable function. */
#if !defined(__cplusplus) && defined(__STDC_VERSION__) && \
    __STDC_VERSION__ >= 202311L && !defined(AVM_STDLIB_IMPLEMENTATION)
#define bsearch(key, base, nmemb, size, compar) \
    ((__typeof__(1 ? (base) : (void *)1))(bsearch)( \
        (key), (base), (nmemb), (size), (compar)))
#endif
/* The attribute works in C99 as well as all supported C++ language modes. */
__attribute__((noreturn)) void exit(int status) AVM_STDLIB_NOEXCEPT;
__attribute__((noreturn)) void _Exit(int status) AVM_STDLIB_NOEXCEPT;
__attribute__((noreturn)) void quick_exit(int status) AVM_STDLIB_NOEXCEPT;
__attribute__((noreturn)) void abort(void) AVM_STDLIB_NOEXCEPT;

/* Integer text conversions use the fixed C locale. strto* accepts bases
 * 2..36 or zero for octal/hexadecimal/decimal detection. Range errors set
 * errno to ERANGE; an invalid base sets EINVAL. Success preserves errno. */
int atoi(const char* str);
long atol(const char* str);
long long atoll(const char* str);
long strtol(const char* str, char** endptr, int base);
unsigned long strtoul(const char* str, char** endptr, int base);
long long strtoll(const char* str, char** endptr, int base);
unsigned long long strtoull(const char* str, char** endptr, int base);

/* Fixed C-locale decimal/hexadecimal floating conversions, including inf/nan.
 * AVM float, double, and long double are binary32. Overflow and subnormal/zero
 * underflow set ERANGE; success and no conversion preserve errno. */
float strtof(const char* str, char** endptr);
double strtod(const char* str, char** endptr);
long double strtold(const char* str, char** endptr);
double atof(const char* str);

/* strfrom* behave like snprintf for a format of an optional precision and one
 * of a, A, e, E, f, F, g, or G. Any other format is copied to s without
 * conversion, truncated as snprintf would truncate it. The return value is
 * the number of characters that would have been written. */
int strfromd(char* __restrict s, size_t n, const char* __restrict format,
             double fp);
int strfromf(char* __restrict s, size_t n, const char* __restrict format,
             float fp);
int strfroml(char* __restrict s, size_t n, const char* __restrict format,
             long double fp);

/* Fixed C locale: stateless single-byte encoding, mapping bytes 0..255
 * directly to unsigned 8-bit wide characters. All byte values are valid;
 * conversions preserve errno. */
int mblen(const char* s, size_t n);
int mbtowc(wchar_t* pwc, const char* s, size_t n);
int wctomb(char* s, wchar_t wc);
size_t mbstowcs(wchar_t* pwcs, const char* s, size_t n);
size_t wcstombs(char* s, const wchar_t* pwcs, size_t n);

/* The absolute value and division result must be representable. Division
 * truncates toward zero; a nonzero remainder has the numerator's sign. */
int abs(int value);
long labs(long value);
long long llabs(long long value);
div_t div(int numerator, int denominator);
ldiv_t ldiv(long numerator, long denominator);
lldiv_t lldiv(long long numerator, long long denominator);

#ifdef __cplusplus
} // extern "C"
#endif

#endif // _AVM_RUNTIME_STDLIB_H
