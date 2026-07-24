
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/small_memops.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 small_memops.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000020 destination
00000140 l     O .data	00000002 small_memops_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000010b avm_test_main
00000321 g     F .text	00000002 avm_halt

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
 e1 0b 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 dc                 adjsp	-0x24
 c4 00 01              ldi16	r4, 0x100
 c1 03                 ldi8	r5, 0x3
 c2 20                 ldi8	r6, 0x20
 f6 05                 st8	[r4+], r5
 c9 11                 addi.s8	r5, 0x11
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+13
 f2 4b                 sub	r3, r3
 d7 01                 sys	debug_break
 c0 20                 ldi8	r4, 0x20
 f1 27                 mov	r5, r3
 f0 3d 22              stsp16	[sp+0x22], r5
 08                    mov	r6, r4
 f0 3e 20              stsp16	[sp+0x20], r6
 c4 03 01              ldi16	r4, 0x103
 04                    mov	r5, r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 c0 01                 ldi8	r4, 0x1
 08                    mov	r6, r4
 f0 3e 1c              stsp16	[sp+0x1c], r6
 c4 05 01              ldi16	r4, 0x105
 04                    mov	r5, r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c0 02                 ldi8	r4, 0x2
 08                    mov	r6, r4
 f0 3e 18              stsp16	[sp+0x18], r6
 c4 07 01              ldi16	r4, 0x107
 04                    mov	r5, r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c0 03                 ldi8	r4, 0x3
 08                    mov	r6, r4
 f0 3e 14              stsp16	[sp+0x14], r6
 c4 09 01              ldi16	r4, 0x109
 04                    mov	r5, r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c0 04                 ldi8	r4, 0x4
 08                    mov	r6, r4
 f0 3e 10              stsp16	[sp+0x10], r6
 c4 0b 01              ldi16	r4, 0x10b
 04                    mov	r5, r4
 f4 79                 stsp16	[sp+0xe], r5
 c0 05                 ldi8	r4, 0x5
 08                    mov	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 c0 5a                 ldi8	r4, 0x5a
 04                    mov	r5, r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 08                 ldi8	r4, 0x8
 08                    mov	r6, r4
 f4 62                 stsp16	[sp+0x8], r6
 f0 05 24 01           ldi16	r1, 0x124
 f1 25                 mov	r5, r1
 f4 59                 stsp16	[sp+0x6], r5
 c0 07                 ldi8	r4, 0x7
 08                    mov	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f0 06 32 01           ldi16	r2, 0x132
 f1 26                 mov	r5, r2
 f4 49                 stsp16	[sp+0x2], r5
 c0 0c                 ldi8	r4, 0xc
 08                    mov	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f1 2f                 mov	r7, r3
 f0 04 20 01           ldi16	r0, 0x120
 f1 20                 mov	r4, r0
 f0 35 22              ldsp16	r5, [sp+0x22]
 f0 36 20              ldsp16	r6, [sp+0x20]
 d7 11                 sys	memset
 c4 21 01              ldi16	r4, 0x121
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 d7 0f                 sys	memcpy
 c4 22 01              ldi16	r4, 0x122
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 f0 36 18              ldsp16	r6, [sp+0x18]
 d7 0f                 sys	memcpy
 f1 21                 mov	r4, r1
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 36 14              ldsp16	r6, [sp+0x14]
 d7 0f                 sys	memcpy
 c4 28 01              ldi16	r4, 0x128
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 10              ldsp16	r6, [sp+0x10]
 d7 0f                 sys	memcpy
 c4 2c 01              ldi16	r4, 0x12c
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 32                 ldsp16	r6, [sp+0xc]
 d7 0f                 sys	memcpy
 f1 22                 mov	r4, r2
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 22                 ldsp16	r6, [sp+0x8]
 d7 11                 sys	memset
 c4 27 01              ldi16	r4, 0x127
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 12                 ldsp16	r6, [sp+0x4]
 d7 12                 sys	memmove
 c4 34 01              ldi16	r4, 0x134
 f4 09                 ldsp16	r5, [sp+0x2]
 f4 02                 ldsp16	r6, [sp+0x0]
 d7 12                 sys	memmove
 c2 20                 ldi8	r6, 0x20
 f0 6c 81              ld8u	r4, [r0+]
 1c                    add	r7, r4
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+233
 f4 ab                 inc16	r3
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 8e                 brne8	avm_test_main+139
 f0 5f 40 01           stm16	[0x140], r7
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 24                 adjsp	avm_halt+31
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
