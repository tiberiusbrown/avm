
mixed_width.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 a0                    xor	r4, r4
 f0 03 f0              ldi8	r3, 0xf0
 c7 60 f0              ldi16	r7, 0xf060
 c6 c4 01              ldi16	r6, 0x1c4
 c5 00 01              ldi16	r5, 0x100
 f0 05 84 01           ldi16	r1, 0x184
 f1 14                 mov	r2, r4
<L0>:
 f4 58                 stsp16	[sp+0x6], r4
 f0 3b 08              stsp16	[sp+0x8], r3
 f1 07                 mov	r0, r7
 0c                    mov	r7, r4
 f2 2d                 add	r7, r1
 f3 0f                 st8	[r7], r3
 ee 4e 40              st8	[r7+32], r2
 f7 50                 st16	[r6+], r0
 c3 fb                 ldi8	r7, 0xfb
 f2 2c                 add	r7, r0
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f1 22                 mov	r4, r2
 f0 06 ec ff           ldi16	r2, 0xffec
 f0 07 ff ff           ldi16	r3, 0xffff
 f7 64                 add32	q1, q0
 f0 05 84 01           ldi16	r1, 0x184
 f0 6b 4a              st32	[r5], q1
 f1 14                 mov	r2, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 f0 33 08              ldsp16	r3, [sp+0x8]
 c9 04                 addi.s8	r5, 0x4
 f4 ab                 inc16	r3
 f0 0a 05              addi.s8	r2, 0x5
 f4 ac                 inc16	r4
 cc 20                 cmpi.s8	r4, 0x20
 d1 c0                 brne8	-0x40 <L0>
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 04                    mov	r5, r4
<L1>:
 f4 41                 stsp16	[sp+0x0], r5
 f0 07 00 01           ldi16	r3, 0x100
 f0 04 c4 01           ldi16	r0, 0x1c4
 f2 42                 sub	r2, r2
<L2>:
 f1 26                 mov	r5, r2
 f2 25                 add	r5, r1
 41                    ld8u	r4, [r5]
 ed aa 40              ld8u	r5, [r5+32]
 f4 49                 stsp16	[sp+0x2], r5
 ed b0 20              ld16	r5, [r0+0]
 f4 59                 stsp16	[sp+0x6], r5
 f0 6c b1              ld16	r5, [r0+]
 f4 51                 stsp16	[sp+0x4], r5
 f0 38 08              stsp16	[sp+0x8], r0
 f6 44                 sext8	r4
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 14                    add	r5, r4
 fa bf                 asr16i	r4, 0xf
 f1 05                 mov	r0, r5
 f1 0c                 mov	r1, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 a5                    xor	r5, r5
 f7 6b                 add32	q2, q3
 f7 68                 add32	q2, q0
 f4 12                 ldsp16	r6, [sp+0x4]
 f1 06                 mov	r0, r6
 f2 39                 sub	r1, r1
 f4 1a                 ldsp16	r6, [sp+0x6]
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 6c                 add32	q3, q0
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 05 84 01           ldi16	r1, 0x184
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 f0 6a 86              ld32	q2, [r3]
 f6 44                 sext8	r4
 04                    mov	r5, r4
 fa cf                 asr16i	r5, 0xf
 f7 6b                 add32	q2, q3
 f0 6a c6              ld32	q3, [r3]
 0e                    mov	r7, r6
 fa ef                 asr16i	r7, 0xf
 f7 6e                 add32	q3, q2
 f0 0b 04              addi.s8	r3, 0x4
 f4 aa                 inc16	r2
 f0 0e 20              cmpi.s8	r2, 0x20
 d1 a4                 brne8	-0x5c <L2>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 10                 cmpi.s8	r5, 0x10
 d1 90                 brne8	-0x70 <L1>
 c4 80 01              ldi16	r4, 0x180
 f0 6b c8              st32	[r4], q3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
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
