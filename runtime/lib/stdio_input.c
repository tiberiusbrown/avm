#include "stdio_internal.h"

int fgetc(FILE* stream) {
    if(!__avm_stdio_io(stream, READABLE)) return EOF;
    if(stream->flags & HAS_PUSHBACK) {
        stream->flags &= ~HAS_PUSHBACK;
        return stream->pushback;
    }
    stream->flags |= EOF_SEEN;
    return EOF;
}
int getc(FILE* stream) { return fgetc(stream); }
int ungetc(int c, FILE* stream) {
    if(!__avm_stdio_io(stream, READABLE) || c == EOF ||
       (stream->flags & HAS_PUSHBACK)) return EOF;
    stream->pushback = (unsigned char)c;
    stream->flags = (stream->flags & ~EOF_SEEN) | HAS_PUSHBACK;
    return (unsigned char)c;
}
char* fgets(char* restrict s, int n, FILE* restrict stream) {
    if(!__avm_stdio_io(stream, READABLE) || n <= 0) return NULL;
    int i = 0;
    while(i < n - 1) {
        int c = fgetc(stream);
        if(c == EOF) {
            /* An open readable stream has only normal backend EOF. */
            if(!i) return NULL;
            break;
        }
        s[i++] = (char)c;
        if(c == '\n') break;
    }
    s[i] = 0;
    return s;
}
size_t fread(void* restrict ptr, size_t size, size_t nmemb,
             FILE* restrict stream) {
    if(!size || !nmemb) return 0;
    if(!__avm_stdio_io(stream, READABLE) ||
       !__avm_stdio_extent(stream, size, nmemb)) return 0;
    unsigned char* p = ptr;
    size_t complete = 0;
    while(complete < nmemb) {
        size_t i = 0;
        while(i++ < size) {
            int c = fgetc(stream);
            if(c == EOF) return complete;
            *p++ = (unsigned char)c;
        }
        ++complete;
    }
    return complete;
}
