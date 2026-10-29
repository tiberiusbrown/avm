#ifndef AVM_STDIO_INTERNAL_H
#define AVM_STDIO_INTERNAL_H
#define AVM_STDIO_IMPLEMENTATION
#include <stdio.h>
#include <errno.h>

struct __avm_FILE {
    unsigned char flags;
    unsigned char pushback;
};
enum {
    READABLE = 1, WRITABLE = 2, EOF_SEEN = 4, ERROR_SEEN = 8,
    HAS_PUSHBACK = 16, CLOSED = 32, BYTE_ORIENTED = 64
};
_Static_assert(sizeof(FILE) == 2, "Streams must cost exactly two guest bytes");

static inline int __avm_stdio_validate(FILE* stream, unsigned char permission) {
    if(!stream || (stream->flags & CLOSED) ||
       (permission && !(stream->flags & permission))) {
        if(stream) stream->flags |= ERROR_SEEN;
        errno = EBADF;
        return 0;
    }
    return 1;
}
static inline int __avm_stdio_io(FILE* stream, unsigned char permission) {
    if(!__avm_stdio_validate(stream, permission)) return 0;
    stream->flags |= BYTE_ORIENTED;
    return 1;
}
static inline int __avm_stdio_extent(FILE* stream, size_t size, size_t count) {
    if(count > (size_t)-1 / size) {
        if(stream) stream->flags |= ERROR_SEEN;
        errno = EIO;
        return 0;
    }
    return 1;
}
#endif
