
sys_strcmp.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f0 00 61              ldi8	r0, 0x61
 a0                    xor	r4, r4
 f0 06 55 01           ldi16	r2, 0x155
 f0 07 00 01           ldi16	r3, 0x100
 f0 05 44 01           ldi16	r1, 0x144
 04                    mov	r5, r4
 d4 0a                 jmp8	0xa <L1>
<L0>:
 f4 ac                 inc16	r4
 f4 a8                 inc16	r0
 f4 ad                 inc16	r5
 cd 40                 cmpi.s8	r5, 0x40
 d0 30                 breq8	0x30 <L2>
<L1>:
 08                    mov	r6, r4
 c3 4f                 ldi8	r7, 0x4f
 f3 1b                 mulu8.w	r6, r7
 fa 9b                 lsr16i	r6, 0xb
 c3 1a                 ldi8	r7, 0x1a
 f3 1b                 mulu8.w	r6, r7
 0c                    mov	r7, r4
 2e                    sub	r7, r6
 2c                    sub	r7, r4
 f2 2c                 add	r7, r0
 09                    mov	r6, r5
 f2 2a                 add	r6, r2
 5b                    st8	[r6], r7
 ee ec 61              st8	[r6+65], r7
 ee ec a2              st8	[r6+130], r7
 09                    mov	r6, r5
 f2 2b                 add	r6, r3
 5b                    st8	[r6], r7
 cd 10                 cmpi.s8	r5, 0x10
 d8 d4                 bruge8	-0x2c <L0>
 09                    mov	r6, r5
 f2 29                 add	r6, r1
 5b                    st8	[r6], r7
 f4 ac                 inc16	r4
 f4 a8                 inc16	r0
 f4 ad                 inc16	r5
 cd 40                 cmpi.s8	r5, 0x40
 d1 d0                 brne8	-0x30 <L1>
<L2>:
 c4 00 7a              ldi16	r4, 0x7a00
 f0 5c d6 01           stm16	[0x1d6], r4
 c0 7a                 ldi8	r4, 0x7a
 f0 5c 3f 01           stm16	[0x13f], r4
 f2 30                 sub	r0, r0
 f0 48 17 02           stm8	[0x217], r0
 f0 48 95 01           stm8	[0x195], r0
 f0 48 54 01           stm8	[0x154], r0
 f0 48 41 01           stm8	[0x141], r0
 d7 01                 sys	debug_break
 c5 41 01              ldi16	r5, 0x141
 01                    mov	r4, r5
 d7 19                 sys	strcmp
 08                    mov	r6, r4
 c7 96 01              ldi16	r7, 0x196
 f1 22                 mov	r4, r2
 07                    mov	r5, r7
 d7 19                 sys	strcmp
 18                    add	r6, r4
 c5 d7 01              ldi16	r5, 0x1d7
 f1 22                 mov	r4, r2
 d7 19                 sys	strcmp
 18                    add	r6, r4
 f1 22                 mov	r4, r2
 f1 27                 mov	r5, r3
 d7 19                 sys	strcmp
 18                    add	r6, r4
 f1 21                 mov	r4, r1
 07                    mov	r5, r7
 d7 19                 sys	strcmp
 18                    add	r6, r4
 f1 22                 mov	r4, r2
 f1 25                 mov	r5, r1
 d7 19                 sys	strcmp
 18                    add	r6, r4
 f0 5e 42 01           stm16	[0x142], r6
 d7 01                 sys	debug_break
 f1 20                 mov	r4, r0
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
