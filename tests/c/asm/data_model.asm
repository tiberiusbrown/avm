
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/data_model.elf:	file format elf32-avm

Disassembly of section .text:

00000200 <_start>:
     200: d5 16        call8	0x16
     202: 04           mov	r5, r4
     203: c0 46        ldi8	r4, 0x46
     205: c2 50        ldi8	r6, 0x50
     207: f6 2d        tst16	r5
     209: fb 26        cmov.eq	r4, r6
     20b: d7 00        sys	debug_putc
     20d: c0 0a        ldi8	r4, 0xa
     20f: d7 00        sys	debug_putc
     211: d7 01        sys	debug_break
     213: e1 1e 03     call16	798
     216: 00           nop
     217: 00           nop

00000218 <avm_test_main>:
     218: b1           push16	r1
     219: b0           push16	r0
     21a: d6 b4        adjsp	-0x4c
     21c: c2 9b        ldi8	r6, 0x9b
     21e: f0 2e 4b     stsp8	[sp+0x4b], r6
     221: c1 f1        ldi8	r5, 0xf1
     223: f0 2d 4a     stsp8	[sp+0x4a], r5
     226: c4 60 a4     ldi16	r4, 0xa460
     229: f0 3c 48     stsp16	[sp+0x48], r4
     22c: f0 04 eb 32  ldi16	r0, 0x32eb
     230: f0 05 a4 f8  ldi16	r1, 0xf8a4
     234: f0 38 44     stsp16	[sp+0x44], r0
     237: f0 39 46     stsp16	[sp+0x46], r1
     23a: f0 04 a9 cb  ldi16	r0, 0xcba9
     23e: f0 05 ed ff  ldi16	r1, 0xffed
     242: f0 38 40     stsp16	[sp+0x40], r0
     245: f0 39 42     stsp16	[sp+0x42], r1
     248: f0 04 22 43  ldi16	r0, 0x4322
     24c: f0 05 65 87  ldi16	r1, 0x8765
     250: f0 38 3c     stsp16	[sp+0x3c], r0
     253: f0 39 3e     stsp16	[sp+0x3e], r1
     256: f0 04 98 ba  ldi16	r0, 0xba98
     25a: f0 05 dc fe  ldi16	r1, 0xfedc
     25e: f0 38 38     stsp16	[sp+0x38], r0
     261: f0 39 3a     stsp16	[sp+0x3a], r1
     264: f0 04 10 32  ldi16	r0, 0x3210
     268: f0 05 54 76  ldi16	r1, 0x7654
     26c: f0 38 34     stsp16	[sp+0x34], r0
     26f: f0 39 36     stsp16	[sp+0x36], r1
     272: f0 1f 4b     ldsp8u	r7, [sp+0x4b]
     275: 3e           cmp	r7, r6
     276: d1 0d        brne8	0xd
     278: f0 26 4b     ldsp8s	r6, [sp+0x4b]
     27b: c7 ff ff     ldi16	r7, 0xffff
     27e: 3e           cmp	r7, r6
     27f: d9 0b        brsge8	0xb
     281: c0 5d        ldi8	r4, 0x5d
     283: d4 02        jmp8	0x2
     285: c0 5c        ldi8	r4, 0x5c
     287: d6 4c        adjsp	0x4c
     289: b8           pop16	r0
     28a: b9           pop16	r1
     28b: ef           ret
     28c: f0 1e 4a     ldsp8u	r6, [sp+0x4a]
     28f: 39           cmp	r6, r5
     290: d1 79        brne8	0x79
     292: f0 1d 4a     ldsp8u	r5, [sp+0x4a]
     295: c2 c9        ldi8	r6, 0xc9
     297: 36           cmp	r5, r6
     298: d2 76        brult8	0x76
     29a: f0 35 48     ldsp16	r5, [sp+0x48]
     29d: 34           cmp	r5, r4
     29e: d1 75        brne8	0x75
     2a0: f0 34 44     ldsp16	r4, [sp+0x44]
     2a3: f0 35 46     ldsp16	r5, [sp+0x46]
     2a6: c6 eb 32     ldi16	r6, 0x32eb
     2a9: c7 a4 f8     ldi16	r7, 0xf8a4
     2ac: f0 69 8c     cmp32	q2, q3
     2af: d1 69        brne8	0x69
     2b1: c4 a9 cb     ldi16	r4, 0xcba9
     2b4: c5 ed ff     ldi16	r5, 0xffed
     2b7: f0 36 40     ldsp16	r6, [sp+0x40]
     2ba: f0 37 42     ldsp16	r7, [sp+0x42]
     2bd: a8           xor	r6, r4
     2be: ad           xor	r7, r5
     2bf: c4 22 43     ldi16	r4, 0x4322
     2c2: c5 65 87     ldi16	r5, 0x8765
     2c5: f0 30 3c     ldsp16	r0, [sp+0x3c]
     2c8: f0 31 3e     ldsp16	r1, [sp+0x3e]
     2cb: f9 12        xor	r0, r4
     2cd: f9 36        xor	r1, r5
     2cf: f9 19        or	r0, r6
     2d1: f9 3d        or	r1, r7
     2d3: c0 00        ldi8	r4, 0x0
     2d5: c1 00        ldi8	r5, 0x0
     2d7: f0 69 08     cmp32	q0, q2
     2da: d1 43        brne8	0x43
     2dc: c4 56 34     ldi16	r4, 0x3456
     2df: c1 12        ldi8	r5, 0x12
     2e1: f0 36 40     ldsp16	r6, [sp+0x40]
     2e4: f0 37 42     ldsp16	r7, [sp+0x42]
     2e7: a8           xor	r6, r4
     2e8: ad           xor	r7, r5
     2e9: c4 de bc     ldi16	r4, 0xbcde
     2ec: c5 9a 78     ldi16	r5, 0x789a
     2ef: f0 30 3c     ldsp16	r0, [sp+0x3c]
     2f2: f0 31 3e     ldsp16	r1, [sp+0x3e]
     2f5: f9 12        xor	r0, r4
     2f7: f9 36        xor	r1, r5
     2f9: f9 19        or	r0, r6
     2fb: f9 3d        or	r1, r7
     2fd: c0 00        ldi8	r4, 0x0
     2ff: c1 00        ldi8	r5, 0x0
     301: f0 69 08     cmp32	q0, q2
     304: d1 1e        brne8	0x1e
     306: c0 63        ldi8	r4, 0x63
     308: e0 7c ff     jmp16	-132
     30b: c0 5e        ldi8	r4, 0x5e
     30d: e0 77 ff     jmp16	-137
     310: c0 5f        ldi8	r4, 0x5f
     312: e0 72 ff     jmp16	-142
     315: c0 60        ldi8	r4, 0x60
     317: e0 6d ff     jmp16	-147
     31a: c0 61        ldi8	r4, 0x61
     31c: e0 68 ff     jmp16	-152
     31f: c0 62        ldi8	r4, 0x62
     321: e0 63 ff     jmp16	-157
     324: c4 98 ba     ldi16	r4, 0xba98
     327: c5 dc fe     ldi16	r5, 0xfedc
     32a: f0 36 38     ldsp16	r6, [sp+0x38]
     32d: f0 37 3a     ldsp16	r7, [sp+0x3a]
     330: a8           xor	r6, r4
     331: ad           xor	r7, r5
     332: c4 10 32     ldi16	r4, 0x3210
     335: c5 54 76     ldi16	r5, 0x7654
     338: f0 30 34     ldsp16	r0, [sp+0x34]
     33b: f0 31 36     ldsp16	r1, [sp+0x36]
     33e: f9 12        xor	r0, r4
     340: f9 36        xor	r1, r5
     342: f9 19        or	r0, r6
     344: f9 3d        or	r1, r7
     346: c0 00        ldi8	r4, 0x0
     348: c1 00        ldi8	r5, 0x0
     34a: f0 69 08     cmp32	q0, q2
     34d: d1 30        brne8	0x30
     34f: c4 67 45     ldi16	r4, 0x4567
     352: c5 23 01     ldi16	r5, 0x123
     355: f0 36 38     ldsp16	r6, [sp+0x38]
     358: f0 37 3a     ldsp16	r7, [sp+0x3a]
     35b: a8           xor	r6, r4
     35c: ad           xor	r7, r5
     35d: c4 ef cd     ldi16	r4, 0xcdef
     360: c5 ab 89     ldi16	r5, 0x89ab
     363: f0 30 34     ldsp16	r0, [sp+0x34]
     366: f0 31 36     ldsp16	r1, [sp+0x36]
     369: f9 12        xor	r0, r4
     36b: f9 36        xor	r1, r5
     36d: f9 19        or	r0, r6
     36f: f9 3d        or	r1, r7
     371: c0 00        ldi8	r4, 0x0
     373: c1 00        ldi8	r5, 0x0
     375: f0 69 08     cmp32	q0, q2
     378: d1 0a        brne8	0xa
     37a: c0 65        ldi8	r4, 0x65
     37c: e0 08 ff     jmp16	-248
     37f: c0 64        ldi8	r4, 0x64
     381: e0 03 ff     jmp16	-253
     384: c0 00        ldi8	r4, 0x0
     386: c5 80 3f     ldi16	r5, 0x3f80
     389: f0 3c 30     stsp16	[sp+0x30], r4
     38c: f0 3d 32     stsp16	[sp+0x32], r5
     38f: f0 3c 2c     stsp16	[sp+0x2c], r4
     392: f0 3d 2e     stsp16	[sp+0x2e], r5
     395: f0 3c 28     stsp16	[sp+0x28], r4
     398: f0 3d 2a     stsp16	[sp+0x2a], r5
     39b: c0 00        ldi8	r4, 0x0
     39d: c5 80 3f     ldi16	r5, 0x3f80
     3a0: f0 36 30     ldsp16	r6, [sp+0x30]
     3a3: f0 37 32     ldsp16	r7, [sp+0x32]
     3a6: ff c8 0e     fcmp	r0, q3, q2
     3a9: f0 36 2c     ldsp16	r6, [sp+0x2c]
     3ac: f0 37 2e     ldsp16	r7, [sp+0x2e]
     3af: f0 34 28     ldsp16	r4, [sp+0x28]
     3b2: f0 35 2a     ldsp16	r5, [sp+0x2a]
     3b5: f6 28        tst16	r0
     3b7: f8 08        cset.ne	r0
     3b9: f6 28        tst16	r0
     3bb: d1 4d        brne8	0x4d
     3bd: f0 00 00     ldi8	r0, 0x0
     3c0: f0 05 80 3f  ldi16	r1, 0x3f80
     3c4: ff c8 6c     fcmp	r6, q3, q0
     3c7: f6 2e        tst16	r6
     3c9: f8 0e        cset.ne	r6
     3cb: f6 2e        tst16	r6
     3cd: d1 40        brne8	0x40
     3cf: c2 00        ldi8	r6, 0x0
     3d1: c7 80 3f     ldi16	r7, 0x3f80
     3d4: ff c8 4b     fcmp	r4, q2, q3
     3d7: f6 2c        tst16	r4
     3d9: f8 0c        cset.ne	r4
     3db: f6 2c        tst16	r4
     3dd: d1 35        brne8	0x35
     3df: c4 00 01     ldi16	r4, 0x100
     3e2: f0 6c d9     ld16	r6, [r4+]
     3e5: f0 6c e8     ld8u	r7, [r4]
     3e8: f0 3e 25     stsp16	[sp+0x25], r6
     3eb: f0 2f 27     stsp8	[sp+0x27], r7
     3ee: f0 14 25     leasp	r4, 0x25
     3f1: f0 3c 23     stsp16	[sp+0x23], r4
     3f4: c6 41 05     ldi16	r6, 0x541
     3f7: c3 00        ldi8	r7, 0x0
     3f9: f0 3e 20     stsp16	[sp+0x20], r6
     3fc: f0 2f 22     stsp8	[sp+0x22], r7
     3ff: f0 35 23     ldsp16	r5, [sp+0x23]
     402: 34           cmp	r5, r4
     403: d0 14        breq8	0x14
     405: c0 78        ldi8	r4, 0x78
     407: e0 7d fe     jmp16	-387
     40a: c0 6e        ldi8	r4, 0x6e
     40c: e0 78 fe     jmp16	-392
     40f: c0 6f        ldi8	r4, 0x6f
     411: e0 73 fe     jmp16	-397
     414: c0 70        ldi8	r4, 0x70
     416: e0 6e fe     jmp16	-402
     419: f0 34 23     ldsp16	r4, [sp+0x23]
     41c: c8 02        addi.s8	r4, 0x2
     41e: 40           ld8u	r4, [r4]
     41f: cc 65        cmpi.s8	r4, 0x65
     421: d1 17        brne8	0x17
     423: c4 41 05     ldi16	r4, 0x541
     426: c1 00        ldi8	r5, 0x0
     428: f1 75        zext8	r5
     42a: f0 36 20     ldsp16	r6, [sp+0x20]
     42d: f0 1f 22     ldsp8u	r7, [sp+0x22]
     430: f0 69 c8     cmp32	q3, q2
     433: d0 0a        breq8	0xa
     435: c0 7a        ldi8	r4, 0x7a
     437: e0 4d fe     jmp16	-435
     43a: c0 79        ldi8	r4, 0x79
     43c: e0 48 fe     jmp16	-440
     43f: c0 01        ldi8	r4, 0x1
     441: c1 00        ldi8	r5, 0x0
     443: f0 36 20     ldsp16	r6, [sp+0x20]
     446: f0 1f 22     ldsp8u	r7, [sp+0x22]
     449: f7 6e        add32	q3, q2
     44b: f0 60 8c     ldp8u	r4, [q3]
     44e: cc 34        cmpi.s8	r4, 0x34
     450: db cb 00     brne16	0xcb
     453: f0 44 03 01  ldm8u	r4, [0x103]
     457: f0 2c 1f     stsp8	[sp+0x1f], r4
     45a: f0 44 04 01  ldm8u	r4, [0x104]
     45e: f0 2c 1e     stsp8	[sp+0x1e], r4
     461: f0 44 05 01  ldm8u	r4, [0x105]
     465: f0 2c 1d     stsp8	[sp+0x1d], r4
     468: f0 44 06 01  ldm8u	r4, [0x106]
     46c: f0 2c 1c     stsp8	[sp+0x1c], r4
     46f: f0 44 07 01  ldm8u	r4, [0x107]
     473: f0 2c 1b     stsp8	[sp+0x1b], r4
     476: f0 44 08 01  ldm8u	r4, [0x108]
     47a: f0 2c 1a     stsp8	[sp+0x1a], r4
     47d: f0 54 09 01  ldm16	r4, [0x109]
     481: f0 3c 18     stsp16	[sp+0x18], r4
     484: f0 44 0b 01  ldm8u	r4, [0x10b]
     488: f0 2c 17     stsp8	[sp+0x17], r4
     48b: f0 14 08     leasp	r4, 0x8
     48e: c5 0c 01     ldi16	r5, 0x10c
     491: c2 09        ldi8	r6, 0x9
     493: e1 a2 00     call16	162
     496: f0 1c 1f     ldsp8u	r4, [sp+0x1f]
     499: cc 11        cmpi.s8	r4, 0x11
     49b: db 85 00     brne16	0x85
     49e: c0 83        ldi8	r4, 0x83
     4a0: f0 1d 1e     ldsp8u	r5, [sp+0x1e]
     4a3: cd 33        cmpi.s8	r5, 0x33
     4a5: db df fd     brne16	-0x221
     4a8: f0 1d 1d     ldsp8u	r5, [sp+0x1d]
     4ab: cd 22        cmpi.s8	r5, 0x22
     4ad: db d7 fd     brne16	-0x229
     4b0: c0 84        ldi8	r4, 0x84
     4b2: f0 1d 1c     ldsp8u	r5, [sp+0x1c]
     4b5: cd 55        cmpi.s8	r5, 0x55
     4b7: db cd fd     brne16	-0x233
     4ba: f0 1d 1b     ldsp8u	r5, [sp+0x1b]
     4bd: cd 44        cmpi.s8	r5, 0x44
     4bf: db c5 fd     brne16	-0x23b
     4c2: c0 85        ldi8	r4, 0x85
     4c4: f0 1d 1a     ldsp8u	r5, [sp+0x1a]
     4c7: c2 99        ldi8	r6, 0x99
     4c9: 36           cmp	r5, r6
     4ca: db ba fd     brne16	-0x246
     4cd: f0 1d 17     ldsp8u	r5, [sp+0x17]
     4d0: cd 66        cmpi.s8	r5, 0x66
     4d2: db b2 fd     brne16	-0x24e
     4d5: c4 34 12     ldi16	r4, 0x1234
     4d8: f4 58        stsp16	[sp+0x6], r4
     4da: f4 19        ldsp16	r5, [sp+0x6]
     4dc: 34           cmp	r5, r4
     4dd: d1 49        brne8	0x49
     4df: f0 54 15 01  ldm16	r4, [0x115]
     4e3: f4 50        stsp16	[sp+0x4], r4
     4e5: c0 07        ldi8	r4, 0x7
     4e7: f4 11        ldsp16	r5, [sp+0x4]
     4e9: 84           and	r5, r4
     4ea: c0 91        ldi8	r4, 0x91
     4ec: cd 05        cmpi.s8	r5, 0x5
     4ee: db 96 fd     brne16	-0x26a
     4f1: c1 f8        ldi8	r5, 0xf8
     4f3: f4 12        ldsp16	r6, [sp+0x4]
     4f5: 89           and	r6, r5
     4f6: c1 88        ldi8	r5, 0x88
     4f8: 39           cmp	r6, r5
     4f9: db 8b fd     brne16	-0x275
     4fc: c5 00 ff     ldi16	r5, 0xff00
     4ff: f4 12        ldsp16	r6, [sp+0x4]
     501: 89           and	r6, r5
     502: c5 00 a5     ldi16	r5, 0xa500
     505: 39           cmp	r6, r5
     506: db 7e fd     brne16	-0x282
     509: f3 50        ldsp8u	r4, [sp+0x4]
     50b: c1 8d        ldi8	r5, 0x8d
     50d: 31           cmp	r4, r5
     50e: d1 1d        brne8	0x1d
     510: c1 a5        ldi8	r5, 0xa5
     512: f3 56        ldsp8u	r6, [sp+0x5]
     514: c0 93        ldi8	r4, 0x93
     516: c3 00        ldi8	r7, 0x0
     518: 39           cmp	r6, r5
     519: fb 27        cmov.eq	r4, r7
     51b: e0 69 fd     jmp16	-663
     51e: c0 7b        ldi8	r4, 0x7b
     520: e0 64 fd     jmp16	-668
     523: c0 82        ldi8	r4, 0x82
     525: e0 5f fd     jmp16	-673
     528: c0 8b        ldi8	r4, 0x8b
     52a: e0 5a fd     jmp16	-678
     52d: c0 92        ldi8	r4, 0x92
     52f: e0 55 fd     jmp16	-683
     532: 00           nop
     533: 00           nop

00000534 <avm_halt>:
     534: d4 fe        jmp8	-0x2
     536: 00           nop
     537: 00           nop

00000538 <memcpy>:
     538: d7 0f        sys	memcpy
     53a: ef           ret

0000053b <memset>:
     53b: d7 11        sys	memset
     53d: ef           ret

0000053e <memmove>:
     53e: d7 12        sys	memmove
     540: ef           ret
