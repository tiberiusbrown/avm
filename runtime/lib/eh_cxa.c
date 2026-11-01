/* Itanium C++ ABI subset for catch-all exceptions.
 *
 * Only one exception can be active at a time, and it cannot be rethrown.
 * Typed catches, cleanup landing pads, and rethrow are not implemented. A
 * program that needs them fails at link time or at the first unsupported call,
 * which terminates with abort() before unwinding.
 *
 * The header precedes the thrown object and holds the throwing frame's context,
 * the type token, and the destructor. The unwinder updates the context in place,
 * and __cxa_end_catch frees the header. The shim that fills the header is in
 * eh_cxa_throw.asm.
 *
 * Type descriptors are opaque tokens here. Each _ZTI symbol is a one-byte
 * placeholder whose address is the token, so catch-all code never reads it.
 * Typed matching will need a flash-resident RTTI layout, and it must not reuse
 * these placeholders. */

#include <stdint.h>
#include <stdlib.h>

#include "eh_unwind_internal.h"

#define AVM_EH_STATE_THROWN 1
#define AVM_EH_STATE_CAUGHT 2

/* The one active exception. It is set by the throw and cleared by
 * __cxa_end_catch. */
static struct avm_eh_exception *active_exception;

/* Opaque type-descriptor tokens for the scalar types that the Stage 1 tests
 * throw. Their addresses are the only values compared. */
const char _ZTIi[1] = {0};

/* eh_cxa_throw.asm stores the header fields at these offsets, and it computes the
 * object address from the header size. Keep it in sync with this layout. */
_Static_assert(sizeof(struct avm_eh_exception) == 23,
               "__cxa_throw assumes a 23-byte exception header");
_Static_assert(offsetof(struct avm_eh_exception, type) == 15,
               "exception type offset");
_Static_assert(offsetof(struct avm_eh_exception, destructor) == 17,
               "exception destructor offset");

void *__cxa_allocate_exception(size_t size) {
    if (size > UINT16_MAX - sizeof(struct avm_eh_exception))
        abort();
    struct avm_eh_exception *header =
        malloc(sizeof(struct avm_eh_exception) + size);
    if (!header)
        abort();
    header->type = NULL;
    header->destructor = NULL;
    header->size = (uint16_t)size;
    header->state = 0;
    return header + 1;
}

void __cxa_free_exception(void *object) {
    free((struct avm_eh_exception *)object - 1);
}

/* Entered by tail transfer from __cxa_throw, after the shim has captured the
 * throw site into the header. The header is in r4, and the search runs in the
 * header's own context, so the throwing frame needs no copy on the stack. */
__attribute__((noreturn)) void __avm_eh_throw(struct avm_eh_exception *header) {
    if (active_exception)
        abort();

    header->context.exception = (uint16_t)(uintptr_t)header;
    header->state = AVM_EH_STATE_THROWN;
    active_exception = header;
    if (!avm_eh_find_handler(&header->context))
        abort();
    __avm_eh_install_context(&header->context);
}

/* The landing pad passes the exception header, and this returns the object. */
void *__cxa_begin_catch(void *exception) {
    struct avm_eh_exception *header = exception;
    if (header != active_exception || header->state != AVM_EH_STATE_THROWN)
        abort();
    header->state = AVM_EH_STATE_CAUGHT;
    return header + 1;
}

void __cxa_end_catch(void) {
    struct avm_eh_exception *header = active_exception;
    if (!header || header->state != AVM_EH_STATE_CAUGHT)
        abort();
    active_exception = NULL;
    if (header->destructor)
        header->destructor(header + 1);
    free(header);
}

/* The Stage 1 unwinder uses AVEH3 instead of personality routines, so this
 * function is never reached. It exists because LLVM names it in the EH
 * personality, and it terminates if a program ever calls it. */
int __gxx_personality_v0(void) {
    abort();
}
