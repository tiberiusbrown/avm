
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sieve.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 sieve.c
00000000 l    df *ABS*	00000000 runtime.c
00000500 g     F .text	00000015 _start
00000515 g     F .text	0000004a avm_test_main
0000055f g     F .text	00000002 avm_halt
00000100 g     O .data	00000384 A

Disassembly of section .text:

00000500 <_start>:
     500: d5 13        call8	avm_test_main
     502: 04           mov	r5, r4
     503: c0 46        ldi8	r4, 0x46
     505: c2 50        ldi8	r6, 0x50
     507: f6 2d        tst16	r5
     509: fb 26        cmov.eq	r4, r6
     50b: d7 00        sys	debug_putc
     50d: c0 0a        ldi8	r4, 0xa
     50f: d7 00        sys	debug_putc
     511: d7 01        sys	debug_break
     513: d5 4a        call8	avm_halt

00000515 <avm_test_main>:
     515: b1           push16	r1
     516: b0           push16	r0
     517: c0 02        ldi8	r4, 0x2
     519: c1 05        ldi8	r5, 0x5
     51b: c6 04 01     ldi16	r6, 0x104
     51e: d7 01        sys	debug_break
     520: f0 04 00 01  ldi16	r0, 0x100
     524: f2 04        add	r0, r4
     526: 0c           mov	r7, r4
     527: fe 3f        mul16	r7, r7
     529: f0 6c 00     ld8u	r0, [r0]
     52c: f4 a0        tst8	r0
     52e: d1 1d        brne8	avm_test_main+56
     530: f0 04 83 03  ldi16	r0, 0x383
     534: f5 07        cmp	r0, r7
     536: d2 15        brult8	avm_test_main+56
     538: f1 06        mov	r0, r6
     53a: f0 01 01     ldi8	r1, 0x1
     53d: f0 6d 20     st8	[r0], r1
     540: 1c           add	r7, r4
     541: f2 04        add	r0, r4
     543: f0 05 84 03  ldi16	r1, 0x384
     547: f5 2d        cmp	r7, r1
     549: d8 02        bruge8	avm_test_main+56
     54b: d4 ed        jmp8	avm_test_main+37
     54d: 19           add	r6, r5
     54e: c9 02        addi.s8	r5, 0x2
     550: f4 ac        inc16	r4
     552: cc 1e        cmpi.s8	r4, 0x1e
     554: d0 02        breq8	avm_test_main+67
     556: d4 c8        jmp8	avm_test_main+11
     558: d7 01        sys	debug_break
     55a: c0 00        ldi8	r4, 0x0
     55c: b8           pop16	r0
     55d: b9           pop16	r1
     55e: ef           ret

0000055f <avm_halt>:
     55f: d4 fe        jmp8	avm_halt
