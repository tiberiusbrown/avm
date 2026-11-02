/* Itanium C++ ABI subset for typed catches, catch-all handlers, and cleanups.
 *
 * Only one exception can be active at a time, and it cannot be rethrown. A throw
 * while one is active, including a throw from a destructor that runs during
 * unwinding, terminates through abort(). A catch matches its exact type, or a public
 * base of the thrown class, virtual or nonvirtual, that occurs once in the hierarchy.
 * The unwinder compares types and walks the base subobjects in eh_unwind.c, reading
 * the thrown object's vptrs for a virtual base. A base catch binds to the base
 * subobject, and the handler adjustment locates it.
 *
 * A pointer catch matches a thrown pointer by the conversions of C++ pointer
 * conversion: qualification, a derived pointer to a public base pointer, a pointer to
 * void, a function pointer that drops noexcept, and a null pointer. The matched value
 * is formed in the header's converted buffer, so the thrown pointer is never changed.
 * A catch of a non-const pointer by reference matches only the exact pointer type, and
 * it binds to the thrown pointer object itself.
 *
 * The header precedes the thrown object and holds the landing context, the
 * resume context, the type-descriptor address, the destructor, the selector of
 * the matched catch, its base adjustment, and the conversion of a pointer catch. The
 * unwinder updates both contexts in place. Propagation
 * alternates between cleanup and resume: each cleanup pad runs its destructors
 * and then calls _Unwind_Resume, which continues from the saved resume context.
 * __cxa_end_catch frees the header. The shim that fills the header is in
 * eh_cxa_throw.asm. Rethrow and nested exceptions are not implemented. */

#include <avm/pgmspace.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "eh_unwind_internal.h"

/* The one active exception. It is set by the throw and cleared by
 * __cxa_end_catch. */
static struct avm_eh_exception *active_exception;

/* Itanium RTTI support vtables for the descriptors that Clang emits. A descriptor
 * refers to the address point, which lies two 24-bit entries past the symbol,
 * so each object begins with those two entries. One reserved entry follows the
 * address point, which keeps the point inside its own object, so no two vtables
 * can share an address point. Nothing reads these entries or calls them yet, and
 * they are zero. They live in program space, where the descriptors and their
 * vtable references are placed. Each vtable is defined here and linked only when a
 * descriptor references it. */
const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv123__fundamental_type_infoE[9] = {0};
const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv117__class_type_infoE[9] = {0};
const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv120__si_class_type_infoE[9] = {0};
const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv121__vmi_class_type_infoE[9] = {0};
const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv119__pointer_type_infoE[9] = {0};
const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv116__enum_type_infoE[9] = {0};
const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv120__function_type_infoE[9] = {0};
const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv129__pointer_to_member_type_infoE[9] = {0};
const uint8_t AVM_PROGMEM _ZTVN10__cxxabiv117__array_type_infoE[9] = {0};
/* The marker that a catch of a non-const pointer by reference names. Its descriptor is
 * nine bytes: this vtable's address point, three reserved bytes, and the pointer's own
 * descriptor. The runtime classifies it by the vtable alone. */
const uint8_t AVM_PROGMEM __avm_eh_exact_pointer_ref_type_info[9] = {0};

/* eh_cxa_throw.asm stores the header fields at these offsets, and it computes the
 * object address from the header size. Keep it in sync with this layout. */
_Static_assert(sizeof(struct avm_eh_exception) == 55,
               "__cxa_throw assumes a 55-byte exception header");
_Static_assert(offsetof(struct avm_eh_exception, context) == 0,
               "exception context offset");
_Static_assert(offsetof(struct avm_eh_exception, type_address) == 15,
               "exception type address offset");
_Static_assert(offsetof(struct avm_eh_exception, destructor) == 18,
               "exception destructor offset");
_Static_assert(offsetof(struct avm_eh_exception, size) == 21,
               "exception size offset");
_Static_assert(offsetof(struct avm_eh_exception, state) == 23,
               "exception state offset");
_Static_assert(offsetof(struct avm_eh_exception, resume_context) == 24,
               "exception resume context offset");
_Static_assert(offsetof(struct avm_eh_exception, handler_selector) == 39,
               "exception handler selector offset");
_Static_assert(offsetof(struct avm_eh_exception, handler_adjustment) == 41,
               "exception handler adjustment offset");
_Static_assert(offsetof(struct avm_eh_exception, eh_block_address) == 43,
               "exception block address offset");
_Static_assert(offsetof(struct avm_eh_exception, eh_block_end) == 46,
               "exception block end offset");
_Static_assert(offsetof(struct avm_eh_exception, eh_function_count) == 49,
               "exception function count offset");
_Static_assert(offsetof(struct avm_eh_exception, converted_pointer) == 51,
               "exception converted pointer offset");
_Static_assert(offsetof(struct avm_eh_exception, handler_pointer_converted) == 54,
               "exception conversion mode offset");

void *__cxa_allocate_exception(size_t size) {
    if (size > UINT16_MAX - sizeof(struct avm_eh_exception))
        abort();
    struct avm_eh_exception *header =
        malloc(sizeof(struct avm_eh_exception) + size);
    if (!header)
        abort();
    memset(header->type_address, 0, sizeof header->type_address);
    header->destructor = NULL;
    header->size = (uint16_t)size;
    header->state = AVM_EH_STATE_ALLOCATED;
    header->handler_selector = 0;
    header->handler_adjustment = 0;
    header->handler_pointer_converted = AVM_EH_CONVERT_NONE;
    return header + 1;
}

void __cxa_free_exception(void *object) {
    free((struct avm_eh_exception *)object - 1);
}

/* Enters the next landing pad of the active unwind. The header's resume context
 * is the frame cursor, and avm_eh_prepare_next has set the context to the pad. A
 * cleanup pad receives selector 0, and the state is IN_CLEANUP until it calls
 * _Unwind_Resume. The final handler receives the selector that phase one matched,
 * and the state is ENTERING_CATCH until it calls __cxa_begin_catch. A handler's
 * selector is never zero. Every transfer discards the frames of this dispatch,
 * because the installer sets the stack pointer. It is inlined into its two callers,
 * which saves one frame on the guest stack. */
static __attribute__((noreturn, always_inline)) inline void
continue_unwind(struct avm_eh_exception *header) {
    uint8_t step = avm_eh_prepare_next(header);
    if (step == AVM_EH_STEP_CLEANUP) {
        header->state = AVM_EH_STATE_IN_CLEANUP;
        __avm_eh_install_context(&header->context, 0);
    }
    if (step != AVM_EH_STEP_CATCH || header->handler_selector == 0)
        abort();
    header->state = AVM_EH_STATE_ENTERING_CATCH;
    __avm_eh_install_context(&header->context, header->handler_selector);
}

/* Entered by tail transfer from __cxa_throw, after the shim has captured the
 * throw site into the header. The header is in r4. Phase one searches from a copy
 * of the throw site for the handler whose catch matches the thrown type, and
 * nothing runs while it searches. When no frame before the handler has a cleanup,
 * phase one has already reached the handler's landing state, which is installed
 * directly. Otherwise phase two starts again from the throw site and runs each
 * cleanup in turn. */
__attribute__((noreturn)) void __avm_eh_throw(struct avm_eh_exception *header) {
    if (active_exception)
        abort();

    header->context.exception = (uint16_t)(uintptr_t)header;
    header->state = AVM_EH_STATE_THROWN;
    header->handler_pointer_converted = AVM_EH_CONVERT_NONE;
    active_exception = header;

    if (!avm_eh_open_exception(header))
        abort();
    header->resume_context = header->context;
    if (!avm_eh_find_handler(header))
        abort();

    if (header->state == AVM_EH_STATE_THROWN) {
        header->context = header->resume_context;
        header->context.exception = (uint16_t)(uintptr_t)header;
        header->state = AVM_EH_STATE_ENTERING_CATCH;
        __avm_eh_install_context(&header->context, header->handler_selector);
    }

    header->state = AVM_EH_STATE_THROWN;
    header->resume_context = header->context;
    continue_unwind(header);
}

/* Called by a cleanup pad after its destructors have run. The exception pointer
 * is the header that the pad received in r4. Resumption continues from the resume
 * context, which the previous step saved before entering this pad. */
__attribute__((noreturn)) void _Unwind_Resume(void *exception) {
    struct avm_eh_exception *header = exception;
    if (!header || header != active_exception ||
        header->state != AVM_EH_STATE_IN_CLEANUP)
        abort();

    header->state = AVM_EH_STATE_THROWN;
    continue_unwind(header);
}

/* Forms the value of a pointer handler in the header's converted buffer, and returns the
 * buffer's address. The thrown pointer is read from the object and is never written. A
 * data pointer is the thrown value plus the signed adjustment, and it must stay in 16-bit
 * RAM. A null value stays null, so a base conversion of a null pointer is zero. A program
 * pointer is copied with no adjustment. A std::nullptr_t gives zero, and it reads nothing.
 * The thrown object's size must match the width of the conversion. */
static void *convert_pointer(struct avm_eh_exception *header) {
    const uint8_t *object = (const uint8_t *)(header + 1);
    uint8_t *converted = header->converted_pointer;
    switch (header->handler_pointer_converted) {
    case AVM_EH_CONVERT_NULL:
        memset(converted, 0, sizeof header->converted_pointer);
        break;
    case AVM_EH_CONVERT_DATA: {
        if (header->size != 2)
            abort();
        int32_t value = object[0] | ((int32_t)object[1] << 8);
        if (value != 0) {
            value += (int16_t)header->handler_adjustment;
            if (value < 0 || value > UINT16_MAX)
                abort();
        }
        converted[0] = (uint8_t)value;
        converted[1] = (uint8_t)((uint32_t)value >> 8);
        converted[2] = 0;
        break;
    }
    case AVM_EH_CONVERT_PROGRAM:
        if (header->size != 3 || header->handler_adjustment != 0)
            abort();
        memcpy(converted, object, 3);
        break;
    default:
        abort();
    }
    return converted;
}

/* Returns the catch object of the header: the thrown object for an exact or catch-all
 * match, the base subobject that phase one matched, or the converted buffer of a pointer
 * handler. The adjustment must lie inside the thrown object, and the adjusted address must
 * lie in 16-bit RAM. The allocation itself is not moved, so the destructor and the free
 * still use the header. */
static void *catch_object(struct avm_eh_exception *header) {
    if (header->handler_pointer_converted != AVM_EH_CONVERT_NONE)
        return convert_pointer(header);
    uint16_t adjustment = header->handler_adjustment;
    if (adjustment != 0 && adjustment >= header->size)
        abort();
    uint32_t address = (uint32_t)(uintptr_t)(header + 1) + adjustment;
    if (address > UINT16_MAX)
        abort();
    return (void *)(uintptr_t)address;
}

/* The landing pad passes the exception header, and this returns the catch object. The
 * state must be ENTERING_CATCH, which only the final handler's dispatch sets, so a
 * cleanup pad cannot begin a catch. */
void *__cxa_begin_catch(void *exception) {
    struct avm_eh_exception *header = exception;
    if (header != active_exception || header->state != AVM_EH_STATE_ENTERING_CATCH)
        abort();
    void *object = catch_object(header);
    header->state = AVM_EH_STATE_CAUGHT;
    return object;
}

/* Returns the catch object of the entering exception without changing its state.
 * Clang calls this for a by-value catch with a copy constructor, and the copy runs
 * before __cxa_begin_catch, so the exception is still ENTERING_CATCH. The copy reads
 * the base subobject that the adjustment locates, never the start of the object. */
void *__cxa_get_exception_ptr(void *exception) {
    struct avm_eh_exception *header = exception;
    if (header != active_exception || header->state != AVM_EH_STATE_ENTERING_CATCH)
        abort();
    return catch_object(header);
}

/* Ends the catch that the active exception began. The exception is destroyed and
 * freed here, and only here. The destructor receives the complete thrown object, not
 * the catch object, which may be a base subobject. Cleanup pads never reach this
 * function. */
void __cxa_end_catch(void) {
    struct avm_eh_exception *header = active_exception;
    if (!header || header->state != AVM_EH_STATE_CAUGHT)
        abort();
    active_exception = NULL;
    if (header->destructor)
        header->destructor(header + 1);
    free(header);
}

/* The AVEH5 unwinder uses no personality routines, so this function is never
 * reached. It exists because LLVM names it in the EH personality, and it
 * terminates if a program ever calls it. */
int __gxx_personality_v0(void) {
    abort();
}
