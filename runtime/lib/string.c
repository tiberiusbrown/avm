#define AVM_STRING_IMPLEMENTATION
#include <string.h>

void* memcpy(void* dst, const void* src, size_t size) {
    return __avm_memcpy(dst, src, size);
}

void* memset(void* dst, int value, size_t size) {
    return __avm_memset(dst, value, size);
}

void* memmove(void* dst, const void* src, size_t size) {
    return __avm_memmove(dst, src, size);
}

int memcmp(const void* lhs, const void* rhs, size_t size) {
    return __avm_memcmp(lhs, rhs, size);
}

int strcmp(const char* lhs, const char* rhs) {
    return __avm_strcmp(lhs, rhs);
}

size_t strlen(const char* str) {
    return __avm_strlen(str);
}

char* strncpy(char* dst, const char* src, size_t size) {
    return __avm_strncpy(dst, src, size);
}

char* strncat(char* dst, const char* src, size_t size) {
    return __avm_strncat(dst, src, size);
}

#undef strcpy
char* strcpy(char* dst, const char* src) {
    return strncpy(dst, src, SIZE_MAX);
}

#undef strcat
char* strcat(char* dst, const char* src) {
    return strncat(dst, src, SIZE_MAX);
}
