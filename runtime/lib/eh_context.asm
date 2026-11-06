; __avm_eh_install_context(const struct avm_eh_context *context, uint16_t selector)
;
; Resumes execution at a landing pad. The context layout is defined in
; eh_unwind_internal.h: stack depth +0, program address +1/+3, r0-r3 +4..+10.
; The context is the header's first member, so r4 already holds the header; r5
; holds the selector. A cleanup-only pad receives selector 0, and a catch-all handler receives
; selector 1. The selector arrives in r5 and is left there unchanged. This routine
; never returns, so it does not write a return record and does not use RET.

.section .text,"ax",@progbits

.globl __avm_eh_install_context
.type __avm_eh_install_context, @function
__avm_eh_install_context:
    ; r4 = context and r5 = selector. Set the landing SP first, through r0, which
    ; is loaded again below. The context is read through r4, which still holds it.
    ld8u r0, [r4+0]
    ldi16 r6, 0x0a00
    sub r6, r0
    setsp r6

    ld16 r6, [r4+1]         ; program address bits 15:0
    ld8u r7, [r4+3]         ; program address bits 23:16, zero-extended
    ld16 r0, [r4+4]
    ld16 r1, [r4+6]
    ld16 r2, [r4+8]
    ld16 r3, [r4+10]

    ; JMPP ignores q3[31:24], which is the padding above r7. r5 is not written.
    jmpp q3
.size __avm_eh_install_context, .-__avm_eh_install_context
    .pushsection .stack_sizes,"o",@progbits,.text
    .3byte __avm_eh_install_context
    .uleb128 0
    .popsection
    .pushsection .avm.stackcalls,"o",@progbits,.text
    .3byte __avm_eh_install_context
    .3byte 0
    .short 0
    .byte 8
    .popsection
