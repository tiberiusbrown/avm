
string_strspn_p.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	-0xe
 f2 42                 sub	r2, r2
 c0 20                 ldi8	r4, 0x20
 d7 01                 sys	debug_break
 c6 1f 0f              ldi16	r6, 0xf1f
 c3 00                 ldi8	r7, 0x0
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 c6 22 0f              ldi16	r6, 0xf22
 c3 00                 ldi8	r7, 0x0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 3d 0f              ldi16	r6, 0xf3d
 c3 00                 ldi8	r7, 0x0
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
<L0>:
 f4 40                 stsp16	[sp+0x0], r4
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 05 01              ldi16	r4, 0x105
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 05 01              ldi16	r4, 0x105
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 05 01              ldi16	r4, 0x105
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 25 01              ldi16	r4, 0x125
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 25 01              ldi16	r4, 0x125
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 25 01              ldi16	r4, 0x125
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 45 01              ldi16	r4, 0x145
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 45 01              ldi16	r4, 0x145
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 45 01              ldi16	r4, 0x145
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 65 01              ldi16	r4, 0x165
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f2 13                 add	r2, r3
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 65 01              ldi16	r4, 0x165
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 e8                    callp	q0
 f1 1c                 mov	r3, r4
 f2 1a                 add	r3, r2
 c4 02 01              ldi16	r4, 0x102
 f7 20                 ld16	r0, [r4+]
 f5 31                 ld8u	r1, [r4]
 c4 65 01              ldi16	r4, 0x165
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 13                 ldsp16	r7, [sp+0x4]
 e8                    callp	q0
 f1 14                 mov	r2, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f2 13                 add	r2, r3
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 db 11 ff              brne16	-0xef <L0>
 f0 5a 00 01           stm16	[0x100], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0e                 adjsp	0xe
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strspn_P>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 04                    mov	r5, r4
 41                    ld8u	r4, [r5]
 f4 a4                 tst8	r4
 f4 59                 stsp16	[sp+0x6], r5
 d0 39                 breq8	0x39 <L4>
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 00 01              ldi8	r0, 0x1
 f2 39                 sub	r1, r1
<L0>:
 f4 51                 stsp16	[sp+0x4], r5
 f2 67                 mov32	q1, q3
<L1>:
 f0 60 a4              ldp8u	r5, [q1]
 34                    cmp	r5, r4
 d0 08                 breq8	0x8 <L2>
 f7 64                 add32	q1, q0
 f4 a5                 tst8	r5
 d1 f4                 brne8	-0xc <L1>
 d4 1a                 jmp8	0x1a <L3>
<L2>:
 f1 73                 zext8	r3
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 4c              cmp32	q1, q3
 d0 11                 breq8	0x11 <L3>
 f4 11                 ldsp16	r5, [sp+0x4]
 ed 8a 21              ld8u	r4, [r5+1]
 f4 ad                 inc16	r5
 f4 a4                 tst8	r4
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d1 d6                 brne8	-0x2a <L0>
 d4 02                 jmp8	0x2 <L4>
<L3>:
 f4 11                 ldsp16	r5, [sp+0x4]
<L4>:
 f4 18                 ldsp16	r4, [sp+0x6]
 24                    sub	r5, r4
 01                    mov	r4, r5
 d6 08                 adjsp	0x8
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
