
record_stride_nested.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 record_stride_nested.c
00000100 l     O .data	00000002 record_stride_nested_result
00000102 l     O .data	00000090 records
00000000 l    df *ABS*	00000000 runtime.c
000003d3 l       .init_array	00000000 .hidden __init_array_end
000003d3 l       .init_array	00000000 .hidden __init_array_start
000003d3 l       .fini_array	00000000 .hidden __fini_array_start
000003d3 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000010a avm_test_main
000003d1 g     F .text	00000002 avm_halt
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
 e1 b3 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 d3 03              ldi16	r4, 0x3d3
 c1 00                 ldi8	r5, 0x0
 c6 d3 03              ldi16	r6, 0x3d3
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 d3 03           ldi16	r0, 0x3d3
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 d3 03           ldi16	r2, 0x3d3
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
 c4 d3 03              ldi16	r4, 0x3d3
 c1 00                 ldi8	r5, 0x0
 c6 d3 03              ldi16	r6, 0x3d3
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 d3 03           ldi16	r2, 0x3d3
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 d3 03           ldi16	r0, 0x3d3
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
 d6 f0                 adjsp	-0x10
 c0 79                 ldi8	r4, 0x79
 f0 4c 8a 01           stm8	[0x18a], r4
 c0 fa                 ldi8	r4, 0xfa
 f0 4c 78 01           stm8	[0x178], r4
 c4 01 01              ldi16	r4, 0x101
 f0 5c 70 01           stm16	[0x170], r4
 c0 7b                 ldi8	r4, 0x7b
 f0 4c 66 01           stm8	[0x166], r4
 c4 02 02              ldi16	r4, 0x202
 f0 5c 5e 01           stm16	[0x15e], r4
 c0 fc                 ldi8	r4, 0xfc
 f0 4c 54 01           stm8	[0x154], r4
 c4 03 03              ldi16	r4, 0x303
 f0 5c 4c 01           stm16	[0x14c], r4
 c0 7d                 ldi8	r4, 0x7d
 f0 4c 42 01           stm8	[0x142], r4
 c4 04 04              ldi16	r4, 0x404
 f0 5c 3a 01           stm16	[0x13a], r4
 c0 fe                 ldi8	r4, 0xfe
 f0 4c 30 01           stm8	[0x130], r4
 c4 05 05              ldi16	r4, 0x505
 f0 5c 28 01           stm16	[0x128], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 4c 1e 01           stm8	[0x11e], r4
 c4 06 06              ldi16	r4, 0x606
 f0 5c 16 01           stm16	[0x116], r4
 c4 07 07              ldi16	r4, 0x707
 f0 5c 04 01           stm16	[0x104], r4
 a0                    xor	r4, r4
 f0 5c 82 01           stm16	[0x182], r4
 f0 4c 0c 01           stm8	[0x10c], r4
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 0c                    mov	r7, r4
 d4 0d                 jmp8	0xd <L1>
<L0>:
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d0 7f                 breq8	0x7f <L9>
<L1>:
 f4 43                 stsp16	[sp+0x0], r7
 f4 49                 stsp16	[sp+0x2], r5
 c4 0c 01              ldi16	r4, 0x10c
 04                    mov	r5, r4
 f2 42                 sub	r2, r2
 f1 02                 mov	r0, r2
 d4 17                 jmp8	0x17 <L5>
<L2>:
 04                    mov	r5, r4
<L3>:
 f0 14 08              leasp	r4, 0x8
 11                    add	r4, r5
 f3 00                 st8	[r4], r0
 f0 32 06              ldsp16	r2, [sp+0x6]
 f4 aa                 inc16	r2
 f4 11                 ldsp16	r5, [sp+0x4]
<L4>:
 c9 12                 addi.s8	r5, 0x12
 f4 a8                 inc16	r0
 f0 0c 08              cmpi.s8	r0, 0x8
 d0 38                 breq8	0x38 <L7>
<L5>:
 41                    ld8u	r4, [r5]
 f4 a4                 tst8	r4
 d0 f2                 breq8	-0xe <L4>
 a0                    xor	r4, r4
 f4 a2                 tst8	r2
 f0 3a 06              stsp16	[sp+0x6], r2
 f4 51                 stsp16	[sp+0x4], r5
 d0 da                 breq8	-0x26 <L2>
 ed 3a 18              ld16	r1, [r5-8]
<L6>:
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 f0 13 08              leasp	r3, 0x8
 f2 1d                 add	r3, r5
 ed c6 1f              ld8u	r6, [r3-1]
 c3 12                 ldi8	r7, 0x12
 02                    mov	r4, r6
 f3 13                 mulu8.w	r4, r7
 c7 04 01              ldi16	r7, 0x104
 13                    add	r4, r7
 60                    ld16	r4, [r4]
 f5 0c                 cmp	r1, r4
 d8 be                 bruge8	-0x42 <L3>
 ee c6 20              st8	[r3+0], r6
 f4 b2                 dec16	r2
 f4 a2                 tst8	r2
 d1 dd                 brne8	-0x23 <L6>
 a5                    xor	r5, r5
 d4 b2                 jmp8	-0x4e <L3>
<L7>:
 f4 a2                 tst8	r2
 d0 92                 breq8	-0x6e <L0>
 f0 16 08              leasp	r6, 0x8
 f1 72                 zext8	r2
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
<L8>:
 03                    mov	r4, r7
 10                    add	r4, r4
 13                    add	r4, r7
 f7 17                 ld8u	r7, [r6+]
 1c                    add	r7, r4
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 f4                 brne8	-0xc <L8>
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 81                 brne8	-0x7f <L1>
<L9>:
 f0 5f 00 01           stm16	[0x100], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
