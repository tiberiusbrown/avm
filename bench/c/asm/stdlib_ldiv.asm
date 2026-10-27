
stdlib_ldiv.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 stdlib_ldiv.c
00000123 l     O .data	00000020 denominators
00000103 l     O .data	00000020 numerators
00000100 l     O .data	00000003 call
00000143 l     O .data	00000004 result_sink
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
0000047d l       .init_array	00000000 .hidden __init_array_end
0000047d l       .init_array	00000000 .hidden __init_array_start
0000047d l       .fini_array	00000000 .hidden __fini_array_start
0000047d l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000083 avm_test_main
0000031e g     F .text	00000065 __avm_terminate
000002ea g     F .text	00000002 avm_halt
000002ec g     F .text	00000032 ldiv
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000383 g     F .text	00000072 __avm_udivmodsi4
000003f5 g     F .text	00000088 __avm_divmodsi4

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
 e1 c7 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 7d 04              ldi16	r4, 0x47d
 c1 00                 ldi8	r5, 0x0
 c6 7d 04              ldi16	r6, 0x47d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 7d 04           ldi16	r0, 0x47d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 7d 04           ldi16	r2, 0x47d
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
 d6 f0                 adjsp	-0x10
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c5 23 01              ldi16	r5, 0x123
 c7 03 01              ldi16	r7, 0x103
 f1 14                 mov	r2, r4
<L0>:
 f0 3a 00              stsp16	[sp+0x0], r2
 f2 42                 sub	r2, r2
<L1>:
 f0 3a 06              stsp16	[sp+0x6], r2
 f1 22                 mov	r4, r2
 11                    add	r4, r5
 f0 6a 48              ld32	q1, [r4]
 c6 00 01              ldi16	r6, 0x100
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 d6 fc                 adjsp	-0x4
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f4 28                 ldsp16	r4, [sp+0xa]
 13                    add	r4, r7
 f0 6a c8              ld32	q3, [r4]
 f0 14 0c              leasp	r4, 0xc
 f0 32 06              ldsp16	r2, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 e9                    callp	q1
 c7 03 01              ldi16	r7, 0x103
 d6 04                 adjsp	0x4
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f7 68                 add32	q2, q0
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f7 62                 add32	q0, q2
 f0 32 06              ldsp16	r2, [sp+0x6]
 c5 23 01              ldi16	r5, 0x123
 f0 0a 04              addi.s8	r2, 0x4
 f0 0e 20              cmpi.s8	r2, 0x20
 d1 b4                 brne8	-0x4c <L1>
 f0 32 00              ldsp16	r2, [sp+0x0]
 f4 aa                 inc16	r2
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 a2                 brne8	-0x5e <L0>
 c4 43 01              ldi16	r4, 0x143
 f0 6b 08              st32	[r4], q0
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

<ldiv>:
 b3                    push16	r3
 b2                    push16	r2
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f2 67                 mov32	q1, q3
 f1 04                 mov	r0, r4
 d6 fe                 adjsp	-0x2
 f0 14 02              leasp	r4, 0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 3e                 ldsp16	r6, [sp+0xf]
 f0 37 11              ldsp16	r7, [sp+0x11]
 f2 69                 mov32	q2, q1
 e1 ef 00              call16	__avm_divmodsi4
 d6 02                 adjsp	0x2
 f0 6b 80              st32	[r0], q2
 f1 20                 mov	r4, r0
 c8 04                 addi.s8	r4, 0x4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 6b c8              st32	[r4], q3
 f1 20                 mov	r4, r0
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

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
 c4 7d 04              ldi16	r4, 0x47d
 c1 00                 ldi8	r5, 0x0
 c6 7d 04              ldi16	r6, 0x47d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 7d 04           ldi16	r2, 0x47d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 7d 04           ldi16	r0, 0x47d
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

<__avm_udivmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 63                 mov32	q0, q3
 f0 36 17              ldsp16	r6, [sp+0x17]
 f4 42                 stsp16	[sp+0x0], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 46                 breq8	0x46 <L1>
 c2 20                 ldi8	r6, 0x20
 f4 6a                 stsp16	[sp+0xa], r6
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 67                 mov32	q1, q3
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f2 63                 mov32	q0, q3
<L0>:
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f7 65                 add32	q1, q1
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f9 c9                 or	r6, r2
 f1 16                 mov	r2, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f0 69 48              cmp32	q1, q2
 aa                    xor	r6, r6
 fc 74                 cmov.uge	r6, r4
 fc 7d                 cmov.uge	r7, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 77                 sub32	q1, q3
 f8 1e                 cset.uge	r6
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f7 6a                 add32	q2, q2
 f1 06                 mov	r0, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 b6                 dec16	r6
 f4 6a                 stsp16	[sp+0xa], r6
 f6 2e                 tst16	r6
 d1 cc                 brne8	-0x34 <L0>
 d4 0a                 jmp8	0xa <L2>
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f2 66                 mov32	q1, q2
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 6b 48              st32	[r4], q1
 f2 68                 mov32	q2, q0
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_divmodsi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f0 30 15              ldsp16	r0, [sp+0x15]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 c4              cmp32	q3, q1
 d0 66                 breq8	0x66 <L0>
 d6 fe                 adjsp	-0x2
 f0 38 02              stsp16	[sp+0x2], r0
 f0 10 08              leasp	r0, 0x8
 f0 38 00              stsp16	[sp+0x0], r0
 f2 62                 mov32	q0, q2
 f1 21                 mov	r4, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 f9 12                 xor	r0, r4
 f9 36                 xor	r1, r5
 f7 72                 sub32	q0, q2
 03                    mov	r4, r7
 fa bf                 asr16i	r4, 0xf
 04                    mov	r5, r4
 f2 67                 mov32	q1, q3
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f7 76                 sub32	q1, q2
 f2 68                 mov32	q2, q0
 f2 63                 mov32	q0, q3
 f2 6b                 mov32	q3, q1
 e1 49 ff              call16	__avm_udivmodsi4
 d6 02                 adjsp	0x2
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f9 1a                 xor	r0, r6
 f9 3e                 xor	r1, r7
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 6b                 mov32	q3, q1
 f7 7e                 sub32	q3, q2
 f0 69 04              cmp32	q0, q1
 fd 26                 cmov.slt	r4, r6
 fd 2f                 cmov.slt	r5, r7
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f0 69 c4              cmp32	q3, q1
 f7 74                 sub32	q1, q0
 fd 02                 cmov.slt	r0, r2
 fd 0b                 cmov.slt	r1, r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 6b 0c              st32	[r6], q0
 d4 09                 jmp8	0x9 <L1>
<L0>:
 f0 6b 80              st32	[r0], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
<L1>:
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
