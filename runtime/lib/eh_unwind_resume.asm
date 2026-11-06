; Public C-ABI entry for resuming propagation after a cleanup. The exception
; header is in r4 and already holds the pending unwind cursor. Tail-transfer
; to the preserve_none C helper without saving the cleanup's r0-r2 again.
; Argument locations and the preserved frame pointer r3 agree in both ABIs.

.section .text,"ax",@progbits
.globl _Unwind_Resume
.type _Unwind_Resume, @function
_Unwind_Resume:
    jmp __avm_eh_resume
.size _Unwind_Resume, .-_Unwind_Resume
    .pushsection .stack_sizes,"o",@progbits,.text
    .3byte _Unwind_Resume
    .uleb128 0
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte _Unwind_Resume
    .3byte 0
    .short 0
    .byte 8
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte _Unwind_Resume
    .3byte __avm_eh_resume
    .short 0
    .byte 2
    .popsection
