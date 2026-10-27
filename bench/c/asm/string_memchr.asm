
string_memchr.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 string_memchr.c
00000100 l     O .data	00000002 string_bench_result
00000102 l     O .data	00000003 call
00000105 l     O .data	00000080 string_bench_text
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 termination.c
00000475 l       .init_array	00000000 .hidden __init_array_end
00000475 l       .init_array	00000000 .hidden __init_array_start
00000475 l       .fini_array	00000000 .hidden __fini_array_start
00000475 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000189 avm_test_main
00000410 g     F .text	00000065 __avm_terminate
000003f0 g     F .text	00000002 avm_halt
000003f2 g     F .text	0000001e memchr
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
 e1 fa 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 cd 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 75 04              ldi16	r4, 0x475
 c1 00                 ldi8	r5, 0x0
 c6 75 04              ldi16	r6, 0x475
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 75 04           ldi16	r0, 0x475
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 75 04           ldi16	r2, 0x475
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
 d6 fa                 adjsp	-0x6
 f2 30                 sub	r0, r0
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
<L0>:
 f4 50                 stsp16	[sp+0x4], r4
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 c4 05 01              ldi16	r4, 0x105
 c1 61                 ldi8	r5, 0x61
 c2 20                 ldi8	r6, 0x20
 e9                    callp	q1
 f1 0c                 mov	r1, r4
 c4 02 01              ldi16	r4, 0x102
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c4 05 01              ldi16	r4, 0x105
 c1 ff                 ldi8	r5, 0xff
 c2 20                 ldi8	r6, 0x20
 f0 32 00              ldsp16	r2, [sp+0x0]
 f1 1f                 mov	r3, r7
 e9                    callp	q1
 f6 2c                 tst16	r4
 c6 05 01              ldi16	r6, 0x105
 22                    sub	r4, r6
 f4 ac                 inc16	r4
 a5                    xor	r5, r5
 fb 25                 cmov.eq	r4, r5
 f6 29                 tst16	r1
 f2 3e                 sub	r1, r6
 f4 a9                 inc16	r1
 fb 0d                 cmov.eq	r1, r5
 f2 08                 add	r1, r0
 f2 0c                 add	r1, r4
 c4 02 01              ldi16	r4, 0x102
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 02                    mov	r4, r6
 c2 20                 ldi8	r6, 0x20
 e9                    callp	q1
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 c4 05 01              ldi16	r4, 0x105
 f2 34                 sub	r0, r4
 f4 a8                 inc16	r0
 a0                    xor	r4, r4
 fb 04                 cmov.eq	r0, r4
 f2 01                 add	r0, r1
 f0 05 02 01           ldi16	r1, 0x102
 f1 21                 mov	r4, r1
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 c4 25 01              ldi16	r4, 0x125
 c1 61                 ldi8	r5, 0x61
 c2 20                 ldi8	r6, 0x20
 e9                    callp	q1
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 c4 25 01              ldi16	r4, 0x125
 f2 4c                 sub	r3, r4
 f4 ab                 inc16	r3
 f2 42                 sub	r2, r2
 fb 1a                 cmov.eq	r3, r2
 f2 18                 add	r3, r0
 f1 25                 mov	r5, r1
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 c1 ff                 ldi8	r5, 0xff
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 c4 25 01              ldi16	r4, 0x125
 f2 34                 sub	r0, r4
 f4 a8                 inc16	r0
 f1 26                 mov	r5, r2
 fb 05                 cmov.eq	r0, r5
 f2 03                 add	r0, r3
 f0 05 02 01           ldi16	r1, 0x102
 f1 29                 mov	r6, r1
 f7 32                 ld16	r2, [r6+]
 f5 3b                 ld8u	r3, [r6]
 c2 20                 ldi8	r6, 0x20
 e9                    callp	q1
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 c4 25 01              ldi16	r4, 0x125
 f2 4c                 sub	r3, r4
 f4 ab                 inc16	r3
 f2 42                 sub	r2, r2
 fb 1a                 cmov.eq	r3, r2
 f2 18                 add	r3, r0
 f1 21                 mov	r4, r1
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 45 01              ldi16	r4, 0x145
 c1 61                 ldi8	r5, 0x61
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 c4 45 01              ldi16	r4, 0x145
 f2 34                 sub	r0, r4
 f4 a8                 inc16	r0
 fb 02                 cmov.eq	r0, r2
 f2 03                 add	r0, r3
 f0 05 02 01           ldi16	r1, 0x102
 f1 25                 mov	r5, r1
 f7 2a                 ld16	r2, [r5+]
 f5 37                 ld8u	r3, [r5]
 c1 ff                 ldi8	r5, 0xff
 c2 20                 ldi8	r6, 0x20
 e9                    callp	q1
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 c4 45 01              ldi16	r4, 0x145
 f2 4c                 sub	r3, r4
 f4 ab                 inc16	r3
 a5                    xor	r5, r5
 fb 1d                 cmov.eq	r3, r5
 f2 18                 add	r3, r0
 f1 11                 mov	r2, r1
 f1 2a                 mov	r6, r2
 f7 30                 ld16	r0, [r6+]
 f5 39                 ld8u	r1, [r6]
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 c4 45 01              ldi16	r4, 0x145
 f2 34                 sub	r0, r4
 f4 a8                 inc16	r0
 f2 39                 sub	r1, r1
 fb 01                 cmov.eq	r0, r1
 f2 03                 add	r0, r3
 f1 22                 mov	r4, r2
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 c4 65 01              ldi16	r4, 0x165
 c1 61                 ldi8	r5, 0x61
 c2 20                 ldi8	r6, 0x20
 e9                    callp	q1
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 c4 65 01              ldi16	r4, 0x165
 f2 4c                 sub	r3, r4
 f4 ab                 inc16	r3
 fb 19                 cmov.eq	r3, r1
 f2 18                 add	r3, r0
 f0 06 02 01           ldi16	r2, 0x102
 f1 26                 mov	r5, r2
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 c1 ff                 ldi8	r5, 0xff
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 0c                 mov	r1, r4
 f6 29                 tst16	r1
 c4 65 01              ldi16	r4, 0x165
 f2 3c                 sub	r1, r4
 f4 a9                 inc16	r1
 a5                    xor	r5, r5
 fb 0d                 cmov.eq	r1, r5
 f2 0b                 add	r1, r3
 f1 2a                 mov	r6, r2
 f7 32                 ld16	r2, [r6+]
 f5 3b                 ld8u	r3, [r6]
 c2 20                 ldi8	r6, 0x20
 e9                    callp	q1
 f1 04                 mov	r0, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f6 28                 tst16	r0
 c5 65 01              ldi16	r5, 0x165
 f2 35                 sub	r0, r5
 f4 a8                 inc16	r0
 a5                    xor	r5, r5
 fb 05                 cmov.eq	r0, r5
 f2 01                 add	r0, r1
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db 91 fe              brne16	-0x16f <L0>
 f0 58 00 01           stm16	[0x100], r0
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

<memchr>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d0 10                 breq8	0x10 <L1>
 f1 75                 zext8	r5
<L0>:
 ed e0 20              ld8u	r7, [r0+0]
 3d                    cmp	r7, r5
 d0 0a                 breq8	0xa <L2>
 f4 a8                 inc16	r0
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f2                 brne8	-0xe <L0>
<L1>:
 b8                    pop16	r0
 ef                    ret
<L2>:
 f1 20                 mov	r4, r0
 b8                    pop16	r0
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
 e1 db fb              call16	-1061 <__avm_run_local_dtors>
<L0>:
 c4 75 04              ldi16	r4, 0x475
 c1 00                 ldi8	r5, 0x0
 c6 75 04              ldi16	r6, 0x475
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 75 04           ldi16	r2, 0x475
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 75 04           ldi16	r0, 0x475
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
 e1 92 fb              call16	-1134 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
