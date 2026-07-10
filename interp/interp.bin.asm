
interp.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 41 00 	jmp	0x82	; 0x82 <reset_handler>
   4:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
   8:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
   c:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  10:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  14:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  18:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  1c:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  20:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  24:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  28:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  2c:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  30:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  34:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  38:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  3c:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  40:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  44:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  48:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  4c:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  50:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  54:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  58:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  5c:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  60:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  64:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  68:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  6c:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  70:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  74:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  78:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>
  7c:	0c 94 40 00 	jmp	0x80	; 0x80 <default_isr>

00000080 <default_isr>:
  80:	ff cf       	rjmp	.-2      	; 0x80 <default_isr>

00000082 <reset_handler>:
  82:	22 24       	eor	r2, r2
  84:	80 e2       	ldi	r24, 0x20	; 32
  86:	78 2e       	mov	r7, r24

00000088 <reset_loop>:
  88:	ff cf       	rjmp	.-2      	; 0x88 <reset_loop>

0000008a <__ctors_end>:
	...

00000100 <I_00__CLR_c0>:
 100:	c8 95       	lpm
 102:	00 27       	eor	r16, r16
 104:	11 27       	eor	r17, r17
 106:	01 96       	adiw	r24, 0x01	; 1
 108:	f8 94       	cli
 10a:	2e bc       	out	0x2e, r2	; 46
 10c:	6e b4       	in	r6, 0x2e	; 46
 10e:	78 94       	sei
 110:	67 9c       	mul	r6, r7
 112:	f0 01       	movw	r30, r0
 114:	e3 95       	inc	r30
 116:	09 94       	ijmp
	...

00000140 <I_01__MOV_c0_c1>:
 140:	00 c0       	rjmp	.+0      	; 0x142 <I_01__MOV_c0_c1+0x2>
 142:	00 c0       	rjmp	.+0      	; 0x144 <I_01__MOV_c0_c1+0x4>
 144:	89 01       	movw	r16, r18
 146:	01 96       	adiw	r24, 0x01	; 1
 148:	f8 94       	cli
 14a:	2e bc       	out	0x2e, r2	; 46
 14c:	6e b4       	in	r6, 0x2e	; 46
 14e:	78 94       	sei
 150:	67 9c       	mul	r6, r7
 152:	f0 01       	movw	r30, r0
 154:	e3 95       	inc	r30
 156:	09 94       	ijmp
	...

00000180 <I_02__MOV_c0_c2>:
 180:	00 c0       	rjmp	.+0      	; 0x182 <I_02__MOV_c0_c2+0x2>
 182:	00 c0       	rjmp	.+0      	; 0x184 <I_02__MOV_c0_c2+0x4>
 184:	8a 01       	movw	r16, r20
 186:	01 96       	adiw	r24, 0x01	; 1
 188:	f8 94       	cli
 18a:	2e bc       	out	0x2e, r2	; 46
 18c:	6e b4       	in	r6, 0x2e	; 46
 18e:	78 94       	sei
 190:	67 9c       	mul	r6, r7
 192:	f0 01       	movw	r30, r0
 194:	e3 95       	inc	r30
 196:	09 94       	ijmp
	...

000001c0 <I_03__MOV_c0_c3>:
 1c0:	00 c0       	rjmp	.+0      	; 0x1c2 <I_03__MOV_c0_c3+0x2>
 1c2:	00 c0       	rjmp	.+0      	; 0x1c4 <I_03__MOV_c0_c3+0x4>
 1c4:	8b 01       	movw	r16, r22
 1c6:	01 96       	adiw	r24, 0x01	; 1
 1c8:	f8 94       	cli
 1ca:	2e bc       	out	0x2e, r2	; 46
 1cc:	6e b4       	in	r6, 0x2e	; 46
 1ce:	78 94       	sei
 1d0:	67 9c       	mul	r6, r7
 1d2:	f0 01       	movw	r30, r0
 1d4:	e3 95       	inc	r30
 1d6:	09 94       	ijmp
	...

00000200 <I_04__MOV_c1_c0>:
 200:	00 c0       	rjmp	.+0      	; 0x202 <I_04__MOV_c1_c0+0x2>
 202:	00 c0       	rjmp	.+0      	; 0x204 <I_04__MOV_c1_c0+0x4>
 204:	98 01       	movw	r18, r16
 206:	01 96       	adiw	r24, 0x01	; 1
 208:	f8 94       	cli
 20a:	2e bc       	out	0x2e, r2	; 46
 20c:	6e b4       	in	r6, 0x2e	; 46
 20e:	78 94       	sei
 210:	67 9c       	mul	r6, r7
 212:	f0 01       	movw	r30, r0
 214:	e3 95       	inc	r30
 216:	09 94       	ijmp
	...

00000240 <I_05__CLR_c1>:
 240:	c8 95       	lpm
 242:	22 27       	eor	r18, r18
 244:	33 27       	eor	r19, r19
 246:	01 96       	adiw	r24, 0x01	; 1
 248:	f8 94       	cli
 24a:	2e bc       	out	0x2e, r2	; 46
 24c:	6e b4       	in	r6, 0x2e	; 46
 24e:	78 94       	sei
 250:	67 9c       	mul	r6, r7
 252:	f0 01       	movw	r30, r0
 254:	e3 95       	inc	r30
 256:	09 94       	ijmp
	...

00000280 <I_06__MOV_c1_c2>:
 280:	00 c0       	rjmp	.+0      	; 0x282 <I_06__MOV_c1_c2+0x2>
 282:	00 c0       	rjmp	.+0      	; 0x284 <I_06__MOV_c1_c2+0x4>
 284:	9a 01       	movw	r18, r20
 286:	01 96       	adiw	r24, 0x01	; 1
 288:	f8 94       	cli
 28a:	2e bc       	out	0x2e, r2	; 46
 28c:	6e b4       	in	r6, 0x2e	; 46
 28e:	78 94       	sei
 290:	67 9c       	mul	r6, r7
 292:	f0 01       	movw	r30, r0
 294:	e3 95       	inc	r30
 296:	09 94       	ijmp
	...

000002c0 <I_07__MOV_c1_c3>:
 2c0:	00 c0       	rjmp	.+0      	; 0x2c2 <I_07__MOV_c1_c3+0x2>
 2c2:	00 c0       	rjmp	.+0      	; 0x2c4 <I_07__MOV_c1_c3+0x4>
 2c4:	9b 01       	movw	r18, r22
 2c6:	01 96       	adiw	r24, 0x01	; 1
 2c8:	f8 94       	cli
 2ca:	2e bc       	out	0x2e, r2	; 46
 2cc:	6e b4       	in	r6, 0x2e	; 46
 2ce:	78 94       	sei
 2d0:	67 9c       	mul	r6, r7
 2d2:	f0 01       	movw	r30, r0
 2d4:	e3 95       	inc	r30
 2d6:	09 94       	ijmp
	...

00000300 <I_08__MOV_c2_c0>:
 300:	00 c0       	rjmp	.+0      	; 0x302 <I_08__MOV_c2_c0+0x2>
 302:	00 c0       	rjmp	.+0      	; 0x304 <I_08__MOV_c2_c0+0x4>
 304:	a8 01       	movw	r20, r16
 306:	01 96       	adiw	r24, 0x01	; 1
 308:	f8 94       	cli
 30a:	2e bc       	out	0x2e, r2	; 46
 30c:	6e b4       	in	r6, 0x2e	; 46
 30e:	78 94       	sei
 310:	67 9c       	mul	r6, r7
 312:	f0 01       	movw	r30, r0
 314:	e3 95       	inc	r30
 316:	09 94       	ijmp
	...

00000340 <I_09__MOV_c2_c1>:
 340:	00 c0       	rjmp	.+0      	; 0x342 <I_09__MOV_c2_c1+0x2>
 342:	00 c0       	rjmp	.+0      	; 0x344 <I_09__MOV_c2_c1+0x4>
 344:	a9 01       	movw	r20, r18
 346:	01 96       	adiw	r24, 0x01	; 1
 348:	f8 94       	cli
 34a:	2e bc       	out	0x2e, r2	; 46
 34c:	6e b4       	in	r6, 0x2e	; 46
 34e:	78 94       	sei
 350:	67 9c       	mul	r6, r7
 352:	f0 01       	movw	r30, r0
 354:	e3 95       	inc	r30
 356:	09 94       	ijmp
	...

00000380 <I_0A__CLR_c2>:
 380:	c8 95       	lpm
 382:	44 27       	eor	r20, r20
 384:	55 27       	eor	r21, r21
 386:	01 96       	adiw	r24, 0x01	; 1
 388:	f8 94       	cli
 38a:	2e bc       	out	0x2e, r2	; 46
 38c:	6e b4       	in	r6, 0x2e	; 46
 38e:	78 94       	sei
 390:	67 9c       	mul	r6, r7
 392:	f0 01       	movw	r30, r0
 394:	e3 95       	inc	r30
 396:	09 94       	ijmp
	...

000003c0 <I_0B__MOV_c2_c3>:
 3c0:	00 c0       	rjmp	.+0      	; 0x3c2 <I_0B__MOV_c2_c3+0x2>
 3c2:	00 c0       	rjmp	.+0      	; 0x3c4 <I_0B__MOV_c2_c3+0x4>
 3c4:	ab 01       	movw	r20, r22
 3c6:	01 96       	adiw	r24, 0x01	; 1
 3c8:	f8 94       	cli
 3ca:	2e bc       	out	0x2e, r2	; 46
 3cc:	6e b4       	in	r6, 0x2e	; 46
 3ce:	78 94       	sei
 3d0:	67 9c       	mul	r6, r7
 3d2:	f0 01       	movw	r30, r0
 3d4:	e3 95       	inc	r30
 3d6:	09 94       	ijmp
	...

00000400 <I_0C__MOV_c3_c0>:
 400:	00 c0       	rjmp	.+0      	; 0x402 <I_0C__MOV_c3_c0+0x2>
 402:	00 c0       	rjmp	.+0      	; 0x404 <I_0C__MOV_c3_c0+0x4>
 404:	b8 01       	movw	r22, r16
 406:	01 96       	adiw	r24, 0x01	; 1
 408:	f8 94       	cli
 40a:	2e bc       	out	0x2e, r2	; 46
 40c:	6e b4       	in	r6, 0x2e	; 46
 40e:	78 94       	sei
 410:	67 9c       	mul	r6, r7
 412:	f0 01       	movw	r30, r0
 414:	e3 95       	inc	r30
 416:	09 94       	ijmp
	...

00000440 <I_0D__MOV_c3_c1>:
 440:	00 c0       	rjmp	.+0      	; 0x442 <I_0D__MOV_c3_c1+0x2>
 442:	00 c0       	rjmp	.+0      	; 0x444 <I_0D__MOV_c3_c1+0x4>
 444:	b9 01       	movw	r22, r18
 446:	01 96       	adiw	r24, 0x01	; 1
 448:	f8 94       	cli
 44a:	2e bc       	out	0x2e, r2	; 46
 44c:	6e b4       	in	r6, 0x2e	; 46
 44e:	78 94       	sei
 450:	67 9c       	mul	r6, r7
 452:	f0 01       	movw	r30, r0
 454:	e3 95       	inc	r30
 456:	09 94       	ijmp
	...

00000480 <I_0E__MOV_c3_c2>:
 480:	00 c0       	rjmp	.+0      	; 0x482 <I_0E__MOV_c3_c2+0x2>
 482:	00 c0       	rjmp	.+0      	; 0x484 <I_0E__MOV_c3_c2+0x4>
 484:	ba 01       	movw	r22, r20
 486:	01 96       	adiw	r24, 0x01	; 1
 488:	f8 94       	cli
 48a:	2e bc       	out	0x2e, r2	; 46
 48c:	6e b4       	in	r6, 0x2e	; 46
 48e:	78 94       	sei
 490:	67 9c       	mul	r6, r7
 492:	f0 01       	movw	r30, r0
 494:	e3 95       	inc	r30
 496:	09 94       	ijmp
	...

000004c0 <I_0F__CLR_c3>:
 4c0:	c8 95       	lpm
 4c2:	66 27       	eor	r22, r22
 4c4:	77 27       	eor	r23, r23
 4c6:	01 96       	adiw	r24, 0x01	; 1
 4c8:	f8 94       	cli
 4ca:	2e bc       	out	0x2e, r2	; 46
 4cc:	6e b4       	in	r6, 0x2e	; 46
 4ce:	78 94       	sei
 4d0:	67 9c       	mul	r6, r7
 4d2:	f0 01       	movw	r30, r0
 4d4:	e3 95       	inc	r30
 4d6:	09 94       	ijmp
	...

00000500 <I_10__LD8_c0_c0>:
 500:	00 00       	nop
 502:	d8 01       	movw	r26, r16
 504:	0c 91       	ld	r16, X
 506:	11 27       	eor	r17, r17
 508:	01 96       	adiw	r24, 0x01	; 1
 50a:	f8 94       	cli
 50c:	2e bc       	out	0x2e, r2	; 46
 50e:	6e b4       	in	r6, 0x2e	; 46
 510:	78 94       	sei
 512:	67 9c       	mul	r6, r7
 514:	f0 01       	movw	r30, r0
 516:	e3 95       	inc	r30
 518:	09 94       	ijmp
	...

00000540 <I_11__LD8_c0_c1>:
 540:	00 00       	nop
 542:	d9 01       	movw	r26, r18
 544:	0c 91       	ld	r16, X
 546:	11 27       	eor	r17, r17
 548:	01 96       	adiw	r24, 0x01	; 1
 54a:	f8 94       	cli
 54c:	2e bc       	out	0x2e, r2	; 46
 54e:	6e b4       	in	r6, 0x2e	; 46
 550:	78 94       	sei
 552:	67 9c       	mul	r6, r7
 554:	f0 01       	movw	r30, r0
 556:	e3 95       	inc	r30
 558:	09 94       	ijmp
	...

00000580 <I_12__LD8_c0_c2>:
 580:	00 00       	nop
 582:	da 01       	movw	r26, r20
 584:	0c 91       	ld	r16, X
 586:	11 27       	eor	r17, r17
 588:	01 96       	adiw	r24, 0x01	; 1
 58a:	f8 94       	cli
 58c:	2e bc       	out	0x2e, r2	; 46
 58e:	6e b4       	in	r6, 0x2e	; 46
 590:	78 94       	sei
 592:	67 9c       	mul	r6, r7
 594:	f0 01       	movw	r30, r0
 596:	e3 95       	inc	r30
 598:	09 94       	ijmp
	...

000005c0 <I_13__LD8_c0_c3>:
 5c0:	00 00       	nop
 5c2:	db 01       	movw	r26, r22
 5c4:	0c 91       	ld	r16, X
 5c6:	11 27       	eor	r17, r17
 5c8:	01 96       	adiw	r24, 0x01	; 1
 5ca:	f8 94       	cli
 5cc:	2e bc       	out	0x2e, r2	; 46
 5ce:	6e b4       	in	r6, 0x2e	; 46
 5d0:	78 94       	sei
 5d2:	67 9c       	mul	r6, r7
 5d4:	f0 01       	movw	r30, r0
 5d6:	e3 95       	inc	r30
 5d8:	09 94       	ijmp
	...

00000600 <I_14__LD8_c1_c0>:
 600:	00 00       	nop
 602:	d8 01       	movw	r26, r16
 604:	2c 91       	ld	r18, X
 606:	33 27       	eor	r19, r19
 608:	01 96       	adiw	r24, 0x01	; 1
 60a:	f8 94       	cli
 60c:	2e bc       	out	0x2e, r2	; 46
 60e:	6e b4       	in	r6, 0x2e	; 46
 610:	78 94       	sei
 612:	67 9c       	mul	r6, r7
 614:	f0 01       	movw	r30, r0
 616:	e3 95       	inc	r30
 618:	09 94       	ijmp
	...

00000640 <I_15__LD8_c1_c1>:
 640:	00 00       	nop
 642:	d9 01       	movw	r26, r18
 644:	2c 91       	ld	r18, X
 646:	33 27       	eor	r19, r19
 648:	01 96       	adiw	r24, 0x01	; 1
 64a:	f8 94       	cli
 64c:	2e bc       	out	0x2e, r2	; 46
 64e:	6e b4       	in	r6, 0x2e	; 46
 650:	78 94       	sei
 652:	67 9c       	mul	r6, r7
 654:	f0 01       	movw	r30, r0
 656:	e3 95       	inc	r30
 658:	09 94       	ijmp
	...

00000680 <I_16__LD8_c1_c2>:
 680:	00 00       	nop
 682:	da 01       	movw	r26, r20
 684:	2c 91       	ld	r18, X
 686:	33 27       	eor	r19, r19
 688:	01 96       	adiw	r24, 0x01	; 1
 68a:	f8 94       	cli
 68c:	2e bc       	out	0x2e, r2	; 46
 68e:	6e b4       	in	r6, 0x2e	; 46
 690:	78 94       	sei
 692:	67 9c       	mul	r6, r7
 694:	f0 01       	movw	r30, r0
 696:	e3 95       	inc	r30
 698:	09 94       	ijmp
	...

000006c0 <I_17__LD8_c1_c3>:
 6c0:	00 00       	nop
 6c2:	db 01       	movw	r26, r22
 6c4:	2c 91       	ld	r18, X
 6c6:	33 27       	eor	r19, r19
 6c8:	01 96       	adiw	r24, 0x01	; 1
 6ca:	f8 94       	cli
 6cc:	2e bc       	out	0x2e, r2	; 46
 6ce:	6e b4       	in	r6, 0x2e	; 46
 6d0:	78 94       	sei
 6d2:	67 9c       	mul	r6, r7
 6d4:	f0 01       	movw	r30, r0
 6d6:	e3 95       	inc	r30
 6d8:	09 94       	ijmp
	...

00000700 <I_18__LD8_c2_c0>:
 700:	00 00       	nop
 702:	d8 01       	movw	r26, r16
 704:	4c 91       	ld	r20, X
 706:	55 27       	eor	r21, r21
 708:	01 96       	adiw	r24, 0x01	; 1
 70a:	f8 94       	cli
 70c:	2e bc       	out	0x2e, r2	; 46
 70e:	6e b4       	in	r6, 0x2e	; 46
 710:	78 94       	sei
 712:	67 9c       	mul	r6, r7
 714:	f0 01       	movw	r30, r0
 716:	e3 95       	inc	r30
 718:	09 94       	ijmp
	...

00000740 <I_19__LD8_c2_c1>:
 740:	00 00       	nop
 742:	d9 01       	movw	r26, r18
 744:	4c 91       	ld	r20, X
 746:	55 27       	eor	r21, r21
 748:	01 96       	adiw	r24, 0x01	; 1
 74a:	f8 94       	cli
 74c:	2e bc       	out	0x2e, r2	; 46
 74e:	6e b4       	in	r6, 0x2e	; 46
 750:	78 94       	sei
 752:	67 9c       	mul	r6, r7
 754:	f0 01       	movw	r30, r0
 756:	e3 95       	inc	r30
 758:	09 94       	ijmp
	...

00000780 <I_1A__LD8_c2_c2>:
 780:	00 00       	nop
 782:	da 01       	movw	r26, r20
 784:	4c 91       	ld	r20, X
 786:	55 27       	eor	r21, r21
 788:	01 96       	adiw	r24, 0x01	; 1
 78a:	f8 94       	cli
 78c:	2e bc       	out	0x2e, r2	; 46
 78e:	6e b4       	in	r6, 0x2e	; 46
 790:	78 94       	sei
 792:	67 9c       	mul	r6, r7
 794:	f0 01       	movw	r30, r0
 796:	e3 95       	inc	r30
 798:	09 94       	ijmp
	...

000007c0 <I_1B__LD8_c2_c3>:
 7c0:	00 00       	nop
 7c2:	db 01       	movw	r26, r22
 7c4:	4c 91       	ld	r20, X
 7c6:	55 27       	eor	r21, r21
 7c8:	01 96       	adiw	r24, 0x01	; 1
 7ca:	f8 94       	cli
 7cc:	2e bc       	out	0x2e, r2	; 46
 7ce:	6e b4       	in	r6, 0x2e	; 46
 7d0:	78 94       	sei
 7d2:	67 9c       	mul	r6, r7
 7d4:	f0 01       	movw	r30, r0
 7d6:	e3 95       	inc	r30
 7d8:	09 94       	ijmp
	...

00000800 <I_1C__LD8_c3_c0>:
 800:	00 00       	nop
 802:	d8 01       	movw	r26, r16
 804:	6c 91       	ld	r22, X
 806:	77 27       	eor	r23, r23
 808:	01 96       	adiw	r24, 0x01	; 1
 80a:	f8 94       	cli
 80c:	2e bc       	out	0x2e, r2	; 46
 80e:	6e b4       	in	r6, 0x2e	; 46
 810:	78 94       	sei
 812:	67 9c       	mul	r6, r7
 814:	f0 01       	movw	r30, r0
 816:	e3 95       	inc	r30
 818:	09 94       	ijmp
	...

00000840 <I_1D__LD8_c3_c1>:
 840:	00 00       	nop
 842:	d9 01       	movw	r26, r18
 844:	6c 91       	ld	r22, X
 846:	77 27       	eor	r23, r23
 848:	01 96       	adiw	r24, 0x01	; 1
 84a:	f8 94       	cli
 84c:	2e bc       	out	0x2e, r2	; 46
 84e:	6e b4       	in	r6, 0x2e	; 46
 850:	78 94       	sei
 852:	67 9c       	mul	r6, r7
 854:	f0 01       	movw	r30, r0
 856:	e3 95       	inc	r30
 858:	09 94       	ijmp
	...

00000880 <I_1E__LD8_c3_c2>:
 880:	00 00       	nop
 882:	da 01       	movw	r26, r20
 884:	6c 91       	ld	r22, X
 886:	77 27       	eor	r23, r23
 888:	01 96       	adiw	r24, 0x01	; 1
 88a:	f8 94       	cli
 88c:	2e bc       	out	0x2e, r2	; 46
 88e:	6e b4       	in	r6, 0x2e	; 46
 890:	78 94       	sei
 892:	67 9c       	mul	r6, r7
 894:	f0 01       	movw	r30, r0
 896:	e3 95       	inc	r30
 898:	09 94       	ijmp
	...

000008c0 <I_1F__LD8_c3_c3>:
 8c0:	00 00       	nop
 8c2:	db 01       	movw	r26, r22
 8c4:	6c 91       	ld	r22, X
 8c6:	77 27       	eor	r23, r23
 8c8:	01 96       	adiw	r24, 0x01	; 1
 8ca:	f8 94       	cli
 8cc:	2e bc       	out	0x2e, r2	; 46
 8ce:	6e b4       	in	r6, 0x2e	; 46
 8d0:	78 94       	sei
 8d2:	67 9c       	mul	r6, r7
 8d4:	f0 01       	movw	r30, r0
 8d6:	e3 95       	inc	r30
 8d8:	09 94       	ijmp
	...
