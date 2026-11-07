
math_sqrt_random.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
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
 e1 85 0b              call16	__avm_mulsi3
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
 f2 4b                 sub	r3, r3
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 06 00 01           ldi16	r2, 0x100
<L1>:
 f1 23                 mov	r4, r3
 f2 22                 add	r4, r2
 f0 6a 88              ld32	q2, [r4]
 e1 df 0a              call16	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f0 0b 04              addi.s8	r3, 0x4
 c4 fc 03              ldi16	r4, 0x3fc
 f5 1c                 cmp	r3, r4
 d1 e4                 brne8	-0x1c <L1>
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 e1 c6 0a              call16	sqrtf
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 00                 fadd
 f0 6b 84              st32	[r2], q2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
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

<sqrtf>:
 f6 2d                 tst16	r5
 d3 03                 brslt8	0x3 <L0>
 ff 16                 fsqrt
 ef                    ret
<L0>:
 d4 00                 jmp8	avm_sqrt_special

<avm_sqrt_special>:
 09                    mov	r6, r5
 c7 7f ff              ldi16	r7, 0xff7f
 3d                    cmp	r7, r5
 d8 0b                 bruge8	0xb <L1>
 ce 80                 cmpi.s8	r6, -0x80
 d1 04                 brne8	0x4 <L0>
 f6 2c                 tst16	r4
 d0 0d                 breq8	0xd <L2>
<L0>:
 ff 16                 fsqrt
 ef                    ret
<L1>:
 c7 00 80              ldi16	r7, 0x8000
 3b                    cmp	r6, r7
 d1 04                 brne8	0x4 <L2>
 f6 2c                 tst16	r4
 d0 f3                 breq8	-0xd <L0>
<L2>:
 c2 21                 ldi8	r6, 0x21
 f0 5e fc 04           stm16	[0x4fc], r6
 ff 16                 fsqrt
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
