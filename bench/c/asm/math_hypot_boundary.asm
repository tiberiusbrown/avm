
math_hypot_boundary.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 math_hypot_boundary.c
00000140 l     O .data	00000080 results
00000100 l     O .data	00000040 words
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 ef_hypot.c
00000493 l     F .text	00000100 avm_hypot_overflows
00000000 l    df *ABS*	00000000 ef_sqrt.c
00000808 l     O .rodata	00002000 sqrt_table
00000000 l    df *ABS*	00000000 wide_integer.c
00000000 l    df *ABS*	00000000 integer.c
00002808 l       .init_array	00000000 .hidden __init_array_end
00002808 l       .init_array	00000000 .hidden __init_array_start
00002808 l       .fini_array	00000000 .hidden __fini_array_start
00002808 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000003e avm_test_main
00000305 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000307 g     F .text	0000018c hypotf
00000593 g     F .text	000000c2 sqrtf
00000655 g     F .text	00000098 __avm_muldi3
000006ed g     F .text	00000078 __avm_lshrdi3
00000765 g     F .text	0000002c __avm_ashlsi3
00000791 g     F .text	0000002c __avm_lshrsi3
000007bd g     F .text	0000004b __avm_umulhisi3

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
 e1 e7 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 08 28              ldi16	r4, 0x2808
 c1 00                 ldi8	r5, 0x0
 c6 08 28              ldi16	r6, 0x2808
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 08 28           ldi16	r0, 0x2808
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 08 28           ldi16	r2, 0x2808
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
 c4 08 28              ldi16	r4, 0x2808
 c1 00                 ldi8	r5, 0x0
 c6 08 28              ldi16	r6, 0x2808
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 08 28           ldi16	r2, 0x2808
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 08 28           ldi16	r0, 0x2808
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
 f2 30                 sub	r0, r0
 f0 05 40 01           ldi16	r1, 0x140
 d7 01                 sys	debug_break
 f0 02 38              ldi8	r2, 0x38
 f0 07 00 01           ldi16	r3, 0x100
<L0>:
 f1 20                 mov	r4, r0
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 f9 88                 and	r4, r2
 08                    mov	r6, r4
 c5 04 01              ldi16	r5, 0x104
 19                    add	r6, r5
 f2 23                 add	r4, r3
 f0 6a 88              ld32	q2, [r4]
 f0 6a cc              ld32	q3, [r6]
 d5 17                 call8	hypotf
 f0 6b 82              st32	[r1], q2
 f0 09 04              addi.s8	r1, 0x4
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 dd                 brne8	-0x23 <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<hypotf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 67                 mov32	q1, q3
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 ff 65                 fabs	q1
 f2 30                 sub	r0, r0
 f0 05 80 de           ldi16	r1, 0xde80
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 67                 fabs	q3
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f7 6e                 add32	q3, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 3b           ldi16	r1, 0x3bff
 f0 69 0c              cmp32	q0, q3
 f2 6b                 mov32	q3, q1
 d2 27                 brult8	0x27 <L1>
 f7 6b                 add32	q2, q3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 3b           ldi16	r3, 0x3bff
 f0 69 48              cmp32	q1, q2
 d2 18                 brult8	0x18 <L1>
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 2f                 fmul	q3, q3
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 2a                 fmul	q2, q2
 ff 0b                 fadd	q2, q3
 e1 37 02              call16	sqrtf
<L0>:
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L1>:
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f0 69 40              cmp32	q1, q0
 d0 e4                 breq8	-0x1c <L0>
 f0 69 c0              cmp32	q3, q0
 d0 df                 breq8	-0x21 <L0>
 f0 69 04              cmp32	q0, q1
 d2 20                 brult8	0x20 <L2>
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 c8              cmp32	q3, q2
 d8 16                 bruge8	0x16 <L2>
 f0 69 4c              cmp32	q1, q3
 d8 17                 bruge8	0x17 <L3>
 f2 61                 mov32	q0, q1
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 02                    mov	r4, r6
 07                    mov	r5, r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d0 bc                 breq8	-0x44 <L0>
 d4 1b                 jmp8	0x1b <L4>
<L2>:
 ff 07                 fadd	q1, q3
 f2 69                 mov32	q2, q1
 d4 b4                 jmp8	-0x4c <L0>
<L3>:
 f2 63                 mov32	q0, q3
 f2 69                 mov32	q2, q1
 f2 67                 mov32	q1, q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d0 9f                 breq8	-0x61 <L0>
<L4>:
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f2 6a                 mov32	q3, q0
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f7 7d                 sub32	q3, q1
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff 06           ldi16	r3, 0x6ff
 f0 69 4c              cmp32	q1, q3
 dc 7b ff              brult16	-0x85 <L0>
 aa                    xor	r6, r6
 c7 80 5d              ldi16	r7, 0x5d80
 f0 69 0c              cmp32	q0, q3
 d2 51                 brult8	0x51 <L5>
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 23                 fmul	q0, q3
 ff 2b                 fmul	q2, q3
 ff 2a                 fmul	q2, q2
 ff 20                 fmul	q0, q0
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 e1 90 01              call16	sqrtf
 f2 62                 mov32	q0, q2
 c0 04                 ldi8	r4, 0x4
 c5 80 a2              ldi16	r5, 0xa280
 f7 68                 add32	q2, q0
 c2 08                 ldi8	r6, 0x8
 af                    xor	r7, r7
 f0 69 c8              cmp32	q3, q2
 d2 52                 brult8	0x52 <L6>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d5 75                 call8	avm_hypot_overflows
 f4 a4                 tst8	r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 db 35 ff              brne16	-0xcb <L0>
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 5d              ldi16	r5, 0x5d7f
 f0 69 80              cmp32	q2, q0
 d8 34                 bruge8	0x34 <L6>
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 e0 21 ff              jmp16	-223 <L0>
<L5>:
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f0 69 c0              cmp32	q3, q0
 d2 2c                 brult8	0x2c <L7>
 aa                    xor	r6, r6
 c7 80 7e              ldi16	r7, 0x7e80
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 23                 fmul	q0, q3
 ff 2b                 fmul	q2, q3
 ff 2a                 fmul	q2, q2
 ff 20                 fmul	q0, q0
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 e1 35 01              call16	sqrtf
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 ff 2b                 fmul	q2, q3
 e0 f6 fe              jmp16	-266 <L0>
<L6>:
 a0                    xor	r4, r4
 c5 80 61              ldi16	r5, 0x6180
 ff 22                 fmul	q0, q2
 f2 68                 mov32	q2, q0
 e0 eb fe              jmp16	-277 <L0>
<L7>:
 aa                    xor	r6, r6
 c7 80 61              ldi16	r7, 0x6180
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 ff 23                 fmul	q0, q3
 ff 2b                 fmul	q2, q3
 ff 2a                 fmul	q2, q2
 ff 20                 fmul	q0, q0
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 e1 09 01              call16	sqrtf
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 ff 2b                 fmul	q2, q3
 e0 c9 fe              jmp16	-311 <L0>

<avm_hypot_overflows>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f2 63                 mov32	q0, q3
 c2 7f                 ldi8	r6, 0x7f
 86                    and	r5, r6
 c2 80                 ldi8	r6, 0x80
 96                    or	r5, r6
 d6 f8                 adjsp	-0x8
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 e1 a5 01              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 03                    mov	r4, r7
 10                    add	r4, r4
 10                    add	r4, r4
 06                    mov	r5, r6
 fa 8e                 lsr16i	r5, 0xe
 94                    or	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 0c                    mov	r7, r4
 fa ae                 lsr16i	r7, 0xe
 9e                    or	r7, r6
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f1 21                 mov	r4, r1
 fa 76                 lsr16i	r4, 0x6
 c5 fe 01              ldi16	r5, 0x1fe
 84                    and	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f1 17                 mov	r2, r7
 f1 1c                 mov	r3, r4
 f4 12                 ldsp16	r6, [sp+0x4]
 02                    mov	r4, r6
 10                    add	r4, r4
 10                    add	r4, r4
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa ae                 lsr16i	r7, 0xe
 9c                    or	r7, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 c4 fc 01              ldi16	r4, 0x1fc
 21                    sub	r4, r5
 cc 40                 cmpi.s8	r4, 0x40
 d8 7a                 bruge8	0x7a <L0>
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f4 60                 stsp16	[sp+0x8], r4
 c0 7f                 ldi8	r4, 0x7f
 f9 8c                 and	r4, r3
 c1 80                 ldi8	r5, 0x80
 91                    or	r4, r5
 04                    mov	r5, r4
 f1 22                 mov	r4, r2
 d6 f8                 adjsp	-0x8
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 e1 2e 01              call16	__avm_muldi3
 d6 08                 adjsp	0x8
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 d6 fe                 adjsp	-0x2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 10                    add	r4, r4
 10                    add	r4, r4
 0e                    mov	r7, r6
 fa ae                 lsr16i	r7, 0xe
 9c                    or	r7, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 11                 ldsp16	r5, [sp+0x4]
 01                    mov	r4, r5
 04                    mov	r5, r4
 fa 8e                 lsr16i	r5, 0xe
 96                    or	r5, r6
 f1 05                 mov	r0, r5
 f1 0f                 mov	r1, r7
 08                    mov	r6, r4
 1a                    add	r6, r6
 1a                    add	r6, r6
 f4 08                 ldsp16	r4, [sp+0x2]
 04                    mov	r5, r4
 fa 8e                 lsr16i	r5, 0xe
 96                    or	r5, r6
 10                    add	r4, r4
 10                    add	r4, r4
 f2 6a                 mov32	q3, q0
 e1 96 01              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f0 30 0a              ldsp16	r0, [sp+0xa]
 f0 31 0c              ldsp16	r1, [sp+0xc]
 f7 6c                 add32	q3, q0
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 f7 62                 add32	q0, q2
 f0 69 08              cmp32	q0, q2
 f8 14                 cset.ult	r4
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 67                 add32	q1, q3
<L0>:
 a0                    xor	r4, r4
 c5 00 fc              ldi16	r5, 0xfc00
 f0 69 80              cmp32	q2, q0
 f8 15                 cset.ult	r5
 c6 ff ff              ldi16	r6, 0xffff
 c3 03                 ldi8	r7, 0x3
 f0 69 c4              cmp32	q3, q1
 f8 14                 cset.ult	r4
 f0 69 4c              cmp32	q1, q3
 fb 25                 cmov.eq	r4, r5
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

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
 c6 08 08              ldi16	r6, 0x808
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

<__avm_muldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 f0 30 2f              ldsp16	r0, [sp+0x2f]
 f0 31 31              ldsp16	r1, [sp+0x31]
 f0 32 33              ldsp16	r2, [sp+0x33]
 f0 33 35              ldsp16	r3, [sp+0x35]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 3a 20              stsp16	[sp+0x20], r2
 f0 3b 22              stsp16	[sp+0x22], r3
 f0 38 1c              stsp16	[sp+0x1c], r0
 f0 39 1e              stsp16	[sp+0x1e], r1
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 00 04              ldi8	r0, 0x4
 f0 11 08              leasp	r1, 0x8
<L0>:
 f4 58                 stsp16	[sp+0x6], r4
 10                    add	r4, r4
 f0 15 10              leasp	r5, 0x10
 14                    add	r5, r4
 f0 16 1c              leasp	r6, 0x1c
 61                    ld16	r4, [r5]
 a5                    xor	r5, r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 39 18              stsp16	[sp+0x18], r1
 f0 38 1a              stsp16	[sp+0x1a], r0
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
<L1>:
 f7 34                 ld16	r4, [r6+]
 f4 42                 stsp16	[sp+0x0], r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 06                    mov	r5, r6
 e1 0a 01              call16	__avm_umulhisi3
 ed d2 20              ld16	r6, [r1+0]
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 f0 6d 93              st16	[r1+], r4
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 de                 brne8	-0x22 <L1>
 f0 31 18              ldsp16	r1, [sp+0x18]
 f0 09 02              addi.s8	r1, 0x2
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f4 b0                 dec16	r0
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 d1 b1                 brne8	-0x4f <L0>
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_lshrdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 32 13              ldsp16	r2, [sp+0x13]
 f0 0e 40              cmpi.s8	r2, 0x40
 f2 62                 mov32	q0, q2
 d8 59                 bruge8	0x59 <L2>
 f0 0e 20              cmpi.s8	r2, 0x20
 d2 11                 brult8	0x11 <L0>
 f0 0a e0              addi.s8	r2, -0x20
 f1 02                 mov	r0, r2
 f2 39                 sub	r1, r1
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 d5 7c                 call8	__avm_lshrsi3
 f2 30                 sub	r0, r0
 d4 43                 jmp8	0x43 <L2>
<L0>:
 f6 2a                 tst16	r2
 d0 39                 breq8	0x39 <L1>
 f1 22                 mov	r4, r2
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f2 63                 mov32	q0, q3
 f1 2a                 mov	r6, r2
 f4 0b                 ldsp16	r7, [sp+0x2]
 d5 61                 call8	__avm_lshrsi3
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c0 20                 ldi8	r4, 0x20
 f2 52                 sub	r4, r2
 08                    mov	r6, r4
 af                    xor	r7, r7
 f2 68                 mov32	q2, q0
 d5 27                 call8	__avm_ashlsi3
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 51                 or	r2, r4
 f9 75                 or	r3, r5
 f2 68                 mov32	q2, q0
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d5 41                 call8	__avm_lshrsi3
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 d4 06                 jmp8	0x6 <L2>
<L1>:
 f2 63                 mov32	q0, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
<L2>:
 f2 6a                 mov32	q3, q0
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

<__avm_umulhisi3>:
 d6 f8                 adjsp	-0x8
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 f4 41                 stsp16	[sp+0x0], r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 fa 78                 lsr16i	r4, 0x8
 f4 11                 ldsp16	r5, [sp+0x4]
 0c                    mov	r7, r4
 f3 1d                 mulu8.w	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 0c                    mov	r7, r4
 fa a8                 lsr16i	r7, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 1d                    add	r7, r5
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 17                    add	r5, r7
 f4 51                 stsp16	[sp+0x4], r5
 18                    add	r6, r4
 fa 38                 lsl16i	r4, 0x8
 f4 1b                 ldsp16	r7, [sp+0x6]
 04                    mov	r5, r4
 17                    add	r5, r7
 0d                    mov	r7, r5
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 f4 11                 ldsp16	r5, [sp+0x4]
 11                    add	r4, r5
 fa 58                 lsl16i	r6, 0x8
 f4 19                 ldsp16	r5, [sp+0x6]
 19                    add	r6, r5
 3b                    cmp	r6, r7
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 08                 adjsp	0x8
 ef                    ret
