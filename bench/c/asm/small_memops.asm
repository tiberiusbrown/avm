
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/small_memops.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 small_memops.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000020 destination
00000140 l     O .data	00000002 small_memops_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000017d avm_test_main
00000393 g     F .text	00000002 avm_halt

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
 e1 7d 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 df f0              ldi16	r4, 0xf0df
 c5 01 12              ldi16	r5, 0x1201
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 9b ac              ldi16	r4, 0xac9b
 c5 bd ce              ldi16	r5, 0xcebd
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 57 68              ldi16	r4, 0x6857
 c5 79 8a              ldi16	r5, 0x8a79
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 13 24              ldi16	r4, 0x2413
 c5 35 46              ldi16	r5, 0x4635
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 cf e0              ldi16	r4, 0xe0cf
 c5 f1 02              ldi16	r5, 0x2f1
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 8b 9c              ldi16	r4, 0x9c8b
 c5 ad be              ldi16	r5, 0xbead
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 47 58              ldi16	r4, 0x5847
 c5 69 7a              ldi16	r5, 0x7a69
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 03 14              ldi16	r4, 0x1403
 c5 25 36              ldi16	r5, 0x3625
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f2 42                 sub	r2, r2
 c3 40                 ldi8	r7, 0x40
 d7 01                 sys	debug_break
 f0 04 24 01           ldi16	r0, 0x124
 f0 07 32 01           ldi16	r3, 0x132
 f1 0a                 mov	r1, r2
 c4 20 01              ldi16	r4, 0x120
 f1 25                 mov	r5, r1
 c2 20                 ldi8	r6, 0x20
 d7 11                 sys	memset
 c4 21 01              ldi16	r4, 0x121
 c5 03 01              ldi16	r5, 0x103
 c2 01                 ldi8	r6, 0x1
 d7 0f                 sys	memcpy
 c4 22 01              ldi16	r4, 0x122
 c5 05 01              ldi16	r5, 0x105
 c2 02                 ldi8	r6, 0x2
 d7 0f                 sys	memcpy
 f1 20                 mov	r4, r0
 c5 07 01              ldi16	r5, 0x107
 c2 03                 ldi8	r6, 0x3
 d7 0f                 sys	memcpy
 c4 28 01              ldi16	r4, 0x128
 c5 09 01              ldi16	r5, 0x109
 c2 04                 ldi8	r6, 0x4
 d7 0f                 sys	memcpy
 c4 2c 01              ldi16	r4, 0x12c
 c5 0b 01              ldi16	r5, 0x10b
 c2 05                 ldi8	r6, 0x5
 d7 0f                 sys	memcpy
 f1 23                 mov	r4, r3
 c1 5a                 ldi8	r5, 0x5a
 c2 08                 ldi8	r6, 0x8
 d7 11                 sys	memset
 c4 27 01              ldi16	r4, 0x127
 f1 24                 mov	r5, r0
 c2 07                 ldi8	r6, 0x7
 d7 12                 sys	memmove
 c4 34 01              ldi16	r4, 0x134
 f1 27                 mov	r5, r3
 c2 0c                 ldi8	r6, 0xc
 d7 12                 sys	memmove
 f0 44 20 01           ldm8u	r4, [0x120]
 f2 22                 add	r4, r2
 f0 45 21 01           ldm8u	r5, [0x121]
 14                    add	r5, r4
 f0 44 22 01           ldm8u	r4, [0x122]
 11                    add	r4, r5
 f0 45 23 01           ldm8u	r5, [0x123]
 14                    add	r5, r4
 f0 44 24 01           ldm8u	r4, [0x124]
 11                    add	r4, r5
 f0 45 25 01           ldm8u	r5, [0x125]
 14                    add	r5, r4
 f0 44 26 01           ldm8u	r4, [0x126]
 11                    add	r4, r5
 f0 45 27 01           ldm8u	r5, [0x127]
 14                    add	r5, r4
 f0 44 28 01           ldm8u	r4, [0x128]
 11                    add	r4, r5
 f0 45 29 01           ldm8u	r5, [0x129]
 14                    add	r5, r4
 f0 44 2a 01           ldm8u	r4, [0x12a]
 11                    add	r4, r5
 f0 45 2b 01           ldm8u	r5, [0x12b]
 14                    add	r5, r4
 f0 44 2c 01           ldm8u	r4, [0x12c]
 11                    add	r4, r5
 f0 45 2d 01           ldm8u	r5, [0x12d]
 14                    add	r5, r4
 f0 44 2e 01           ldm8u	r4, [0x12e]
 11                    add	r4, r5
 f0 45 2f 01           ldm8u	r5, [0x12f]
 14                    add	r5, r4
 f0 44 30 01           ldm8u	r4, [0x130]
 11                    add	r4, r5
 f0 45 31 01           ldm8u	r5, [0x131]
 14                    add	r5, r4
 f0 44 32 01           ldm8u	r4, [0x132]
 11                    add	r4, r5
 f0 45 33 01           ldm8u	r5, [0x133]
 14                    add	r5, r4
 f0 44 34 01           ldm8u	r4, [0x134]
 11                    add	r4, r5
 f0 45 35 01           ldm8u	r5, [0x135]
 14                    add	r5, r4
 f0 44 36 01           ldm8u	r4, [0x136]
 11                    add	r4, r5
 f0 45 37 01           ldm8u	r5, [0x137]
 14                    add	r5, r4
 f0 44 38 01           ldm8u	r4, [0x138]
 11                    add	r4, r5
 f0 45 39 01           ldm8u	r5, [0x139]
 14                    add	r5, r4
 f0 44 3a 01           ldm8u	r4, [0x13a]
 11                    add	r4, r5
 f0 45 3b 01           ldm8u	r5, [0x13b]
 14                    add	r5, r4
 f0 44 3c 01           ldm8u	r4, [0x13c]
 11                    add	r4, r5
 f0 45 3d 01           ldm8u	r5, [0x13d]
 14                    add	r5, r4
 f0 44 3e 01           ldm8u	r4, [0x13e]
 11                    add	r4, r5
 f0 42 3f 01           ldm8u	r2, [0x13f]
 f2 14                 add	r2, r4
 f4 b7                 dec16	r7
 f4 a7                 tst8	r7
 db 03 ff              brne16	avm_test_main+116
 f0 5a 40 01           stm16	[0x140], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
