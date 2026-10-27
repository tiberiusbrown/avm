
string_strncmp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 string_strncmp.c
00000113 l     O .data	00000002 string_bench_result
00000115 l     O .data	00000003 call
00000118 l     O .data	00000080 string_bench_text
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
000003f6 l       .init_array	00000000 .hidden __init_array_end
000003f6 l       .init_array	00000000 .hidden __init_array_start
000003f6 l       .fini_array	00000000 .hidden __fini_array_start
000003f6 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000010d avm_test_main
000003d4 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000003d6 g     F .text	00000020 strncmp

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
 e1 b6 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f6 03              ldi16	r4, 0x3f6
 c1 00                 ldi8	r5, 0x0
 c6 f6 03              ldi16	r6, 0x3f6
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 f6 03           ldi16	r0, 0x3f6
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f6 03           ldi16	r2, 0x3f6
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
 c4 f6 03              ldi16	r4, 0x3f6
 c1 00                 ldi8	r5, 0x0
 c6 f6 03              ldi16	r6, 0x3f6
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 f6 03           ldi16	r2, 0x3f6
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f6 03           ldi16	r0, 0x3f6
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
 f2 42                 sub	r2, r2
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 18 01              ldi16	r4, 0x118
 c5 38 01              ldi16	r5, 0x138
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 18 01              ldi16	r4, 0x118
 04                    mov	r5, r4
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 18 01              ldi16	r4, 0x118
 c5 00 01              ldi16	r5, 0x100
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 38 01              ldi16	r4, 0x138
 c5 58 01              ldi16	r5, 0x158
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 38 01              ldi16	r4, 0x138
 04                    mov	r5, r4
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 38 01              ldi16	r4, 0x138
 c5 00 01              ldi16	r5, 0x100
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 58 01              ldi16	r4, 0x158
 c5 78 01              ldi16	r5, 0x178
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 58 01              ldi16	r4, 0x158
 04                    mov	r5, r4
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 58 01              ldi16	r4, 0x158
 c5 00 01              ldi16	r5, 0x100
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 78 01              ldi16	r4, 0x178
 c5 18 01              ldi16	r5, 0x118
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 78 01              ldi16	r4, 0x178
 04                    mov	r5, r4
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 15 01              ldi16	r4, 0x115
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 78 01              ldi16	r4, 0x178
 c5 00 01              ldi16	r5, 0x100
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 13                 add	r2, r3
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db 0d ff              brne16	-0xf3 <L0>
 f0 5a 13 01           stm16	[0x113], r2
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

<strncmp>:
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
<L0>:
 f6 2e                 tst16	r6
 d0 12                 breq8	0x12 <L2>
 f7 09                 ld8u	r1, [r5+]
 f7 07                 ld8u	r7, [r4+]
 f4 b6                 dec16	r6
 f4 a7                 tst8	r7
 d0 04                 breq8	0x4 <L1>
 f5 2d                 cmp	r7, r1
 d0 ee                 breq8	-0x12 <L0>
<L1>:
 f2 5d                 sub	r7, r1
 d4 02                 jmp8	0x2 <L3>
<L2>:
 f1 2c                 mov	r7, r0
<L3>:
 03                    mov	r4, r7
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
