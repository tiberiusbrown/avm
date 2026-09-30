
float_conversions.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 float_conversions.c
00000100 l     O .data	00000040 floats
00000140 l     O .data	00000040 integers
00000180 l     O .data	00000004 float_conversions_result
00000000 l    df *ABS*	00000000 runtime.c
00000509 l       .init_array	00000000 .hidden __init_array_end
00000509 l       .init_array	00000000 .hidden __init_array_start
00000509 l       .fini_array	00000000 .hidden __fini_array_start
00000509 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000240 avm_test_main
00000507 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 e9 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 09 05              ldi16	r4, 0x509
 c1 00                 ldi8	r5, 0x0
 c6 09 05              ldi16	r6, 0x509
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 09 05           ldi16	r0, 0x509
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 09 05           ldi16	r2, 0x509
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
 c4 09 05              ldi16	r4, 0x509
 c1 00                 ldi8	r5, 0x0
 c6 09 05              ldi16	r6, 0x509
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 09 05           ldi16	r2, 0x509
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 09 05           ldi16	r0, 0x509
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
 d6 f6                 adjsp	-0xa
 aa                    xor	r6, r6
 c7 e1 c3              ldi16	r7, 0xc3e1
 c4 00 01              ldi16	r4, 0x100
 f0 6b c8              st32	[r4], q3
 c6 90 7d              ldi16	r6, 0x7d90
 c7 fc ff              ldi16	r7, 0xfffc
 c4 40 01              ldi16	r4, 0x140
 f0 6b c8              st32	[r4], q3
 f0 04 00 e0           ldi16	r0, 0xe000
 f0 05 be c3           ldi16	r1, 0xc3be
 c6 04 01              ldi16	r6, 0x104
 f0 6b 0c              st32	[r6], q0
 f0 04 19 0e           ldi16	r0, 0xe19
 f0 05 fd ff           ldi16	r1, 0xfffd
 c6 44 01              ldi16	r6, 0x144
 f0 6b 0c              st32	[r6], q0
 f0 04 00 c0           ldi16	r0, 0xc000
 f0 05 9c c3           ldi16	r1, 0xc39c
 c6 08 01              ldi16	r6, 0x108
 f0 6b 0c              st32	[r6], q0
 f0 04 a2 9e           ldi16	r0, 0x9ea2
 f0 05 fd ff           ldi16	r1, 0xfffd
 c6 48 01              ldi16	r6, 0x148
 f0 6b 0c              st32	[r6], q0
 f0 04 00 40           ldi16	r0, 0x4000
 f0 05 75 c3           ldi16	r1, 0xc375
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 0c              st32	[r6], q0
 f0 04 2b 2f           ldi16	r0, 0x2f2b
 f0 05 fe ff           ldi16	r1, 0xfffe
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 0c              st32	[r6], q0
 f2 30                 sub	r0, r0
 f0 05 31 c3           ldi16	r1, 0xc331
 c6 10 01              ldi16	r6, 0x110
 f0 6b 0c              st32	[r6], q0
 f0 04 b4 bf           ldi16	r0, 0xbfb4
 f0 05 fe ff           ldi16	r1, 0xfffe
 c6 50 01              ldi16	r6, 0x150
 f0 6b 0c              st32	[r6], q0
 f0 04 00 80           ldi16	r0, 0x8000
 f0 05 d9 c2           ldi16	r1, 0xc2d9
 c6 14 01              ldi16	r6, 0x114
 f0 6b 0c              st32	[r6], q0
 f0 04 3d 50           ldi16	r0, 0x503d
 f0 05 ff ff           ldi16	r1, 0xffff
 c6 54 01              ldi16	r6, 0x154
 f0 6b 0c              st32	[r6], q0
 f2 30                 sub	r0, r0
 f0 05 22 c2           ldi16	r1, 0xc222
 c6 18 01              ldi16	r6, 0x118
 f0 6b 0c              st32	[r6], q0
 f0 04 c6 e0           ldi16	r0, 0xe0c6
 f0 05 ff ff           ldi16	r1, 0xffff
 c6 58 01              ldi16	r6, 0x158
 f0 6b 0c              st32	[r6], q0
 f2 30                 sub	r0, r0
 f0 05 de 41           ldi16	r1, 0x41de
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 0c              st32	[r6], q0
 f0 04 4f 71           ldi16	r0, 0x714f
 f2 39                 sub	r1, r1
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 0c              st32	[r6], q0
 f2 30                 sub	r0, r0
 f0 05 c0 42           ldi16	r1, 0x42c0
 c6 20 01              ldi16	r6, 0x120
 f0 6b 0c              st32	[r6], q0
 f0 04 d8 01           ldi16	r0, 0x1d8
 f0 01 01              ldi8	r1, 0x1
 c6 60 01              ldi16	r6, 0x160
 f0 6b 0c              st32	[r6], q0
 f0 04 00 40           ldi16	r0, 0x4000
 f0 05 24 43           ldi16	r1, 0x4324
 c6 24 01              ldi16	r6, 0x124
 f0 6b 0c              st32	[r6], q0
 f0 04 61 92           ldi16	r0, 0x9261
 f0 01 01              ldi8	r1, 0x1
 c6 64 01              ldi16	r6, 0x164
 f0 6b 0c              st32	[r6], q0
 f0 04 00 80           ldi16	r0, 0x8000
 f0 05 68 43           ldi16	r1, 0x4368
 c6 28 01              ldi16	r6, 0x128
 f0 6b 0c              st32	[r6], q0
 f0 04 ea 22           ldi16	r0, 0x22ea
 f0 01 02              ldi8	r1, 0x2
 c6 68 01              ldi16	r6, 0x168
 f0 6b 0c              st32	[r6], q0
 f0 04 00 60           ldi16	r0, 0x6000
 f0 05 96 43           ldi16	r1, 0x4396
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 0c              st32	[r6], q0
 f0 04 73 b3           ldi16	r0, 0xb373
 f0 01 02              ldi8	r1, 0x2
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 0c              st32	[r6], q0
 f0 04 00 80           ldi16	r0, 0x8000
 f0 05 b8 43           ldi16	r1, 0x43b8
 c6 30 01              ldi16	r6, 0x130
 f0 6b 0c              st32	[r6], q0
 f0 04 fc 43           ldi16	r0, 0x43fc
 f0 01 03              ldi8	r1, 0x3
 c6 70 01              ldi16	r6, 0x170
 f0 6b 0c              st32	[r6], q0
 f0 04 00 a0           ldi16	r0, 0xa000
 f0 05 da 43           ldi16	r1, 0x43da
 c6 34 01              ldi16	r6, 0x134
 f0 6b 0c              st32	[r6], q0
 f0 04 85 d4           ldi16	r0, 0xd485
 f0 01 03              ldi8	r1, 0x3
 c6 74 01              ldi16	r6, 0x174
 f0 6b 0c              st32	[r6], q0
 f0 04 00 c0           ldi16	r0, 0xc000
 f0 05 fc 43           ldi16	r1, 0x43fc
 c6 38 01              ldi16	r6, 0x138
 f0 6b 0c              st32	[r6], q0
 f0 04 0e 65           ldi16	r0, 0x650e
 f0 01 04              ldi8	r1, 0x4
 c6 78 01              ldi16	r6, 0x178
 f0 6b 0c              st32	[r6], q0
 f0 04 00 70           ldi16	r0, 0x7000
 f0 05 0f 44           ldi16	r1, 0x440f
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 0c              st32	[r6], q0
 f0 04 97 f5           ldi16	r0, 0xf597
 f0 01 04              ldi8	r1, 0x4
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 0c              st32	[r6], q0
 a0                    xor	r4, r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 c5 e0 93              ldi16	r5, 0x93e0
 f4 40                 stsp16	[sp+0x0], r4
 a0                    xor	r4, r4
 08                    mov	r6, r4
 c7 00 01              ldi16	r7, 0x100
 1b                    add	r6, r7
 f0 6a 0c              ld32	q0, [r6]
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 aa                    xor	r6, r6
 c7 80 44              ldi16	r7, 0x4480
 ff 03                 fadd	q0, q3
 ff c7 0c              ftou32	q3, q0
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff c6 03              ftos32	q0, q3
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f7 63                 add32	q0, q3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff c2 63              ftos16	r6, q3
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 08                    mov	r6, r4
 c7 40 01              ldi16	r7, 0x140
 1b                    add	r6, r7
 f0 6a cc              ld32	q3, [r6]
 ff c4 07              s32tof	q1, q3
 f2 30                 sub	r0, r0
 f0 05 00 3e           ldi16	r1, 0x3e00
 ff 24                 fmul	q1, q0
 19                    add	r6, r5
 ff c1 63              u16tof	q3, r6
 ff 07                 fadd	q1, q3
 c6 00 50              ldi16	r6, 0x5000
 c7 c3 47              ldi16	r7, 0x47c3
 ff 07                 fadd	q1, q3
 ff c7 05              ftou32	q1, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f7 67                 add32	q1, q3
 c8 04                 addi.s8	r4, 0x4
 cc 40                 cmpi.s8	r4, 0x40
 d1 96                 brne8	avm_test_main+443
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 0c                 cmpi.s8	r6, 0xc
 d1 88                 brne8	avm_test_main+440
 c4 80 01              ldi16	r4, 0x180
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
