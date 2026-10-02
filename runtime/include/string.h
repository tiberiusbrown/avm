#ifndef _AVM_RUNTIME_STRING_H
#define _AVM_RUNTIME_STRING_H

#include <stddef.h>
#include <stdint.h>

#include <avm/pgmspace.h>

#ifdef __cplusplus
extern "C" {
#endif

void* memcpy(void* dst, const void* src, size_t size);
void* memset(void* dst, int value, size_t size);
void* memmove(void* dst, const void* src, size_t size);
int memcmp(const void* lhs, const void* rhs, size_t size);

int strcmp(const char* lhs, const char* rhs);
size_t strlen(const char* str);
char* strncpy(char* dst, const char* src, size_t size);
char* strncat(char* dst, const char* src, size_t size);
char* strcpy(char* dst, const char* src);
char* strcat(char* dst, const char* src);

#ifdef __cplusplus
} // extern "C"

// The overloads have C++ linkage for overload resolution, but bind to the
// existing C ABI entry points when used as function pointers.
void* memcpy(void*, const void AVM_PROGMEM*, size_t) __asm__("memcpy_P");
int memcmp(const void*, const void AVM_PROGMEM*, size_t) __asm__("memcmp_P");
int strcmp(const char*, const char AVM_PROGMEM*) __asm__("strcmp_P");
size_t strlen(const char AVM_PROGMEM*) __asm__("strlen_P");
char* strncpy(char*, const char AVM_PROGMEM*, size_t) __asm__("strncpy_P");
char* strncat(char*, const char AVM_PROGMEM*, size_t) __asm__("strncat_P");
char* strcpy(char*, const char AVM_PROGMEM*) __asm__("strcpy_P");
char* strcat(char*, const char AVM_PROGMEM*) __asm__("strcat_P");

// Direct call syntax keeps the system-service path at all optimization levels.
static __attribute__((always_inline)) inline void* __avm_cpp_memcpy(void* d, const void* s, size_t n) {
    return __avm_memcpy(d, s, n);
}
static __attribute__((always_inline)) inline void* __avm_cpp_memcpy(
    void* d, const void AVM_PROGMEM* s, size_t n) {
    return __avm_memcpy_P(d, s, n);
}
static __attribute__((always_inline)) inline int __avm_cpp_memcmp(const void* a, const void* b, size_t n) {
    return __avm_memcmp(a, b, n);
}
static __attribute__((always_inline)) inline int __avm_cpp_memcmp(
    const void* a, const void AVM_PROGMEM* b, size_t n) {
    return __avm_memcmp_P(a, b, n);
}
static __attribute__((always_inline)) inline int __avm_cpp_strcmp(const char* a, const char* b) {
    return __avm_strcmp(a, b);
}
static __attribute__((always_inline)) inline int __avm_cpp_strcmp(
    const char* a, const char AVM_PROGMEM* b) {
    return __avm_strcmp_P(a, b);
}
static __attribute__((always_inline)) inline size_t __avm_cpp_strlen(const char* s) {
    return __avm_strlen(s);
}
static __attribute__((always_inline)) inline size_t __avm_cpp_strlen(const char AVM_PROGMEM* s) {
    return __avm_strlen_P(s);
}
static __attribute__((always_inline)) inline char* __avm_cpp_strncpy(char* d, const char* s, size_t n) {
    return __avm_strncpy(d, s, n);
}
static __attribute__((always_inline)) inline char* __avm_cpp_strncpy(
    char* d, const char AVM_PROGMEM* s, size_t n) {
    return __avm_strncpy_P(d, s, n);
}
static __attribute__((always_inline)) inline char* __avm_cpp_strncat(char* d, const char* s, size_t n) {
    return __avm_strncat(d, s, n);
}
static __attribute__((always_inline)) inline char* __avm_cpp_strncat(
    char* d, const char AVM_PROGMEM* s, size_t n) {
    return __avm_strncat_P(d, s, n);
}
#endif

/*
 * Direct call syntax uses AVM system-service builtins. Address-taking and
 * parenthesized calls continue to resolve to the wrappers in libavm.a.
 */
#if !defined(AVM_STRING_IMPLEMENTATION) && \
    !defined(AVM_STRING_NO_BUILTIN_MACROS)
#ifdef __cplusplus
#define memcpy(dst, src, size) __avm_cpp_memcpy((dst), (src), (size))
#define memcmp(lhs, rhs, size) __avm_cpp_memcmp((lhs), (rhs), (size))
#define strcmp(lhs, rhs) __avm_cpp_strcmp((lhs), (rhs))
#define strlen(str) __avm_cpp_strlen((str))
#define strncpy(dst, src, size) __avm_cpp_strncpy((dst), (src), (size))
#define strncat(dst, src, size) __avm_cpp_strncat((dst), (src), (size))
#else
#define memcpy(dst, src, size) __avm_memcpy((dst), (src), (size))
#define memcmp(lhs, rhs, size) __avm_memcmp((lhs), (rhs), (size))
#define strcmp(lhs, rhs) __avm_strcmp((lhs), (rhs))
#define strlen(str) __avm_strlen((str))
#define strncpy(dst, src, size) __avm_strncpy((dst), (src), (size))
#define strncat(dst, src, size) __avm_strncat((dst), (src), (size))
#endif
#define memset(dst, value, size) __avm_memset((dst), (value), (size))
#define memmove(dst, src, size) __avm_memmove((dst), (src), (size))
#endif
#define strcpy(dst, src) strncpy((dst), (src), SIZE_MAX)
#define strcat(dst, src) strncat((dst), (src), SIZE_MAX)

#endif // AVM_RUNTIME_STRING_H
