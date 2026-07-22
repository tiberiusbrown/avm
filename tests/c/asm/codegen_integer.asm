
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_integer.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_integer.c
000003d2 l     F .text	0000007c mix_u16
00000468 l     F .text	000000dd mix_u32
0000044e l     F .text	0000001a mix_s16
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	000002bc avm_test_main
00000545 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 2f 04              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ca                 adjsp	-0x36
 c4 e1 ac              ldi16	r4, 0xace1
 f0 3c 34              stsp16	[sp+0x34], r4
 c4 57 13              ldi16	r4, 0x1357
 f0 3c 32              stsp16	[sp+0x32], r4
 c4 60 a4              ldi16	r4, 0xa460
 f0 3c 30              stsp16	[sp+0x30], r4
 c4 3d 01              ldi16	r4, 0x13d
 f0 3c 2e              stsp16	[sp+0x2e], r4
 c4 78 56              ldi16	r4, 0x5678
 c5 34 12              ldi16	r5, 0x1234
 f0 3c 2a              stsp16	[sp+0x2a], r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 c4 f0 de              ldi16	r4, 0xdef0
 c5 bc 9a              ldi16	r5, 0x9abc
 f0 3c 26              stsp16	[sp+0x26], r4
 f0 3d 28              stsp16	[sp+0x28], r5
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 32              ldsp16	r5, [sp+0x32]
 e1 7d 02              call16	mix_u16
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 34 30              ldsp16	r4, [sp+0x30]
 f4 70                 stsp16	[sp+0xc], r4
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 34 2a              ldsp16	r4, [sp+0x2a]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f0 36 26              ldsp16	r6, [sp+0x26]
 f0 37 28              ldsp16	r7, [sp+0x28]
 e1 f6 02              call16	mix_u32
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 3d 24              stsp16	[sp+0x24], r5
 f0 02 30              ldi8	r2, 0x30
 09                    mov	r6, r5
 af                    xor	r7, r7
 f0 3e 1e              stsp16	[sp+0x1e], r6
 f0 3f 20              stsp16	[sp+0x20], r7
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c8 37                 addi.s8	r4, 0x37
 f0 3c 1c              stsp16	[sp+0x1c], r4
 c6 00 a0              ldi16	r6, 0xa000
 af                    xor	r7, r7
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 69 8c              cmp32	q2, q3
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 f0 35 1c              ldsp16	r5, [sp+0x1c]
 fc 2c                 cmov.ult	r5, r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 c2 0f                 ldi8	r6, 0xf
 f0 34 14              ldsp16	r4, [sp+0x14]
 04                    mov	r5, r4
 86                    and	r5, r6
 f1 06                 mov	r0, r6
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 08                    mov	r6, r4
 04                    mov	r5, r4
 f1 76                 zext8	r6
 02                    mov	r4, r6
 fa 74                 lsr16i	r4, 0x4
 0c                    mov	r7, r4
 f9 e9                 or	r7, r2
 c8 37                 addi.s8	r4, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 29                 cmp	r6, r1
 fc 27                 cmov.ult	r4, r7
 f4 68                 stsp16	[sp+0xa], r4
 0d                    mov	r7, r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 f1 18                 mov	r3, r0
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 0b                    mov	r6, r7
 ca 37                 addi.s8	r6, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 34                 cmov.ult	r6, r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3d                 cmov.ult	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f1 74                 zext8	r4
 04                    mov	r5, r4
 fa 84                 lsr16i	r5, 0x4
 0d                    mov	r7, r5
 f9 e9                 or	r7, r2
 c9 37                 addi.s8	r5, 0x37
 f5 21                 cmp	r4, r1
 fc 2f                 cmov.ult	r5, r7
 f4 79                 stsp16	[sp+0xe], r5
 f0 35 14              ldsp16	r5, [sp+0x14]
 0d                    mov	r7, r5
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 cb 37                 addi.s8	r7, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 24                 cmp	r5, r0
 fc 3c                 cmov.ult	r7, r4
 c0 49                 ldi8	r4, 0x49
 f0 3c 18              stsp16	[sp+0x18], r4
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 f0 3c 16              stsp16	[sp+0x16], r4
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 f0 3c 1a              stsp16	[sp+0x1a], r4
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 35 12              ldsp16	r5, [sp+0x12]
 e1 f0 01              call16	mix_s16
 f0 3c 12              stsp16	[sp+0x12], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f4 6a                 stsp16	[sp+0xa], r6
 f0 34 22              ldsp16	r4, [sp+0x22]
 04                    mov	r5, r4
 f9 ac                 and	r5, r3
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 70                 stsp16	[sp+0xc], r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 fa 78                 lsr16i	r4, 0x8
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 06                    mov	r5, r6
 fa 48                 lsl16i	r5, 0x8
 94                    or	r5, r4
 01                    mov	r4, r5
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 02                    mov	r4, r6
 fa 78                 lsr16i	r4, 0x8
 f4 48                 stsp16	[sp+0x2], r4
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 f9 11                 or	r0, r4
 f9 35                 or	r1, r5
 c3 f0                 ldi8	r7, 0xf0
 f9 e0                 and	r7, r0
 fa a4                 lsr16i	r7, 0x4
 0b                    mov	r6, r7
 f9 c9                 or	r6, r2
 cb 37                 addi.s8	r7, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f5 23                 cmp	r4, r3
 fc 3e                 cmov.ult	r7, r6
 f4 5b                 stsp16	[sp+0x6], r7
 f0 35 12              ldsp16	r5, [sp+0x12]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 c8 37                 addi.s8	r4, 0x37
 f5 27                 cmp	r5, r3
 fc 26                 cmov.ult	r4, r6
 f4 50                 stsp16	[sp+0x4], r4
 c3 0f                 ldi8	r7, 0xf
 f9 1c                 and	r0, r7
 f1 28                 mov	r6, r0
 f9 c9                 or	r6, r2
 f1 20                 mov	r4, r0
 c8 37                 addi.s8	r4, 0x37
 f0 0c 0a              cmpi.s8	r0, 0xa
 fc 26                 cmov.ult	r4, r6
 f1 04                 mov	r0, r4
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f1 0f                 mov	r1, r7
 f9 84                 and	r4, r1
 08                    mov	r6, r4
 f9 c9                 or	r6, r2
 0c                    mov	r7, r4
 cb 37                 addi.s8	r7, 0x37
 cc 0a                 cmpi.s8	r4, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 f4 0a                 ldsp16	r6, [sp+0x2]
 f9 c4                 and	r6, r1
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 0d                    mov	r7, r5
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 89                 or	r4, r2
 0b                    mov	r6, r7
 ca 37                 addi.s8	r6, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 34                 cmov.ult	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 c4                 and	r6, r1
 f9 59                 or	r2, r6
 0e                    mov	r7, r6
 cb 37                 addi.s8	r7, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 3a                 cmov.ult	r7, r2
 f0 06 ed e0           ldi16	r2, 0xe0ed
 f0 07 ca b1           ldi16	r3, 0xb1ca
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 24              ldsp16	r5, [sp+0x24]
 f0 69 84              cmp32	q2, q1
 f8 09                 cset.ne	r1
 c6 c6 84              ldi16	r6, 0x84c6
 f0 34 14              ldsp16	r4, [sp+0x14]
 32                    cmp	r4, r6
 f8 0e                 cset.ne	r6
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 c4 2e a9              ldi16	r4, 0xa92e
 f0 35 12              ldsp16	r5, [sp+0x12]
 34                    cmp	r5, r4
 f8 0f                 cset.ne	r7
 9e                    or	r7, r6
 f9 e5                 or	r7, r1
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 1e              ldsp16	r4, [sp+0x1e]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 c0 38                 ldi8	r4, 0x38
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d6 36                 adjsp	mix_u16+49
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<mix_u16>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	avm_test_main+696
 f2 30                 sub	r0, r0
 c2 0f                 ldi8	r6, 0xf
 f4 4a                 stsp16	[sp+0x2], r6
 c2 01                 ldi8	r6, 0x1
 f4 42                 stsp16	[sp+0x0], r6
 f0 02 11              ldi8	r2, 0x11
 f0 03 1f              ldi8	r3, 0x1f
 f4 59                 stsp16	[sp+0x6], r5
 f1 2c                 mov	r7, r0
 f1 77                 zext8	r7
 f1 28                 mov	r6, r0
 ca f9                 addi.s8	r6, -0x7
 cf 07                 cmpi.s8	r7, 0x7
 fc 30                 cmov.ult	r6, r0
 f4 09                 ldsp16	r5, [sp+0x2]
 26                    sub	r5, r6
 f4 ae                 inc16	r6
 f1 76                 zext8	r6
 f4 60                 stsp16	[sp+0x8], r4
 f4 23                 ldsp16	r7, [sp+0x8]
 fa 0e                 shl16v	r7, r6
 f4 63                 stsp16	[sp+0x8], r7
 f1 75                 zext8	r5
 08                    mov	r6, r4
 fa 19                 lsr16v	r6, r5
 f4 23                 ldsp16	r7, [sp+0x8]
 9b                    or	r6, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 19                 ldsp16	r5, [sp+0x6]
 f1 0d                 mov	r1, r5
 f4 03                 ldsp16	r7, [sp+0x0]
 f9 3d                 or	r1, r7
 04                    mov	r5, r4
 ec 29                 udiv16	r5, r1
 f4 61                 stsp16	[sp+0x8], r5
 f4 22                 ldsp16	r6, [sp+0x8]
 fe 32                 mul16	r6, r2
 f4 62                 stsp16	[sp+0x8], r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 13                 ldsp16	r7, [sp+0x4]
 1b                    add	r6, r7
 f4 62                 stsp16	[sp+0x8], r6
 fe 29                 mul16	r5, r1
 21                    sub	r4, r5
 fe 23                 mul16	r4, r3
 c2 05                 ldi8	r6, 0x5
 f4 19                 ldsp16	r5, [sp+0x6]
 fe 2e                 mul16	r5, r6
 f4 22                 ldsp16	r6, [sp+0x8]
 12                    add	r4, r6
 09                    mov	r6, r5
 ca 03                 addi.s8	r6, 0x3
 04                    mov	r5, r4
 a6                    xor	r5, r6
 f4 a8                 inc16	r0
 f1 2c                 mov	r7, r0
 f1 77                 zext8	r7
 cf 0b                 cmpi.s8	r7, 0xb
 d1 a2                 brne8	mix_u16+22
 02                    mov	r4, r6
 d6 0a                 adjsp	mix_s16+5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<mix_s16>:
 b0                    push16	r0
 f1 05                 mov	r0, r5
 0c                    mov	r7, r4
 ec b8                 sdiv16	r7, r0
 c6 01 01              ldi16	r6, 0x101
 07                    mov	r5, r7
 fe 2e                 mul16	r5, r6
 08                    mov	r6, r4
 fa d3                 asr16i	r6, 0x3
 a9                    xor	r6, r5
 fe 38                 mul16	r7, r0
 23                    sub	r4, r7
 c1 11                 ldi8	r5, 0x11
 fe 25                 mul16	r4, r5
 a2                    xor	r4, r6
 b8                    pop16	r0
 ef                    ret

<mix_u32>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f2                 adjsp	mix_s16+18
 f2 67                 mov32	q1, q3
 c2 07                 ldi8	r6, 0x7
 f0 04 b9 79           ldi16	r0, 0x79b9
 f0 05 37 9e           ldi16	r1, 0x9e37
 f0 38 00              stsp16	[sp+0x0], r0
 f0 39 02              stsp16	[sp+0x2], r1
 f4 62                 stsp16	[sp+0x8], r6
 f7 69                 add32	q2, q1
 09                    mov	r6, r5
 af                    xor	r7, r7
 fa 55                 lsl16i	r6, 0x5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 fa 7b                 lsr16i	r4, 0xb
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 92                    or	r4, r6
 f1 0c                 mov	r1, r4
 f2 30                 sub	r0, r0
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 08                    mov	r6, r4
 fa 55                 lsl16i	r6, 0x5
 af                    xor	r7, r7
 f9 c1                 or	r6, r0
 f9 e5                 or	r7, r1
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 f7 64                 add32	q1, q0
 a8                    xor	r6, r4
 ad                    xor	r7, r5
 02                    mov	r4, r6
 fa 77                 lsr16i	r4, 0x7
 f4 50                 stsp16	[sp+0x4], r4
 03                    mov	r4, r7
 a5                    xor	r5, r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 39                 lsl16i	r4, 0x9
 f4 11                 ldsp16	r5, [sp+0x4]
 91                    or	r4, r5
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 77                 lsr16i	r4, 0x7
 04                    mov	r5, r4
 a0                    xor	r4, r4
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 a2                    xor	r4, r6
 a7                    xor	r5, r7
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 08                    mov	r6, r4
 fa 97                 lsr16i	r6, 0x7
 f4 52                 stsp16	[sp+0x4], r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 0e                    mov	r7, r6
 fa 69                 lsl16i	r7, 0x9
 f4 12                 ldsp16	r6, [sp+0x4]
 9e                    or	r7, r6
 aa                    xor	r6, r6
 fa 39                 lsl16i	r4, 0x9
 f1 04                 mov	r0, r4
 f2 39                 sub	r1, r1
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 31                 ldsp16	r5, [sp+0xc]
 fa 77                 lsr16i	r4, 0x7
 a5                    xor	r5, r5
 f9 81                 or	r4, r0
 f9 a5                 or	r5, r1
 08                    mov	r6, r4
 fa 93                 lsr16i	r6, 0x3
 f4 52                 stsp16	[sp+0x4], r6
 09                    mov	r6, r5
 af                    xor	r7, r7
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 fa 5d                 lsl16i	r6, 0xd
 f4 13                 ldsp16	r7, [sp+0x4]
 9b                    or	r6, r7
 af                    xor	r7, r7
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 33                 ldsp16	r7, [sp+0xc]
 fa 93                 lsr16i	r6, 0x3
 f1 0e                 mov	r1, r6
 f2 30                 sub	r0, r0
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f9 19                 or	r0, r6
 f9 3d                 or	r1, r7
 f4 22                 ldsp16	r6, [sp+0x8]
 f9 42                 xor	r2, r0
 f9 66                 xor	r3, r1
 f4 b6                 dec16	r6
 f4 a6                 tst8	r6
 db 48 ff              brne16	mix_u32+24
 f9 52                 xor	r2, r4
 f9 76                 xor	r3, r5
 f2 69                 mov32	q2, q1
 d6 0e                 adjsp	avm_halt+9
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
