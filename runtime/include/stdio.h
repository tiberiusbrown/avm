#ifndef _AVM_RUNTIME_STDIO_H
#define _AVM_RUNTIME_STDIO_H

#include <stdarg.h>
#include <stddef.h>

#include <avm/pgmspace.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct __avm_FILE FILE;
typedef long fpos_t;
extern FILE __avm_stdin;
extern FILE __avm_stdout;
extern FILE __avm_stderr;
#define stdin (&__avm_stdin)
#define stdout (&__avm_stdout)
#define stderr (&__avm_stderr)

#define EOF (-1)
#define BUFSIZ 256
#define FOPEN_MAX 8
#define FILENAME_MAX 255
#define L_tmpnam 16
#define TMP_MAX 25
#define _IOFBF 0
#define _IOLBF 1
#define _IONBF 2
#ifndef SEEK_SET
#define SEEK_SET 0
#define SEEK_CUR 1
#define SEEK_END 2
#endif

int remove(const char* filename);
int rename(const char* oldname, const char* newname);
FILE* tmpfile(void);
char* tmpnam(char* s);
int fclose(FILE* stream);
int fflush(FILE* stream);
FILE* fopen(const char* __restrict filename, const char* __restrict mode);
FILE* freopen(const char* __restrict filename, const char* __restrict mode,
              FILE* __restrict stream);
void setbuf(FILE* __restrict stream, char* __restrict buf);
int setvbuf(FILE* __restrict stream, char* __restrict buf, int mode, size_t size);
int fprintf(FILE* __restrict stream, const char* __restrict format, ...);
int printf(const char* __restrict format, ...);
int sprintf(char* __restrict s, const char* __restrict format, ...);
int vfprintf(FILE* __restrict stream, const char* __restrict format, va_list args);
int vprintf(const char* __restrict format, va_list args);
int vsprintf(char* __restrict s, const char* __restrict format, va_list args);
int scanf(const char* __restrict format, ...);
int fscanf(FILE* __restrict stream, const char* __restrict format, ...);
int sscanf(const char* __restrict s, const char* __restrict format, ...);
int vscanf(const char* __restrict format, va_list args);
int vfscanf(FILE* __restrict stream, const char* __restrict format, va_list args);
int vsscanf(const char* __restrict s, const char* __restrict format, va_list args);
int fgetc(FILE* stream);
char* fgets(char* __restrict s, int n, FILE* __restrict stream);
int fputc(int c, FILE* stream);
int fputs(const char* __restrict s, FILE* __restrict stream);
int getc(FILE* stream);
int getchar(void);
char* gets(char* s);
int putc(int c, FILE* stream);
int putchar(int c);
int puts(const char* s);
int ungetc(int c, FILE* stream);
size_t fread(void* __restrict ptr, size_t size, size_t nmemb,
             FILE* __restrict stream);
size_t fwrite(const void* __restrict ptr, size_t size, size_t nmemb,
              FILE* __restrict stream);
int fgetpos(FILE* __restrict stream, fpos_t* __restrict pos);
int fseek(FILE* stream, long offset, int whence);
int fsetpos(FILE* stream, const fpos_t* pos);
long ftell(FILE* stream);
void rewind(FILE* stream);
void clearerr(FILE* stream);
int feof(FILE* stream);
int ferror(FILE* stream);
void perror(const char* s);

int vsnprintf(
    char* __restrict s, size_t n, const char* __restrict fmt, va_list args);
int vsnprintf_P(
    char* s, size_t n, const char AVM_PROGMEM* fmt, va_list args);

int snprintf(char* __restrict s, size_t n, const char* __restrict format, ...);
int snprintf_P(char* __restrict s, size_t n,
               const char AVM_PROGMEM* __restrict format, ...);

#if !defined(AVM_STDIO_IMPLEMENTATION) && \
    !defined(AVM_STDIO_NO_BUILTIN_MACROS)
#ifndef __cplusplus
#define snprintf(...) __avm_snprintf(__VA_ARGS__)
#endif
#define snprintf_P(...) __avm_snprintf_P(__VA_ARGS__)
#endif

#if !defined(AVM_STDIO_IMPLEMENTATION) && \
    !defined(AVM_STDIO_NO_BUILTIN_MACROS)
#ifndef __cplusplus
#define vsnprintf(s, n, fmt, args) __avm_vsnprintf((s), (n), (fmt), (args))
#define vsnprintf_P(s, n, fmt, args) __avm_vsnprintf_P((s), (n), (fmt), (args))
#endif
#endif

#ifdef __cplusplus
} // extern "C"

int snprintf(char*, size_t, const char AVM_PROGMEM*, ...)
    __asm__("snprintf_P");

int vsnprintf(char*, size_t, const char AVM_PROGMEM*, va_list)
    __asm__("vsnprintf_P");

static __attribute__((always_inline)) inline int __avm_cpp_vsnprintf(
    char* s, size_t n, const char* fmt, va_list args) {
    return __avm_vsnprintf(s, n, fmt, args);
}
static __attribute__((always_inline)) inline int __avm_cpp_vsnprintf(
    char* s, size_t n, const char AVM_PROGMEM* fmt, va_list args) {
    return __avm_vsnprintf_P(s, n, fmt, args);
}

template<class... Args>
__attribute__((always_inline)) inline int __avm_cpp_snprintf(
    char* s, size_t n, const char* fmt, Args... args) {
    return __avm_snprintf(s, n, fmt, args...);
}

template<class... Args>
__attribute__((always_inline)) inline int __avm_cpp_snprintf(
    char* s, size_t n, const char AVM_PROGMEM* fmt, Args... args) {
    return __avm_snprintf_P(s, n, fmt, args...);
}

#if !defined(AVM_STDIO_IMPLEMENTATION) && \
    !defined(AVM_STDIO_NO_BUILTIN_MACROS)
#define snprintf(...) __avm_cpp_snprintf(__VA_ARGS__)
#endif
#if !defined(AVM_STDIO_IMPLEMENTATION) && \
    !defined(AVM_STDIO_NO_BUILTIN_MACROS)
#define vsnprintf(s, n, fmt, args) \
    __avm_cpp_vsnprintf((s), (n), (fmt), (args))
#define vsnprintf_P(s, n, fmt, args) __avm_vsnprintf_P((s), (n), (fmt), (args))
#endif
#endif

#endif
