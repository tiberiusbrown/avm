
byte_phi_stream.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 f0 48 02 01           stm8	[0x102], r0
 c0 25                 ldi8	r4, 0x25
 f0 4c 03 01           stm8	[0x103], r4
 c0 4a                 ldi8	r4, 0x4a
 f0 4c 04 01           stm8	[0x104], r4
 c0 6f                 ldi8	r4, 0x6f
 f0 4c 05 01           stm8	[0x105], r4
 c0 94                 ldi8	r4, 0x94
 f0 4c 06 01           stm8	[0x106], r4
 c0 b9                 ldi8	r4, 0xb9
 f0 4c 07 01           stm8	[0x107], r4
 c0 de                 ldi8	r4, 0xde
 f0 4c 08 01           stm8	[0x108], r4
 c0 03                 ldi8	r4, 0x3
 f0 4c 09 01           stm8	[0x109], r4
 f0 01 80              ldi8	r1, 0x80
 d7 01                 sys	debug_break
<L0>:
 d5 16                 call8	scan_ram
 f2 04                 add	r0, r4
 d5 2f                 call8	scan_program
 f2 04                 add	r0, r4
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f2                 brne8	-0xe <L0>
 f0 58 00 01           stm16	[0x100], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<scan_ram>:
 b0                    push16	r0
 c2 ff                 ldi8	r6, 0xff
 a5                    xor	r5, r5
 f0 04 02 01           ldi16	r0, 0x102
 01                    mov	r4, r5
 c3 07                 ldi8	r7, 0x7
<L0>:
 ce 20                 cmpi.s8	r6, 0x20
 f8 16                 cset.ult	r6
 12                    add	r4, r6
 09                    mov	r6, r5
 8b                    and	r6, r7
 f2 28                 add	r6, r0
 4a                    ld8u	r6, [r6]
 f4 ad                 inc16	r5
 cd 41                 cmpi.s8	r5, 0x41
 d1 f0                 brne8	-0x10 <L0>
 b8                    pop16	r0
 ef                    ret

<scan_program>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c3 ff                 ldi8	r7, 0xff
 a5                    xor	r5, r5
 c2 07                 ldi8	r6, 0x7
 f0 04 41 0e           ldi16	r0, 0xe41
 f0 01 00              ldi8	r1, 0x0
 01                    mov	r4, r5
<L0>:
 cf 20                 cmpi.s8	r7, 0x20
 f8 17                 cset.ult	r7
 13                    add	r4, r7
 0d                    mov	r7, r5
 8e                    and	r7, r6
 f1 17                 mov	r2, r7
 f2 4b                 sub	r3, r3
 f7 64                 add32	q1, q0
 f0 60 e4              ldp8u	r7, [q1]
 f4 ad                 inc16	r5
 cd 41                 cmpi.s8	r5, 0x41
 d1 ea                 brne8	-0x16 <L0>
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
