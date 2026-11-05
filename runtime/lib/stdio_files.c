#include "stdio_internal.h"
#include <limits.h>

FILE* fopen(const char* restrict filename, const char* restrict mode) {
    (void)filename; (void)mode; errno = ENOSYS; return NULL;
}
FILE* freopen(const char* restrict filename, const char* restrict mode,
              FILE* restrict stream) {
    (void)fclose(stream);
    clearerr(stream);
    return fopen(filename, mode);
}
int remove(const char* filename) { (void)filename; errno = ENOSYS; return -1; }
int rename(const char* oldname, const char* newname) {
    (void)oldname; (void)newname; errno = ENOSYS; return -1;
}
FILE* tmpfile(void) { errno = ENOSYS; return NULL; }
char* tmpnam(char* s) {
    static unsigned long next;
    static char name[L_tmpnam];
    static const char digits[] = "0123456789abcdef";
    if(next == ULONG_MAX) return NULL;
    if(!s) s = name;
    unsigned long value = next++;
    s[0] = 't'; s[1] = 'm'; s[2] = 'p';
    for(int i = 10; i >= 3; --i) {
        s[i] = digits[value & 15];
        value >>= 4;
    }
    s[11] = '\0';
    return s;
}
