
aggregate_byte_packing_hoisted.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 aggregate_byte_packing_hoisted.cpp
00000100 l     O .data	00000001 area
00000101 l     O .data	00000002 aggregate_byte_packing_hoisted_result
00000103 l     O .data	00000010 positions
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
0000039b l       .init_array	00000000 .hidden __init_array_end
0000039b l       .init_array	00000000 .hidden __init_array_start
0000039b l       .fini_array	00000000 .hidden __fini_array_start
0000039b l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
0000027a g     F .text	000000ba avm_test_main
00000336 g     F .text	00000065 __avm_terminate
00000334 g     F .text	00000002 avm_halt
00000267 g     F .text	00000013 consume_coord(ChunkCoord)
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 70                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 20 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 11 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 9b 03              ldi16	r4, 0x39b
 c1 00                 ldi8	r5, 0x0
 c6 9b 03              ldi16	r6, 0x39b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 9b 03           ldi16	r0, 0x39b
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 9b 03           ldi16	r2, 0x39b
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

<consume_coord(ChunkCoord)>:
 c3 ff                 ldi8	r7, 0xff
 8d                    and	r7, r5
 0b                    mov	r6, r7
 c1 05                 ldi8	r5, 0x5
 f3 19                 mulu8.w	r6, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 0d                    mov	r7, r5
 1f                    add	r7, r7
 1d                    add	r7, r5
 f1 74                 zext8	r4
 13                    add	r4, r7
 12                    add	r4, r6
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 a5                    xor	r5, r5
 f0 4d 03 01           stm8	[0x103], r5
 c0 25                 ldi8	r4, 0x25
 f0 4c 04 01           stm8	[0x104], r4
 c0 4a                 ldi8	r4, 0x4a
 f0 4c 05 01           stm8	[0x105], r4
 c0 6f                 ldi8	r4, 0x6f
 f0 4c 06 01           stm8	[0x106], r4
 c0 94                 ldi8	r4, 0x94
 f0 4c 07 01           stm8	[0x107], r4
 c0 b9                 ldi8	r4, 0xb9
 f0 4c 08 01           stm8	[0x108], r4
 c0 de                 ldi8	r4, 0xde
 f0 4c 09 01           stm8	[0x109], r4
 c0 03                 ldi8	r4, 0x3
 f0 4c 0a 01           stm8	[0x10a], r4
 c0 28                 ldi8	r4, 0x28
 f0 4c 0b 01           stm8	[0x10b], r4
 c0 4d                 ldi8	r4, 0x4d
 f0 4c 0c 01           stm8	[0x10c], r4
 c0 72                 ldi8	r4, 0x72
 f0 4c 0d 01           stm8	[0x10d], r4
 c0 97                 ldi8	r4, 0x97
 f0 4c 0e 01           stm8	[0x10e], r4
 c0 bc                 ldi8	r4, 0xbc
 f0 4c 0f 01           stm8	[0x10f], r4
 c0 e1                 ldi8	r4, 0xe1
 f0 4c 10 01           stm8	[0x110], r4
 c0 06                 ldi8	r4, 0x6
 f0 4c 11 01           stm8	[0x111], r4
 c0 2b                 ldi8	r4, 0x2b
 f0 4c 12 01           stm8	[0x112], r4
 c0 81                 ldi8	r4, 0x81
 f0 4c 00 01           stm8	[0x100], r4
 d7 01                 sys	debug_break
 c0 10                 ldi8	r4, 0x10
 f4 48                 stsp16	[sp+0x2], r4
 f1 15                 mov	r2, r5
<L0>:
 f4 41                 stsp16	[sp+0x0], r5
 a0                    xor	r4, r4
<L1>:
 f4 50                 stsp16	[sp+0x4], r4
 f0 07 03 01           ldi16	r3, 0x103
 f2 23                 add	r4, r3
 40                    ld8u	r4, [r4]
 f1 0c                 mov	r1, r4
 f0 30 02              ldsp16	r0, [sp+0x2]
<L2>:
 f0 6c 87              ld8u	r4, [r3+]
 f0 45 00 01           ldm8u	r5, [0x100]
 09                    mov	r6, r5
 fa 38                 lsl16i	r4, 0x8
 92                    or	r4, r6
 f1 25                 mov	r5, r1
 e1 59 ff              call16	_Z13consume_coord10ChunkCoord
 f2 14                 add	r2, r4
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 e8                 brne8	-0x18 <L2>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 ac                 inc16	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 d2                 brne8	-0x2e <L1>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 c7                 brne8	-0x39 <L0>
 f0 5a 01 01           stm16	[0x101], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
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
 e1 b5 fc              call16	-843 <__avm_run_local_dtors>
<L0>:
 c4 9b 03              ldi16	r4, 0x39b
 c1 00                 ldi8	r5, 0x0
 c6 9b 03              ldi16	r6, 0x39b
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 9b 03           ldi16	r2, 0x39b
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 9b 03           ldi16	r0, 0x39b
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
 e1 6c fc              call16	-916 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
