
aggregate_return.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ef                 adjsp	-0x11
 d7 01                 sys	debug_break
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 07                 ldi8	r4, 0x7
 f0 2c 10              stsp8	[sp+0x10], r4
 c4 aa 55              ldi16	r4, 0x55aa
 f4 78                 stsp16	[sp+0xe], r4
 f0 54 00 01           ldm16	r4, [0x100]
 f4 70                 stsp16	[sp+0xc], r4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c1 03                 ldi8	r5, 0x3
 c4 03 01              ldi16	r4, 0x103
 f4 58                 stsp16	[sp+0x6], r4
<L0>:
 f4 41                 stsp16	[sp+0x0], r5
 f0 14 08              leasp	r4, 0x8
 d5 42                 call8	advance
 f4 30                 ldsp16	r4, [sp+0xc]
 08                    mov	r6, r4
 af                    xor	r7, r7
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f7 6e                 add32	q3, q2
 f0 31 0e              ldsp16	r1, [sp+0xe]
 f1 01                 mov	r0, r1
 f2 39                 sub	r1, r1
 f7 63                 add32	q0, q3
 f0 1e 10              ldsp8u	r6, [sp+0x10]
 af                    xor	r7, r7
 f7 6c                 add32	q3, q0
 f9 5a                 xor	r2, r6
 f9 7e                 xor	r3, r7
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 f4 18                 ldsp16	r4, [sp+0x6]
 34                    cmp	r5, r4
 d1 cf                 brne8	-0x31 <L0>
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 f9 8a                 xor	r4, r2
 f9 ae                 xor	r5, r3
 c6 02 01              ldi16	r6, 0x102
 f0 6b 8c              st32	[r6], q2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 11                 adjsp	0x11
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<advance>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f1 0d                 mov	r1, r5
 f1 04                 mov	r0, r4
 ed 50 24              ld16	r2, [r0+4]
 f1 22                 mov	r4, r2
 e1 df 0a              call16	__avm_umulhisi3
 f0 6a c0              ld32	q3, [r0]
 f7 6e                 add32	q3, q2
 f2 11                 add	r2, r1
 ed 80 28              ld8u	r4, [r0+8]
 f2 14                 add	r2, r4
 f2 21                 add	r4, r1
 ee 80 28              st8	[r0+8], r4
 ee 50 24              st16	[r0+4], r2
 f0 6b c0              st32	[r0], q3
 02                    mov	r4, r6
 fa 79                 lsr16i	r4, 0x9
 f4 40                 stsp16	[sp+0x0], r4
 03                    mov	r4, r7
 fa 37                 lsl16i	r4, 0x7
 f4 01                 ldsp16	r5, [sp+0x0]
 91                    or	r4, r5
 ed b0 26              ld16	r5, [r0+6]
 a4                    xor	r5, r4
 ee b0 26              st16	[r0+6], r5
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
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
