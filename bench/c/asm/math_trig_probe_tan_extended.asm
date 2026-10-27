
math_trig_probe_tan_extended.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_trig_probe_tan_extended.c
00000100 l     O .data	00000020 probe_inputs
00000120 l     O .data	00000004 remainder_result
00000124 l     O .data	00000004 quadrant_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 sf_tan.c
0000035a l       .init_array	00000000 .hidden __init_array_end
0000035a l       .init_array	00000000 .hidden __init_array_start
0000035a l       .fini_array	00000000 .hidden __fini_array_start
0000035a l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000043 avm_test_main
0000030a g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000030c g     F .text	0000004e tanf

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
 e1 ec 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 5a 03              ldi16	r4, 0x35a
 c1 00                 ldi8	r5, 0x0
 c6 5a 03              ldi16	r6, 0x35a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 5a 03           ldi16	r0, 0x35a
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 5a 03           ldi16	r2, 0x35a
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
 c4 5a 03              ldi16	r4, 0x35a
 c1 00                 ldi8	r5, 0x0
 c6 5a 03              ldi16	r6, 0x35a
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 5a 03           ldi16	r2, 0x35a
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 5a 03           ldi16	r0, 0x35a
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
 f2 42                 sub	r2, r2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 03 07              ldi8	r3, 0x7
<L0>:
 f1 22                 mov	r4, r2
 f9 8c                 and	r4, r3
 10                    add	r4, r4
 10                    add	r4, r4
 c5 00 01              ldi16	r5, 0x100
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 d5 27                 call8	tanf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f4 aa                 inc16	r2
 f0 0e 20              cmpi.s8	r2, 0x20
 d1 e2                 brne8	-0x1e <L0>
 c4 20 01              ldi16	r4, 0x120
 f0 6b 08              st32	[r4], q0
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<tanf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 ff 1d                 frempio2
 f4 42                 stsp16	[sp+0x0], r6
 f2 62                 mov32	q0, q2
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 16 03 28 48 a9 3d 17 d6 00 3e a9 cf aa 3e  fpoly	3, 0.0826571583, 0.125816688, 0.333615571
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 1e                 fma
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 00 01              ldi8	r0, 0x1
 f4 00                 ldsp16	r4, [sp+0x0]
 f9 10                 and	r0, r4
 a0                    xor	r4, r4
 c5 80 bf              ldi16	r5, 0xbf80
 f4 a0                 tst8	r0
 d0 09                 breq8	0x9 <L0>
 ff 03                 fdiv
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L0>:
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
