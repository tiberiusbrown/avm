.section .text,"ax",@progbits
.globl _start
_start:
    ; Raw encodings ensure every existing B0-BF primary slot is exercised.
    .irp opcode, 0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5, 0xb6, 0xb7, 0xb8, 0xb9, 0xba, 0xbb, 0xbc, 0xbd, 0xbe, 0xbf
        .byte \opcode
        mov r0, r7                 ; observable following guest instruction
    .endr
    sys debug_break
