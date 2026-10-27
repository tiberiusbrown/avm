
float_conversions.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 float_conversions.c
00000100 l     O .data	00000004 float_conversions_result
00000104 l     O .data	00000040 floats
00000144 l     O .data	00000040 integers
00000000 l    df *ABS*	00000000 runtime.c
000004d1 l       .init_array	00000000 .hidden __init_array_end
000004d1 l       .init_array	00000000 .hidden __init_array_start
000004d1 l       .fini_array	00000000 .hidden __fini_array_start
000004d1 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000208 avm_test_main
000004cf g     F .text	00000002 avm_halt
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
 e1 b1 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 d1 04              ldi16	r4, 0x4d1
 c1 00                 ldi8	r5, 0x0
 c6 d1 04              ldi16	r6, 0x4d1
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 d1 04           ldi16	r0, 0x4d1
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 d1 04           ldi16	r2, 0x4d1
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
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
 d0 03                 breq8	0x3 <L0>
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 d1 04              ldi16	r4, 0x4d1
 c1 00                 ldi8	r5, 0x0
 c6 d1 04              ldi16	r6, 0x4d1
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 d1 04           ldi16	r2, 0x4d1
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 d1 04           ldi16	r0, 0x4d1
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
<L3>:
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
 a0                    xor	r4, r4
 c5 e1 c3              ldi16	r5, 0xc3e1
 c7 04 01              ldi16	r7, 0x104
 f0 6b 8e              st32	[r7], q2
 c4 90 7d              ldi16	r4, 0x7d90
 c5 fc ff              ldi16	r5, 0xfffc
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c4 00 e0              ldi16	r4, 0xe000
 c5 be c3              ldi16	r5, 0xc3be
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c4 19 0e              ldi16	r4, 0xe19
 c5 fd ff              ldi16	r5, 0xfffd
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c4 00 c0              ldi16	r4, 0xc000
 c5 9c c3              ldi16	r5, 0xc39c
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 a2 9e              ldi16	r4, 0x9ea2
 c5 fd ff              ldi16	r5, 0xfffd
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c4 00 40              ldi16	r4, 0x4000
 c5 75 c3              ldi16	r5, 0xc375
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 2b 2f              ldi16	r4, 0x2f2b
 c5 fe ff              ldi16	r5, 0xfffe
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 31 c3              ldi16	r5, 0xc331
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c4 b4 bf              ldi16	r4, 0xbfb4
 c5 fe ff              ldi16	r5, 0xfffe
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c4 00 80              ldi16	r4, 0x8000
 c5 d9 c2              ldi16	r5, 0xc2d9
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 3d 50              ldi16	r4, 0x503d
 c5 ff ff              ldi16	r5, 0xffff
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 22 c2              ldi16	r5, 0xc222
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c4 c6 e0              ldi16	r4, 0xe0c6
 c5 ff ff              ldi16	r5, 0xffff
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 de 41              ldi16	r5, 0x41de
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c4 4f 71              ldi16	r4, 0x714f
 a5                    xor	r5, r5
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 c0 42              ldi16	r5, 0x42c0
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c4 d8 01              ldi16	r4, 0x1d8
 c1 01                 ldi8	r5, 0x1
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 00 40              ldi16	r4, 0x4000
 c5 24 43              ldi16	r5, 0x4324
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c4 61 92              ldi16	r4, 0x9261
 c1 01                 ldi8	r5, 0x1
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 00 80              ldi16	r4, 0x8000
 c5 68 43              ldi16	r5, 0x4368
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c4 ea 22              ldi16	r4, 0x22ea
 c1 02                 ldi8	r5, 0x2
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c4 00 60              ldi16	r4, 0x6000
 c5 96 43              ldi16	r5, 0x4396
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c4 73 b3              ldi16	r4, 0xb373
 c1 02                 ldi8	r5, 0x2
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c4 00 80              ldi16	r4, 0x8000
 c5 b8 43              ldi16	r5, 0x43b8
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 fc 43              ldi16	r4, 0x43fc
 c1 03                 ldi8	r5, 0x3
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c4 00 a0              ldi16	r4, 0xa000
 c5 da 43              ldi16	r5, 0x43da
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 85 d4              ldi16	r4, 0xd485
 c1 03                 ldi8	r5, 0x3
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 c4 00 c0              ldi16	r4, 0xc000
 c5 fc 43              ldi16	r5, 0x43fc
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 0e 65              ldi16	r4, 0x650e
 c1 04                 ldi8	r5, 0x4
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 c4 00 70              ldi16	r4, 0x7000
 c5 0f 44              ldi16	r5, 0x440f
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c4 97 f5              ldi16	r4, 0xf597
 c1 04                 ldi8	r5, 0x4
 c6 80 01              ldi16	r6, 0x180
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 c5 e0 93              ldi16	r5, 0x93e0
 f4 49                 stsp16	[sp+0x2], r5
 04                    mov	r5, r4
<L0>:
 f4 41                 stsp16	[sp+0x0], r5
 a0                    xor	r4, r4
 04                    mov	r5, r4
<L1>:
 f4 61                 stsp16	[sp+0x8], r5
 01                    mov	r4, r5
 13                    add	r4, r7
 f0 6a 48              ld32	q1, [r4]
 aa                    xor	r6, r6
 c7 80 44              ldi16	r7, 0x4480
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 ff 13                 ftou32
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f2 69                 mov32	q2, q1
 ff 12                 ftos32
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 6e                 add32	q3, q2
 f2 69                 mov32	q2, q1
 ff 0e                 ftos16
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 c5 44 01              ldi16	r5, 0x144
 11                    add	r4, r5
 f0 6a 08              ld32	q0, [r4]
 f2 68                 mov32	q2, q0
 ff 10                 s32tof
 aa                    xor	r6, r6
 c7 00 3e              ldi16	r7, 0x3e00
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f2 04                 add	r0, r4
 f1 20                 mov	r4, r0
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 00 50              ldi16	r6, 0x5000
 c7 c3 47              ldi16	r7, 0x47c3
 ff 00                 fadd
 c7 04 01              ldi16	r7, 0x104
 ff 13                 ftou32
 f2 62                 mov32	q0, q2
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 61                 add32	q0, q1
 c9 04                 addi.s8	r5, 0x4
 cd 40                 cmpi.s8	r5, 0x40
 d1 93                 brne8	-0x6d <L1>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 0c                 cmpi.s8	r5, 0xc
 d1 87                 brne8	-0x79 <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
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
