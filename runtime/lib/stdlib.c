#include <stdlib.h>
#include <ctype.h>
#include <errno.h>
#include <limits.h>
#include <avm.h>

int __avm_errno;

size_t memalignment(const void *ptr)
{
    uintptr_t address = (uintptr_t)ptr;
    return (size_t)(address & (uintptr_t)(0 - address));
}

int rand(void)
{
    return (int)(avm_random() >> 1);
}

void srand(unsigned int seed)
{
    avm_set_random_seed((uint16_t)seed);
}

static int digit_value(unsigned char c) {
    if(c >= '0' && c <= '9') return c - '0';
    if(c >= 'a' && c <= 'z') return c - 'a' + 10;
    if(c >= 'A' && c <= 'Z') return c - 'A' + 10;
    return -1;
}

/* Instantiate at each ABI width so short conversions use native arithmetic.
 * Once overflow occurs, keep scanning valid digits for the correct endptr. */
#define DEFINE_PARSER(name, type) \
static type name(const char* str, char** endptr, int base, \
                 type positive_limit, type negative_limit, \
                 int* negative, int* overflow) { \
    const char* p = str; \
    *negative = 0; \
    *overflow = 0; \
    if(endptr) *endptr = (char*)str; \
    if(base && (base < 2 || base > 36)) { \
        errno = EINVAL; \
        return 0; \
    } \
    while(isspace((unsigned char)*p)) ++p; \
    if(*p == '-' || *p == '+') { \
        *negative = *p == '-'; \
        ++p; \
    } \
    if((base == 0 || base == 16) && p[0] == '0' && \
       (p[1] == 'x' || p[1] == 'X') && \
       digit_value((unsigned char)p[2]) >= 0 && \
       digit_value((unsigned char)p[2]) < 16) { \
        p += 2; \
        base = 16; \
    } \
    if(!base) base = *p == '0' ? 8 : 10; \
    type limit = *negative ? negative_limit : positive_limit; \
    type cutoff = limit / (type)base; \
    unsigned int cutlim = (unsigned int)(limit % (type)base); \
    type value = 0; \
    const char* digits = p; \
    int digit; \
    while((digit = digit_value((unsigned char)*p)) >= 0 && digit < base) { \
        if(value > cutoff || (value == cutoff && (unsigned int)digit > cutlim)) \
            *overflow = 1; \
        if(!*overflow) value = value * (type)base + (type)digit; \
        ++p; \
    } \
    if(p == digits) return 0; \
    if(endptr) *endptr = (char*)p; \
    if(*overflow) { \
        errno = ERANGE; \
        return limit; \
    } \
    return value; \
}

DEFINE_PARSER(parse_uint, unsigned int)
DEFINE_PARSER(parse_ulong, unsigned long)
DEFINE_PARSER(parse_ullong, unsigned long long)

int atoi(const char* str) {
    int negative, overflow;
    unsigned int value = parse_uint(str, NULL, 10, INT_MAX,
        (unsigned int)INT_MAX + 1u, &negative, &overflow);
    return negative && value ? -(int)(value - 1u) - 1 : (int)value;
}

long strtol(const char* str, char** endptr, int base) {
    int negative, overflow;
    unsigned long value = parse_ulong(str, endptr, base, LONG_MAX,
        (unsigned long)LONG_MAX + 1ul, &negative, &overflow);
    return negative && value ? -(long)(value - 1ul) - 1 : (long)value;
}

unsigned long strtoul(const char* str, char** endptr, int base) {
    int negative, overflow;
    unsigned long value = parse_ulong(str, endptr, base, ULONG_MAX,
        ULONG_MAX, &negative, &overflow);
    return overflow ? ULONG_MAX : negative ? 0ul - value : value;
}

long long strtoll(const char* str, char** endptr, int base) {
    int negative, overflow;
    unsigned long long value = parse_ullong(str, endptr, base, LLONG_MAX,
        (unsigned long long)LLONG_MAX + 1ull, &negative, &overflow);
    return negative && value ? -(long long)(value - 1ull) - 1 : (long long)value;
}

unsigned long long strtoull(const char* str, char** endptr, int base) {
    int negative, overflow;
    unsigned long long value = parse_ullong(str, endptr, base, ULLONG_MAX,
        ULLONG_MAX, &negative, &overflow);
    return overflow ? ULLONG_MAX : negative ? 0ull - value : value;
}

long atol(const char* str) {
    return strtol(str, NULL, 10);
}

long long atoll(const char* str) {
    return strtoll(str, NULL, 10);
}

double atof(const char* str) { return strtod(str, NULL); }

int abs(int value) { return value < 0 ? -value : value; }
long labs(long value) { return value < 0 ? -value : value; }
long long llabs(long long value) { return value < 0 ? -value : value; }

div_t div(int numerator, int denominator) {
    div_t result = {numerator / denominator, numerator % denominator};
    return result;
}

ldiv_t ldiv(long numerator, long denominator) {
    ldiv_t result = {numerator / denominator, numerator % denominator};
    return result;
}

lldiv_t lldiv(long long numerator, long long denominator) {
    lldiv_t result = {numerator / denominator, numerator % denominator};
    return result;
}

char *getenv(const char *name)
{
    (void)name;
    return NULL;
}

int system(const char *command)
{
    return command == NULL ? 0 : -1;
}
