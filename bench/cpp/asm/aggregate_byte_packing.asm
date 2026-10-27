
aggregate_byte_packing.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000224 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 aggregate_byte_packing.cpp
00000100 l     O .data	00000002 aggregate_byte_packing_result
00000102 l     O .data	00000040 input
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000463 l       .init_array	00000000 .hidden __init_array_end
00000463 l       .init_array	00000000 .hidden __init_array_start
00000463 l       .fini_array	00000000 .hidden __fini_array_start
00000463 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000024 _start
00000293 g     F .text	00000169 avm_test_main
000003fe g     F .text	00000065 __avm_terminate
000003fc g     F .text	00000002 avm_halt
00000268 g     F .text	00000007 consume2(Bytes2)
0000026f g     F .text	00000014 consume3(Bytes3)
00000283 g     F .text	00000010 consume4(Bytes4)
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1c                 call8	avm_run_constructors
 e1 88 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 e7 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 d8 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 63 04              ldi16	r4, 0x463
 c1 00                 ldi8	r5, 0x0
 c6 63 04              ldi16	r6, 0x463
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 63 04           ldi16	r0, 0x463
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 63 04           ldi16	r2, 0x463
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

<consume2(Bytes2)>:
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f1 74                 zext8	r4
 11                    add	r4, r5
 ef                    ret

<consume3(Bytes3)>:
 b1                    push16	r1
 b0                    push16	r0
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 08                    mov	r6, r4
 f1 76                 zext8	r6
 1b                    add	r6, r7
 f0 01 ff              ldi8	r1, 0xff
 f9 34                 and	r1, r5
 f1 21                 mov	r4, r1
 12                    add	r4, r6
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<consume4(Bytes4)>:
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 08                    mov	r6, r4
 f1 76                 zext8	r6
 1b                    add	r6, r7
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f1 74                 zext8	r4
 11                    add	r4, r5
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 c4 00 a5              ldi16	r4, 0xa500
 f0 5c 02 01           stm16	[0x102], r4
 c4 25 a5              ldi16	r4, 0xa525
 f0 5c 04 01           stm16	[0x104], r4
 c4 4a a5              ldi16	r4, 0xa54a
 f0 5c 06 01           stm16	[0x106], r4
 c4 6f a5              ldi16	r4, 0xa56f
 f0 5c 08 01           stm16	[0x108], r4
 c4 94 a5              ldi16	r4, 0xa594
 f0 5c 0a 01           stm16	[0x10a], r4
 c4 b9 a5              ldi16	r4, 0xa5b9
 f0 5c 0c 01           stm16	[0x10c], r4
 c4 de a5              ldi16	r4, 0xa5de
 f0 5c 0e 01           stm16	[0x10e], r4
 c4 03 a5              ldi16	r4, 0xa503
 f0 5c 10 01           stm16	[0x110], r4
 c4 28 a5              ldi16	r4, 0xa528
 f0 5c 12 01           stm16	[0x112], r4
 c4 4d a5              ldi16	r4, 0xa54d
 f0 5c 14 01           stm16	[0x114], r4
 c4 72 a5              ldi16	r4, 0xa572
 f0 5c 16 01           stm16	[0x116], r4
 c4 97 a5              ldi16	r4, 0xa597
 f0 5c 18 01           stm16	[0x118], r4
 c4 bc a5              ldi16	r4, 0xa5bc
 f0 5c 1a 01           stm16	[0x11a], r4
 c4 e1 a5              ldi16	r4, 0xa5e1
 f0 5c 1c 01           stm16	[0x11c], r4
 c4 06 a5              ldi16	r4, 0xa506
 f0 5c 1e 01           stm16	[0x11e], r4
 c4 2b a5              ldi16	r4, 0xa52b
 f0 5c 20 01           stm16	[0x120], r4
 c4 50 a5              ldi16	r4, 0xa550
 f0 5c 22 01           stm16	[0x122], r4
 c4 75 a5              ldi16	r4, 0xa575
 f0 5c 24 01           stm16	[0x124], r4
 c4 9a a5              ldi16	r4, 0xa59a
 f0 5c 26 01           stm16	[0x126], r4
 c4 bf a5              ldi16	r4, 0xa5bf
 f0 5c 28 01           stm16	[0x128], r4
 c4 e4 a5              ldi16	r4, 0xa5e4
 f0 5c 2a 01           stm16	[0x12a], r4
 c4 09 a5              ldi16	r4, 0xa509
 f0 5c 2c 01           stm16	[0x12c], r4
 c4 2e a5              ldi16	r4, 0xa52e
 f0 5c 2e 01           stm16	[0x12e], r4
 c4 53 a5              ldi16	r4, 0xa553
 f0 5c 30 01           stm16	[0x130], r4
 c4 78 a5              ldi16	r4, 0xa578
 f0 5c 32 01           stm16	[0x132], r4
 c4 9d a5              ldi16	r4, 0xa59d
 f0 5c 34 01           stm16	[0x134], r4
 c4 c2 a5              ldi16	r4, 0xa5c2
 f0 5c 36 01           stm16	[0x136], r4
 c4 e7 a5              ldi16	r4, 0xa5e7
 f0 5c 38 01           stm16	[0x138], r4
 c4 0c a5              ldi16	r4, 0xa50c
 f0 5c 3a 01           stm16	[0x13a], r4
 c4 31 a5              ldi16	r4, 0xa531
 f0 5c 3c 01           stm16	[0x13c], r4
 c4 56 a5              ldi16	r4, 0xa556
 f0 5c 3e 01           stm16	[0x13e], r4
 c4 7b a5              ldi16	r4, 0xa57b
 f0 5c 40 01           stm16	[0x140], r4
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 c0 03                 ldi8	r4, 0x3
 f4 40                 stsp16	[sp+0x0], r4
 c6 02 01              ldi16	r6, 0x102
 c3 1f                 ldi8	r7, 0x1f
 f1 24                 mov	r5, r0
<L0>:
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 f0 32 00              ldsp16	r2, [sp+0x0]
<L1>:
 f7 2c                 ld16	r4, [r5+]
 f4 59                 stsp16	[sp+0x6], r5
 f1 74                 zext8	r4
 f1 26                 mov	r5, r2
 c9 1e                 addi.s8	r5, 0x1e
 87                    and	r5, r7
 15                    add	r5, r5
 16                    add	r5, r6
 65                    ld16	r5, [r5]
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f1 22                 mov	r4, r2
 f4 b4                 dec16	r4
 83                    and	r4, r7
 f1 26                 mov	r5, r2
 87                    and	r5, r7
 15                    add	r5, r5
 16                    add	r5, r6
 10                    add	r4, r4
 12                    add	r4, r6
 f5 43                 ld16	r3, [r4]
 61                    ld16	r4, [r5]
 f4 50                 stsp16	[sp+0x4], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 e1 b1 fe              call16	_Z8consume26Bytes2
 f1 0c                 mov	r1, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f1 27                 mov	r5, r3
 e1 af fe              call16	_Z8consume36Bytes3
 f2 08                 add	r1, r0
 f2 0c                 add	r1, r4
 f1 73                 zext8	r3
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 38                 lsl16i	r4, 0x8
 f9 8d                 or	r4, r3
 f4 21                 ldsp16	r5, [sp+0x8]
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 e1 af fe              call16	_Z8consume46Bytes4
 f4 19                 ldsp16	r5, [sp+0x6]
 c3 1f                 ldi8	r7, 0x1f
 c6 02 01              ldi16	r6, 0x102
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 f4 aa                 inc16	r2
 f0 0e 23              cmpi.s8	r2, 0x23
 d1 a8                 brne8	-0x58 <L1>
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 ad                 inc16	r5
 cd 10                 cmpi.s8	r5, 0x10
 d1 9a                 brne8	-0x66 <L0>
 f0 58 00 01           stm16	[0x100], r0
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

<__avm_terminate>:
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
 e1 ed fb              call16	-1043 <__avm_run_local_dtors>
<L0>:
 c4 63 04              ldi16	r4, 0x463
 c1 00                 ldi8	r5, 0x0
 c6 63 04              ldi16	r6, 0x463
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 63 04           ldi16	r2, 0x463
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 63 04           ldi16	r0, 0x463
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
 e1 a4 fb              call16	-1116 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
