
math_exp2.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 06 a8 0e           ldi16	r2, 0xea8
 f0 03 00              ldi8	r3, 0x0
 f0 05 00 01           ldi16	r1, 0x100
<L0>:
 f1 20                 mov	r4, r0
 c1 0f                 ldi8	r5, 0xf
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 64 88              ldp32	q2, [q2]
 e1 c2 0a              call16	exp2f
 f0 6b 82              st32	[r1], q2
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 e6                 brne8	-0x1a <L0>
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

<exp2f>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 09                    mov	r6, r5
 c7 ff 7f              ldi16	r7, 0x7fff
 8e                    and	r7, r6
 f0 06 80 7f           ldi16	r2, 0x7f80
 f5 2e                 cmp	r7, r2
 d8 79                 bruge8	0x79 <L2>
 c7 00 43              ldi16	r7, 0x4300
 3b                    cmp	r6, r7
 df 8f 00              brsge16	0x8f <L3>
 c7 16 c3              ldi16	r7, 0xc316
 3b                    cmp	r6, r7
 dd 94 00              bruge16	0x94 <L4>
 c6 00 80              ldi16	r6, 0x8000
 89                    and	r6, r5
 f2 30                 sub	r0, r0
 c7 00 3f              ldi16	r7, 0x3f00
 f0 05 00 bf           ldi16	r1, 0xbf00
 f5 28                 cmp	r6, r0
 fb 79                 cmov.ne	r7, r1
 aa                    xor	r6, r6
 f2 62                 mov32	q0, q2
 ff 00                 fadd
 ff 0e                 ftos16
 f4 40                 stsp16	[sp+0x0], r4
 ff 0c                 s16tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 68                 mov32	q2, q0
 ff 01                 fsub
 ff 15 05 66 01 1d 3c 23 fe 64 3d bc 01 76 3e 96 70 31 3f 00 00 80 3f  fpoly	5, 0.00958285294, 0.0559064262, 0.240240991, 0.693124175, 1.0
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 cd 83                 cmpi.s8	r5, -0x7d
 d3 07                 brslt8	0x7 <L0>
 fa 47                 lsl16i	r5, 0x7
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
 d4 1d                 jmp8	0x1d <L1>
<L0>:
 fa 47                 lsl16i	r5, 0x7
 c4 00 32              ldi16	r4, 0x3200
 11                    add	r4, r5
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f7 6b                 add32	q2, q3
 aa                    xor	r6, r6
 c7 80 0d              ldi16	r7, 0xd80
 ff 02                 fmul
 09                    mov	r6, r5
 f9 c8                 and	r6, r2
 c7 80 80              ldi16	r7, 0x8080
 1e                    add	r7, r6
 c6 ff 80              ldi16	r6, 0x80ff
 3b                    cmp	r6, r7
 d8 3f                 bruge8	0x3f <L6>
<L1>:
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret
<L2>:
 f6 2c                 tst16	r4
 d1 2f                 brne8	0x2f <L5>
 f5 2e                 cmp	r7, r2
 d1 2b                 brne8	0x2b <L5>
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 69 08              cmp32	q0, q2
 fd 34                 cmov.slt	r6, r4
 fd 3d                 cmov.slt	r7, r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d4 dd                 jmp8	-0x23 <L1>
<L3>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 01           stm16	[0x104], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 d4 d1                 jmp8	-0x2f <L1>
<L4>:
 c0 22                 ldi8	r4, 0x22
 f0 5c 04 01           stm16	[0x104], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 d4 c7                 jmp8	-0x39 <L1>
<L5>:
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 00                 fadd
 d4 c1                 jmp8	-0x3f <L1>
<L6>:
 c2 22                 ldi8	r6, 0x22
 f0 5e 04 01           stm16	[0x104], r6
 d4 b9                 jmp8	-0x47 <L1>

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
