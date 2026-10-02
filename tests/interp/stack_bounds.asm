.section .text,"ax",@progbits
.globl _start
_start:
    mov r0, r0

.globl call8_site, call16_site, callf_site
call8_site:
    call8 call8_target
    mov r0, r7
call16_site:
    call16 call16_target
    mov r0, r7
callf_site:
    callf callf_target
    mov r0, r7
    jmp8 .Lindirect

.globl call8_target, call16_target, callf_target, callp_target
call8_target:
    mov r6, r7
    ret
call16_target:
    mov r6, r7
    ret
callf_target:
    mov r6, r7
    ret
callp_target:
    mov r6, r7
    ret

.Lindirect:
    .macro indirect_case n, lowreg, highreg
        ldi16 \lowreg, %lo16(callp_target)
        ldi8 \highreg, %hi8(callp_target)
        .globl callp_site_\n
callp_site_\n:
        .byte (0xe8 + \n)
        mov r0, r7
    .endm
    indirect_case 0, r0, r1
    indirect_case 1, r2, r3
    indirect_case 2, r4, r5
    indirect_case 3, r6, r7

    .macro adjust_case name, displacement
        ldi16 r4, 0x0980
        setsp r4
        .globl adjsp_site_\name
adjsp_site_\name:
        .byte 0xd6, (\displacement & 0xff)
        mov r0, r7
    .endm
    adjust_case neg128, -128
    adjust_case neg16, -16
    adjust_case neg1, -1
    adjust_case zero, 0
    adjust_case pos1, 1
    adjust_case pos16, 16
    adjust_case pos127, 127

    .macro assign_case n
        ldi16 r\n, 0x0980
        .globl setsp_site_\n
setsp_site_\n:
        .byte 0xf1, (0x88 + \n)
        mov r0, r7
    .endm
    .irp n, 0, 1, 2, 3, 4, 5, 6, 7
        assign_case \n
    .endr
    sys debug_break
