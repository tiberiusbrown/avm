#include <inttypes.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h>

_Static_assert(sizeof(intmax_t) == sizeof(long long),
               "AVM maximum-width conversions share long long's width");

intmax_t imaxabs(intmax_t value) { return llabs((long long)value); }

imaxdiv_t imaxdiv(intmax_t numer, intmax_t denom) {
    lldiv_t d = lldiv((long long)numer, (long long)denom);
    imaxdiv_t result = {(intmax_t)d.quot, (intmax_t)d.rem};
    return result;
}

intmax_t strtoimax(const char* s, char** end, int base) {
    return (intmax_t)strtoll(s, end, base);
}
uintmax_t strtoumax(const char* s, char** end, int base) {
    return (uintmax_t)strtoull(s, end, base);
}

static int wide_digit(wchar_t c) {
    if(c >= L'0' && c <= L'9') return (int)(c - L'0');
    if(c >= L'a' && c <= L'z') return (int)(c - L'a') + 10;
    if(c >= L'A' && c <= L'Z') return (int)(c - L'A') + 10;
    return -1;
}

/* Scan directly from wchar_t storage; no temporary byte string or heap is
 * needed. The C locale recognizes only ASCII whitespace and digits. */
static uintmax_t parse_wide(const wchar_t* str, wchar_t** endptr, int base,
                           uintmax_t positive_limit, uintmax_t negative_limit,
                           int* negative, int* overflow) {
    const wchar_t* p = str;
    *negative = 0;
    *overflow = 0;
    if(endptr) *endptr = (wchar_t*)str;
    if(base && (base < 2 || base > 36)) {
        errno = EINVAL;
        return 0;
    }
    while(*p == L' ' || (*p >= L'\t' && *p <= L'\r')) ++p;
    if(*p == L'+' || *p == L'-') {
        *negative = *p == L'-';
        ++p;
    }
    if((base == 0 || base == 16) && p[0] == L'0' &&
       (p[1] == L'x' || p[1] == L'X') &&
       wide_digit(p[2]) >= 0 && wide_digit(p[2]) < 16) {
        p += 2;
        base = 16;
    }
    if(!base) base = *p == L'0' ? 8 : 10;
    uintmax_t limit = *negative ? negative_limit : positive_limit;
    uintmax_t cutoff = limit / (uintmax_t)base;
    unsigned int cutlim = (unsigned int)(limit % (uintmax_t)base);
    uintmax_t value = 0;
    const wchar_t* digits = p;
    int digit;
    while((digit = wide_digit(*p)) >= 0 && digit < base) {
        if(value > cutoff || (value == cutoff && (unsigned int)digit > cutlim))
            *overflow = 1;
        if(!*overflow) value = value * (uintmax_t)base + (uintmax_t)digit;
        ++p;
    }
    if(p == digits) return 0;
    if(endptr) *endptr = (wchar_t*)p;
    if(*overflow) {
        errno = ERANGE;
        return limit;
    }
    return value;
}

intmax_t wcstoimax(const wchar_t* str, wchar_t** endptr, int base) {
    int negative, overflow;
    uintmax_t value = parse_wide(str, endptr, base, INTMAX_MAX,
        (uintmax_t)INTMAX_MAX + 1u, &negative, &overflow);
    return negative && value ? -(intmax_t)(value - 1u) - 1 : (intmax_t)value;
}

uintmax_t wcstoumax(const wchar_t* str, wchar_t** endptr, int base) {
    int negative, overflow;
    uintmax_t value = parse_wide(str, endptr, base, UINTMAX_MAX,
        UINTMAX_MAX, &negative, &overflow);
    return overflow ? UINTMAX_MAX : negative ? (uintmax_t)0 - value : value;
}
