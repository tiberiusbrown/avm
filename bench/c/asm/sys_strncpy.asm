
sys_strncpy.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 65 66              ldi16	r4, 0x6665
 c5 67 68              ldi16	r5, 0x6867
 c6 2d 01              ldi16	r6, 0x12d
 f0 6b 8c              st32	[r6], q2
 c4 61 62              ldi16	r4, 0x6261
 c5 63 64              ldi16	r5, 0x6463
 f0 07 29 01           ldi16	r3, 0x129
 f0 6b 86              st32	[r3], q2
 c1 63                 ldi8	r5, 0x63
 f0 06 0d 01           ldi16	r2, 0x10d
 f0 6b 84              st32	[r2], q2
 f2 30                 sub	r0, r0
 f0 48 31 01           stm8	[0x131], r0
 f0 05 52 01           ldi16	r1, 0x152
 f1 21                 mov	r4, r1
 c6 4b 0e              ldi16	r6, 0xe4b
 c3 00                 ldi8	r7, 0x0
 c1 21                 ldi8	r5, 0x21
 d7 10                 sys	memcpy_p
 d7 01                 sys	debug_break
 c4 06 01              ldi16	r4, 0x106
 f0 56 07 01           ldm16	r6, [0x107]
 f1 25                 mov	r5, r1
 d7 1b                 sys	strncpy
 c4 09 01              ldi16	r4, 0x109
 f0 56 00 01           ldm16	r6, [0x100]
 d7 1b                 sys	strncpy
 c4 11 01              ldi16	r4, 0x111
 f0 56 02 01           ldm16	r6, [0x102]
 f1 26                 mov	r5, r2
 d7 1b                 sys	strncpy
 c4 19 01              ldi16	r4, 0x119
 f0 55 02 01           ldm16	r5, [0x102]
 f1 27                 mov	r5, r3
 d7 1b                 sys	strncpy
 c4 21 01              ldi16	r4, 0x121
 f0 55 02 01           ldm16	r5, [0x102]
 f1 25                 mov	r5, r1
 d7 1b                 sys	strncpy
 c4 32 01              ldi16	r4, 0x132
 f0 56 04 01           ldm16	r6, [0x104]
 f1 26                 mov	r5, r2
 d7 1b                 sys	strncpy
 f0 44 18 01           ldm8u	r4, [0x118]
 f0 45 09 01           ldm8u	r5, [0x109]
 14                    add	r5, r4
 f0 44 28 01           ldm8u	r4, [0x128]
 11                    add	r4, r5
 f0 45 51 01           ldm8u	r5, [0x151]
 14                    add	r5, r4
 c9 06                 addi.s8	r5, 0x6
 f0 5d 0b 01           stm16	[0x10b], r5
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
