
math_hypot_boundary.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 f0 05 40 01           ldi16	r1, 0x140
 d7 01                 sys	debug_break
 f0 07 04 01           ldi16	r3, 0x104
 f0 06 00 01           ldi16	r2, 0x100
<L0>:
 f1 20                 mov	r4, r0
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 c1 38                 ldi8	r5, 0x38
 81                    and	r4, r5
 08                    mov	r6, r4
 f2 2b                 add	r6, r3
 f2 22                 add	r4, r2
 f0 6a 88              ld32	q2, [r4]
 f0 6a cc              ld32	q3, [r6]
 e1 c5 0a              call16	hypotf
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

<memset>:
 0c                    mov	r7, r4
 d7 11                 sys	memset
 03                    mov	r4, r7
 ef                    ret

<hypotf>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	-0xc
 f2 66                 mov32	q1, q2
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 ff 0b                 fabs	q3
 a0                    xor	r4, r4
 c5 80 de              ldi16	r5, 0xde80
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 ff 09                 fabs	q1
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f7 66                 add32	q1, q2
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 3b           ldi16	r1, 0x3bff
 f0 69 04              cmp32	q0, q1
 f2 67                 mov32	q1, q3
 d2 2c                 brult8	0x2c <L1>
 f7 69                 add32	q2, q1
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff 3b              ldi16	r7, 0x3bff
 f0 69 c8              cmp32	q3, q2
 d2 1f                 brult8	0x1f <L1>
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 ff 16                 fsqrt
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
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f0 69 08              cmp32	q0, q2
 d0 ea                 breq8	-0x16 <L0>
 f0 69 48              cmp32	q1, q2
 d0 e5                 breq8	-0x1b <L0>
 f0 69 80              cmp32	q2, q0
 d2 26                 brult8	0x26 <L2>
 c0 01                 ldi8	r4, 0x1
 c5 80 7f              ldi16	r5, 0x7f80
 f0 69 48              cmp32	q1, q2
 d8 1c                 bruge8	0x1c <L2>
 f0 69 04              cmp32	q0, q1
 d8 1f                 bruge8	0x1f <L3>
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 bc                 breq8	-0x44 <L0>
 d4 1f                 jmp8	0x1f <L4>
<L2>:
 f2 68                 mov32	q2, q0
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 d4 b2                 jmp8	-0x4e <L0>
<L3>:
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f2 68                 mov32	q2, q0
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f2 61                 mov32	q0, q1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 d0 9b                 breq8	-0x65 <L0>
<L4>:
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 f2 6b                 mov32	q3, q1
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f7 7c                 sub32	q3, q0
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff 06           ldi16	r1, 0x6ff
 f0 69 0c              cmp32	q0, q3
 dc 7d ff              brult16	-0x83 <L0>
 aa                    xor	r6, r6
 c7 80 5d              ldi16	r7, 0x5d80
 f0 69 4c              cmp32	q1, q3
 d2 5d                 brult8	0x5d <L5>
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 f2 66                 mov32	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 f2 6a                 mov32	q3, q0
 ff 02                 fmul
 f2 6b                 mov32	q3, q1
 ff 00                 fadd
 ff 16                 fsqrt
 c2 04                 ldi8	r6, 0x4
 c7 80 a2              ldi16	r7, 0xa280
 f7 6e                 add32	q3, q2
 f0 00 08              ldi8	r0, 0x8
 f2 39                 sub	r1, r1
 f0 69 0c              cmp32	q0, q3
 d2 5e                 brult8	0x5e <L6>
 f2 62                 mov32	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 e1 a7 00              call16	avm_hypot_overflows
 f4 a4                 tst8	r4
 db 95 00              brne16	0x95 <L8>
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 5d              ldi16	r7, 0x5d7f
 f2 68                 mov32	q2, q0
 f0 69 c8              cmp32	q3, q2
 d8 3f                 bruge8	0x3f <L6>
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 e0 17 ff              jmp16	-233 <L0>
<L5>:
 f2 62                 mov32	q0, q2
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f0 69 84              cmp32	q2, q1
 d2 48                 brult8	0x48 <L7>
 aa                    xor	r6, r6
 c7 80 7e              ldi16	r7, 0x7e80
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 ff 16                 fsqrt
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 ff 02                 fmul
 e0 e1 fe              jmp16	-287 <L0>
<L6>:
 aa                    xor	r6, r6
 c7 80 61              ldi16	r7, 0x6180
 ff 02                 fmul
 c7 80 7f              ldi16	r7, 0x7f80
 8d                    and	r7, r5
 c6 80 80              ldi16	r6, 0x8080
 1b                    add	r6, r7
 c7 ff 80              ldi16	r7, 0x80ff
 3e                    cmp	r7, r6
 dc cc fe              brult16	-0x134 <L0>
 c2 22                 ldi8	r6, 0x22
 f0 5e c0 01           stm16	[0x1c0], r6
 e0 c3 fe              jmp16	-317 <L0>
<L7>:
 aa                    xor	r6, r6
 c7 80 61              ldi16	r7, 0x6180
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 08                    mov	r6, r4
 0d                    mov	r7, r5
 ff 02                 fmul
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f2 6b                 mov32	q3, q1
 ff 02                 fmul
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 ff 16                 fsqrt
 aa                    xor	r6, r6
 c7 80 1d              ldi16	r7, 0x1d80
 ff 02                 fmul
 e0 98 fe              jmp16	-360 <L0>
<L8>:
 c0 22                 ldi8	r4, 0x22
 f0 5c c0 01           stm16	[0x1c0], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 e0 8b fe              jmp16	-373 <L0>

<avm_hypot_overflows>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 da                 adjsp	-0x26
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 7a                 stsp16	[sp+0xe], r6
 03                    mov	r4, r7
 f0 3f 14              stsp16	[sp+0x14], r7
 fa 77                 lsr16i	r4, 0x7
 c3 fe                 ldi8	r7, 0xfe
 2c                    sub	r7, r4
 cf 0c                 cmpi.s8	r7, 0xc
 dd 4c 02              bruge16	0x24c <L2>
 f4 38                 ldsp16	r4, [sp+0xe]
 08                    mov	r6, r4
 fa 98                 lsr16i	r6, 0x8
 04                    mov	r5, r4
 f3 16                 mulu8.w	r5, r6
 f0 3e 12              stsp16	[sp+0x12], r6
 01                    mov	r4, r5
 fa 77                 lsr16i	r4, 0x7
 f0 05 fe 01           ldi16	r1, 0x1fe
 f9 84                 and	r4, r1
 f3 1a                 mulu8.w	r6, r6
 f4 4a                 stsp16	[sp+0x2], r6
 f0 00 fd              ldi8	r0, 0xfd
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f9 c0                 and	r6, r0
 18                    add	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 15                    add	r5, r5
 f9 a4                 and	r5, r1
 f4 3a                 ldsp16	r6, [sp+0xe]
 02                    mov	r4, r6
 f3 10                 mulu8.w	r4, r4
 f0 3c 24              stsp16	[sp+0x24], r4
 fa 78                 lsr16i	r4, 0x8
 11                    add	r4, r5
 f0 3c 18              stsp16	[sp+0x18], r4
 fa 78                 lsr16i	r4, 0x8
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 f0 02 7f              ldi8	r2, 0x7f
 f0 36 14              ldsp16	r6, [sp+0x14]
 f9 c8                 and	r6, r2
 c0 80                 ldi8	r4, 0x80
 f1 1c                 mov	r3, r4
 98                    or	r6, r4
 0e                    mov	r7, r6
 f4 38                 ldsp16	r4, [sp+0xe]
 f3 1c                 mulu8.w	r7, r4
 f4 43                 stsp16	[sp+0x0], r7
 03                    mov	r4, r7
 fa 77                 lsr16i	r4, 0x7
 f9 84                 and	r4, r1
 f4 09                 ldsp16	r5, [sp+0x2]
 fa 88                 lsr16i	r5, 0x8
 14                    add	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 f3 14                 mulu8.w	r5, r4
 0d                    mov	r7, r5
 fa a7                 lsr16i	r7, 0x7
 f9 e4                 and	r7, r1
 02                    mov	r4, r6
 f6 30                 mul8	r4, r4
 13                    add	r4, r7
 f4 78                 stsp16	[sp+0xe], r4
 15                    add	r5, r5
 f9 a4                 and	r5, r1
 f4 08                 ldsp16	r4, [sp+0x2]
 14                    add	r5, r4
 0d                    mov	r7, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 15                    add	r5, r5
 f9 a4                 and	r5, r1
 f4 30                 ldsp16	r4, [sp+0xc]
 14                    add	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 21                 ldsp16	r5, [sp+0x8]
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f9 88                 and	r4, r2
 f9 8d                 or	r4, r3
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 f0 3c 12              stsp16	[sp+0x12], r4
 fa 78                 lsr16i	r4, 0x8
 f4 39                 ldsp16	r5, [sp+0xe]
 11                    add	r4, r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 0c                    mov	r7, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 1c                 mulu8.w	r7, r4
 f4 73                 stsp16	[sp+0xc], r7
 fa a7                 lsr16i	r7, 0x7
 f9 e4                 and	r7, r1
 fa 78                 lsr16i	r4, 0x8
 f4 68                 stsp16	[sp+0xa], r4
 f3 10                 mulu8.w	r4, r4
 f0 3c 14              stsp16	[sp+0x14], r4
 fa 78                 lsr16i	r4, 0x8
 13                    add	r4, r7
 0c                    mov	r7, r4
 f3 1a                 mulu8.w	r6, r6
 c4 00 ff              ldi16	r4, 0xff00
 f1 14                 mov	r2, r4
 88                    and	r6, r4
 c4 00 07              ldi16	r4, 0x700
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 84                    and	r5, r4
 16                    add	r5, r6
 f4 79                 stsp16	[sp+0xe], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 04                    mov	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 14                 mulu8.w	r5, r4
 01                    mov	r4, r5
 10                    add	r4, r4
 f9 84                 and	r4, r1
 13                    add	r4, r7
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 f9 80                 and	r4, r0
 f0 3c 14              stsp16	[sp+0x14], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 28                 ldsp16	r4, [sp+0xa]
 f3 18                 mulu8.w	r6, r4
 f0 3e 20              stsp16	[sp+0x20], r6
 02                    mov	r4, r6
 fa 77                 lsr16i	r4, 0x7
 f9 84                 and	r4, r1
 f0 36 14              ldsp16	r6, [sp+0x14]
 12                    add	r4, r6
 f0 3c 22              stsp16	[sp+0x22], r4
 fa 87                 lsr16i	r5, 0x7
 f9 a4                 and	r5, r1
 f4 0a                 ldsp16	r6, [sp+0x2]
 02                    mov	r4, r6
 f6 30                 mul8	r4, r4
 11                    add	r4, r5
 f4 68                 stsp16	[sp+0xa], r4
 f3 1a                 mulu8.w	r6, r6
 02                    mov	r4, r6
 f9 88                 and	r4, r2
 f4 48                 stsp16	[sp+0x2], r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 10                    add	r4, r4
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f3 10                 mulu8.w	r4, r4
 04                    mov	r5, r4
 f9 a0                 and	r5, r0
 f0 3d 14              stsp16	[sp+0x14], r5
 fa 78                 lsr16i	r4, 0x8
 12                    add	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f0 34 22              ldsp16	r4, [sp+0x22]
 14                    add	r5, r4
 f4 32                 ldsp16	r6, [sp+0xc]
 1a                    add	r6, r6
 f9 c4                 and	r6, r1
 19                    add	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 fa 98                 lsr16i	r6, 0x8
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 18                    add	r6, r4
 06                    mov	r5, r6
 fa 88                 lsr16i	r5, 0x8
 f4 28                 ldsp16	r4, [sp+0xa]
 14                    add	r5, r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 c7 00 07              ldi16	r7, 0x700
 8d                    and	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 1c                    add	r7, r4
 f4 4b                 stsp16	[sp+0x2], r7
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 f1 77                 zext8	r7
 f4 39                 ldsp16	r5, [sp+0xe]
 9d                    or	r7, r5
 1f                    add	r7, r7
 1f                    add	r7, r7
 03                    mov	r4, r7
 f0 35 12              ldsp16	r5, [sp+0x12]
 fa 48                 lsl16i	r5, 0x8
 f4 03                 ldsp16	r7, [sp+0x0]
 f1 77                 zext8	r7
 9d                    or	r7, r5
 fa 8e                 lsr16i	r5, 0xe
 94                    or	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 34 18              ldsp16	r4, [sp+0x18]
 fa 38                 lsl16i	r4, 0x8
 1f                    add	r7, r7
 1f                    add	r7, r7
 f0 3c 18              stsp16	[sp+0x18], r4
 fa 7e                 lsr16i	r4, 0xe
 93                    or	r4, r7
 f4 68                 stsp16	[sp+0xa], r4
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f1 75                 zext8	r5
 f4 08                 ldsp16	r4, [sp+0x2]
 94                    or	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 01                    mov	r4, r5
 fa 58                 lsl16i	r6, 0x8
 f4 31                 ldsp16	r5, [sp+0xc]
 f1 75                 zext8	r5
 96                    or	r5, r6
 fa 9e                 lsr16i	r6, 0xe
 98                    or	r6, r4
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 58                 lsl16i	r6, 0x8
 15                    add	r5, r5
 15                    add	r5, r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 92                    or	r4, r6
 fa 9e                 lsr16i	r6, 0xe
 99                    or	r6, r5
 f4 5a                 stsp16	[sp+0x6], r6
 10                    add	r4, r4
 10                    add	r4, r4
 f0 3c 14              stsp16	[sp+0x14], r4
 f4 3a                 ldsp16	r6, [sp+0xe]
 fa 9e                 lsr16i	r6, 0xe
 f4 08                 ldsp16	r4, [sp+0x2]
 fa 7e                 lsr16i	r4, 0xe
 f4 48                 stsp16	[sp+0x2], r4
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 cf 08                 cmpi.s8	r7, 0x8
 1f                    add	r7, r7
 d2 0c                 brult8	0xc <L0>
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 cb f0                 addi.s8	r7, -0x10
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 3c 18              stsp16	[sp+0x18], r4
 d4 18                 jmp8	0x18 <L1>
<L0>:
 f0 34 24              ldsp16	r4, [sp+0x24]
 f9 80                 and	r4, r0
 f0 35 18              ldsp16	r5, [sp+0x18]
 94                    or	r5, r4
 15                    add	r5, r5
 15                    add	r5, r5
 f0 3d 18              stsp16	[sp+0x18], r5
 f4 42                 stsp16	[sp+0x0], r6
 f0 36 12              ldsp16	r6, [sp+0x12]
 f4 28                 ldsp16	r4, [sp+0xa]
 f0 3c 12              stsp16	[sp+0x12], r4
<L1>:
 c5 ff ff              ldi16	r5, 0xffff
 f0 3f 1e              stsp16	[sp+0x1e], r7
 a7                    xor	r5, r7
 c0 0f                 ldi8	r4, 0xf
 81                    and	r4, r5
 f4 70                 stsp16	[sp+0xc], r4
 06                    mov	r5, r6
 f4 79                 stsp16	[sp+0xe], r5
 15                    add	r5, r5
 fa 04                 shl16v	r5, r4
 c2 0e                 ldi8	r6, 0xe
 8b                    and	r6, r7
 f4 6a                 stsp16	[sp+0xa], r6
 f0 34 12              ldsp16	r4, [sp+0x12]
 0c                    mov	r7, r4
 fa 1e                 lsr16v	r7, r6
 9d                    or	r7, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 fa 16                 lsr16v	r5, r6
 f4 79                 stsp16	[sp+0xe], r5
 f4 01                 ldsp16	r5, [sp+0x0]
 15                    add	r5, r5
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 06                 shl16v	r5, r6
 f4 3a                 ldsp16	r6, [sp+0xe]
 96                    or	r5, r6
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f4 1a                 ldsp16	r6, [sp+0x6]
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f0 36 18              ldsp16	r6, [sp+0x18]
 f4 2b                 ldsp16	r7, [sp+0xa]
 fa 1b                 lsr16v	r6, r7
 10                    add	r4, r4
 f4 33                 ldsp16	r7, [sp+0xc]
 fa 03                 shl16v	r4, r7
 92                    or	r4, r6
 f0 36 14              ldsp16	r6, [sp+0x14]
 18                    add	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 38                    cmp	r6, r4
 f8 14                 cset.ult	r4
 08                    mov	r6, r4
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f1 15                 mov	r2, r5
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 fa 14                 lsr16v	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 14                    add	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f7 68                 add32	q2, q0
 f1 05                 mov	r0, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 f2 05                 add	r0, r5
 f0 0c 03              cmpi.s8	r0, 0x3
 d1 07                 brne8	0x7 <L3>
 cc ff                 cmpi.s8	r4, -0x1
 d0 0f                 breq8	0xf <L5>
<L2>:
 a0                    xor	r4, r4
 d4 05                 jmp8	0x5 <L4>
<L3>:
 f0 0c 04              cmpi.s8	r0, 0x4
 f8 1c                 cset.uge	r4
<L4>:
 d6 26                 adjsp	0x26
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
<L5>:
 c4 00 fc              ldi16	r4, 0xfc00
 38                    cmp	r6, r4
 d1 09                 brne8	0x9 <L6>
 f0 34 14              ldsp16	r4, [sp+0x14]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 d4 ea                 jmp8	-0x16 <L4>
<L6>:
 32                    cmp	r4, r6
 f8 14                 cset.ult	r4
 d4 e5                 jmp8	-0x1b <L4>

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
