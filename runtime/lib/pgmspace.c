#include <avm/pgmspace.h>

/*
 * Clang reserves the source spelling memcpy_P as an AVM target builtin, so it
 * cannot also be used as the identifier of a function definition. Define the
 * wrapper with a private C identifier and give it the public ELF symbol name.
 */

void* avm_runtime_memcpy_P(void* dst, void const AVM_PROGMEM* src, size_t size)
    __asm__("memcpy_P");

void* avm_runtime_memcpy_P(void* dst, void const AVM_PROGMEM* src, size_t size) {
    return __avm_memcpy_P(dst, src, size);
}

int avm_runtime_memcmp_P(void const* lhs, void const AVM_PROGMEM* rhs, size_t size)
    __asm__("memcmp_P");

int avm_runtime_memcmp_P(void const* lhs, void const AVM_PROGMEM* rhs, size_t size) {
    return __avm_memcmp_P(lhs, rhs, size);
}

int avm_runtime_strcmp_P(char const* lhs, char const AVM_PROGMEM* rhs)
    __asm__("strcmp_P");

int avm_runtime_strcmp_P(char const* lhs, char const AVM_PROGMEM* rhs) {
    return __avm_strcmp_P(lhs, rhs);
}

int avm_runtime_strlen_P(char const AVM_PROGMEM* str)
    __asm__("strlen_P");

int avm_runtime_strlen_P(char const AVM_PROGMEM* str) {
    return __avm_strlen_P(str);
}

char* avm_runtime_strcpy_P(char* dst, char const AVM_PROGMEM* src, size_t size)
    __asm__("strncpy_P");

char* avm_runtime_strncpy_P(char* dst, char const AVM_PROGMEM* src, size_t size) {
    return __avm_strncpy_P(dst, src, size);
}

char* avm_runtime_strcat_P(char* dst, char const AVM_PROGMEM* src, size_t size)
    __asm__("strncat_P");

char* avm_runtime_strncat_P(char* dst, char const AVM_PROGMEM* src, size_t size) {
    return __avm_strncat_P(dst, src, size);
}

#undef strcpy_P
char* strcpy_P(char* dst, char const AVM_PROGMEM* src) {
    return strncpy_P(dst, src, SIZE_MAX);
}

#undef strcat_P
char* strcat_P(char* dst, char const AVM_PROGMEM* src) {
    return strncat_P(dst, src, SIZE_MAX);
}
