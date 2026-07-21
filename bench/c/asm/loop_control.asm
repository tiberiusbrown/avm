
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/loop_control.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 loop_control.c
00000100 l     O .data	00000020 source
00000120 l     O .data	00000002 loop_control_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000054 avm_test_main
00000269 g     F .text	00000002 avm_halt

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
 d5 54                 call8	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 c0 01                 ldi8	r4, 0x1
 c5 00 01              ldi16	r5, 0x100
 c2 20                 ldi8	r6, 0x20
 f6 0c                 st8	[r5+], r4
 c8 05                 addi.s8	r4, 0x5
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+9
 c4 34 12              ldi16	r4, 0x1234
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 09                    mov	r6, r5
 c8 18                 addi.s8	r4, 0x18
 0d                    mov	r7, r5
 a3                    xor	r4, r7
 cb 11                 addi.s8	r7, 0x11
 f0 04 20 02           ldi16	r0, 0x220
 f5 2c                 cmp	r7, r0
 d1 f5                 brne8	avm_test_main+29
 af                    xor	r7, r7
 f0 00 1f              ldi8	r0, 0x1f
 f9 1c                 and	r0, r7
 f0 05 00 01           ldi16	r1, 0x100
 f2 08                 add	r1, r0
 f0 6c 02              ld8u	r0, [r1]
 f2 20                 add	r4, r0
 f4 af                 inc16	r7
 f0 04 00 01           ldi16	r0, 0x100
 f5 2c                 cmp	r7, r0
 d1 e6                 brne8	avm_test_main+41
 f4 ae                 inc16	r6
 c3 80                 ldi8	r7, 0x80
 3b                    cmp	r6, r7
 d1 d0                 brne8	avm_test_main+26
 f0 5c 20 01           stm16	[0x120], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
