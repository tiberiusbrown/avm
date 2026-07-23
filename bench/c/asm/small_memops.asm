
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/small_memops.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 small_memops.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000020 destination
00000140 l     O .data	00000002 small_memops_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000dc avm_test_main
000002f2 g     F .text	00000002 avm_halt

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
 e1 dc 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	_start+16
 c4 00 01              ldi16	r4, 0x100
 c1 03                 ldi8	r5, 0x3
 c2 20                 ldi8	r6, 0x20
 f6 05                 st8	[r4+], r5
 c9 11                 addi.s8	r5, 0x11
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+13
 aa                    xor	r6, r6
 d7 01                 sys	debug_break
 c4 09 01              ldi16	r4, 0x109
 f0 6a 88              ld32	q2, [r4]
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 54 05 01           ldm16	r4, [0x105]
 f4 48                 stsp16	[sp+0x2], r4
 f0 44 03 01           ldm8u	r4, [0x103]
 f4 40                 stsp16	[sp+0x0], r4
 f1 06                 mov	r0, r6
 f4 62                 stsp16	[sp+0x8], r6
 f0 01 20              ldi8	r1, 0x20
 a5                    xor	r5, r5
 c4 20 01              ldi16	r4, 0x120
 f4 68                 stsp16	[sp+0xa], r4
 f1 29                 mov	r6, r1
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 11                 sys	memset
 f4 68                 stsp16	[sp+0xa], r4
 f4 28                 ldsp16	r4, [sp+0xa]
 0c                    mov	r7, r4
 c5 0c 01              ldi16	r5, 0x10c
 f0 6a 4a              ld32	q1, [r5]
 c5 2d 01              ldi16	r5, 0x12d
 f0 6b 4a              st32	[r5], q1
 c5 28 01              ldi16	r5, 0x128
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 f0 6b 4a              st32	[r5], q1
 f0 45 0b 01           ldm8u	r5, [0x10b]
 f0 4d 2c 01           stm8	[0x12c], r5
 c5 2b 01              ldi16	r5, 0x12b
 f0 6d 5b              st16	[r5+], r2
 ee 6a 20              st8	[r5+0], r3
 f0 55 08 01           ldm16	r5, [0x108]
 f0 5d 25 01           stm16	[0x125], r5
 f0 45 07 01           ldm8u	r5, [0x107]
 f0 4d 24 01           stm8	[0x124], r5
 c5 24 01              ldi16	r5, 0x124
 f0 6a 4a              ld32	q1, [r5]
 c5 27 01              ldi16	r5, 0x127
 f0 6b 4a              st32	[r5], q1
 f0 06 5a 5a           ldi16	r2, 0x5a5a
 f0 07 5a 5a           ldi16	r3, 0x5a5a
 c5 36 01              ldi16	r5, 0x136
 f0 6b 4a              st32	[r5], q1
 c5 32 01              ldi16	r5, 0x132
 f0 6b 4a              st32	[r5], q1
 f4 0a                 ldsp16	r6, [sp+0x2]
 f0 5e 22 01           stm16	[0x122], r6
 f4 02                 ldsp16	r6, [sp+0x0]
 f0 4e 21 01           stm8	[0x121], r6
 f0 02 0c              ldi8	r2, 0xc
 c6 34 01              ldi16	r6, 0x134
 02                    mov	r4, r6
 f1 2a                 mov	r6, r2
 d7 12                 sys	memmove
 f7 1d                 ld8u	r5, [r7+]
 f2 05                 add	r0, r5
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 f6                 brne8	avm_test_main+184
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 ae                 inc16	r6
 06                    mov	r5, r6
 f1 75                 zext8	r5
 cd 40                 cmpi.s8	r5, 0x40
 db 64 ff              brne16	avm_test_main+50
 f0 58 40 01           stm16	[0x140], r0
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	avm_halt+7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
