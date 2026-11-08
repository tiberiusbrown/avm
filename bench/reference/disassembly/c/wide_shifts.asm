
wide_shifts.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 c4 67 45              ldi16	r4, 0x4567
 c5 23 81              ldi16	r5, 0x8123
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c4 ef cd              ldi16	r4, 0xcdef
 c5 ab 89              ldi16	r5, 0x89ab
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 ff ff              ldi16	r5, 0xffff
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 00 80              ldi16	r5, 0x8000
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 f0 4c 00 01           stm8	[0x100], r4
 c0 0f                 ldi8	r4, 0xf
 f0 4c 01 01           stm8	[0x101], r4
 c0 20                 ldi8	r4, 0x20
 f0 4c 02 01           stm8	[0x102], r4
 c0 3f                 ldi8	r4, 0x3f
 f0 4c 03 01           stm8	[0x103], r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f2 61                 mov32	q0, q1
 08                    mov	r6, r4
<L0>:
 f0 3e 1a              stsp16	[sp+0x1a], r6
 c5 0c 01              ldi16	r5, 0x10c
 a0                    xor	r4, r4
<L1>:
 f4 70                 stsp16	[sp+0xc], r4
 09                    mov	r6, r5
 f4 7a                 stsp16	[sp+0xe], r6
 0c                    mov	r7, r4
 c4 00 01              ldi16	r4, 0x100
 1c                    add	r7, r4
 c9 04                 addi.s8	r5, 0x4
 f0 6a 8a              ld32	q2, [r5]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 6a 8c              ld32	q2, [r6]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 43                    ld8u	r4, [r7]
 f0 3c 10              stsp16	[sp+0x10], r4
 d6 fe                 adjsp	-0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e1 05 0c              call16	__avm_ashldi3
 d6 02                 adjsp	0x2
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 d6 fe                 adjsp	-0x2
 f0 34 12              ldsp16	r4, [sp+0x12]
 f4 40                 stsp16	[sp+0x0], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e1 cb 0c              call16	__avm_lshrdi3
 d6 02                 adjsp	0x2
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 d6 fe                 adjsp	-0x2
 f2 6a                 mov32	q3, q0
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 38 00              stsp16	[sp+0x0], r0
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 31 16              ldsp16	r1, [sp+0x16]
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f0 30 18              ldsp16	r0, [sp+0x18]
 f0 31 1a              ldsp16	r1, [sp+0x1a]
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f7 66                 add32	q1, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 6b                 add32	q2, q3
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 69 8c              cmp32	q2, q3
 f8 14                 cset.ult	r4
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f7 61                 add32	q0, q1
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e1 87 0d              call16	__avm_ashrdi3
 d6 02                 adjsp	0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f2 67                 mov32	q1, q3
 f4 39                 ldsp16	r5, [sp+0xe]
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f9 c2                 xor	r6, r0
 f9 e6                 xor	r7, r1
 f2 63                 mov32	q0, q3
 c9 08                 addi.s8	r5, 0x8
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 42 ff              brne16	-0xbe <L1>
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 2e ff              brne16	-0xd2 <L0>
 c4 04 01              ldi16	r4, 0x104
 f0 6b 08              st32	[r4], q0
 c4 08 01              ldi16	r4, 0x108
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1c                 adjsp	0x1c
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

<__avm_ashldi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a5                    xor	r5, r5
 f4 53                 stsp16	[sp+0x4], r7
 f4 59                 stsp16	[sp+0x6], r5
 f4 09                 ldsp16	r5, [sp+0x2]
 01                    mov	r4, r5
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 cd 01                 cmpi.s8	r5, 0x1
 d1 27                 brne8	0x27 <L0>
 f1 14                 mov	r2, r4
 fa 7f                 lsr16i	r4, 0xf
 f7 6f                 add32	q3, q3
 98                    or	r6, r4
 c0 01                 ldi8	r4, 0x1
 f1 1c                 mov	r3, r4
 8c                    and	r7, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 10                    add	r4, r4
 93                    or	r4, r7
 f1 06                 mov	r0, r6
 f1 0c                 mov	r1, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 6a                 add32	q2, q2
 f9 74                 and	r3, r5
 f4 82                 lsl16.1	r2
 f9 4d                 or	r2, r3
 f1 1a                 mov	r3, r2
 f1 14                 mov	r2, r4
 e0 9b 00              jmp16	155 <L5>
<L0>:
 f4 60                 stsp16	[sp+0x8], r4
 f4 72                 stsp16	[sp+0xc], r6
 09                    mov	r6, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 ce 40                 cmpi.s8	r6, 0x40
 f2 61                 mov32	q0, q1
 06                    mov	r5, r6
 dd 88 00              bruge16	0x88 <L5>
 cd 30                 cmpi.s8	r5, 0x30
 d2 0a                 brult8	0xa <L1>
 c9 d0                 addi.s8	r5, -0x30
 fa 01                 shl16v	r4, r5
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 d4 7a                 jmp8	0x7a <L5>
<L1>:
 cd 20                 cmpi.s8	r5, 0x20
 d2 0f                 brult8	0xf <L2>
 c9 e0                 addi.s8	r5, -0x20
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 52                 stsp16	[sp+0x4], r6
 08                    mov	r6, r4
 a0                    xor	r4, r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 40                 stsp16	[sp+0x0], r4
 d4 1b                 jmp8	0x1b <L4>
<L2>:
 cd 10                 cmpi.s8	r5, 0x10
 d2 0e                 brult8	0xe <L3>
 aa                    xor	r6, r6
 f0 3e 12              stsp16	[sp+0x12], r6
 c9 f0                 addi.s8	r5, -0x10
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 52                 stsp16	[sp+0x4], r6
 f4 22                 ldsp16	r6, [sp+0x8]
 d4 09                 jmp8	0x9 <L4>
<L3>:
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 42                 stsp16	[sp+0x0], r6
 f4 32                 ldsp16	r6, [sp+0xc]
<L4>:
 f0 3d 10              stsp16	[sp+0x10], r5
 c4 ff ff              ldi16	r4, 0xffff
 a1                    xor	r4, r5
 c3 0f                 ldi8	r7, 0xf
 83                    and	r4, r7
 f4 60                 stsp16	[sp+0x8], r4
 8d                    and	r7, r5
 f4 73                 stsp16	[sp+0xc], r7
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 03                 shl16v	r4, r7
 0e                    mov	r7, r6
 f4 8f                 lsr16.1	r7
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 1d                 lsr16v	r7, r5
 9c                    or	r7, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 fa 08                 shl16v	r6, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 8c                 lsr16.1	r4
 f4 21                 ldsp16	r5, [sp+0x8]
 fa 11                 lsr16v	r4, r5
 92                    or	r4, r6
 f1 04                 mov	r0, r4
 f1 0f                 mov	r1, r7
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 fa 08                 shl16v	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f0 35 12              ldsp16	r5, [sp+0x12]
 01                    mov	r4, r5
 f4 8c                 lsr16.1	r4
 f4 22                 ldsp16	r6, [sp+0x8]
 fa 12                 lsr16v	r4, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 92                    or	r4, r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 fa 06                 shl16v	r5, r6
 f1 15                 mov	r2, r5
 f1 1c                 mov	r3, r4
<L5>:
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 d6 14                 adjsp	0x14
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
 d6 ee                 adjsp	-0x12
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f1 05                 mov	r0, r5
 f0 35 1d              ldsp16	r5, [sp+0x1d]
 cd 01                 cmpi.s8	r5, 0x1
 d1 42                 brne8	0x42 <L0>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 38 08              stsp16	[sp+0x8], r0
 f0 3e 0a              stsp16	[sp+0xa], r6
 f2 63                 mov32	q0, q3
 f7 80                 lsr32.1	q0
 f0 06 ff 7f           ldi16	r2, 0x7fff
 f9 44                 and	r2, r1
 c7 fe ff              ldi16	r7, 0xfffe
 06                    mov	r5, r6
 87                    and	r5, r7
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 05                 mov	r0, r5
 f1 0e                 mov	r1, r6
 f7 80                 lsr32.1	q0
 f1 1a                 mov	r3, r2
 f1 10                 mov	r2, r0
 f4 02                 ldsp16	r6, [sp+0x0]
 fa 5f                 lsl16i	r6, 0xf
 f0 30 08              ldsp16	r0, [sp+0x8]
 f1 08                 mov	r1, r0
 f1 01                 mov	r0, r1
 f4 88                 lsr16.1	r0
 f9 19                 or	r0, r6
 c5 fe ff              ldi16	r5, 0xfffe
 81                    and	r4, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 06                    mov	r5, r6
 f7 82                 lsr32.1	q2
 f1 24                 mov	r5, r0
 e0 a0 00              jmp16	160 <L6>
<L0>:
 f4 60                 stsp16	[sp+0x8], r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 cd 40                 cmpi.s8	r5, 0x40
 d2 05                 brult8	0x5 <L1>
 f2 69                 mov32	q2, q1
 e0 91 00              jmp16	145 <L6>
<L1>:
 cd 30                 cmpi.s8	r5, 0x30
 d2 0b                 brult8	0xb <L2>
 c9 d0                 addi.s8	r5, -0x30
 09                    mov	r6, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 fa 12                 lsr16v	r4, r6
 a5                    xor	r5, r5
 e0 82 00              jmp16	130 <L6>
<L2>:
 cd 20                 cmpi.s8	r5, 0x20
 d2 10                 brult8	0x10 <L3>
 a0                    xor	r4, r4
 c9 e0                 addi.s8	r5, -0x20
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 62                 stsp16	[sp+0x8], r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 70                 stsp16	[sp+0xc], r4
 f4 12                 ldsp16	r6, [sp+0x4]
 d4 27                 jmp8	0x27 <L5>
<L3>:
 cd 10                 cmpi.s8	r5, 0x10
 d2 14                 brult8	0x14 <L4>
 a0                    xor	r4, r4
 f0 3c 10              stsp16	[sp+0x10], r4
 c9 f0                 addi.s8	r5, -0x10
 f1 20                 mov	r4, r0
 f4 60                 stsp16	[sp+0x8], r4
 0d                    mov	r7, r5
 f4 10                 ldsp16	r4, [sp+0x4]
 07                    mov	r5, r7
 f4 70                 stsp16	[sp+0xc], r4
 f4 02                 ldsp16	r6, [sp+0x0]
 d4 0f                 jmp8	0xf <L5>
<L4>:
 f4 79                 stsp16	[sp+0xe], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 70                 stsp16	[sp+0xc], r4
 f1 28                 mov	r6, r0
 f4 39                 ldsp16	r5, [sp+0xe]
<L5>:
 f4 79                 stsp16	[sp+0xe], r5
 c4 ff ff              ldi16	r4, 0xffff
 a1                    xor	r4, r5
 c3 0f                 ldi8	r7, 0xf
 83                    and	r4, r7
 f4 40                 stsp16	[sp+0x0], r4
 f4 31                 ldsp16	r5, [sp+0xc]
 15                    add	r5, r5
 fa 04                 shl16v	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 8c                    and	r7, r4
 02                    mov	r4, r6
 fa 13                 lsr16v	r4, r7
 91                    or	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 fa 13                 lsr16v	r4, r7
 1a                    add	r6, r6
 f4 01                 ldsp16	r5, [sp+0x0]
 fa 09                 shl16v	r6, r5
 98                    or	r6, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 04                    mov	r5, r4
 02                    mov	r4, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 fa 1b                 lsr16v	r6, r7
 f4 72                 stsp16	[sp+0xc], r6
 f0 36 10              ldsp16	r6, [sp+0x10]
 1a                    add	r6, r6
 f4 03                 ldsp16	r7, [sp+0x0]
 fa 0b                 shl16v	r6, r7
 f4 33                 ldsp16	r7, [sp+0xc]
 9b                    or	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 36 10              ldsp16	r6, [sp+0x10]
 fa 1b                 lsr16v	r6, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 f1 17                 mov	r2, r7
 f1 1e                 mov	r3, r6
<L6>:
 f2 6b                 mov32	q3, q1
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<__avm_ashrdi3>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f1 05                 mov	r0, r5
 f0 35 1d              ldsp16	r5, [sp+0x1d]
 f4 41                 stsp16	[sp+0x0], r5
 cd 01                 cmpi.s8	r5, 0x1
 d1 22                 brne8	0x22 <L0>
 f4 1a                 ldsp16	r6, [sp+0x6]
 06                    mov	r5, r6
 fa 4f                 lsl16i	r5, 0xf
 f1 10                 mov	r2, r0
 f4 8a                 lsr16.1	r2
 f9 55                 or	r2, r5
 c7 fe ff              ldi16	r7, 0xfffe
 83                    and	r4, r7
 f1 24                 mov	r5, r0
 f7 82                 lsr32.1	q2
 f1 04                 mov	r0, r4
 f1 0a                 mov	r1, r2
 8b                    and	r6, r7
 02                    mov	r4, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 0e                    mov	r7, r6
 08                    mov	r6, r4
 f7 87                 asr32.1	q3
 e0 b4 00              jmp16	180 <L6>
<L0>:
 f4 70                 stsp16	[sp+0xc], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 40                 cmpi.s8	r4, 0x40
 d2 0d                 brult8	0xd <L1>
 f4 08                 ldsp16	r4, [sp+0x2]
 fa bf                 asr16i	r4, 0xf
 f1 04                 mov	r0, r4
 f1 0c                 mov	r1, r4
 f2 6a                 mov32	q3, q0
 e0 9f 00              jmp16	159 <L6>
<L1>:
 f4 08                 ldsp16	r4, [sp+0x2]
 08                    mov	r6, r4
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 30                 cmpi.s8	r4, 0x30
 d2 0f                 brult8	0xf <L2>
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 d0                 addi.s8	r4, -0x30
 fa 28                 asr16v	r6, r4
 f1 06                 mov	r0, r6
 f1 0d                 mov	r1, r5
 09                    mov	r6, r5
 0d                    mov	r7, r5
 e0 84 00              jmp16	132 <L6>
<L2>:
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 20                 cmpi.s8	r4, 0x20
 d2 13                 brult8	0x13 <L3>
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 e0                 addi.s8	r4, -0x20
 f4 40                 stsp16	[sp+0x0], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 72                 stsp16	[sp+0xc], r6
 f4 69                 stsp16	[sp+0xa], r5
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 0a                 ldsp16	r6, [sp+0x2]
 d4 2a                 jmp8	0x2a <L5>
<L3>:
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 10                 cmpi.s8	r4, 0x10
 d2 17                 brult8	0x17 <L4>
 f4 00                 ldsp16	r4, [sp+0x0]
 c8 f0                 addi.s8	r4, -0x10
 f4 40                 stsp16	[sp+0x0], r4
 f1 20                 mov	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 68                 stsp16	[sp+0xa], r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 d4 0d                 jmp8	0xd <L5>
<L4>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 68                 stsp16	[sp+0xa], r4
 f1 28                 mov	r6, r0
<L5>:
 c5 ff ff              ldi16	r5, 0xffff
 f4 03                 ldsp16	r7, [sp+0x0]
 a7                    xor	r5, r7
 c0 0f                 ldi8	r4, 0xf
 84                    and	r5, r4
 01                    mov	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 29                 ldsp16	r5, [sp+0xa]
 15                    add	r5, r5
 fa 04                 shl16v	r5, r4
 c0 0f                 ldi8	r4, 0xf
 83                    and	r4, r7
 f4 48                 stsp16	[sp+0x2], r4
 0e                    mov	r7, r6
 fa 1c                 lsr16v	r7, r4
 9d                    or	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 09                 ldsp16	r5, [sp+0x2]
 fa 11                 lsr16v	r4, r5
 1a                    add	r6, r6
 f4 19                 ldsp16	r5, [sp+0x6]
 fa 09                 shl16v	r6, r5
 98                    or	r6, r4
 f1 06                 mov	r0, r6
 f1 0f                 mov	r1, r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 08                 ldsp16	r4, [sp+0x2]
 fa 18                 lsr16v	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f0 34 10              ldsp16	r4, [sp+0x10]
 08                    mov	r6, r4
 1a                    add	r6, r6
 fa 09                 shl16v	r6, r5
 f4 2b                 ldsp16	r7, [sp+0xa]
 9b                    or	r6, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 fa 23                 asr16v	r4, r7
 0c                    mov	r7, r4
<L6>:
 f2 68                 mov32	q2, q0
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
