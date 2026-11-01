; __avm_eh_install_context(const struct avm_eh_context *context)
;
; Resumes execution at a landing pad. The context layout is defined in
; eh_unwind_internal.h: sp +0, program address +2/+4, r0-r3 +5..+11, and the
; exception header +13. The landing pad receives the header in r4 and the
; catch selector 1 in r5. This routine never returns, so it does not write a
; return record and does not use RET.

.section .text,"ax",@progbits

.globl __avm_eh_install_context
.type __avm_eh_install_context, @function
__avm_eh_install_context:
    ; r4 = context. Load every field that is still addressed through r4 before
    ; r4 is overwritten with the exception header.
    ld16 r6, [r4+2]         ; program address bits 15:0
    ld8u r7, [r4+4]         ; program address bits 23:16, zero-extended
    ld16 r0, [r4+5]
    ld16 r1, [r4+7]
    ld16 r2, [r4+9]
    ld16 r3, [r4+11]
    ld16 r5, [r4+0]
    setsp r5                ; the landing pad's stack pointer

    ld16 r4, [r4+13]        ; exception header pointer
    ldi8 r5, 1              ; catch-all selector

    ; JMPP ignores q3[31:24], which is the padding above r7.
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
