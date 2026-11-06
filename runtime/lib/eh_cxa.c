/* Itanium C++ ABI subset for typed catches, catch-all handlers, cleanups, rethrow, and
 * std::exception_ptr.
 *
 * At most one exception is in flight at a time. A throw while one is in flight, including
 * a throw from a destructor that runs during unwinding, terminates through abort(). A
 * throw from a catch body is allowed: the caught exception stays on the caught stack, and
 * the new exception nests inside it. A rethrow (throw;) propagates the innermost caught
 * exception again, with its original header, object, and destructor. The rethrow must come
 * from a catch body that is still CAUGHT, and it keeps the header's handler ownership
 * pending until the abandoned catch's own __cxa_end_catch releases it, so no catch of the
 * same exception begins before that release. std::rethrow_exception applies the same rule
 * to the innermost caught exception. An exception that is caught further out cannot be
 * rethrown while its catch is active, because overlapping catches are unsupported. A catch
 * matches its exact type, or a public base of the thrown class, virtual or nonvirtual,
 * that occurs once in the hierarchy.
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
 * __cxa_end_catch releases the handler's reference, and the last release frees the
 * header. The shims that fill the header are in eh_cxa_throw.asm, eh_cxa_rethrow.asm,
 * and eh_cxa_rethrow_primary.asm. */

#include <avm/pgmspace.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "eh_unwind_internal.h"

/* The exception in flight. A throw sets it, and the catch that begins for it clears it.
 * Unwinding keeps it set between landing pads. */
static struct avm_eh_exception *active_exception;

/* The innermost CAUGHT exception. A catch body pushes its exception here when the catch
 * begins, and __cxa_end_catch pops it. Each entry links to the exception that was caught
 * before it, through the header's next field. */
static struct avm_eh_exception *caught_exceptions;

/* Adds one reference. A header cannot have more references than its 16-bit count holds,
 * so overflow terminates. */
static void eh_retain(struct avm_eh_exception *header) {
    if (header->refcount == UINT16_MAX)
        abort();
    ++header->refcount;
}

/* The lifecycle value of the state, without the rethrow-pending bit. */
static inline uint8_t eh_base_state(const struct avm_eh_exception *header) {
    return header->state & AVM_EH_STATE_MASK;
}

/* Sets the lifecycle value, and keeps the rethrow-pending bit as it was. */
static inline void eh_set_state(struct avm_eh_exception *header, uint8_t state) {
    header->state = (header->state & AVM_EH_RETHROW_PENDING) | state;
}

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
_Static_assert(sizeof(struct avm_eh_exception) == AVM_EH_HEADER_SIZE,
               "exception header size matches assembly shims");
_Static_assert(offsetof(struct avm_eh_exception, context) == 0,
               "exception context offset");
_Static_assert(offsetof(struct avm_eh_exception, type_address) == AVM_EH_TYPE_OFFSET,
               "exception type address offset");
_Static_assert(offsetof(struct avm_eh_exception, destructor) == AVM_EH_DESTRUCTOR_OFFSET,
               "exception destructor offset");
_Static_assert(offsetof(struct avm_eh_exception, size) == AVM_EH_SIZE_OFFSET,
               "exception size offset");
_Static_assert(offsetof(struct avm_eh_exception, state) == AVM_EH_STATE_OFFSET,
               "exception state offset");
_Static_assert(offsetof(struct avm_eh_exception, resume_context) == AVM_EH_RESUME_OFFSET,
               "exception resume context offset");
_Static_assert(offsetof(struct avm_eh_exception, handler_selector) == AVM_EH_SELECTOR_OFFSET,
               "exception handler selector offset");
_Static_assert(offsetof(struct avm_eh_exception, handler_adjustment) == AVM_EH_ADJUSTMENT_OFFSET,
               "exception handler adjustment offset");
_Static_assert(offsetof(struct avm_eh_exception, eh_block_address) == AVM_EH_BLOCK_OFFSET,
               "exception block address offset");
_Static_assert(offsetof(struct avm_eh_exception, eh_block_end) == AVM_EH_BLOCK_END_OFFSET,
               "exception block end offset");
_Static_assert(offsetof(struct avm_eh_exception, eh_function_count) == AVM_EH_FUNCTION_COUNT_OFFSET,
               "exception function count offset");
_Static_assert(offsetof(struct avm_eh_exception, converted_pointer) == AVM_EH_CONVERTED_OFFSET,
               "exception converted pointer offset");
_Static_assert(offsetof(struct avm_eh_exception, handler_pointer_converted) == AVM_EH_CONVERSION_OFFSET,
               "exception conversion mode offset");
_Static_assert(offsetof(struct avm_eh_exception, next) == AVM_EH_NEXT_OFFSET,
               "exception caught-stack link offset");
_Static_assert(offsetof(struct avm_eh_exception, refcount) == AVM_EH_REFCOUNT_OFFSET,
               "exception reference count offset");

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
    header->next = NULL;
    header->refcount = 0;
    return header + 1;
}

void __cxa_free_exception(void *object) {
    free((struct avm_eh_exception *)object - 1);
}

/* typeid yields the AS0 alias of a descriptor, which lies this far above the descriptor's
 * program address. Descriptors live in the flash window below 0xFA00, so the alias fits in
 * 16 bits and removing the delta recovers the program address. See rtti_dynamic.c. */
#define AVM_EH_TYPEINFO_ALIAS_DELTA 0x600u

/* Initializes the header of an exception that is not yet thrown, for std::make_exception_ptr
 * in RTTI builds. The type argument is the typeid alias, so the header receives the same
 * descriptor program address that a throw of that type stores. The destructor runs when the
 * last reference is released. The header starts with no references, and the new exception_ptr
 * takes the first one. */
struct avm_eh_exception *__cxa_init_primary_exception(void *object, const void *type,
                                                      void (*destructor)(void *)) {
    struct avm_eh_exception *header = (struct avm_eh_exception *)object - 1;
    uint16_t program = (uint16_t)((uintptr_t)type - AVM_EH_TYPEINFO_ALIAS_DELTA);
    header->type_address[0] = (uint8_t)program;
    header->type_address[1] = (uint8_t)(program >> 8);
    header->type_address[2] = 0;
    header->destructor = destructor;
    header->state = AVM_EH_STATE_ALLOCATED;
    header->next = NULL;
    header->refcount = 0;
    return header;
}

/* Enters the next landing pad of the active unwind. The header's resume context
 * is the frame cursor, and avm_eh_prepare_next has set the context to the pad. A
 * cleanup pad receives selector 0, and the state is IN_CLEANUP until it calls
 * _Unwind_Resume. The final handler receives the selector that phase one matched,
 * and the state is ENTERING_CATCH until it calls __cxa_begin_catch. A handler's
 * selector is never zero. Every transfer discards the frames of this dispatch,
 * because the installer sets the stack pointer. It is inlined into its two callers,
 * which saves one frame on the guest stack. The rethrow-pending bit is kept on both
 * entries. A pending catch entry is the landing pad of the abandoned catch's own scope.
 * Clang emits that pad with its __cxa_end_catch ahead of the dispatch, and the release
 * clears the bit there. __cxa_begin_catch requires the bit clear, so a pad that does not
 * release the abandoned catch terminates before the new catch body runs. */
static __attribute__((noreturn, always_inline)) inline void
continue_unwind(struct avm_eh_exception *header) {
    uint8_t step = avm_eh_prepare_next(header);
    if (step == AVM_EH_STEP_CLEANUP) {
        eh_set_state(header, AVM_EH_STATE_IN_CLEANUP);
        __avm_eh_install_context(&header->context, 0);
    }
    if (step != AVM_EH_STEP_CATCH || header->handler_selector == 0)
        abort();
    eh_set_state(header, AVM_EH_STATE_ENTERING_CATCH);
    __avm_eh_install_context(&header->context, header->handler_selector);
}

/* Entered by tail transfer from __cxa_throw, after the shim has captured the
 * throw site into the header. The header is in r4. Phase one searches from a copy
 * of the throw site for the handler whose catch matches the thrown type, and
 * nothing runs while it searches. When no frame before the handler has a cleanup,
 * phase one has already reached the handler's landing state, which is installed
 * directly. Otherwise phase two starts again from the throw site and runs each
 * cleanup in turn. */
AVM_EH_PROPAGATE void __avm_eh_throw(struct avm_eh_exception *header) {
    if (active_exception)
        abort();

    header->state = AVM_EH_STATE_THROWN;
    header->handler_pointer_converted = AVM_EH_CONVERT_NONE;
    /* The throw holds one reference, which the handler's __cxa_end_catch releases. */
    eh_retain(header);
    active_exception = header;

    if (!avm_eh_open_exception(header))
        abort();
    header->resume_context = header->context;
    if (!avm_eh_find_handler(header))
        abort();

    if (header->state == AVM_EH_STATE_THROWN) {
        header->context = header->resume_context;

        header->state = AVM_EH_STATE_ENTERING_CATCH;
        __avm_eh_install_context(&header->context, header->handler_selector);
    }

    header->state = AVM_EH_STATE_THROWN;
    header->resume_context = header->context;
    continue_unwind(header);
}

/* Returns the header of the active exception for the __cxa_rethrow shim. The exception
 * must be CAUGHT, which holds only while a catch body that began it is running. A
 * rethrow anywhere else terminates here, and no exception is synthesized. */
struct avm_eh_exception *__avm_eh_rethrow_header(void) {
    struct avm_eh_exception *header = caught_exceptions;
    if (!header || header->state != AVM_EH_STATE_CAUGHT)
        abort();
    return header;
}

/* Entered by tail transfer from __cxa_rethrow, after the shim has captured the rethrow
 * site into the header's context. The header is in r4, and it is the active CAUGHT
 * exception. Its object, type, destructor, and size are not written. The handler fields
 * are reset, and the state becomes THROWN with the pending bit. Both phases then run from
 * the rethrow site. Phase one validates that a handler exists, and phase two installs the
 * first pad that matches. That pad always comes from the rethrow site's own scope, or from
 * a frame outward of it. The rethrow never takes the direct handler path of __avm_eh_throw,
 * because a handler is entered only through a landing pad that releases the abandoned catch. */
AVM_EH_PROPAGATE void __avm_eh_rethrow(struct avm_eh_exception *header) {
    if (!header || header != caught_exceptions || header->state != AVM_EH_STATE_CAUGHT ||
        active_exception)
        abort();

    header->handler_selector = 0;
    header->handler_adjustment = 0;
    header->handler_pointer_converted = AVM_EH_CONVERT_NONE;
    header->state = AVM_EH_STATE_THROWN | AVM_EH_RETHROW_PENDING;
    /* The header stays on the caught stack until the abandoned catch releases it, and it is
     * also the exception in flight. The caught reference moves with the rethrow. */
    active_exception = header;
    header->resume_context = header->context;

    if (!avm_eh_open_exception(header))
        abort();
    if (!avm_eh_find_handler(header))
        abort();

    header->state = AVM_EH_STATE_THROWN | AVM_EH_RETHROW_PENDING;
    header->resume_context = header->context;
    continue_unwind(header);
}

/* Entered by tail transfer from __avm_rethrow_primary_exception, after the shim has captured
 * the call site into the header's context. The header names an object that a
 * std::exception_ptr holds. When it is the innermost caught exception, the rethrow takes
 * over that catch's reference, exactly as a rethrow does, and the abandoned catch releases
 * it on the way out. Otherwise the exception is ALLOCATED, and the rethrow throws it anew
 * with one more reference. Any other state terminates. */
AVM_EH_PROPAGATE void __avm_eh_rethrow_primary(struct avm_eh_exception *header) {
    if (!header)
        abort();
    if (header->state == AVM_EH_STATE_CAUGHT && header == caught_exceptions)
        __avm_eh_rethrow(header);
    if (header->state != AVM_EH_STATE_ALLOCATED)
        abort();
    __avm_eh_throw(header);
}

/* Called by a cleanup pad after its destructors have run. The exception pointer
 * is the header that the pad received in r4. Resumption continues from the resume
 * context, which the previous step saved before entering this pad. A pending rethrow
 * may resume here, so the pending bit is kept. Only the abandoned catch's cleanup,
 * through __cxa_end_catch, clears it. */
AVM_EH_PROPAGATE void __avm_eh_resume(struct avm_eh_exception *header) {
    if (!header || header != active_exception ||
        eh_base_state(header) != AVM_EH_STATE_IN_CLEANUP)
        abort();

    eh_set_state(header, AVM_EH_STATE_THROWN);
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
    /* The catch body now owns the exception. It is no longer in flight, and it nests
     * inside any exception whose catch body is still running. */
    header->state = AVM_EH_STATE_CAUGHT;
    active_exception = NULL;
    header->next = caught_exceptions;
    caught_exceptions = header;
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

/* Ends the innermost catch, which is the top of the caught stack. That catch may be
 * the one whose cleanup runs while a newer exception unwinds through it, so the exception
 * in flight is not necessarily the one that ends. The handler's reference is released, and
 * the last release destroys the complete thrown object, not the catch object, which may be
 * a base subobject, and frees the header. A std::exception_ptr copy keeps the header alive,
 * and it is then ALLOCATED.
 *
 * A pending rethrow reaches this function from the cleanup of the abandoned catch. That
 * landing pad may be entered in either base state. An IN_CLEANUP pad resumes afterward,
 * and an ENTERING_CATCH pad dispatches to the matched handler afterward. The release pops
 * the caught stack and clears the pending bit, keeps the base state, and returns. The
 * rethrow keeps the handler's reference, so nothing is destroyed or freed here. Any other
 * state that reaches here is an error, including a second release. */
void __cxa_end_catch(void) {
    struct avm_eh_exception *header = caught_exceptions;
    if (!header)
        abort();
    if (header->state & AVM_EH_RETHROW_PENDING) {
        uint8_t base = eh_base_state(header);
        if (header != active_exception ||
            (base != AVM_EH_STATE_IN_CLEANUP && base != AVM_EH_STATE_ENTERING_CATCH))
            abort();
        caught_exceptions = header->next;
        header->next = NULL;
        header->state = base;
        return;
    }
    if (header->state != AVM_EH_STATE_CAUGHT || header->refcount == 0)
        abort();
    caught_exceptions = header->next;
    header->next = NULL;
    if (--header->refcount != 0) {
        header->state = AVM_EH_STATE_ALLOCATED;
        return;
    }
    if (header->destructor)
        header->destructor(header + 1);
    free(header);
}

/* Returns the object of the innermost handled exception, after adding a reference for the
 * caller's std::exception_ptr, or returns NULL when no catch body is running. A rethrow
 * that has not yet left its abandoned catch is not a handled exception, so it yields NULL. */
void *__cxa_current_primary_exception(void) {
    struct avm_eh_exception *header = caught_exceptions;
    if (!header || header->state != AVM_EH_STATE_CAUGHT)
        return NULL;
    eh_retain(header);
    return header + 1;
}

/* Adds a reference to the exception that object belongs to. A null object does nothing. */
void __cxa_increment_exception_refcount(void *object) {
    if (object)
        eh_retain((struct avm_eh_exception *)object - 1);
}

/* Releases a reference to the exception that object belongs to. The last reference destroys
 * the object and frees the header. A thrown or caught exception holds a reference of its own,
 * so the count reaches zero only after that exception has ended. A null object does nothing. */
void __cxa_decrement_exception_refcount(void *object) {
    if (!object)
        return;
    struct avm_eh_exception *header = (struct avm_eh_exception *)object - 1;
    if (header->refcount == 0)
        abort();
    if (--header->refcount != 0)
        return;
    if (header->state != AVM_EH_STATE_ALLOCATED)
        abort();
    if (header->destructor)
        header->destructor(header + 1);
    free(header);
}

/* Returns 1 while an exception is in flight, and 0 otherwise. A destructor that runs during
 * unwinding observes 1. A rethrow in progress also counts as in flight. */
int __cxa_uncaught_exceptions(void) {
    return active_exception ? 1 : 0;
}

/* The AVEH5 unwinder uses no personality routines, so this function is never
 * reached. It exists because LLVM names it in the EH personality, and it
 * terminates if a program ever calls it. */
int __gxx_personality_v0(void) {
    abort();
}
