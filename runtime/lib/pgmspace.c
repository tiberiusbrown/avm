#include <avm/pgmspace.h>

/*
 * Clang reserves the source spelling memcpy_P as an AVM target builtin, so it
 * cannot also be used as the identifier of a function definition. Define the
 * wrapper with a private C identifier and give it the public ELF symbol name.
 */
void* avm_runtime_memcpy_P(void* dst, const void AVM_PROGMEM* src, uint16_t size)
    __asm__("memcpy_P");

void* avm_runtime_memcpy_P(void* dst, const void AVM_PROGMEM* src, uint16_t size) {
    return __avm_memcpy_P(dst, src, size);
}
