
record_stride_nested.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 c0 79                 ldi8	r4, 0x79
 f0 4c 8a 01           stm8	[0x18a], r4
 c0 fa                 ldi8	r4, 0xfa
 f0 4c 78 01           stm8	[0x178], r4
 c4 01 01              ldi16	r4, 0x101
 f0 5c 70 01           stm16	[0x170], r4
 c0 7b                 ldi8	r4, 0x7b
 f0 4c 66 01           stm8	[0x166], r4
 c4 02 02              ldi16	r4, 0x202
 f0 5c 5e 01           stm16	[0x15e], r4
 c0 fc                 ldi8	r4, 0xfc
 f0 4c 54 01           stm8	[0x154], r4
 c4 03 03              ldi16	r4, 0x303
 f0 5c 4c 01           stm16	[0x14c], r4
 c0 7d                 ldi8	r4, 0x7d
 f0 4c 42 01           stm8	[0x142], r4
 c4 04 04              ldi16	r4, 0x404
 f0 5c 3a 01           stm16	[0x13a], r4
 c0 fe                 ldi8	r4, 0xfe
 f0 4c 30 01           stm8	[0x130], r4
 c4 05 05              ldi16	r4, 0x505
 f0 5c 28 01           stm16	[0x128], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 4c 1e 01           stm8	[0x11e], r4
 c4 06 06              ldi16	r4, 0x606
 f0 5c 16 01           stm16	[0x116], r4
 c4 07 07              ldi16	r4, 0x707
 f0 5c 04 01           stm16	[0x104], r4
 a0                    xor	r4, r4
 f0 5c 82 01           stm16	[0x182], r4
 f0 4c 0c 01           stm8	[0x10c], r4
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 0c                    mov	r7, r4
 d4 0a                 jmp8	0xa <L1>
<L0>:
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 ad                 inc16	r5
 cd 10                 cmpi.s8	r5, 0x10
 d0 7b                 breq8	0x7b <L9>
<L1>:
 f4 43                 stsp16	[sp+0x0], r7
 f4 49                 stsp16	[sp+0x2], r5
 c5 0c 01              ldi16	r5, 0x10c
 f2 42                 sub	r2, r2
 f1 02                 mov	r0, r2
 d4 17                 jmp8	0x17 <L5>
<L2>:
 04                    mov	r5, r4
<L3>:
 f0 14 08              leasp	r4, 0x8
 11                    add	r4, r5
 f3 00                 st8	[r4], r0
 f0 32 06              ldsp16	r2, [sp+0x6]
 f4 aa                 inc16	r2
 f4 11                 ldsp16	r5, [sp+0x4]
<L4>:
 c9 12                 addi.s8	r5, 0x12
 f4 a8                 inc16	r0
 f0 0c 08              cmpi.s8	r0, 0x8
 d0 38                 breq8	0x38 <L7>
<L5>:
 41                    ld8u	r4, [r5]
 f4 a4                 tst8	r4
 d0 f2                 breq8	-0xe <L4>
 a0                    xor	r4, r4
 f4 a2                 tst8	r2
 f0 3a 06              stsp16	[sp+0x6], r2
 f4 51                 stsp16	[sp+0x4], r5
 d0 da                 breq8	-0x26 <L2>
 ed 3a 18              ld16	r1, [r5-8]
<L6>:
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 f0 13 08              leasp	r3, 0x8
 f2 1d                 add	r3, r5
 ed c6 1f              ld8u	r6, [r3-1]
 c3 12                 ldi8	r7, 0x12
 02                    mov	r4, r6
 f3 13                 mulu8.w	r4, r7
 c7 04 01              ldi16	r7, 0x104
 13                    add	r4, r7
 60                    ld16	r4, [r4]
 f5 0c                 cmp	r1, r4
 d8 be                 bruge8	-0x42 <L3>
 ee c6 20              st8	[r3+0], r6
 f4 b2                 dec16	r2
 f4 a2                 tst8	r2
 d1 dd                 brne8	-0x23 <L6>
 a5                    xor	r5, r5
 d4 b2                 jmp8	-0x4e <L3>
<L7>:
 f4 a2                 tst8	r2
 d0 96                 breq8	-0x6a <L0>
 f0 16 08              leasp	r6, 0x8
 f1 72                 zext8	r2
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
<L8>:
 03                    mov	r4, r7
 10                    add	r4, r4
 13                    add	r4, r7
 f7 17                 ld8u	r7, [r6+]
 1c                    add	r7, r4
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 d1 f4                 brne8	-0xc <L8>
 f4 ad                 inc16	r5
 cd 10                 cmpi.s8	r5, 0x10
 d1 85                 brne8	-0x7b <L1>
<L9>:
 f0 5f 00 01           stm16	[0x100], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 10                 adjsp	0x10
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
