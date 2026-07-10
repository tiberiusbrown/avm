
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

00000088 <.L1^B1>:
  88:	ff cf       	rjmp	.-2      	; 0x88 <.L1^B1>

0000008a <__ctors_end>:
	...

00000100 <abvm_interp>:
 100:	6e b4       	in	r6, 0x2e	; 46
 102:	2e bc       	out	0x2e, r2	; 46
 104:	01 96       	adiw	r24, 0x01	; 1
 106:	67 9c       	mul	r6, r7
 108:	f0 01       	movw	r30, r0
 10a:	e3 95       	inc	r30
 10c:	09 94       	ijmp
	...
