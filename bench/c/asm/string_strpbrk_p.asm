
string_strpbrk_p.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 string_strpbrk_p.c
00000100 l     O .data	00000002 string_bench_result
00000102 l     O .data	00000003 call
00000105 l     O .data	00000080 string_bench_text
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 runtime.c
000004ba l       .init_array	00000000 .hidden __init_array_end
000004ba l       .init_array	00000000 .hidden __init_array_start
000004ba l       .fini_array	00000000 .hidden __fini_array_start
000004ba l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000001a0 avm_test_main
000004b0 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000467 g     F .text	00000049 strpbrk_P

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
 e1 92 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ba 04              ldi16	r4, 0x4ba
 c1 00                 ldi8	r5, 0x0
 c6 ba 04              ldi16	r6, 0x4ba
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 ba 04           ldi16	r0, 0x4ba
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ba 04           ldi16	r2, 0x4ba
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
 c4 ba 04              ldi16	r4, 0x4ba
 c1 00                 ldi8	r5, 0x0
 c6 ba 04              ldi16	r6, 0x4ba
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 ba 04           ldi16	r2, 0x4ba
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ba 04           ldi16	r0, 0x4ba
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
 d6 f2                 adjsp	-0xe
 f2 42                 sub	r2, r2
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
 c6 b2 04              ldi16	r6, 0x4b2
 c3 00                 ldi8	r7, 0x0
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 c6 b5 04              ldi16	r6, 0x4b5
 c3 00                 ldi8	r7, 0x0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 b9 04              ldi16	r6, 0x4b9
 c3 00                 ldi8	r7, 0x0
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 05 01              ldi16	r4, 0x105
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 05 01              ldi16	r4, 0x105
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 f6 2c                 tst16	r4
 c6 05 01              ldi16	r6, 0x105
 22                    sub	r4, r6
 f4 ac                 inc16	r4
 a5                    xor	r5, r5
 fb 25                 cmov.eq	r4, r5
 f6 2b                 tst16	r3
 f2 4e                 sub	r3, r6
 f4 ab                 inc16	r3
 fb 1d                 cmov.eq	r3, r5
 f2 1a                 add	r3, r2
 f2 1c                 add	r3, r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 02                    mov	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f6 2a                 tst16	r2
 c4 05 01              ldi16	r4, 0x105
 f2 44                 sub	r2, r4
 f4 aa                 inc16	r2
 a0                    xor	r4, r4
 fb 14                 cmov.eq	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 25 01              ldi16	r4, 0x125
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 c5 25 01              ldi16	r5, 0x125
 f2 4d                 sub	r3, r5
 f4 ab                 inc16	r3
 a0                    xor	r4, r4
 fb 1c                 cmov.eq	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 01                    mov	r4, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f6 2a                 tst16	r2
 c5 25 01              ldi16	r5, 0x125
 f2 45                 sub	r2, r5
 f4 aa                 inc16	r2
 a0                    xor	r4, r4
 fb 14                 cmov.eq	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 01                    mov	r4, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 c4 25 01              ldi16	r4, 0x125
 f2 4c                 sub	r3, r4
 f4 ab                 inc16	r3
 a0                    xor	r4, r4
 fb 1c                 cmov.eq	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 45 01              ldi16	r4, 0x145
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f6 2a                 tst16	r2
 c5 45 01              ldi16	r5, 0x145
 f2 45                 sub	r2, r5
 f4 aa                 inc16	r2
 a0                    xor	r4, r4
 fb 14                 cmov.eq	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 01                    mov	r4, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 c5 45 01              ldi16	r5, 0x145
 f2 4d                 sub	r3, r5
 f4 ab                 inc16	r3
 a0                    xor	r4, r4
 fb 1c                 cmov.eq	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 01                    mov	r4, r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f6 2a                 tst16	r2
 c4 45 01              ldi16	r4, 0x145
 f2 44                 sub	r2, r4
 f4 aa                 inc16	r2
 a0                    xor	r4, r4
 fb 14                 cmov.eq	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 65 01              ldi16	r4, 0x165
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 c5 65 01              ldi16	r5, 0x165
 f2 4d                 sub	r3, r5
 f4 ab                 inc16	r3
 a0                    xor	r4, r4
 fb 1c                 cmov.eq	r3, r4
 f2 1a                 add	r3, r2
 f0 06 02 01           ldi16	r2, 0x102
 f1 22                 mov	r4, r2
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 01                    mov	r4, r5
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 c4 65 01              ldi16	r4, 0x165
 f2 34                 sub	r0, r4
 f4 a8                 inc16	r0
 f2 39                 sub	r1, r1
 fb 01                 cmov.eq	r0, r1
 f2 03                 add	r0, r3
 f1 26                 mov	r5, r2
 f7 2a                 ld16	r2, [r5+]
 f5 37                 ld8u	r3, [r5]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e9                    callp	q1
 f1 14                 mov	r2, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2a                 tst16	r2
 c5 65 01              ldi16	r5, 0x165
 f2 45                 sub	r2, r5
 f4 aa                 inc16	r2
 fb 11                 cmov.eq	r2, r1
 f2 10                 add	r2, r0
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db 95 fe              brne16	-0x16b <L0>
 f0 5a 00 01           stm16	[0x100], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strpbrk_P>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 48                    ld8u	r6, [r4]
 f4 a6                 tst8	r6
 d0 2d                 breq8	0x2d <L4>
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 d4 12                 jmp8	0x12 <L2>
<L0>:
 f1 71                 zext8	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d1 1d                 brne8	0x1d <L4>
<L1>:
 ed c8 21              ld8u	r6, [r4+1]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d0 14                 breq8	0x14 <L4>
<L2>:
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
<L3>:
 f0 60 a0              ldp8u	r5, [q0]
 36                    cmp	r5, r6
 d0 e2                 breq8	-0x1e <L0>
 f7 61                 add32	q0, q1
 f4 a5                 tst8	r5
 d1 f4                 brne8	-0xc <L3>
 d4 e3                 jmp8	-0x1d <L1>
<L4>:
 44                    ld8u	r5, [r4]
 aa                    xor	r6, r6
 f4 a5                 tst8	r5
 fb 26                 cmov.eq	r4, r6
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
