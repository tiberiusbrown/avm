
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/crc16.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 crc16.c
00000100 l     O .data	00000080 data
00000180 l     O .data	00000002 crc_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000005a avm_test_main
0000026f g     F .text	00000002 avm_halt

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
 d5 5a                 call8	avm_halt

<avm_test_main>:
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
 d1 f6                 brne8	avm_test_main+10
 c4 ff ff              ldi16	r4, 0xffff
 f0 01 00              ldi8	r1, 0x0
 d7 01                 sys	debug_break
 f1 29                 mov	r6, r1
 f1 2d                 mov	r7, r1
 c5 00 01              ldi16	r5, 0x100
 17                    add	r5, r7
 45                    ld8u	r5, [r5]
 fa 48                 lsl16i	r5, 0x8
 a4                    xor	r5, r4
 f0 00 08              ldi8	r0, 0x8
 01                    mov	r4, r5
 fa 31                 lsl16i	r4, 0x1
 f0 06 21 10           ldi16	r2, 0x1021
 f9 52                 xor	r2, r4
 f6 2d                 tst16	r5
 fd 22                 cmov.slt	r4, r2
 f4 b0                 dec16	r0
 f4 a0                 tst8	r0
 04                    mov	r5, r4
 d1 ed                 brne8	avm_test_main+44
 f4 af                 inc16	r7
 c1 80                 ldi8	r5, 0x80
 3d                    cmp	r7, r5
 d1 da                 brne8	avm_test_main+32
 f4 ae                 inc16	r6
 06                    mov	r5, r6
 f1 75                 zext8	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 cf                 brne8	avm_test_main+30
 f0 5c 80 01           stm16	[0x180], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
