
fixed_point.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 f2 42                 sub	r2, r2
 f0 00 80              ldi8	r0, 0x80
 c6 38 ff              ldi16	r6, 0xff38
 f0 05 fd ff           ldi16	r1, 0xfffd
 c5 00 f0              ldi16	r5, 0xf000
 c7 04 01              ldi16	r7, 0x104
 c4 00 01              ldi16	r4, 0x100
 f4 50                 stsp16	[sp+0x4], r4
 f0 03 07              ldi8	r3, 0x7
<L0>:
 ee be 1c              st16	[r7-4], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 14                    add	r5, r4
 f1 22                 mov	r4, r2
 ec 63                 urem16	r4, r3
 f2 52                 sub	r4, r2
 f2 21                 add	r4, r1
 7c                    st16	[r7], r4
 ee 1e 22              st16	[r7+2], r0
 ee de 1e              st16	[r7-2], r6
 cb 08                 addi.s8	r7, 0x8
 f4 a9                 inc16	r1
 f0 08 05              addi.s8	r0, 0x5
 f4 aa                 inc16	r2
 ca 11                 addi.s8	r6, 0x11
 c4 58 01              ldi16	r4, 0x158
 38                    cmp	r6, r4
 d1 da                 brne8	-0x26 <L0>
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 f1 15                 mov	r2, r5
 d4 08                 jmp8	0x8 <L2>
<L1>:
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 40                 cmpi.s8	r5, 0x40
 d0 64                 breq8	0x64 <L6>
<L2>:
 f4 41                 stsp16	[sp+0x0], r5
 c1 20                 ldi8	r5, 0x20
 f0 05 04 01           ldi16	r1, 0x104
 d4 17                 jmp8	0x17 <L5>
<L3>:
 c4 00 80              ldi16	r4, 0x8000
 c5 ff ff              ldi16	r5, 0xffff
 f0 69 8c              cmp32	q2, q3
 fd 26                 cmov.slt	r4, r6
<L4>:
 f4 11                 ldsp16	r5, [sp+0x4]
 f2 14                 add	r2, r4
 f9 4e                 xor	r2, r3
 f4 b5                 dec16	r5
 f4 a5                 tst8	r5
 d0 d7                 breq8	-0x29 <L1>
<L5>:
 f4 51                 stsp16	[sp+0x4], r5
 ed 92 1e              ld16	r4, [r1-2]
 ed 72 20              ld16	r3, [r1+0]
 f2 1c                 add	r3, r4
 ed 12 1c              ld16	r0, [r1-4]
 f2 03                 add	r0, r3
 ed 92 22              ld16	r4, [r1+2]
 f1 24                 mov	r5, r0
 e1 ed 0a              call16	__avm_mulhisi3
 c2 80                 ldi8	r6, 0x80
 af                    xor	r7, r7
 f7 6e                 add32	q3, q2
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 03                    mov	r4, r7
 04                    mov	r5, r4
 fa 48                 lsl16i	r5, 0x8
 f4 0a                 ldsp16	r6, [sp+0x2]
 96                    or	r5, r6
 ee 12 1c              st16	[r1-4], r0
 fa b8                 asr16i	r4, 0x8
 09                    mov	r6, r5
 0c                    mov	r7, r4
 ee 72 1e              st16	[r1-2], r3
 f0 09 08              addi.s8	r1, 0x8
 c4 ff 7f              ldi16	r4, 0x7fff
 a5                    xor	r5, r5
 f0 69 8c              cmp32	q2, q3
 d9 ab                 brsge8	-0x55 <L3>
 c4 ff 7f              ldi16	r4, 0x7fff
 d4 b1                 jmp8	-0x4f <L4>
<L6>:
 f0 5a 00 02           stm16	[0x200], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
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

<__avm_mulhisi3>:
 d6 fa                 adjsp	-0x6
 0d                    mov	r7, r5
 fa 88                 lsr16i	r5, 0x8
 f4 49                 stsp16	[sp+0x2], r5
 f1 77                 zext8	r7
 f4 43                 stsp16	[sp+0x0], r7
 04                    mov	r5, r4
 f1 75                 zext8	r5
 09                    mov	r6, r5
 f3 1b                 mulu8.w	r6, r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 f3 3d                 mulsu8.w	r7, r5
 f4 53                 stsp16	[sp+0x4], r7
 fa 78                 lsr16i	r4, 0x8
 0c                    mov	r7, r4
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 2d                 muls8.w	r7, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 31                 mulsu8.w	r4, r5
 04                    mov	r5, r4
 fa c8                 asr16i	r5, 0x8
 17                    add	r5, r7
 f4 13                 ldsp16	r7, [sp+0x4]
 fa e8                 asr16i	r7, 0x8
 1d                    add	r7, r5
 fa 38                 lsl16i	r4, 0x8
 18                    add	r6, r4
 38                    cmp	r6, r4
 f8 14                 cset.ult	r4
 13                    add	r4, r7
 f4 11                 ldsp16	r5, [sp+0x4]
 fa 48                 lsl16i	r5, 0x8
 19                    add	r6, r5
 39                    cmp	r6, r5
 f8 15                 cset.ult	r5
 14                    add	r5, r4
 02                    mov	r4, r6
 d6 06                 adjsp	0x6
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
