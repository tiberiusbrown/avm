
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
      84:	a0 e2       	ldi	r26, 0x20	; 32
      86:	7a 2e       	mov	r7, r26
      88:	c0 e0       	ldi	r28, 0x00	; 0
      8a:	da e0       	ldi	r29, 0x0A	; 10
      8c:	55 24       	eor	r5, r5
      8e:	2a bc       	out	0x2a, r2	; 42
      90:	2b bc       	out	0x2b, r2	; 43
      92:	78 94       	sei

00000094 <reset_loop>:
      94:	ff cf       	rjmp	.-2      	; 0x94 <reset_loop>
	...

00000200 <abvm_interp>:
     200:	c8 95       	lpm
     202:	00 27       	eor	r16, r16
     204:	11 27       	eor	r17, r17
     206:	01 96       	adiw	r24, 0x01	; 1
     208:	f8 94       	cli
     20a:	2e bc       	out	0x2e, r2	; 46
     20c:	6e b4       	in	r6, 0x2e	; 46
     20e:	78 94       	sei
     210:	67 9c       	mul	r6, r7
     212:	f0 01       	movw	r30, r0
     214:	f3 95       	inc	r31
     216:	09 94       	ijmp
	...

00000240 <I_01__MOV_c0_c1>:
     240:	00 c0       	rjmp	.+0      	; 0x242 <I_01__MOV_c0_c1+0x2>
     242:	00 c0       	rjmp	.+0      	; 0x244 <I_01__MOV_c0_c1+0x4>
     244:	89 01       	movw	r16, r18
     246:	01 96       	adiw	r24, 0x01	; 1
     248:	f8 94       	cli
     24a:	2e bc       	out	0x2e, r2	; 46
     24c:	6e b4       	in	r6, 0x2e	; 46
     24e:	78 94       	sei
     250:	67 9c       	mul	r6, r7
     252:	f0 01       	movw	r30, r0
     254:	f3 95       	inc	r31
     256:	09 94       	ijmp
	...

00000280 <I_02__MOV_c0_c2>:
     280:	00 c0       	rjmp	.+0      	; 0x282 <I_02__MOV_c0_c2+0x2>
     282:	00 c0       	rjmp	.+0      	; 0x284 <I_02__MOV_c0_c2+0x4>
     284:	8a 01       	movw	r16, r20
     286:	01 96       	adiw	r24, 0x01	; 1
     288:	f8 94       	cli
     28a:	2e bc       	out	0x2e, r2	; 46
     28c:	6e b4       	in	r6, 0x2e	; 46
     28e:	78 94       	sei
     290:	67 9c       	mul	r6, r7
     292:	f0 01       	movw	r30, r0
     294:	f3 95       	inc	r31
     296:	09 94       	ijmp
	...

000002c0 <I_03__MOV_c0_c3>:
     2c0:	00 c0       	rjmp	.+0      	; 0x2c2 <I_03__MOV_c0_c3+0x2>
     2c2:	00 c0       	rjmp	.+0      	; 0x2c4 <I_03__MOV_c0_c3+0x4>
     2c4:	8b 01       	movw	r16, r22
     2c6:	01 96       	adiw	r24, 0x01	; 1
     2c8:	f8 94       	cli
     2ca:	2e bc       	out	0x2e, r2	; 46
     2cc:	6e b4       	in	r6, 0x2e	; 46
     2ce:	78 94       	sei
     2d0:	67 9c       	mul	r6, r7
     2d2:	f0 01       	movw	r30, r0
     2d4:	f3 95       	inc	r31
     2d6:	09 94       	ijmp
	...

00000300 <I_04__MOV_c1_c0>:
     300:	00 c0       	rjmp	.+0      	; 0x302 <I_04__MOV_c1_c0+0x2>
     302:	00 c0       	rjmp	.+0      	; 0x304 <I_04__MOV_c1_c0+0x4>
     304:	98 01       	movw	r18, r16
     306:	01 96       	adiw	r24, 0x01	; 1
     308:	f8 94       	cli
     30a:	2e bc       	out	0x2e, r2	; 46
     30c:	6e b4       	in	r6, 0x2e	; 46
     30e:	78 94       	sei
     310:	67 9c       	mul	r6, r7
     312:	f0 01       	movw	r30, r0
     314:	f3 95       	inc	r31
     316:	09 94       	ijmp
	...

00000340 <I_05__CLR_c1>:
     340:	c8 95       	lpm
     342:	22 27       	eor	r18, r18
     344:	33 27       	eor	r19, r19
     346:	01 96       	adiw	r24, 0x01	; 1
     348:	f8 94       	cli
     34a:	2e bc       	out	0x2e, r2	; 46
     34c:	6e b4       	in	r6, 0x2e	; 46
     34e:	78 94       	sei
     350:	67 9c       	mul	r6, r7
     352:	f0 01       	movw	r30, r0
     354:	f3 95       	inc	r31
     356:	09 94       	ijmp
	...

00000380 <I_06__MOV_c1_c2>:
     380:	00 c0       	rjmp	.+0      	; 0x382 <I_06__MOV_c1_c2+0x2>
     382:	00 c0       	rjmp	.+0      	; 0x384 <I_06__MOV_c1_c2+0x4>
     384:	9a 01       	movw	r18, r20
     386:	01 96       	adiw	r24, 0x01	; 1
     388:	f8 94       	cli
     38a:	2e bc       	out	0x2e, r2	; 46
     38c:	6e b4       	in	r6, 0x2e	; 46
     38e:	78 94       	sei
     390:	67 9c       	mul	r6, r7
     392:	f0 01       	movw	r30, r0
     394:	f3 95       	inc	r31
     396:	09 94       	ijmp
	...

000003c0 <I_07__MOV_c1_c3>:
     3c0:	00 c0       	rjmp	.+0      	; 0x3c2 <I_07__MOV_c1_c3+0x2>
     3c2:	00 c0       	rjmp	.+0      	; 0x3c4 <I_07__MOV_c1_c3+0x4>
     3c4:	9b 01       	movw	r18, r22
     3c6:	01 96       	adiw	r24, 0x01	; 1
     3c8:	f8 94       	cli
     3ca:	2e bc       	out	0x2e, r2	; 46
     3cc:	6e b4       	in	r6, 0x2e	; 46
     3ce:	78 94       	sei
     3d0:	67 9c       	mul	r6, r7
     3d2:	f0 01       	movw	r30, r0
     3d4:	f3 95       	inc	r31
     3d6:	09 94       	ijmp
	...

00000400 <I_08__MOV_c2_c0>:
     400:	00 c0       	rjmp	.+0      	; 0x402 <I_08__MOV_c2_c0+0x2>
     402:	00 c0       	rjmp	.+0      	; 0x404 <I_08__MOV_c2_c0+0x4>
     404:	a8 01       	movw	r20, r16
     406:	01 96       	adiw	r24, 0x01	; 1
     408:	f8 94       	cli
     40a:	2e bc       	out	0x2e, r2	; 46
     40c:	6e b4       	in	r6, 0x2e	; 46
     40e:	78 94       	sei
     410:	67 9c       	mul	r6, r7
     412:	f0 01       	movw	r30, r0
     414:	f3 95       	inc	r31
     416:	09 94       	ijmp
	...

00000440 <I_09__MOV_c2_c1>:
     440:	00 c0       	rjmp	.+0      	; 0x442 <I_09__MOV_c2_c1+0x2>
     442:	00 c0       	rjmp	.+0      	; 0x444 <I_09__MOV_c2_c1+0x4>
     444:	a9 01       	movw	r20, r18
     446:	01 96       	adiw	r24, 0x01	; 1
     448:	f8 94       	cli
     44a:	2e bc       	out	0x2e, r2	; 46
     44c:	6e b4       	in	r6, 0x2e	; 46
     44e:	78 94       	sei
     450:	67 9c       	mul	r6, r7
     452:	f0 01       	movw	r30, r0
     454:	f3 95       	inc	r31
     456:	09 94       	ijmp
	...

00000480 <I_0A__CLR_c2>:
     480:	c8 95       	lpm
     482:	44 27       	eor	r20, r20
     484:	55 27       	eor	r21, r21
     486:	01 96       	adiw	r24, 0x01	; 1
     488:	f8 94       	cli
     48a:	2e bc       	out	0x2e, r2	; 46
     48c:	6e b4       	in	r6, 0x2e	; 46
     48e:	78 94       	sei
     490:	67 9c       	mul	r6, r7
     492:	f0 01       	movw	r30, r0
     494:	f3 95       	inc	r31
     496:	09 94       	ijmp
	...

000004c0 <I_0B__MOV_c2_c3>:
     4c0:	00 c0       	rjmp	.+0      	; 0x4c2 <I_0B__MOV_c2_c3+0x2>
     4c2:	00 c0       	rjmp	.+0      	; 0x4c4 <I_0B__MOV_c2_c3+0x4>
     4c4:	ab 01       	movw	r20, r22
     4c6:	01 96       	adiw	r24, 0x01	; 1
     4c8:	f8 94       	cli
     4ca:	2e bc       	out	0x2e, r2	; 46
     4cc:	6e b4       	in	r6, 0x2e	; 46
     4ce:	78 94       	sei
     4d0:	67 9c       	mul	r6, r7
     4d2:	f0 01       	movw	r30, r0
     4d4:	f3 95       	inc	r31
     4d6:	09 94       	ijmp
	...

00000500 <I_0C__MOV_c3_c0>:
     500:	00 c0       	rjmp	.+0      	; 0x502 <I_0C__MOV_c3_c0+0x2>
     502:	00 c0       	rjmp	.+0      	; 0x504 <I_0C__MOV_c3_c0+0x4>
     504:	b8 01       	movw	r22, r16
     506:	01 96       	adiw	r24, 0x01	; 1
     508:	f8 94       	cli
     50a:	2e bc       	out	0x2e, r2	; 46
     50c:	6e b4       	in	r6, 0x2e	; 46
     50e:	78 94       	sei
     510:	67 9c       	mul	r6, r7
     512:	f0 01       	movw	r30, r0
     514:	f3 95       	inc	r31
     516:	09 94       	ijmp
	...

00000540 <I_0D__MOV_c3_c1>:
     540:	00 c0       	rjmp	.+0      	; 0x542 <I_0D__MOV_c3_c1+0x2>
     542:	00 c0       	rjmp	.+0      	; 0x544 <I_0D__MOV_c3_c1+0x4>
     544:	b9 01       	movw	r22, r18
     546:	01 96       	adiw	r24, 0x01	; 1
     548:	f8 94       	cli
     54a:	2e bc       	out	0x2e, r2	; 46
     54c:	6e b4       	in	r6, 0x2e	; 46
     54e:	78 94       	sei
     550:	67 9c       	mul	r6, r7
     552:	f0 01       	movw	r30, r0
     554:	f3 95       	inc	r31
     556:	09 94       	ijmp
	...

00000580 <I_0E__MOV_c3_c2>:
     580:	00 c0       	rjmp	.+0      	; 0x582 <I_0E__MOV_c3_c2+0x2>
     582:	00 c0       	rjmp	.+0      	; 0x584 <I_0E__MOV_c3_c2+0x4>
     584:	ba 01       	movw	r22, r20
     586:	01 96       	adiw	r24, 0x01	; 1
     588:	f8 94       	cli
     58a:	2e bc       	out	0x2e, r2	; 46
     58c:	6e b4       	in	r6, 0x2e	; 46
     58e:	78 94       	sei
     590:	67 9c       	mul	r6, r7
     592:	f0 01       	movw	r30, r0
     594:	f3 95       	inc	r31
     596:	09 94       	ijmp
	...

000005c0 <I_0F__CLR_c3>:
     5c0:	c8 95       	lpm
     5c2:	66 27       	eor	r22, r22
     5c4:	77 27       	eor	r23, r23
     5c6:	01 96       	adiw	r24, 0x01	; 1
     5c8:	f8 94       	cli
     5ca:	2e bc       	out	0x2e, r2	; 46
     5cc:	6e b4       	in	r6, 0x2e	; 46
     5ce:	78 94       	sei
     5d0:	67 9c       	mul	r6, r7
     5d2:	f0 01       	movw	r30, r0
     5d4:	f3 95       	inc	r31
     5d6:	09 94       	ijmp
	...

00000600 <I_10__LD8_c0_c0>:
     600:	00 00       	nop
     602:	d8 01       	movw	r26, r16
     604:	0c 91       	ld	r16, X
     606:	11 27       	eor	r17, r17
     608:	01 96       	adiw	r24, 0x01	; 1
     60a:	f8 94       	cli
     60c:	2e bc       	out	0x2e, r2	; 46
     60e:	6e b4       	in	r6, 0x2e	; 46
     610:	78 94       	sei
     612:	67 9c       	mul	r6, r7
     614:	f0 01       	movw	r30, r0
     616:	f3 95       	inc	r31
     618:	09 94       	ijmp

0000061a <I_11__LD8_c0_c1>:
     61a:	00 00       	nop
     61c:	d9 01       	movw	r26, r18
     61e:	0c 91       	ld	r16, X
     620:	11 27       	eor	r17, r17
     622:	01 96       	adiw	r24, 0x01	; 1
     624:	f8 94       	cli
     626:	2e bc       	out	0x2e, r2	; 46
     628:	6e b4       	in	r6, 0x2e	; 46
     62a:	78 94       	sei
     62c:	67 9c       	mul	r6, r7
     62e:	f0 01       	movw	r30, r0
     630:	f3 95       	inc	r31
     632:	09 94       	ijmp

00000634 <I_12__LD8_c0_c2>:
     634:	00 00       	nop
     636:	da 01       	movw	r26, r20
     638:	0c 91       	ld	r16, X
     63a:	11 27       	eor	r17, r17
     63c:	01 96       	adiw	r24, 0x01	; 1
     63e:	f8 94       	cli
     640:	2e bc       	out	0x2e, r2	; 46
     642:	6e b4       	in	r6, 0x2e	; 46
     644:	78 94       	sei
     646:	67 9c       	mul	r6, r7
     648:	f0 01       	movw	r30, r0
     64a:	f3 95       	inc	r31
     64c:	09 94       	ijmp

0000064e <I_13__LD8_c0_c3>:
     64e:	00 00       	nop
     650:	db 01       	movw	r26, r22
     652:	0c 91       	ld	r16, X
     654:	11 27       	eor	r17, r17
     656:	01 96       	adiw	r24, 0x01	; 1
     658:	f8 94       	cli
     65a:	2e bc       	out	0x2e, r2	; 46
     65c:	6e b4       	in	r6, 0x2e	; 46
     65e:	78 94       	sei
     660:	67 9c       	mul	r6, r7
     662:	f0 01       	movw	r30, r0
     664:	f3 95       	inc	r31
     666:	09 94       	ijmp

00000668 <I_14__LD8_c1_c0>:
     668:	00 00       	nop
     66a:	d8 01       	movw	r26, r16
     66c:	2c 91       	ld	r18, X
     66e:	33 27       	eor	r19, r19
     670:	01 96       	adiw	r24, 0x01	; 1
     672:	f8 94       	cli
     674:	2e bc       	out	0x2e, r2	; 46
     676:	6e b4       	in	r6, 0x2e	; 46
     678:	78 94       	sei
     67a:	67 9c       	mul	r6, r7
     67c:	f0 01       	movw	r30, r0
     67e:	f3 95       	inc	r31
     680:	09 94       	ijmp

00000682 <I_15__LD8_c1_c1>:
     682:	00 00       	nop
     684:	d9 01       	movw	r26, r18
     686:	2c 91       	ld	r18, X
     688:	33 27       	eor	r19, r19
     68a:	01 96       	adiw	r24, 0x01	; 1
     68c:	f8 94       	cli
     68e:	2e bc       	out	0x2e, r2	; 46
     690:	6e b4       	in	r6, 0x2e	; 46
     692:	78 94       	sei
     694:	67 9c       	mul	r6, r7
     696:	f0 01       	movw	r30, r0
     698:	f3 95       	inc	r31
     69a:	09 94       	ijmp

0000069c <I_16__LD8_c1_c2>:
     69c:	00 00       	nop
     69e:	da 01       	movw	r26, r20
     6a0:	2c 91       	ld	r18, X
     6a2:	33 27       	eor	r19, r19
     6a4:	01 96       	adiw	r24, 0x01	; 1
     6a6:	f8 94       	cli
     6a8:	2e bc       	out	0x2e, r2	; 46
     6aa:	6e b4       	in	r6, 0x2e	; 46
     6ac:	78 94       	sei
     6ae:	67 9c       	mul	r6, r7
     6b0:	f0 01       	movw	r30, r0
     6b2:	f3 95       	inc	r31
     6b4:	09 94       	ijmp

000006b6 <I_17__LD8_c1_c3>:
     6b6:	00 00       	nop
     6b8:	db 01       	movw	r26, r22
     6ba:	2c 91       	ld	r18, X
     6bc:	33 27       	eor	r19, r19
     6be:	01 96       	adiw	r24, 0x01	; 1
     6c0:	f8 94       	cli
     6c2:	2e bc       	out	0x2e, r2	; 46
     6c4:	6e b4       	in	r6, 0x2e	; 46
     6c6:	78 94       	sei
     6c8:	67 9c       	mul	r6, r7
     6ca:	f0 01       	movw	r30, r0
     6cc:	f3 95       	inc	r31
     6ce:	09 94       	ijmp

000006d0 <I_18__LD8_c2_c0>:
     6d0:	00 00       	nop
     6d2:	d8 01       	movw	r26, r16
     6d4:	4c 91       	ld	r20, X
     6d6:	55 27       	eor	r21, r21
     6d8:	01 96       	adiw	r24, 0x01	; 1
     6da:	f8 94       	cli
     6dc:	2e bc       	out	0x2e, r2	; 46
     6de:	6e b4       	in	r6, 0x2e	; 46
     6e0:	78 94       	sei
     6e2:	67 9c       	mul	r6, r7
     6e4:	f0 01       	movw	r30, r0
     6e6:	f3 95       	inc	r31
     6e8:	09 94       	ijmp

000006ea <I_19__LD8_c2_c1>:
     6ea:	00 00       	nop
     6ec:	d9 01       	movw	r26, r18
     6ee:	4c 91       	ld	r20, X
     6f0:	55 27       	eor	r21, r21
     6f2:	01 96       	adiw	r24, 0x01	; 1
     6f4:	f8 94       	cli
     6f6:	2e bc       	out	0x2e, r2	; 46
     6f8:	6e b4       	in	r6, 0x2e	; 46
     6fa:	78 94       	sei
     6fc:	67 9c       	mul	r6, r7
     6fe:	f0 01       	movw	r30, r0
     700:	f3 95       	inc	r31
     702:	09 94       	ijmp

00000704 <I_1A__LD8_c2_c2>:
     704:	00 00       	nop
     706:	da 01       	movw	r26, r20
     708:	4c 91       	ld	r20, X
     70a:	55 27       	eor	r21, r21
     70c:	01 96       	adiw	r24, 0x01	; 1
     70e:	f8 94       	cli
     710:	2e bc       	out	0x2e, r2	; 46
     712:	6e b4       	in	r6, 0x2e	; 46
     714:	78 94       	sei
     716:	67 9c       	mul	r6, r7
     718:	f0 01       	movw	r30, r0
     71a:	f3 95       	inc	r31
     71c:	09 94       	ijmp

0000071e <I_1B__LD8_c2_c3>:
     71e:	00 00       	nop
     720:	db 01       	movw	r26, r22
     722:	4c 91       	ld	r20, X
     724:	55 27       	eor	r21, r21
     726:	01 96       	adiw	r24, 0x01	; 1
     728:	f8 94       	cli
     72a:	2e bc       	out	0x2e, r2	; 46
     72c:	6e b4       	in	r6, 0x2e	; 46
     72e:	78 94       	sei
     730:	67 9c       	mul	r6, r7
     732:	f0 01       	movw	r30, r0
     734:	f3 95       	inc	r31
     736:	09 94       	ijmp

00000738 <I_1C__LD8_c3_c0>:
     738:	00 00       	nop
     73a:	d8 01       	movw	r26, r16
     73c:	6c 91       	ld	r22, X
     73e:	77 27       	eor	r23, r23
     740:	01 96       	adiw	r24, 0x01	; 1
     742:	f8 94       	cli
     744:	2e bc       	out	0x2e, r2	; 46
     746:	6e b4       	in	r6, 0x2e	; 46
     748:	78 94       	sei
     74a:	67 9c       	mul	r6, r7
     74c:	f0 01       	movw	r30, r0
     74e:	f3 95       	inc	r31
     750:	09 94       	ijmp

00000752 <I_1D__LD8_c3_c1>:
     752:	00 00       	nop
     754:	d9 01       	movw	r26, r18
     756:	6c 91       	ld	r22, X
     758:	77 27       	eor	r23, r23
     75a:	01 96       	adiw	r24, 0x01	; 1
     75c:	f8 94       	cli
     75e:	2e bc       	out	0x2e, r2	; 46
     760:	6e b4       	in	r6, 0x2e	; 46
     762:	78 94       	sei
     764:	67 9c       	mul	r6, r7
     766:	f0 01       	movw	r30, r0
     768:	f3 95       	inc	r31
     76a:	09 94       	ijmp

0000076c <I_1E__LD8_c3_c2>:
     76c:	00 00       	nop
     76e:	da 01       	movw	r26, r20
     770:	6c 91       	ld	r22, X
     772:	77 27       	eor	r23, r23
     774:	01 96       	adiw	r24, 0x01	; 1
     776:	f8 94       	cli
     778:	2e bc       	out	0x2e, r2	; 46
     77a:	6e b4       	in	r6, 0x2e	; 46
     77c:	78 94       	sei
     77e:	67 9c       	mul	r6, r7
     780:	f0 01       	movw	r30, r0
     782:	f3 95       	inc	r31
     784:	09 94       	ijmp

00000786 <I_1F__LD8_c3_c3>:
     786:	00 00       	nop
     788:	db 01       	movw	r26, r22
     78a:	6c 91       	ld	r22, X
     78c:	77 27       	eor	r23, r23
     78e:	01 96       	adiw	r24, 0x01	; 1
     790:	f8 94       	cli
     792:	2e bc       	out	0x2e, r2	; 46
     794:	6e b4       	in	r6, 0x2e	; 46
     796:	78 94       	sei
     798:	67 9c       	mul	r6, r7
     79a:	f0 01       	movw	r30, r0
     79c:	f3 95       	inc	r31
     79e:	09 94       	ijmp

000007a0 <I_20__ST8_c0_c0>:
     7a0:	00 c0       	rjmp	.+0      	; 0x7a2 <I_20__ST8_c0_c0+0x2>
     7a2:	d8 01       	movw	r26, r16
     7a4:	0c 93       	st	X, r16
     7a6:	01 96       	adiw	r24, 0x01	; 1
     7a8:	f8 94       	cli
     7aa:	2e bc       	out	0x2e, r2	; 46
     7ac:	6e b4       	in	r6, 0x2e	; 46
     7ae:	78 94       	sei
     7b0:	67 9c       	mul	r6, r7
     7b2:	f0 01       	movw	r30, r0
     7b4:	f3 95       	inc	r31
     7b6:	09 94       	ijmp

000007b8 <I_21__ST8_c0_c1>:
     7b8:	00 c0       	rjmp	.+0      	; 0x7ba <I_21__ST8_c0_c1+0x2>
     7ba:	d8 01       	movw	r26, r16
     7bc:	2c 93       	st	X, r18
     7be:	01 96       	adiw	r24, 0x01	; 1
     7c0:	f8 94       	cli
     7c2:	2e bc       	out	0x2e, r2	; 46
     7c4:	6e b4       	in	r6, 0x2e	; 46
     7c6:	78 94       	sei
     7c8:	67 9c       	mul	r6, r7
     7ca:	f0 01       	movw	r30, r0
     7cc:	f3 95       	inc	r31
     7ce:	09 94       	ijmp

000007d0 <I_22__ST8_c0_c2>:
     7d0:	00 c0       	rjmp	.+0      	; 0x7d2 <I_22__ST8_c0_c2+0x2>
     7d2:	d8 01       	movw	r26, r16
     7d4:	4c 93       	st	X, r20
     7d6:	01 96       	adiw	r24, 0x01	; 1
     7d8:	f8 94       	cli
     7da:	2e bc       	out	0x2e, r2	; 46
     7dc:	6e b4       	in	r6, 0x2e	; 46
     7de:	78 94       	sei
     7e0:	67 9c       	mul	r6, r7
     7e2:	f0 01       	movw	r30, r0
     7e4:	f3 95       	inc	r31
     7e6:	09 94       	ijmp

000007e8 <I_23__ST8_c0_c3>:
     7e8:	00 c0       	rjmp	.+0      	; 0x7ea <I_23__ST8_c0_c3+0x2>
     7ea:	d8 01       	movw	r26, r16
     7ec:	6c 93       	st	X, r22
     7ee:	01 96       	adiw	r24, 0x01	; 1
     7f0:	f8 94       	cli
     7f2:	2e bc       	out	0x2e, r2	; 46
     7f4:	6e b4       	in	r6, 0x2e	; 46
     7f6:	78 94       	sei
     7f8:	67 9c       	mul	r6, r7
     7fa:	f0 01       	movw	r30, r0
     7fc:	f3 95       	inc	r31
     7fe:	09 94       	ijmp

00000800 <I_24__ST8_c1_c0>:
     800:	00 c0       	rjmp	.+0      	; 0x802 <I_24__ST8_c1_c0+0x2>
     802:	d9 01       	movw	r26, r18
     804:	0c 93       	st	X, r16
     806:	01 96       	adiw	r24, 0x01	; 1
     808:	f8 94       	cli
     80a:	2e bc       	out	0x2e, r2	; 46
     80c:	6e b4       	in	r6, 0x2e	; 46
     80e:	78 94       	sei
     810:	67 9c       	mul	r6, r7
     812:	f0 01       	movw	r30, r0
     814:	f3 95       	inc	r31
     816:	09 94       	ijmp

00000818 <I_25__ST8_c1_c1>:
     818:	00 c0       	rjmp	.+0      	; 0x81a <I_25__ST8_c1_c1+0x2>
     81a:	d9 01       	movw	r26, r18
     81c:	2c 93       	st	X, r18
     81e:	01 96       	adiw	r24, 0x01	; 1
     820:	f8 94       	cli
     822:	2e bc       	out	0x2e, r2	; 46
     824:	6e b4       	in	r6, 0x2e	; 46
     826:	78 94       	sei
     828:	67 9c       	mul	r6, r7
     82a:	f0 01       	movw	r30, r0
     82c:	f3 95       	inc	r31
     82e:	09 94       	ijmp

00000830 <I_26__ST8_c1_c2>:
     830:	00 c0       	rjmp	.+0      	; 0x832 <I_26__ST8_c1_c2+0x2>
     832:	d9 01       	movw	r26, r18
     834:	4c 93       	st	X, r20
     836:	01 96       	adiw	r24, 0x01	; 1
     838:	f8 94       	cli
     83a:	2e bc       	out	0x2e, r2	; 46
     83c:	6e b4       	in	r6, 0x2e	; 46
     83e:	78 94       	sei
     840:	67 9c       	mul	r6, r7
     842:	f0 01       	movw	r30, r0
     844:	f3 95       	inc	r31
     846:	09 94       	ijmp

00000848 <I_27__ST8_c1_c3>:
     848:	00 c0       	rjmp	.+0      	; 0x84a <I_27__ST8_c1_c3+0x2>
     84a:	d9 01       	movw	r26, r18
     84c:	6c 93       	st	X, r22
     84e:	01 96       	adiw	r24, 0x01	; 1
     850:	f8 94       	cli
     852:	2e bc       	out	0x2e, r2	; 46
     854:	6e b4       	in	r6, 0x2e	; 46
     856:	78 94       	sei
     858:	67 9c       	mul	r6, r7
     85a:	f0 01       	movw	r30, r0
     85c:	f3 95       	inc	r31
     85e:	09 94       	ijmp

00000860 <I_28__ST8_c2_c0>:
     860:	00 c0       	rjmp	.+0      	; 0x862 <I_28__ST8_c2_c0+0x2>
     862:	da 01       	movw	r26, r20
     864:	0c 93       	st	X, r16
     866:	01 96       	adiw	r24, 0x01	; 1
     868:	f8 94       	cli
     86a:	2e bc       	out	0x2e, r2	; 46
     86c:	6e b4       	in	r6, 0x2e	; 46
     86e:	78 94       	sei
     870:	67 9c       	mul	r6, r7
     872:	f0 01       	movw	r30, r0
     874:	f3 95       	inc	r31
     876:	09 94       	ijmp

00000878 <I_29__ST8_c2_c1>:
     878:	00 c0       	rjmp	.+0      	; 0x87a <I_29__ST8_c2_c1+0x2>
     87a:	da 01       	movw	r26, r20
     87c:	2c 93       	st	X, r18
     87e:	01 96       	adiw	r24, 0x01	; 1
     880:	f8 94       	cli
     882:	2e bc       	out	0x2e, r2	; 46
     884:	6e b4       	in	r6, 0x2e	; 46
     886:	78 94       	sei
     888:	67 9c       	mul	r6, r7
     88a:	f0 01       	movw	r30, r0
     88c:	f3 95       	inc	r31
     88e:	09 94       	ijmp

00000890 <I_2A__ST8_c2_c2>:
     890:	00 c0       	rjmp	.+0      	; 0x892 <I_2A__ST8_c2_c2+0x2>
     892:	da 01       	movw	r26, r20
     894:	4c 93       	st	X, r20
     896:	01 96       	adiw	r24, 0x01	; 1
     898:	f8 94       	cli
     89a:	2e bc       	out	0x2e, r2	; 46
     89c:	6e b4       	in	r6, 0x2e	; 46
     89e:	78 94       	sei
     8a0:	67 9c       	mul	r6, r7
     8a2:	f0 01       	movw	r30, r0
     8a4:	f3 95       	inc	r31
     8a6:	09 94       	ijmp

000008a8 <I_2B__ST8_c2_c3>:
     8a8:	00 c0       	rjmp	.+0      	; 0x8aa <I_2B__ST8_c2_c3+0x2>
     8aa:	da 01       	movw	r26, r20
     8ac:	6c 93       	st	X, r22
     8ae:	01 96       	adiw	r24, 0x01	; 1
     8b0:	f8 94       	cli
     8b2:	2e bc       	out	0x2e, r2	; 46
     8b4:	6e b4       	in	r6, 0x2e	; 46
     8b6:	78 94       	sei
     8b8:	67 9c       	mul	r6, r7
     8ba:	f0 01       	movw	r30, r0
     8bc:	f3 95       	inc	r31
     8be:	09 94       	ijmp

000008c0 <I_2C__ST8_c3_c0>:
     8c0:	00 c0       	rjmp	.+0      	; 0x8c2 <I_2C__ST8_c3_c0+0x2>
     8c2:	db 01       	movw	r26, r22
     8c4:	0c 93       	st	X, r16
     8c6:	01 96       	adiw	r24, 0x01	; 1
     8c8:	f8 94       	cli
     8ca:	2e bc       	out	0x2e, r2	; 46
     8cc:	6e b4       	in	r6, 0x2e	; 46
     8ce:	78 94       	sei
     8d0:	67 9c       	mul	r6, r7
     8d2:	f0 01       	movw	r30, r0
     8d4:	f3 95       	inc	r31
     8d6:	09 94       	ijmp

000008d8 <I_2D__ST8_c3_c1>:
     8d8:	00 c0       	rjmp	.+0      	; 0x8da <I_2D__ST8_c3_c1+0x2>
     8da:	db 01       	movw	r26, r22
     8dc:	2c 93       	st	X, r18
     8de:	01 96       	adiw	r24, 0x01	; 1
     8e0:	f8 94       	cli
     8e2:	2e bc       	out	0x2e, r2	; 46
     8e4:	6e b4       	in	r6, 0x2e	; 46
     8e6:	78 94       	sei
     8e8:	67 9c       	mul	r6, r7
     8ea:	f0 01       	movw	r30, r0
     8ec:	f3 95       	inc	r31
     8ee:	09 94       	ijmp

000008f0 <I_2E__ST8_c3_c2>:
     8f0:	00 c0       	rjmp	.+0      	; 0x8f2 <I_2E__ST8_c3_c2+0x2>
     8f2:	db 01       	movw	r26, r22
     8f4:	4c 93       	st	X, r20
     8f6:	01 96       	adiw	r24, 0x01	; 1
     8f8:	f8 94       	cli
     8fa:	2e bc       	out	0x2e, r2	; 46
     8fc:	6e b4       	in	r6, 0x2e	; 46
     8fe:	78 94       	sei
     900:	67 9c       	mul	r6, r7
     902:	f0 01       	movw	r30, r0
     904:	f3 95       	inc	r31
     906:	09 94       	ijmp

00000908 <I_2F__ST8_c3_c3>:
     908:	00 c0       	rjmp	.+0      	; 0x90a <I_2F__ST8_c3_c3+0x2>
     90a:	db 01       	movw	r26, r22
     90c:	6c 93       	st	X, r22
     90e:	01 96       	adiw	r24, 0x01	; 1
     910:	f8 94       	cli
     912:	2e bc       	out	0x2e, r2	; 46
     914:	6e b4       	in	r6, 0x2e	; 46
     916:	78 94       	sei
     918:	67 9c       	mul	r6, r7
     91a:	f0 01       	movw	r30, r0
     91c:	f3 95       	inc	r31
     91e:	09 94       	ijmp

00000920 <I_30__LD16_c0_c0>:
     920:	d8 01       	movw	r26, r16
     922:	0d 91       	ld	r16, X+
     924:	1c 91       	ld	r17, X
     926:	01 96       	adiw	r24, 0x01	; 1
     928:	f8 94       	cli
     92a:	2e bc       	out	0x2e, r2	; 46
     92c:	6e b4       	in	r6, 0x2e	; 46
     92e:	78 94       	sei
     930:	67 9c       	mul	r6, r7
     932:	f0 01       	movw	r30, r0
     934:	f3 95       	inc	r31
     936:	09 94       	ijmp

00000938 <I_31__LD16_c0_c1>:
     938:	d9 01       	movw	r26, r18
     93a:	0d 91       	ld	r16, X+
     93c:	1c 91       	ld	r17, X
     93e:	01 96       	adiw	r24, 0x01	; 1
     940:	f8 94       	cli
     942:	2e bc       	out	0x2e, r2	; 46
     944:	6e b4       	in	r6, 0x2e	; 46
     946:	78 94       	sei
     948:	67 9c       	mul	r6, r7
     94a:	f0 01       	movw	r30, r0
     94c:	f3 95       	inc	r31
     94e:	09 94       	ijmp

00000950 <I_32__LD16_c0_c2>:
     950:	da 01       	movw	r26, r20
     952:	0d 91       	ld	r16, X+
     954:	1c 91       	ld	r17, X
     956:	01 96       	adiw	r24, 0x01	; 1
     958:	f8 94       	cli
     95a:	2e bc       	out	0x2e, r2	; 46
     95c:	6e b4       	in	r6, 0x2e	; 46
     95e:	78 94       	sei
     960:	67 9c       	mul	r6, r7
     962:	f0 01       	movw	r30, r0
     964:	f3 95       	inc	r31
     966:	09 94       	ijmp

00000968 <I_33__LD16_c0_c3>:
     968:	db 01       	movw	r26, r22
     96a:	0d 91       	ld	r16, X+
     96c:	1c 91       	ld	r17, X
     96e:	01 96       	adiw	r24, 0x01	; 1
     970:	f8 94       	cli
     972:	2e bc       	out	0x2e, r2	; 46
     974:	6e b4       	in	r6, 0x2e	; 46
     976:	78 94       	sei
     978:	67 9c       	mul	r6, r7
     97a:	f0 01       	movw	r30, r0
     97c:	f3 95       	inc	r31
     97e:	09 94       	ijmp

00000980 <I_34__LD16_c1_c0>:
     980:	d8 01       	movw	r26, r16
     982:	2d 91       	ld	r18, X+
     984:	3c 91       	ld	r19, X
     986:	01 96       	adiw	r24, 0x01	; 1
     988:	f8 94       	cli
     98a:	2e bc       	out	0x2e, r2	; 46
     98c:	6e b4       	in	r6, 0x2e	; 46
     98e:	78 94       	sei
     990:	67 9c       	mul	r6, r7
     992:	f0 01       	movw	r30, r0
     994:	f3 95       	inc	r31
     996:	09 94       	ijmp

00000998 <I_35__LD16_c1_c1>:
     998:	d9 01       	movw	r26, r18
     99a:	2d 91       	ld	r18, X+
     99c:	3c 91       	ld	r19, X
     99e:	01 96       	adiw	r24, 0x01	; 1
     9a0:	f8 94       	cli
     9a2:	2e bc       	out	0x2e, r2	; 46
     9a4:	6e b4       	in	r6, 0x2e	; 46
     9a6:	78 94       	sei
     9a8:	67 9c       	mul	r6, r7
     9aa:	f0 01       	movw	r30, r0
     9ac:	f3 95       	inc	r31
     9ae:	09 94       	ijmp

000009b0 <I_36__LD16_c1_c2>:
     9b0:	da 01       	movw	r26, r20
     9b2:	2d 91       	ld	r18, X+
     9b4:	3c 91       	ld	r19, X
     9b6:	01 96       	adiw	r24, 0x01	; 1
     9b8:	f8 94       	cli
     9ba:	2e bc       	out	0x2e, r2	; 46
     9bc:	6e b4       	in	r6, 0x2e	; 46
     9be:	78 94       	sei
     9c0:	67 9c       	mul	r6, r7
     9c2:	f0 01       	movw	r30, r0
     9c4:	f3 95       	inc	r31
     9c6:	09 94       	ijmp

000009c8 <I_37__LD16_c1_c3>:
     9c8:	db 01       	movw	r26, r22
     9ca:	2d 91       	ld	r18, X+
     9cc:	3c 91       	ld	r19, X
     9ce:	01 96       	adiw	r24, 0x01	; 1
     9d0:	f8 94       	cli
     9d2:	2e bc       	out	0x2e, r2	; 46
     9d4:	6e b4       	in	r6, 0x2e	; 46
     9d6:	78 94       	sei
     9d8:	67 9c       	mul	r6, r7
     9da:	f0 01       	movw	r30, r0
     9dc:	f3 95       	inc	r31
     9de:	09 94       	ijmp

000009e0 <I_38__LD16_c2_c0>:
     9e0:	d8 01       	movw	r26, r16
     9e2:	4d 91       	ld	r20, X+
     9e4:	5c 91       	ld	r21, X
     9e6:	01 96       	adiw	r24, 0x01	; 1
     9e8:	f8 94       	cli
     9ea:	2e bc       	out	0x2e, r2	; 46
     9ec:	6e b4       	in	r6, 0x2e	; 46
     9ee:	78 94       	sei
     9f0:	67 9c       	mul	r6, r7
     9f2:	f0 01       	movw	r30, r0
     9f4:	f3 95       	inc	r31
     9f6:	09 94       	ijmp

000009f8 <I_39__LD16_c2_c1>:
     9f8:	d9 01       	movw	r26, r18
     9fa:	4d 91       	ld	r20, X+
     9fc:	5c 91       	ld	r21, X
     9fe:	01 96       	adiw	r24, 0x01	; 1
     a00:	f8 94       	cli
     a02:	2e bc       	out	0x2e, r2	; 46
     a04:	6e b4       	in	r6, 0x2e	; 46
     a06:	78 94       	sei
     a08:	67 9c       	mul	r6, r7
     a0a:	f0 01       	movw	r30, r0
     a0c:	f3 95       	inc	r31
     a0e:	09 94       	ijmp

00000a10 <I_3A__LD16_c2_c2>:
     a10:	da 01       	movw	r26, r20
     a12:	4d 91       	ld	r20, X+
     a14:	5c 91       	ld	r21, X
     a16:	01 96       	adiw	r24, 0x01	; 1
     a18:	f8 94       	cli
     a1a:	2e bc       	out	0x2e, r2	; 46
     a1c:	6e b4       	in	r6, 0x2e	; 46
     a1e:	78 94       	sei
     a20:	67 9c       	mul	r6, r7
     a22:	f0 01       	movw	r30, r0
     a24:	f3 95       	inc	r31
     a26:	09 94       	ijmp

00000a28 <I_3B__LD16_c2_c3>:
     a28:	db 01       	movw	r26, r22
     a2a:	4d 91       	ld	r20, X+
     a2c:	5c 91       	ld	r21, X
     a2e:	01 96       	adiw	r24, 0x01	; 1
     a30:	f8 94       	cli
     a32:	2e bc       	out	0x2e, r2	; 46
     a34:	6e b4       	in	r6, 0x2e	; 46
     a36:	78 94       	sei
     a38:	67 9c       	mul	r6, r7
     a3a:	f0 01       	movw	r30, r0
     a3c:	f3 95       	inc	r31
     a3e:	09 94       	ijmp

00000a40 <I_3C__LD16_c3_c0>:
     a40:	d8 01       	movw	r26, r16
     a42:	6d 91       	ld	r22, X+
     a44:	7c 91       	ld	r23, X
     a46:	01 96       	adiw	r24, 0x01	; 1
     a48:	f8 94       	cli
     a4a:	2e bc       	out	0x2e, r2	; 46
     a4c:	6e b4       	in	r6, 0x2e	; 46
     a4e:	78 94       	sei
     a50:	67 9c       	mul	r6, r7
     a52:	f0 01       	movw	r30, r0
     a54:	f3 95       	inc	r31
     a56:	09 94       	ijmp

00000a58 <I_3D__LD16_c3_c1>:
     a58:	d9 01       	movw	r26, r18
     a5a:	6d 91       	ld	r22, X+
     a5c:	7c 91       	ld	r23, X
     a5e:	01 96       	adiw	r24, 0x01	; 1
     a60:	f8 94       	cli
     a62:	2e bc       	out	0x2e, r2	; 46
     a64:	6e b4       	in	r6, 0x2e	; 46
     a66:	78 94       	sei
     a68:	67 9c       	mul	r6, r7
     a6a:	f0 01       	movw	r30, r0
     a6c:	f3 95       	inc	r31
     a6e:	09 94       	ijmp

00000a70 <I_3E__LD16_c3_c2>:
     a70:	da 01       	movw	r26, r20
     a72:	6d 91       	ld	r22, X+
     a74:	7c 91       	ld	r23, X
     a76:	01 96       	adiw	r24, 0x01	; 1
     a78:	f8 94       	cli
     a7a:	2e bc       	out	0x2e, r2	; 46
     a7c:	6e b4       	in	r6, 0x2e	; 46
     a7e:	78 94       	sei
     a80:	67 9c       	mul	r6, r7
     a82:	f0 01       	movw	r30, r0
     a84:	f3 95       	inc	r31
     a86:	09 94       	ijmp

00000a88 <I_3F__LD16_c3_c3>:
     a88:	db 01       	movw	r26, r22
     a8a:	6d 91       	ld	r22, X+
     a8c:	7c 91       	ld	r23, X
     a8e:	01 96       	adiw	r24, 0x01	; 1
     a90:	f8 94       	cli
     a92:	2e bc       	out	0x2e, r2	; 46
     a94:	6e b4       	in	r6, 0x2e	; 46
     a96:	78 94       	sei
     a98:	67 9c       	mul	r6, r7
     a9a:	f0 01       	movw	r30, r0
     a9c:	f3 95       	inc	r31
     a9e:	09 94       	ijmp

00000aa0 <I_40__ST16_c0_c0>:
     aa0:	d8 01       	movw	r26, r16
     aa2:	0d 93       	st	X+, r16
     aa4:	1c 93       	st	X, r17
     aa6:	01 96       	adiw	r24, 0x01	; 1
     aa8:	f8 94       	cli
     aaa:	2e bc       	out	0x2e, r2	; 46
     aac:	6e b4       	in	r6, 0x2e	; 46
     aae:	78 94       	sei
     ab0:	67 9c       	mul	r6, r7
     ab2:	f0 01       	movw	r30, r0
     ab4:	f3 95       	inc	r31
     ab6:	09 94       	ijmp

00000ab8 <I_41__ST16_c0_c1>:
     ab8:	d8 01       	movw	r26, r16
     aba:	2d 93       	st	X+, r18
     abc:	3c 93       	st	X, r19
     abe:	01 96       	adiw	r24, 0x01	; 1
     ac0:	f8 94       	cli
     ac2:	2e bc       	out	0x2e, r2	; 46
     ac4:	6e b4       	in	r6, 0x2e	; 46
     ac6:	78 94       	sei
     ac8:	67 9c       	mul	r6, r7
     aca:	f0 01       	movw	r30, r0
     acc:	f3 95       	inc	r31
     ace:	09 94       	ijmp

00000ad0 <I_42__ST16_c0_c2>:
     ad0:	d8 01       	movw	r26, r16
     ad2:	4d 93       	st	X+, r20
     ad4:	5c 93       	st	X, r21
     ad6:	01 96       	adiw	r24, 0x01	; 1
     ad8:	f8 94       	cli
     ada:	2e bc       	out	0x2e, r2	; 46
     adc:	6e b4       	in	r6, 0x2e	; 46
     ade:	78 94       	sei
     ae0:	67 9c       	mul	r6, r7
     ae2:	f0 01       	movw	r30, r0
     ae4:	f3 95       	inc	r31
     ae6:	09 94       	ijmp

00000ae8 <I_43__ST16_c0_c3>:
     ae8:	d8 01       	movw	r26, r16
     aea:	6d 93       	st	X+, r22
     aec:	7c 93       	st	X, r23
     aee:	01 96       	adiw	r24, 0x01	; 1
     af0:	f8 94       	cli
     af2:	2e bc       	out	0x2e, r2	; 46
     af4:	6e b4       	in	r6, 0x2e	; 46
     af6:	78 94       	sei
     af8:	67 9c       	mul	r6, r7
     afa:	f0 01       	movw	r30, r0
     afc:	f3 95       	inc	r31
     afe:	09 94       	ijmp

00000b00 <I_44__ST16_c1_c0>:
     b00:	d9 01       	movw	r26, r18
     b02:	0d 93       	st	X+, r16
     b04:	1c 93       	st	X, r17
     b06:	01 96       	adiw	r24, 0x01	; 1
     b08:	f8 94       	cli
     b0a:	2e bc       	out	0x2e, r2	; 46
     b0c:	6e b4       	in	r6, 0x2e	; 46
     b0e:	78 94       	sei
     b10:	67 9c       	mul	r6, r7
     b12:	f0 01       	movw	r30, r0
     b14:	f3 95       	inc	r31
     b16:	09 94       	ijmp

00000b18 <I_45__ST16_c1_c1>:
     b18:	d9 01       	movw	r26, r18
     b1a:	2d 93       	st	X+, r18
     b1c:	3c 93       	st	X, r19
     b1e:	01 96       	adiw	r24, 0x01	; 1
     b20:	f8 94       	cli
     b22:	2e bc       	out	0x2e, r2	; 46
     b24:	6e b4       	in	r6, 0x2e	; 46
     b26:	78 94       	sei
     b28:	67 9c       	mul	r6, r7
     b2a:	f0 01       	movw	r30, r0
     b2c:	f3 95       	inc	r31
     b2e:	09 94       	ijmp

00000b30 <I_46__ST16_c1_c2>:
     b30:	d9 01       	movw	r26, r18
     b32:	4d 93       	st	X+, r20
     b34:	5c 93       	st	X, r21
     b36:	01 96       	adiw	r24, 0x01	; 1
     b38:	f8 94       	cli
     b3a:	2e bc       	out	0x2e, r2	; 46
     b3c:	6e b4       	in	r6, 0x2e	; 46
     b3e:	78 94       	sei
     b40:	67 9c       	mul	r6, r7
     b42:	f0 01       	movw	r30, r0
     b44:	f3 95       	inc	r31
     b46:	09 94       	ijmp

00000b48 <I_47__ST16_c1_c3>:
     b48:	d9 01       	movw	r26, r18
     b4a:	6d 93       	st	X+, r22
     b4c:	7c 93       	st	X, r23
     b4e:	01 96       	adiw	r24, 0x01	; 1
     b50:	f8 94       	cli
     b52:	2e bc       	out	0x2e, r2	; 46
     b54:	6e b4       	in	r6, 0x2e	; 46
     b56:	78 94       	sei
     b58:	67 9c       	mul	r6, r7
     b5a:	f0 01       	movw	r30, r0
     b5c:	f3 95       	inc	r31
     b5e:	09 94       	ijmp

00000b60 <I_48__ST16_c2_c0>:
     b60:	da 01       	movw	r26, r20
     b62:	0d 93       	st	X+, r16
     b64:	1c 93       	st	X, r17
     b66:	01 96       	adiw	r24, 0x01	; 1
     b68:	f8 94       	cli
     b6a:	2e bc       	out	0x2e, r2	; 46
     b6c:	6e b4       	in	r6, 0x2e	; 46
     b6e:	78 94       	sei
     b70:	67 9c       	mul	r6, r7
     b72:	f0 01       	movw	r30, r0
     b74:	f3 95       	inc	r31
     b76:	09 94       	ijmp

00000b78 <I_49__ST16_c2_c1>:
     b78:	da 01       	movw	r26, r20
     b7a:	2d 93       	st	X+, r18
     b7c:	3c 93       	st	X, r19
     b7e:	01 96       	adiw	r24, 0x01	; 1
     b80:	f8 94       	cli
     b82:	2e bc       	out	0x2e, r2	; 46
     b84:	6e b4       	in	r6, 0x2e	; 46
     b86:	78 94       	sei
     b88:	67 9c       	mul	r6, r7
     b8a:	f0 01       	movw	r30, r0
     b8c:	f3 95       	inc	r31
     b8e:	09 94       	ijmp

00000b90 <I_4A__ST16_c2_c2>:
     b90:	da 01       	movw	r26, r20
     b92:	4d 93       	st	X+, r20
     b94:	5c 93       	st	X, r21
     b96:	01 96       	adiw	r24, 0x01	; 1
     b98:	f8 94       	cli
     b9a:	2e bc       	out	0x2e, r2	; 46
     b9c:	6e b4       	in	r6, 0x2e	; 46
     b9e:	78 94       	sei
     ba0:	67 9c       	mul	r6, r7
     ba2:	f0 01       	movw	r30, r0
     ba4:	f3 95       	inc	r31
     ba6:	09 94       	ijmp

00000ba8 <I_4B__ST16_c2_c3>:
     ba8:	da 01       	movw	r26, r20
     baa:	6d 93       	st	X+, r22
     bac:	7c 93       	st	X, r23
     bae:	01 96       	adiw	r24, 0x01	; 1
     bb0:	f8 94       	cli
     bb2:	2e bc       	out	0x2e, r2	; 46
     bb4:	6e b4       	in	r6, 0x2e	; 46
     bb6:	78 94       	sei
     bb8:	67 9c       	mul	r6, r7
     bba:	f0 01       	movw	r30, r0
     bbc:	f3 95       	inc	r31
     bbe:	09 94       	ijmp

00000bc0 <I_4C__ST16_c3_c0>:
     bc0:	db 01       	movw	r26, r22
     bc2:	0d 93       	st	X+, r16
     bc4:	1c 93       	st	X, r17
     bc6:	01 96       	adiw	r24, 0x01	; 1
     bc8:	f8 94       	cli
     bca:	2e bc       	out	0x2e, r2	; 46
     bcc:	6e b4       	in	r6, 0x2e	; 46
     bce:	78 94       	sei
     bd0:	67 9c       	mul	r6, r7
     bd2:	f0 01       	movw	r30, r0
     bd4:	f3 95       	inc	r31
     bd6:	09 94       	ijmp

00000bd8 <I_4D__ST16_c3_c1>:
     bd8:	db 01       	movw	r26, r22
     bda:	2d 93       	st	X+, r18
     bdc:	3c 93       	st	X, r19
     bde:	01 96       	adiw	r24, 0x01	; 1
     be0:	f8 94       	cli
     be2:	2e bc       	out	0x2e, r2	; 46
     be4:	6e b4       	in	r6, 0x2e	; 46
     be6:	78 94       	sei
     be8:	67 9c       	mul	r6, r7
     bea:	f0 01       	movw	r30, r0
     bec:	f3 95       	inc	r31
     bee:	09 94       	ijmp

00000bf0 <I_4E__ST16_c3_c2>:
     bf0:	db 01       	movw	r26, r22
     bf2:	4d 93       	st	X+, r20
     bf4:	5c 93       	st	X, r21
     bf6:	01 96       	adiw	r24, 0x01	; 1
     bf8:	f8 94       	cli
     bfa:	2e bc       	out	0x2e, r2	; 46
     bfc:	6e b4       	in	r6, 0x2e	; 46
     bfe:	78 94       	sei
     c00:	67 9c       	mul	r6, r7
     c02:	f0 01       	movw	r30, r0
     c04:	f3 95       	inc	r31
     c06:	09 94       	ijmp

00000c08 <I_4F__ST16_c3_c3>:
     c08:	db 01       	movw	r26, r22
     c0a:	6d 93       	st	X+, r22
     c0c:	7c 93       	st	X, r23
     c0e:	01 96       	adiw	r24, 0x01	; 1
     c10:	f8 94       	cli
     c12:	2e bc       	out	0x2e, r2	; 46
     c14:	6e b4       	in	r6, 0x2e	; 46
     c16:	78 94       	sei
     c18:	67 9c       	mul	r6, r7
     c1a:	f0 01       	movw	r30, r0
     c1c:	f3 95       	inc	r31
     c1e:	09 94       	ijmp

00000c20 <I_50__LDI1_c0>:
     c20:	c8 95       	lpm
     c22:	01 e0       	ldi	r16, 0x01	; 1
     c24:	10 e0       	ldi	r17, 0x00	; 0
     c26:	01 96       	adiw	r24, 0x01	; 1
     c28:	f8 94       	cli
     c2a:	2e bc       	out	0x2e, r2	; 46
     c2c:	6e b4       	in	r6, 0x2e	; 46
     c2e:	78 94       	sei
     c30:	67 9c       	mul	r6, r7
     c32:	f0 01       	movw	r30, r0
     c34:	f3 95       	inc	r31
     c36:	09 94       	ijmp

00000c38 <I_51__LD8_POST_c0_c1>:
     c38:	d9 01       	movw	r26, r18
     c3a:	0d 91       	ld	r16, X+
     c3c:	11 27       	eor	r17, r17
     c3e:	9d 01       	movw	r18, r26
     c40:	01 96       	adiw	r24, 0x01	; 1
     c42:	f8 94       	cli
     c44:	2e bc       	out	0x2e, r2	; 46
     c46:	6e b4       	in	r6, 0x2e	; 46
     c48:	78 94       	sei
     c4a:	67 9c       	mul	r6, r7
     c4c:	f0 01       	movw	r30, r0
     c4e:	f3 95       	inc	r31
     c50:	09 94       	ijmp

00000c52 <I_52__LD8_POST_c0_c2>:
     c52:	da 01       	movw	r26, r20
     c54:	0d 91       	ld	r16, X+
     c56:	11 27       	eor	r17, r17
     c58:	ad 01       	movw	r20, r26
     c5a:	01 96       	adiw	r24, 0x01	; 1
     c5c:	f8 94       	cli
     c5e:	2e bc       	out	0x2e, r2	; 46
     c60:	6e b4       	in	r6, 0x2e	; 46
     c62:	78 94       	sei
     c64:	67 9c       	mul	r6, r7
     c66:	f0 01       	movw	r30, r0
     c68:	f3 95       	inc	r31
     c6a:	09 94       	ijmp

00000c6c <I_53__LD8_POST_c0_c3>:
     c6c:	db 01       	movw	r26, r22
     c6e:	0d 91       	ld	r16, X+
     c70:	11 27       	eor	r17, r17
     c72:	bd 01       	movw	r22, r26
     c74:	01 96       	adiw	r24, 0x01	; 1
     c76:	f8 94       	cli
     c78:	2e bc       	out	0x2e, r2	; 46
     c7a:	6e b4       	in	r6, 0x2e	; 46
     c7c:	78 94       	sei
     c7e:	67 9c       	mul	r6, r7
     c80:	f0 01       	movw	r30, r0
     c82:	f3 95       	inc	r31
     c84:	09 94       	ijmp

00000c86 <I_54__LD8_POST_c1_c0>:
     c86:	d8 01       	movw	r26, r16
     c88:	2d 91       	ld	r18, X+
     c8a:	33 27       	eor	r19, r19
     c8c:	8d 01       	movw	r16, r26
     c8e:	01 96       	adiw	r24, 0x01	; 1
     c90:	f8 94       	cli
     c92:	2e bc       	out	0x2e, r2	; 46
     c94:	6e b4       	in	r6, 0x2e	; 46
     c96:	78 94       	sei
     c98:	67 9c       	mul	r6, r7
     c9a:	f0 01       	movw	r30, r0
     c9c:	f3 95       	inc	r31
     c9e:	09 94       	ijmp

00000ca0 <I_55__LDI1_c1>:
     ca0:	c8 95       	lpm
     ca2:	21 e0       	ldi	r18, 0x01	; 1
     ca4:	30 e0       	ldi	r19, 0x00	; 0
     ca6:	01 96       	adiw	r24, 0x01	; 1
     ca8:	f8 94       	cli
     caa:	2e bc       	out	0x2e, r2	; 46
     cac:	6e b4       	in	r6, 0x2e	; 46
     cae:	78 94       	sei
     cb0:	67 9c       	mul	r6, r7
     cb2:	f0 01       	movw	r30, r0
     cb4:	f3 95       	inc	r31
     cb6:	09 94       	ijmp

00000cb8 <I_56__LD8_POST_c1_c2>:
     cb8:	da 01       	movw	r26, r20
     cba:	2d 91       	ld	r18, X+
     cbc:	33 27       	eor	r19, r19
     cbe:	ad 01       	movw	r20, r26
     cc0:	01 96       	adiw	r24, 0x01	; 1
     cc2:	f8 94       	cli
     cc4:	2e bc       	out	0x2e, r2	; 46
     cc6:	6e b4       	in	r6, 0x2e	; 46
     cc8:	78 94       	sei
     cca:	67 9c       	mul	r6, r7
     ccc:	f0 01       	movw	r30, r0
     cce:	f3 95       	inc	r31
     cd0:	09 94       	ijmp

00000cd2 <I_57__LD8_POST_c1_c3>:
     cd2:	db 01       	movw	r26, r22
     cd4:	2d 91       	ld	r18, X+
     cd6:	33 27       	eor	r19, r19
     cd8:	bd 01       	movw	r22, r26
     cda:	01 96       	adiw	r24, 0x01	; 1
     cdc:	f8 94       	cli
     cde:	2e bc       	out	0x2e, r2	; 46
     ce0:	6e b4       	in	r6, 0x2e	; 46
     ce2:	78 94       	sei
     ce4:	67 9c       	mul	r6, r7
     ce6:	f0 01       	movw	r30, r0
     ce8:	f3 95       	inc	r31
     cea:	09 94       	ijmp

00000cec <I_58__LD8_POST_c2_c0>:
     cec:	d8 01       	movw	r26, r16
     cee:	4d 91       	ld	r20, X+
     cf0:	55 27       	eor	r21, r21
     cf2:	8d 01       	movw	r16, r26
     cf4:	01 96       	adiw	r24, 0x01	; 1
     cf6:	f8 94       	cli
     cf8:	2e bc       	out	0x2e, r2	; 46
     cfa:	6e b4       	in	r6, 0x2e	; 46
     cfc:	78 94       	sei
     cfe:	67 9c       	mul	r6, r7
     d00:	f0 01       	movw	r30, r0
     d02:	f3 95       	inc	r31
     d04:	09 94       	ijmp

00000d06 <I_59__LD8_POST_c2_c1>:
     d06:	d9 01       	movw	r26, r18
     d08:	4d 91       	ld	r20, X+
     d0a:	55 27       	eor	r21, r21
     d0c:	9d 01       	movw	r18, r26
     d0e:	01 96       	adiw	r24, 0x01	; 1
     d10:	f8 94       	cli
     d12:	2e bc       	out	0x2e, r2	; 46
     d14:	6e b4       	in	r6, 0x2e	; 46
     d16:	78 94       	sei
     d18:	67 9c       	mul	r6, r7
     d1a:	f0 01       	movw	r30, r0
     d1c:	f3 95       	inc	r31
     d1e:	09 94       	ijmp

00000d20 <I_5A__LDI1_c2>:
     d20:	c8 95       	lpm
     d22:	41 e0       	ldi	r20, 0x01	; 1
     d24:	50 e0       	ldi	r21, 0x00	; 0
     d26:	01 96       	adiw	r24, 0x01	; 1
     d28:	f8 94       	cli
     d2a:	2e bc       	out	0x2e, r2	; 46
     d2c:	6e b4       	in	r6, 0x2e	; 46
     d2e:	78 94       	sei
     d30:	67 9c       	mul	r6, r7
     d32:	f0 01       	movw	r30, r0
     d34:	f3 95       	inc	r31
     d36:	09 94       	ijmp

00000d38 <I_5B__LD8_POST_c2_c3>:
     d38:	db 01       	movw	r26, r22
     d3a:	4d 91       	ld	r20, X+
     d3c:	55 27       	eor	r21, r21
     d3e:	bd 01       	movw	r22, r26
     d40:	01 96       	adiw	r24, 0x01	; 1
     d42:	f8 94       	cli
     d44:	2e bc       	out	0x2e, r2	; 46
     d46:	6e b4       	in	r6, 0x2e	; 46
     d48:	78 94       	sei
     d4a:	67 9c       	mul	r6, r7
     d4c:	f0 01       	movw	r30, r0
     d4e:	f3 95       	inc	r31
     d50:	09 94       	ijmp

00000d52 <I_5C__LD8_POST_c3_c0>:
     d52:	d8 01       	movw	r26, r16
     d54:	6d 91       	ld	r22, X+
     d56:	77 27       	eor	r23, r23
     d58:	8d 01       	movw	r16, r26
     d5a:	01 96       	adiw	r24, 0x01	; 1
     d5c:	f8 94       	cli
     d5e:	2e bc       	out	0x2e, r2	; 46
     d60:	6e b4       	in	r6, 0x2e	; 46
     d62:	78 94       	sei
     d64:	67 9c       	mul	r6, r7
     d66:	f0 01       	movw	r30, r0
     d68:	f3 95       	inc	r31
     d6a:	09 94       	ijmp

00000d6c <I_5D__LD8_POST_c3_c1>:
     d6c:	d9 01       	movw	r26, r18
     d6e:	6d 91       	ld	r22, X+
     d70:	77 27       	eor	r23, r23
     d72:	9d 01       	movw	r18, r26
     d74:	01 96       	adiw	r24, 0x01	; 1
     d76:	f8 94       	cli
     d78:	2e bc       	out	0x2e, r2	; 46
     d7a:	6e b4       	in	r6, 0x2e	; 46
     d7c:	78 94       	sei
     d7e:	67 9c       	mul	r6, r7
     d80:	f0 01       	movw	r30, r0
     d82:	f3 95       	inc	r31
     d84:	09 94       	ijmp

00000d86 <I_5E__LD8_POST_c3_c2>:
     d86:	da 01       	movw	r26, r20
     d88:	6d 91       	ld	r22, X+
     d8a:	77 27       	eor	r23, r23
     d8c:	ad 01       	movw	r20, r26
     d8e:	01 96       	adiw	r24, 0x01	; 1
     d90:	f8 94       	cli
     d92:	2e bc       	out	0x2e, r2	; 46
     d94:	6e b4       	in	r6, 0x2e	; 46
     d96:	78 94       	sei
     d98:	67 9c       	mul	r6, r7
     d9a:	f0 01       	movw	r30, r0
     d9c:	f3 95       	inc	r31
     d9e:	09 94       	ijmp

00000da0 <I_5F__LDI1_c3>:
     da0:	c8 95       	lpm
     da2:	61 e0       	ldi	r22, 0x01	; 1
     da4:	70 e0       	ldi	r23, 0x00	; 0
     da6:	01 96       	adiw	r24, 0x01	; 1
     da8:	f8 94       	cli
     daa:	2e bc       	out	0x2e, r2	; 46
     dac:	6e b4       	in	r6, 0x2e	; 46
     dae:	78 94       	sei
     db0:	67 9c       	mul	r6, r7
     db2:	f0 01       	movw	r30, r0
     db4:	f3 95       	inc	r31
     db6:	09 94       	ijmp

00000db8 <I_60__ST8_POST_c0_c0>:
     db8:	00 00       	nop
     dba:	d8 01       	movw	r26, r16
     dbc:	0d 93       	st	X+, r16
     dbe:	8d 01       	movw	r16, r26
     dc0:	01 96       	adiw	r24, 0x01	; 1
     dc2:	f8 94       	cli
     dc4:	2e bc       	out	0x2e, r2	; 46
     dc6:	6e b4       	in	r6, 0x2e	; 46
     dc8:	78 94       	sei
     dca:	67 9c       	mul	r6, r7
     dcc:	f0 01       	movw	r30, r0
     dce:	f3 95       	inc	r31
     dd0:	09 94       	ijmp

00000dd2 <I_61__ST8_POST_c0_c1>:
     dd2:	00 00       	nop
     dd4:	d8 01       	movw	r26, r16
     dd6:	2d 93       	st	X+, r18
     dd8:	8d 01       	movw	r16, r26
     dda:	01 96       	adiw	r24, 0x01	; 1
     ddc:	f8 94       	cli
     dde:	2e bc       	out	0x2e, r2	; 46
     de0:	6e b4       	in	r6, 0x2e	; 46
     de2:	78 94       	sei
     de4:	67 9c       	mul	r6, r7
     de6:	f0 01       	movw	r30, r0
     de8:	f3 95       	inc	r31
     dea:	09 94       	ijmp

00000dec <I_62__ST8_POST_c0_c2>:
     dec:	00 00       	nop
     dee:	d8 01       	movw	r26, r16
     df0:	4d 93       	st	X+, r20
     df2:	8d 01       	movw	r16, r26
     df4:	01 96       	adiw	r24, 0x01	; 1
     df6:	f8 94       	cli
     df8:	2e bc       	out	0x2e, r2	; 46
     dfa:	6e b4       	in	r6, 0x2e	; 46
     dfc:	78 94       	sei
     dfe:	67 9c       	mul	r6, r7
     e00:	f0 01       	movw	r30, r0
     e02:	f3 95       	inc	r31
     e04:	09 94       	ijmp

00000e06 <I_63__ST8_POST_c0_c3>:
     e06:	00 00       	nop
     e08:	d8 01       	movw	r26, r16
     e0a:	6d 93       	st	X+, r22
     e0c:	8d 01       	movw	r16, r26
     e0e:	01 96       	adiw	r24, 0x01	; 1
     e10:	f8 94       	cli
     e12:	2e bc       	out	0x2e, r2	; 46
     e14:	6e b4       	in	r6, 0x2e	; 46
     e16:	78 94       	sei
     e18:	67 9c       	mul	r6, r7
     e1a:	f0 01       	movw	r30, r0
     e1c:	f3 95       	inc	r31
     e1e:	09 94       	ijmp

00000e20 <I_64__ST8_POST_c1_c0>:
     e20:	00 00       	nop
     e22:	d9 01       	movw	r26, r18
     e24:	0d 93       	st	X+, r16
     e26:	9d 01       	movw	r18, r26
     e28:	01 96       	adiw	r24, 0x01	; 1
     e2a:	f8 94       	cli
     e2c:	2e bc       	out	0x2e, r2	; 46
     e2e:	6e b4       	in	r6, 0x2e	; 46
     e30:	78 94       	sei
     e32:	67 9c       	mul	r6, r7
     e34:	f0 01       	movw	r30, r0
     e36:	f3 95       	inc	r31
     e38:	09 94       	ijmp

00000e3a <I_65__ST8_POST_c1_c1>:
     e3a:	00 00       	nop
     e3c:	d9 01       	movw	r26, r18
     e3e:	2d 93       	st	X+, r18
     e40:	9d 01       	movw	r18, r26
     e42:	01 96       	adiw	r24, 0x01	; 1
     e44:	f8 94       	cli
     e46:	2e bc       	out	0x2e, r2	; 46
     e48:	6e b4       	in	r6, 0x2e	; 46
     e4a:	78 94       	sei
     e4c:	67 9c       	mul	r6, r7
     e4e:	f0 01       	movw	r30, r0
     e50:	f3 95       	inc	r31
     e52:	09 94       	ijmp

00000e54 <I_66__ST8_POST_c1_c2>:
     e54:	00 00       	nop
     e56:	d9 01       	movw	r26, r18
     e58:	4d 93       	st	X+, r20
     e5a:	9d 01       	movw	r18, r26
     e5c:	01 96       	adiw	r24, 0x01	; 1
     e5e:	f8 94       	cli
     e60:	2e bc       	out	0x2e, r2	; 46
     e62:	6e b4       	in	r6, 0x2e	; 46
     e64:	78 94       	sei
     e66:	67 9c       	mul	r6, r7
     e68:	f0 01       	movw	r30, r0
     e6a:	f3 95       	inc	r31
     e6c:	09 94       	ijmp

00000e6e <I_67__ST8_POST_c1_c3>:
     e6e:	00 00       	nop
     e70:	d9 01       	movw	r26, r18
     e72:	6d 93       	st	X+, r22
     e74:	9d 01       	movw	r18, r26
     e76:	01 96       	adiw	r24, 0x01	; 1
     e78:	f8 94       	cli
     e7a:	2e bc       	out	0x2e, r2	; 46
     e7c:	6e b4       	in	r6, 0x2e	; 46
     e7e:	78 94       	sei
     e80:	67 9c       	mul	r6, r7
     e82:	f0 01       	movw	r30, r0
     e84:	f3 95       	inc	r31
     e86:	09 94       	ijmp

00000e88 <I_68__ST8_POST_c2_c0>:
     e88:	00 00       	nop
     e8a:	da 01       	movw	r26, r20
     e8c:	0d 93       	st	X+, r16
     e8e:	ad 01       	movw	r20, r26
     e90:	01 96       	adiw	r24, 0x01	; 1
     e92:	f8 94       	cli
     e94:	2e bc       	out	0x2e, r2	; 46
     e96:	6e b4       	in	r6, 0x2e	; 46
     e98:	78 94       	sei
     e9a:	67 9c       	mul	r6, r7
     e9c:	f0 01       	movw	r30, r0
     e9e:	f3 95       	inc	r31
     ea0:	09 94       	ijmp

00000ea2 <I_69__ST8_POST_c2_c1>:
     ea2:	00 00       	nop
     ea4:	da 01       	movw	r26, r20
     ea6:	2d 93       	st	X+, r18
     ea8:	ad 01       	movw	r20, r26
     eaa:	01 96       	adiw	r24, 0x01	; 1
     eac:	f8 94       	cli
     eae:	2e bc       	out	0x2e, r2	; 46
     eb0:	6e b4       	in	r6, 0x2e	; 46
     eb2:	78 94       	sei
     eb4:	67 9c       	mul	r6, r7
     eb6:	f0 01       	movw	r30, r0
     eb8:	f3 95       	inc	r31
     eba:	09 94       	ijmp

00000ebc <I_6A__ST8_POST_c2_c2>:
     ebc:	00 00       	nop
     ebe:	da 01       	movw	r26, r20
     ec0:	4d 93       	st	X+, r20
     ec2:	ad 01       	movw	r20, r26
     ec4:	01 96       	adiw	r24, 0x01	; 1
     ec6:	f8 94       	cli
     ec8:	2e bc       	out	0x2e, r2	; 46
     eca:	6e b4       	in	r6, 0x2e	; 46
     ecc:	78 94       	sei
     ece:	67 9c       	mul	r6, r7
     ed0:	f0 01       	movw	r30, r0
     ed2:	f3 95       	inc	r31
     ed4:	09 94       	ijmp

00000ed6 <I_6B__ST8_POST_c2_c3>:
     ed6:	00 00       	nop
     ed8:	da 01       	movw	r26, r20
     eda:	6d 93       	st	X+, r22
     edc:	ad 01       	movw	r20, r26
     ede:	01 96       	adiw	r24, 0x01	; 1
     ee0:	f8 94       	cli
     ee2:	2e bc       	out	0x2e, r2	; 46
     ee4:	6e b4       	in	r6, 0x2e	; 46
     ee6:	78 94       	sei
     ee8:	67 9c       	mul	r6, r7
     eea:	f0 01       	movw	r30, r0
     eec:	f3 95       	inc	r31
     eee:	09 94       	ijmp

00000ef0 <I_6C__ST8_POST_c3_c0>:
     ef0:	00 00       	nop
     ef2:	db 01       	movw	r26, r22
     ef4:	0d 93       	st	X+, r16
     ef6:	bd 01       	movw	r22, r26
     ef8:	01 96       	adiw	r24, 0x01	; 1
     efa:	f8 94       	cli
     efc:	2e bc       	out	0x2e, r2	; 46
     efe:	6e b4       	in	r6, 0x2e	; 46
     f00:	78 94       	sei
     f02:	67 9c       	mul	r6, r7
     f04:	f0 01       	movw	r30, r0
     f06:	f3 95       	inc	r31
     f08:	09 94       	ijmp

00000f0a <I_6D__ST8_POST_c3_c1>:
     f0a:	00 00       	nop
     f0c:	db 01       	movw	r26, r22
     f0e:	2d 93       	st	X+, r18
     f10:	bd 01       	movw	r22, r26
     f12:	01 96       	adiw	r24, 0x01	; 1
     f14:	f8 94       	cli
     f16:	2e bc       	out	0x2e, r2	; 46
     f18:	6e b4       	in	r6, 0x2e	; 46
     f1a:	78 94       	sei
     f1c:	67 9c       	mul	r6, r7
     f1e:	f0 01       	movw	r30, r0
     f20:	f3 95       	inc	r31
     f22:	09 94       	ijmp

00000f24 <I_6E__ST8_POST_c3_c2>:
     f24:	00 00       	nop
     f26:	db 01       	movw	r26, r22
     f28:	4d 93       	st	X+, r20
     f2a:	bd 01       	movw	r22, r26
     f2c:	01 96       	adiw	r24, 0x01	; 1
     f2e:	f8 94       	cli
     f30:	2e bc       	out	0x2e, r2	; 46
     f32:	6e b4       	in	r6, 0x2e	; 46
     f34:	78 94       	sei
     f36:	67 9c       	mul	r6, r7
     f38:	f0 01       	movw	r30, r0
     f3a:	f3 95       	inc	r31
     f3c:	09 94       	ijmp

00000f3e <I_6F__ST8_POST_c3_c3>:
     f3e:	00 00       	nop
     f40:	db 01       	movw	r26, r22
     f42:	6d 93       	st	X+, r22
     f44:	bd 01       	movw	r22, r26
     f46:	01 96       	adiw	r24, 0x01	; 1
     f48:	f8 94       	cli
     f4a:	2e bc       	out	0x2e, r2	; 46
     f4c:	6e b4       	in	r6, 0x2e	; 46
     f4e:	78 94       	sei
     f50:	67 9c       	mul	r6, r7
     f52:	f0 01       	movw	r30, r0
     f54:	f3 95       	inc	r31
     f56:	09 94       	ijmp

00000f58 <I_70__PUSH16_r0>:
     f58:	00 00       	nop
     f5a:	9a 92       	st	-Y, r9
     f5c:	8a 92       	st	-Y, r8
     f5e:	01 96       	adiw	r24, 0x01	; 1
     f60:	f8 94       	cli
     f62:	2e bc       	out	0x2e, r2	; 46
     f64:	6e b4       	in	r6, 0x2e	; 46
     f66:	78 94       	sei
     f68:	67 9c       	mul	r6, r7
     f6a:	f0 01       	movw	r30, r0
     f6c:	f3 95       	inc	r31
     f6e:	09 94       	ijmp

00000f70 <I_71__PUSH16_r1>:
     f70:	00 00       	nop
     f72:	ba 92       	st	-Y, r11
     f74:	aa 92       	st	-Y, r10
     f76:	01 96       	adiw	r24, 0x01	; 1
     f78:	f8 94       	cli
     f7a:	2e bc       	out	0x2e, r2	; 46
     f7c:	6e b4       	in	r6, 0x2e	; 46
     f7e:	78 94       	sei
     f80:	67 9c       	mul	r6, r7
     f82:	f0 01       	movw	r30, r0
     f84:	f3 95       	inc	r31
     f86:	09 94       	ijmp

00000f88 <I_72__PUSH16_r2>:
     f88:	00 00       	nop
     f8a:	da 92       	st	-Y, r13
     f8c:	ca 92       	st	-Y, r12
     f8e:	01 96       	adiw	r24, 0x01	; 1
     f90:	f8 94       	cli
     f92:	2e bc       	out	0x2e, r2	; 46
     f94:	6e b4       	in	r6, 0x2e	; 46
     f96:	78 94       	sei
     f98:	67 9c       	mul	r6, r7
     f9a:	f0 01       	movw	r30, r0
     f9c:	f3 95       	inc	r31
     f9e:	09 94       	ijmp

00000fa0 <I_73__PUSH16_r3>:
     fa0:	00 00       	nop
     fa2:	fa 92       	st	-Y, r15
     fa4:	ea 92       	st	-Y, r14
     fa6:	01 96       	adiw	r24, 0x01	; 1
     fa8:	f8 94       	cli
     faa:	2e bc       	out	0x2e, r2	; 46
     fac:	6e b4       	in	r6, 0x2e	; 46
     fae:	78 94       	sei
     fb0:	67 9c       	mul	r6, r7
     fb2:	f0 01       	movw	r30, r0
     fb4:	f3 95       	inc	r31
     fb6:	09 94       	ijmp

00000fb8 <I_74__PUSH16_r4>:
     fb8:	00 00       	nop
     fba:	1a 93       	st	-Y, r17
     fbc:	0a 93       	st	-Y, r16
     fbe:	01 96       	adiw	r24, 0x01	; 1
     fc0:	f8 94       	cli
     fc2:	2e bc       	out	0x2e, r2	; 46
     fc4:	6e b4       	in	r6, 0x2e	; 46
     fc6:	78 94       	sei
     fc8:	67 9c       	mul	r6, r7
     fca:	f0 01       	movw	r30, r0
     fcc:	f3 95       	inc	r31
     fce:	09 94       	ijmp

00000fd0 <I_75__PUSH16_r5>:
     fd0:	00 00       	nop
     fd2:	3a 93       	st	-Y, r19
     fd4:	2a 93       	st	-Y, r18
     fd6:	01 96       	adiw	r24, 0x01	; 1
     fd8:	f8 94       	cli
     fda:	2e bc       	out	0x2e, r2	; 46
     fdc:	6e b4       	in	r6, 0x2e	; 46
     fde:	78 94       	sei
     fe0:	67 9c       	mul	r6, r7
     fe2:	f0 01       	movw	r30, r0
     fe4:	f3 95       	inc	r31
     fe6:	09 94       	ijmp

00000fe8 <I_76__PUSH16_r6>:
     fe8:	00 00       	nop
     fea:	5a 93       	st	-Y, r21
     fec:	4a 93       	st	-Y, r20
     fee:	01 96       	adiw	r24, 0x01	; 1
     ff0:	f8 94       	cli
     ff2:	2e bc       	out	0x2e, r2	; 46
     ff4:	6e b4       	in	r6, 0x2e	; 46
     ff6:	78 94       	sei
     ff8:	67 9c       	mul	r6, r7
     ffa:	f0 01       	movw	r30, r0
     ffc:	f3 95       	inc	r31
     ffe:	09 94       	ijmp

00001000 <I_77__PUSH16_r7>:
    1000:	00 00       	nop
    1002:	7a 93       	st	-Y, r23
    1004:	6a 93       	st	-Y, r22
    1006:	01 96       	adiw	r24, 0x01	; 1
    1008:	f8 94       	cli
    100a:	2e bc       	out	0x2e, r2	; 46
    100c:	6e b4       	in	r6, 0x2e	; 46
    100e:	78 94       	sei
    1010:	67 9c       	mul	r6, r7
    1012:	f0 01       	movw	r30, r0
    1014:	f3 95       	inc	r31
    1016:	09 94       	ijmp

00001018 <I_78__POP16_r0>:
    1018:	00 00       	nop
    101a:	89 90       	ld	r8, Y+
    101c:	99 90       	ld	r9, Y+
    101e:	01 96       	adiw	r24, 0x01	; 1
    1020:	f8 94       	cli
    1022:	2e bc       	out	0x2e, r2	; 46
    1024:	6e b4       	in	r6, 0x2e	; 46
    1026:	78 94       	sei
    1028:	67 9c       	mul	r6, r7
    102a:	f0 01       	movw	r30, r0
    102c:	f3 95       	inc	r31
    102e:	09 94       	ijmp

00001030 <I_79__POP16_r1>:
    1030:	00 00       	nop
    1032:	a9 90       	ld	r10, Y+
    1034:	b9 90       	ld	r11, Y+
    1036:	01 96       	adiw	r24, 0x01	; 1
    1038:	f8 94       	cli
    103a:	2e bc       	out	0x2e, r2	; 46
    103c:	6e b4       	in	r6, 0x2e	; 46
    103e:	78 94       	sei
    1040:	67 9c       	mul	r6, r7
    1042:	f0 01       	movw	r30, r0
    1044:	f3 95       	inc	r31
    1046:	09 94       	ijmp

00001048 <I_7A__POP16_r2>:
    1048:	00 00       	nop
    104a:	c9 90       	ld	r12, Y+
    104c:	d9 90       	ld	r13, Y+
    104e:	01 96       	adiw	r24, 0x01	; 1
    1050:	f8 94       	cli
    1052:	2e bc       	out	0x2e, r2	; 46
    1054:	6e b4       	in	r6, 0x2e	; 46
    1056:	78 94       	sei
    1058:	67 9c       	mul	r6, r7
    105a:	f0 01       	movw	r30, r0
    105c:	f3 95       	inc	r31
    105e:	09 94       	ijmp

00001060 <I_7B__POP16_r3>:
    1060:	00 00       	nop
    1062:	e9 90       	ld	r14, Y+
    1064:	f9 90       	ld	r15, Y+
    1066:	01 96       	adiw	r24, 0x01	; 1
    1068:	f8 94       	cli
    106a:	2e bc       	out	0x2e, r2	; 46
    106c:	6e b4       	in	r6, 0x2e	; 46
    106e:	78 94       	sei
    1070:	67 9c       	mul	r6, r7
    1072:	f0 01       	movw	r30, r0
    1074:	f3 95       	inc	r31
    1076:	09 94       	ijmp

00001078 <I_7C__POP16_r4>:
    1078:	00 00       	nop
    107a:	09 91       	ld	r16, Y+
    107c:	19 91       	ld	r17, Y+
    107e:	01 96       	adiw	r24, 0x01	; 1
    1080:	f8 94       	cli
    1082:	2e bc       	out	0x2e, r2	; 46
    1084:	6e b4       	in	r6, 0x2e	; 46
    1086:	78 94       	sei
    1088:	67 9c       	mul	r6, r7
    108a:	f0 01       	movw	r30, r0
    108c:	f3 95       	inc	r31
    108e:	09 94       	ijmp

00001090 <I_7D__POP16_r5>:
    1090:	00 00       	nop
    1092:	29 91       	ld	r18, Y+
    1094:	39 91       	ld	r19, Y+
    1096:	01 96       	adiw	r24, 0x01	; 1
    1098:	f8 94       	cli
    109a:	2e bc       	out	0x2e, r2	; 46
    109c:	6e b4       	in	r6, 0x2e	; 46
    109e:	78 94       	sei
    10a0:	67 9c       	mul	r6, r7
    10a2:	f0 01       	movw	r30, r0
    10a4:	f3 95       	inc	r31
    10a6:	09 94       	ijmp

000010a8 <I_7E__POP16_r6>:
    10a8:	00 00       	nop
    10aa:	49 91       	ld	r20, Y+
    10ac:	59 91       	ld	r21, Y+
    10ae:	01 96       	adiw	r24, 0x01	; 1
    10b0:	f8 94       	cli
    10b2:	2e bc       	out	0x2e, r2	; 46
    10b4:	6e b4       	in	r6, 0x2e	; 46
    10b6:	78 94       	sei
    10b8:	67 9c       	mul	r6, r7
    10ba:	f0 01       	movw	r30, r0
    10bc:	f3 95       	inc	r31
    10be:	09 94       	ijmp

000010c0 <I_7F__POP16_r7>:
    10c0:	00 00       	nop
    10c2:	69 91       	ld	r22, Y+
    10c4:	79 91       	ld	r23, Y+
    10c6:	01 96       	adiw	r24, 0x01	; 1
    10c8:	f8 94       	cli
    10ca:	2e bc       	out	0x2e, r2	; 46
    10cc:	6e b4       	in	r6, 0x2e	; 46
    10ce:	78 94       	sei
    10d0:	67 9c       	mul	r6, r7
    10d2:	f0 01       	movw	r30, r0
    10d4:	f3 95       	inc	r31
    10d6:	09 94       	ijmp

000010d8 <I_80__ADD_c0_c0>:
    10d8:	00 c0       	rjmp	.+0      	; 0x10da <I_80__ADD_c0_c0+0x2>
    10da:	00 0f       	add	r16, r16
    10dc:	11 1f       	adc	r17, r17
    10de:	5f b6       	in	r5, 0x3f	; 63
    10e0:	01 96       	adiw	r24, 0x01	; 1
    10e2:	f8 94       	cli
    10e4:	2e bc       	out	0x2e, r2	; 46
    10e6:	6e b4       	in	r6, 0x2e	; 46
    10e8:	78 94       	sei
    10ea:	67 9c       	mul	r6, r7
    10ec:	f0 01       	movw	r30, r0
    10ee:	f3 95       	inc	r31
    10f0:	09 94       	ijmp

000010f2 <I_81__ADD_c0_c1>:
    10f2:	00 c0       	rjmp	.+0      	; 0x10f4 <I_81__ADD_c0_c1+0x2>
    10f4:	02 0f       	add	r16, r18
    10f6:	13 1f       	adc	r17, r19
    10f8:	5f b6       	in	r5, 0x3f	; 63
    10fa:	01 96       	adiw	r24, 0x01	; 1
    10fc:	f8 94       	cli
    10fe:	2e bc       	out	0x2e, r2	; 46
    1100:	6e b4       	in	r6, 0x2e	; 46
    1102:	78 94       	sei
    1104:	67 9c       	mul	r6, r7
    1106:	f0 01       	movw	r30, r0
    1108:	f3 95       	inc	r31
    110a:	09 94       	ijmp

0000110c <I_82__ADD_c0_c2>:
    110c:	00 c0       	rjmp	.+0      	; 0x110e <I_82__ADD_c0_c2+0x2>
    110e:	04 0f       	add	r16, r20
    1110:	15 1f       	adc	r17, r21
    1112:	5f b6       	in	r5, 0x3f	; 63
    1114:	01 96       	adiw	r24, 0x01	; 1
    1116:	f8 94       	cli
    1118:	2e bc       	out	0x2e, r2	; 46
    111a:	6e b4       	in	r6, 0x2e	; 46
    111c:	78 94       	sei
    111e:	67 9c       	mul	r6, r7
    1120:	f0 01       	movw	r30, r0
    1122:	f3 95       	inc	r31
    1124:	09 94       	ijmp

00001126 <I_83__ADD_c0_c3>:
    1126:	00 c0       	rjmp	.+0      	; 0x1128 <I_83__ADD_c0_c3+0x2>
    1128:	06 0f       	add	r16, r22
    112a:	17 1f       	adc	r17, r23
    112c:	5f b6       	in	r5, 0x3f	; 63
    112e:	01 96       	adiw	r24, 0x01	; 1
    1130:	f8 94       	cli
    1132:	2e bc       	out	0x2e, r2	; 46
    1134:	6e b4       	in	r6, 0x2e	; 46
    1136:	78 94       	sei
    1138:	67 9c       	mul	r6, r7
    113a:	f0 01       	movw	r30, r0
    113c:	f3 95       	inc	r31
    113e:	09 94       	ijmp

00001140 <I_84__ADD_c1_c0>:
    1140:	00 c0       	rjmp	.+0      	; 0x1142 <I_84__ADD_c1_c0+0x2>
    1142:	20 0f       	add	r18, r16
    1144:	31 1f       	adc	r19, r17
    1146:	5f b6       	in	r5, 0x3f	; 63
    1148:	01 96       	adiw	r24, 0x01	; 1
    114a:	f8 94       	cli
    114c:	2e bc       	out	0x2e, r2	; 46
    114e:	6e b4       	in	r6, 0x2e	; 46
    1150:	78 94       	sei
    1152:	67 9c       	mul	r6, r7
    1154:	f0 01       	movw	r30, r0
    1156:	f3 95       	inc	r31
    1158:	09 94       	ijmp

0000115a <I_85__ADD_c1_c1>:
    115a:	00 c0       	rjmp	.+0      	; 0x115c <I_85__ADD_c1_c1+0x2>
    115c:	22 0f       	add	r18, r18
    115e:	33 1f       	adc	r19, r19
    1160:	5f b6       	in	r5, 0x3f	; 63
    1162:	01 96       	adiw	r24, 0x01	; 1
    1164:	f8 94       	cli
    1166:	2e bc       	out	0x2e, r2	; 46
    1168:	6e b4       	in	r6, 0x2e	; 46
    116a:	78 94       	sei
    116c:	67 9c       	mul	r6, r7
    116e:	f0 01       	movw	r30, r0
    1170:	f3 95       	inc	r31
    1172:	09 94       	ijmp

00001174 <I_86__ADD_c1_c2>:
    1174:	00 c0       	rjmp	.+0      	; 0x1176 <I_86__ADD_c1_c2+0x2>
    1176:	24 0f       	add	r18, r20
    1178:	35 1f       	adc	r19, r21
    117a:	5f b6       	in	r5, 0x3f	; 63
    117c:	01 96       	adiw	r24, 0x01	; 1
    117e:	f8 94       	cli
    1180:	2e bc       	out	0x2e, r2	; 46
    1182:	6e b4       	in	r6, 0x2e	; 46
    1184:	78 94       	sei
    1186:	67 9c       	mul	r6, r7
    1188:	f0 01       	movw	r30, r0
    118a:	f3 95       	inc	r31
    118c:	09 94       	ijmp

0000118e <I_87__ADD_c1_c3>:
    118e:	00 c0       	rjmp	.+0      	; 0x1190 <I_87__ADD_c1_c3+0x2>
    1190:	26 0f       	add	r18, r22
    1192:	37 1f       	adc	r19, r23
    1194:	5f b6       	in	r5, 0x3f	; 63
    1196:	01 96       	adiw	r24, 0x01	; 1
    1198:	f8 94       	cli
    119a:	2e bc       	out	0x2e, r2	; 46
    119c:	6e b4       	in	r6, 0x2e	; 46
    119e:	78 94       	sei
    11a0:	67 9c       	mul	r6, r7
    11a2:	f0 01       	movw	r30, r0
    11a4:	f3 95       	inc	r31
    11a6:	09 94       	ijmp

000011a8 <I_88__ADD_c2_c0>:
    11a8:	00 c0       	rjmp	.+0      	; 0x11aa <I_88__ADD_c2_c0+0x2>
    11aa:	40 0f       	add	r20, r16
    11ac:	51 1f       	adc	r21, r17
    11ae:	5f b6       	in	r5, 0x3f	; 63
    11b0:	01 96       	adiw	r24, 0x01	; 1
    11b2:	f8 94       	cli
    11b4:	2e bc       	out	0x2e, r2	; 46
    11b6:	6e b4       	in	r6, 0x2e	; 46
    11b8:	78 94       	sei
    11ba:	67 9c       	mul	r6, r7
    11bc:	f0 01       	movw	r30, r0
    11be:	f3 95       	inc	r31
    11c0:	09 94       	ijmp

000011c2 <I_89__ADD_c2_c1>:
    11c2:	00 c0       	rjmp	.+0      	; 0x11c4 <I_89__ADD_c2_c1+0x2>
    11c4:	42 0f       	add	r20, r18
    11c6:	53 1f       	adc	r21, r19
    11c8:	5f b6       	in	r5, 0x3f	; 63
    11ca:	01 96       	adiw	r24, 0x01	; 1
    11cc:	f8 94       	cli
    11ce:	2e bc       	out	0x2e, r2	; 46
    11d0:	6e b4       	in	r6, 0x2e	; 46
    11d2:	78 94       	sei
    11d4:	67 9c       	mul	r6, r7
    11d6:	f0 01       	movw	r30, r0
    11d8:	f3 95       	inc	r31
    11da:	09 94       	ijmp

000011dc <I_8A__ADD_c2_c2>:
    11dc:	00 c0       	rjmp	.+0      	; 0x11de <I_8A__ADD_c2_c2+0x2>
    11de:	44 0f       	add	r20, r20
    11e0:	55 1f       	adc	r21, r21
    11e2:	5f b6       	in	r5, 0x3f	; 63
    11e4:	01 96       	adiw	r24, 0x01	; 1
    11e6:	f8 94       	cli
    11e8:	2e bc       	out	0x2e, r2	; 46
    11ea:	6e b4       	in	r6, 0x2e	; 46
    11ec:	78 94       	sei
    11ee:	67 9c       	mul	r6, r7
    11f0:	f0 01       	movw	r30, r0
    11f2:	f3 95       	inc	r31
    11f4:	09 94       	ijmp

000011f6 <I_8B__ADD_c2_c3>:
    11f6:	00 c0       	rjmp	.+0      	; 0x11f8 <I_8B__ADD_c2_c3+0x2>
    11f8:	46 0f       	add	r20, r22
    11fa:	57 1f       	adc	r21, r23
    11fc:	5f b6       	in	r5, 0x3f	; 63
    11fe:	01 96       	adiw	r24, 0x01	; 1
    1200:	f8 94       	cli
    1202:	2e bc       	out	0x2e, r2	; 46
    1204:	6e b4       	in	r6, 0x2e	; 46
    1206:	78 94       	sei
    1208:	67 9c       	mul	r6, r7
    120a:	f0 01       	movw	r30, r0
    120c:	f3 95       	inc	r31
    120e:	09 94       	ijmp

00001210 <I_8C__ADD_c3_c0>:
    1210:	00 c0       	rjmp	.+0      	; 0x1212 <I_8C__ADD_c3_c0+0x2>
    1212:	60 0f       	add	r22, r16
    1214:	71 1f       	adc	r23, r17
    1216:	5f b6       	in	r5, 0x3f	; 63
    1218:	01 96       	adiw	r24, 0x01	; 1
    121a:	f8 94       	cli
    121c:	2e bc       	out	0x2e, r2	; 46
    121e:	6e b4       	in	r6, 0x2e	; 46
    1220:	78 94       	sei
    1222:	67 9c       	mul	r6, r7
    1224:	f0 01       	movw	r30, r0
    1226:	f3 95       	inc	r31
    1228:	09 94       	ijmp

0000122a <I_8D__ADD_c3_c1>:
    122a:	00 c0       	rjmp	.+0      	; 0x122c <I_8D__ADD_c3_c1+0x2>
    122c:	62 0f       	add	r22, r18
    122e:	73 1f       	adc	r23, r19
    1230:	5f b6       	in	r5, 0x3f	; 63
    1232:	01 96       	adiw	r24, 0x01	; 1
    1234:	f8 94       	cli
    1236:	2e bc       	out	0x2e, r2	; 46
    1238:	6e b4       	in	r6, 0x2e	; 46
    123a:	78 94       	sei
    123c:	67 9c       	mul	r6, r7
    123e:	f0 01       	movw	r30, r0
    1240:	f3 95       	inc	r31
    1242:	09 94       	ijmp

00001244 <I_8E__ADD_c3_c2>:
    1244:	00 c0       	rjmp	.+0      	; 0x1246 <I_8E__ADD_c3_c2+0x2>
    1246:	64 0f       	add	r22, r20
    1248:	75 1f       	adc	r23, r21
    124a:	5f b6       	in	r5, 0x3f	; 63
    124c:	01 96       	adiw	r24, 0x01	; 1
    124e:	f8 94       	cli
    1250:	2e bc       	out	0x2e, r2	; 46
    1252:	6e b4       	in	r6, 0x2e	; 46
    1254:	78 94       	sei
    1256:	67 9c       	mul	r6, r7
    1258:	f0 01       	movw	r30, r0
    125a:	f3 95       	inc	r31
    125c:	09 94       	ijmp

0000125e <I_8F__ADD_c3_c3>:
    125e:	00 c0       	rjmp	.+0      	; 0x1260 <I_8F__ADD_c3_c3+0x2>
    1260:	66 0f       	add	r22, r22
    1262:	77 1f       	adc	r23, r23
    1264:	5f b6       	in	r5, 0x3f	; 63
    1266:	01 96       	adiw	r24, 0x01	; 1
    1268:	f8 94       	cli
    126a:	2e bc       	out	0x2e, r2	; 46
    126c:	6e b4       	in	r6, 0x2e	; 46
    126e:	78 94       	sei
    1270:	67 9c       	mul	r6, r7
    1272:	f0 01       	movw	r30, r0
    1274:	f3 95       	inc	r31
    1276:	09 94       	ijmp

00001278 <I_90__SUB_c0_c0>:
    1278:	00 c0       	rjmp	.+0      	; 0x127a <I_90__SUB_c0_c0+0x2>
    127a:	00 1b       	sub	r16, r16
    127c:	11 0b       	sbc	r17, r17
    127e:	5f b6       	in	r5, 0x3f	; 63
    1280:	01 96       	adiw	r24, 0x01	; 1
    1282:	f8 94       	cli
    1284:	2e bc       	out	0x2e, r2	; 46
    1286:	6e b4       	in	r6, 0x2e	; 46
    1288:	78 94       	sei
    128a:	67 9c       	mul	r6, r7
    128c:	f0 01       	movw	r30, r0
    128e:	f3 95       	inc	r31
    1290:	09 94       	ijmp

00001292 <I_91__SUB_c0_c1>:
    1292:	00 c0       	rjmp	.+0      	; 0x1294 <I_91__SUB_c0_c1+0x2>
    1294:	02 1b       	sub	r16, r18
    1296:	13 0b       	sbc	r17, r19
    1298:	5f b6       	in	r5, 0x3f	; 63
    129a:	01 96       	adiw	r24, 0x01	; 1
    129c:	f8 94       	cli
    129e:	2e bc       	out	0x2e, r2	; 46
    12a0:	6e b4       	in	r6, 0x2e	; 46
    12a2:	78 94       	sei
    12a4:	67 9c       	mul	r6, r7
    12a6:	f0 01       	movw	r30, r0
    12a8:	f3 95       	inc	r31
    12aa:	09 94       	ijmp

000012ac <I_92__SUB_c0_c2>:
    12ac:	00 c0       	rjmp	.+0      	; 0x12ae <I_92__SUB_c0_c2+0x2>
    12ae:	04 1b       	sub	r16, r20
    12b0:	15 0b       	sbc	r17, r21
    12b2:	5f b6       	in	r5, 0x3f	; 63
    12b4:	01 96       	adiw	r24, 0x01	; 1
    12b6:	f8 94       	cli
    12b8:	2e bc       	out	0x2e, r2	; 46
    12ba:	6e b4       	in	r6, 0x2e	; 46
    12bc:	78 94       	sei
    12be:	67 9c       	mul	r6, r7
    12c0:	f0 01       	movw	r30, r0
    12c2:	f3 95       	inc	r31
    12c4:	09 94       	ijmp

000012c6 <I_93__SUB_c0_c3>:
    12c6:	00 c0       	rjmp	.+0      	; 0x12c8 <I_93__SUB_c0_c3+0x2>
    12c8:	06 1b       	sub	r16, r22
    12ca:	17 0b       	sbc	r17, r23
    12cc:	5f b6       	in	r5, 0x3f	; 63
    12ce:	01 96       	adiw	r24, 0x01	; 1
    12d0:	f8 94       	cli
    12d2:	2e bc       	out	0x2e, r2	; 46
    12d4:	6e b4       	in	r6, 0x2e	; 46
    12d6:	78 94       	sei
    12d8:	67 9c       	mul	r6, r7
    12da:	f0 01       	movw	r30, r0
    12dc:	f3 95       	inc	r31
    12de:	09 94       	ijmp

000012e0 <I_94__SUB_c1_c0>:
    12e0:	00 c0       	rjmp	.+0      	; 0x12e2 <I_94__SUB_c1_c0+0x2>
    12e2:	20 1b       	sub	r18, r16
    12e4:	31 0b       	sbc	r19, r17
    12e6:	5f b6       	in	r5, 0x3f	; 63
    12e8:	01 96       	adiw	r24, 0x01	; 1
    12ea:	f8 94       	cli
    12ec:	2e bc       	out	0x2e, r2	; 46
    12ee:	6e b4       	in	r6, 0x2e	; 46
    12f0:	78 94       	sei
    12f2:	67 9c       	mul	r6, r7
    12f4:	f0 01       	movw	r30, r0
    12f6:	f3 95       	inc	r31
    12f8:	09 94       	ijmp

000012fa <I_95__SUB_c1_c1>:
    12fa:	00 c0       	rjmp	.+0      	; 0x12fc <I_95__SUB_c1_c1+0x2>
    12fc:	22 1b       	sub	r18, r18
    12fe:	33 0b       	sbc	r19, r19
    1300:	5f b6       	in	r5, 0x3f	; 63
    1302:	01 96       	adiw	r24, 0x01	; 1
    1304:	f8 94       	cli
    1306:	2e bc       	out	0x2e, r2	; 46
    1308:	6e b4       	in	r6, 0x2e	; 46
    130a:	78 94       	sei
    130c:	67 9c       	mul	r6, r7
    130e:	f0 01       	movw	r30, r0
    1310:	f3 95       	inc	r31
    1312:	09 94       	ijmp

00001314 <I_96__SUB_c1_c2>:
    1314:	00 c0       	rjmp	.+0      	; 0x1316 <I_96__SUB_c1_c2+0x2>
    1316:	24 1b       	sub	r18, r20
    1318:	35 0b       	sbc	r19, r21
    131a:	5f b6       	in	r5, 0x3f	; 63
    131c:	01 96       	adiw	r24, 0x01	; 1
    131e:	f8 94       	cli
    1320:	2e bc       	out	0x2e, r2	; 46
    1322:	6e b4       	in	r6, 0x2e	; 46
    1324:	78 94       	sei
    1326:	67 9c       	mul	r6, r7
    1328:	f0 01       	movw	r30, r0
    132a:	f3 95       	inc	r31
    132c:	09 94       	ijmp

0000132e <I_97__SUB_c1_c3>:
    132e:	00 c0       	rjmp	.+0      	; 0x1330 <I_97__SUB_c1_c3+0x2>
    1330:	26 1b       	sub	r18, r22
    1332:	37 0b       	sbc	r19, r23
    1334:	5f b6       	in	r5, 0x3f	; 63
    1336:	01 96       	adiw	r24, 0x01	; 1
    1338:	f8 94       	cli
    133a:	2e bc       	out	0x2e, r2	; 46
    133c:	6e b4       	in	r6, 0x2e	; 46
    133e:	78 94       	sei
    1340:	67 9c       	mul	r6, r7
    1342:	f0 01       	movw	r30, r0
    1344:	f3 95       	inc	r31
    1346:	09 94       	ijmp

00001348 <I_98__SUB_c2_c0>:
    1348:	00 c0       	rjmp	.+0      	; 0x134a <I_98__SUB_c2_c0+0x2>
    134a:	40 1b       	sub	r20, r16
    134c:	51 0b       	sbc	r21, r17
    134e:	5f b6       	in	r5, 0x3f	; 63
    1350:	01 96       	adiw	r24, 0x01	; 1
    1352:	f8 94       	cli
    1354:	2e bc       	out	0x2e, r2	; 46
    1356:	6e b4       	in	r6, 0x2e	; 46
    1358:	78 94       	sei
    135a:	67 9c       	mul	r6, r7
    135c:	f0 01       	movw	r30, r0
    135e:	f3 95       	inc	r31
    1360:	09 94       	ijmp

00001362 <I_99__SUB_c2_c1>:
    1362:	00 c0       	rjmp	.+0      	; 0x1364 <I_99__SUB_c2_c1+0x2>
    1364:	42 1b       	sub	r20, r18
    1366:	53 0b       	sbc	r21, r19
    1368:	5f b6       	in	r5, 0x3f	; 63
    136a:	01 96       	adiw	r24, 0x01	; 1
    136c:	f8 94       	cli
    136e:	2e bc       	out	0x2e, r2	; 46
    1370:	6e b4       	in	r6, 0x2e	; 46
    1372:	78 94       	sei
    1374:	67 9c       	mul	r6, r7
    1376:	f0 01       	movw	r30, r0
    1378:	f3 95       	inc	r31
    137a:	09 94       	ijmp

0000137c <I_9A__SUB_c2_c2>:
    137c:	00 c0       	rjmp	.+0      	; 0x137e <I_9A__SUB_c2_c2+0x2>
    137e:	44 1b       	sub	r20, r20
    1380:	55 0b       	sbc	r21, r21
    1382:	5f b6       	in	r5, 0x3f	; 63
    1384:	01 96       	adiw	r24, 0x01	; 1
    1386:	f8 94       	cli
    1388:	2e bc       	out	0x2e, r2	; 46
    138a:	6e b4       	in	r6, 0x2e	; 46
    138c:	78 94       	sei
    138e:	67 9c       	mul	r6, r7
    1390:	f0 01       	movw	r30, r0
    1392:	f3 95       	inc	r31
    1394:	09 94       	ijmp

00001396 <I_9B__SUB_c2_c3>:
    1396:	00 c0       	rjmp	.+0      	; 0x1398 <I_9B__SUB_c2_c3+0x2>
    1398:	46 1b       	sub	r20, r22
    139a:	57 0b       	sbc	r21, r23
    139c:	5f b6       	in	r5, 0x3f	; 63
    139e:	01 96       	adiw	r24, 0x01	; 1
    13a0:	f8 94       	cli
    13a2:	2e bc       	out	0x2e, r2	; 46
    13a4:	6e b4       	in	r6, 0x2e	; 46
    13a6:	78 94       	sei
    13a8:	67 9c       	mul	r6, r7
    13aa:	f0 01       	movw	r30, r0
    13ac:	f3 95       	inc	r31
    13ae:	09 94       	ijmp

000013b0 <I_9C__SUB_c3_c0>:
    13b0:	00 c0       	rjmp	.+0      	; 0x13b2 <I_9C__SUB_c3_c0+0x2>
    13b2:	60 1b       	sub	r22, r16
    13b4:	71 0b       	sbc	r23, r17
    13b6:	5f b6       	in	r5, 0x3f	; 63
    13b8:	01 96       	adiw	r24, 0x01	; 1
    13ba:	f8 94       	cli
    13bc:	2e bc       	out	0x2e, r2	; 46
    13be:	6e b4       	in	r6, 0x2e	; 46
    13c0:	78 94       	sei
    13c2:	67 9c       	mul	r6, r7
    13c4:	f0 01       	movw	r30, r0
    13c6:	f3 95       	inc	r31
    13c8:	09 94       	ijmp

000013ca <I_9D__SUB_c3_c1>:
    13ca:	00 c0       	rjmp	.+0      	; 0x13cc <I_9D__SUB_c3_c1+0x2>
    13cc:	62 1b       	sub	r22, r18
    13ce:	73 0b       	sbc	r23, r19
    13d0:	5f b6       	in	r5, 0x3f	; 63
    13d2:	01 96       	adiw	r24, 0x01	; 1
    13d4:	f8 94       	cli
    13d6:	2e bc       	out	0x2e, r2	; 46
    13d8:	6e b4       	in	r6, 0x2e	; 46
    13da:	78 94       	sei
    13dc:	67 9c       	mul	r6, r7
    13de:	f0 01       	movw	r30, r0
    13e0:	f3 95       	inc	r31
    13e2:	09 94       	ijmp

000013e4 <I_9E__SUB_c3_c2>:
    13e4:	00 c0       	rjmp	.+0      	; 0x13e6 <I_9E__SUB_c3_c2+0x2>
    13e6:	64 1b       	sub	r22, r20
    13e8:	75 0b       	sbc	r23, r21
    13ea:	5f b6       	in	r5, 0x3f	; 63
    13ec:	01 96       	adiw	r24, 0x01	; 1
    13ee:	f8 94       	cli
    13f0:	2e bc       	out	0x2e, r2	; 46
    13f2:	6e b4       	in	r6, 0x2e	; 46
    13f4:	78 94       	sei
    13f6:	67 9c       	mul	r6, r7
    13f8:	f0 01       	movw	r30, r0
    13fa:	f3 95       	inc	r31
    13fc:	09 94       	ijmp

000013fe <I_9F__SUB_c3_c3>:
    13fe:	00 c0       	rjmp	.+0      	; 0x1400 <I_9F__SUB_c3_c3+0x2>
    1400:	66 1b       	sub	r22, r22
    1402:	77 0b       	sbc	r23, r23
    1404:	5f b6       	in	r5, 0x3f	; 63
    1406:	01 96       	adiw	r24, 0x01	; 1
    1408:	f8 94       	cli
    140a:	2e bc       	out	0x2e, r2	; 46
    140c:	6e b4       	in	r6, 0x2e	; 46
    140e:	78 94       	sei
    1410:	67 9c       	mul	r6, r7
    1412:	f0 01       	movw	r30, r0
    1414:	f3 95       	inc	r31
    1416:	09 94       	ijmp
