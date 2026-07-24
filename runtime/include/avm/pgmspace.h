//===--- pgmspace.h - AVM program-space convenience API -----------------===//

#ifndef __AVM_PGMSPACE_H
#define __AVM_PGMSPACE_H

#include <stddef.h>
#include <stdint.h>

#define AVM_PROGMEM __attribute__((address_space(1)))

#define AVM_PSTR(s) __builtin_avm_flash_string(s)
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

#ifdef __cplusplus
}
#endif

#define memcpy_P(dst, src, size) __avm_memcpy_P((dst), (src), (size))
#define memcmp_P(lhs, rhs, size) __avm_memcmp_P((lhs), (rhs), (size))
#define strcmp_P(lhs, rhs) __avm_strcmp_P((lhs), (rhs))
#define strlen_P(str) __avm_strlen_P((str))
#define strncpy_P(dst, src, size) __avm_strncpy_P((dst), (src), (size))
#define strncat_P(dst, src, size) __avm_strncat_P((dst), (src), (size))
#define strcpy_P(dst, src) strncpy_P((dst), (src), SIZE_MAX)
#define strcat_P(dst, src) strncat_P((dst), (src), SIZE_MAX)

#endif // __AVM_PGMSPACE_H
