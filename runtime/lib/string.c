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
