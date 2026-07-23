
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/crc16.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 crc16.c
00000100 l     O .data	00000080 data
00000180 l     O .data	00000002 crc_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000092 avm_test_main
000002a8 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 92 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c0 80                 ldi8	r4, 0x80
 c1 11                 ldi8	r5, 0x11
 c6 00 01              ldi16	r6, 0x100
 f6 15                 st8	[r6+], r5
 c9 1d                 addi.s8	r5, 0x1d
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f6                 brne8	avm_test_main+11
 c5 ff ff              ldi16	r5, 0xffff
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 01 80              ldi8	r1, 0x80
 f0 07 00 01           ldi16	r3, 0x100
 f1 2d                 mov	r7, r1
 f0 6c c7              ld8u	r6, [r3+]
 fa 58                 lsl16i	r6, 0x8
 a9                    xor	r6, r5
 02                    mov	r4, r6
 10                    add	r4, r4
 f0 04 21 10           ldi16	r0, 0x1021
 04                    mov	r5, r4
 f9 a2                 xor	r5, r0
 f6 2e                 tst16	r6
 fd 25                 cmov.slt	r4, r5
 04                    mov	r5, r4
 15                    add	r5, r5
 09                    mov	r6, r5
 f9 c2                 xor	r6, r0
 f6 2c                 tst16	r4
 fd 2e                 cmov.slt	r5, r6
 01                    mov	r4, r5
 10                    add	r4, r4
 08                    mov	r6, r4
 f9 c2                 xor	r6, r0
 f6 2d                 tst16	r5
 fd 26                 cmov.slt	r4, r6
 04                    mov	r5, r4
 15                    add	r5, r5
 09                    mov	r6, r5
 f9 c2                 xor	r6, r0
 f6 2c                 tst16	r4
 fd 2e                 cmov.slt	r5, r6
 01                    mov	r4, r5
 10                    add	r4, r4
 08                    mov	r6, r4
 f9 c2                 xor	r6, r0
 f6 2d                 tst16	r5
 fd 26                 cmov.slt	r4, r6
 04                    mov	r5, r4
 15                    add	r5, r5
 09                    mov	r6, r5
 f9 c2                 xor	r6, r0
 f6 2c                 tst16	r4
 fd 2e                 cmov.slt	r5, r6
 01                    mov	r4, r5
 10                    add	r4, r4
 08                    mov	r6, r4
 f9 c2                 xor	r6, r0
 f6 2d                 tst16	r5
 fd 26                 cmov.slt	r4, r6
 04                    mov	r5, r4
 15                    add	r5, r5
 f9 16                 xor	r0, r5
 f6 2c                 tst16	r4
 fd 28                 cmov.slt	r5, r0
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 a9                 brne8	avm_test_main+37
 f4 aa                 inc16	r2
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 d1 99                 brne8	avm_test_main+31
 f0 5d 80 01           stm16	[0x180], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
