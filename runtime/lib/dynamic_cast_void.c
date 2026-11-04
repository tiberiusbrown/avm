/* Runtime dynamic_cast to void* for polymorphic AVM objects.
 *
 * Clang lowers a dynamic_cast to void* to __avm_dynamic_cast_to_void. The result is the
 * complete object of the source subobject. It needs only the signed 24-bit offset-to-top,
 * which lies at vptr - 6 in program space, so the RTTI slot and the class hierarchy are never
 * read.
 *
 * This routine is its own archive member, separate from dynamic_cast.c, which defines
 * __dynamic_cast. A program that casts only to void* therefore never extracts the class-cast
 * matcher, and the linker does not activate its mixed-RTTI check. The object must stay free of
 * references to __dynamic_cast, to the typeid helper, to the RTTI support vtables, and to the
 * exception runtime. Its only external reference is abort(), for malformed object
 * representations.
 *
 * The source's vptr is three bytes of its own AS0 RAM. The routine aborts on a source that cannot
 * hold three vptr bytes, on a vptr below the address point, and on a complete object outside the
 * 16-bit AS0 range. It never allocates, and it keeps no static state. */

#include <avm/pgmspace.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>

/* The vptr is three bytes, and the offset-to-top lies six bytes below the address point. */
#define AVM_DCV_VPTR_SIZE 3u
#define AVM_DCV_TOP_SLOT 6ul

/* Reads a full 24-bit program address. The instruction reads three bytes of program space and
 * keeps all 24 address bits, as dynamic_cast.c does. */
static inline uint32_t read_flash_u24(uint32_t address) {
    uint32_t value;
    __asm__ volatile("ldp24 %0, [%1]" : "=q"(value) : "q"(address));
    return value;
}

/* Reads a signed 24-bit program-space value. The result is sign-extended from bit 23, so it is
 * exact in 32 bits. */
static inline int32_t read_flash_i24(uint32_t address) {
    uint32_t raw = read_flash_u24(address);
    if (raw & 0x800000ul)
        return (int32_t)raw - 0x1000000l;
    return (int32_t)raw;
}

/* Reads a 24-bit value from three little-endian bytes of AS0 memory. The caller checks that all
 * three bytes lie below 0x10000. */
static inline uint32_t read_ram_u24(uint16_t address) {
    const uint8_t *bytes = (const uint8_t *)(uintptr_t)address;
    return (uint32_t)bytes[0] | ((uint32_t)bytes[1] << 8) | ((uint32_t)bytes[2] << 16);
}

/* dynamic_cast<void *>. A null source yields null. Otherwise the complete object is the source
 * plus the signed offset-to-top, and it must be an AS0 address. */
void *__avm_dynamic_cast_to_void(const void *sub) {
    if (!sub)
        return NULL;

    uint16_t address = (uint16_t)(uintptr_t)sub;
    if (address > 0x10000u - AVM_DCV_VPTR_SIZE)
        abort();
    uint32_t vptr = read_ram_u24(address);
    if (vptr < AVM_DCV_TOP_SLOT)
        abort();

    int32_t where = (int32_t)address + read_flash_i24(vptr - AVM_DCV_TOP_SLOT);
    if (where < 0 || where > 0xffff)
        abort();
    return (void *)(uintptr_t)(uint16_t)where;
}
