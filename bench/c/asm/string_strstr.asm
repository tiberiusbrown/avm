
string_strstr.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 string_strstr.c
00000109 l     O .data	00000002 string_bench_result
0000010b l     O .data	00000003 call
0000010e l     O .data	00000080 string_bench_text
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
00000468 l       .init_array	00000000 .hidden __init_array_end
00000468 l       .init_array	00000000 .hidden __init_array_start
00000468 l       .fini_array	00000000 .hidden __fini_array_start
00000468 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000167 avm_test_main
0000042e g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000430 g     F .text	00000038 strstr

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
 e1 10 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 68 04              ldi16	r4, 0x468
 c1 00                 ldi8	r5, 0x0
 c6 68 04              ldi16	r6, 0x468
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 68 04           ldi16	r0, 0x468
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 68 04           ldi16	r2, 0x468
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
 c4 68 04              ldi16	r4, 0x468
 c1 00                 ldi8	r5, 0x0
 c6 68 04              ldi16	r6, 0x468
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 68 04           ldi16	r2, 0x468
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 68 04           ldi16	r0, 0x468
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
 d6 fe                 adjsp	-0x2
 f2 30                 sub	r0, r0
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 c4 0b 01              ldi16	r4, 0x10b
 f1 1c                 mov	r3, r4
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 06 0e 01           ldi16	r2, 0x10e
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 22                 mov	r4, r2
 c5 04 01              ldi16	r5, 0x104
 eb                    callp	q3
 f6 2c                 tst16	r4
 f2 52                 sub	r4, r2
 f4 ac                 inc16	r4
 f2 4b                 sub	r3, r3
 fb 23                 cmov.eq	r4, r3
 f6 29                 tst16	r1
 f2 3a                 sub	r1, r2
 f4 a9                 inc16	r1
 fb 0b                 cmov.eq	r1, r3
 f2 08                 add	r1, r0
 f2 0c                 add	r1, r4
 f0 07 0b 01           ldi16	r3, 0x10b
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 22                 mov	r4, r2
 c5 08 01              ldi16	r5, 0x108
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 f2 32                 sub	r0, r2
 f4 a8                 inc16	r0
 a0                    xor	r4, r4
 fb 04                 cmov.eq	r0, r4
 f2 01                 add	r0, r1
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 06 2e 01           ldi16	r2, 0x12e
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f6 29                 tst16	r1
 f2 3a                 sub	r1, r2
 f4 a9                 inc16	r1
 f2 4b                 sub	r3, r3
 fb 0b                 cmov.eq	r1, r3
 f2 08                 add	r1, r0
 c5 0b 01              ldi16	r5, 0x10b
 01                    mov	r4, r5
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 22                 mov	r4, r2
 c5 04 01              ldi16	r5, 0x104
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 f2 32                 sub	r0, r2
 f4 a8                 inc16	r0
 fb 03                 cmov.eq	r0, r3
 f2 01                 add	r0, r1
 f0 07 0b 01           ldi16	r3, 0x10b
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 22                 mov	r4, r2
 c5 08 01              ldi16	r5, 0x108
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f6 29                 tst16	r1
 f2 3a                 sub	r1, r2
 f4 a9                 inc16	r1
 a0                    xor	r4, r4
 fb 0c                 cmov.eq	r1, r4
 f2 08                 add	r1, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 06 4e 01           ldi16	r2, 0x14e
 f1 22                 mov	r4, r2
 c5 00 01              ldi16	r5, 0x100
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 f2 32                 sub	r0, r2
 f4 a8                 inc16	r0
 f2 4b                 sub	r3, r3
 fb 03                 cmov.eq	r0, r3
 f2 01                 add	r0, r1
 c4 0b 01              ldi16	r4, 0x10b
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 22                 mov	r4, r2
 c5 04 01              ldi16	r5, 0x104
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f6 29                 tst16	r1
 f2 3a                 sub	r1, r2
 f4 a9                 inc16	r1
 fb 0b                 cmov.eq	r1, r3
 f2 08                 add	r1, r0
 c4 0b 01              ldi16	r4, 0x10b
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 22                 mov	r4, r2
 c5 08 01              ldi16	r5, 0x108
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f6 28                 tst16	r0
 f2 32                 sub	r0, r2
 f4 a8                 inc16	r0
 fb 03                 cmov.eq	r0, r3
 f1 13                 mov	r2, r3
 f2 01                 add	r0, r1
 c4 0b 01              ldi16	r4, 0x10b
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 07 6e 01           ldi16	r3, 0x16e
 f1 23                 mov	r4, r3
 c5 00 01              ldi16	r5, 0x100
 eb                    callp	q3
 f1 0c                 mov	r1, r4
 f6 29                 tst16	r1
 f2 3b                 sub	r1, r3
 f4 a9                 inc16	r1
 fb 0a                 cmov.eq	r1, r2
 f2 08                 add	r1, r0
 f0 04 0b 01           ldi16	r0, 0x10b
 f1 20                 mov	r4, r0
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 23                 mov	r4, r3
 c5 04 01              ldi16	r5, 0x104
 eb                    callp	q3
 f1 14                 mov	r2, r4
 f6 2a                 tst16	r2
 f2 43                 sub	r2, r3
 f4 aa                 inc16	r2
 a0                    xor	r4, r4
 fb 14                 cmov.eq	r2, r4
 f2 11                 add	r2, r1
 f1 20                 mov	r4, r0
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 23                 mov	r4, r3
 c5 08 01              ldi16	r5, 0x108
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 28                 tst16	r0
 f2 33                 sub	r0, r3
 f4 a8                 inc16	r0
 a5                    xor	r5, r5
 fb 05                 cmov.eq	r0, r5
 f2 02                 add	r0, r2
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db b3 fe              brne16	-0x14d <L0>
 f0 58 09 01           stm16	[0x109], r0
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

<strstr>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f5 35                 ld8u	r1, [r5]
 f4 a1                 tst8	r1
 d0 29                 breq8	0x29 <L4>
 f2 30                 sub	r0, r0
 48                    ld8u	r6, [r4]
 f4 a6                 tst8	r6
 d0 20                 breq8	0x20 <L3>
<L0>:
 f1 1d                 mov	r3, r5
 f1 11                 mov	r2, r1
 08                    mov	r6, r4
<L1>:
 4e                    ld8u	r7, [r6]
 f5 2e                 cmp	r7, r2
 d1 0d                 brne8	0xd <L2>
 f4 ae                 inc16	r6
 ed 46 21              ld8u	r2, [r3+1]
 f4 ab                 inc16	r3
 f4 a2                 tst8	r2
 d1 f0                 brne8	-0x10 <L1>
 d4 0b                 jmp8	0xb <L4>
<L2>:
 ed c8 21              ld8u	r6, [r4+1]
 f4 ac                 inc16	r4
 f4 a6                 tst8	r6
 d1 e0                 brne8	-0x20 <L0>
<L3>:
 f1 20                 mov	r4, r0
<L4>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
