
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble2.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000194 avm_test_main
000003aa g     F .text	00000002 avm_halt
00000100 g     O .data	00000080 A

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 94 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c0 02                 ldi8	r4, 0x2
 c1 01                 ldi8	r5, 0x1
 c6 7c 01              ldi16	r6, 0x17c
 f0 6b 8c              st32	[r6], q2
 c0 04                 ldi8	r4, 0x4
 c1 03                 ldi8	r5, 0x3
 c6 78 01              ldi16	r6, 0x178
 f0 6b 8c              st32	[r6], q2
 c0 06                 ldi8	r4, 0x6
 c1 05                 ldi8	r5, 0x5
 c6 74 01              ldi16	r6, 0x174
 f0 6b 8c              st32	[r6], q2
 c0 08                 ldi8	r4, 0x8
 c1 07                 ldi8	r5, 0x7
 c6 70 01              ldi16	r6, 0x170
 f0 6b 8c              st32	[r6], q2
 c0 0a                 ldi8	r4, 0xa
 c1 09                 ldi8	r5, 0x9
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c0 0c                 ldi8	r4, 0xc
 c1 0b                 ldi8	r5, 0xb
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c0 0e                 ldi8	r4, 0xe
 c1 0d                 ldi8	r5, 0xd
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c0 10                 ldi8	r4, 0x10
 c1 0f                 ldi8	r5, 0xf
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 c0 12                 ldi8	r4, 0x12
 c1 11                 ldi8	r5, 0x11
 c6 5c 01              ldi16	r6, 0x15c
 f0 6b 8c              st32	[r6], q2
 c0 14                 ldi8	r4, 0x14
 c1 13                 ldi8	r5, 0x13
 c6 58 01              ldi16	r6, 0x158
 f0 6b 8c              st32	[r6], q2
 c0 16                 ldi8	r4, 0x16
 c1 15                 ldi8	r5, 0x15
 c6 54 01              ldi16	r6, 0x154
 f0 6b 8c              st32	[r6], q2
 c0 18                 ldi8	r4, 0x18
 c1 17                 ldi8	r5, 0x17
 c6 50 01              ldi16	r6, 0x150
 f0 6b 8c              st32	[r6], q2
 c0 1a                 ldi8	r4, 0x1a
 c1 19                 ldi8	r5, 0x19
 c6 4c 01              ldi16	r6, 0x14c
 f0 6b 8c              st32	[r6], q2
 c0 1c                 ldi8	r4, 0x1c
 c1 1b                 ldi8	r5, 0x1b
 c6 48 01              ldi16	r6, 0x148
 f0 6b 8c              st32	[r6], q2
 c0 1e                 ldi8	r4, 0x1e
 c1 1d                 ldi8	r5, 0x1d
 c6 44 01              ldi16	r6, 0x144
 f0 6b 8c              st32	[r6], q2
 c0 20                 ldi8	r4, 0x20
 c1 1f                 ldi8	r5, 0x1f
 c6 40 01              ldi16	r6, 0x140
 f0 6b 8c              st32	[r6], q2
 c0 22                 ldi8	r4, 0x22
 c1 21                 ldi8	r5, 0x21
 c6 3c 01              ldi16	r6, 0x13c
 f0 6b 8c              st32	[r6], q2
 c0 24                 ldi8	r4, 0x24
 c1 23                 ldi8	r5, 0x23
 c6 38 01              ldi16	r6, 0x138
 f0 6b 8c              st32	[r6], q2
 c0 26                 ldi8	r4, 0x26
 c1 25                 ldi8	r5, 0x25
 c6 34 01              ldi16	r6, 0x134
 f0 6b 8c              st32	[r6], q2
 c0 28                 ldi8	r4, 0x28
 c1 27                 ldi8	r5, 0x27
 c6 30 01              ldi16	r6, 0x130
 f0 6b 8c              st32	[r6], q2
 c0 2a                 ldi8	r4, 0x2a
 c1 29                 ldi8	r5, 0x29
 c6 2c 01              ldi16	r6, 0x12c
 f0 6b 8c              st32	[r6], q2
 c0 2c                 ldi8	r4, 0x2c
 c1 2b                 ldi8	r5, 0x2b
 c6 28 01              ldi16	r6, 0x128
 f0 6b 8c              st32	[r6], q2
 c0 2e                 ldi8	r4, 0x2e
 c1 2d                 ldi8	r5, 0x2d
 c6 24 01              ldi16	r6, 0x124
 f0 6b 8c              st32	[r6], q2
 c0 30                 ldi8	r4, 0x30
 c1 2f                 ldi8	r5, 0x2f
 c6 20 01              ldi16	r6, 0x120
 f0 6b 8c              st32	[r6], q2
 c0 32                 ldi8	r4, 0x32
 c1 31                 ldi8	r5, 0x31
 c6 1c 01              ldi16	r6, 0x11c
 f0 6b 8c              st32	[r6], q2
 c0 34                 ldi8	r4, 0x34
 c1 33                 ldi8	r5, 0x33
 c6 18 01              ldi16	r6, 0x118
 f0 6b 8c              st32	[r6], q2
 c0 36                 ldi8	r4, 0x36
 c1 35                 ldi8	r5, 0x35
 c6 14 01              ldi16	r6, 0x114
 f0 6b 8c              st32	[r6], q2
 c0 38                 ldi8	r4, 0x38
 c1 37                 ldi8	r5, 0x37
 c6 10 01              ldi16	r6, 0x110
 f0 6b 8c              st32	[r6], q2
 c0 3a                 ldi8	r4, 0x3a
 c1 39                 ldi8	r5, 0x39
 c6 0c 01              ldi16	r6, 0x10c
 f0 6b 8c              st32	[r6], q2
 c0 3c                 ldi8	r4, 0x3c
 c1 3b                 ldi8	r5, 0x3b
 c6 08 01              ldi16	r6, 0x108
 f0 6b 8c              st32	[r6], q2
 c0 3e                 ldi8	r4, 0x3e
 c1 3d                 ldi8	r5, 0x3d
 c6 04 01              ldi16	r6, 0x104
 f0 6b 8c              st32	[r6], q2
 c0 40                 ldi8	r4, 0x40
 c1 3f                 ldi8	r5, 0x3f
 c6 00 01              ldi16	r6, 0x100
 f0 6b 8c              st32	[r6], q2
 f0 03 40              ldi8	r3, 0x40
 d7 01                 sys	debug_break
 f2 39                 sub	r1, r1
 f0 02 01              ldi8	r2, 0x1
 d4 08                 jmp8	avm_test_main+344
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d2 34                 brult8	avm_test_main+396
 f1 73                 zext8	r3
 f4 b3                 dec16	r3
 f1 2f                 mov	r7, r3
 f1 22                 mov	r4, r2
 c6 02 01              ldi16	r6, 0x102
 f1 19                 mov	r3, r1
 d4 0a                 jmp8	avm_test_main+369
 f4 ac                 inc16	r4
 ca 02                 addi.s8	r6, 0x2
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d0 df                 breq8	avm_test_main+336
 66                    ld16	r5, [r6]
 ed 1c 1e              ld16	r0, [r6-2]
 f5 24                 cmp	r5, r0
 d9 ee                 brsge8	avm_test_main+359
 f5 58                 st16	[r6], r0
 ee bc 1e              st16	[r6-2], r5
 f1 1c                 mov	r3, r4
 f4 ac                 inc16	r4
 ca 02                 addi.s8	r6, 0x2
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 e7                 brne8	avm_test_main+369
 d4 c4                 jmp8	avm_test_main+336
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
