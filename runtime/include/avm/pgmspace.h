//===--- pgmspace.h - AVM program-space convenience API -----------------===//

#ifndef __AVM_PGMSPACE_H
#define __AVM_PGMSPACE_H

#include <stddef.h>
#include <stdint.h>

#define AVM_PROGMEM __attribute__((address_space(1)))
#define PROGMEM AVM_PROGMEM

#define AVM_PSTR(s) __builtin_avm_flash_string(s)
#define PSTR(s) AVM_PSTR(s)
#define F(s) AVM_PSTR(s)

#ifdef __cplusplus
extern "C" {
#endif

void* memcpy_P(void* dst, void const AVM_PROGMEM* src, size_t size);
int memcmp_P(void const* lhs, void const AVM_PROGMEM* rhs, size_t size);
int strcmp_P(char const* lhs, char const AVM_PROGMEM* rhs);
size_t strlen_P(char const AVM_PROGMEM* str);
char* strncpy_P(char* dst, char const AVM_PROGMEM* src, size_t size);
char* strncat_P(char* dst, char const AVM_PROGMEM* src, size_t size);
char* strcpy_P(char* dst, char const AVM_PROGMEM* src);
char* strcat_P(char* dst, char const AVM_PROGMEM* src);

// Unary searches return pointers in program memory. Binary _P functions
// keep their first input in RAM and read their second input from program memory.
const void AVM_PROGMEM* memchr_P(const void AVM_PROGMEM* src, int value, size_t size);
const char AVM_PROGMEM* strchr_P(const char AVM_PROGMEM* str, int value);
const char AVM_PROGMEM* strrchr_P(const char AVM_PROGMEM* str, int value);
size_t strnlen_P(const char AVM_PROGMEM* str, size_t size);
int strncmp_P(const char* lhs, const char AVM_PROGMEM* rhs, size_t size);
char* strstr_P(const char* str, const char AVM_PROGMEM* needle);
char* strpbrk_P(const char* str, const char AVM_PROGMEM* accept);
size_t strspn_P(const char* str, const char AVM_PROGMEM* accept);
size_t strcspn_P(const char* str, const char AVM_PROGMEM* reject);
char* strtok_P(char* str, const char AVM_PROGMEM* delimiters);
char* strtok_rP(char* str, const char AVM_PROGMEM* delimiters, char** saveptr);

#ifdef __cplusplus
}
#endif

#if !defined(AVM_PGMSPACE_IMPLEMENTATION) && \
    !defined(AVM_STRING_NO_BUILTIN_MACROS)
#define memcpy_P(dst, src, size) __avm_memcpy_P((dst), (src), (size))
#define memcmp_P(lhs, rhs, size) __avm_memcmp_P((lhs), (rhs), (size))
#define strcmp_P(lhs, rhs) __avm_strcmp_P((lhs), (rhs))
#define strlen_P(str) __avm_strlen_P((str))
#define strncpy_P(dst, src, size) __avm_strncpy_P((dst), (src), (size))
#define strncat_P(dst, src, size) __avm_strncat_P((dst), (src), (size))
#define strcpy_P(dst, src) strncpy_P((dst), (src), SIZE_MAX)
#define strcat_P(dst, src) strncat_P((dst), (src), SIZE_MAX)
#endif

#endif // __AVM_PGMSPACE_H
