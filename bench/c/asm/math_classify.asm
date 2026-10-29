
math_classify.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_classify.c
00000100 l     O .data	00000002 integer_result
000003aa l     O .rodata	00000040 inputs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
000003ea l       .init_array	00000000 .hidden __init_array_end
000003ea l       .init_array	00000000 .hidden __init_array_start
000003ea l       .fini_array	00000000 .hidden __fini_array_start
000003ea l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	000000dc avm_test_main
00000345 g     F .text	00000065 __avm_terminate
00000343 g     F .text	00000002 avm_halt
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
 e1 2f 01              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 20 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ea 03              ldi16	r4, 0x3ea
 c1 00                 ldi8	r5, 0x0
 c6 ea 03              ldi16	r6, 0x3ea
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 ea 03           ldi16	r0, 0x3ea
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ea 03           ldi16	r2, 0x3ea
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
 d6 f4                 adjsp	-0xc
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c1 0f                 ldi8	r5, 0xf
 f4 51                 stsp16	[sp+0x4], r5
 f0 00 02              ldi8	r0, 0x2
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 d4 62                 jmp8	0x62 <L2>
<L0>:
 a5                    xor	r5, r5
<L1>:
 f4 61                 stsp16	[sp+0x8], r5
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 a0                    xor	r4, r4
 ce 02                 cmpi.s8	r6, 0x2
 fb 20                 cmov.eq	r4, r0
 f4 58                 stsp16	[sp+0x6], r4
 f2 69                 mov32	q2, q1
 ff 15                 fclass
 f1 25                 mov	r5, r1
 f1 0e                 mov	r1, r6
 c4 08 01              ldi16	r4, 0x108
 82                    and	r4, r6
 f6 2c                 tst16	r4
 f8 08                 cset.ne	r0
 f9 14                 and	r0, r5
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f2 69                 mov32	q2, q1
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 f8 04                 cset.eq	r4
 f2 20                 add	r4, r0
 f0 00 02              ldi8	r0, 0x2
 c5 f8 01              ldi16	r5, 0x1f8
 f9 a4                 and	r5, r1
 f6 2d                 tst16	r5
 f8 0d                 cset.ne	r5
 c3 01                 ldi8	r7, 0x1
 87                    and	r5, r7
 14                    add	r5, r4
 c4 04 02              ldi16	r4, 0x204
 f9 84                 and	r4, r1
 f6 2c                 tst16	r4
 f8 0e                 cset.ne	r6
 8b                    and	r6, r7
 19                    add	r6, r5
 f1 23                 mov	r4, r3
 fa 7f                 lsr16i	r4, 0xf
 12                    add	r4, r6
 f4 19                 ldsp16	r5, [sp+0x6]
 11                    add	r4, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 11                    add	r4, r5
 f0 5c 00 01           stm16	[0x100], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 ac                 inc16	r4
 cc 20                 cmpi.s8	r4, 0x20
 d0 58                 breq8	0x58 <L3>
<L2>:
 f4 68                 stsp16	[sp+0xa], r4
 f4 11                 ldsp16	r5, [sp+0x4]
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 c6 aa 03              ldi16	r6, 0x3aa
 c3 00                 ldi8	r7, 0x0
 f7 6b                 add32	q2, q3
 f0 64 48              ldp32	q1, [q2]
 f2 69                 mov32	q2, q1
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 14                 fcmp
 f6 2e                 tst16	r6
 f0 01 01              ldi8	r1, 0x1
 f1 24                 mov	r5, r0
 da 7b ff              breq16	-0x85 <L1>
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 ce 02                 cmpi.s8	r6, 0x2
 da 6f ff              breq16	-0x91 <L0>
 f2 69                 mov32	q2, q1
 ff 15                 fclass
 c4 04 02              ldi16	r4, 0x204
 88                    and	r6, r4
 f6 2e                 tst16	r6
 f8 0c                 cset.ne	r4
 f9 84                 and	r4, r1
 f4 a4                 tst8	r4
 f1 25                 mov	r5, r1
 db 5b ff              brne16	-0xa5 <L1>
 f2 69                 mov32	q2, q1
 ff 0a                 fabs	q2
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 ff 14                 fcmp
 c1 03                 ldi8	r5, 0x3
 c0 04                 ldi8	r4, 0x4
 ce ff                 cmpi.s8	r6, -0x1
 fb 6c                 cmov.ne	r5, r4
 e0 47 ff              jmp16	-185 <L1>
<L3>:
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	0xc
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
 e1 a6 fc              call16	-858 <__avm_run_local_dtors>
<L0>:
 c4 ea 03              ldi16	r4, 0x3ea
 c1 00                 ldi8	r5, 0x0
 c6 ea 03              ldi16	r6, 0x3ea
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 ea 03           ldi16	r2, 0x3ea
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ea 03           ldi16	r0, 0x3ea
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
 e1 5d fc              call16	-931 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
