
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/small_memops.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 small_memops.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000020 destination
00000140 l     O .data	00000002 small_memops_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000013f avm_test_main
00000355 g     F .text	00000002 avm_halt

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
 e1 3f 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ca                 adjsp	-0x36
 c4 00 01              ldi16	r4, 0x100
 c1 03                 ldi8	r5, 0x3
 c2 20                 ldi8	r6, 0x20
 f6 05                 st8	[r4+], r5
 c9 11                 addi.s8	r5, 0x11
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+13
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f0 00 20              ldi8	r0, 0x20
 f0 05 20 01           ldi16	r1, 0x120
 f1 21                 mov	r4, r1
 f0 3c 34              stsp16	[sp+0x34], r4
 f1 26                 mov	r5, r2
 f0 3d 32              stsp16	[sp+0x32], r5
 f1 28                 mov	r6, r0
 f0 3e 30              stsp16	[sp+0x30], r6
 c4 21 01              ldi16	r4, 0x121
 f0 3c 2e              stsp16	[sp+0x2e], r4
 c4 03 01              ldi16	r4, 0x103
 04                    mov	r5, r4
 f0 3d 2c              stsp16	[sp+0x2c], r5
 c0 01                 ldi8	r4, 0x1
 08                    mov	r6, r4
 f0 3e 2a              stsp16	[sp+0x2a], r6
 c4 22 01              ldi16	r4, 0x122
 f0 3c 28              stsp16	[sp+0x28], r4
 c4 05 01              ldi16	r4, 0x105
 04                    mov	r5, r4
 f0 3d 26              stsp16	[sp+0x26], r5
 c0 02                 ldi8	r4, 0x2
 08                    mov	r6, r4
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 07 24 01           ldi16	r3, 0x124
 f1 23                 mov	r4, r3
 f0 3c 22              stsp16	[sp+0x22], r4
 c5 07 01              ldi16	r5, 0x107
 f0 3d 20              stsp16	[sp+0x20], r5
 c1 03                 ldi8	r5, 0x3
 09                    mov	r6, r5
 f0 3e 1e              stsp16	[sp+0x1e], r6
 c5 28 01              ldi16	r5, 0x128
 01                    mov	r4, r5
 f0 3c 1c              stsp16	[sp+0x1c], r4
 c5 09 01              ldi16	r5, 0x109
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c1 04                 ldi8	r5, 0x4
 09                    mov	r6, r5
 f0 3e 18              stsp16	[sp+0x18], r6
 c5 2c 01              ldi16	r5, 0x12c
 01                    mov	r4, r5
 f0 3c 16              stsp16	[sp+0x16], r4
 c5 0b 01              ldi16	r5, 0x10b
 f0 3d 14              stsp16	[sp+0x14], r5
 c1 05                 ldi8	r5, 0x5
 09                    mov	r6, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 c7 32 01              ldi16	r7, 0x132
 03                    mov	r4, r7
 f0 3c 10              stsp16	[sp+0x10], r4
 c1 5a                 ldi8	r5, 0x5a
 f4 79                 stsp16	[sp+0xe], r5
 c2 08                 ldi8	r6, 0x8
 f4 72                 stsp16	[sp+0xc], r6
 c6 27 01              ldi16	r6, 0x127
 02                    mov	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 f1 27                 mov	r5, r3
 f4 61                 stsp16	[sp+0x8], r5
 c0 07                 ldi8	r4, 0x7
 08                    mov	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 c4 34 01              ldi16	r4, 0x134
 f4 50                 stsp16	[sp+0x4], r4
 07                    mov	r5, r7
 f4 49                 stsp16	[sp+0x2], r5
 c0 0c                 ldi8	r4, 0xc
 08                    mov	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f1 2e                 mov	r7, r2
 f0 34 34              ldsp16	r4, [sp+0x34]
 f0 35 32              ldsp16	r5, [sp+0x32]
 f0 36 30              ldsp16	r6, [sp+0x30]
 d7 11                 sys	memset
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 f0 35 2c              ldsp16	r5, [sp+0x2c]
 f0 36 2a              ldsp16	r6, [sp+0x2a]
 d7 0f                 sys	memcpy
 f0 34 28              ldsp16	r4, [sp+0x28]
 f0 35 26              ldsp16	r5, [sp+0x26]
 f0 36 24              ldsp16	r6, [sp+0x24]
 d7 0f                 sys	memcpy
 f0 34 22              ldsp16	r4, [sp+0x22]
 f0 35 20              ldsp16	r5, [sp+0x20]
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 d7 0f                 sys	memcpy
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 36 18              ldsp16	r6, [sp+0x18]
 d7 0f                 sys	memcpy
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 35 14              ldsp16	r5, [sp+0x14]
 f0 36 12              ldsp16	r6, [sp+0x12]
 d7 0f                 sys	memcpy
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 32                 ldsp16	r6, [sp+0xc]
 d7 11                 sys	memset
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 d7 12                 sys	memmove
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 02                 ldsp16	r6, [sp+0x0]
 d7 12                 sys	memmove
 f1 24                 mov	r5, r0
 f1 29                 mov	r6, r1
 f7 14                 ld8u	r4, [r6+]
 1c                    add	r7, r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f7                 brne8	avm_test_main+286
 f4 aa                 inc16	r2
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 8e                 brne8	avm_test_main+191
 f0 5f 40 01           stm16	[0x140], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 36                 adjsp	avm_halt+49
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
