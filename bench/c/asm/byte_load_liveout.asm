
byte_load_liveout.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c0 81                 ldi8	r4, 0x81
 f0 4c 03 01           stm8	[0x103], r4
 c0 a6                 ldi8	r4, 0xa6
 f0 4c 04 01           stm8	[0x104], r4
 c0 cb                 ldi8	r4, 0xcb
 f0 4c 05 01           stm8	[0x105], r4
 c0 f0                 ldi8	r4, 0xf0
 f0 4c 06 01           stm8	[0x106], r4
 c0 15                 ldi8	r4, 0x15
 f0 4c 07 01           stm8	[0x107], r4
 c0 3a                 ldi8	r4, 0x3a
 f0 4c 08 01           stm8	[0x108], r4
 c0 5f                 ldi8	r4, 0x5f
 f0 4c 09 01           stm8	[0x109], r4
 c0 84                 ldi8	r4, 0x84
 f0 4c 0a 01           stm8	[0x10a], r4
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 07 00 01           ldi16	r3, 0x100
 f1 01                 mov	r0, r1
 f1 11                 mov	r2, r1
<L0>:
 f1 21                 mov	r4, r1
 c1 01                 ldi8	r5, 0x1
 81                    and	r4, r5
 f0 4c 00 01           stm8	[0x100], r4
 f1 21                 mov	r4, r1
 c1 07                 ldi8	r5, 0x7
 81                    and	r4, r5
 f1 26                 mov	r5, r2
 f2 24                 add	r5, r0
 d5 16                 call8	step
 f9 52                 xor	r2, r4
 f4 a9                 inc16	r1
 f4 a8                 inc16	r0
 f5 03                 cmp	r0, r3
 d1 e2                 brne8	-0x1e <L0>
 f0 5a 01 01           stm16	[0x101], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<step>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 af                    xor	r7, r7
 f0 06 65 0e           ldi16	r2, 0xe65
 f0 03 00              ldi8	r3, 0x0
 f7 67                 add32	q1, q3
 c6 03 01              ldi16	r6, 0x103
 18                    add	r6, r4
 f5 38                 ld8u	r0, [r6]
 f0 60 24              ldp8u	r1, [q1]
 f0 44 00 01           ldm8u	r4, [0x100]
 f4 a4                 tst8	r4
 d0 12                 breq8	0x12 <L0>
 f1 20                 mov	r4, r0
 f1 05                 mov	r0, r5
 d5 26                 call8	consume
 f1 14                 mov	r2, r4
 f1 21                 mov	r4, r1
 f1 24                 mov	r5, r0
 d5 1e                 call8	consume
 f9 8a                 xor	r4, r2
 d4 15                 jmp8	0x15 <L1>
<L0>:
 c6 5a a5              ldi16	r6, 0xa55a
 a9                    xor	r6, r5
 f1 21                 mov	r4, r1
 f1 0d                 mov	r1, r5
 06                    mov	r5, r6
 d5 0f                 call8	consume
 f1 14                 mov	r2, r4
 f1 20                 mov	r4, r0
 f1 25                 mov	r5, r1
 d5 07                 call8	consume
 f2 22                 add	r4, r2
<L1>:
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<consume>:
 08                    mov	r6, r4
 fa 58                 lsl16i	r6, 0x8
 92                    or	r4, r6
 11                    add	r4, r5
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
