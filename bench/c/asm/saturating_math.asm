
saturating_math.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 saturating_math.c
00000100 l     O .data	00000040 unsigned_inputs
00000140 l     O .data	00000040 signed_inputs
000004f0 l     F .text	00000018 saturated_add
00000508 l     F .text	0000001d clamp_signed
00000180 l     O .data	00000002 saturating_math_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 integer.c
000005d8 l       .init_array	00000000 .hidden __init_array_end
000005d8 l       .init_array	00000000 .hidden __init_array_start
000005d8 l       .fini_array	00000000 .hidden __fini_array_start
000005d8 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000229 avm_test_main
00000525 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000527 g     F .text	000000b1 __avm_mulsi3

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 07 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 d8 05              ldi16	r4, 0x5d8
 c1 00                 ldi8	r5, 0x0
 c6 d8 05              ldi16	r6, 0x5d8
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 d8 05           ldi16	r0, 0x5d8
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 d8 05           ldi16	r2, 0x5d8
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 d8 05              ldi16	r4, 0x5d8
 c1 00                 ldi8	r5, 0x0
 c6 d8 05              ldi16	r6, 0x5d8
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 d8 05           ldi16	r2, 0x5d8
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 d8 05           ldi16	r0, 0x5d8
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 a5                    xor	r5, r5
 f0 5d 00 01           stm16	[0x100], r5
 c4 40 a2              ldi16	r4, 0xa240
 f0 5c 40 01           stm16	[0x140], r4
 c4 f7 07              ldi16	r4, 0x7f7
 f0 5c 02 01           stm16	[0x102], r4
 c4 27 a8              ldi16	r4, 0xa827
 f0 5c 42 01           stm16	[0x142], r4
 c4 ee 0f              ldi16	r4, 0xfee
 f0 5c 04 01           stm16	[0x104], r4
 c4 0e ae              ldi16	r4, 0xae0e
 f0 5c 44 01           stm16	[0x144], r4
 c4 e5 17              ldi16	r4, 0x17e5
 f0 5c 06 01           stm16	[0x106], r4
 c4 f5 b3              ldi16	r4, 0xb3f5
 f0 5c 46 01           stm16	[0x146], r4
 c4 dc 1f              ldi16	r4, 0x1fdc
 f0 5c 08 01           stm16	[0x108], r4
 c4 dc b9              ldi16	r4, 0xb9dc
 f0 5c 48 01           stm16	[0x148], r4
 c4 d3 27              ldi16	r4, 0x27d3
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 c3 bf              ldi16	r4, 0xbfc3
 f0 5c 4a 01           stm16	[0x14a], r4
 c4 ca 2f              ldi16	r4, 0x2fca
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 aa c5              ldi16	r4, 0xc5aa
 f0 5c 4c 01           stm16	[0x14c], r4
 c4 c1 37              ldi16	r4, 0x37c1
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 91 cb              ldi16	r4, 0xcb91
 f0 5c 4e 01           stm16	[0x14e], r4
 c4 b8 3f              ldi16	r4, 0x3fb8
 f0 5c 10 01           stm16	[0x110], r4
 c4 78 d1              ldi16	r4, 0xd178
 f0 5c 50 01           stm16	[0x150], r4
 c4 af 47              ldi16	r4, 0x47af
 f0 5c 12 01           stm16	[0x112], r4
 c4 5f d7              ldi16	r4, 0xd75f
 f0 5c 52 01           stm16	[0x152], r4
 c4 a6 4f              ldi16	r4, 0x4fa6
 f0 5c 14 01           stm16	[0x114], r4
 c4 46 dd              ldi16	r4, 0xdd46
 f0 5c 54 01           stm16	[0x154], r4
 c4 9d 57              ldi16	r4, 0x579d
 f0 5c 16 01           stm16	[0x116], r4
 c4 2d e3              ldi16	r4, 0xe32d
 f0 5c 56 01           stm16	[0x156], r4
 c4 94 5f              ldi16	r4, 0x5f94
 f0 5c 18 01           stm16	[0x118], r4
 c4 14 e9              ldi16	r4, 0xe914
 f0 5c 58 01           stm16	[0x158], r4
 c4 8b 67              ldi16	r4, 0x678b
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 fb ee              ldi16	r4, 0xeefb
 f0 5c 5a 01           stm16	[0x15a], r4
 c4 82 6f              ldi16	r4, 0x6f82
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 e2 f4              ldi16	r4, 0xf4e2
 f0 5c 5c 01           stm16	[0x15c], r4
 c4 79 77              ldi16	r4, 0x7779
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 c9 fa              ldi16	r4, 0xfac9
 f0 5c 5e 01           stm16	[0x15e], r4
 c4 70 7f              ldi16	r4, 0x7f70
 f0 5c 20 01           stm16	[0x120], r4
 c0 b0                 ldi8	r4, 0xb0
 f0 5c 60 01           stm16	[0x160], r4
 c4 67 87              ldi16	r4, 0x8767
 f0 5c 22 01           stm16	[0x122], r4
 c4 97 06              ldi16	r4, 0x697
 f0 5c 62 01           stm16	[0x162], r4
 c4 5e 8f              ldi16	r4, 0x8f5e
 f0 5c 24 01           stm16	[0x124], r4
 c4 7e 0c              ldi16	r4, 0xc7e
 f0 5c 64 01           stm16	[0x164], r4
 c4 55 97              ldi16	r4, 0x9755
 f0 5c 26 01           stm16	[0x126], r4
 c4 65 12              ldi16	r4, 0x1265
 f0 5c 66 01           stm16	[0x166], r4
 c4 4c 9f              ldi16	r4, 0x9f4c
 f0 5c 28 01           stm16	[0x128], r4
 c4 4c 18              ldi16	r4, 0x184c
 f0 5c 68 01           stm16	[0x168], r4
 c4 43 a7              ldi16	r4, 0xa743
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 33 1e              ldi16	r4, 0x1e33
 f0 5c 6a 01           stm16	[0x16a], r4
 c4 3a af              ldi16	r4, 0xaf3a
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 1a 24              ldi16	r4, 0x241a
 f0 5c 6c 01           stm16	[0x16c], r4
 c4 31 b7              ldi16	r4, 0xb731
 f0 5c 2e 01           stm16	[0x12e], r4
 c4 01 2a              ldi16	r4, 0x2a01
 f0 5c 6e 01           stm16	[0x16e], r4
 c4 28 bf              ldi16	r4, 0xbf28
 f0 5c 30 01           stm16	[0x130], r4
 c4 e8 2f              ldi16	r4, 0x2fe8
 f0 5c 70 01           stm16	[0x170], r4
 c4 1f c7              ldi16	r4, 0xc71f
 f0 5c 32 01           stm16	[0x132], r4
 c4 cf 35              ldi16	r4, 0x35cf
 f0 5c 72 01           stm16	[0x172], r4
 c4 16 cf              ldi16	r4, 0xcf16
 f0 5c 34 01           stm16	[0x134], r4
 c4 b6 3b              ldi16	r4, 0x3bb6
 f0 5c 74 01           stm16	[0x174], r4
 c4 0d d7              ldi16	r4, 0xd70d
 f0 5c 36 01           stm16	[0x136], r4
 c4 9d 41              ldi16	r4, 0x419d
 f0 5c 76 01           stm16	[0x176], r4
 c4 04 df              ldi16	r4, 0xdf04
 f0 5c 38 01           stm16	[0x138], r4
 c4 84 47              ldi16	r4, 0x4784
 f0 5c 78 01           stm16	[0x178], r4
 c4 fb e6              ldi16	r4, 0xe6fb
 f0 5c 3a 01           stm16	[0x13a], r4
 c4 6b 4d              ldi16	r4, 0x4d6b
 f0 5c 7a 01           stm16	[0x17a], r4
 c4 f2 ee              ldi16	r4, 0xeef2
 f0 5c 3c 01           stm16	[0x13c], r4
 c4 52 53              ldi16	r4, 0x5352
 f0 5c 7c 01           stm16	[0x17c], r4
 c4 e9 f6              ldi16	r4, 0xf6e9
 f0 5c 3e 01           stm16	[0x13e], r4
 c4 39 59              ldi16	r4, 0x5939
 f0 5c 7e 01           stm16	[0x17e], r4
 d7 01                 sys	debug_break
 c4 cf 04              ldi16	r4, 0x4cf
 f4 48                 stsp16	[sp+0x2], r4
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 f1 0d                 mov	r1, r5
 f4 51                 stsp16	[sp+0x4], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 fe 2c                 mul16	r5, r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 30 00              ldsp16	r0, [sp+0x0]
 c4 40 01              ldi16	r4, 0x140
 04                    mov	r5, r4
 f0 07 00 01           ldi16	r3, 0x100
 f0 6c 97              ld16	r4, [r3+]
 f4 68                 stsp16	[sp+0xa], r4
 f7 2e                 ld16	r6, [r5+]
 f4 62                 stsp16	[sp+0x8], r6
 f4 71                 stsp16	[sp+0xc], r5
 f4 19                 ldsp16	r5, [sp+0x6]
 d5 37                 call8	saturated_add
 f1 14                 mov	r2, r4
 f9 46                 xor	r2, r1
 f4 20                 ldsp16	r4, [sp+0x8]
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 c2 03                 ldi8	r6, 0x3
 af                    xor	r7, r7
 d5 60                 call8	__avm_mulsi3
 f4 2a                 ldsp16	r6, [sp+0xa]
 af                    xor	r7, r7
 f7 6b                 add32	q2, q3
 d5 3a                 call8	clamp_signed
 f1 0c                 mov	r1, r4
 f4 31                 ldsp16	r5, [sp+0xc]
 f2 0a                 add	r1, r2
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 d0                 brne8	avm_test_main+483
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 ad                 inc16	r5
 cd 14                 cmpi.s8	r5, 0x14
 d1 b5                 brne8	avm_test_main+464
 f0 59 80 01           stm16	[0x180], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<saturated_add>:
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 af                    xor	r7, r7
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 c4 ff ff              ldi16	r4, 0xffff
 a5                    xor	r5, r5
 f0 69 08              cmp32	q0, q2
 fc 20                 cmov.ult	r4, r0
 fc 29                 cmov.ult	r5, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<clamp_signed>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 ff 7f              ldi16	r4, 0x7fff
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d9 04                 brsge8	clamp_signed+15
 c4 ff 7f              ldi16	r4, 0x7fff
 ef                    ret
 c4 00 80              ldi16	r4, 0x8000
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f1 05                 mov	r0, r5
 f2 39                 sub	r1, r1
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 68                 stsp16	[sp+0xa], r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f1 07                 mov	r0, r7
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 fa 7f                 lsr16i	r4, 0xf
 f2 20                 add	r4, r0
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 fe 26                 mul16	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 2a                 ldsp16	r6, [sp+0xa]
 fe 34                 mul16	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 f4 4a                 stsp16	[sp+0x2], r6
 f1 74                 zext8	r4
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 18                 ldsp16	r4, [sp+0x6]
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f3 18                 mulu8.w	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 3b                 mulsu8.w	r6, r7
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 0a                 ldsp16	r6, [sp+0x2]
 f3 2e                 muls8.w	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f3 32                 mulsu8.w	r4, r6
 08                    mov	r6, r4
 fa d8                 asr16i	r6, 0x8
 f4 1b                 ldsp16	r7, [sp+0x6]
 1b                    add	r6, r7
 f0 37 10              ldsp16	r7, [sp+0x10]
 fa e8                 asr16i	r7, 0x8
 1e                    add	r7, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 1e                    add	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 f0 36 10              ldsp16	r6, [sp+0x10]
 18                    add	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 fa 38                 lsl16i	r4, 0x8
 08                    mov	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 33                 ldsp16	r7, [sp+0xc]
 1e                    add	r7, r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 32                 ldsp16	r6, [sp+0xc]
 38                    cmp	r6, r4
 f8 14                 cset.ult	r4
 f4 29                 ldsp16	r5, [sp+0xa]
 11                    add	r4, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f0 35 10              ldsp16	r5, [sp+0x10]
 fa 48                 lsl16i	r5, 0x8
 f4 12                 ldsp16	r6, [sp+0x4]
 16                    add	r5, r6
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 32                 ldsp16	r6, [sp+0xc]
 36                    cmp	r5, r6
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 0d                    mov	r7, r5
 aa                    xor	r6, r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 a5                    xor	r5, r5
 92                    or	r4, r6
 97                    or	r5, r7
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
