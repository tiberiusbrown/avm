//===--- pgmspace.h - AVM program-space convenience API -----------------===//

#ifndef __AVM_PGMSPACE_H
#define __AVM_PGMSPACE_H

#include <stdint.h>

#define AVM_PROGMEM __attribute__((address_space(1)))

#define AVM_PSTR(s) __builtin_avm_flash_string(s)
#define F(s) AVM_PSTR(s)

void* memcpy_P(void* dst, const void AVM_PROGMEM* src, uint16_t size);

#define memcpy_P(dst, src, size) __builtin_avm_memcpy_p((dst), (src), (size))

#endif // __AVM_PGMSPACE_H
