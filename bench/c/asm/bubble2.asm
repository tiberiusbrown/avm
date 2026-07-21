
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble2.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 bubble2.c
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000005e avm_test_main
00000273 g     F .text	00000002 avm_halt
00000100 g     O .data	00000080 A

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
     213: d5 5e        call8	avm_halt

00000215 <avm_test_main>:
     215: b3           push16	r3
     216: b2           push16	r2
     217: b1           push16	r1
     218: b0           push16	r0
     219: c0 40        ldi8	r4, 0x40
     21b: c5 00 01     ldi16	r5, 0x100
     21e: f7 4c        st16	[r7+], r4
     220: f4 b4        dec16	r4
     222: f6 2c        tst16	r4
     224: d0 02        breq8	avm_test_main+19
     226: d4 f6        jmp8	avm_test_main+9
     228: c2 40        ldi8	r6, 0x40
     22a: d7 01        sys	debug_break
     22c: c0 00        ldi8	r4, 0x0
     22e: c1 01        ldi8	r5, 0x1
     230: c7 02 01     ldi16	r7, 0x102
     233: f1 76        zext8	r6
     235: f4 b6        dec16	r6
     237: f1 06        mov	r0, r6
     239: f1 0d        mov	r1, r5
     23b: 08           mov	r6, r4
     23c: f5 4e        ld16	r2, [r7]
     23e: f1 1f        mov	r3, r7
     240: f0 0b fe     addi.s8	r3, -0x2
     243: f0 6c 76     ld16	r3, [r3]
     246: f5 13        cmp	r2, r3
     248: d9 0b        brsge8	avm_test_main+64
     24a: f6 43        sext8	r3
     24c: f5 5f        st16	[r7], r3
     24e: 0b           mov	r6, r7
     24f: ca fe        addi.s8	r6, -0x2
     251: f5 5a        st16	[r6], r2
     253: f1 29        mov	r6, r1
     255: f4 a9        inc16	r1
     257: cb 02        addi.s8	r7, 0x2
     259: f4 b0        dec16	r0
     25b: f6 28        tst16	r0
     25d: d0 02        breq8	avm_test_main+76
     25f: d4 db        jmp8	avm_test_main+39
     261: 0e           mov	r7, r6
     262: f1 77        zext8	r7
     264: cf 02        cmpi.s8	r7, 0x2
     266: d2 02        brult8	avm_test_main+85
     268: d4 c6        jmp8	avm_test_main+27
     26a: d7 01        sys	debug_break
     26c: c0 00        ldi8	r4, 0x0
     26e: b8           pop16	r0
     26f: b9           pop16	r1
     270: ba           pop16	r2
     271: bb           pop16	r3
     272: ef           ret

00000273 <avm_halt>:
     273: d4 fe        jmp8	avm_halt
