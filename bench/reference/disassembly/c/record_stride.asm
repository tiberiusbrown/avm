
record_stride.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 72 02              ldi16	r4, 0x272
 a5                    xor	r5, r5
 c6 81 01              ldi16	r6, 0x181
 f0 6b 8c              st32	[r6], q2
 c4 2b 02              ldi16	r4, 0x22b
 c5 01 01              ldi16	r5, 0x101
 c6 6f 01              ldi16	r6, 0x16f
 f0 6b 8c              st32	[r6], q2
 c4 e4 01              ldi16	r4, 0x1e4
 c5 02 02              ldi16	r5, 0x202
 c6 5d 01              ldi16	r6, 0x15d
 f0 6b 8c              st32	[r6], q2
 c4 9d 01              ldi16	r4, 0x19d
 c5 03 03              ldi16	r5, 0x303
 c6 4b 01              ldi16	r6, 0x14b
 f0 6b 8c              st32	[r6], q2
 c4 56 01              ldi16	r4, 0x156
 c5 04 04              ldi16	r5, 0x404
 c6 39 01              ldi16	r6, 0x139
 f0 6b 8c              st32	[r6], q2
 c4 0f 01              ldi16	r4, 0x10f
 c5 05 05              ldi16	r5, 0x505
 c6 27 01              ldi16	r6, 0x127
 f0 6b 8c              st32	[r6], q2
 c0 c8                 ldi8	r4, 0xc8
 c5 06 06              ldi16	r5, 0x606
 c6 15 01              ldi16	r6, 0x115
 f0 6b 8c              st32	[r6], q2
 c0 81                 ldi8	r4, 0x81
 c5 07 07              ldi16	r5, 0x707
 f0 04 03 01           ldi16	r0, 0x103
 f0 6b 80              st32	[r0], q2
 c0 79                 ldi8	r4, 0x79
 f0 4c 8b 01           stm8	[0x18b], r4
 c0 fa                 ldi8	r4, 0xfa
 f0 4c 79 01           stm8	[0x179], r4
 c0 7b                 ldi8	r4, 0x7b
 f0 4c 67 01           stm8	[0x167], r4
 c0 fc                 ldi8	r4, 0xfc
 f0 4c 55 01           stm8	[0x155], r4
 c0 7d                 ldi8	r4, 0x7d
 f0 4c 43 01           stm8	[0x143], r4
 c0 fe                 ldi8	r4, 0xfe
 f0 4c 31 01           stm8	[0x131], r4
 c0 7f                 ldi8	r4, 0x7f
 f0 4c 1f 01           stm8	[0x11f], r4
 f2 39                 sub	r1, r1
 f0 49 0d 01           stm8	[0x10d], r1
 d7 01                 sys	debug_break
 f1 11                 mov	r2, r1
 f1 2d                 mov	r7, r1
 d4 07                 jmp8	0x7 <L1>
<L0>:
 f4 aa                 inc16	r2
 f0 0e 20              cmpi.s8	r2, 0x20
 d0 2f                 breq8	0x2f <L4>
<L1>:
 f0 43 00 01           ldm8u	r3, [0x100]
 f4 a3                 tst8	r3
 d0 f1                 breq8	-0xf <L0>
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 d4 08                 jmp8	0x8 <L3>
<L2>:
 c9 12                 addi.s8	r5, 0x12
 f4 ae                 inc16	r6
 f5 2b                 cmp	r6, r3
 d0 e3                 breq8	-0x1d <L0>
<L3>:
 ed 8a 2a              ld8u	r4, [r5+10]
 f4 a4                 tst8	r4
 d0 f1                 breq8	-0xf <L2>
 ed 9a 22              ld16	r4, [r5+2]
 1c                    add	r7, r4
 61                    ld16	r4, [r5]
 13                    add	r4, r7
 12                    add	r4, r6
 0c                    mov	r7, r4
 c9 12                 addi.s8	r5, 0x12
 f4 ae                 inc16	r6
 f5 2b                 cmp	r6, r3
 d1 e9                 brne8	-0x17 <L3>
 d4 ca                 jmp8	-0x36 <L0>
<L4>:
 f0 5f 01 01           stm16	[0x101], r7
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
