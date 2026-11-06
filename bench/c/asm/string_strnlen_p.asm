
string_strnlen_p.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 f2 42                 sub	r2, r2
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
 c6 03 0f              ldi16	r6, 0xf03
 c3 00                 ldi8	r7, 0x0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 23 0f              ldi16	r6, 0xf23
 c3 00                 ldi8	r7, 0x0
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 c6 43 0f              ldi16	r6, 0xf43
 c3 00                 ldi8	r7, 0x0
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 c6 63 0f              ldi16	r6, 0xf63
 c3 00                 ldi8	r7, 0x0
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
<L0>:
 f4 50                 stsp16	[sp+0x4], r4
 c4 00 01              ldi16	r4, 0x100
 f1 1c                 mov	r3, r4
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 aa                    xor	r6, r6
 f0 30 00              ldsp16	r0, [sp+0x0]
 f1 0f                 mov	r1, r7
 e8                    callp	q0
 f2 22                 add	r4, r2
 f4 40                 stsp16	[sp+0x0], r4
 f1 23                 mov	r4, r3
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 f2 68                 mov32	q2, q0
 c2 08                 ldi8	r6, 0x8
 e9                    callp	q1
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 22                 ld16	r2, [r4+]
 f5 33                 ld8u	r3, [r4]
 f2 68                 mov32	q2, q0
 c2 20                 ldi8	r6, 0x20
 e9                    callp	q1
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 32 12              ldsp16	r2, [sp+0x12]
 f0 33 14              ldsp16	r3, [sp+0x14]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 33 10              ldsp16	r3, [sp+0x10]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f0 32 0a              ldsp16	r2, [sp+0xa]
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 08                 ldi8	r6, 0x8
 e8                    callp	q0
 f4 01                 ldsp16	r5, [sp+0x0]
 11                    add	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 69                 mov32	q2, q1
 c2 20                 ldi8	r6, 0x20
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 01                 ldsp16	r5, [sp+0x0]
 f2 15                 add	r2, r5
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db 0a ff              brne16	-0xf6 <L0>
 f0 5a 03 01           stm16	[0x103], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strnlen_P>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 a0                    xor	r4, r4
 f6 2e                 tst16	r6
 d0 13                 breq8	0x13 <L1>
<L0>:
 f1 14                 mov	r2, r4
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 60 a4              ldp8u	r5, [q1]
 f4 a5                 tst8	r5
 d0 06                 breq8	0x6 <L1>
 f4 ac                 inc16	r4
 38                    cmp	r6, r4
 d1 ee                 brne8	-0x12 <L0>
 02                    mov	r4, r6
<L1>:
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
