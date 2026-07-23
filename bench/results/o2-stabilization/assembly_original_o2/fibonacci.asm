
C:/tmp/avm-original-o2-root/build/bench/c/fibonacci.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 fibonacci.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000242 g     F .text	0000000e avm_test_main
00000250 g     F .text	00000002 avm_halt
00000215 g     F .text	0000002d fib
00000100 g     O .data	00000002 f

Disassembly of section .text:

<_start>:
 d5 40                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 3b                 call8	avm_halt

<fib>:
 b1                    push16	r1
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f0 0c 02              cmpi.s8	r0, 0x2
 d8 04                 bruge8	fib+13
 f2 39                 sub	r1, r1
 d4 17                 jmp8	fib+36
 f2 39                 sub	r1, r1
 f1 20                 mov	r4, r0
 f4 b4                 dec16	r4
 f1 74                 zext8	r4
 d5 e9                 call8	fib
 f2 0c                 add	r1, r4
 f0 08 fe              addi.s8	r0, -0x2
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 cc 02                 cmpi.s8	r4, 0x2
 d8 eb                 bruge8	fib+15
 f1 70                 zext8	r0
 f2 01                 add	r0, r1
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_test_main>:
 d7 01                 sys	debug_break
 c0 0c                 ldi8	r4, 0xc
 d5 cd                 call8	fib
 f0 5c 00 01           stm16	[0x100], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
