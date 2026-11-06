
switch.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c5 5a 5a              ldi16	r5, 0x5a5a
 f0 04 00 02           ldi16	r0, 0x200
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 f0 02 07              ldi8	r2, 0x7
 f1 19                 mov	r3, r1
<L0>:
 f1 21                 mov	r4, r1
 f9 88                 and	r4, r2
 d5 1f                 call8	dense_dispatch
 04                    mov	r5, r4
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 d5 5a                 call8	sparse_dispatch
 04                    mov	r5, r4
 f4 a9                 inc16	r1
 f0 0b 25              addi.s8	r3, 0x25
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 e7                 brne8	-0x19 <L0>
 f0 5d 00 01           stm16	[0x100], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<dense_dispatch>:
 cc 04                 cmpi.s8	r4, 0x4
 d9 0c                 brsge8	0xc <L0>
 cc 02                 cmpi.s8	r4, 0x2
 d9 14                 brsge8	0x14 <L1>
 f4 a4                 tst8	r4
 d1 23                 brne8	0x23 <L3>
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 ef                    ret
<L0>:
 cc 06                 cmpi.s8	r4, 0x6
 d9 11                 brsge8	0x11 <L2>
 cc 04                 cmpi.s8	r4, 0x4
 d1 1b                 brne8	0x1b <L4>
 f4 8d                 lsr16.1	r5
 01                    mov	r4, r5
 ef                    ret
<L1>:
 cc 02                 cmpi.s8	r4, 0x2
 d1 19                 brne8	0x19 <L5>
 c4 aa 55              ldi16	r4, 0x55aa
 d4 1a                 jmp8	0x1a <L7>
<L2>:
 cc 06                 cmpi.s8	r4, 0x6
 d1 13                 brne8	0x13 <L6>
 c4 7f 7f              ldi16	r4, 0x7f7f
 84                    and	r5, r4
 01                    mov	r4, r5
 ef                    ret
<L3>:
 c9 fd                 addi.s8	r5, -0x3
 01                    mov	r4, r5
 ef                    ret
<L4>:
 c4 01 01              ldi16	r4, 0x101
 94                    or	r5, r4
 01                    mov	r4, r5
 ef                    ret
<L5>:
 15                    add	r5, r5
 01                    mov	r4, r5
 ef                    ret
<L6>:
 c4 ff ff              ldi16	r4, 0xffff
<L7>:
 a4                    xor	r5, r4
 01                    mov	r4, r5
 ef                    ret

<sparse_dispatch>:
 cc 40                 cmpi.s8	r4, 0x40
 d3 12                 brslt8	0x12 <L0>
 cc 40                 cmpi.s8	r4, 0x40
 d0 1c                 breq8	0x1c <L2>
 cc 7f                 cmpi.s8	r4, 0x7f
 d0 1c                 breq8	0x1c <L3>
 c2 c8                 ldi8	r6, 0xc8
 32                    cmp	r4, r6
 d1 1a                 brne8	0x1a <L4>
 01                    mov	r4, r5
 fa 35                 lsl16i	r4, 0x5
 d4 0b                 jmp8	0xb <L1>
<L0>:
 cc 03                 cmpi.s8	r4, 0x3
 d0 14                 breq8	0x14 <L5>
 cc 13                 cmpi.s8	r4, 0x13
 d1 0d                 brne8	0xd <L4>
 c4 34 12              ldi16	r4, 0x1234
<L1>:
 a4                    xor	r5, r4
 01                    mov	r4, r5
 ef                    ret
<L2>:
 c9 e3                 addi.s8	r5, -0x1d
 01                    mov	r4, r5
 ef                    ret
<L3>:
 01                    mov	r4, r5
 fa 73                 lsr16i	r4, 0x3
<L4>:
 14                    add	r5, r4
 01                    mov	r4, r5
 ef                    ret
<L5>:
 c9 11                 addi.s8	r5, 0x11
 01                    mov	r4, r5
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
