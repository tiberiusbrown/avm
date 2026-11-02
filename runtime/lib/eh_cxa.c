/* Itanium C++ ABI subset for typed catches, catch-all handlers, and cleanups.
 *
 * Only one exception can be active at a time, and it cannot be rethrown. A throw
 * while one is active, including a throw from a destructor that runs during
 * unwinding, terminates through abort(). Matching is exact: a catch matches when
 * its RTTI descriptor address equals the thrown object's, which the unwinder
 * compares in eh_unwind.c. Inheritance, reference and pointer conversions, and
 * rethrow are not implemented.
 *
 * The header precedes the thrown object and holds the landing context, the
 * resume context, the type-descriptor address, the destructor, and the selector
 * of the matched catch. The unwinder updates both contexts in place. Propagation
 * alternates between cleanup and resume: each cleanup pad runs its destructors
 * and then calls _Unwind_Resume, which continues from the saved resume context.
 * __cxa_end_catch frees the header. The shim that fills the header is in
 * eh_cxa_throw.asm. */

#include <avm/pgmspace.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "eh_unwind_internal.h"

/* Lifecycle of the active exception. The header is ALLOCATED until it is thrown.
 * THROWN means propagation is searching or between landing pads. IN_CLEANUP
 * means a cleanup pad is running and must call _Unwind_Resume. ENTERING_CATCH
 * means the final handler is about to run, and it must call __cxa_begin_catch.
 * CAUGHT means the catch body is running, and __cxa_end_catch frees the header. */
#define AVM_EH_STATE_ALLOCATED      0
#define AVM_EH_STATE_THROWN         1
#define AVM_EH_STATE_CAUGHT         2
#define AVM_EH_STATE_IN_CLEANUP     3
#define AVM_EH_STATE_ENTERING_CATCH 4

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

/* eh_cxa_throw.asm stores the header fields at these offsets, and it computes the
 * object address from the header size. Keep it in sync with this layout. */
_Static_assert(sizeof(struct avm_eh_exception) == 41,
               "__cxa_throw assumes a 41-byte exception header");
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
 * nothing runs while it searches. Phase two starts again from the throw site and
 * runs each cleanup in turn. */
__attribute__((noreturn)) void __avm_eh_throw(struct avm_eh_exception *header) {
    if (active_exception)
        abort();

    header->context.exception = (uint16_t)(uintptr_t)header;
    header->state = AVM_EH_STATE_THROWN;
    active_exception = header;

    header->resume_context = header->context;
    if (!avm_eh_find_handler(header))
        abort();

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

/* The landing pad passes the exception header, and this returns the object. The
 * state must be ENTERING_CATCH, which only the final handler's dispatch sets, so a
 * cleanup pad cannot begin a catch. */
void *__cxa_begin_catch(void *exception) {
    struct avm_eh_exception *header = exception;
    if (header != active_exception || header->state != AVM_EH_STATE_ENTERING_CATCH)
        abort();
    header->state = AVM_EH_STATE_CAUGHT;
    return header + 1;
}

/* Returns the object address of the entering exception without changing its state.
 * Clang calls this for a by-value catch with a copy constructor, and the copy runs
 * before __cxa_begin_catch, so the exception is still ENTERING_CATCH. */
void *__cxa_get_exception_ptr(void *exception) {
    struct avm_eh_exception *header = exception;
    if (header != active_exception || header->state != AVM_EH_STATE_ENTERING_CATCH)
        abort();
    return header + 1;
}

/* Ends the catch that the active exception began. The exception is destroyed and
 * freed here, and only here. Cleanup pads never reach this function. */
void __cxa_end_catch(void) {
    struct avm_eh_exception *header = active_exception;
    if (!header || header->state != AVM_EH_STATE_CAUGHT)
        abort();
    active_exception = NULL;
    if (header->destructor)
        header->destructor(header + 1);
    free(header);
}

/* The AVEH4 unwinder uses no personality routines, so this function is never
 * reached. It exists because LLVM names it in the EH personality, and it
 * terminates if a program ever calls it. */
int __gxx_personality_v0(void) {
    abort();
}
