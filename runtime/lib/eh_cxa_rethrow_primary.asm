; void __avm_rethrow_primary_exception(void *object)
;
; Rethrows the exception that object names, for std::rethrow_exception. The caller passes
; a non-null object that a std::exception_ptr holds. The object lies after its 53-byte
; header, and the shim captures the call site into that header's context before it
; tail-transfers to __avm_eh_rethrow_primary with the header in r4. The header's type
; descriptor, destructor, and size were recorded by the original throw, so they are not
; written here.
;
; On entry, r4 = object, SP points to the three-byte return record of the call, and the
; caller's SP is SP+3. r0-r3 hold the caller's callee-saved values, so the shim captures
; them directly. The shim has no frame and uses only heap-relative stores.
;
; The header offsets below must match struct avm_eh_exception in eh_unwind_internal.h.
.section .text,"ax",@progbits
.globl __avm_rethrow_primary_exception
.type __avm_rethrow_primary_exception, @function
__avm_rethrow_primary_exception:
    ; r4 = header, which lies 53 bytes below the object.
    addi.s8 r4, -53
    ; Store the callee-saved registers of the call site.
    st16 [r4+4], r0
    st16 [r4+6], r1
    st16 [r4+8], r2
    st16 [r4+10], r3
    ; The continuation is the 3-byte return record at SP+0, the return PC of the call.
    ldsp16 r0, [sp+0]
    st16 [r4+1], r0
    ldsp8u r0, [sp+2]
    st8 [r4+3], r0
    ; Depth = TOP - (entry SP + 3); the full-stack endpoint is never captured.
    getsp r0
    ldi16 r5, 0x09fd
    sub r5, r0
    st8 [r4+0], r5
    jmp __avm_eh_rethrow_primary
.size __avm_rethrow_primary_exception, .-__avm_rethrow_primary_exception
    .pushsection .stack_sizes,"o",@progbits,.text
    .3byte __avm_rethrow_primary_exception
    .uleb128 0
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte __avm_rethrow_primary_exception
    .3byte 0
    .short 0
    .byte 8
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte __avm_rethrow_primary_exception
    .3byte __avm_eh_rethrow_primary
    .short 0
    .byte 2
    .popsection
