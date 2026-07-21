
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/crc16.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 crc16.c
00000100 l     O .data	00000080 data
00000180 l     O .data	00000002 crc_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000005c avm_test_main
00000271 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 5c                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 a5                    xor	r5, r5
 c2 11                 ldi8	r6, 0x11
 c0 80                 ldi8	r4, 0x80
 c7 00 01              ldi16	r7, 0x100
 1d                    add	r7, r5
 5e                    st8	[r7], r6
 ca 1d                 addi.s8	r6, 0x1d
 f4 ad                 inc16	r5
 34                    cmp	r5, r4
 d1 f4                 brne8	avm_test_main+9
 c5 ff ff              ldi16	r5, 0xffff
 f0 02 00              ldi8	r2, 0x0
 d7 01                 sys	debug_break
 f1 2e                 mov	r7, r2
 f1 02                 mov	r0, r2
 c6 00 01              ldi16	r6, 0x100
 f2 28                 add	r6, r0
 4a                    ld8u	r6, [r6]
 fa 58                 lsl16i	r6, 0x8
 a9                    xor	r6, r5
 f0 01 08              ldi8	r1, 0x8
 06                    mov	r5, r6
 fa 41                 lsl16i	r5, 0x1
 f0 07 21 10           ldi16	r3, 0x1021
 f9 76                 xor	r3, r5
 f6 2e                 tst16	r6
 fd 2b                 cmov.slt	r5, r3
 f4 b1                 dec16	r1
 f4 a1                 tst8	r1
 09                    mov	r6, r5
 d1 ed                 brne8	avm_test_main+46
 f4 a8                 inc16	r0
 f5 04                 cmp	r0, r4
 d1 da                 brne8	avm_test_main+33
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 ce 08                 cmpi.s8	r6, 0x8
 d1 cf                 brne8	avm_test_main+31
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
