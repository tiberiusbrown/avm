
math_ceil.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_ceil.c
000003ec l     O .rodata	00000040 rounding_bits
00000100 l     O .data	00000004 result
00000104 l     O .data	00000080 rounding_inputs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 sf_ceil.c
0000042c l       .init_array	00000000 .hidden __init_array_end
0000042c l       .init_array	00000000 .hidden __init_array_start
0000042c l       .fini_array	00000000 .hidden __fini_array_start
0000042c l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000006a avm_test_main
00000331 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000333 g     F .text	000000b9 ceilf

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
 e1 13 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 2c 04              ldi16	r4, 0x42c
 c1 00                 ldi8	r5, 0x0
 c6 2c 04              ldi16	r6, 0x42c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 2c 04           ldi16	r0, 0x42c
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 2c 04           ldi16	r2, 0x42c
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
 c4 2c 04              ldi16	r4, 0x42c
 c1 00                 ldi8	r5, 0x0
 c6 2c 04              ldi16	r6, 0x42c
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 2c 04           ldi16	r2, 0x42c
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 2c 04           ldi16	r0, 0x42c
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
 af                    xor	r7, r7
 c5 08 01              ldi16	r5, 0x108
 c4 00 80              ldi16	r4, 0x8000
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 ec 03           ldi16	r2, 0x3ec
 f0 03 00              ldi8	r3, 0x0
<L0>:
 0b                    mov	r6, r7
 fa 9e                 lsr16i	r6, 0xe
 03                    mov	r4, r7
 10                    add	r4, r4
 10                    add	r4, r4
 f1 04                 mov	r0, r4
 f1 0e                 mov	r1, r6
 f7 61                 add32	q0, q1
 f0 64 00              ldp32	q0, [q0]
 01                    mov	r4, r5
 c8 fc                 addi.s8	r4, -0x4
 f0 6b 08              st32	[r4], q0
 f4 00                 ldsp16	r4, [sp+0x0]
 f9 31                 or	r1, r4
 f0 6b 0a              st32	[r5], q0
 c9 08                 addi.s8	r5, 0x8
 f4 af                 inc16	r7
 cf 10                 cmpi.s8	r7, 0x10
 d1 dc                 brne8	-0x24 <L0>
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 07 04 01           ldi16	r3, 0x104
<L1>:
 f1 22                 mov	r4, r2
 f2 23                 add	r4, r3
 f0 6a 88              ld32	q2, [r4]
 d5 1d                 call8	ceilf
 ff 02                 fadd	q0, q2
 f0 0a 04              addi.s8	r2, 0x4
 c0 80                 ldi8	r4, 0x80
 f5 14                 cmp	r2, r4
 d1 ec                 brne8	-0x14 <L1>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
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

<ceilf>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 09                    mov	r6, r5
 0e                    mov	r7, r6
 fa a7                 lsr16i	r7, 0x7
 f1 77                 zext8	r7
 cf 7f                 cmpi.s8	r7, 0x7f
 d8 1b                 bruge8	0x1b <L1>
 c7 00 80              ldi16	r7, 0x8000
 8e                    and	r7, r6
 f6 2f                 tst16	r7
 d1 0e                 brne8	0xe <L0>
 c5 80 3f              ldi16	r5, 0x3f80
 f6 2e                 tst16	r6
 db 88 00              brne16	0x88 <L5>
 f6 2c                 tst16	r4
 aa                    xor	r6, r6
 db 8f 00              brne16	0x8f <L7>
<L0>:
 aa                    xor	r6, r6
 07                    mov	r5, r7
 e0 8a 00              jmp16	138 <L7>
<L1>:
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 0b                    mov	r6, r7
 ca 81                 addi.s8	r6, -0x7f
 f4 5a                 stsp16	[sp+0x6], r6
 c2 85                 ldi8	r6, 0x85
 3b                    cmp	r6, r7
 d2 31                 brult8	0x31 <L2>
 c3 7f                 ldi8	r7, 0x7f
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 1e                 lsr16v	r7, r6
 f2 62                 mov32	q0, q2
 f4 43                 stsp16	[sp+0x0], r7
 03                    mov	r4, r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 82                    and	r4, r6
 f9 81                 or	r4, r0
 f6 2c                 tst16	r4
 f2 68                 mov32	q2, q0
 d0 54                 breq8	0x54 <L4>
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 af                 inc16	r7
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 aa                    xor	r6, r6
 f0 69 80              cmp32	q2, q0
 fd 3e                 cmov.slt	r7, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 1c                    add	r7, r4
 c5 80 ff              ldi16	r5, 0xff80
 f4 18                 ldsp16	r4, [sp+0x6]
 fa 24                 asr16v	r5, r4
 87                    and	r5, r7
 d4 4b                 jmp8	0x4b <L7>
<L2>:
 c2 95                 ldi8	r6, 0x95
 3b                    cmp	r6, r7
 d2 27                 brult8	0x27 <L3>
 c6 7a ff              ldi16	r6, 0xff7a
 1e                    add	r7, r6
 c6 ff ff              ldi16	r6, 0xffff
 fa 1b                 lsr16v	r6, r7
 f4 5a                 stsp16	[sp+0x6], r6
 88                    and	r6, r4
 f6 2e                 tst16	r6
 d0 24                 breq8	0x24 <L4>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d3 25                 brslt8	0x25 <L6>
 f4 19                 ldsp16	r5, [sp+0x6]
 94                    or	r5, r4
 f4 ad                 inc16	r5
 f6 2d                 tst16	r5
 01                    mov	r4, r5
 f8 05                 cset.eq	r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 16                    add	r5, r6
 08                    mov	r6, r4
 d4 1f                 jmp8	0x1f <L7>
<L3>:
 f2 62                 mov32	q0, q2
 ff 00                 fadd	q0, q0
 c2 80                 ldi8	r6, 0x80
 f4 1b                 ldsp16	r7, [sp+0x6]
 3e                    cmp	r7, r6
 fb 20                 cmov.eq	r4, r0
 fb 29                 cmov.eq	r5, r1
<L4>:
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L5>:
 aa                    xor	r6, r6
 d4 0a                 jmp8	0xa <L7>
<L6>:
 f4 1a                 ldsp16	r6, [sp+0x6]
 c5 ff ff              ldi16	r5, 0xffff
 a9                    xor	r6, r5
 88                    and	r6, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 04                    mov	r5, r4
<L7>:
 02                    mov	r4, r6
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
