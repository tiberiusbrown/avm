#define AVM_PGMSPACE_IMPLEMENTATION
#include <avm/pgmspace.h>
void* memcpy_P(void* dst, void const AVM_PROGMEM* src, size_t size) {
    return __avm_memcpy_P(dst, src, size);
}

int memcmp_P(void const* lhs, void const AVM_PROGMEM* rhs, size_t size) {
    return __avm_memcmp_P(lhs, rhs, size);
}

int strcmp_P(char const* lhs, char const AVM_PROGMEM* rhs) {
    return __avm_strcmp_P(lhs, rhs);
}

size_t strlen_P(char const AVM_PROGMEM* str) {
    return __avm_strlen_P(str);
}

char* strncpy_P(char* dst, char const AVM_PROGMEM* src, size_t size) {
    return __avm_strncpy_P(dst, src, size);
}

char* strncat_P(char* dst, char const AVM_PROGMEM* src, size_t size) {
    return __avm_strncat_P(dst, src, size);
}

#undef strcpy_P
char* strcpy_P(char* dst, char const AVM_PROGMEM* src) {
    return __avm_strncpy_P(dst, src, SIZE_MAX);
}

#undef strcat_P
char* strcat_P(char* dst, char const AVM_PROGMEM* src) {
    return __avm_strncat_P(dst, src, SIZE_MAX);
}
