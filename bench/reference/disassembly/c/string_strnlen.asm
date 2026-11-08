
string_strnlen.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f2 30                 sub	r0, r0
 f0 03 20              ldi8	r3, 0x20
 d7 01                 sys	debug_break
<L0>:
 f0 3b 00              stsp16	[sp+0x0], r3
 f0 07 02 01           ldi16	r3, 0x102
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 05 05 01           ldi16	r1, 0x105
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 eb                    callp	q3
 f1 14                 mov	r2, r4
 f2 10                 add	r2, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 21                 mov	r4, r1
 c1 08                 ldi8	r5, 0x8
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 02                 add	r0, r2
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 21                 mov	r4, r1
 c1 20                 ldi8	r5, 0x20
 eb                    callp	q3
 f1 14                 mov	r2, r4
 f2 10                 add	r2, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 05 25 01           ldi16	r1, 0x125
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 02                 add	r0, r2
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 21                 mov	r4, r1
 c1 08                 ldi8	r5, 0x8
 eb                    callp	q3
 f1 14                 mov	r2, r4
 f2 10                 add	r2, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 21                 mov	r4, r1
 c1 20                 ldi8	r5, 0x20
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 02                 add	r0, r2
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 05 45 01           ldi16	r1, 0x145
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 eb                    callp	q3
 f1 14                 mov	r2, r4
 f2 10                 add	r2, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 21                 mov	r4, r1
 c1 08                 ldi8	r5, 0x8
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 02                 add	r0, r2
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 21                 mov	r4, r1
 c1 20                 ldi8	r5, 0x20
 eb                    callp	q3
 f1 14                 mov	r2, r4
 f2 10                 add	r2, r0
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f0 05 65 01           ldi16	r1, 0x165
 f1 21                 mov	r4, r1
 a5                    xor	r5, r5
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f2 02                 add	r0, r2
 f1 23                 mov	r4, r3
 f7 26                 ld16	r6, [r4+]
 4c                    ld8u	r7, [r4]
 f1 21                 mov	r4, r1
 c1 08                 ldi8	r5, 0x8
 eb                    callp	q3
 f1 14                 mov	r2, r4
 f2 10                 add	r2, r0
 f0 6c d7              ld16	r6, [r3+]
 ed e6 20              ld8u	r7, [r3+0]
 f1 21                 mov	r4, r1
 c1 20                 ldi8	r5, 0x20
 eb                    callp	q3
 f1 04                 mov	r0, r4
 f0 33 00              ldsp16	r3, [sp+0x0]
 f2 02                 add	r0, r2
 f4 b3                 dec16	r3
 f4 a3                 tst8	r3
 db 3a ff              brne16	-0xc6 <L0>
 f0 58 00 01           stm16	[0x100], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<strnlen>:
 08                    mov	r6, r4
 a0                    xor	r4, r4
 f6 2d                 tst16	r5
 d0 0c                 breq8	0xc <L1>
<L0>:
 f7 17                 ld8u	r7, [r6+]
 f4 a7                 tst8	r7
 d0 06                 breq8	0x6 <L1>
 f4 ac                 inc16	r4
 34                    cmp	r5, r4
 d1 f5                 brne8	-0xb <L0>
 01                    mov	r4, r5
<L1>:
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
