
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/small_memops.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 small_memops.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000020 destination
00000140 l     O .data	00000002 small_memops_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000001ad avm_test_main
000003c3 g     F .text	00000002 avm_halt

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
 e1 ad 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
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
 af                    xor	r7, r7
 f0 02 40              ldi8	r2, 0x40
 d7 01                 sys	debug_break
 c2 20                 ldi8	r6, 0x20
 f0 00 01              ldi8	r0, 0x1
 f0 07 32 01           ldi16	r3, 0x132
 f0 05 34 01           ldi16	r1, 0x134
 07                    mov	r5, r7
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 3e 10              stsp16	[sp+0x10], r6
 c5 03 01              ldi16	r5, 0x103
 f4 79                 stsp16	[sp+0xe], r5
 f1 28                 mov	r6, r0
 f4 72                 stsp16	[sp+0xc], r6
 c5 05 01              ldi16	r5, 0x105
 f4 69                 stsp16	[sp+0xa], r5
 c5 07 01              ldi16	r5, 0x107
 f4 61                 stsp16	[sp+0x8], r5
 c5 09 01              ldi16	r5, 0x109
 f4 59                 stsp16	[sp+0x6], r5
 c5 0b 01              ldi16	r5, 0x10b
 f4 51                 stsp16	[sp+0x4], r5
 c5 24 01              ldi16	r5, 0x124
 f1 05                 mov	r0, r5
 f4 49                 stsp16	[sp+0x2], r5
 f1 27                 mov	r5, r3
 f4 41                 stsp16	[sp+0x0], r5
 c4 20 01              ldi16	r4, 0x120
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 10              ldsp16	r6, [sp+0x10]
 d7 11                 sys	memset
 c4 21 01              ldi16	r4, 0x121
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 32                 ldsp16	r6, [sp+0xc]
 d7 0f                 sys	memcpy
 c2 02                 ldi8	r6, 0x2
 c4 22 01              ldi16	r4, 0x122
 f4 29                 ldsp16	r5, [sp+0xa]
 d7 0f                 sys	memcpy
 c2 03                 ldi8	r6, 0x3
 f1 20                 mov	r4, r0
 f4 21                 ldsp16	r5, [sp+0x8]
 d7 0f                 sys	memcpy
 c2 04                 ldi8	r6, 0x4
 c4 28 01              ldi16	r4, 0x128
 f4 19                 ldsp16	r5, [sp+0x6]
 d7 0f                 sys	memcpy
 c2 05                 ldi8	r6, 0x5
 c4 2c 01              ldi16	r4, 0x12c
 f4 11                 ldsp16	r5, [sp+0x4]
 d7 0f                 sys	memcpy
 c2 08                 ldi8	r6, 0x8
 c1 5a                 ldi8	r5, 0x5a
 f1 23                 mov	r4, r3
 d7 11                 sys	memset
 c2 07                 ldi8	r6, 0x7
 c4 27 01              ldi16	r4, 0x127
 f4 09                 ldsp16	r5, [sp+0x2]
 d7 12                 sys	memmove
 c2 0c                 ldi8	r6, 0xc
 f1 21                 mov	r4, r1
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 12                 sys	memmove
 f0 44 20 01           ldm8u	r4, [0x120]
 13                    add	r4, r7
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
 f0 47 3f 01           ldm8u	r7, [0x13f]
 1c                    add	r7, r4
 f4 b2                 dec16	r2
 f4 a2                 tst8	r2
 db 09 ff              brne16	avm_test_main+168
 f0 5f 40 01           stm16	[0x140], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
