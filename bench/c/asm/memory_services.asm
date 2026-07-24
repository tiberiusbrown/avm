
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
00000215 g     F .text	00000050 avm_test_main
00000265 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 50                 call8	avm_halt

<avm_test_main>:
 c4 00 01              ldi16	r4, 0x100
 c1 09                 ldi8	r5, 0x9
 c2 60                 ldi8	r6, 0x60
 f6 05                 st8	[r4+], r5
 c9 0d                 addi.s8	r5, 0xd
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+7
 d7 01                 sys	debug_break
 c5 00 01              ldi16	r5, 0x100
 c6 62 01              ldi16	r6, 0x162
 f0 54 60 01           ldm16	r4, [0x160]
 0e                    mov	r7, r6
 b4                    push16	r4
 b6                    push16	r6
 08                    mov	r6, r4
 03                    mov	r4, r7
 d7 0f                 sys	memcpy
 be                    pop16	r6
 bc                    pop16	r4
 04                    mov	r5, r4
 c9 fb                 addi.s8	r5, -0x5
 c7 67 01              ldi16	r7, 0x167
 b4                    push16	r4
 03                    mov	r4, r7
 0d                    mov	r7, r5
 06                    mov	r5, r6
 0b                    mov	r6, r7
 d7 12                 sys	memmove
 bc                    pop16	r4
 f6 2c                 tst16	r4
 d0 0f                 breq8	avm_test_main+71
 a5                    xor	r5, r5
 c6 62 01              ldi16	r6, 0x162
 f7 17                 ld8u	r7, [r6+]
 17                    add	r5, r7
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f7                 brne8	avm_test_main+60
 d4 01                 jmp8	avm_test_main+72
 a5                    xor	r5, r5
 f0 5d c2 01           stm16	[0x1c2], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
