
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

00000100 <I_00__MOV_c0_c0>:
 100:	00 c0       	rjmp	.+0      	; 0x102 <I_00__MOV_c0_c0+0x2>
 102:	00 c0       	rjmp	.+0      	; 0x104 <I_00__MOV_c0_c0+0x4>
 104:	88 01       	movw	r16, r16
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

00000140 <I_00__MOV_c0_c1>:
 140:	00 c0       	rjmp	.+0      	; 0x142 <I_00__MOV_c0_c1+0x2>
 142:	00 c0       	rjmp	.+0      	; 0x144 <I_00__MOV_c0_c1+0x4>
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

00000180 <I_00__MOV_c0_c2>:
 180:	00 c0       	rjmp	.+0      	; 0x182 <I_00__MOV_c0_c2+0x2>
 182:	00 c0       	rjmp	.+0      	; 0x184 <I_00__MOV_c0_c2+0x4>
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

000001c0 <I_00__MOV_c0_c3>:
 1c0:	00 c0       	rjmp	.+0      	; 0x1c2 <I_00__MOV_c0_c3+0x2>
 1c2:	00 c0       	rjmp	.+0      	; 0x1c4 <I_00__MOV_c0_c3+0x4>
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

00000200 <I_00__MOV_c1_c0>:
 200:	00 c0       	rjmp	.+0      	; 0x202 <I_00__MOV_c1_c0+0x2>
 202:	00 c0       	rjmp	.+0      	; 0x204 <I_00__MOV_c1_c0+0x4>
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

00000240 <I_00__MOV_c1_c1>:
 240:	00 c0       	rjmp	.+0      	; 0x242 <I_00__MOV_c1_c1+0x2>
 242:	00 c0       	rjmp	.+0      	; 0x244 <I_00__MOV_c1_c1+0x4>
 244:	99 01       	movw	r18, r18
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

00000280 <I_00__MOV_c1_c2>:
 280:	00 c0       	rjmp	.+0      	; 0x282 <I_00__MOV_c1_c2+0x2>
 282:	00 c0       	rjmp	.+0      	; 0x284 <I_00__MOV_c1_c2+0x4>
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

000002c0 <I_00__MOV_c1_c3>:
 2c0:	00 c0       	rjmp	.+0      	; 0x2c2 <I_00__MOV_c1_c3+0x2>
 2c2:	00 c0       	rjmp	.+0      	; 0x2c4 <I_00__MOV_c1_c3+0x4>
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

00000300 <I_00__MOV_c2_c0>:
 300:	00 c0       	rjmp	.+0      	; 0x302 <I_00__MOV_c2_c0+0x2>
 302:	00 c0       	rjmp	.+0      	; 0x304 <I_00__MOV_c2_c0+0x4>
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

00000340 <I_00__MOV_c2_c1>:
 340:	00 c0       	rjmp	.+0      	; 0x342 <I_00__MOV_c2_c1+0x2>
 342:	00 c0       	rjmp	.+0      	; 0x344 <I_00__MOV_c2_c1+0x4>
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

00000380 <I_00__MOV_c2_c2>:
 380:	00 c0       	rjmp	.+0      	; 0x382 <I_00__MOV_c2_c2+0x2>
 382:	00 c0       	rjmp	.+0      	; 0x384 <I_00__MOV_c2_c2+0x4>
 384:	aa 01       	movw	r20, r20
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

000003c0 <I_00__MOV_c2_c3>:
 3c0:	00 c0       	rjmp	.+0      	; 0x3c2 <I_00__MOV_c2_c3+0x2>
 3c2:	00 c0       	rjmp	.+0      	; 0x3c4 <I_00__MOV_c2_c3+0x4>
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

00000400 <I_00__MOV_c3_c0>:
 400:	00 c0       	rjmp	.+0      	; 0x402 <I_00__MOV_c3_c0+0x2>
 402:	00 c0       	rjmp	.+0      	; 0x404 <I_00__MOV_c3_c0+0x4>
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

00000440 <I_00__MOV_c3_c1>:
 440:	00 c0       	rjmp	.+0      	; 0x442 <I_00__MOV_c3_c1+0x2>
 442:	00 c0       	rjmp	.+0      	; 0x444 <I_00__MOV_c3_c1+0x4>
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

00000480 <I_00__MOV_c3_c2>:
 480:	00 c0       	rjmp	.+0      	; 0x482 <I_00__MOV_c3_c2+0x2>
 482:	00 c0       	rjmp	.+0      	; 0x484 <I_00__MOV_c3_c2+0x4>
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

000004c0 <I_00__MOV_c3_c3>:
 4c0:	00 c0       	rjmp	.+0      	; 0x4c2 <I_00__MOV_c3_c3+0x2>
 4c2:	00 c0       	rjmp	.+0      	; 0x4c4 <I_00__MOV_c3_c3+0x4>
 4c4:	bb 01       	movw	r22, r22
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
