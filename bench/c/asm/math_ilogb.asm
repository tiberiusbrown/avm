
math_ilogb.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000222 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_ilogb.c
000003c8 l     O .rodata	00000040 inputs
00000100 l     O .data	00000002 integer_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 sf_ilogb.c
00000000 l    df *ABS*	00000000 stdlib.c
00000000 l    df *ABS*	00000000 avm.c
00000000 l    df *ABS*	00000000 ctype.c
00000000 l    df *ABS*	00000000 strtof.c
00000000 l    df *ABS*	00000000 integer.c
00000000 l    df *ABS*	00000000 wide_integer.c
00000408 l       .init_array	00000000 .hidden __init_array_end
00000408 l       .init_array	00000000 .hidden __init_array_start
00000408 l       .fini_array	00000000 .hidden __fini_array_start
00000408 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000022 _start
00000266 g     F .text	00000033 avm_test_main
0000029b g     F .text	00000065 __avm_terminate
00000299 g     F .text	00000002 avm_halt
00000300 g     F .text	000000c8 ilogbf
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000102 g     O .data	00000002 __avm_errno

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 d5 1a                 call8	avm_run_constructors
 d5 5c                 call8	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 e1 85 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 77                 call8	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 08 04              ldi16	r4, 0x408
 c1 00                 ldi8	r5, 0x0
 c6 08 04              ldi16	r6, 0x408
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 08 04           ldi16	r0, 0x408
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 08 04           ldi16	r2, 0x408
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
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 01 0f              ldi8	r1, 0xf
 f0 06 c8 03           ldi16	r2, 0x3c8
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f1 20                 mov	r4, r0
 f9 84                 and	r4, r1
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 d5 7a                 call8	ilogbf
 f0 5c 00 01           stm16	[0x100], r4
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 e7                 brne8	-0x19 <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
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
 e1 50 fd              call16	-688 <__avm_run_local_dtors>
<L0>:
 c4 08 04              ldi16	r4, 0x408
 c1 00                 ldi8	r5, 0x0
 c6 08 04              ldi16	r6, 0x408
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 08 04           ldi16	r2, 0x408
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 08 04           ldi16	r0, 0x408
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
 e1 07 fd              call16	-761 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<ilogbf>:
 b1                    push16	r1
 b0                    push16	r0
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 a0                    xor	r4, r4
 c5 80 80              ldi16	r5, 0x8080
 f2 63                 mov32	q0, q3
 f7 62                 add32	q0, q2
 f0 69 80              cmp32	q2, q0
 dd 87 00              bruge16	0x87 <L3>
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 87                 lsr16i	r5, 0x7
 f4 a5                 tst8	r5
 d0 06                 breq8	0x6 <L0>
 c9 81                 addi.s8	r5, -0x7f
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L0>:
 f6 2c                 tst16	r4
 d0 39                 breq8	0x39 <L1>
 04                    mov	r5, r4
 f4 8d                 lsr16.1	r5
 94                    or	r5, r4
 01                    mov	r4, r5
 fa 72                 lsr16i	r4, 0x2
 91                    or	r4, r5
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 94                    or	r5, r4
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 99                    or	r6, r5
 c4 ff ff              ldi16	r4, 0xffff
 a2                    xor	r4, r6
 c5 55 55              ldi16	r5, 0x5555
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 89                    and	r6, r5
 22                    sub	r4, r6
 c5 33 33              ldi16	r5, 0x3333
 08                    mov	r6, r4
 89                    and	r6, r5
 fa 72                 lsr16i	r4, 0x2
 81                    and	r4, r5
 12                    add	r4, r6
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 14                    add	r5, r4
 c4 0f 0f              ldi16	r4, 0xf0f
 81                    and	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c0 1f                 ldi8	r4, 0x1f
 81                    and	r4, r5
 c5 8a ff              ldi16	r5, 0xff8a
 d4 37                 jmp8	0x37 <L2>
<L1>:
 02                    mov	r4, r6
 f4 8c                 lsr16.1	r4
 92                    or	r4, r6
 04                    mov	r5, r4
 fa 82                 lsr16i	r5, 0x2
 94                    or	r5, r4
 01                    mov	r4, r5
 fa 74                 lsr16i	r4, 0x4
 91                    or	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 94                    or	r5, r4
 c4 ff ff              ldi16	r4, 0xffff
 a1                    xor	r4, r5
 c5 55 55              ldi16	r5, 0x5555
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 89                    and	r6, r5
 22                    sub	r4, r6
 c5 33 33              ldi16	r5, 0x3333
 08                    mov	r6, r4
 89                    and	r6, r5
 fa 72                 lsr16i	r4, 0x2
 81                    and	r4, r5
 12                    add	r4, r6
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 14                    add	r5, r4
 c4 0f 0f              ldi16	r4, 0xf0f
 81                    and	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 c0 1f                 ldi8	r4, 0x1f
 81                    and	r4, r5
 c5 7a ff              ldi16	r5, 0xff7a
<L2>:
 24                    sub	r5, r4
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L3>:
 c0 21                 ldi8	r4, 0x21
 f0 5c 02 01           stm16	[0x102], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 d0 15                 breq8	0x15 <L4>
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 c5 00 80              ldi16	r5, 0x8000
 c4 ff 7f              ldi16	r4, 0x7fff
 f0 69 c0              cmp32	q3, q0
 fb 2c                 cmov.eq	r5, r4
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L4>:
 c5 00 80              ldi16	r5, 0x8000
 01                    mov	r4, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
