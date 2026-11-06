/* Internal interface between the C++ exception runtime and its assembly
 * helpers. eh_context.asm and eh_cxa_throw.asm read these structures by fixed
 * offsets, so every change here must update those files and the _Static_asserts
 * in eh_unwind.c and eh_cxa.c. */
#ifndef AVM_EH_UNWIND_INTERNAL_H
#define AVM_EH_UNWIND_INTERNAL_H

#include <stddef.h>
#include <stdint.h>

/* The shims have captured r0-r3 in the header before entering propagation.
 * These internal entries never return, so they need no second copy of r0-r2
 * on the stack. R3 and all argument locations retain the C ABI. */
#ifdef __AVM__
#define AVM_EH_PROPAGATE __attribute__((noreturn, preserve_none))
#else
#define AVM_EH_PROPAGATE __attribute__((noreturn))
#endif

/* Register state in one frame: the stack pointer, a 24-bit program address,
 * the callee-saved r0-r3 values, and the exception header passed in r4. The
 * program address is split so that the assembly can load it with 16-bit and
 * 8-bit accesses. */
struct avm_eh_context {
    uint16_t sp;        /* +0  */
    uint16_t pc_low;    /* +2  bits 15:0 of the program address */
    uint8_t pc_high;    /* +4  bits 23:16 of the program address */
    uint16_t r[4];      /* +5  r0, +7 r1, +9 r2, +11 r3 */
    uint16_t exception; /* +13 exception header pointer for the landing pad */
};

/* Header that precedes each thrown object. The context is the state installed
 * when a landing pad is entered. The resume context is the frame cursor from
 * which propagation continues, and it is kept in the header so that no unwind
 * state lives on the guest stack. The throw shim stores the throwing frame's
 * registers, the type-descriptor program address, and the destructor program
 * address. The two program addresses are 24-bit, so they are stored as bytes
 * and never as 16-bit data pointers. The handler selector is the LLVM type ID
 * that phase one matched, and phase two passes it to the handler's pad. The
 * adjustment is the byte offset of the caught base subobject within the thrown
 * object, and it is zero for an exact or catch-all match. A pointer conversion keeps the
 * adjustment as a signed 16-bit byte offset, because a virtual base can lie before its
 * derived subobject. The block fields cache the AVEH5 block that avm_eh_open_exception
 * validated, so each lookup in this throw uses the same block address, end, and function
 * count without reading the anchor again.
 *
 * The converted pointer holds the caught pointer value of a pointer handler, when the
 * matched clause converts it. The original thrown pointer is never changed, and the
 * conversion mode says how the converted value is formed. The buffer is three bytes, so
 * it holds a 24-bit program pointer, and a 16-bit data pointer uses its first two. */
struct avm_eh_exception {
    struct avm_eh_context context;        /* +0  landing state; exception = this header */
    uint8_t type_address[3];              /* +15 type-descriptor program address (r6:r7) */
    void (*destructor)(void *);           /* +18 program address (stack argument) */
    uint16_t size;                        /* +21 object size */
    uint8_t state;                        /* +23 AVM_EH_STATE_* | AVM_EH_RETHROW_PENDING */
    struct avm_eh_context resume_context; /* +24 frame cursor for the next step */
    uint16_t handler_selector;            /* +39 selector of the matched catch */
    uint16_t handler_adjustment;          /* +41 byte offset of the matched base subobject */
    uint8_t eh_block_address[3];          /* +43 program address of the AVEH5 block */
    uint8_t eh_block_end[3];              /* +46 program address of the block end */
    uint16_t eh_function_count;           /* +49 number of function index entries */
    uint8_t converted_pointer[3];         /* +51 converted value of the pointer handler */
    uint8_t handler_pointer_converted;    /* +54 AVM_EH_CONVERT_* of the matched catch */
    struct avm_eh_exception *next;        /* +55 next exception on the caught stack */
    uint16_t refcount;                    /* +57 in-flight or handler reference, plus exception_ptr copies */
};

/* The header is followed by the thrown object. The reference count holds one reference
 * while the exception is thrown or caught, and one for each std::exception_ptr that names
 * the object. The last release destroys the object and frees the header. The caught
 * stack links each CAUGHT exception to the one caught before it, so nested catch bodies
 * unwind in order. */
#define AVM_EH_HEADER_SIZE 59

/* How the selected handler receives a pointer. A clause that matches the thrown type
 * exactly, or a catch-all, leaves the handler with the thrown object, so its mode is NONE.
 * DATA is a 16-bit data pointer, formed from the thrown value and the adjustment. PROGRAM
 * is a 24-bit function or program-memory pointer, formed from the thrown value, with no
 * adjustment. NULL is a std::nullptr_t, whose converted value is zero. */
#define AVM_EH_CONVERT_NONE    0
#define AVM_EH_CONVERT_DATA    1
#define AVM_EH_CONVERT_PROGRAM 2
#define AVM_EH_CONVERT_NULL    3

/* Lifecycle of an exception. The header is ALLOCATED until it is thrown, and again after
 * its last catch ends while std::exception_ptr copies still name it. THROWN means
 * propagation is searching or between landing pads, and only one exception is in flight at
 * a time. IN_CLEANUP means a cleanup pad is running and must call _Unwind_Resume.
 * ENTERING_CATCH means the final handler is about to run, and it must call
 * __cxa_begin_catch. CAUGHT means a catch body is running; such an exception is on the
 * caught stack, and __cxa_end_catch ends it. SEARCH_HAS_CLEANUP means phase one passed a
 * frame with a cleanup and no matching catch, so the handler must be reached through phase
 * two. The low seven bits hold this lifecycle. */
#define AVM_EH_STATE_ALLOCATED          0
#define AVM_EH_STATE_THROWN             1
#define AVM_EH_STATE_CAUGHT             2
#define AVM_EH_STATE_IN_CLEANUP         3
#define AVM_EH_STATE_ENTERING_CATCH     4
#define AVM_EH_STATE_SEARCH_HAS_CLEANUP 5

/* The high bit of the state marks a rethrow in progress. The caught exception is
 * propagating again, and the cleanup of the abandoned catch has not yet released its
 * handler ownership. It marks the current propagation of the one exception, and it
 * is not a second exception. */
#define AVM_EH_STATE_MASK        0x7fu
#define AVM_EH_RETHROW_PENDING   0x80u

/* Results of avm_eh_prepare_next. A cleanup or catch step fills the header's
 * context. */
#define AVM_EH_STEP_INVALID 0
#define AVM_EH_STEP_CLEANUP 1
#define AVM_EH_STEP_CATCH   2

/* Non-returning installer. Loads the landing pad, stack pointer, and r0-r3 from
 * the context. It passes the exception header in r4 and the selector in r5: 0
 * for a cleanup-only landing pad, and the handler's LLVM type ID for a catch. */
__attribute__((noreturn)) void
__avm_eh_install_context(const struct avm_eh_context *context, uint16_t selector);

/* Entry from the __cxa_throw shim, which tail-jumps here with the header in r4.
 * Searches for a handler and never returns. */
AVM_EH_PROPAGATE void __avm_eh_throw(struct avm_eh_exception *header);

/* Returns the header of the innermost caught exception for the __cxa_rethrow shim. That
 * exception must be CAUGHT, or the call terminates. */
struct avm_eh_exception *__avm_eh_rethrow_header(void);

/* Entry from the __cxa_rethrow shim, which tail-jumps here with the header in r4 after
 * capturing the rethrow site into the header's context. It restarts both phases from that
 * site, and it never returns. */
AVM_EH_PROPAGATE void __avm_eh_rethrow(struct avm_eh_exception *header);
/* Entry from the __avm_rethrow_primary_exception shim, which tail-jumps here with the
 * header in r4 after capturing the call site, as __cxa_throw does. The header must be a
 * non-null object that a std::exception_ptr names. An innermost CAUGHT exception is
 * rethrown as a pending rethrow, and any other ALLOCATED exception is thrown anew. It
 * never returns. */
AVM_EH_PROPAGATE void __avm_eh_rethrow_primary(struct avm_eh_exception *header);

/* Entry from the public _Unwind_Resume shim. The pending frame cursor is
 * already in the header, so the cleanup's registers need no additional save. */
AVM_EH_PROPAGATE void __avm_eh_resume(struct avm_eh_exception *header);

/* Opens the AVEH5 metadata for the exception at header, once per throw. It validates the
 * block header and the index bounds, and it caches the block address, block end, and
 * function count in the header. Returns 0 when the anchor names no well-formed block. */
uint8_t avm_eh_open_exception(struct avm_eh_exception *header);

/* Returns 1 when the AVEH5 block at the 24-bit flash address is well formed. It
 * applies the same bounded checks that the unwinder uses for each record. */
uint8_t avm_eh_validate_block(uint32_t block);

/* Phase one. Walks frames from the header's resume context until one has a catch
 * that matches the thrown type. On success, the header's handler_selector holds
 * the matched selector, and the resume context becomes the handler's landing
 * state. It returns 0 when no handler exists or the metadata cannot describe a
 * frame. */
uint8_t avm_eh_find_handler(struct avm_eh_exception *header);

/* Phase two. Advances the header's resume context to the next cleanup or handler.
 * For a cleanup, the header's context becomes its landing state and the resume
 * context moves to the cleanup's caller. For a handler, the context becomes its
 * landing state, and the resume context is left at the handler. Returns one of the
 * AVM_EH_STEP values. */
uint8_t avm_eh_prepare_next(struct avm_eh_exception *header);

#endif /* AVM_EH_UNWIND_INTERNAL_H */
