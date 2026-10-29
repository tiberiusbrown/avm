#include "stdio_internal.h"

int fseek(FILE* stream, long offset, int whence) {
    (void)offset; (void)whence;
    if(!__avm_stdio_validate(stream, 0)) return -1;
    errno = ESPIPE; return -1;
}
long ftell(FILE* stream) { (void)fseek(stream, 0, SEEK_CUR); return -1L; }
int fgetpos(FILE* restrict stream, fpos_t* restrict pos) {
    (void)pos; return fseek(stream, 0, SEEK_CUR);
}
int fsetpos(FILE* stream, const fpos_t* pos) {
    (void)pos; return fseek(stream, 0, SEEK_SET);
}
void rewind(FILE* stream) { (void)fseek(stream, 0, SEEK_SET); clearerr(stream); }
