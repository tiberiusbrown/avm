/* Internal interface between the C++ exception runtime and its assembly
 * helpers. eh_context.asm and eh_cxa_throw.asm read these structures by fixed
 * offsets, so every change here must update those files and the _Static_asserts
 * in eh_unwind.c and eh_cxa.c. */
#ifndef AVM_EH_UNWIND_INTERNAL_H
#define AVM_EH_UNWIND_INTERNAL_H

#include <stddef.h>
#include <stdint.h>

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
 * object, and it is zero for an exact or catch-all match. */
struct avm_eh_exception {
    struct avm_eh_context context;        /* +0  landing state; exception = this header */
    uint8_t type_address[3];              /* +15 type-descriptor program address (r6:r7) */
    void (*destructor)(void *);           /* +18 program address (stack argument) */
    uint16_t size;                        /* +21 object size */
    uint8_t state;                        /* +23 AVM_EH_STATE_* */
    struct avm_eh_context resume_context; /* +24 frame cursor for the next step */
    uint16_t handler_selector;            /* +39 selector of the matched catch */
    uint16_t handler_adjustment;          /* +41 byte offset of the matched base subobject */
};

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
__attribute__((noreturn)) void __avm_eh_throw(struct avm_eh_exception *header);

/* Returns 1 when the AVEH4 block at the 24-bit flash address is well formed. It
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
