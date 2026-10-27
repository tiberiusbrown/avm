
string_strnlen_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 string_strnlen_p.c
00000428 l     O .rodata	00000080 string_bench_flash
00000100 l     O .data	00000003 call
00000103 l     O .data	00000002 string_bench_result
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
000004a8 l       .init_array	00000000 .hidden __init_array_end
000004a8 l       .init_array	00000000 .hidden __init_array_start
000004a8 l       .fini_array	00000000 .hidden __fini_array_start
000004a8 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000137 avm_test_main
000003c3 g     F .text	00000065 __avm_terminate
000003c1 g     F .text	00000002 avm_halt
0000039e g     F .text	00000023 strnlen_P
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
 e1 ad 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 9e 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 a8 04              ldi16	r4, 0x4a8
 c1 00                 ldi8	r5, 0x0
 c6 a8 04              ldi16	r6, 0x4a8
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 a8 04           ldi16	r0, 0x4a8
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 a8 04           ldi16	r2, 0x4a8
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
 d6 ea                 adjsp	-0x16
 f2 42                 sub	r2, r2
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
 c6 28 04              ldi16	r6, 0x428
 c3 00                 ldi8	r7, 0x0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 48 04              ldi16	r6, 0x448
 c3 00                 ldi8	r7, 0x0
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 c6 68 04              ldi16	r6, 0x468
 c3 00                 ldi8	r7, 0x0
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 c6 88 04              ldi16	r6, 0x488
 c3 00                 ldi8	r7, 0x0
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
<L0>:
 f4 50                 stsp16	[sp+0x4], r4
 c4 00 01              ldi16	r4, 0x100
 f1 1c                 mov	r3, r4
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 aa                    xor	r6, r6
 f0 30 00              ldsp16	r0, [sp+0x0]
 f1 0f                 mov	r1, r7
 e8                    callp	q0
 f2 22                 add	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 f1 23                 mov	r4, r3
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f2 68                 mov32	q2, q0
 c2 08                 ldi8	r6, 0x8
 e9                    callp	q1
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f2 68                 mov32	q2, q0
 c2 20                 ldi8	r6, 0x20
 e9                    callp	q1
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 01                 ldsp16	r5, [sp+0x0]
 f2 15                 add	r2, r5
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db 0a ff              brne16	-0xf6 <L0>
 f0 5a 03 01           stm16	[0x103], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strnlen_P>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d0 13                 breq8	0x13 <L1>
<L0>:
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 60 a4              ldp8u	r5, [q1]
 f4 a5                 tst8	r5
 d0 06                 breq8	0x6 <L1>
 f4 ac                 inc16	r4
 38                    cmp	r6, r4
 d1 ee                 brne8	-0x12 <L0>
 02                    mov	r4, r6
<L1>:
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
 e1 28 fc              call16	-984 <__avm_run_local_dtors>
<L0>:
 c4 a8 04              ldi16	r4, 0x4a8
 c1 00                 ldi8	r5, 0x0
 c6 a8 04              ldi16	r6, 0x4a8
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 a8 04           ldi16	r2, 0x4a8
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 a8 04           ldi16	r0, 0x4a8
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
 e1 df fb              call16	-1057 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
