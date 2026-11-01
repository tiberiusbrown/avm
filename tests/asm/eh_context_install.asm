; Focused check for __avm_eh_install_context. The test builds a context whose
; landing pad is resume, with a stack pointer 8 bytes below the test frame and
; known values in r0-r3 and the exception pointer. The installer must resume at
; resume with that SP, r4 set to the exception header, r5 set to selector 1, and
; r0-r3 restored from the context. The test prints P when every value matches,
; and F at the first mismatch. The eh_ prefix keeps it out of the ordinary asm
; matrix; avm_eh_catch_all_run links it with libavm.a.

.section .data,"aw",@progbits
expected_sp:
    .short 0

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ldi16 r4, 0x0980
    setsp r4
    adjsp -16

    ; The landing SP is eight bytes below this frame. Record it for resume.
    getsp r0
    addi.s8 r0, -8
    stsp16 [sp+0], r0
    ldi16 r6, expected_sp
    st16 [r6+0], r0

    ; Program address of resume, in the split form of struct avm_eh_context.
    ldi16 r7, %lo16(resume)
    stsp16 [sp+2], r7
    ldi8 r6, %hi8(resume)
    stsp8 [sp+4], r6

    ; Known values for the registers the landing pad must see.
    ldi16 r0, 0x1111
    stsp16 [sp+5], r0
    ldi16 r1, 0x2222
    stsp16 [sp+7], r1
    ldi16 r2, 0x3333
    stsp16 [sp+9], r2
    ldi16 r3, 0x4444
    stsp16 [sp+11], r3
    ldi16 r4, 0x0abc
    stsp16 [sp+13], r4

    ; Replace every value that the installer must restore.
    ldi16 r0, 0
    ldi16 r1, 0
    ldi16 r2, 0
    ldi16 r3, 0
    ldi16 r5, 0

    getsp r4
    call __avm_eh_install_context

    ; The installer never returns here.
    ldi8 r4, 'F'
    sys debug_putc
    sys debug_break

resume:
    ldi16 r6, 0x0abc
    cmp r4, r6
    brne16 fail
    ldi16 r6, 1
    cmp r5, r6
    brne16 fail

    ldi16 r6, 0x1111
    cmp r0, r6
    brne16 fail
    ldi16 r6, 0x2222
    cmp r1, r6
    brne16 fail
    ldi16 r6, 0x3333
    cmp r2, r6
    brne16 fail
    ldi16 r6, 0x4444
    cmp r3, r6
    brne16 fail

    getsp r7
    ldi16 r6, expected_sp
    ld16 r0, [r6+0]
    cmp r7, r0
    brne16 fail

    ldi8 r4, 'P'
    sys debug_putc
    ldi8 r4, '\n'
    sys debug_putc
    sys debug_break

fail:
    ldi8 r4, 'F'
    sys debug_putc
    ldi8 r4, '\n'
    sys debug_putc
    sys debug_break
