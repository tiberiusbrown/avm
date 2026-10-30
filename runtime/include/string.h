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
void* memset_explicit(void* dst, int value, size_t size);
void* memccpy(void* dst, const void* src, int value, size_t size);
void* memmove(void* dst, const void* src, size_t size);
int memcmp(const void* lhs, const void* rhs, size_t size);
void* memchr(const void* src, int value, size_t size);

int strcmp(const char* lhs, const char* rhs);
int strcoll(const char* s1, const char* s2);
size_t strxfrm(char* dst, const char* src, size_t n);
char* strerror(int errnum);
int strncmp(const char* lhs, const char* rhs, size_t size);
char* strchr(const char* str, int value);
char* strrchr(const char* str, int value);
char* strstr(const char* str, const char* needle);
char* strpbrk(const char* str, const char* accept);
size_t strspn(const char* str, const char* accept);
size_t strcspn(const char* str, const char* reject);
char* strtok(char* str, const char* delimiters);
// Reentrant tokenization and bounded length extensions.
char* strtok_r(char* str, const char* delimiters, char** saveptr);
size_t strnlen(const char* str, size_t size);
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
const void AVM_PROGMEM* memchr(const void AVM_PROGMEM*, int, size_t) __asm__("memchr_P");
const char AVM_PROGMEM* strchr(const char AVM_PROGMEM*, int) __asm__("strchr_P");
const char AVM_PROGMEM* strrchr(const char AVM_PROGMEM*, int) __asm__("strrchr_P");
size_t strnlen(const char AVM_PROGMEM*, size_t) __asm__("strnlen_P");
int strncmp(const char*, const char AVM_PROGMEM*, size_t) __asm__("strncmp_P");
char* strstr(const char*, const char AVM_PROGMEM*) __asm__("strstr_P");
char* strpbrk(const char*, const char AVM_PROGMEM*) __asm__("strpbrk_P");
size_t strspn(const char*, const char AVM_PROGMEM*) __asm__("strspn_P");
size_t strcspn(const char*, const char AVM_PROGMEM*) __asm__("strcspn_P");
char* strtok(char*, const char AVM_PROGMEM*) __asm__("strtok_P");
char* strtok_r(char*, const char AVM_PROGMEM*, char**) __asm__("strtok_rP");

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

// Qualified calls such as std::memcpy are still subject to the function-like
// macros below. Import the implementation helpers so those calls retain the
// same AVM RAM/PROGMEM overload selection after macro expansion.
namespace std {
using ::__avm_cpp_memcpy;
using ::__avm_cpp_memcmp;
using ::__avm_cpp_strcmp;
using ::__avm_cpp_strlen;
using ::__avm_cpp_strncpy;
using ::__avm_cpp_strncat;
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
#endif
#define strcat(dst, src) strncat((dst), (src), SIZE_MAX)

#if !defined(__cplusplus) && defined(__STDC_VERSION__) && \
    __STDC_VERSION__ >= 202311L && !defined(AVM_STRING_IMPLEMENTATION)
/* The conditional expression applies array decay without evaluating src.
 * typeof preserves the pointee qualification; the call remains addressable. */
#define __AVM_SEARCH_RESULT(src, result) \
    ((__typeof__((1 ? (src) : (src)) + 0))(result))
#define memchr(src, value, size) \
    ((__typeof__(1 ? (src) : (void*)1))(memchr)((src), (value), (size)))
#define strchr(src, value) __AVM_SEARCH_RESULT(src, (strchr)((src), (value)))
#define strrchr(src, value) __AVM_SEARCH_RESULT(src, (strrchr)((src), (value)))
#define strpbrk(src, accept) __AVM_SEARCH_RESULT(src, (strpbrk)((src), (accept)))
#define strstr(src, needle) __AVM_SEARCH_RESULT(src, (strstr)((src), (needle)))
#endif

#endif // AVM_RUNTIME_STRING_H
