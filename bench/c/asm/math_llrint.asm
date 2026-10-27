
math_llrint.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000223 l     F .text	00000044 avm_run_constructors
000009fc l       *ABS*	00000000 .hidden __avm_crt_termination_phase
00000000 l    df *ABS*	00000000 math_llrint.c
00000466 l     O .rodata	00000040 inputs
00000100 l     O .data	00000008 wide_result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 termination.c
00000000 l    df *ABS*	00000000 sf_llrint.c
00000000 l    df *ABS*	00000000 integer.c
000004a6 l       .init_array	00000000 .hidden __init_array_end
000004a6 l       .init_array	00000000 .hidden __init_array_start
000004a6 l       .fini_array	00000000 .hidden __fini_array_start
000004a6 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	00000023 _start
00000267 g     F .text	00000043 avm_test_main
000002ac g     F .text	00000065 __avm_terminate
000002aa g     F .text	00000002 avm_halt
00000311 g     F .text	000000fd llrintf
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000040e g     F .text	0000002c __avm_ashlsi3
0000043a g     F .text	0000002c __avm_lshrsi3

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
 e1 96 00              call16	__avm_terminate
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 87 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 a6 04              ldi16	r4, 0x4a6
 c1 00                 ldi8	r5, 0x0
 c6 a6 04              ldi16	r6, 0x4a6
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 a6 04           ldi16	r0, 0x4a6
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 a6 04           ldi16	r2, 0x4a6
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
 d7 01                 sys	debug_break
 c0 0f                 ldi8	r4, 0xf
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 66 04           ldi16	r2, 0x466
 f0 03 00              ldi8	r3, 0x0
 f0 05 04 01           ldi16	r1, 0x104
<L0>:
 f1 20                 mov	r4, r0
 f4 01                 ldsp16	r5, [sp+0x0]
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 e1 81 00              call16	llrintf
 f0 6b c2              st32	[r1], q3
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 e0                 brne8	-0x20 <L0>
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
 e1 3f fd              call16	-705 <__avm_run_local_dtors>
<L0>:
 c4 a6 04              ldi16	r4, 0x4a6
 c1 00                 ldi8	r5, 0x0
 c6 a6 04              ldi16	r6, 0x4a6
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 a6 04           ldi16	r2, 0x4a6
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 a6 04           ldi16	r0, 0x4a6
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
 e1 f6 fc              call16	-778 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<llrintf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f2 62                 mov32	q0, q2
 f2 64                 mov32	q1, q0
 ff 09                 fabs	q1
 f1 23                 mov	r4, r3
 c5 00 4b              ldi16	r5, 0x4b00
 31                    cmp	r4, r5
 d2 15                 brult8	0x15 <L0>
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 7f              ldi16	r7, 0x7f7f
 f0 69 c4              cmp32	q3, q1
 fc 04                 cmov.ult	r0, r4
 fc 0d                 cmov.ult	r1, r5
 d4 19                 jmp8	0x19 <L1>
<L0>:
 f0 04 00 80           ldi16	r0, 0x8000
 f9 04                 and	r0, r1
 aa                    xor	r6, r6
 c7 00 4b              ldi16	r7, 0x4b00
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 c7 00 cb              ldi16	r7, 0xcb00
 ff 00                 fadd
 f9 a1                 or	r5, r0
 f1 04                 mov	r0, r4
 f1 0d                 mov	r1, r5
<L1>:
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff 7f              ldi16	r5, 0x7fff
 f9 80                 and	r4, r0
 f9 a4                 and	r5, r1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 5e              ldi16	r7, 0x5eff
 f0 69 c8              cmp32	q3, q2
 d8 09                 bruge8	0x9 <L2>
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 e0 96 00              jmp16	150 <L7>
<L2>:
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 4e              ldi16	r7, 0x4eff
 f0 69 c8              cmp32	q3, q2
 d2 0b                 brult8	0xb <L3>
 f2 68                 mov32	q2, q0
 ff 12                 ftos32
 09                    mov	r6, r5
 fa df                 asr16i	r6, 0xf
 0e                    mov	r7, r6
 e0 80 00              jmp16	128 <L7>
<L3>:
 c2 7f                 ldi8	r6, 0x7f
 89                    and	r6, r5
 c3 80                 ldi8	r7, 0x80
 9e                    or	r7, r6
 f1 14                 mov	r2, r4
 f1 1f                 mov	r3, r7
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 c0 b5                 ldi8	r4, 0xb5
 32                    cmp	r4, r6
 d2 54                 brult8	0x54 <L5>
 c4 6a ff              ldi16	r4, 0xff6a
 12                    add	r4, r6
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 d5 67                 call8	__avm_ashlsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 b6                 ldi8	r4, 0xb6
 f4 02                 ldsp16	r6, [sp+0x0]
 22                    sub	r4, r6
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 e1 83 00              call16	__avm_lshrsi3
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c0              cmp32	q3, q0
 d3 3d                 brslt8	0x3d <L6>
<L4>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 fb 70                 cmov.ne	r6, r0
 fb 79                 cmov.ne	r7, r1
 f7 7d                 sub32	q3, q1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 78                 sub32	q2, q0
 d4 1a                 jmp8	0x1a <L7>
<L5>:
 c4 4a ff              ldi16	r4, 0xff4a
 18                    add	r6, r4
 af                    xor	r7, r7
 f2 69                 mov32	q2, q1
 d5 18                 call8	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 c0              cmp32	q3, q0
 d9 c3                 brsge8	-0x3d <L4>
<L6>:
 f2 6b                 mov32	q3, q1
<L7>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashlsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0c                    mov	r7, r4
 fa 06                 shl16v	r5, r6
 fa 02                 shl16v	r4, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 1e                 lsr16v	r7, r6
 97                    or	r5, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 02                 shl16v	r4, r6
 04                    mov	r5, r4
 c0 00                 ldi8	r4, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret

<__avm_lshrsi3>:
 f6 2f                 tst16	r7
 d1 23                 brne8	0x23 <L1>
 ce 10                 cmpi.s8	r6, 0x10
 d8 12                 bruge8	0x12 <L0>
 f6 2e                 tst16	r6
 d0 1f                 breq8	0x1f <L2>
 0d                    mov	r7, r5
 fa 12                 lsr16v	r4, r6
 fa 16                 lsr16v	r5, r6
 f6 4e                 neg16	r6
 ca 10                 addi.s8	r6, 0x10
 fa 0e                 shl16v	r7, r6
 93                    or	r4, r7
 d4 11                 jmp8	0x11 <L2>
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 d8 09                 bruge8	0x9 <L1>
 ca f0                 addi.s8	r6, -0x10
 fa 16                 lsr16v	r5, r6
 01                    mov	r4, r5
 c1 00                 ldi8	r5, 0x0
 d4 04                 jmp8	0x4 <L2>
<L1>:
 c0 00                 ldi8	r4, 0x0
 c1 00                 ldi8	r5, 0x0
<L2>:
 ef                    ret
