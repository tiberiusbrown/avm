#include "stdio_internal.h"

FILE* fopen(const char* restrict filename, const char* restrict mode) {
    (void)filename; (void)mode; errno = ENOSYS; return NULL;
}
FILE* freopen(const char* restrict filename, const char* restrict mode,
              FILE* restrict stream) {
    (void)fclose(stream);
    return fopen(filename, mode);
}
int remove(const char* filename) { (void)filename; errno = ENOSYS; return -1; }
int rename(const char* oldname, const char* newname) {
    (void)oldname; (void)newname; errno = ENOSYS; return -1;
}
FILE* tmpfile(void) { errno = ENOSYS; return NULL; }
char* tmpnam(char* s) { (void)s; errno = ENOSYS; return NULL; }
