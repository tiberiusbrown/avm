
multiply.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 03 01              ldi8	r3, 0x1
 f0 05 01 01           ldi16	r1, 0x101
 f0 06 82 01           ldi16	r2, 0x182
 c7 c2 01              ldi16	r7, 0x1c2
 c6 00 01              ldi16	r6, 0x100
 f0 00 f1              ldi8	r0, 0xf1
 a5                    xor	r5, r5
<L0>:
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c0 09                 ldi8	r4, 0x9
 09                    mov	r6, r5
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 0d                    mov	r7, r5
 2e                    sub	r7, r6
 c0 fe                 ldi8	r4, 0xfe
 83                    and	r4, r7
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 8c                 lsr16.1	r4
 12                    add	r4, r6
 fa 74                 lsr16i	r4, 0x4
 c2 1f                 ldi8	r6, 0x1f
 f3 12                 mulu8.w	r4, r6
 09                    mov	r6, r5
 28                    sub	r6, r4
 29                    sub	r6, r5
 f2 28                 add	r6, r0
 f0 6d c5              st8	[r2+], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ad                 inc16	r5
 f4 a8                 inc16	r0
 f6 1b                 st8	[r7+], r3
 f0 0b 03              addi.s8	r3, 0x3
 f7 51                 st16	[r6+], r1
 f0 09 13              addi.s8	r1, 0x13
 c4 c1 05              ldi16	r4, 0x5c1
 f5 0c                 cmp	r1, r4
 d1 c6                 brne8	-0x3a <L0>
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 c7 00 01              ldi16	r7, 0x100
 04                    mov	r5, r4
 08                    mov	r6, r4
<L1>:
 f4 42                 stsp16	[sp+0x0], r6
 f1 17                 mov	r2, r7
 f2 30                 sub	r0, r0
 f1 18                 mov	r3, r0
<L2>:
 f4 49                 stsp16	[sp+0x2], r5
 f1 28                 mov	r6, r0
 ca 05                 addi.s8	r6, 0x5
 c0 3f                 ldi8	r4, 0x3f
 88                    and	r6, r4
 1a                    add	r6, r6
 1b                    add	r6, r7
 f5 49                 ld16	r1, [r6]
 f0 6c d5              ld16	r6, [r2+]
 fe 0e                 mul16	r1, r6
 f1 28                 mov	r6, r0
 ca 03                 addi.s8	r6, 0x3
 88                    and	r6, r4
 c7 c2 01              ldi16	r7, 0x1c2
 1b                    add	r6, r7
 f4 ab                 inc16	r3
 f9 8c                 and	r4, r3
 c7 82 01              ldi16	r7, 0x182
 13                    add	r4, r7
 f2 07                 add	r0, r7
 ed a0 60              ld8u	r5, [r0+64]
 ed e8 60              ld8u	r7, [r4+64]
 f3 1d                 mulu8.w	r7, r5
 46                    ld8u	r5, [r6]
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 11                    add	r4, r5
 ed a0 20              ld8u	r5, [r0+0]
 f6 45                 sext8	r5
 fe 25                 mul16	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 13                    add	r4, r7
 c7 00 01              ldi16	r7, 0x100
 f2 21                 add	r4, r1
 f0 0f 40              cmpi.s8	r3, 0x40
 f1 03                 mov	r0, r3
 04                    mov	r5, r4
 d1 b6                 brne8	-0x4a <L2>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 ce 08                 cmpi.s8	r6, 0x8
 04                    mov	r5, r4
 d1 a5                 brne8	-0x5b <L1>
 f0 5c 80 01           stm16	[0x180], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
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
