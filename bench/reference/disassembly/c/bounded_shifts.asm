
bounded_shifts.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 c4 67 45              ldi16	r4, 0x4567
 c5 23 81              ldi16	r5, 0x8123
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c0 01                 ldi8	r4, 0x1
 c5 ff ff              ldi16	r5, 0xffff
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c4 ff ff              ldi16	r4, 0xffff
 c5 00 80              ldi16	r5, 0x8000
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 a5                    xor	r5, r5
 f0 5d 14 01           stm16	[0x114], r5
 c0 05                 ldi8	r4, 0x5
 f0 5c 16 01           stm16	[0x116], r4
 c0 0a                 ldi8	r4, 0xa
 f0 5c 18 01           stm16	[0x118], r4
 c0 0f                 ldi8	r4, 0xf
 f0 5c 1a 01           stm16	[0x11a], r4
 c0 14                 ldi8	r4, 0x14
 f0 5c 1c 01           stm16	[0x11c], r4
 c0 19                 ldi8	r4, 0x19
 f0 5c 1e 01           stm16	[0x11e], r4
 c0 1e                 ldi8	r4, 0x1e
 f0 5c 20 01           stm16	[0x120], r4
 c0 23                 ldi8	r4, 0x23
 f0 5c 22 01           stm16	[0x122], r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 c7 14 01              ldi16	r7, 0x114
 d7 01                 sys	debug_break
<L0>:
 f4 59                 stsp16	[sp+0x6], r5
 01                    mov	r4, r5
 c1 03                 ldi8	r5, 0x3
 81                    and	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 c5 04 01              ldi16	r5, 0x104
 11                    add	r4, r5
 f0 6a 48              ld32	q1, [r4]
 f0 3a 00              stsp16	[sp+0x0], r2
 f0 3b 02              stsp16	[sp+0x2], r3
 f7 3e                 ld16	r6, [r7+]
 f4 62                 stsp16	[sp+0x8], r6
 f4 53                 stsp16	[sp+0x4], r7
 f2 69                 mov32	q2, q1
 d5 35                 call8	small
 f7 62                 add32	q0, q2
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 d5 7b                 call8	large
 f2 66                 mov32	q1, q2
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 22                 ldsp16	r6, [sp+0x8]
 e1 83 00              call16	full
 f4 13                 ldsp16	r7, [sp+0x4]
 f2 62                 mov32	q0, q2
 f4 19                 ldsp16	r5, [sp+0x6]
 f7 61                 add32	q0, q1
 f4 ad                 inc16	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 bc                 brne8	-0x44 <L0>
 c4 00 01              ldi16	r4, 0x100
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	0xa
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<small>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 c3 0f                 ldi8	r7, 0xf
 8b                    and	r6, r7
 f4 5a                 stsp16	[sp+0x6], r6
 ae                    xor	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 fa 1b                 lsr16v	r6, r7
 f4 42                 stsp16	[sp+0x0], r6
 09                    mov	r6, r5
 f4 1b                 ldsp16	r7, [sp+0x6]
 fa 0b                 shl16v	r6, r7
 0e                    mov	r7, r6
 f4 02                 ldsp16	r6, [sp+0x0]
 9e                    or	r7, r6
 f4 4b                 stsp16	[sp+0x2], r7
 0c                    mov	r7, r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 fa 0e                 shl16v	r7, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f1 07                 mov	r0, r7
 f1 0e                 mov	r1, r6
 09                    mov	r6, r5
 1a                    add	r6, r6
 f4 13                 ldsp16	r7, [sp+0x4]
 fa 0b                 shl16v	r6, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 fa 13                 lsr16v	r4, r7
 92                    or	r4, r6
 09                    mov	r6, r5
 fa 1b                 lsr16v	r6, r7
 f1 14                 mov	r2, r4
 f1 1e                 mov	r3, r6
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 fa 27                 asr16v	r5, r7
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<large>:
 b1                    push16	r1
 b0                    push16	r0
 c3 0f                 ldi8	r7, 0xf
 8e                    and	r7, r6
 fa 03                 shl16v	r4, r7
 09                    mov	r6, r5
 fa 1b                 lsr16v	r6, r7
 f1 0c                 mov	r1, r4
 01                    mov	r4, r5
 fa 23                 asr16v	r4, r7
 fa cf                 asr16i	r5, 0xf
 a2                    xor	r4, r6
 f9 a6                 xor	r5, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<full>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 f1 06                 mov	r0, r6
 c3 0f                 ldi8	r7, 0xf
 8b                    and	r6, r7
 f4 62                 stsp16	[sp+0x8], r6
 ae                    xor	r7, r6
 09                    mov	r6, r5
 1a                    add	r6, r6
 fa 0b                 shl16v	r6, r7
 f4 5a                 stsp16	[sp+0x6], r6
 08                    mov	r6, r4
 f4 8e                 lsr16.1	r6
 fa 1b                 lsr16v	r6, r7
 f4 4a                 stsp16	[sp+0x2], r6
 0d                    mov	r7, r5
 f4 22                 ldsp16	r6, [sp+0x8]
 fa 0e                 shl16v	r7, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 9e                    or	r7, r6
 f4 53                 stsp16	[sp+0x4], r7
 0c                    mov	r7, r4
 f4 22                 ldsp16	r6, [sp+0x8]
 fa 1e                 lsr16v	r7, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 9e                    or	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 01 10              ldi8	r1, 0x10
 f9 20                 and	r1, r0
 f4 23                 ldsp16	r7, [sp+0x8]
 fa 03                 shl16v	r4, r7
 09                    mov	r6, r5
 fa 1b                 lsr16v	r6, r7
 f4 4a                 stsp16	[sp+0x2], r6
 09                    mov	r6, r5
 fa 2b                 asr16v	r6, r7
 fa cf                 asr16i	r5, 0xf
 f4 a1                 tst8	r1
 f4 1b                 ldsp16	r7, [sp+0x6]
 fb 7e                 cmov.ne	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 fb 75                 cmov.ne	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 11                 ldsp16	r5, [sp+0x4]
 fb 6c                 cmov.ne	r5, r4
 f2 30                 sub	r0, r0
 fb 60                 cmov.ne	r4, r0
 f4 a1                 tst8	r1
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 1b                 ldsp16	r7, [sp+0x6]
 fb 7e                 cmov.ne	r7, r6
 fb 70                 cmov.ne	r6, r0
 f1 14                 mov	r2, r4
 f1 1d                 mov	r3, r5
 f9 5e                 xor	r2, r7
 f9 7a                 xor	r3, r6
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 01                 ldsp16	r5, [sp+0x0]
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
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
