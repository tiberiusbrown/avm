#include <wchar.h>
#include <stdlib.h>

float wcstof(const wchar_t *restrict s, wchar_t **restrict endptr) {
    char *end;
    float result = strtof((const char *)s, endptr ? &end : NULL);
    if(endptr) *endptr = (wchar_t *)end;
    return result;
}
double wcstod(const wchar_t *restrict s, wchar_t **restrict endptr) {
    char *end;
    double result = strtod((const char *)s, endptr ? &end : NULL);
    if(endptr) *endptr = (wchar_t *)end;
    return result;
}
long double wcstold(const wchar_t *restrict s, wchar_t **restrict endptr) {
    char *end;
    long double result = strtold((const char *)s, endptr ? &end : NULL);
    if(endptr) *endptr = (wchar_t *)end;
    return result;
}
long wcstol(const wchar_t *restrict s, wchar_t **restrict endptr, int base) {
    char *end;
    long result = strtol((const char *)s, endptr ? &end : NULL, base);
    if(endptr) *endptr = (wchar_t *)end;
    return result;
}
long long wcstoll(const wchar_t *restrict s, wchar_t **restrict endptr, int base) {
    char *end;
    long long result = strtoll((const char *)s, endptr ? &end : NULL, base);
    if(endptr) *endptr = (wchar_t *)end;
    return result;
}
unsigned long wcstoul(const wchar_t *restrict s, wchar_t **restrict endptr, int base) {
    char *end;
    unsigned long result = strtoul((const char *)s, endptr ? &end : NULL, base);
    if(endptr) *endptr = (wchar_t *)end;
    return result;
}
unsigned long long wcstoull(const wchar_t *restrict s, wchar_t **restrict endptr, int base) {
    char *end;
    unsigned long long result = strtoull((const char *)s, endptr ? &end : NULL, base);
    if(endptr) *endptr = (wchar_t *)end;
    return result;
}
