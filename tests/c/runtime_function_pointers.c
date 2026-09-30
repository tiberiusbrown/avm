#include <avm/pgmspace.h>
#include <stdio.h>

int avm_test_main(void)
{
    char dst[16] = "A";
    char *(*volatile copy)(char *, const char AVM_PROGMEM *, size_t) =
        &strncpy_P;
    char *(*volatile append)(char *, const char AVM_PROGMEM *, size_t) =
        &strncat_P;
    int (*volatile format)(char *, size_t, const char *, ...) = &snprintf;
    int (*volatile format_p)(char *, size_t,
                             const char AVM_PROGMEM *, ...) = &snprintf_P;

    if (copy(dst, F("hi"), 3) != dst || dst[0] != 'h' || dst[2] != 0)
        return 1;
    if (append(dst, F("!"), 1) != dst || dst[2] != '!')
        return 2;
    if (format(dst, sizeof(dst), "%u", 42u) != 2 ||
        dst[0] != '4' || dst[1] != '2')
        return 3;
    if (format_p(dst, sizeof(dst), F("%u"), 57u) != 2 ||
        dst[0] != '5' || dst[1] != '7')
        return 4;
    if (snprintf(dst, sizeof(dst), "%u", 12u) != 2 ||
        dst[0] != '1' || dst[1] != '2')
        return 5;
    if (snprintf_P(dst, sizeof(dst), F("%u"), 34u) != 2 ||
        dst[0] != '3' || dst[1] != '4')
        return 6;
    return 0;
}
