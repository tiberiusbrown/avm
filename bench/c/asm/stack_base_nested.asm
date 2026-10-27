
stack_base_nested.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 stack_base_nested.c
00000100 l     O .data	00000002 stack_base_nested_result
00000102 l     O .data	00000008 input
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000383 l       .init_array	00000000 .hidden __init_array_end
00000383 l       .init_array	00000000 .hidden __init_array_start
00000383 l       .fini_array	00000000 .hidden __fini_array_start
00000383 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000b5 avm_test_main
0000031e g     F .text	00000065 __avm_terminate
0000031c g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1b                 call8	avm_run_constructors
 d5 5d                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 08 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 f9 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 83 03              ldi16	r4, 0x383
 c1 00                 ldi8	r5, 0x0
 c6 83 03              ldi16	r6, 0x383
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 83 03           ldi16	r0, 0x383
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 83 03           ldi16	r2, 0x383
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

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 c0 d9                 ldi8	r4, 0xd9
 f0 4c 02 01           stm8	[0x102], r4
 c0 ba                 ldi8	r4, 0xba
 f0 4c 03 01           stm8	[0x103], r4
 c0 9b                 ldi8	r4, 0x9b
 f0 4c 04 01           stm8	[0x104], r4
 c0 7c                 ldi8	r4, 0x7c
 f0 4c 05 01           stm8	[0x105], r4
 c0 5d                 ldi8	r4, 0x5d
 f0 4c 06 01           stm8	[0x106], r4
 c0 3e                 ldi8	r4, 0x3e
 f0 4c 07 01           stm8	[0x107], r4
 c0 1f                 ldi8	r4, 0x1f
 f0 4c 08 01           stm8	[0x108], r4
 f2 42                 sub	r2, r2
 f0 4a 09 01           stm8	[0x109], r2
 d7 01                 sys	debug_break
 f0 05 02 01           ldi16	r1, 0x102
 f0 13 02              leasp	r3, 0x2
 f1 22                 mov	r4, r2
 d4 08                 jmp8	0x8 <L1>
<L0>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 cc 10                 cmpi.s8	r4, 0x10
 d0 30                 breq8	0x30 <L6>
<L1>:
 f4 40                 stsp16	[sp+0x0], r4
 f1 22                 mov	r4, r2
 d4 0b                 jmp8	0xb <L4>
<L2>:
 f1 2e                 mov	r7, r2
<L3>:
 f2 2f                 add	r7, r3
 5d                    st8	[r7], r5
 f4 ac                 inc16	r4
 cc 08                 cmpi.s8	r4, 0x8
 d0 e7                 breq8	-0x19 <L0>
<L4>:
 04                    mov	r5, r4
 f2 25                 add	r5, r1
 45                    ld8u	r5, [r5]
 f6 2c                 tst16	r4
 f1 2e                 mov	r7, r2
 d0 ed                 breq8	-0x13 <L3>
 0c                    mov	r7, r4
<L5>:
 f1 2b                 mov	r6, r3
 1b                    add	r6, r7
 ed 0c 1f              ld8u	r0, [r6-1]
 f5 24                 cmp	r5, r0
 d8 e2                 bruge8	-0x1e <L3>
 f3 08                 st8	[r6], r0
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 ee                 brne8	-0x12 <L5>
 d4 d6                 jmp8	-0x2a <L2>
<L6>:
 f3 48                 ldsp8u	r4, [sp+0x2]
 04                    mov	r5, r4
 15                    add	r5, r5
 14                    add	r5, r4
 f3 4c                 ldsp8u	r4, [sp+0x3]
 11                    add	r4, r5
 04                    mov	r5, r4
 15                    add	r5, r5
 14                    add	r5, r4
 f3 50                 ldsp8u	r4, [sp+0x4]
 11                    add	r4, r5
 04                    mov	r5, r4
 15                    add	r5, r5
 14                    add	r5, r4
 f3 54                 ldsp8u	r4, [sp+0x5]
 11                    add	r4, r5
 04                    mov	r5, r4
 15                    add	r5, r5
 14                    add	r5, r4
 f3 58                 ldsp8u	r4, [sp+0x6]
 11                    add	r4, r5
 04                    mov	r5, r4
 15                    add	r5, r5
 14                    add	r5, r4
 f3 5c                 ldsp8u	r4, [sp+0x7]
 11                    add	r4, r5
 04                    mov	r5, r4
 15                    add	r5, r5
 14                    add	r5, r4
 f3 60                 ldsp8u	r4, [sp+0x8]
 11                    add	r4, r5
 04                    mov	r5, r4
 15                    add	r5, r5
 14                    add	r5, r4
 f3 64                 ldsp8u	r4, [sp+0x9]
 11                    add	r4, r5
 f0 5c 00 01           stm16	[0x100], r4
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
 e1 cd fc              call16	-819 <__avm_run_local_dtors>
<L0>:
 c4 83 03              ldi16	r4, 0x383
 c1 00                 ldi8	r5, 0x0
 c6 83 03              ldi16	r6, 0x383
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 83 03           ldi16	r2, 0x383
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 83 03           ldi16	r0, 0x383
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
 e1 84 fc              call16	-892 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
