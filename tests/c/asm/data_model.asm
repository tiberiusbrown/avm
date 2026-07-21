
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/data_model.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 data_model.c
00000100 l     O .data	00000003 .L__const.avm_test_main.data_bytes
00000535 l     O .rodata	00000003 program_bytes
00000103 l     O .data	00000012 .L__const.avm_test_main.records
00000115 l     O .data	00000002 .L__const.avm_test_main.bits
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 string.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	0000031a avm_test_main
00000530 g     F .text	00000002 avm_halt
00000532 g     F .text	00000003 memcpy

Disassembly of section .text:

00000200 <_start>:
     200: d5 14        call8	avm_test_main
     202: 04           mov	r5, r4
     203: c0 46        ldi8	r4, 0x46
     205: c2 50        ldi8	r6, 0x50
     207: f6 2d        tst16	r5
     209: fb 26        cmov.eq	r4, r6
     20b: d7 00        sys	debug_putc
     20d: c0 0a        ldi8	r4, 0xa
     20f: d7 00        sys	debug_putc
     211: d7 01        sys	debug_break
     213: e1 1a 03     call16	avm_halt

00000216 <avm_test_main>:
     216: b1           push16	r1
     217: b0           push16	r0
     218: d6 b4        adjsp	-0x4c
     21a: c2 9b        ldi8	r6, 0x9b
     21c: f0 2e 4b     stsp8	[sp+0x4b], r6
     21f: c1 f1        ldi8	r5, 0xf1
     221: f0 2d 4a     stsp8	[sp+0x4a], r5
     224: c4 60 a4     ldi16	r4, 0xa460
     227: f0 3c 48     stsp16	[sp+0x48], r4
     22a: f0 04 eb 32  ldi16	r0, 0x32eb
     22e: f0 05 a4 f8  ldi16	r1, 0xf8a4
     232: f0 38 44     stsp16	[sp+0x44], r0
     235: f0 39 46     stsp16	[sp+0x46], r1
     238: f0 04 a9 cb  ldi16	r0, 0xcba9
     23c: f0 05 ed ff  ldi16	r1, 0xffed
     240: f0 38 40     stsp16	[sp+0x40], r0
     243: f0 39 42     stsp16	[sp+0x42], r1
     246: f0 04 22 43  ldi16	r0, 0x4322
     24a: f0 05 65 87  ldi16	r1, 0x8765
     24e: f0 38 3c     stsp16	[sp+0x3c], r0
     251: f0 39 3e     stsp16	[sp+0x3e], r1
     254: f0 04 98 ba  ldi16	r0, 0xba98
     258: f0 05 dc fe  ldi16	r1, 0xfedc
     25c: f0 38 38     stsp16	[sp+0x38], r0
     25f: f0 39 3a     stsp16	[sp+0x3a], r1
     262: f0 04 10 32  ldi16	r0, 0x3210
     266: f0 05 54 76  ldi16	r1, 0x7654
     26a: f0 38 34     stsp16	[sp+0x34], r0
     26d: f0 39 36     stsp16	[sp+0x36], r1
     270: f0 1f 4b     ldsp8u	r7, [sp+0x4b]
     273: 3e           cmp	r7, r6
     274: d1 0d        brne8	avm_test_main+109
     276: f0 26 4b     ldsp8s	r6, [sp+0x4b]
     279: c7 ff ff     ldi16	r7, 0xffff
     27c: 3e           cmp	r7, r6
     27d: d9 0b        brsge8	avm_test_main+116
     27f: c0 5d        ldi8	r4, 0x5d
     281: d4 02        jmp8	avm_test_main+111
     283: c0 5c        ldi8	r4, 0x5c
     285: d6 4c        adjsp	avm_test_main+189
     287: b8           pop16	r0
     288: b9           pop16	r1
     289: ef           ret
     28a: f0 1e 4a     ldsp8u	r6, [sp+0x4a]
     28d: 39           cmp	r6, r5
     28e: d1 79        brne8	avm_test_main+243
     290: f0 1d 4a     ldsp8u	r5, [sp+0x4a]
     293: c2 c9        ldi8	r6, 0xc9
     295: 36           cmp	r5, r6
     296: d2 76        brult8	avm_test_main+248
     298: f0 35 48     ldsp16	r5, [sp+0x48]
     29b: 34           cmp	r5, r4
     29c: d1 75        brne8	avm_test_main+253
     29e: f0 34 44     ldsp16	r4, [sp+0x44]
     2a1: f0 35 46     ldsp16	r5, [sp+0x46]
     2a4: c6 eb 32     ldi16	r6, 0x32eb
     2a7: c7 a4 f8     ldi16	r7, 0xf8a4
     2aa: f0 69 8c     cmp32	q2, q3
     2ad: d1 69        brne8	avm_test_main+258
     2af: c4 a9 cb     ldi16	r4, 0xcba9
     2b2: c5 ed ff     ldi16	r5, 0xffed
     2b5: f0 36 40     ldsp16	r6, [sp+0x40]
     2b8: f0 37 42     ldsp16	r7, [sp+0x42]
     2bb: a8           xor	r6, r4
     2bc: ad           xor	r7, r5
     2bd: c4 22 43     ldi16	r4, 0x4322
     2c0: c5 65 87     ldi16	r5, 0x8765
     2c3: f0 30 3c     ldsp16	r0, [sp+0x3c]
     2c6: f0 31 3e     ldsp16	r1, [sp+0x3e]
     2c9: f9 12        xor	r0, r4
     2cb: f9 36        xor	r1, r5
     2cd: f9 19        or	r0, r6
     2cf: f9 3d        or	r1, r7
     2d1: c0 00        ldi8	r4, 0x0
     2d3: c1 00        ldi8	r5, 0x0
     2d5: f0 69 08     cmp32	q0, q2
     2d8: d1 43        brne8	avm_test_main+263
     2da: c4 56 34     ldi16	r4, 0x3456
     2dd: c1 12        ldi8	r5, 0x12
     2df: f0 36 40     ldsp16	r6, [sp+0x40]
     2e2: f0 37 42     ldsp16	r7, [sp+0x42]
     2e5: a8           xor	r6, r4
     2e6: ad           xor	r7, r5
     2e7: c4 de bc     ldi16	r4, 0xbcde
     2ea: c5 9a 78     ldi16	r5, 0x789a
     2ed: f0 30 3c     ldsp16	r0, [sp+0x3c]
     2f0: f0 31 3e     ldsp16	r1, [sp+0x3e]
     2f3: f9 12        xor	r0, r4
     2f5: f9 36        xor	r1, r5
     2f7: f9 19        or	r0, r6
     2f9: f9 3d        or	r1, r7
     2fb: c0 00        ldi8	r4, 0x0
     2fd: c1 00        ldi8	r5, 0x0
     2ff: f0 69 08     cmp32	q0, q2
     302: d1 1e        brne8	avm_test_main+268
     304: c0 63        ldi8	r4, 0x63
     306: e0 7c ff     jmp16	avm_test_main+111
     309: c0 5e        ldi8	r4, 0x5e
     30b: e0 77 ff     jmp16	avm_test_main+111
     30e: c0 5f        ldi8	r4, 0x5f
     310: e0 72 ff     jmp16	avm_test_main+111
     313: c0 60        ldi8	r4, 0x60
     315: e0 6d ff     jmp16	avm_test_main+111
     318: c0 61        ldi8	r4, 0x61
     31a: e0 68 ff     jmp16	avm_test_main+111
     31d: c0 62        ldi8	r4, 0x62
     31f: e0 63 ff     jmp16	avm_test_main+111
     322: c4 98 ba     ldi16	r4, 0xba98
     325: c5 dc fe     ldi16	r5, 0xfedc
     328: f0 36 38     ldsp16	r6, [sp+0x38]
     32b: f0 37 3a     ldsp16	r7, [sp+0x3a]
     32e: a8           xor	r6, r4
     32f: ad           xor	r7, r5
     330: c4 10 32     ldi16	r4, 0x3210
     333: c5 54 76     ldi16	r5, 0x7654
     336: f0 30 34     ldsp16	r0, [sp+0x34]
     339: f0 31 36     ldsp16	r1, [sp+0x36]
     33c: f9 12        xor	r0, r4
     33e: f9 36        xor	r1, r5
     340: f9 19        or	r0, r6
     342: f9 3d        or	r1, r7
     344: c0 00        ldi8	r4, 0x0
     346: c1 00        ldi8	r5, 0x0
     348: f0 69 08     cmp32	q0, q2
     34b: d1 30        brne8	avm_test_main+359
     34d: c4 67 45     ldi16	r4, 0x4567
     350: c5 23 01     ldi16	r5, 0x123
     353: f0 36 38     ldsp16	r6, [sp+0x38]
     356: f0 37 3a     ldsp16	r7, [sp+0x3a]
     359: a8           xor	r6, r4
     35a: ad           xor	r7, r5
     35b: c4 ef cd     ldi16	r4, 0xcdef
     35e: c5 ab 89     ldi16	r5, 0x89ab
     361: f0 30 34     ldsp16	r0, [sp+0x34]
     364: f0 31 36     ldsp16	r1, [sp+0x36]
     367: f9 12        xor	r0, r4
     369: f9 36        xor	r1, r5
     36b: f9 19        or	r0, r6
     36d: f9 3d        or	r1, r7
     36f: c0 00        ldi8	r4, 0x0
     371: c1 00        ldi8	r5, 0x0
     373: f0 69 08     cmp32	q0, q2
     376: d1 0a        brne8	avm_test_main+364
     378: c0 65        ldi8	r4, 0x65
     37a: e0 08 ff     jmp16	avm_test_main+111
     37d: c0 64        ldi8	r4, 0x64
     37f: e0 03 ff     jmp16	avm_test_main+111
     382: c0 00        ldi8	r4, 0x0
     384: c5 80 3f     ldi16	r5, 0x3f80
     387: f0 3c 30     stsp16	[sp+0x30], r4
     38a: f0 3d 32     stsp16	[sp+0x32], r5
     38d: f0 3c 2c     stsp16	[sp+0x2c], r4
     390: f0 3d 2e     stsp16	[sp+0x2e], r5
     393: f0 3c 28     stsp16	[sp+0x28], r4
     396: f0 3d 2a     stsp16	[sp+0x2a], r5
     399: c0 00        ldi8	r4, 0x0
     39b: c5 80 3f     ldi16	r5, 0x3f80
     39e: f0 36 30     ldsp16	r6, [sp+0x30]
     3a1: f0 37 32     ldsp16	r7, [sp+0x32]
     3a4: ff c8 0e     fcmp	r0, q3, q2
     3a7: f0 36 2c     ldsp16	r6, [sp+0x2c]
     3aa: f0 37 2e     ldsp16	r7, [sp+0x2e]
     3ad: f0 34 28     ldsp16	r4, [sp+0x28]
     3b0: f0 35 2a     ldsp16	r5, [sp+0x2a]
     3b3: f6 28        tst16	r0
     3b5: f8 08        cset.ne	r0
     3b7: f6 28        tst16	r0
     3b9: d1 4d        brne8	avm_test_main+498
     3bb: f0 00 00     ldi8	r0, 0x0
     3be: f0 05 80 3f  ldi16	r1, 0x3f80
     3c2: ff c8 6c     fcmp	r6, q3, q0
     3c5: f6 2e        tst16	r6
     3c7: f8 0e        cset.ne	r6
     3c9: f6 2e        tst16	r6
     3cb: d1 40        brne8	avm_test_main+503
     3cd: c2 00        ldi8	r6, 0x0
     3cf: c7 80 3f     ldi16	r7, 0x3f80
     3d2: ff c8 4b     fcmp	r4, q2, q3
     3d5: f6 2c        tst16	r4
     3d7: f8 0c        cset.ne	r4
     3d9: f6 2c        tst16	r4
     3db: d1 35        brne8	avm_test_main+508
     3dd: c4 00 01     ldi16	r4, 0x100
     3e0: f0 6c d9     ld16	r6, [r4+]
     3e3: f0 6c e8     ld8u	r7, [r4]
     3e6: f0 3e 25     stsp16	[sp+0x25], r6
     3e9: f0 2f 27     stsp8	[sp+0x27], r7
     3ec: f0 14 25     leasp	r4, 0x25
     3ef: f0 3c 23     stsp16	[sp+0x23], r4
     3f2: c6 35 05     ldi16	r6, 0x535
     3f5: c3 00        ldi8	r7, 0x0
     3f7: f0 3e 20     stsp16	[sp+0x20], r6
     3fa: f0 2f 22     stsp8	[sp+0x22], r7
     3fd: f0 35 23     ldsp16	r5, [sp+0x23]
     400: 34           cmp	r5, r4
     401: d0 14        breq8	avm_test_main+513
     403: c0 78        ldi8	r4, 0x78
     405: e0 7d fe     jmp16	avm_test_main+111
     408: c0 6e        ldi8	r4, 0x6e
     40a: e0 78 fe     jmp16	avm_test_main+111
     40d: c0 6f        ldi8	r4, 0x6f
     40f: e0 73 fe     jmp16	avm_test_main+111
     412: c0 70        ldi8	r4, 0x70
     414: e0 6e fe     jmp16	avm_test_main+111
     417: f0 34 23     ldsp16	r4, [sp+0x23]
     41a: c8 02        addi.s8	r4, 0x2
     41c: 40           ld8u	r4, [r4]
     41d: cc 65        cmpi.s8	r4, 0x65
     41f: d1 17        brne8	avm_test_main+546
     421: c4 35 05     ldi16	r4, 0x535
     424: c1 00        ldi8	r5, 0x0
     426: f1 75        zext8	r5
     428: f0 36 20     ldsp16	r6, [sp+0x20]
     42b: f0 1f 22     ldsp8u	r7, [sp+0x22]
     42e: f0 69 c8     cmp32	q3, q2
     431: d0 0a        breq8	avm_test_main+551
     433: c0 7a        ldi8	r4, 0x7a
     435: e0 4d fe     jmp16	avm_test_main+111
     438: c0 79        ldi8	r4, 0x79
     43a: e0 48 fe     jmp16	avm_test_main+111
     43d: c0 01        ldi8	r4, 0x1
     43f: c1 00        ldi8	r5, 0x0
     441: f0 36 20     ldsp16	r6, [sp+0x20]
     444: f0 1f 22     ldsp8u	r7, [sp+0x22]
     447: f7 6e        add32	q3, q2
     449: f0 60 8c     ldp8u	r4, [q3]
     44c: cc 34        cmpi.s8	r4, 0x34
     44e: db cb 00     brne16	avm_test_main+774
     451: f0 44 03 01  ldm8u	r4, [0x103]
     455: f0 2c 1f     stsp8	[sp+0x1f], r4
     458: f0 44 04 01  ldm8u	r4, [0x104]
     45c: f0 2c 1e     stsp8	[sp+0x1e], r4
     45f: f0 44 05 01  ldm8u	r4, [0x105]
     463: f0 2c 1d     stsp8	[sp+0x1d], r4
     466: f0 44 06 01  ldm8u	r4, [0x106]
     46a: f0 2c 1c     stsp8	[sp+0x1c], r4
     46d: f0 44 07 01  ldm8u	r4, [0x107]
     471: f0 2c 1b     stsp8	[sp+0x1b], r4
     474: f0 44 08 01  ldm8u	r4, [0x108]
     478: f0 2c 1a     stsp8	[sp+0x1a], r4
     47b: f0 54 09 01  ldm16	r4, [0x109]
     47f: f0 3c 18     stsp16	[sp+0x18], r4
     482: f0 44 0b 01  ldm8u	r4, [0x10b]
     486: f0 2c 17     stsp8	[sp+0x17], r4
     489: f0 14 08     leasp	r4, 0x8
     48c: c5 0c 01     ldi16	r5, 0x10c
     48f: c2 09        ldi8	r6, 0x9
     491: e1 9e 00     call16	memcpy
     494: f0 1c 1f     ldsp8u	r4, [sp+0x1f]
     497: cc 11        cmpi.s8	r4, 0x11
     499: db 85 00     brne16	avm_test_main+779
     49c: c0 83        ldi8	r4, 0x83
     49e: f0 1d 1e     ldsp8u	r5, [sp+0x1e]
     4a1: cd 33        cmpi.s8	r5, 0x33
     4a3: db df fd     brne16	avm_test_main+111
     4a6: f0 1d 1d     ldsp8u	r5, [sp+0x1d]
     4a9: cd 22        cmpi.s8	r5, 0x22
     4ab: db d7 fd     brne16	avm_test_main+111
     4ae: c0 84        ldi8	r4, 0x84
     4b0: f0 1d 1c     ldsp8u	r5, [sp+0x1c]
     4b3: cd 55        cmpi.s8	r5, 0x55
     4b5: db cd fd     brne16	avm_test_main+111
     4b8: f0 1d 1b     ldsp8u	r5, [sp+0x1b]
     4bb: cd 44        cmpi.s8	r5, 0x44
     4bd: db c5 fd     brne16	avm_test_main+111
     4c0: c0 85        ldi8	r4, 0x85
     4c2: f0 1d 1a     ldsp8u	r5, [sp+0x1a]
     4c5: c2 99        ldi8	r6, 0x99
     4c7: 36           cmp	r5, r6
     4c8: db ba fd     brne16	avm_test_main+111
     4cb: f0 1d 17     ldsp8u	r5, [sp+0x17]
     4ce: cd 66        cmpi.s8	r5, 0x66
     4d0: db b2 fd     brne16	avm_test_main+111
     4d3: c4 34 12     ldi16	r4, 0x1234
     4d6: f4 58        stsp16	[sp+0x6], r4
     4d8: f4 19        ldsp16	r5, [sp+0x6]
     4da: 34           cmp	r5, r4
     4db: d1 49        brne8	avm_test_main+784
     4dd: f0 54 15 01  ldm16	r4, [0x115]
     4e1: f4 50        stsp16	[sp+0x4], r4
     4e3: c0 07        ldi8	r4, 0x7
     4e5: f4 11        ldsp16	r5, [sp+0x4]
     4e7: 84           and	r5, r4
     4e8: c0 91        ldi8	r4, 0x91
     4ea: cd 05        cmpi.s8	r5, 0x5
     4ec: db 96 fd     brne16	avm_test_main+111
     4ef: c1 f8        ldi8	r5, 0xf8
     4f1: f4 12        ldsp16	r6, [sp+0x4]
     4f3: 89           and	r6, r5
     4f4: c1 88        ldi8	r5, 0x88
     4f6: 39           cmp	r6, r5
     4f7: db 8b fd     brne16	avm_test_main+111
     4fa: c5 00 ff     ldi16	r5, 0xff00
     4fd: f4 12        ldsp16	r6, [sp+0x4]
     4ff: 89           and	r6, r5
     500: c5 00 a5     ldi16	r5, 0xa500
     503: 39           cmp	r6, r5
     504: db 7e fd     brne16	avm_test_main+111
     507: f3 50        ldsp8u	r4, [sp+0x4]
     509: c1 8d        ldi8	r5, 0x8d
     50b: 31           cmp	r4, r5
     50c: d1 1d        brne8	avm_test_main+789
     50e: c1 a5        ldi8	r5, 0xa5
     510: f3 56        ldsp8u	r6, [sp+0x5]
     512: c0 93        ldi8	r4, 0x93
     514: c3 00        ldi8	r7, 0x0
     516: 39           cmp	r6, r5
     517: fb 27        cmov.eq	r4, r7
     519: e0 69 fd     jmp16	avm_test_main+111
     51c: c0 7b        ldi8	r4, 0x7b
     51e: e0 64 fd     jmp16	avm_test_main+111
     521: c0 82        ldi8	r4, 0x82
     523: e0 5f fd     jmp16	avm_test_main+111
     526: c0 8b        ldi8	r4, 0x8b
     528: e0 5a fd     jmp16	avm_test_main+111
     52b: c0 92        ldi8	r4, 0x92
     52d: e0 55 fd     jmp16	avm_test_main+111

00000530 <avm_halt>:
     530: d4 fe        jmp8	avm_halt

00000532 <memcpy>:
     532: d7 0f        sys	memcpy
     534: ef           ret
