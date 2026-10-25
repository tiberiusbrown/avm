
div_pow2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 div_pow2.c
00000100 l     O .data	00000004 div_pow2_result
00000104 l     O .data	00000030 values16
00000134 l     O .data	00000060 values32
00000000 l    df *ABS*	00000000 runtime.c
00000543 l       .init_array	00000000 .hidden __init_array_end
00000543 l       .init_array	00000000 .hidden __init_array_start
00000543 l       .fini_array	00000000 .hidden __fini_array_start
00000543 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000027a avm_test_main
00000541 g     F .text	00000002 avm_halt
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
 e1 23 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 43 05              ldi16	r4, 0x543
 c1 00                 ldi8	r5, 0x0
 c6 43 05              ldi16	r6, 0x543
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 43 05           ldi16	r0, 0x543
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 43 05           ldi16	r2, 0x543
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
 c4 43 05              ldi16	r4, 0x543
 c1 00                 ldi8	r5, 0x0
 c6 43 05              ldi16	r6, 0x543
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 43 05           ldi16	r2, 0x543
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 43 05           ldi16	r0, 0x543
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
 d6 ea                 adjsp	-0x16
 c4 88 96              ldi16	r4, 0x9688
 f0 5c 04 01           stm16	[0x104], r4
 c4 80 7b              ldi16	r4, 0x7b80
 c5 e1 ff              ldi16	r5, 0xffe1
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c4 cb 9f              ldi16	r4, 0x9fcb
 f0 5c 06 01           stm16	[0x106], r4
 c4 57 36              ldi16	r4, 0x3657
 c5 e4 ff              ldi16	r5, 0xffe4
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c4 0e a9              ldi16	r4, 0xa90e
 f0 5c 08 01           stm16	[0x108], r4
 c4 2e f1              ldi16	r4, 0xf12e
 c5 e6 ff              ldi16	r5, 0xffe6
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c4 51 b2              ldi16	r4, 0xb251
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 05 ac              ldi16	r4, 0xac05
 c5 e9 ff              ldi16	r5, 0xffe9
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c4 94 bb              ldi16	r4, 0xbb94
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 dc 66              ldi16	r4, 0x66dc
 c5 ec ff              ldi16	r5, 0xffec
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c4 d7 c4              ldi16	r4, 0xc4d7
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 b3 21              ldi16	r4, 0x21b3
 c5 ef ff              ldi16	r5, 0xffef
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c4 1a ce              ldi16	r4, 0xce1a
 f0 5c 10 01           stm16	[0x110], r4
 c4 8a dc              ldi16	r4, 0xdc8a
 c5 f1 ff              ldi16	r5, 0xfff1
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c4 5d d7              ldi16	r4, 0xd75d
 f0 5c 12 01           stm16	[0x112], r4
 c4 61 97              ldi16	r4, 0x9761
 c5 f4 ff              ldi16	r5, 0xfff4
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c4 a0 e0              ldi16	r4, 0xe0a0
 f0 5c 14 01           stm16	[0x114], r4
 c4 38 52              ldi16	r4, 0x5238
 c5 f7 ff              ldi16	r5, 0xfff7
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c4 e3 e9              ldi16	r4, 0xe9e3
 f0 5c 16 01           stm16	[0x116], r4
 c4 0f 0d              ldi16	r4, 0xd0f
 c5 fa ff              ldi16	r5, 0xfffa
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c4 26 f3              ldi16	r4, 0xf326
 f0 5c 18 01           stm16	[0x118], r4
 c4 e6 c7              ldi16	r4, 0xc7e6
 c5 fc ff              ldi16	r5, 0xfffc
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c4 69 fc              ldi16	r4, 0xfc69
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 bd 82              ldi16	r4, 0x82bd
 c5 ff ff              ldi16	r5, 0xffff
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c4 ac 05              ldi16	r4, 0x5ac
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 94 3d              ldi16	r4, 0x3d94
 c1 02                 ldi8	r5, 0x2
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 ef 0e              ldi16	r4, 0xeef
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 6b f8              ldi16	r4, 0xf86b
 c1 04                 ldi8	r5, 0x4
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 32 18              ldi16	r4, 0x1832
 f0 5c 20 01           stm16	[0x120], r4
 c4 42 b3              ldi16	r4, 0xb342
 c1 07                 ldi8	r5, 0x7
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c4 75 21              ldi16	r4, 0x2175
 f0 5c 22 01           stm16	[0x122], r4
 c4 19 6e              ldi16	r4, 0x6e19
 c1 0a                 ldi8	r5, 0xa
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c4 b8 2a              ldi16	r4, 0x2ab8
 f0 5c 24 01           stm16	[0x124], r4
 c4 f0 28              ldi16	r4, 0x28f0
 c1 0d                 ldi8	r5, 0xd
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c4 fb 33              ldi16	r4, 0x33fb
 f0 5c 26 01           stm16	[0x126], r4
 c4 c7 e3              ldi16	r4, 0xe3c7
 c1 0f                 ldi8	r5, 0xf
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 c4 3e 3d              ldi16	r4, 0x3d3e
 f0 5c 28 01           stm16	[0x128], r4
 c4 9e 9e              ldi16	r4, 0x9e9e
 c1 12                 ldi8	r5, 0x12
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 c4 81 46              ldi16	r4, 0x4681
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 75 59              ldi16	r4, 0x5975
 c1 15                 ldi8	r5, 0x15
 c6 80 01              ldi16	r6, 0x180
 f0 6b 8c              st32	[r6], q2
 c4 c4 4f              ldi16	r4, 0x4fc4
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 4c 14              ldi16	r4, 0x144c
 c1 18                 ldi8	r5, 0x18
 c6 84 01              ldi16	r6, 0x184
 f0 6b 8c              st32	[r6], q2
 c4 07 59              ldi16	r4, 0x5907
 f0 5c 2e 01           stm16	[0x12e], r4
 c4 23 cf              ldi16	r4, 0xcf23
 c1 1a                 ldi8	r5, 0x1a
 c6 88 01              ldi16	r6, 0x188
 f0 6b 8c              st32	[r6], q2
 c4 4a 62              ldi16	r4, 0x624a
 f0 5c 30 01           stm16	[0x130], r4
 c4 fa 89              ldi16	r4, 0x89fa
 c1 1d                 ldi8	r5, 0x1d
 c6 8c 01              ldi16	r6, 0x18c
 f0 6b 8c              st32	[r6], q2
 c4 8d 6b              ldi16	r4, 0x6b8d
 f0 5c 32 01           stm16	[0x132], r4
 c4 d1 44              ldi16	r4, 0x44d1
 c1 20                 ldi8	r5, 0x20
 c6 90 01              ldi16	r6, 0x190
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 c0 18                 ldi8	r4, 0x18
 f0 3c 14              stsp16	[sp+0x14], r4
<L0>:
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 36 14              ldsp16	r6, [sp+0x14]
 c4 34 01              ldi16	r4, 0x134
 f4 50                 stsp16	[sp+0x4], r4
 c4 04 01              ldi16	r4, 0x104
<L1>:
 f0 3e 10              stsp16	[sp+0x10], r6
 f7 22                 ld16	r2, [r4+]
 f4 78                 stsp16	[sp+0xe], r4
 c0 08                 ldi8	r4, 0x8
 f1 2a                 mov	r6, r2
 ec f4                 srem16	r6, r4
 c1 02                 ldi8	r5, 0x2
 ec 95                 sdiv16	r2, r5
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 6a 08              ld32	q0, [r4]
 f1 21                 mov	r4, r1
 fa bf                 asr16i	r4, 0xf
 a5                    xor	r5, r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 fa 7c                 lsr16i	r4, 0xc
 f7 68                 add32	q2, q0
 0d                    mov	r7, r5
 fa 74                 lsr16i	r4, 0x4
 f4 60                 stsp16	[sp+0x8], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 fa 3c                 lsl16i	r4, 0xc
 f4 21                 ldsp16	r5, [sp+0x8]
 91                    or	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 03                    mov	r4, r7
 f4 09                 ldsp16	r5, [sp+0x2]
 fa b4                 asr16i	r4, 0x4
 f4 40                 stsp16	[sp+0x0], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 0d                    mov	r7, r5
 06                    mov	r5, r6
 f7 69                 add32	q2, q1
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 07                    mov	r5, r7
 fa 7e                 lsr16i	r4, 0xe
 f7 68                 add32	q2, q0
 f0 06 fc ff           ldi16	r2, 0xfffc
 f0 07 ff ff           ldi16	r3, 0xffff
 f9 50                 and	r2, r4
 f9 74                 and	r3, r5
 f0 36 10              ldsp16	r6, [sp+0x10]
 f7 71                 sub32	q0, q1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f4 11                 ldsp16	r5, [sp+0x4]
 c9 04                 addi.s8	r5, 0x4
 f4 51                 stsp16	[sp+0x4], r5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 db 7c ff              brne16	-0x84 <L1>
 f0 35 12              ldsp16	r5, [sp+0x12]
 f4 ad                 inc16	r5
 cd 14                 cmpi.s8	r5, 0x14
 db 64 ff              brne16	-0x9c <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
