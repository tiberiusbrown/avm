#include <wchar.h>
static float (*volatile call_wcstof)(const wchar_t *__restrict s, wchar_t **__restrict endptr) = wcstof;
#define wcstof(...) call_wcstof(__VA_ARGS__)
static double (*volatile call_wcstod)(const wchar_t *__restrict s, wchar_t **__restrict endptr) = wcstod;
#define wcstod(...) call_wcstod(__VA_ARGS__)
static long double (*volatile call_wcstold)(const wchar_t *__restrict s, wchar_t **__restrict endptr) = wcstold;
#define wcstold(...) call_wcstold(__VA_ARGS__)
static long (*volatile call_wcstol)(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base) = wcstol;
#define wcstol(...) call_wcstol(__VA_ARGS__)
static long long (*volatile call_wcstoll)(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base) = wcstoll;
#define wcstoll(...) call_wcstoll(__VA_ARGS__)
static unsigned long (*volatile call_wcstoul)(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base) = wcstoul;
#define wcstoul(...) call_wcstoul(__VA_ARGS__)
static unsigned long long (*volatile call_wcstoull)(const wchar_t *__restrict s, wchar_t **__restrict endptr, int base) = wcstoull;
#define wcstoull(...) call_wcstoull(__VA_ARGS__)
#include "wchar_numeric.c"
