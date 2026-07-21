
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/fibonacci.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 fibonacci.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000246 g     F .text	00000019 avm_test_main
0000025f g     F .text	00000002 avm_halt
00000215 g     F .text	00000031 fib
00000100 g     O .data	00000002 f

Disassembly of section .text:

00000200 <_start>:
     200: d5 44        call8	avm_test_main
     202: 04           mov	r5, r4
     203: c0 46        ldi8	r4, 0x46
     205: c2 50        ldi8	r6, 0x50
     207: f6 2d        tst16	r5
     209: fb 26        cmov.eq	r4, r6
     20b: d7 00        sys	debug_putc
     20d: c0 0a        ldi8	r4, 0xa
     20f: d7 00        sys	debug_putc
     211: d7 01        sys	debug_break
     213: d5 4a        call8	avm_halt

00000215 <fib>:
     215: b1           push16	r1
     216: b0           push16	r0
     217: f1 04        mov	r0, r4
     219: f0 0c 02     cmpi.s8	r0, 0x2
     21c: d8 05        bruge8	fib+14
     21e: f0 01 00     ldi8	r1, 0x0
     221: d4 1a        jmp8	fib+40
     223: f0 01 00     ldi8	r1, 0x0
     226: f1 20        mov	r4, r0
     228: f4 b4        dec16	r4
     22a: f1 74        zext8	r4
     22c: d5 e7        call8	fib
     22e: f2 0c        add	r1, r4
     230: f0 08 fe     addi.s8	r0, -0x2
     233: f1 20        mov	r4, r0
     235: f1 74        zext8	r4
     237: cc 02        cmpi.s8	r4, 0x2
     239: d2 02        brult8	fib+40
     23b: d4 e9        jmp8	fib+17
     23d: f1 70        zext8	r0
     23f: f2 01        add	r0, r1
     241: f1 20        mov	r4, r0
     243: b8           pop16	r0
     244: b9           pop16	r1
     245: ef           ret

00000246 <avm_test_main>:
     246: d7 01        sys	debug_break
     248: c0 0c        ldi8	r4, 0xc
     24a: d5 c9        call8	fib
     24c: c1 0a        ldi8	r5, 0xa
     24e: f0 5c 00 01  stm16	[0x100], r4
     252: f4 b5        dec16	r5
     254: f4 a5        tst8	r5
     256: d0 02        breq8	avm_test_main+20
     258: d4 f4        jmp8	avm_test_main+8
     25a: d7 01        sys	debug_break
     25c: c0 00        ldi8	r4, 0x0
     25e: ef           ret

0000025f <avm_halt>:
     25f: d4 fe        jmp8	avm_halt
