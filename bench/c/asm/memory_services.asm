
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
00000215 g     F .text	0000004d avm_test_main
00000262 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 4d                 call8	avm_halt

<avm_test_main>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 c4 00 01              ldi16	r4, 0x100
 c1 09                 ldi8	r5, 0x9
 c2 60                 ldi8	r6, 0x60
 f6 05                 st8	[r4+], r5
 c9 0d                 addi.s8	r5, 0xd
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+10
 d7 01                 sys	debug_break
 c5 00 01              ldi16	r5, 0x100
 f0 04 62 01           ldi16	r0, 0x162
 f0 57 60 01           ldm16	r7, [0x160]
 f1 20                 mov	r4, r0
 0b                    mov	r6, r7
 d7 0f                 sys	memcpy
 c4 67 01              ldi16	r4, 0x167
 f4 40                 stsp16	[sp+0x0], r4
 ca fb                 addi.s8	r6, -0x5
 f1 24                 mov	r5, r0
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 12                 sys	memmove
 aa                    xor	r6, r6
 f6 2f                 tst16	r7
 d0 0a                 breq8	avm_test_main+66
 f0 6c a1              ld8u	r5, [r0+]
 19                    add	r6, r5
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f6                 brne8	avm_test_main+56
 f0 5e c2 01           stm16	[0x1c2], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
