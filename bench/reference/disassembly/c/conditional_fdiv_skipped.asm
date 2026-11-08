
conditional_fdiv_skipped.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fa                 adjsp	-0x6
 c5 84 01              ldi16	r5, 0x184
 f2 4b                 sub	r3, r3
 f1 13                 mov	r2, r3
<L0>:
 f4 49                 stsp16	[sp+0x2], r5
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 aa                    xor	r6, r6
 c7 00 3d              ldi16	r7, 0x3d00
 ff 02                 fmul
 c7 80 3f              ldi16	r7, 0x3f80
 ff 00                 fadd
 f1 2b                 mov	r6, r3
 c7 c4 01              ldi16	r7, 0x1c4
 1b                    add	r6, r7
 f0 6b 8c              st32	[r6], q2
 f2 68                 mov32	q2, q0
 aa                    xor	r6, r6
 c7 80 3c              ldi16	r7, 0x3c80
 ff 02                 fmul
 c7 c0 3f              ldi16	r7, 0x3fc0
 ff 00                 fadd
 c7 00 01              ldi16	r7, 0x100
 f1 2b                 mov	r6, r3
 1b                    add	r6, r7
 f0 6b 8c              st32	[r6], q2
 f4 09                 ldsp16	r5, [sp+0x2]
 a0                    xor	r4, r4
 f7 4c                 st16	[r5+], r4
 f4 aa                 inc16	r2
 f0 0b 04              addi.s8	r3, 0x4
 c0 80                 ldi8	r4, 0x80
 f5 1c                 cmp	r3, r4
 d1 bc                 brne8	-0x44 <L0>
 a0                    xor	r4, r4
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 04                    mov	r5, r4
<L1>:
 f4 41                 stsp16	[sp+0x0], r5
 f0 07 84 01           ldi16	r3, 0x184
 f2 42                 sub	r2, r2
<L2>:
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f1 22                 mov	r4, r2
 c5 c4 01              ldi16	r5, 0x1c4
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 f1 2a                 mov	r6, r2
 1b                    add	r6, r7
 f0 6a cc              ld32	q3, [r6]
 f0 6c 17              ld16	r0, [r3+]
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 d5 33                 call8	conditional_division
 d6 02                 adjsp	0x2
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 00                 fadd
 c7 00 01              ldi16	r7, 0x100
 f2 62                 mov32	q0, q2
 c0 80                 ldi8	r4, 0x80
 f0 0a 04              addi.s8	r2, 0x4
 f5 14                 cmp	r2, r4
 d1 c9                 brne8	-0x37 <L2>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 d1 b6                 brne8	-0x4a <L1>
 c4 80 01              ldi16	r4, 0x180
 f0 6b 08              st32	[r4], q0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 06                 adjsp	0x6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<conditional_division>:
 b1                    push16	r1
 b0                    push16	r0
 f0 30 07              ldsp16	r0, [sp+0x7]
 f6 28                 tst16	r0
 d0 05                 breq8	0x5 <L0>
 ff 03                 fdiv
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret
<L0>:
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
