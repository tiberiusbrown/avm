
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/small_memops.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 small_memops.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000020 destination
00000140 l     O .data	00000002 small_memops_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000f0 avm_test_main
00000306 g     F .text	00000002 avm_halt

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
 e1 f0 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	_start+6
 c4 00 01              ldi16	r4, 0x100
 c1 03                 ldi8	r5, 0x3
 c2 20                 ldi8	r6, 0x20
 f6 05                 st8	[r4+], r5
 c9 11                 addi.s8	r5, 0x11
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+13
 f2 39                 sub	r1, r1
 d7 01                 sys	debug_break
 c4 09 01              ldi16	r4, 0x109
 f0 6a 88              ld32	q2, [r4]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 54 05 01           ldm16	r4, [0x105]
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 44 03 01           ldm8u	r4, [0x103]
 f4 78                 stsp16	[sp+0xe], r4
 c4 20 01              ldi16	r4, 0x120
 f4 70                 stsp16	[sp+0xc], r4
 f4 68                 stsp16	[sp+0xa], r4
 f1 25                 mov	r5, r1
 f4 61                 stsp16	[sp+0x8], r5
 c0 20                 ldi8	r4, 0x20
 08                    mov	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 c4 34 01              ldi16	r4, 0x134
 f4 50                 stsp16	[sp+0x4], r4
 c4 32 01              ldi16	r4, 0x132
 f4 48                 stsp16	[sp+0x2], r4
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f1 11                 mov	r2, r1
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 21                 ldsp16	r5, [sp+0x8]
 f4 1a                 ldsp16	r6, [sp+0x6]
 d7 11                 sys	memset
 c4 0c 01              ldi16	r4, 0x10c
 f0 6a 88              ld32	q2, [r4]
 c6 2d 01              ldi16	r6, 0x12d
 f0 6b 8c              st32	[r6], q2
 c4 28 01              ldi16	r4, 0x128
 f0 36 12              ldsp16	r6, [sp+0x12]
 f0 37 14              ldsp16	r7, [sp+0x14]
 f0 6b c8              st32	[r4], q3
 f0 44 0b 01           ldm8u	r4, [0x10b]
 f0 4c 2c 01           stm8	[0x12c], r4
 c4 2b 01              ldi16	r4, 0x12b
 f0 6d d9              st16	[r4+], r6
 ee e8 20              st8	[r4+0], r7
 f0 54 08 01           ldm16	r4, [0x108]
 f0 5c 25 01           stm16	[0x125], r4
 f0 44 07 01           ldm8u	r4, [0x107]
 f0 4c 24 01           stm8	[0x124], r4
 c4 24 01              ldi16	r4, 0x124
 f0 6a 88              ld32	q2, [r4]
 c6 27 01              ldi16	r6, 0x127
 f0 6b 8c              st32	[r6], q2
 c4 5a 5a              ldi16	r4, 0x5a5a
 c5 5a 5a              ldi16	r5, 0x5a5a
 c6 36 01              ldi16	r6, 0x136
 f0 6b 8c              st32	[r6], q2
 f4 0a                 ldsp16	r6, [sp+0x2]
 f0 6b 8c              st32	[r6], q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 5c 22 01           stm16	[0x122], r4
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 4c 21 01           stm8	[0x121], r4
 c2 0c                 ldi8	r6, 0xc
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 01                 ldsp16	r5, [sp+0x0]
 d7 12                 sys	memmove
 f0 00 20              ldi8	r0, 0x20
 f0 33 0c              ldsp16	r3, [sp+0xc]
 f0 6c 87              ld8u	r4, [r3+]
 f2 14                 add	r2, r4
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 f5                 brne8	avm_test_main+204
 f4 a9                 inc16	r1
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 db 71 ff              brne16	avm_test_main+83
 f0 5a 40 01           stm16	[0x140], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 16                 adjsp	avm_halt+17
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
