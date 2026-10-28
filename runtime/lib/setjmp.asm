.section .text,"ax",@progbits

.globl __avm_setjmp
.type __avm_setjmp, @function
__avm_setjmp:
    ; r4 = environment pointer.
    ; Save the SP at function entry.
    getsp r5
    st16 [r4+0], r5

    ; Save the complete 24-bit return address.
    ldsp16 r6, [sp+0]
    st16 [r4+2], r6
    ldsp8u r6, [sp+2]
    st8 [r4+4], r6

    ; Save all callee-saved registers.
    st16 [r4+5], r0
    st16 [r4+7], r1
    st16 [r4+9], r2
    st16 [r4+11], r3

    ; Initial setjmp returns zero.
    ldi8 r4, 0
    ret
.size __avm_setjmp, .-__avm_setjmp


.globl longjmp
.type longjmp, @function
longjmp:
    ; r4 = environment pointer.
    ; r5 = requested return value.

    ; Restore the saved return record into the
    ; original call's three-byte stack slot.
    ld16 r6, [r4+0]
    ld16 r7, [r4+2]
    st16 [r6+0], r7
    ld8u r7, [r4+4]
    st8 [r6+2], r7

    ; Restore all callee-saved registers.
    ld16 r0, [r4+5]
    ld16 r1, [r4+7]
    ld16 r2, [r4+9]
    ld16 r3, [r4+11]

    ; longjmp(env, 0) must make setjmp return 1.
    mov r4, r5
    cmpi.s8 r4, 0
    brne8 .Llongjmp_nonzero
    ldi8 r4, 1
.Llongjmp_nonzero:

    ; Restore the original call stack and return
    ; to the instruction following the saved setjmp.
    setsp r6
    ret
.size longjmp, .-longjmp
    .pushsection .stack_sizes,"o",@progbits,.text
    .3byte __avm_setjmp
    .uleb128 0
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte __avm_setjmp
    .3byte 0
    .short 0
    .byte 8
    .popsection
    .pushsection .stack_sizes,"o",@progbits,.text
    .3byte longjmp
    .uleb128 0
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte longjmp
    .3byte 0
    .short 0
    .byte 8
    .popsection
