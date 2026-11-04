; void __cxa_rethrow(void)
;
; Rethrows the active caught exception. The header is returned by the C getter
; __avm_eh_rethrow_header, which terminates when no exception is caught. The shim
; then records the rethrow site in the header's context, and it tail-transfers to
; __avm_eh_rethrow with the header in r4. The object, the type descriptor, the
; destructor, and the size are not written, so the original exception is reused.
;
; On entry, SP points to the three-byte return record of the rethrow call, and the
; caller's SP is SP+3. r0-r3 hold the caller's callee-saved values. The getter
; preserves r0-r3, so the shim captures them after the call. The getter's call
; uses a normal return record at SP-3, which is released before the captures.
;
; The header offsets below must match struct avm_eh_exception in
; eh_unwind_internal.h. The context is first, so the site is written in place.
;
; The assembler encodes stack loads of the return record, and this shim uses only
; heap-relative stores, so it needs no temporary stack slot.

.section .text,"ax",@progbits

.globl __cxa_rethrow
.type __cxa_rethrow, @function
__cxa_rethrow:
    ; r4 = the caught exception header. The getter never returns when none is caught.
    callf __avm_eh_rethrow_header

    ; Store the callee-saved registers of the rethrow site.
    st16 [r4+5], r0
    st16 [r4+7], r1
    st16 [r4+9], r2
    st16 [r4+11], r3

    ; The continuation is the 3-byte return record at SP+0, the return PC of the rethrow call.
    ldsp16 r0, [sp+0]
    st16 [r4+2], r0
    ldsp8u r0, [sp+2]
    st8 [r4+4], r0

    ; The rethrow site's SP is the entry SP plus three.
    getsp r0
    addi.s8 r0, 3
    st16 [r4+0], r0

    jmp __avm_eh_rethrow
.size __cxa_rethrow, .-__cxa_rethrow
    .pushsection .stack_sizes,"o",@progbits,.text
    .3byte __cxa_rethrow
    .uleb128 0
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte __cxa_rethrow
    .3byte 0
    .short 0
    .byte 8
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte __cxa_rethrow
    .3byte __avm_eh_rethrow_header
    .short 0
    .byte 0
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte __cxa_rethrow
    .3byte __avm_eh_rethrow
    .short 0
    .byte 2
    .popsection
