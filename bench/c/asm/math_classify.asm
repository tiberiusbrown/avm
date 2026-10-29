
math_classify.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_classify.c
00000100 l     O .data	00000002 integer_result
000003a2 l     O .rodata	00000040 inputs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
000003e2 l       .init_array	00000000 .hidden __init_array_end
000003e2 l       .init_array	00000000 .hidden __init_array_start
000003e2 l       .fini_array	00000000 .hidden __fini_array_start
000003e2 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000d4 avm_test_main
0000033d g     F .text	00000065 __avm_terminate
0000033b g     F .text	00000002 avm_halt
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
 e1 27 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 18 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e2 03              ldi16	r4, 0x3e2
 c1 00                 ldi8	r5, 0x0
 c6 e2 03              ldi16	r6, 0x3e2
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 e2 03           ldi16	r0, 0x3e2
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e2 03           ldi16	r2, 0x3e2
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
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c1 0f                 ldi8	r5, 0xf
 f4 41                 stsp16	[sp+0x0], r5
 f0 02 02              ldi8	r2, 0x2
 d4 5d                 jmp8	0x5d <L2>
<L0>:
 a5                    xor	r5, r5
<L1>:
 f4 49                 stsp16	[sp+0x2], r5
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 11                 mov	r2, r1
 f4 82                 lsl16.1	r2
 f9 89                 or	r4, r2
 f2 4b                 sub	r3, r3
 3c                    cmp	r7, r4
 fc 1e                 cmov.ult	r3, r6
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 68                 mov32	q2, q0
 ff 14                 fcmp
 c4 80 7f              ldi16	r4, 0x7f80
 84                    and	r5, r4
 0d                    mov	r7, r5
 cb 80                 addi.s8	r7, -0x80
 c4 00 7f              ldi16	r4, 0x7f00
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 c3 01                 ldi8	r7, 0x1
 83                    and	r4, r7
 ce 01                 cmpi.s8	r6, 0x1
 f8 06                 cset.eq	r6
 18                    add	r6, r4
 c4 80 7f              ldi16	r4, 0x7f80
 34                    cmp	r5, r4
 f8 0c                 cset.ne	r4
 83                    and	r4, r7
 12                    add	r4, r6
 c5 00 ff              ldi16	r5, 0xff00
 f9 56                 xor	r2, r5
 f9 41                 or	r2, r0
 f6 2a                 tst16	r2
 f0 02 02              ldi8	r2, 0x2
 f8 06                 cset.eq	r6
 8b                    and	r6, r7
 18                    add	r6, r4
 f1 21                 mov	r4, r1
 fa 7f                 lsr16i	r4, 0xf
 12                    add	r4, r6
 f2 23                 add	r4, r3
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f0 5c 00 01           stm16	[0x100], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 ac                 inc16	r4
 cc 20                 cmpi.s8	r4, 0x20
 d0 5b                 breq8	0x5b <L3>
<L2>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 c6 a2 03              ldi16	r6, 0x3a2
 c3 00                 ldi8	r7, 0x0
 f7 6b                 add32	q2, q3
 f0 64 08              ldp32	q0, [q2]
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 c7 00 ff              ldi16	r7, 0xff00
 f0 03 01              ldi8	r3, 0x1
 f1 26                 mov	r5, r2
 f1 2a                 mov	r6, r2
 da 7e ff              breq16	-0x82 <L1>
 f1 20                 mov	r4, r0
 f7 8c                 bool	r4
 f1 25                 mov	r5, r1
 15                    add	r5, r5
 94                    or	r5, r4
 3d                    cmp	r7, r5
 dc 71 ff              brult16	-0x8f <L0>
 f1 21                 mov	r4, r1
 10                    add	r4, r4
 a3                    xor	r4, r7
 f1 24                 mov	r5, r0
 94                    or	r5, r4
 f6 2d                 tst16	r5
 f1 27                 mov	r5, r3
 da 64 ff              breq16	-0x9c <L1>
 f2 68                 mov32	q2, q0
 ff 0a                 fabs	q2
 f1 16                 mov	r2, r6
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 ff 14                 fcmp
 c7 00 ff              ldi16	r7, 0xff00
 c1 03                 ldi8	r5, 0x3
 c0 04                 ldi8	r4, 0x4
 ce ff                 cmpi.s8	r6, -0x1
 f1 2a                 mov	r6, r2
 fb 6c                 cmov.ne	r5, r4
 e0 49 ff              jmp16	-183 <L1>
<L3>:
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
 e1 ae fc              call16	-850 <__avm_run_local_dtors>
<L0>:
 c4 e2 03              ldi16	r4, 0x3e2
 c1 00                 ldi8	r5, 0x0
 c6 e2 03              ldi16	r6, 0x3e2
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 e2 03           ldi16	r2, 0x3e2
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e2 03           ldi16	r0, 0x3e2
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
 e1 65 fc              call16	-923 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
