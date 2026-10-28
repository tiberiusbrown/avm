
math_sqrt_special.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000323 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_sqrt_special.c
00000100 l     O .data	00000080 inputs
00000467 l     O .rodata	00000040 input_bits
00000180 l     O .data	00000080 results
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000442 l     F .text	00000025 avm_sqrt_special
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
000004a7 l       .init_array	00000000 .hidden __init_array_end
000004a7 l       .init_array	00000000 .hidden __init_array_start
000004a7 l       .fini_array	00000000 .hidden __fini_array_start
000004a7 l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	00000023 _start
00000367 g     F .text	0000006a avm_test_main
000003d3 g     F .text	00000065 __avm_terminate
000003d1 g     F .text	00000002 avm_halt
00000438 g     F .text	0000000a sqrtf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000200 g     O .data	00000002 __avm_errno

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
 e1 bd 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 ae 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 a7 04              ldi16	r4, 0x4a7
 c1 00                 ldi8	r5, 0x0
 c6 a7 04              ldi16	r6, 0x4a7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 a7 04           ldi16	r0, 0x4a7
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 a7 04           ldi16	r2, 0x4a7
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
 d6 fe                 adjsp	-0x2
 af                    xor	r7, r7
 c5 04 01              ldi16	r5, 0x104
 c4 00 80              ldi16	r4, 0x8000
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 67 04           ldi16	r2, 0x467
 f0 03 00              ldi8	r3, 0x0
<L0>:
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 03                    mov	r4, r7
 10                    add	r4, r4
 10                    add	r4, r4
 f1 04                 mov	r0, r4
 f1 0e                 mov	r1, r6
 f7 61                 add32	q0, q1
 f0 64 00              ldp32	q0, [q0]
 01                    mov	r4, r5
 c8 fc                 addi.s8	r4, -0x4
 f0 6b 08              st32	[r4], q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f9 31                 or	r1, r4
 f0 6b 0a              st32	[r5], q0
 c9 08                 addi.s8	r5, 0x8
 f4 af                 inc16	r7
 cf 10                 cmpi.s8	r7, 0x10
 d1 dc                 brne8	-0x24 <L0>
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 05 00 01           ldi16	r1, 0x100
 f0 06 80 01           ldi16	r2, 0x180
<L1>:
 f1 20                 mov	r4, r0
 f2 21                 add	r4, r1
 f0 6a 88              ld32	q2, [r4]
 e1 81 00              call16	sqrtf
 f1 28                 mov	r6, r0
 f2 2a                 add	r6, r2
 f0 6b 8c              st32	[r6], q2
 f0 08 04              addi.s8	r0, 0x4
 c0 80                 ldi8	r4, 0x80
 f5 04                 cmp	r0, r4
 d1 e6                 brne8	-0x1a <L1>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
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
 e1 18 fc              call16	-1000 <__avm_run_local_dtors>
<L0>:
 c4 a7 04              ldi16	r4, 0x4a7
 c1 00                 ldi8	r5, 0x0
 c6 a7 04              ldi16	r6, 0x4a7
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 a7 04           ldi16	r2, 0x4a7
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 a7 04           ldi16	r0, 0x4a7
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
 e1 cf fb              call16	-1073 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<sqrtf>:
 09                    mov	r6, r5
 f6 2e                 tst16	r6
 d3 03                 brslt8	0x3 <L0>
 ff 17                 fsqrt
 ef                    ret
<L0>:
 d4 00                 jmp8	avm_sqrt_special

<avm_sqrt_special>:
 09                    mov	r6, r5
 c7 7f ff              ldi16	r7, 0xff7f
 3e                    cmp	r7, r6
 d2 0d                 brult8	0xd <L1>
 f6 2c                 tst16	r4
 d1 11                 brne8	0x11 <L2>
 c7 00 80              ldi16	r7, 0x8000
 3b                    cmp	r6, r7
 d1 0b                 brne8	0xb <L2>
<L0>:
 ff 17                 fsqrt
 ef                    ret
<L1>:
 f6 2c                 tst16	r4
 d1 f9                 brne8	-0x7 <L0>
 ce 80                 cmpi.s8	r6, -0x80
 d1 f5                 brne8	-0xb <L0>
<L2>:
 c2 21                 ldi8	r6, 0x21
 f0 5e 00 02           stm16	[0x200], r6
 ff 17                 fsqrt
 ef                    ret
