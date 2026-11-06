
string_strncmp_p.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d8                 adjsp	-0x28
 f2 42                 sub	r2, r2
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
 c6 c4 0f              ldi16	r6, 0xfc4
 c3 00                 ldi8	r7, 0x0
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c6 a4 0f              ldi16	r6, 0xfa4
 c3 00                 ldi8	r7, 0x0
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c6 91 0f              ldi16	r6, 0xf91
 c3 00                 ldi8	r7, 0x0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 e4 0f              ldi16	r6, 0xfe4
 c3 00                 ldi8	r7, 0x0
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c6 04 10              ldi16	r6, 0x1004
 c3 00                 ldi8	r7, 0x0
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
<L0>:
 f0 3c 26              stsp16	[sp+0x26], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c4 05 01              ldi16	r4, 0x105
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f1 1c                 mov	r3, r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 05 01              ldi16	r4, 0x105
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 24              stsp16	[sp+0x24], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 05 01              ldi16	r4, 0x105
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 22              stsp16	[sp+0x22], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c4 25 01              ldi16	r4, 0x125
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 20              stsp16	[sp+0x20], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 25 01              ldi16	r4, 0x125
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 1e              stsp16	[sp+0x1e], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 25 01              ldi16	r4, 0x125
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 1c              stsp16	[sp+0x1c], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c4 45 01              ldi16	r4, 0x145
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 1a              stsp16	[sp+0x1a], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 45 01              ldi16	r4, 0x145
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 18              stsp16	[sp+0x18], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 45 01              ldi16	r4, 0x145
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 16              stsp16	[sp+0x16], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 08                 ldi8	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 c4 65 01              ldi16	r4, 0x165
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f0 3c 14              stsp16	[sp+0x14], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 d6 fe                 adjsp	-0x2
 c0 20                 ldi8	r4, 0x20
 f4 40                 stsp16	[sp+0x0], r4
 c4 65 01              ldi16	r4, 0x165
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 c5 02 01              ldi16	r5, 0x102
 f7 28                 ld16	r0, [r5+]
 f5 35                 ld8u	r1, [r5]
 d6 fe                 adjsp	-0x2
 c1 20                 ldi8	r5, 0x20
 f4 41                 stsp16	[sp+0x0], r5
 f2 1a                 add	r3, r2
 f0 35 26              ldsp16	r5, [sp+0x26]
 f2 1d                 add	r3, r5
 f0 35 24              ldsp16	r5, [sp+0x24]
 f2 1d                 add	r3, r5
 f0 35 22              ldsp16	r5, [sp+0x22]
 f2 1d                 add	r3, r5
 f0 35 20              ldsp16	r5, [sp+0x20]
 f2 1d                 add	r3, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f2 1d                 add	r3, r5
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 f2 1d                 add	r3, r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f2 1d                 add	r3, r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 f2 1d                 add	r3, r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 f2 1d                 add	r3, r5
 f2 1c                 add	r3, r4
 c4 65 01              ldi16	r4, 0x165
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 d6 02                 adjsp	0x2
 f1 14                 mov	r2, r4
 f0 34 26              ldsp16	r4, [sp+0x26]
 f2 13                 add	r2, r3
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db 87 fe              brne16	-0x179 <L0>
 f0 5a 00 01           stm16	[0x100], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 28                 adjsp	0x28
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strncmp_P>:
 b1                    push16	r1
 b0                    push16	r0
 f4 1d                 ldsp16	r5, [sp+0x7]
 f6 2d                 tst16	r5
 d0 13                 breq8	0x13 <L1>
<L0>:
 f0 65 2c              ldp8u	r1, [q3+]
 f7 00                 ld8u	r0, [r4+]
 f4 a0                 tst8	r0
 d0 0e                 breq8	0xe <L2>
 f5 01                 cmp	r0, r1
 d1 0a                 brne8	0xa <L2>
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 ed                 brne8	-0x13 <L0>
<L1>:
 f2 30                 sub	r0, r0
 d4 02                 jmp8	0x2 <L3>
<L2>:
 f2 31                 sub	r0, r1
<L3>:
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
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
