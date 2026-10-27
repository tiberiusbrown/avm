
string_strchr.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 string_strchr.c
00000100 l     O .data	00000002 string_bench_result
00000102 l     O .data	00000003 call
00000105 l     O .data	00000080 string_bench_text
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 termination.c
00000434 l       .init_array	00000000 .hidden __init_array_end
00000434 l       .init_array	00000000 .hidden __init_array_start
00000434 l       .fini_array	00000000 .hidden __fini_array_start
00000434 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000157 avm_test_main
000003cf g     F .text	00000065 __avm_terminate
000003be g     F .text	00000002 avm_halt
000003c0 g     F .text	0000000f strchr
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
 e1 b9 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 9b 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 34 04              ldi16	r4, 0x434
 c1 00                 ldi8	r5, 0x0
 c6 34 04              ldi16	r6, 0x434
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 34 04           ldi16	r0, 0x434
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 34 04           ldi16	r2, 0x434
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
 f2 30                 sub	r0, r0
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 c4 02 01              ldi16	r4, 0x102
 f1 14                 mov	r2, r4
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 05 05 01           ldi16	r1, 0x105
 f1 21                 mov	r4, r1
 c1 61                 ldi8	r5, 0x61
 eb                    callp	q3
 f1 1c                 mov	r3, r4
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 21                 mov	r4, r1
 c1 7a                 ldi8	r5, 0x7a
 eb                    callp	q3
 f6 2c                 tst16	r4
 f2 51                 sub	r4, r1
 f4 ac                 inc16	r4
 a5                    xor	r5, r5
 fb 25                 cmov.eq	r4, r5
 f6 2b                 tst16	r3
 f2 49                 sub	r3, r1
 f4 ab                 inc16	r3
 fb 1d                 cmov.eq	r3, r5
 f2 18                 add	r3, r0
 f2 1c                 add	r3, r4
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 21                 mov	r4, r1
 f1 15                 mov	r2, r5
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 f2 31                 sub	r0, r1
 f4 a8                 inc16	r0
 fb 02                 cmov.eq	r0, r2
 f2 03                 add	r0, r3
 c4 02 01              ldi16	r4, 0x102
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 05 25 01           ldi16	r1, 0x125
 f1 21                 mov	r4, r1
 c1 61                 ldi8	r5, 0x61
 eb                    callp	q3
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 f2 49                 sub	r3, r1
 f4 ab                 inc16	r3
 fb 1a                 cmov.eq	r3, r2
 f2 18                 add	r3, r0
 f0 06 02 01           ldi16	r2, 0x102
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 21                 mov	r4, r1
 c1 7a                 ldi8	r5, 0x7a
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 f2 31                 sub	r0, r1
 f4 a8                 inc16	r0
 a5                    xor	r5, r5
 fb 05                 cmov.eq	r0, r5
 f2 03                 add	r0, r3
 f0 6c d5              ld16	r6, [r2+]
 ed e4 20              ld8u	r7, [r2+0]
 f1 21                 mov	r4, r1
 f1 15                 mov	r2, r5
 eb                    callp	q3
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 f2 49                 sub	r3, r1
 f4 ab                 inc16	r3
 f1 22                 mov	r4, r2
 fb 1c                 cmov.eq	r3, r4
 f2 18                 add	r3, r0
 c4 02 01              ldi16	r4, 0x102
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 05 45 01           ldi16	r1, 0x145
 f1 21                 mov	r4, r1
 c1 61                 ldi8	r5, 0x61
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 f2 31                 sub	r0, r1
 f4 a8                 inc16	r0
 fb 02                 cmov.eq	r0, r2
 f2 03                 add	r0, r3
 f0 06 02 01           ldi16	r2, 0x102
 f1 22                 mov	r4, r2
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 21                 mov	r4, r1
 c1 7a                 ldi8	r5, 0x7a
 eb                    callp	q3
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 f2 49                 sub	r3, r1
 f4 ab                 inc16	r3
 a5                    xor	r5, r5
 fb 1d                 cmov.eq	r3, r5
 f2 18                 add	r3, r0
 f0 6c d5              ld16	r6, [r2+]
 ed e4 20              ld8u	r7, [r2+0]
 f1 21                 mov	r4, r1
 f1 15                 mov	r2, r5
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 f2 31                 sub	r0, r1
 f4 a8                 inc16	r0
 fb 02                 cmov.eq	r0, r2
 f2 03                 add	r0, r3
 f0 05 02 01           ldi16	r1, 0x102
 f1 21                 mov	r4, r1
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 06 65 01           ldi16	r2, 0x165
 f1 22                 mov	r4, r2
 c1 61                 ldi8	r5, 0x61
 eb                    callp	q3
 f1 1c                 mov	r3, r4
 f6 2b                 tst16	r3
 f2 4a                 sub	r3, r2
 f4 ab                 inc16	r3
 a0                    xor	r4, r4
 fb 1c                 cmov.eq	r3, r4
 f2 18                 add	r3, r0
 f1 01                 mov	r0, r1
 f1 20                 mov	r4, r0
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 22                 mov	r4, r2
 c1 7a                 ldi8	r5, 0x7a
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f6 29                 tst16	r1
 f2 3a                 sub	r1, r2
 f4 a9                 inc16	r1
 a5                    xor	r5, r5
 fb 0d                 cmov.eq	r1, r5
 f2 0b                 add	r1, r3
 f1 20                 mov	r4, r0
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 22                 mov	r4, r2
 f1 1d                 mov	r3, r5
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 28                 tst16	r0
 f2 32                 sub	r0, r2
 f4 a8                 inc16	r0
 fb 03                 cmov.eq	r0, r3
 f2 01                 add	r0, r1
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db c3 fe              brne16	-0x13d <L0>
 f0 58 00 01           stm16	[0x100], r0
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

<strchr>:
 f1 75                 zext8	r5
 aa                    xor	r6, r6
<L0>:
 4c                    ld8u	r7, [r4]
 3d                    cmp	r7, r5
 d0 07                 breq8	0x7 <L1>
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f6                 brne8	-0xa <L0>
 02                    mov	r4, r6
<L1>:
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
 e1 1c fc              call16	-996 <__avm_run_local_dtors>
<L0>:
 c4 34 04              ldi16	r4, 0x434
 c1 00                 ldi8	r5, 0x0
 c6 34 04              ldi16	r6, 0x434
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 34 04           ldi16	r2, 0x434
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 34 04           ldi16	r0, 0x434
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
 e1 d3 fb              call16	-1069 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
