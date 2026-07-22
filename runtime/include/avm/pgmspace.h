//===--- pgmspace.h - AVM program-space convenience API -----------------===//

#ifndef __AVM_PGMSPACE_H
#define __AVM_PGMSPACE_H

#include <stddef.h>
#include <stdint.h>

#define AVM_PROGMEM __attribute__((address_space(1)))

#define AVM_PSTR(s) __builtin_avm_flash_string(s)
#define F(s) AVM_PSTR(s)

void* memcpy_P(void* dst, void const AVM_PROGMEM* src, size_t size);
int memcmp_P(void const* lhs, void const AVM_PROGMEM* rhs, size_t size);
int strcmp_P(char const* lhs, char const AVM_PROGMEM* rhs);
size_t strlen_P(char const AVM_PROGMEM* str);
char* strncpy_P(char* dst, char const AVM_PROGMEM* src, size_t size);
char* strncat_P(char* dst, char const AVM_PROGMEM* src, size_t size);
char* strcpy_P(char* dst, char const AVM_PROGMEM* src);
char* strcat_P(char* dst, char const AVM_PROGMEM* src);

#define memcpy_P(dst, src, size) __builtin_avm_memcpy_p((dst), (src), (size))
#define memcmp_P(lhs, rhs, size) __builtin_avm_memcmp_p((lhs), (rhs), (size))
#define strcmp_P(lhs, rhs) __builtin_avm_strcmp_p((lhs), (rhs))
#define strlen_P(str) __builtin_avm_strlen_p((str))
#define strncpy_P(dst, src, size) __builtin_avm_strncpy_p((dst), (src), (size))
#define strncat_P(dst, src, size) __builtin_avm_strncat_p((dst), (src), (size))
#define strcpy_P(dst, src) strncpy_P((dst), (src), SIZE_MAX)
#define strcat_P(dst, src) strncat_P((dst), (src), SIZE_MAX)

#endif // __AVM_PGMSPACE_H
