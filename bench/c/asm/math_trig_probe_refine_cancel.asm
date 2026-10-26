
math_trig_probe_refine_cancel.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_trig_probe_refine_cancel.c
00000100 l     O .data	00000020 probe_inputs
00000120 l     O .data	00000020 probe_quotients
00000140 l     O .data	00000004 remainder_result
00000144 l     O .data	00000004 quadrant_result
00000000 l    df *ABS*	00000000 runtime.c
0000035d l       .init_array	00000000 .hidden __init_array_end
0000035d l       .init_array	00000000 .hidden __init_array_start
0000035d l       .fini_array	00000000 .hidden __fini_array_start
0000035d l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000094 avm_test_main
0000035b g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 3d 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 5d 03              ldi16	r4, 0x35d
 c1 00                 ldi8	r5, 0x0
 c6 5d 03              ldi16	r6, 0x35d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 5d 03           ldi16	r0, 0x35d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 5d 03           ldi16	r2, 0x35d
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
 c4 5d 03              ldi16	r4, 0x35d
 c1 00                 ldi8	r5, 0x0
 c6 5d 03              ldi16	r6, 0x35d
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 5d 03           ldi16	r2, 0x35d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 5d 03           ldi16	r0, 0x35d
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
 d6 f0                 adjsp	-0x10
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 c1 1c                 ldi8	r5, 0x1c
 f4 41                 stsp16	[sp+0x0], r5
<L0>:
 f4 58                 stsp16	[sp+0x6], r4
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 10                    add	r4, r4
 10                    add	r4, r4
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 04                    mov	r5, r4
 c6 20 01              ldi16	r6, 0x120
 16                    add	r5, r6
 c6 00 01              ldi16	r6, 0x100
 12                    add	r4, r6
 f0 6a 08              ld32	q0, [r4]
 f0 6a 8a              ld32	q2, [r5]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 ff c0 42              s16tof	q2, r4
 f0 06 80 0f           ldi16	r2, 0xf80
 f0 07 c9 bf           ldi16	r3, 0xbfc9
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 2d                 fmul	q3, q1
 ff 64                 fabs	q0
 ff 03                 fadd	q0, q3
 c6 00 44              ldi16	r6, 0x4400
 c7 35 b7              ldi16	r7, 0xb735
 f2 66                 mov32	q1, q2
 ff 27                 fmul	q1, q3
 ff 01                 fadd	q0, q1
 c6 09 a3              ldi16	r6, 0xa309
 c7 85 ae              ldi16	r7, 0xae85
 ff 2b                 fmul	q2, q3
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 02                 fadd	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 08                 fadd	q2, q0
 f2 62                 mov32	q0, q2
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f0 32 02              ldsp16	r2, [sp+0x2]
 f9 88                 and	r4, r2
 f7 6e                 add32	q3, q2
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 ac                 inc16	r4
 cc 20                 cmpi.s8	r4, 0x20
 d1 95                 brne8	-0x6b <L0>
 c4 40 01              ldi16	r4, 0x140
 f0 6b 08              st32	[r4], q0
 c4 44 01              ldi16	r4, 0x144
 f0 6b c8              st32	[r4], q3
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
