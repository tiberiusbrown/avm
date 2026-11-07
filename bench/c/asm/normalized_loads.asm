
normalized_loads.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 05 02 01           ldi16	r1, 0x102
 f1 21                 mov	r4, r1
 c6 72 0e              ldi16	r6, 0xe72
 c3 00                 ldi8	r7, 0x0
 c1 20                 ldi8	r5, 0x20
 d7 10                 sys	memcpy_p
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 c2 1f                 ldi8	r6, 0x1f
 c3 03                 ldi8	r7, 0x3
 f0 06 46 0e           ldi16	r2, 0xe46
 f0 03 00              ldi8	r3, 0x0
 01                    mov	r4, r5
 f1 05                 mov	r0, r5
<L0>:
 f0 38 00              stsp16	[sp+0x0], r0
 f2 30                 sub	r0, r0
 f4 48                 stsp16	[sp+0x2], r4
<L1>:
 f4 08                 ldsp16	r4, [sp+0x2]
 f2 20                 add	r4, r0
 82                    and	r4, r6
 f2 21                 add	r4, r1
 40                    ld8u	r4, [r4]
 f4 02                 ldsp16	r6, [sp+0x0]
 18                    add	r6, r4
 8b                    and	r6, r7
 0e                    mov	r7, r6
 1f                    add	r7, r7
 1e                    add	r7, r6
 0b                    mov	r6, r7
 af                    xor	r7, r7
 f7 6d                 add32	q3, q1
 f0 63 4c              ldp24	q1, [q3]
 d5 3f                 call8	mix_byte
 f1 0c                 mov	r1, r4
 f1 28                 mov	r6, r0
 f2 69                 mov32	q2, q1
 f0 06 46 0e           ldi16	r2, 0xe46
 f0 03 00              ldi8	r3, 0x0
 d5 35                 call8	read_page
 c3 03                 ldi8	r7, 0x3
 c2 1f                 ldi8	r6, 0x1f
 04                    mov	r5, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f1 75                 zext8	r5
 f2 25                 add	r5, r1
 f0 05 02 01           ldi16	r1, 0x102
 f4 a8                 inc16	r0
 f0 0c 20              cmpi.s8	r0, 0x20
 d1 c3                 brne8	-0x3d <L1>
 f4 ac                 inc16	r4
 f0 30 00              ldsp16	r0, [sp+0x0]
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 b0                 brne8	-0x50 <L0>
 f0 5d 00 01           stm16	[0x100], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<mix_byte>:
 09                    mov	r6, r5
 1a                    add	r6, r6
 19                    add	r6, r5
 12                    add	r4, r6
 ef                    ret

<read_page>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 07              ldi8	r0, 0x7
 f2 39                 sub	r1, r1
 f9 18                 and	r0, r6
 f7 62                 add32	q0, q2
 f0 60 80              ldp8u	r4, [q0]
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
