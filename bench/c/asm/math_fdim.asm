
math_fdim.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f2 30                 sub	r0, r0
 f0 05 d0 3f           ldi16	r1, 0x3fd0
 f0 07 00 01           ldi16	r3, 0x100
<L0>:
 f1 22                 mov	r4, r2
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 c6 8f 0e              ldi16	r6, 0xe8f
 c3 00                 ldi8	r7, 0x0
 f7 6b                 add32	q2, q3
 f0 64 88              ldp32	q2, [q2]
 f2 6a                 mov32	q3, q0
 e1 c5 0a              call16	fdimf
 f0 6b 86              st32	[r3], q2
 f4 aa                 inc16	r2
 f0 0e 20              cmpi.s8	r2, 0x20
 d1 df                 brne8	-0x21 <L0>
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<fdimf>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 63                 mov32	q0, q3
 f0 06 80 7f           ldi16	r2, 0x7f80
 f1 29                 mov	r6, r1
 f9 c8                 and	r6, r2
 f5 2a                 cmp	r6, r2
 f8 06                 cset.eq	r6
 0d                    mov	r7, r5
 f9 e8                 and	r7, r2
 f5 2e                 cmp	r7, r2
 d0 25                 breq8	0x25 <L1>
 c3 01                 ldi8	r7, 0x1
 8b                    and	r6, r7
 f4 a6                 tst8	r6
 d1 1e                 brne8	0x1e <L1>
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 d3 10                 brslt8	0x10 <L0>
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 c6 ff 7f              ldi16	r6, 0x7fff
 89                    and	r6, r5
 f5 2a                 cmp	r6, r2
 d0 11                 breq8	0x11 <L2>
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
<L0>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
<L1>:
 f2 6a                 mov32	q3, q0
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 d4 0a                 jmp8	avm_fdim_special
<L2>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_fdim_special>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 7f              ldi16	r7, 0x7fff
 f2 66                 mov32	q1, q2
 f9 58                 and	r2, r6
 f9 7c                 and	r3, r7
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 04              cmp32	q0, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 d2 29                 brult8	0x29 <L0>
 f9 c8                 and	r6, r2
 f9 ec                 and	r7, r3
 f0 00 01              ldi8	r0, 0x1
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 69 c0              cmp32	q3, q0
 d8 19                 bruge8	0x19 <L0>
 f2 6b                 mov32	q3, q1
 ff 14                 fcmp
 f2 61                 mov32	q0, q1
 f1 16                 mov	r2, r6
 f2 6a                 mov32	q3, q0
 ff 01                 fsub
 08                    mov	r6, r4
 0d                    mov	r7, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 0e 01              cmpi.s8	r2, 0x1
 fb 26                 cmov.eq	r4, r6
 fb 2f                 cmov.eq	r5, r7
 d4 04                 jmp8	0x4 <L1>
<L0>:
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
<L1>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_umulhisi3>:
 d6 fa                 adjsp	-0x6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f4 52                 stsp16	[sp+0x4], r6
 f1 75                 zext8	r5
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 1b                 mulu8.w	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 fa 78                 lsr16i	r4, 0x8
 f4 13                 ldsp16	r7, [sp+0x4]
 08                    mov	r6, r4
 f3 1b                 mulu8.w	r6, r7
 f3 11                 mulu8.w	r4, r5
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 16                    add	r5, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 34                    cmp	r5, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 fa 58                 lsl16i	r6, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
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
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 17                    add	r5, r7
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
 f4 43                 stsp16	[sp+0x0], r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 3d                 mulsu8.w	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 2d                 muls8.w	r7, r5
 f3 32                 mulsu8.w	r4, r6
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa d8                 asr16i	r6, 0x8
 19                    add	r6, r5
 f4 21                 ldsp16	r5, [sp+0x8]
 19                    add	r6, r5
 fa 38                 lsl16i	r4, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 1c                    add	r7, r4
 3c                    cmp	r7, r4
 f8 14                 cset.ult	r4
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 48                 lsl16i	r5, 0x8
 1d                    add	r7, r5
 3d                    cmp	r7, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 03                    mov	r4, r7
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
