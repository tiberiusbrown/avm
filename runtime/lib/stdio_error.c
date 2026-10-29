#include "stdio_internal.h"

void clearerr(FILE* stream) {
    if(stream) stream->flags &= ~(EOF_SEEN | ERROR_SEEN);
}
int feof(FILE* stream) { return stream && (stream->flags & EOF_SEEN); }
int ferror(FILE* stream) { return stream && (stream->flags & ERROR_SEEN); }
