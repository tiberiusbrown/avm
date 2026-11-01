; void __cxa_throw(void *object, const void *type, void (*destructor)(void *))
;
; The type descriptor and the destructor are 24-bit program addresses.
; r4 = object, r6:r7 = type-descriptor program address (24-bit), and the
; destructor program address is the three-byte stack argument at SP+3..5 on
; entry. The type descriptor takes the aligned pair r6:r7 because the 16-bit object
; occupies r4 and r5 cannot hold a 24-bit address. The shim has no stack frame.
; It stores the throw site into the exception header that lies just below the
; object, and then tail-transfers to __avm_eh_throw with the header in r4. The
; caller's SP is SP+3 on entry, and the return record at SP+0 is the caller's
; continuation.
;
; The 39-byte header is struct avm_eh_exception in eh_unwind_internal.h, and the
; offsets below must match it. The context is first, so the unwinder reads the
; throw site in place without a stack copy. The resume context after the context
; is not written here: __avm_eh_throw initializes it from the context.
;
; The assembler encodes stack stores of r4-r7 only at offsets 0-15, and this
; shim uses only heap-relative stores, so it needs no temporary stack slot.

.section .text,"ax",@progbits

.globl __cxa_throw
.type __cxa_throw, @function
__cxa_throw:
    ; r4 = header, which lies 39 bytes below the object.
    addi.s8 r4, -39

    ; Store the incoming registers before any of them is reused. The
    ; header's exception field is written by __avm_eh_throw.
    st16 [r4+5], r0
    st16 [r4+7], r1
    st16 [r4+9], r2
    st16 [r4+11], r3

    ; Type-descriptor program address, passed in r6:r7. r7 carries bits 23:16.
    st16 [r4+15], r6
    st8 [r4+17], r7

    ; Destructor program address, the third argument on the stack. Its three
    ; bytes are read before the shim reuses r0 for the return record.
    ldsp16 r0, [sp+3]
    st16 [r4+18], r0
    ldsp8u r0, [sp+5]
    st8 [r4+20], r0

    ; The continuation is the 3-byte return record at SP+0.
    ldsp16 r0, [sp+0]
    st16 [r4+2], r0
    ldsp8u r0, [sp+2]
    st8 [r4+4], r0

    ; The caller's SP is the entry SP plus three.
    getsp r0
    addi.s8 r0, 3
    st16 [r4+0], r0

    jmp __avm_eh_throw
.size __cxa_throw, .-__cxa_throw
    .pushsection .stack_sizes,"o",@progbits,.text
    .3byte __cxa_throw
    .uleb128 0
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte __cxa_throw
    .3byte 0
    .short 0
    .byte 8
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte __cxa_throw
    .3byte __avm_eh_throw
    .short 0
    .byte 2
    .popsection
