
string_strchr_p.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 06 00 01           ldi16	r2, 0x100
 04                    mov	r5, r4
 0c                    mov	r7, r4
<L0>:
 f0 3f 10              stsp16	[sp+0x10], r7
<L1>:
 f4 40                 stsp16	[sp+0x0], r4
 f4 69                 stsp16	[sp+0xa], r5
 fa 7b                 lsr16i	r4, 0xb
 f4 01                 ldsp16	r5, [sp+0x0]
 fa 45                 lsl16i	r5, 0x5
 a1                    xor	r4, r5
 a4                    xor	r5, r4
 a1                    xor	r4, r5
 c6 86 0e              ldi16	r6, 0xe86
 c3 00                 ldi8	r7, 0x0
 f7 6b                 add32	q2, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f1 22                 mov	r4, r2
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 f2 67                 mov32	q1, q3
 f1 73                 zext8	r3
 c2 61                 ldi8	r6, 0x61
 f2 69                 mov32	q2, q1
 e8                    callp	q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 00 01              ldi16	r4, 0x100
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c2 7a                 ldi8	r6, 0x7a
 f2 69                 mov32	q2, q1
 e8                    callp	q0
 f2 62                 mov32	q0, q2
 c4 00 01              ldi16	r4, 0x100
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f2 69                 mov32	q2, q1
 aa                    xor	r6, r6
 f0 32 02              ldsp16	r2, [sp+0x2]
 f1 1f                 mov	r3, r7
 e9                    callp	q1
 f4 1a                 ldsp16	r6, [sp+0x6]
 0c                    mov	r7, r4
 2e                    sub	r7, r6
 f4 af                 inc16	r7
 f1 75                 zext8	r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 69 84              cmp32	q2, q1
 a5                    xor	r5, r5
 fb 3d                 cmov.eq	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 f1 20                 mov	r4, r0
 22                    sub	r4, r6
 f4 ac                 inc16	r4
 f1 71                 zext8	r1
 f0 69 04              cmp32	q0, q1
 fb 25                 cmov.eq	r4, r5
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f1 24                 mov	r5, r0
 26                    sub	r5, r6
 f4 ad                 inc16	r5
 f1 71                 zext8	r1
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 0c              cmp32	q0, q3
 fb 2a                 cmov.eq	r5, r2
 f4 2b                 ldsp16	r7, [sp+0xa]
 1d                    add	r7, r5
 07                    mov	r5, r7
 14                    add	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 0a                 ldsp16	r6, [sp+0x2]
 16                    add	r5, r6
 f0 06 00 01           ldi16	r2, 0x100
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 db 69 ff              brne16	-0x97 <L1>
 f0 37 10              ldsp16	r7, [sp+0x10]
 f4 af                 inc16	r7
 cf 20                 cmpi.s8	r7, 0x20
 a0                    xor	r4, r4
 db 5b ff              brne16	-0xa5 <L0>
 f0 5d 03 01           stm16	[0x103], r5
 d7 01                 sys	debug_break
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strchr_P>:
 b1                    push16	r1
 b0                    push16	r0
 f1 76                 zext8	r6
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
<L0>:
 f0 60 e8              ldp8u	r7, [q2]
 3e                    cmp	r7, r6
 d0 08                 breq8	0x8 <L1>
 f7 68                 add32	q2, q0
 f4 a7                 tst8	r7
 d1 f4                 brne8	-0xc <L0>
 a0                    xor	r4, r4
 a5                    xor	r5, r5
<L1>:
 f1 75                 zext8	r5
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
