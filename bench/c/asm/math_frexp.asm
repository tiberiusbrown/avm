
math_frexp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_frexp.c
00000403 l     O .rodata	00000040 inputs
00000100 l     O .data	00000002 integer_result
00000102 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 sf_decompose.c
00000000 l    df *ABS*	00000000 sf_scalbn.c
00000443 l       .init_array	00000000 .hidden __init_array_end
00000443 l       .init_array	00000000 .hidden __init_array_start
00000443 l       .fini_array	00000000 .hidden __fini_array_start
00000443 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000042 avm_test_main
00000309 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000030b g     F .text	000000f8 frexpf

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
 e1 eb 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 43 04              ldi16	r4, 0x443
 c1 00                 ldi8	r5, 0x0
 c6 43 04              ldi16	r6, 0x443
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 43 04           ldi16	r0, 0x443
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 43 04           ldi16	r2, 0x443
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
 c4 43 04              ldi16	r4, 0x443
 c1 00                 ldi8	r5, 0x0
 c6 43 04              ldi16	r6, 0x443
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 43 04           ldi16	r2, 0x443
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 43 04           ldi16	r0, 0x443
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
 d7 01                 sys	debug_break
 f0 01 0f              ldi8	r1, 0xf
 f0 06 03 04           ldi16	r2, 0x403
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f1 20                 mov	r4, r0
 f9 84                 and	r4, r1
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 f0 16 00              leasp	r6, 0x0
 d5 1f                 call8	frexpf
 c6 02 01              ldi16	r6, 0x102
 f0 6b 8c              st32	[r6], q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 5c 00 01           stm16	[0x100], r4
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 dc                 brne8	-0x24 <L0>
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

<frexpf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 af                    xor	r7, r7
 f4 62                 stsp16	[sp+0x8], r6
 7b                    st16	[r6], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 42                 sub	r2, r2
 f0 07 80 80           ldi16	r3, 0x8080
 f7 67                 add32	q1, q3
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 80           ldi16	r1, 0x8080
 f0 69 40              cmp32	q1, q0
 d2 68                 brult8	0x68 <L4>
 f1 0d                 mov	r1, r5
 03                    mov	r4, r7
 fa 77                 lsr16i	r4, 0x7
 f4 a4                 tst8	r4
 d1 4b                 brne8	0x4b <L3>
 f0 06 00 01           ldi16	r2, 0x100
 f2 4b                 sub	r3, r3
 c0 01                 ldi8	r4, 0x1
 c5 f1 ff              ldi16	r5, 0xfff1
 f0 69 c4              cmp32	q3, q1
 fc 25                 cmov.ult	r4, r5
 f1 1e                 mov	r3, r6
 f2 42                 sub	r2, r2
 fc 32                 cmov.ult	r6, r2
 fc 3b                 cmov.ult	r7, r3
 f0 06 ff ff           ldi16	r2, 0xffff
 f2 4b                 sub	r3, r3
 f0 69 4c              cmp32	q1, q3
 d8 43                 bruge8	0x43 <L5>
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 0f              ldi8	r3, 0xf
 f0 69 4c              cmp32	q1, q3
 d8 54                 bruge8	0x54 <L6>
<L0>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 3f              ldi8	r3, 0x3f
 f0 69 4c              cmp32	q1, q3
 d8 6f                 bruge8	0x6f <L7>
<L1>:
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 4c              cmp32	q1, q3
 d2 04                 brult8	0x4 <L3>
<L2>:
 f4 b4                 dec16	r4
 f7 6f                 add32	q3, q3
<L3>:
 c8 82                 addi.s8	r4, -0x7e
 f4 21                 ldsp16	r5, [sp+0x8]
 74                    st16	[r5], r4
 c0 7f                 ldi8	r4, 0x7f
 83                    and	r4, r7
 c5 00 80              ldi16	r5, 0x8000
 f9 a4                 and	r5, r1
 94                    or	r5, r4
 c4 00 3f              ldi16	r4, 0x3f00
 91                    or	r4, r5
 04                    mov	r5, r4
 02                    mov	r4, r6
<L4>:
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L5>:
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 03                    mov	r4, r7
 fa 38                 lsl16i	r4, 0x8
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 9c                    or	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 58                 lsl16i	r6, 0x8
 c8 f8                 addi.s8	r4, -0x8
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 0f              ldi8	r3, 0xf
 f0 69 4c              cmp32	q1, q3
 d2 ac                 brult8	-0x54 <L0>
<L6>:
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 54                 lsl16i	r6, 0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 12                 ldsp16	r6, [sp+0x4]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 f4 02                 ldsp16	r6, [sp+0x0]
 96                    or	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 fa 54                 lsl16i	r6, 0x4
 0d                    mov	r7, r5
 c8 fc                 addi.s8	r4, -0x4
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 3f              ldi8	r3, 0x3f
 f0 69 4c              cmp32	q1, q3
 d2 91                 brult8	-0x6f <L1>
<L7>:
 f1 17                 mov	r2, r7
 f4 82                 lsl16.1	r2
 f4 82                 lsl16.1	r2
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 f9 a9                 or	r5, r2
 1a                    add	r6, r6
 1a                    add	r6, r6
 0d                    mov	r7, r5
 c8 fe                 addi.s8	r4, -0x2
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 69 4c              cmp32	q1, q3
 d2 85                 brult8	-0x7b <L3>
 e0 7e ff              jmp16	-130 <L2>
