#include "stdio_internal.h"

int fputc(int c, FILE* stream) {
    if(!__avm_stdio_io(stream, WRITABLE)) return EOF;
    __avm_debug_putc((unsigned char)c);
    return (unsigned char)c;
}
int putc(int c, FILE* stream) { return fputc(c, stream); }
int fputs(const char* restrict s, FILE* restrict stream) {
    if(!__avm_stdio_io(stream, WRITABLE)) return EOF;
    while(*s) __avm_debug_putc((unsigned char)*s++);
    return 0;
}
size_t fwrite(const void* restrict ptr, size_t size, size_t nmemb,
              FILE* restrict stream) {
    if(!size || !nmemb) return 0;
    if(!__avm_stdio_io(stream, WRITABLE) ||
       !__avm_stdio_extent(stream, size, nmemb)) return 0;
    const unsigned char* p = ptr;
    size_t bytes = size * nmemb;
    while(bytes--) __avm_debug_putc(*p++);
    return nmemb;
}
