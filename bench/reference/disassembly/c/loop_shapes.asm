
loop_shapes.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f0 04 02 01           ldi16	r0, 0x102
 f0 01 01              ldi8	r1, 0x1
 a5                    xor	r5, r5
 c3 20                 ldi8	r7, 0x20
<L0>:
 09                    mov	r6, r5
 c0 39                 ldi8	r4, 0x39
 f3 18                 mulu8.w	r6, r4
 fa 99                 lsr16i	r6, 0x9
 c0 09                 ldi8	r4, 0x9
 f3 18                 mulu8.w	r6, r4
 01                    mov	r4, r5
 22                    sub	r4, r6
 21                    sub	r4, r5
 f2 21                 add	r4, r1
 f0 6d 81              st8	[r0+], r4
 f4 ad                 inc16	r5
 f4 a9                 inc16	r1
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 e3                 brne8	-0x1d <L0>
 c4 22 01              ldi16	r4, 0x122
 c1 05                 ldi8	r5, 0x5
 c2 80                 ldi8	r6, 0x80
<L1>:
 f6 05                 st8	[r4+], r5
 c9 0d                 addi.s8	r5, 0xd
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	-0xa <L1>
 af                    xor	r7, r7
 d7 01                 sys	debug_break
 07                    mov	r5, r7
 d4 08                 jmp8	0x8 <L3>
<L2>:
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 d0 4e                 breq8	0x4e <L8>
<L3>:
 f4 41                 stsp16	[sp+0x0], r5
 a5                    xor	r5, r5
 f1 1d                 mov	r3, r5
 d4 09                 jmp8	0x9 <L5>
<L4>:
 f0 0b 03              addi.s8	r3, 0x3
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 d0 e8                 breq8	-0x18 <L2>
<L5>:
 09                    mov	r6, r5
 c4 02 01              ldi16	r4, 0x102
 18                    add	r6, r4
 f5 3a                 ld8u	r2, [r6]
 f4 a2                 tst8	r2
 d0 ec                 breq8	-0x14 <L4>
 f1 02                 mov	r0, r2
 f2 03                 add	r0, r3
 c4 22 01              ldi16	r4, 0x122
 d4 06                 jmp8	0x6 <L7>
<L6>:
 f4 b0                 dec16	r0
 f4 a2                 tst8	r2
 d0 dd                 breq8	-0x23 <L4>
<L7>:
 f1 28                 mov	r6, r0
 f1 76                 zext8	r6
 18                    add	r6, r4
 f4 b2                 dec16	r2
 f5 39                 ld8u	r1, [r6]
 c2 07                 ldi8	r6, 0x7
 f9 c4                 and	r6, r1
 f4 a6                 tst8	r6
 d0 e9                 breq8	-0x17 <L6>
 f2 2d                 add	r7, r1
 c2 f0                 ldi8	r6, 0xf0
 f5 29                 cmp	r6, r1
 d8 e1                 bruge8	-0x1f <L6>
 f0 0b 03              addi.s8	r3, 0x3
 f4 ad                 inc16	r5
 cd 20                 cmpi.s8	r5, 0x20
 d1 c4                 brne8	-0x3c <L5>
 d4 aa                 jmp8	-0x56 <L2>
<L8>:
 f0 5f 00 01           stm16	[0x100], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
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
