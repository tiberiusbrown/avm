
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/debug_printf.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 debug_printf.c
0000012f l     O .rodata	00000007 .L.avm.flashstr.0
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000015 _start
00000115 g     F .text	00000018 avm_test_main
0000012d g     F .text	00000002 avm_halt

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
 d5 18                 call8	avm_halt

<avm_test_main>:
 b2                    push16	r2
 d6 fe                 adjsp	-0x2
 c0 2a                 ldi8	r4, 0x2a
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 00              leasp	r4, 0x0
 c6 2f 01              ldi16	r6, 0x12f
 c3 00                 ldi8	r7, 0x0
 f1 14                 mov	r2, r4
 d7 37                 sys	debug_printfv_p
 a0                    xor	r4, r4
 d6 02                 adjsp	0x2
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
