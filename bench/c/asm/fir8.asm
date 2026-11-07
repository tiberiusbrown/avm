
fir8.elf:	file format elf32-avm

Disassembly of section .text:

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e0                 adjsp	-0x20
 f0 04 12 01           ldi16	r0, 0x112
 c3 07                 ldi8	r7, 0x7
 c2 60                 ldi8	r6, 0x60
 c0 7f                 ldi8	r4, 0x7f
<L0>:
 07                    mov	r5, r7
 84                    and	r5, r4
 c9 c0                 addi.s8	r5, -0x40
 f0 6d a1              st8	[r0+], r5
 cb 13                 addi.s8	r7, 0x13
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f1                 brne8	-0xf <L0>
 c4 02 01              ldi16	r4, 0x102
 c6 14 0f              ldi16	r6, 0xf14
 c3 00                 ldi8	r7, 0x0
 c1 10                 ldi8	r5, 0x10
 d7 10                 sys	memcpy_p
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f0 44 11 01           ldm8u	r4, [0x111]
 f6 44                 sext8	r4
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 44 10 01           ldm8u	r4, [0x110]
 f6 44                 sext8	r4
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 44 0f 01           ldm8u	r4, [0x10f]
 f6 44                 sext8	r4
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 44 0e 01           ldm8u	r4, [0x10e]
 f6 44                 sext8	r4
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 44 0d 01           ldm8u	r4, [0x10d]
 f6 44                 sext8	r4
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 44 0c 01           ldm8u	r4, [0x10c]
 f6 44                 sext8	r4
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 44 0b 01           ldm8u	r4, [0x10b]
 f6 44                 sext8	r4
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 44 0a 01           ldm8u	r4, [0x10a]
 f6 44                 sext8	r4
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 44 09 01           ldm8u	r4, [0x109]
 f6 44                 sext8	r4
 f4 78                 stsp16	[sp+0xe], r4
 f0 44 08 01           ldm8u	r4, [0x108]
 f6 44                 sext8	r4
 f4 70                 stsp16	[sp+0xc], r4
 f0 44 07 01           ldm8u	r4, [0x107]
 f6 44                 sext8	r4
 f4 68                 stsp16	[sp+0xa], r4
 f0 44 06 01           ldm8u	r4, [0x106]
 f6 44                 sext8	r4
 f4 60                 stsp16	[sp+0x8], r4
 f0 44 05 01           ldm8u	r4, [0x105]
 f6 44                 sext8	r4
 f4 58                 stsp16	[sp+0x6], r4
 f0 44 04 01           ldm8u	r4, [0x104]
 f6 44                 sext8	r4
 f4 50                 stsp16	[sp+0x4], r4
 f0 44 03 01           ldm8u	r4, [0x103]
 f6 44                 sext8	r4
 f0 45 02 01           ldm8u	r5, [0x102]
 f6 45                 sext8	r5
 f0 05 12 01           ldi16	r1, 0x112
 f0 06 52 01           ldi16	r2, 0x152
 f1 18                 mov	r3, r0
 f4 48                 stsp16	[sp+0x2], r4
 f4 41                 stsp16	[sp+0x0], r5
<L1>:
 f1 29                 mov	r6, r1
<L2>:
 4e                    ld8u	r7, [r6]
 01                    mov	r4, r5
 f3 23                 muls8.w	r4, r7
 ed ec 21              ld8u	r7, [r6+1]
 f4 09                 ldsp16	r5, [sp+0x2]
 f3 27                 muls8.w	r5, r7
 14                    add	r5, r4
 ed 8c 22              ld8u	r4, [r6+2]
 f4 13                 ldsp16	r7, [sp+0x4]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 23              ld8u	r4, [r6+3]
 f4 19                 ldsp16	r5, [sp+0x6]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 24              ld8u	r4, [r6+4]
 f4 23                 ldsp16	r7, [sp+0x8]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 25              ld8u	r4, [r6+5]
 f4 29                 ldsp16	r5, [sp+0xa]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 26              ld8u	r4, [r6+6]
 f4 33                 ldsp16	r7, [sp+0xc]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 27              ld8u	r4, [r6+7]
 f4 39                 ldsp16	r5, [sp+0xe]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 28              ld8u	r4, [r6+8]
 f0 37 10              ldsp16	r7, [sp+0x10]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 29              ld8u	r4, [r6+9]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 2a              ld8u	r4, [r6+10]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 2b              ld8u	r4, [r6+11]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 2c              ld8u	r4, [r6+12]
 f0 37 18              ldsp16	r7, [sp+0x18]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 2d              ld8u	r4, [r6+13]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 ed 8c 2e              ld8u	r4, [r6+14]
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 f3 2c                 muls8.w	r7, r4
 1d                    add	r7, r5
 ed 8c 2f              ld8u	r4, [r6+15]
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f3 24                 muls8.w	r5, r4
 17                    add	r5, r7
 f2 1d                 add	r3, r5
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ae                 inc16	r6
 f5 2a                 cmp	r6, r2
 db 71 ff              brne16	-0x8f <L2>
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 db 67 ff              brne16	-0x99 <L1>
 f0 5b 00 01           stm16	[0x100], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 20                 adjsp	0x20
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
