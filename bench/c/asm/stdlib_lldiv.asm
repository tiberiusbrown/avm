
stdlib_lldiv.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c7 44 0b              ldi16	r7, 0xb44
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f2 64                 mov32	q1, q0
<L0>:
 aa                    xor	r6, r6
<L1>:
 f4 42                 stsp16	[sp+0x0], r6
 02                    mov	r4, r6
 13                    add	r4, r7
 f0 6a 88              ld32	q2, [r4]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c6 00 01              ldi16	r6, 0x100
 f7 34                 ld16	r4, [r6+]
 46                    ld8u	r5, [r6]
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 d6 f0                 adjsp	-0x10
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 c5 40 0b              ldi16	r5, 0xb40
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 c5 04 0b              ldi16	r5, 0xb04
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 c5 00 0b              ldi16	r5, 0xb00
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 14 1a              leasp	r4, 0x1a
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 eb                    callp	q3
 c7 44 0b              ldi16	r7, 0xb44
 d6 10                 adjsp	0x10
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f7 66                 add32	q1, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 f7 62                 add32	q0, q2
 f0 69 08              cmp32	q0, q2
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 69                 add32	q2, q1
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f7 66                 add32	q1, q2
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f7 68                 add32	q2, q0
 f0 69 80              cmp32	q2, q0
 f8 16                 cset.ult	r6
 f1 16                 mov	r2, r6
 f2 4b                 sub	r3, r3
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f7 64                 add32	q1, q0
 ca 08                 addi.s8	r6, 0x8
 ce 40                 cmpi.s8	r6, 0x40
 f2 62                 mov32	q0, q2
 db 5f ff              brne16	-0xa1 <L1>
 f0 36 1a              ldsp16	r6, [sp+0x1a]
 f4 ae                 inc16	r6
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 db 4f ff              brne16	-0xb1 <L0>
 c6 03 01              ldi16	r6, 0x103
 f0 6b 8c              st32	[r6], q2
 c4 07 01              ldi16	r4, 0x107
 f0 6b 48              st32	[r4], q1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<lldiv>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f1 04                 mov	r0, r4
 d6 f6                 adjsp	-0xa
 f0 14 0a              leasp	r4, 0xa
 f4 60                 stsp16	[sp+0x8], r4
 f0 34 29              ldsp16	r4, [sp+0x29]
 f0 35 2b              ldsp16	r5, [sp+0x2b]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 34 25              ldsp16	r4, [sp+0x25]
 f0 35 27              ldsp16	r5, [sp+0x27]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 34 1d              ldsp16	r4, [sp+0x1d]
 f0 35 1f              ldsp16	r5, [sp+0x1f]
 f0 36 21              ldsp16	r6, [sp+0x21]
 f0 37 23              ldsp16	r7, [sp+0x23]
 e1 7b 0b              call16	__avm_divmoddi4
 d6 0a                 adjsp	0xa
 f1 08                 mov	r1, r0
 f0 09 0c              addi.s8	r1, 0xc
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 6b 42              st32	[r1], q1
 f1 08                 mov	r1, r0
 f0 09 04              addi.s8	r1, 0x4
 f0 6b c2              st32	[r1], q3
 f0 6b 80              st32	[r0], q2
 f1 20                 mov	r4, r0
 c8 08                 addi.s8	r4, 0x8
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 6b c8              st32	[r4], q3
 f1 20                 mov	r4, r0
 d6 08                 adjsp	0x8
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

<__avm_divmoddi4>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 c8                 adjsp	-0x38
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 32 47              ldsp16	r2, [sp+0x47]
 f0 33 49              ldsp16	r3, [sp+0x49]
 f0 30 43              ldsp16	r0, [sp+0x43]
 f0 31 45              ldsp16	r1, [sp+0x45]
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 3a 2c              stsp16	[sp+0x2c], r2
 f0 3b 2e              stsp16	[sp+0x2e], r3
 f9 09                 or	r0, r2
 f9 2d                 or	r1, r3
 f0 34 4b              ldsp16	r4, [sp+0x4b]
 f0 3c 22              stsp16	[sp+0x22], r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 04              cmp32	q0, q1
 d0 09                 breq8	0x9 <L0>
 f0 69 8c              cmp32	q2, q3
 d9 0f                 brsge8	0xf <L1>
 f2 63                 mov32	q0, q3
 d4 49                 jmp8	0x49 <L2>
<L0>:
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f2 63                 mov32	q0, q3
 e0 9c 02              jmp16	668 <L14>
<L1>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f0 30 24              ldsp16	r0, [sp+0x24]
 f0 31 26              ldsp16	r1, [sp+0x26]
 f0 69 08              cmp32	q0, q2
 f2 62                 mov32	q0, q2
 f0 32 1e              ldsp16	r2, [sp+0x1e]
 f1 1a                 mov	r3, r2
 fb 42                 cmov.ne	r0, r2
 fb 4b                 cmov.ne	r1, r3
 f7 73                 sub32	q0, q3
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 ff ff              ldi16	r5, 0xffff
<L2>:
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f0 3e 28              stsp16	[sp+0x28], r6
 f0 3f 2a              stsp16	[sp+0x2a], r7
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 f0 69 8c              cmp32	q2, q3
 d9 08                 brsge8	0x8 <L3>
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 d4 2d                 jmp8	0x2d <L4>
<L3>:
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 c8              cmp32	q3, q2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 fb 72                 cmov.ne	r6, r2
 fb 7b                 cmov.ne	r7, r3
 f0 32 2c              ldsp16	r2, [sp+0x2c]
 f0 33 2e              ldsp16	r3, [sp+0x2e]
 f7 7d                 sub32	q3, q1
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 f7 79                 sub32	q2, q1
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
<L4>:
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 92                    or	r4, r6
 97                    or	r5, r7
 f0 69 84              cmp32	q2, q1
 d1 4f                 brne8	0x4f <L6>
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 34 24              ldsp16	r4, [sp+0x24]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 ff ff           ldi16	r3, 0xffff
 f0 3a 1a              stsp16	[sp+0x1a], r2
 f0 3b 1c              stsp16	[sp+0x1c], r3
<L5>:
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f4 42                 stsp16	[sp+0x0], r6
 f0 37 2e              ldsp16	r7, [sp+0x2e]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 3f 20              stsp16	[sp+0x20], r7
 f0 36 28              ldsp16	r6, [sp+0x28]
 fa 9f                 lsr16i	r6, 0xf
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 38                    cmp	r6, r4
 db 42 01              brne16	0x142 <L11>
 f0 3a 1e              stsp16	[sp+0x1e], r2
 f0 3b 20              stsp16	[sp+0x20], r3
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 e0 64 01              jmp16	356 <L12>
<L6>:
 c2 40                 ldi8	r6, 0x40
 f2 69                 mov32	q2, q1
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 d4 4c                 jmp8	0x4c <L9>
<L7>:
 f7 79                 sub32	q2, q1
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 69 4c              cmp32	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f8 14                 cset.ult	r4
 a5                    xor	r5, r5
 f7 7e                 sub32	q3, q2
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 18              ldsp16	r5, [sp+0x18]
 f7 76                 sub32	q1, q2
 c0 01                 ldi8	r4, 0x1
 f9 81                 or	r4, r0
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 39 1c              stsp16	[sp+0x1c], r1
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
<L8>:
 f0 33 36              ldsp16	r3, [sp+0x36]
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 16                 mov	r2, r6
 f0 31 20              ldsp16	r1, [sp+0x20]
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 06                 mov	r0, r6
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 da 6e ff              breq16	-0x92 <L5>
<L9>:
 f0 38 1e              stsp16	[sp+0x1e], r0
 f0 39 20              stsp16	[sp+0x20], r1
 f4 72                 stsp16	[sp+0xc], r6
 f1 29                 mov	r6, r1
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f7 60                 add32	q0, q0
 f9 c1                 or	r6, r0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 0b                    mov	r6, r7
 af                    xor	r7, r7
 fa 9f                 lsr16i	r6, 0xf
 f7 65                 add32	q1, q1
 f0 3b 36              stsp16	[sp+0x36], r3
 f9 c9                 or	r6, r2
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 f1 25                 mov	r5, r1
 f4 49                 stsp16	[sp+0x2], r5
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f1 23                 mov	r4, r3
 a5                    xor	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 f0 30 1e              ldsp16	r0, [sp+0x1e]
 f0 31 20              ldsp16	r1, [sp+0x20]
 f7 60                 add32	q0, q0
 f0 39 20              stsp16	[sp+0x20], r1
 f9 81                 or	r4, r0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 09                    mov	r6, r5
 fa 9f                 lsr16i	r6, 0xf
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 69 80              cmp32	q2, q0
 f0 30 1a              ldsp16	r0, [sp+0x1a]
 f0 31 1c              ldsp16	r1, [sp+0x1c]
 f7 6a                 add32	q2, q2
 98                    or	r6, r4
 02                    mov	r4, r6
 f7 60                 add32	q0, q0
 f7 65                 add32	q1, q1
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 de 38 ff              brslt16	-0xc8 <L7>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f0 69 84              cmp32	q2, q1
 d8 14                 bruge8	0x14 <L10>
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 e0 50 ff              jmp16	-176 <L8>
<L10>:
 f0 69 84              cmp32	q2, q1
 db 15 ff              brne16	-0xeb <L7>
 f0 36 16              ldsp16	r6, [sp+0x16]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f0 32 00              ldsp16	r2, [sp+0x0]
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 69 4c              cmp32	q1, q3
 f0 32 30              ldsp16	r2, [sp+0x30]
 f0 33 32              ldsp16	r3, [sp+0x32]
 dd fd fe              bruge16	-0x103 <L7>
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 e0 19 ff              jmp16	-231 <L8>
<L11>:
 f0 3a 34              stsp16	[sp+0x34], r2
 f0 3b 36              stsp16	[sp+0x36], r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 ff ff           ldi16	r1, 0xffff
 f0 32 1a              ldsp16	r2, [sp+0x1a]
 f0 33 1c              ldsp16	r3, [sp+0x1c]
 f0 69 4c              cmp32	q1, q3
 02                    mov	r4, r6
 07                    mov	r5, r7
 fb 60                 cmov.ne	r4, r0
 fb 69                 cmov.ne	r5, r1
 f0 30 34              ldsp16	r0, [sp+0x34]
 f0 31 36              ldsp16	r1, [sp+0x36]
 f7 78                 sub32	q2, q0
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 f7 7d                 sub32	q3, q1
 02                    mov	r4, r6
 07                    mov	r5, r7
<L12>:
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 a6                 tst8	r6
 d1 14                 brne8	0x14 <L13>
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 d4 36                 jmp8	0x36 <L14>
<L13>:
 f0 30 12              ldsp16	r0, [sp+0x12]
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c6 ff ff              ldi16	r6, 0xffff
 c7 ff ff              ldi16	r7, 0xffff
 f0 69 04              cmp32	q0, q1
 f2 68                 mov32	q2, q0
 f2 61                 mov32	q0, q1
 fb 46                 cmov.ne	r0, r6
 fb 4f                 cmov.ne	r1, r7
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f7 73                 sub32	q0, q3
 f7 76                 sub32	q1, q2
 f0 3a 24              stsp16	[sp+0x24], r2
 f0 3b 26              stsp16	[sp+0x26], r3
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
<L14>:
 f0 36 22              ldsp16	r6, [sp+0x22]
 f0 32 24              ldsp16	r2, [sp+0x24]
 f0 33 26              ldsp16	r3, [sp+0x26]
 f0 6b 4c              st32	[r6], q1
 ca 04                 addi.s8	r6, 0x4
 f0 6b 0c              st32	[r6], q0
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 f0 37 20              ldsp16	r7, [sp+0x20]
 d6 38                 adjsp	0x38
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
