#ifndef _AVM_RUNTIME_STDLIB_H
#define _AVM_RUNTIME_STDLIB_H

#include <stddef.h>

typedef struct { int quot; int rem; } div_t;
typedef struct { long quot; long rem; } ldiv_t;
typedef struct { long long quot; long long rem; } lldiv_t;

#ifdef __cplusplus
extern "C" {
#endif

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
