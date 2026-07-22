#ifndef AVM_RUNTIME_STRING_H
#define AVM_RUNTIME_STRING_H

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
#endif

/*
 * Direct call syntax uses AVM system-service builtins. Address-taking and
 * parenthesized calls continue to resolve to the wrappers in libavm.a.
 */
#if !defined(AVM_STRING_IMPLEMENTATION) && \
    !defined(AVM_STRING_NO_BUILTIN_MACROS)
#define memcpy(dst, src, size) __avm_memcpy((dst), (src), (size))
#define memset(dst, value, size) __avm_memset((dst), (value), (size))
#define memmove(dst, src, size) __avm_memmove((dst), (src), (size))
#define memcmp(lhs, rhs, size) __avm_memcmp((lhs), (rhs), (size))
#define strcmp(lhs, rhs) __avm_strcmp((lhs), (rhs))
#define strlen(str) __avm_strlen((str))
#define strncpy(dst, src, size) __avm_strncpy((dst), (src), (size))
#define strncat(dst, src, size) __avm_strncat((dst), (src), (size))
#endif
#define strcpy(dst, src) strncpy((dst), (src), SIZE_MAX)
#define strcat(dst, src) strncat((dst), (src), SIZE_MAX)

#endif // AVM_RUNTIME_STRING_H
