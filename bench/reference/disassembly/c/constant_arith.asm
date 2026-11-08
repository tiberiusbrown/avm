
constant_arith.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	-0xa
 c4 02 01              ldi16	r4, 0x102
 c6 63 0e              ldi16	r6, 0xe63
 c3 00                 ldi8	r7, 0x0
 c1 80                 ldi8	r5, 0x80
 d7 10                 sys	memcpy_p
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 01 0a              ldi8	r1, 0xa
 08                    mov	r6, r4
<L0>:
 f4 42                 stsp16	[sp+0x0], r6
 f0 02 40              ldi8	r2, 0x40
 c6 02 01              ldi16	r6, 0x102
<L1>:
 f7 35                 ld16	r5, [r6+]
 f4 62                 stsp16	[sp+0x8], r6
 09                    mov	r6, r5
 1a                    add	r6, r6
 19                    add	r6, r5
 18                    add	r6, r4
 01                    mov	r4, r5
 10                    add	r4, r4
 10                    add	r4, r4
 11                    add	r4, r5
 a2                    xor	r4, r6
 09                    mov	r6, r5
 f0 00 07              ldi8	r0, 0x7
 fe 30                 mul16	r6, r0
 18                    add	r6, r4
 01                    mov	r4, r5
 fe 21                 mul16	r4, r1
 a2                    xor	r4, r6
 c2 1f                 ldi8	r6, 0x1f
 0d                    mov	r7, r5
 fe 3e                 mul16	r7, r6
 1c                    add	r7, r4
 f4 53                 stsp16	[sp+0x4], r7
 0d                    mov	r7, r5
 ec 39                 udiv16	r7, r1
 c6 f6 ff              ldi16	r6, 0xfff6
 03                    mov	r4, r7
 fe 26                 mul16	r4, r6
 11                    add	r4, r5
 13                    add	r4, r7
 f4 58                 stsp16	[sp+0x6], r4
 c2 05                 ldi8	r6, 0x5
 01                    mov	r4, r5
 ec 26                 udiv16	r4, r6
 c6 fb ff              ldi16	r6, 0xfffb
 0c                    mov	r7, r4
 fe 3e                 mul16	r7, r6
 1d                    add	r7, r5
 1c                    add	r7, r4
 f4 4b                 stsp16	[sp+0x2], r7
 c2 03                 ldi8	r6, 0x3
 01                    mov	r4, r5
 ec 26                 udiv16	r4, r6
 f1 19                 mov	r3, r1
 f0 04 fd ff           ldi16	r0, 0xfffd
 08                    mov	r6, r4
 fe 30                 mul16	r6, r0
 19                    add	r6, r5
 18                    add	r6, r4
 01                    mov	r4, r5
 fa 38                 lsl16i	r4, 0x8
 11                    add	r4, r5
 f4 13                 ldsp16	r7, [sp+0x4]
 a3                    xor	r4, r7
 f0 05 00 80           ldi16	r1, 0x8000
 f9 36                 xor	r1, r5
 f1 01                 mov	r0, r1
 c3 05                 ldi8	r7, 0x5
 ec c7                 srem16	r0, r7
 c3 03                 ldi8	r7, 0x3
 ec 8f                 sdiv16	r1, r7
 0d                    mov	r7, r5
 f4 8f                 lsr16.1	r7
 27                    sub	r5, r7
 14                    add	r5, r4
 a6                    xor	r5, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 08                 ldsp16	r4, [sp+0x2]
 14                    add	r5, r4
 f4 18                 ldsp16	r4, [sp+0x6]
 a4                    xor	r5, r4
 f2 25                 add	r5, r1
 f9 a2                 xor	r5, r0
 f1 0b                 mov	r1, r3
 f4 b2                 dec16	r2
 f6 2a                 tst16	r2
 01                    mov	r4, r5
 d1 82                 brne8	-0x7e <L1>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 ce 20                 cmpi.s8	r6, 0x20
 01                    mov	r4, r5
 db 70 ff              brne16	-0x90 <L0>
 f0 5d 00 01           stm16	[0x100], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
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
