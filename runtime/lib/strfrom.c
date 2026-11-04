#include <stdlib.h>
#include <stdio.h>
#include <string.h>

/* A valid format is "%", an optional "." followed by decimal digits, and one
 * of a, A, e, E, f, F, g, or G, then the end of the string. */
static int strfrom_format_is_valid(const char *format) {
    if (*format++ != '%') return 0;
    if (*format == '.') {
        ++format;
        while (*format >= '0' && *format <= '9') ++format;
    }
    switch (*format++) {
    case 'a': case 'A': case 'e': case 'E':
    case 'f': case 'F': case 'g': case 'G':
        return *format == '\0';
    default:
        return 0;
    }
}

/* Copy an unsupported format with snprintf's truncation rule, and return its
 * full length. */
static int strfrom_copy_format(char *s, size_t n, const char *format) {
    size_t length = strlen(format);
    if (n) {
        size_t copied = length < n ? length : n - 1;
        memcpy(s, format, copied);
        s[copied] = '\0';
    }
    return (int)length;
}

int strfromd(char *__restrict s, size_t n, const char *__restrict format,
             double fp) {
    if (!strfrom_format_is_valid(format)) return strfrom_copy_format(s, n, format);
    return snprintf(s, n, format, fp);
}

int strfromf(char *__restrict s, size_t n, const char *__restrict format,
             float fp) {
    if (!strfrom_format_is_valid(format)) return strfrom_copy_format(s, n, format);
    return snprintf(s, n, format, (double)fp);
}

int strfroml(char *__restrict s, size_t n, const char *__restrict format,
             long double fp) {
    if (!strfrom_format_is_valid(format)) return strfrom_copy_format(s, n, format);
    return snprintf(s, n, format, (double)fp);
}
