
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble4.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble4.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000006f avm_test_main
00000284 g     F .text	00000002 avm_halt
00000100 g     O .data	00000100 A

Disassembly of section .text:

00000200 <_start>:
     200: d5 13        call8	avm_test_main
     202: 04           mov	r5, r4
     203: c0 46        ldi8	r4, 0x46
     205: c2 50        ldi8	r6, 0x50
     207: f6 2d        tst16	r5
     209: fb 26        cmov.eq	r4, r6
     20b: d7 00        sys	debug_putc
     20d: c0 0a        ldi8	r4, 0xa
     20f: d7 00        sys	debug_putc
     211: d7 01        sys	debug_break
     213: d5 6f        call8	avm_halt

00000215 <avm_test_main>:
     215: b3           push16	r3
     216: b2           push16	r2
     217: b1           push16	r1
     218: b0           push16	r0
     219: d6 fc        adjsp	avm_test_main+2
     21b: c0 40        ldi8	r4, 0x40
     21d: c5 00 01     ldi16	r5, 0x100
     220: 08           mov	r6, r4
     221: c7 00 00     ldi16	r7, 0x0
     224: f0 6b ca     st32	[r5], q3
     227: c9 04        addi.s8	r5, 0x4
     229: f4 b4        dec16	r4
     22b: f6 2c        tst16	r4
     22d: d0 02        breq8	avm_test_main+28
     22f: d4 ef        jmp8	avm_test_main+11
     231: c2 40        ldi8	r6, 0x40
     233: d7 01        sys	debug_break
     235: c0 00        ldi8	r4, 0x0
     237: f4 48        stsp16	[sp+0x2], r4
     239: c0 01        ldi8	r4, 0x1
     23b: f4 40        stsp16	[sp+0x0], r4
     23d: c7 04 01     ldi16	r7, 0x104
     240: f1 76        zext8	r6
     242: f4 b6        dec16	r6
     244: f1 06        mov	r0, r6
     246: f0 31 00     ldsp16	r1, [sp+0x0]
     249: f4 0a        ldsp16	r6, [sp+0x2]
     24b: f0 6a 4e     ld32	q1, [r7]
     24e: 03           mov	r4, r7
     24f: c8 fc        addi.s8	r4, -0x4
     251: f0 6a 88     ld32	q2, [r4]
     254: f0 69 48     cmp32	q1, q2
     257: d9 0b        brsge8	avm_test_main+79
     259: f0 6b 8e     st32	[r7], q2
     25c: 03           mov	r4, r7
     25d: c8 fc        addi.s8	r4, -0x4
     25f: f0 6b 48     st32	[r4], q1
     262: f1 29        mov	r6, r1
     264: f4 a9        inc16	r1
     266: cb 04        addi.s8	r7, 0x4
     268: f4 b0        dec16	r0
     26a: f6 28        tst16	r0
     26c: d0 02        breq8	avm_test_main+91
     26e: d4 db        jmp8	avm_test_main+54
     270: 02           mov	r4, r6
     271: f1 74        zext8	r4
     273: cc 02        cmpi.s8	r4, 0x2
     275: d2 02        brult8	avm_test_main+100
     277: d4 c4        jmp8	avm_test_main+40
     279: d7 01        sys	debug_break
     27b: c0 00        ldi8	r4, 0x0
     27d: d6 04        adjsp	avm_test_main+110
     27f: b8           pop16	r0
     280: b9           pop16	r1
     281: ba           pop16	r2
     282: bb           pop16	r3
     283: ef           ret

00000284 <avm_halt>:
     284: d4 fe        jmp8	avm_halt
