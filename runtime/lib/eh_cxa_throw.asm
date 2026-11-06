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
; The 53-byte header is struct avm_eh_exception in eh_unwind_internal.h, and the
; offsets below must match it. The context is first, so the unwinder reads the
; throw site in place without a stack copy. The resume context, the handler
; selector, and the handler adjustment are not written here: __avm_eh_throw
; initializes the resume context from the context, and phase one sets the selector
; and the adjustment.
;
; The assembler encodes stack stores of r4-r7 only at offsets 0-15, and this
; shim uses only heap-relative stores, so it needs no temporary stack slot.

.section .text,"ax",@progbits

.globl __cxa_throw
.type __cxa_throw, @function
__cxa_throw:
    ; r4 = header, which lies 53 bytes below the object.
    addi.s8 r4, -53

    ; Store the incoming registers before any of them is reused.
    st16 [r4+4], r0
    st16 [r4+6], r1
    st16 [r4+8], r2
    st16 [r4+10], r3

    ; Type-descriptor program address, passed in r6:r7. r7 carries bits 23:16.
    st16 [r4+12], r6
    st8 [r4+14], r7

    ; Destructor program address, the third argument on the stack. Its three
    ; bytes are read before the shim reuses r0 for the return record.
    ldsp16 r0, [sp+3]
    st16 [r4+15], r0
    ldsp8u r0, [sp+5]
    st8 [r4+17], r0

    ; The continuation is the 3-byte return record at SP+0.
    ldsp16 r0, [sp+0]
    st16 [r4+1], r0
    ldsp8u r0, [sp+2]
    st8 [r4+3], r0

    ; Depth = TOP - (entry SP + 3), in 0..253 for a valid ABI return record.
    getsp r0
    ldi16 r5, 0x09fd
    sub r5, r0
    st8 [r4+0], r5

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
