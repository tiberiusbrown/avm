#include "stdio_internal.h"

int fclose(FILE* stream) {
    if(!__avm_stdio_validate(stream, 0)) return EOF;
    stream->flags = (stream->flags & ~(READABLE | WRITABLE | HAS_PUSHBACK)) | CLOSED;
    return 0;
}
int fflush(FILE* stream) {
    if(!stream) return 0;
    return __avm_stdio_validate(stream, WRITABLE) ? 0 : EOF;
}
int setvbuf(FILE* restrict stream, char* restrict buf, int mode, size_t size) {
    (void)buf; (void)size;
    if(!__avm_stdio_validate(stream, 0)) return -1;
    if(mode != _IONBF) { errno = EINVAL; return -1; }
    return 0;
}
void setbuf(FILE* restrict stream, char* restrict buf) {
    (void)setvbuf(stream, buf, buf ? _IOFBF : _IONBF, BUFSIZ);
}
