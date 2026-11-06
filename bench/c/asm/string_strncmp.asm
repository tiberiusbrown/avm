
string_strncmp.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 42                 sub	r2, r2
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 05 01              ldi16	r4, 0x105
 c5 25 01              ldi16	r5, 0x125
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 05 01              ldi16	r4, 0x105
 04                    mov	r5, r4
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 05 01              ldi16	r4, 0x105
 c5 00 0b              ldi16	r5, 0xb00
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 25 01              ldi16	r4, 0x125
 c5 45 01              ldi16	r5, 0x145
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 25 01              ldi16	r4, 0x125
 04                    mov	r5, r4
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 25 01              ldi16	r4, 0x125
 c5 00 0b              ldi16	r5, 0xb00
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 45 01              ldi16	r4, 0x145
 c5 65 01              ldi16	r5, 0x165
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 45 01              ldi16	r4, 0x145
 04                    mov	r5, r4
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 45 01              ldi16	r4, 0x145
 c5 00 0b              ldi16	r5, 0xb00
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 65 01              ldi16	r4, 0x165
 c5 05 01              ldi16	r5, 0x105
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 65 01              ldi16	r4, 0x165
 04                    mov	r5, r4
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 65 01              ldi16	r4, 0x165
 c5 00 0b              ldi16	r5, 0xb00
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 13                 add	r2, r3
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db 0d ff              brne16	-0xf3 <L0>
 f0 5a 00 01           stm16	[0x100], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strncmp>:
 b0                    push16	r0
 f6 2e                 tst16	r6
 d0 12                 breq8	0x12 <L1>
<L0>:
 f7 08                 ld8u	r0, [r5+]
 f7 07                 ld8u	r7, [r4+]
 f4 a7                 tst8	r7
 d0 0d                 breq8	0xd <L2>
 f5 2c                 cmp	r7, r0
 d1 09                 brne8	0x9 <L2>
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 ee                 brne8	-0x12 <L0>
<L1>:
 af                    xor	r7, r7
 d4 02                 jmp8	0x2 <L3>
<L2>:
 f2 5c                 sub	r7, r0
<L3>:
 03                    mov	r4, r7
 b8                    pop16	r0
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
