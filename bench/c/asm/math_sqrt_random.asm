
math_sqrt_random.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000051e l     F .text	00000044 avm_run_constructors
00000562 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_sqrt_random.c
00000100 l     O .data	00000400 inputs
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000777 l     O .rodata	00002000 sqrt_table
00000000 l    df *ABS*	00000000 integer.c
00002777 l       .init_array	00000000 .hidden __init_array_end
00002777 l       .init_array	00000000 .hidden __init_array_start
00002777 l       .fini_array	00000000 .hidden __fini_array_start
00002777 l       .fini_array	00000000 .hidden __fini_array_end
00000500 g     F .text	0000001e _start
000005c7 g     F .text	00000080 avm_test_main
00000647 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000070b g     F .text	0000006c __avm_mulsi3
00000649 g     F .text	000000c2 sqrtf

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
 e1 29 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 77 27              ldi16	r4, 0x2777
 c1 00                 ldi8	r5, 0x0
 c6 77 27              ldi16	r6, 0x2777
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 77 27           ldi16	r0, 0x2777
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 77 27           ldi16	r2, 0x2777
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
 e1 89 fa              call16	-1399 <__avm_run_local_dtors>
<L0>:
 c4 77 27              ldi16	r4, 0x2777
 c1 00                 ldi8	r5, 0x0
 c6 77 27              ldi16	r6, 0x2777
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 77 27           ldi16	r2, 0x2777
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 77 27           ldi16	r0, 0x2777
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
 e1 40 fa              call16	-1472 <__avm_run_local_dtors>
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
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 f0 06 00 01           ldi16	r2, 0x100
 f0 04 0d 66           ldi16	r0, 0x660d
 f0 01 19              ldi8	r1, 0x19
 f0 03 7f              ldi8	r3, 0x7f
<L0>:
 f2 6a                 mov32	q3, q0
 e1 22 01              call16	__avm_mulsi3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 c4 5f f3              ldi16	r4, 0xf35f
 c5 6e 3c              ldi16	r5, 0x3c6e
 f7 6b                 add32	q2, q3
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 f4 03                 ldsp16	r7, [sp+0x0]
 fa 67                 lsl16i	r7, 0x7
 9e                    or	r7, r6
 08                    mov	r6, r4
 f0 6b c4              st32	[r2], q3
 f0 0a 04              addi.s8	r2, 0x4
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 af                 inc16	r7
 c2 ff                 ldi8	r6, 0xff
 f4 43                 stsp16	[sp+0x0], r7
 3e                    cmp	r7, r6
 d1 d7                 brne8	-0x29 <L0>
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 c6 fc 04              ldi16	r6, 0x4fc
 f0 6b 8c              st32	[r6], q2
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 07 00 01           ldi16	r3, 0x100
<L1>:
 f1 22                 mov	r4, r2
 f2 23                 add	r4, r3
 f0 6a 88              ld32	q2, [r4]
 d5 1b                 call8	sqrtf
 ff 02                 fadd	q0, q2
 f0 0a 04              addi.s8	r2, 0x4
 c4 00 04              ldi16	r4, 0x400
 f5 14                 cmp	r2, r4
 d1 eb                 brne8	-0x15 <L1>
 f0 6b 06              st32	[r3], q0
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

<sqrtf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 88                    and	r6, r4
 8d                    and	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 c0              cmp32	q3, q0
 da a3 00              breq16	0xa3 <L4>
 f0 69 80              cmp32	q2, q0
 d3 10                 brslt8	0x10 <L0>
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d2 0c                 brult8	0xc <L1>
 ff 0a                 fadd	q2, q2
 e0 8e 00              jmp16	142 <L4>
<L0>:
 a0                    xor	r4, r4
 c5 c0 7f              ldi16	r5, 0x7fc0
 e0 87 00              jmp16	135 <L4>
<L1>:
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 69 0c              cmp32	q0, q3
 d2 0b                 brult8	0xb <L2>
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 ff 2b                 fmul	q2, q3
 c6 e8 ff              ldi16	r6, 0xffe8
 d4 01                 jmp8	0x1 <L3>
<L2>:
 aa                    xor	r6, r6
<L3>:
 f4 5a                 stsp16	[sp+0x6], r6
 f0 00 7f              ldi8	r0, 0x7f
 f9 14                 and	r0, r5
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 97                 lsr16i	r6, 0x7
 ca 81                 addi.s8	r6, -0x7f
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 c1 01                 ldi8	r5, 0x1
 86                    and	r5, r6
 fa 47                 lsl16i	r5, 0x7
 f9 a1                 or	r5, r0
 c2 08                 ldi8	r6, 0x8
 f4 42                 stsp16	[sp+0x0], r6
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 fa 7b                 lsr16i	r4, 0xb
 f1 2b                 mov	r6, r3
 fa 55                 lsl16i	r6, 0x5
 98                    or	r6, r4
 f0 04 f8 1f           ldi16	r0, 0x1ff8
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 c6 77 07              ldi16	r6, 0x777
 c3 00                 ldi8	r7, 0x0
 f7 6c                 add32	q3, q0
 f0 14 08              leasp	r4, 0x8
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 10                 sys	memcpy_p
 f2 30                 sub	r0, r0
 f0 05 80 3f           ldi16	r1, 0x3f80
 f7 61                 add32	q0, q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 08                 ldsp16	r4, [sp+0x2]
 12                    add	r4, r6
 c6 00 c0              ldi16	r6, 0xc000
 c7 ff 7f              ldi16	r7, 0x7fff
 f9 c0                 and	r6, r0
 f9 e4                 and	r7, r1
 ff 13                 fsub	q0, q3
 08                    mov	r6, r4
 fa 56                 lsl16i	r6, 0x6
 c4 80 ff              ldi16	r4, 0xff80
 82                    and	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 ff 2c                 fmul	q3, q0
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 07                 fadd	q1, q3
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 69                 add32	q2, q1
<L4>:
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_mulsi3>:
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 05                 mov	r0, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 f4 61                 stsp16	[sp+0x8], r5
 f1 07                 mov	r0, r7
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 f2 24                 add	r5, r0
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 fe 2e                 mul16	r5, r6
 f4 61                 stsp16	[sp+0x8], r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 51                 stsp16	[sp+0x4], r5
 f1 76                 zext8	r6
 04                    mov	r5, r4
 f1 75                 zext8	r5
 0d                    mov	r7, r5
 f3 1e                 mulu8.w	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 43                 stsp16	[sp+0x0], r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 0b                    mov	r6, r7
 16                    add	r5, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 0b                    mov	r6, r7
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 f4 62                 stsp16	[sp+0x8], r6
 1c                    add	r7, r4
 fa 38                 lsl16i	r4, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 19                    add	r6, r5
 06                    mov	r5, r6
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 12                    add	r4, r6
 fa 68                 lsl16i	r7, 0x8
 f4 1a                 ldsp16	r6, [sp+0x6]
 1e                    add	r7, r6
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
