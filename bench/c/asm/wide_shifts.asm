
wide_shifts.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 wide_shifts.c
00000100 l     O .data	00000020 values
00000120 l     O .data	00000004 counts
00000124 l     O .data	00000008 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000000 l    df *ABS*	00000000 integer.c
00000619 l       .init_array	00000000 .hidden __init_array_end
00000619 l       .init_array	00000000 .hidden __init_array_start
00000619 l       .fini_array	00000000 .hidden __fini_array_start
00000619 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000169 avm_test_main
00000430 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000432 g     F .text	00000077 __avm_ashldi3
000004a9 g     F .text	0000007c __avm_lshrdi3
00000525 g     F .text	00000071 __avm_ashrdi3
00000596 g     F .text	0000002c __avm_ashlsi3
000005c2 g     F .text	0000002c __avm_lshrsi3
000005ee g     F .text	0000002b __avm_ashrsi3

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
 e1 12 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 19 06              ldi16	r4, 0x619
 c1 00                 ldi8	r5, 0x0
 c6 19 06              ldi16	r6, 0x619
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 19 06           ldi16	r0, 0x619
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 19 06           ldi16	r2, 0x619
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
 c4 19 06              ldi16	r4, 0x619
 c1 00                 ldi8	r5, 0x0
 c6 19 06              ldi16	r6, 0x619
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 19 06           ldi16	r2, 0x619
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 19 06           ldi16	r0, 0x619
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
 d6 e2                 adjsp	-0x1e
 c4 67 45              ldi16	r4, 0x4567
 c5 23 81              ldi16	r5, 0x8123
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 ef cd              ldi16	r4, 0xcdef
 c5 ab 89              ldi16	r5, 0x89ab
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 ff ff              ldi16	r5, 0xffff
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 00 80              ldi16	r5, 0x8000
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 f0 4c 20 01           stm8	[0x120], r4
 c0 0f                 ldi8	r4, 0xf
 f0 4c 21 01           stm8	[0x121], r4
 c0 20                 ldi8	r4, 0x20
 f0 4c 22 01           stm8	[0x122], r4
 c0 3f                 ldi8	r4, 0x3f
 f0 4c 23 01           stm8	[0x123], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c5 20 01              ldi16	r5, 0x120
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 08                    mov	r6, r4
<L0>:
 f0 3e 1c              stsp16	[sp+0x1c], r6
 c4 00 01              ldi16	r4, 0x100
 08                    mov	r6, r4
 a0                    xor	r4, r4
<L1>:
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f4 60                 stsp16	[sp+0x8], r4
 f0 3e 16              stsp16	[sp+0x16], r6
 0c                    mov	r7, r4
 1d                    add	r7, r5
 06                    mov	r5, r6
 c9 04                 addi.s8	r5, 0x4
 f0 6a 4a              ld32	q1, [r5]
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f0 6a 8c              ld32	q2, [r6]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 4b                    ld8u	r6, [r7]
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d6 fe                 adjsp	-0x2
 f4 42                 stsp16	[sp+0x0], r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 e1 b1 00              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f2 66                 mov32	q1, q2
 f2 63                 mov32	q0, q3
 d6 fe                 adjsp	-0x2
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 e1 0f 01              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 d6 fe                 adjsp	-0x2
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 40                 stsp16	[sp+0x0], r4
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f7 63                 add32	q0, q3
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f7 69                 add32	q2, q1
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 69 84              cmp32	q2, q1
 f8 14                 cset.ult	r4
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 e1 47 01              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 c5 20 01              ldi16	r5, 0x120
 f9 ca                 xor	r6, r2
 f9 ee                 xor	r7, r3
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f9 0a                 xor	r0, r2
 f9 2e                 xor	r1, r3
 ca 08                 addi.s8	r6, 0x8
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 47 ff              brne16	-0xb9 <L1>
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 32 ff              brne16	-0xce <L0>
 c4 24 01              ldi16	r4, 0x124
 f0 6b 08              st32	[r4], q0
 c4 28 01              ldi16	r4, 0x128
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<__avm_ashldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 13              ldsp16	r2, [sp+0x13]
 f0 0e 40              cmpi.s8	r2, 0x40
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d8 58                 bruge8	0x58 <L2>
 f0 0e 20              cmpi.s8	r2, 0x20
 d2 11                 brult8	0x11 <L0>
 f0 0a e0              addi.s8	r2, -0x20
 f1 2a                 mov	r6, r2
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 3c 01              call16	__avm_ashlsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 42                 jmp8	0x42 <L2>
<L0>:
 f6 2a                 tst16	r2
 d0 38                 breq8	0x38 <L1>
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f1 2a                 mov	r6, r2
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 20 01              call16	__avm_ashlsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 20                 ldi8	r4, 0x20
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 3d 01              call16	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 fe 00              call16	__avm_ashlsi3
 f2 6b                 mov32	q3, q1
 d4 06                 jmp8	0x6 <L2>
<L1>:
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f2 68                 mov32	q2, q0
<L2>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_lshrdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 13              ldsp16	r2, [sp+0x13]
 f0 0e 40              cmpi.s8	r2, 0x40
 f2 62                 mov32	q0, q2
 d8 5d                 bruge8	0x5d <L2>
 f0 0e 20              cmpi.s8	r2, 0x20
 d2 12                 brult8	0x12 <L0>
 f0 0a e0              addi.s8	r2, -0x20
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 e1 f0 00              call16	__avm_lshrsi3
 f2 30                 sub	r0, r0
 d4 46                 jmp8	0x46 <L2>
<L0>:
 f6 2a                 tst16	r2
 d0 3c                 breq8	0x3c <L1>
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 63                 mov32	q0, q3
 f1 2a                 mov	r6, r2
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 d4 00              call16	__avm_lshrsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 20                 ldi8	r4, 0x20
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 e1 99 00              call16	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 b2 00              call16	__avm_lshrsi3
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 d4 06                 jmp8	0x6 <L2>
<L1>:
 f2 63                 mov32	q0, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
<L2>:
 f2 6a                 mov32	q3, q0
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashrdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f0 30 13              ldsp16	r0, [sp+0x13]
 f0 0c 40              cmpi.s8	r0, 0x40
 d2 08                 brult8	0x8 <L0>
 03                    mov	r4, r7
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 08                    mov	r6, r4
 0d                    mov	r7, r5
 d4 54                 jmp8	0x54 <L2>
<L0>:
 f0 0c 20              cmpi.s8	r0, 0x20
 d2 15                 brult8	0x15 <L1>
 f0 08 e0              addi.s8	r0, -0x20
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 67                 mov32	q1, q3
 f2 6a                 mov32	q3, q0
 e1 a0 00              call16	__avm_ashrsi3
 f1 2b                 mov	r6, r3
 fa df                 asr16i	r6, 0xf
 0e                    mov	r7, r6
 d4 3a                 jmp8	0x3a <L2>
<L1>:
 f6 28                 tst16	r0
 d0 36                 breq8	0x36 <L2>
 f1 10                 mov	r2, r0
 f2 4b                 sub	r3, r3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 67                 mov32	q1, q3
 f1 28                 mov	r6, r0
 f4 1b                 ldsp16	r7, [sp+0x6]
 d5 57                 call8	__avm_lshrsi3
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c0 20                 ldi8	r4, 0x20
 f2 50                 sub	r4, r0
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 d5 1d                 call8	__avm_ashlsi3
 f2 62                 mov32	q0, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 f2 69                 mov32	q2, q1
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 d5 63                 call8	__avm_ashrsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
<L2>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashlsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0c                    mov	r7, r4
 fa 06                 shl16v	r5, r6
 fa 02                 shl16v	r4, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 1e                 lsr16v	r7, r6
 97                    or	r5, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 02                 shl16v	r4, r6
 04                    mov	r5, r4
 c0 00                 ldi8	r4, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

<__avm_lshrsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0d                    mov	r7, r5
 fa 12                 lsr16v	r4, r6
 fa 16                 lsr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 16                 lsr16v	r5, r6
 01                    mov	r4, r5
 c1 00                 ldi8	r5, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

<__avm_ashrsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1e                 breq8	0x1e <L2>
 0d                    mov	r7, r5
 fa 12                 lsr16v	r4, r6
 fa 26                 asr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
 d4 10                 jmp8	0x10 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 01                    mov	r4, r5
 fa 22                 asr16v	r4, r6
 fa cf                 asr16i	r5, 0xf
 d4 03                 jmp8	0x3 <L2>
<L1>:
 fa cf                 asr16i	r5, 0xf
 01                    mov	r4, r5
<L2>:
 ef                    ret
