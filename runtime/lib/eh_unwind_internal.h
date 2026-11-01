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

/* Header that precedes each thrown object. The throw shim stores the throwing
 * frame's context and the type token and destructor, and the unwinder updates
 * the context in place. Keeping the context here, not in the throw frame, means
 * the throw path needs no stack-resident copy of it. */
struct avm_eh_exception {
    struct avm_eh_context context; /* +0  thrower state; exception = this header */
    const void *type;              /* +15 type-descriptor token (r5) */
    void (*destructor)(void *);    /* +17 program address (r6:r7) */
    uint16_t size;                 /* +20 object size */
    uint8_t state;                 /* +22 AVM_EH_STATE_* */
};

/* Non-returning installer. Loads the landing pad, stack pointer, and r0-r3
 * from the context, then passes the exception header in r4 and selector 1 in
 * r5. */
__attribute__((noreturn)) void
__avm_eh_install_context(const struct avm_eh_context *context);

/* Entry from the __cxa_throw shim, which tail-jumps here with the header in r4.
 * Searches for a handler and never returns. */
__attribute__((noreturn)) void __avm_eh_throw(struct avm_eh_exception *header);

/* Returns 1 when the AVEH2 block at the 24-bit flash address is well formed. It
 * applies the same bounded checks that the unwinder uses for each record. */
uint8_t avm_eh_validate_block(uint32_t block);

/* Walks frames from *context until a catch-all handler is found. On success,
 * *context becomes the landing-pad state and the function returns 1. It
 * returns 0 when no handler exists or the metadata cannot describe a frame. */
uint8_t avm_eh_find_handler(struct avm_eh_context *context);

#endif /* AVM_EH_UNWIND_INTERNAL_H */
