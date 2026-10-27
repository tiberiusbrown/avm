
math_ldexp.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_ldexp.c
000003a6 l     O .rodata	00000040 inputs
00000100 l     O .data	00000004 result
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 sf_decompose.c
00000000 l    df *ABS*	00000000 sf_scalbn.c
000003e6 l       .init_array	00000000 .hidden __init_array_end
000003e6 l       .init_array	00000000 .hidden __init_array_start
000003e6 l       .fini_array	00000000 .hidden __fini_array_start
000003e6 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000039 avm_test_main
00000300 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000302 g     F .text	00000002 ldexpf
00000304 g     F .text	000000a2 scalbnf

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
 e1 e2 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 e6 03              ldi16	r4, 0x3e6
 c1 00                 ldi8	r5, 0x0
 c6 e6 03              ldi16	r6, 0x3e6
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 e6 03           ldi16	r0, 0x3e6
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 e6 03           ldi16	r2, 0x3e6
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
 c4 e6 03              ldi16	r4, 0x3e6
 c1 00                 ldi8	r5, 0x0
 c6 e6 03              ldi16	r6, 0x3e6
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 e6 03           ldi16	r2, 0x3e6
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 e6 03           ldi16	r0, 0x3e6
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
 f0 04 f0 ff           ldi16	r0, 0xfff0
 d7 01                 sys	debug_break
 f0 01 0f              ldi8	r1, 0xf
 f0 06 a6 03           ldi16	r2, 0x3a6
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f1 20                 mov	r4, r0
 f9 84                 and	r4, r1
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 f1 28                 mov	r6, r0
 d5 17                 call8	ldexpf
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 e3                 brne8	-0x1d <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<ldexpf>:
 d4 00                 jmp8	scalbnf

<scalbnf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f1 06                 mov	r0, r6
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 f6 2e                 tst16	r6
 da 8a 00              breq16	0x8a <L7>
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f1 76                 zext8	r6
 f0 01 ff              ldi8	r1, 0xff
 f5 29                 cmp	r6, r1
 d1 06                 brne8	0x6 <L0>
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 d4 78                 jmp8	0x78 <L7>
<L0>:
 c7 15 01              ldi16	r7, 0x115
 f5 07                 cmp	r0, r7
 d3 14                 brslt8	0x14 <L1>
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 82                    and	r4, r6
 87                    and	r5, r7
 c6 80 7f              ldi16	r6, 0x7f80
 c7 80 ff              ldi16	r7, 0xff80
 f0 69 84              cmp32	q2, q1
 fb 77                 cmov.ne	r6, r7
 06                    mov	r5, r6
 d4 5d                 jmp8	0x5d <L7>
<L1>:
 c7 ea fe              ldi16	r7, 0xfeea
 f5 2c                 cmp	r7, r0
 d3 09                 brslt8	0x9 <L2>
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 8d                    and	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d4 4d                 jmp8	0x4d <L7>
<L2>:
 f4 a6                 tst8	r6
 d1 0d                 brne8	0xd <L3>
 aa                    xor	r6, r6
 c7 00 4c              ldi16	r7, 0x4c00
 ff 02                 fmul
 09                    mov	r6, r5
 fa 97                 lsr16i	r6, 0x7
 f1 76                 zext8	r6
 ca e7                 addi.s8	r6, -0x19
<L3>:
 f2 28                 add	r6, r0
 f5 29                 cmp	r6, r1
 d3 0b                 brslt8	0xb <L4>
 c4 00 80              ldi16	r4, 0x8000
 81                    and	r4, r5
 c5 80 7f              ldi16	r5, 0x7f80
 94                    or	r5, r4
 a0                    xor	r4, r4
 d4 2b                 jmp8	0x2b <L7>
<L4>:
 ce 01                 cmpi.s8	r6, 0x1
 d3 0a                 brslt8	0xa <L5>
 c7 7f 80              ldi16	r7, 0x807f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 9b                    or	r6, r7
 06                    mov	r5, r6
 d4 1d                 jmp8	0x1d <L7>
<L5>:
 ce e9                 cmpi.s8	r6, -0x17
 d9 08                 brsge8	0x8 <L6>
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 82                    and	r4, r6
 87                    and	r5, r7
 d4 11                 jmp8	0x11 <L7>
<L6>:
 c7 7f 80              ldi16	r7, 0x807f
 8d                    and	r7, r5
 fa 57                 lsl16i	r6, 0x7
 c5 80 0c              ldi16	r5, 0xc80
 16                    add	r5, r6
 97                    or	r5, r7
 aa                    xor	r6, r6
 c7 00 33              ldi16	r7, 0x3300
 ff 02                 fmul
<L7>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
