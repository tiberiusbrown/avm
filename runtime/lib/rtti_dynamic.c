/* Dynamic typeid for polymorphic objects.
 *
 * A polymorphic object's vptr is a 24-bit program address held in three bytes of
 * its own RAM. The vptr names the vtable address point. The Itanium layout places
 * the RTTI slot three bytes below that point, so the descriptor's program address
 * is read from vptr - 3 in program space. The descriptor is at program address P
 * in 0x0500-0xF9FF, and its std::type_info object is at AS0 address P + 0x0600,
 * which is the alias that a static typeid names.
 *
 * The helper has no state, takes no heap, and walks no hierarchy. It may end the
 * program with abort() on an object or vtable that the compiler could not have
 * produced. The descriptor's name is never read here, and the linker checks that
 * the descriptor and its name lie in the window. */

#include <avm/pgmspace.h>
#include <stdint.h>
#include <stdlib.h>

/* Program addresses whose six-byte std::type_info prefix has an AS0 alias. */
#define AVM_RTTI_WINDOW_START 0x000500ul
#define AVM_RTTI_WINDOW_END 0x00fa00ul
#define AVM_RTTI_ALIAS_DELTA 0x000600ul
#define AVM_RTTI_TYPE_INFO_SIZE 6ul
/* The vptr is three bytes, and the RTTI slot lies three bytes below it. */
#define AVM_RTTI_VPTR_SIZE 3u
#define AVM_RTTI_SLOT_OFFSET 3ul

/* Reads a full 24-bit program address. The instruction reads three bytes of
 * program space and keeps all 24 address bits. */
static inline uint32_t read_program_u24(uint32_t address) {
    uint32_t value;
    __asm__ volatile("ldp24 %0, [%1]" : "=q"(value) : "q"(address));
    return value;
}

/* Returns the AS0 pointer to the std::type_info of the object's dynamic type. The
 * object is the AS0 address of the polymorphic subobject whose vptr is read. */
const void *__avm_typeid_from_object(const void *object) {
    if (!object)
        abort();

    /* The vptr occupies three bytes of 16-bit RAM, so the object must leave room
     * for all of them. */
    uint16_t address = (uint16_t)(uintptr_t)object;
    if (address > UINT16_MAX - (AVM_RTTI_VPTR_SIZE - 1))
        abort();

    const uint8_t *bytes = object;
    uint32_t vptr = (uint32_t)bytes[0] | ((uint32_t)bytes[1] << 8) |
                    ((uint32_t)bytes[2] << 16);
    if (vptr < AVM_RTTI_SLOT_OFFSET)
        abort();

    uint32_t rtti = read_program_u24(vptr - AVM_RTTI_SLOT_OFFSET);
    if (rtti == 0)
        abort();
    if (rtti < AVM_RTTI_WINDOW_START || rtti + AVM_RTTI_TYPE_INFO_SIZE > AVM_RTTI_WINDOW_END)
        abort();

    uint32_t alias = rtti + AVM_RTTI_ALIAS_DELTA;
    return (const void *)(uintptr_t)(uint16_t)alias;
}
