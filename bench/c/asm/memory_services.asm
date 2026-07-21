
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/memory_services.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 memory_services.c
00000100 l     O .data	00000060 source
00000162 l     O .data	00000060 destination
00000160 l     O .data	00000002 memory_length
000001c2 l     O .data	00000002 memory_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000005b avm_test_main
00000270 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 5b                 call8	avm_halt

<avm_test_main>:
 d6 f8                 adjsp	_start+15
 c4 00 01              ldi16	r4, 0x100
 c1 09                 ldi8	r5, 0x9
 c2 60                 ldi8	r6, 0x60
 f6 05                 st8	[r4+], r5
 c9 0d                 addi.s8	r5, 0xd
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+9
 d7 01                 sys	debug_break
 c5 00 01              ldi16	r5, 0x100
 c4 62 01              ldi16	r4, 0x162
 f0 56 60 01           ldm16	r6, [0x160]
 f4 52                 stsp16	[sp+0x4], r6
 d7 0f                 sys	memcpy
 f4 40                 stsp16	[sp+0x0], r4
 f4 5a                 stsp16	[sp+0x6], r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 ca fb                 addi.s8	r6, -0x5
 f4 5a                 stsp16	[sp+0x6], r6
 c4 67 01              ldi16	r4, 0x167
 f4 48                 stsp16	[sp+0x2], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 04                    mov	r5, r4
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 12                 sys	memmove
 f4 12                 ldsp16	r6, [sp+0x4]
 f6 2e                 tst16	r6
 d0 0f                 breq8	avm_test_main+80
 a0                    xor	r4, r4
 c5 62 01              ldi16	r5, 0x162
 f7 0f                 ld8u	r7, [r5+]
 13                    add	r4, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f7                 brne8	avm_test_main+69
 d4 01                 jmp8	avm_test_main+81
 a0                    xor	r4, r4
 f0 5c c2 01           stm16	[0x1c2], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	avm_halt+7
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
