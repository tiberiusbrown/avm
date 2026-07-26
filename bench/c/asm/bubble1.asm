
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble1.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble1.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000118 avm_test_main
0000032e g     F .text	00000002 avm_halt
00000100 g     O .data	00000040 A

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 18 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 04 03              ldi16	r4, 0x304
 c5 02 01              ldi16	r5, 0x102
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 08 07              ldi16	r4, 0x708
 c5 06 05              ldi16	r5, 0x506
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 0c 0b              ldi16	r4, 0xb0c
 c5 0a 09              ldi16	r5, 0x90a
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 10 0f              ldi16	r4, 0xf10
 c5 0e 0d              ldi16	r5, 0xd0e
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c4 14 13              ldi16	r4, 0x1314
 c5 12 11              ldi16	r5, 0x1112
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 18 17              ldi16	r4, 0x1718
 c5 16 15              ldi16	r5, 0x1516
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 1c 1b              ldi16	r4, 0x1b1c
 c5 1a 19              ldi16	r5, 0x191a
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 20 1f              ldi16	r4, 0x1f20
 c5 1e 1d              ldi16	r5, 0x1d1e
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 24 23              ldi16	r4, 0x2324
 c5 22 21              ldi16	r5, 0x2122
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 28 27              ldi16	r4, 0x2728
 c5 26 25              ldi16	r5, 0x2526
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 2c 2b              ldi16	r4, 0x2b2c
 c5 2a 29              ldi16	r5, 0x292a
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 30 2f              ldi16	r4, 0x2f30
 c5 2e 2d              ldi16	r5, 0x2d2e
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 34 33              ldi16	r4, 0x3334
 c5 32 31              ldi16	r5, 0x3132
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 38 37              ldi16	r4, 0x3738
 c5 36 35              ldi16	r5, 0x3536
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 3c 3b              ldi16	r4, 0x3b3c
 c5 3a 39              ldi16	r5, 0x393a
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 40 3f              ldi16	r4, 0x3f40
 c5 3e 3d              ldi16	r5, 0x3d3e
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f0 03 40              ldi8	r3, 0x40
 d7 01                 sys	debug_break
 f2 39                 sub	r1, r1
 f0 02 01              ldi8	r2, 0x1
 d4 08                 jmp8	avm_test_main+216
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d2 38                 brult8	avm_test_main+272
 f1 73                 zext8	r3
 f4 b3                 dec16	r3
 f1 2f                 mov	r7, r3
 f1 22                 mov	r4, r2
 c6 01 01              ldi16	r6, 0x101
 f1 19                 mov	r3, r1
 d4 0a                 jmp8	avm_test_main+241
 f4 ac                 inc16	r4
 f4 ae                 inc16	r6
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d0 df                 breq8	avm_test_main+208
 46                    ld8u	r5, [r6]
 f6 45                 sext8	r5
 ed 0c 1f              ld8u	r0, [r6-1]
 f6 40                 sext8	r0
 f5 24                 cmp	r5, r0
 d9 ea                 brsge8	avm_test_main+231
 f3 08                 st8	[r6], r0
 ee ac 1f              st8	[r6-1], r5
 f1 1c                 mov	r3, r4
 f4 ac                 inc16	r4
 f4 ae                 inc16	r6
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 e3                 brne8	avm_test_main+241
 d4 c0                 jmp8	avm_test_main+208
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
