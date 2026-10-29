#include <wchar.h>
#include <time.h>

size_t wcsftime(wchar_t *restrict s, size_t maxsize,
               const wchar_t *restrict format, const struct tm *restrict timeptr) {
    return strftime((char *)s, maxsize, (const char *)format, timeptr);
}
