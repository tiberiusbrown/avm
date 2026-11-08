; Focused check for __avm_eh_install_context. Two contexts name two landing pads
; at the two stored-SP endpoints (0x0a00 and 0x0903), with the same known
; values in r0-r3. Each context is the prefix of its exception header, so its
; address must remain in r4. The cleanup pad is entered
; with selector 0 and the catch pad with selector 1, and each must see its selector
; in r5. The cleanup pad installs the catch context, so the installer runs twice.
; The test prints P when every value matches, and F at the first mismatch. The
; eh_ prefix keeps it out of the ordinary asm matrix; avm_eh_catch_all_run links
; it with libavm.a.

.section .data,"aw",@progbits
cleanup_context:
    .zero 12
catch_context:
    .zero 12

.section .text,"ax",@progbits

.globl _start
.type _start, @function
_start:
    ldi16 r4, 0x0980
    setsp r4
    adjsp -16

    ; Depth zero is the empty-stack endpoint. The full endpoint is excluded.
    ldi8 r0, 0

    ; Cleanup context: landing pad cleanup_pad, with the known register values.
    ldi16 r6, cleanup_context
    st8 [r6+0], r0
    ldi16 r7, %lo16(cleanup_pad)
    st16 [r6+1], r7
    ldi8 r7, %hi8(cleanup_pad)
    st8 [r6+3], r7
    ldi16 r7, 0x1111
    st16 [r6+4], r7
    ldi16 r7, 0x2222
    st16 [r6+6], r7
    ldi16 r7, 0x3333
    st16 [r6+8], r7
    ldi16 r7, 0x4444
    st16 [r6+10], r7

    ; Catch context: maximum storable depth 253, landing at catch_pad.
    ldi8 r0, 253
    ldi16 r6, catch_context
    st8 [r6+0], r0
    ldi16 r7, %lo16(catch_pad)
    st16 [r6+1], r7
    ldi8 r7, %hi8(catch_pad)
    st8 [r6+3], r7
    ldi16 r7, 0x1111
    st16 [r6+4], r7
    ldi16 r7, 0x2222
    st16 [r6+6], r7
    ldi16 r7, 0x3333
    st16 [r6+8], r7
    ldi16 r7, 0x4444
    st16 [r6+10], r7

    ; Replace the registers that the installer must restore, so the landing pad
    ; cannot see stale values.
    ldi16 r0, 0
    ldi16 r1, 0
    ldi16 r2, 0
    ldi16 r3, 0

    ldi16 r4, cleanup_context
    ldi16 r5, 0
    call __avm_eh_install_context

    ; The installer never returns here.
    ldi8 r4, 'F'
    sys debug_putc
    sys debug_break

cleanup_pad:
    ; Selector 0 marks a cleanup-only pad.
    ldi16 r6, 0
    cmp r5, r6
    brne16 fail
    ldi16 r6, cleanup_context
    cmp r4, r6
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
    ldi16 r0, 0x0a00
    cmp r7, r0
    brne16 fail

    ; The cleanup pad's values match. Install the catch context with selector 1.
    ldi16 r4, catch_context
    ldi16 r5, 1
    call __avm_eh_install_context

    ldi8 r4, 'F'
    sys debug_putc
    sys debug_break

catch_pad:
    ; Selector 1 marks a catch-all handler.
    ldi16 r6, 1
    cmp r5, r6
    brne16 fail
    ldi16 r6, catch_context
    cmp r4, r6
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
    ldi16 r0, 0x0903
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
