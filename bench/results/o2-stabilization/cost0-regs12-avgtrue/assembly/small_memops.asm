
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/small_memops.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 small_memops.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000020 destination
00000140 l     O .data	00000002 small_memops_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000c0 avm_test_main
000002d6 g     F .text	00000002 avm_halt

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
 e1 c0 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	_start+16
 c4 00 01              ldi16	r4, 0x100
 c1 20                 ldi8	r5, 0x20
 c2 03                 ldi8	r6, 0x3
 f6 06                 st8	[r4+], r6
 ca 11                 addi.s8	r6, 0x11
 f4 b5                 dec16	r5
 f4 a5                 tst8	r5
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
 f1 0e                 mov	r1, r6
 f0 00 07              ldi8	r0, 0x7
 f4 6a                 stsp16	[sp+0xa], r6
 f0 02 20              ldi8	r2, 0x20
 a5                    xor	r5, r5
 c4 20 01              ldi16	r4, 0x120
 f1 2a                 mov	r6, r2
 d7 11                 sys	memset
 f1 1c                 mov	r3, r4
 c4 28 01              ldi16	r4, 0x128
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 f0 6b c8              st32	[r4], q3
 f4 08                 ldsp16	r4, [sp+0x2]
 f0 5c 22 01           stm16	[0x122], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f0 4c 21 01           stm8	[0x121], r4
 f0 44 07 01           ldm8u	r4, [0x107]
 f0 4c 24 01           stm8	[0x124], r4
 f0 54 08 01           ldm16	r4, [0x108]
 f0 5c 25 01           stm16	[0x125], r4
 c2 05                 ldi8	r6, 0x5
 c5 0b 01              ldi16	r5, 0x10b
 c4 2c 01              ldi16	r4, 0x12c
 d7 0f                 sys	memcpy
 c4 5a 5a              ldi16	r4, 0x5a5a
 c5 5a 5a              ldi16	r5, 0x5a5a
 c6 36 01              ldi16	r6, 0x136
 f0 6b 8c              st32	[r6], q2
 c7 32 01              ldi16	r7, 0x132
 f0 6b 8e              st32	[r7], q2
 c5 24 01              ldi16	r5, 0x124
 c4 27 01              ldi16	r4, 0x127
 f4 61                 stsp16	[sp+0x8], r5
 f1 28                 mov	r6, r0
 f4 21                 ldsp16	r5, [sp+0x8]
 d7 12                 sys	memmove
 c2 0c                 ldi8	r6, 0xc
 c4 34 01              ldi16	r4, 0x134
 07                    mov	r5, r7
 d7 12                 sys	memmove
 f0 6c 87              ld8u	r4, [r3+]
 f2 0c                 add	r1, r4
 f4 b2                 dec16	r2
 f4 a2                 tst8	r2
 d1 f5                 brne8	avm_test_main+156
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 83                 brne8	avm_test_main+53
 f0 59 40 01           stm16	[0x140], r1
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
