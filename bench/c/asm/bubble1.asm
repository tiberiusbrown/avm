
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/bubble1.elf:	file format elf32-avm

Disassembly of section .text:

00000200 <_start>:
     200: d5 13        call8	0x13
     202: 04           mov	r5, r4
     203: c0 46        ldi8	r4, 0x46
     205: c2 50        ldi8	r6, 0x50
     207: f6 2d        tst16	r5
     209: fb 26        cmov.eq	r4, r6
     20b: d7 00        sys	debug_putc
     20d: c0 0a        ldi8	r4, 0xa
     20f: d7 00        sys	debug_putc
     211: d7 01        sys	debug_break
     213: d5 63        call8	0x63

00000215 <avm_test_main>:
     215: b3           push16	r3
     216: b2           push16	r2
     217: b1           push16	r1
     218: b0           push16	r0
     219: c0 00        ldi8	r4, 0x0
     21b: c1 40        ldi8	r5, 0x40
     21d: c6 00 01     ldi16	r6, 0x100
     220: 18           add	r6, r4
     221: 59           st8	[r6], r5
     222: f4 b5        dec16	r5
     224: f4 ac        inc16	r4
     226: cc 40        cmpi.s8	r4, 0x40
     228: d0 02        breq8	0x2
     22a: d4 f1        jmp8	-0xf
     22c: c2 40        ldi8	r6, 0x40
     22e: d7 01        sys	debug_break
     230: c0 00        ldi8	r4, 0x0
     232: c1 01        ldi8	r5, 0x1
     234: c7 01 01     ldi16	r7, 0x101
     237: f1 76        zext8	r6
     239: f4 b6        dec16	r6
     23b: f1 06        mov	r0, r6
     23d: f1 0d        mov	r1, r5
     23f: 08           mov	r6, r4
     240: f5 3e        ld8u	r2, [r7]
     242: f6 42        sext8	r2
     244: f1 1f        mov	r3, r7
     246: f4 b3        dec16	r3
     248: f0 6c 66     ld8u	r3, [r3]
     24b: f6 43        sext8	r3
     24d: f5 13        cmp	r2, r3
     24f: d9 09        brsge8	0x9
     251: f3 0f        st8	[r7], r3
     253: 0b           mov	r6, r7
     254: f4 b6        dec16	r6
     256: f3 0a        st8	[r6], r2
     258: f1 29        mov	r6, r1
     25a: f4 a9        inc16	r1
     25c: f4 af        inc16	r7
     25e: f4 b0        dec16	r0
     260: f6 28        tst16	r0
     262: d0 02        breq8	0x2
     264: d4 da        jmp8	-0x26
     266: 0e           mov	r7, r6
     267: f1 77        zext8	r7
     269: cf 02        cmpi.s8	r7, 0x2
     26b: d2 02        brult8	0x2
     26d: d4 c5        jmp8	-0x3b
     26f: d7 01        sys	debug_break
     271: c0 00        ldi8	r4, 0x0
     273: b8           pop16	r0
     274: b9           pop16	r1
     275: ba           pop16	r2
     276: bb           pop16	r3
     277: ef           ret

00000278 <avm_halt>:
     278: d4 fe        jmp8	-0x2
