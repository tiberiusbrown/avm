
virtual_dispatch.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 c0 25                 ldi8	r4, 0x25
 f4 60                 stsp16	[sp+0x8], r4
 c4 2b 0e              ldi16	r4, 0xe2b
 c1 00                 ldi8	r5, 0x0
 f4 54                 stsp16	[sp+0x5], r4
 f1 4d                 stsp8	[sp+0x7], r5
 c4 aa 55              ldi16	r4, 0x55aa
 f4 4c                 stsp16	[sp+0x3], r4
 c4 34 0e              ldi16	r4, 0xe34
 c1 00                 ldi8	r5, 0x0
 f4 40                 stsp16	[sp+0x0], r4
 f1 39                 stsp8	[sp+0x2], r5
 f0 14 00              leasp	r4, 0x0
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 70                 stsp16	[sp+0xc], r4
 f0 14 05              leasp	r4, 0x5
 f4 78                 stsp16	[sp+0xe], r4
 f4 68                 stsp16	[sp+0xa], r4
 c5 34 12              ldi16	r5, 0x1234
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 01 03              ldi8	r1, 0x3
 f0 06 00 02           ldi16	r2, 0x200
<L0>:
 f1 20                 mov	r4, r0
 a1                    xor	r4, r5
 f9 84                 and	r4, r1
 10                    add	r4, r4
 f0 16 0a              leasp	r6, 0xa
 18                    add	r6, r4
 62                    ld16	r4, [r6]
 d5 14                 call8	_ZL6invokePK9Operationj
 04                    mov	r5, r4
 f4 a8                 inc16	r0
 f5 02                 cmp	r0, r2
 d1 ec                 brne8	-0x14 <L0>
 f0 5d 00 01           stm16	[0x100], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<invoke(Operation const*, unsigned int)>:
 b1                    push16	r1
 b0                    push16	r0
 08                    mov	r6, r4
 f7 30                 ld16	r0, [r6+]
 f5 39                 ld8u	r1, [r6]
 f0 63 c0              ldp24	q3, [q0]
 b8                    pop16	r0
 b9                    pop16	r1
 e7                    jmpp	q3

<Add::apply(unsigned int) const>:
 ed 98 23              ld16	r4, [r4+3]
 11                    add	r4, r5
 ef                    ret
 00                    nop

<Mix::apply(unsigned int) const>:
 ed 98 23              ld16	r4, [r4+3]
 a1                    xor	r4, r5
 fa 83                 lsr16i	r5, 0x3
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
