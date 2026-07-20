#ifndef AVM_RUNTIME_STRING_H
#define AVM_RUNTIME_STRING_H

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

void* memcpy(void* dst, const void* src, size_t size);
void* memset(void* dst, int value, size_t size);
void* memmove(void* dst, const void* src, size_t size);

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
#endif

#endif // AVM_RUNTIME_STRING_H
