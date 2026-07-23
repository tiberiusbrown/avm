
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/string_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_scan.c
00000100 l     O .data	00000100 strings
00000200 l     O .data	00000080 data
00000280 l     O .data	00000002 string_scan_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	00000255 avm_test_main
0000056b g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 55 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	_start+16
 f0 05 00 01           ldi16	r1, 0x100
 c2 61                 ldi8	r6, 0x61
 f2 42                 sub	r2, r2
 c0 03                 ldi8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 c0 1f                 ldi8	r4, 0x1f
 f4 40                 stsp16	[sp+0x0], r4
 f1 26                 mov	r5, r2
 0d                    mov	r7, r5
 f4 08                 ldsp16	r4, [sp+0x2]
 fe 3c                 mul16	r7, r4
 f4 53                 stsp16	[sp+0x4], r7
 f4 59                 stsp16	[sp+0x6], r5
 fa 45                 lsl16i	r5, 0x5
 f0 04 00 01           ldi16	r0, 0x100
 f2 05                 add	r0, r5
 f0 33 00              ldsp16	r3, [sp+0x0]
 f1 2e                 mov	r7, r2
 f4 62                 stsp16	[sp+0x8], r6
 f0 39 0a              stsp16	[sp+0xa], r1
 c0 4f                 ldi8	r4, 0x4f
 07                    mov	r5, r7
 f3 14                 mulu8.w	r5, r4
 fa 8b                 lsr16i	r5, 0xb
 c0 1a                 ldi8	r4, 0x1a
 f3 14                 mulu8.w	r5, r4
 03                    mov	r4, r7
 21                    sub	r4, r5
 23                    sub	r4, r7
 12                    add	r4, r6
 f0 6d 83              st8	[r1+], r4
 f4 af                 inc16	r7
 f4 ae                 inc16	r6
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 e4                 brne8	avm_test_main+51
 f4 10                 ldsp16	r4, [sp+0x4]
 f2 20                 add	r4, r0
 af                    xor	r7, r7
 ee e8 28              st8	[r4+8], r7
 ee e0 3f              st8	[r0+31], r7
 f0 0a 03              addi.s8	r2, 0x3
 f4 22                 ldsp16	r6, [sp+0x8]
 ca 03                 addi.s8	r6, 0x3
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 09 20              addi.s8	r1, 0x20
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 ad                 inc16	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 a9                 brne8	avm_test_main+24
 c4 00 02              ldi16	r4, 0x200
 c1 07                 ldi8	r5, 0x7
 c2 80                 ldi8	r6, 0x80
 f6 05                 st8	[r4+], r5
 c9 0b                 addi.s8	r5, 0xb
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+118
 d7 01                 sys	debug_break
 07                    mov	r5, r7
 f2 4b                 sub	r3, r3
 d4 0c                 jmp8	avm_test_main+147
 f4 2b                 ldsp16	r7, [sp+0xa]
 f4 af                 inc16	r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 da b4 01              breq16	avm_test_main+583
 f4 6b                 stsp16	[sp+0xa], r7
 c6 00 01              ldi16	r6, 0x100
 f4 b5                 dec16	r5
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+154
 c6 20 01              ldi16	r6, 0x120
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+166
 c6 40 01              ldi16	r6, 0x140
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+178
 c6 60 01              ldi16	r6, 0x160
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+190
 c6 80 01              ldi16	r6, 0x180
 01                    mov	r4, r5
 f7 17                 ld8u	r7, [r6+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+202
 c6 a0 01              ldi16	r6, 0x1a0
 04                    mov	r5, r4
 f7 17                 ld8u	r7, [r6+]
 f4 ac                 inc16	r4
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+214
 c4 c0 01              ldi16	r4, 0x1c0
 09                    mov	r6, r5
 f7 07                 ld8u	r7, [r4+]
 f4 ad                 inc16	r5
 f4 a7                 tst8	r7
 d1 f7                 brne8	avm_test_main+226
 c4 e0 01              ldi16	r4, 0x1e0
 f7 05                 ld8u	r5, [r4+]
 f4 ae                 inc16	r6
 f4 a5                 tst8	r5
 d1 f8                 brne8	avm_test_main+238
 c4 00 02              ldi16	r4, 0x200
 c1 80                 ldi8	r5, 0x80
 4c                    ld8u	r7, [r4]
 f4 a7                 tst8	r7
 d0 09                 breq8	avm_test_main+265
 f4 ac                 inc16	r4
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f3                 brne8	avm_test_main+251
 a0                    xor	r4, r4
 f0 04 00 02           ldi16	r0, 0x200
 04                    mov	r5, r4
 f2 54                 sub	r5, r0
 af                    xor	r7, r7
 f6 2c                 tst16	r4
 fb 2f                 cmov.eq	r5, r7
 c0 80                 ldi8	r4, 0x80
 ed 20 20              ld8u	r1, [r0+0]
 f0 0d 21              cmpi.s8	r1, 0x21
 d0 0a                 breq8	avm_test_main+297
 f4 a8                 inc16	r0
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f0                 brne8	avm_test_main+279
 f1 07                 mov	r0, r7
 c4 00 02              ldi16	r4, 0x200
 f1 08                 mov	r1, r0
 f2 3c                 sub	r1, r4
 f6 28                 tst16	r0
 fb 0f                 cmov.eq	r1, r7
 f9 a6                 xor	r5, r1
 c3 80                 ldi8	r7, 0x80
 f5 30                 ld8u	r0, [r4]
 f0 0c 42              cmpi.s8	r0, 0x42
 d0 09                 breq8	avm_test_main+328
 f4 ac                 inc16	r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f1                 brne8	avm_test_main+312
 a0                    xor	r4, r4
 f0 04 00 02           ldi16	r0, 0x200
 f1 0c                 mov	r1, r4
 f2 38                 sub	r1, r0
 af                    xor	r7, r7
 f6 2c                 tst16	r4
 fb 0f                 cmov.eq	r1, r7
 f9 a6                 xor	r5, r1
 c0 80                 ldi8	r4, 0x80
 ed 20 20              ld8u	r1, [r0+0]
 f0 0d 63              cmpi.s8	r1, 0x63
 d0 0a                 breq8	avm_test_main+363
 f4 a8                 inc16	r0
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 f0                 brne8	avm_test_main+345
 f1 07                 mov	r0, r7
 c4 00 02              ldi16	r4, 0x200
 f1 08                 mov	r1, r0
 f2 3c                 sub	r1, r4
 f6 28                 tst16	r0
 fb 0f                 cmov.eq	r1, r7
 f9 a6                 xor	r5, r1
 c3 80                 ldi8	r7, 0x80
 f5 30                 ld8u	r0, [r4]
 f0 01 84              ldi8	r1, 0x84
 f5 01                 cmp	r0, r1
 d0 09                 breq8	avm_test_main+396
 f4 ac                 inc16	r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 ef                 brne8	avm_test_main+378
 a0                    xor	r4, r4
 f0 04 00 02           ldi16	r0, 0x200
 f1 0c                 mov	r1, r4
 f2 38                 sub	r1, r0
 af                    xor	r7, r7
 f6 2c                 tst16	r4
 fb 0f                 cmov.eq	r1, r7
 f9 a6                 xor	r5, r1
 c0 80                 ldi8	r4, 0x80
 ed 20 20              ld8u	r1, [r0+0]
 f0 02 a5              ldi8	r2, 0xa5
 f5 0a                 cmp	r1, r2
 d0 0a                 breq8	avm_test_main+433
 f4 a8                 inc16	r0
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 ee                 brne8	avm_test_main+413
 f1 07                 mov	r0, r7
 c4 00 02              ldi16	r4, 0x200
 f1 08                 mov	r1, r0
 f2 3c                 sub	r1, r4
 f6 28                 tst16	r0
 fb 0f                 cmov.eq	r1, r7
 f9 a6                 xor	r5, r1
 c3 80                 ldi8	r7, 0x80
 f5 30                 ld8u	r0, [r4]
 f0 01 c6              ldi8	r1, 0xc6
 f5 01                 cmp	r0, r1
 d0 09                 breq8	avm_test_main+466
 f4 ac                 inc16	r4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 ef                 brne8	avm_test_main+448
 a0                    xor	r4, r4
 f0 04 00 02           ldi16	r0, 0x200
 f1 0c                 mov	r1, r4
 f2 38                 sub	r1, r0
 f6 2c                 tst16	r4
 fb 0b                 cmov.eq	r1, r3
 f9 a6                 xor	r5, r1
 c0 80                 ldi8	r4, 0x80
 ed 20 20              ld8u	r1, [r0+0]
 f0 02 e7              ldi8	r2, 0xe7
 f5 0a                 cmp	r1, r2
 d0 0a                 breq8	avm_test_main+502
 f4 a8                 inc16	r0
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 ee                 brne8	avm_test_main+482
 f1 03                 mov	r0, r3
 c4 00 02              ldi16	r4, 0x200
 f1 08                 mov	r1, r0
 f2 3c                 sub	r1, r4
 f6 28                 tst16	r0
 fb 0b                 cmov.eq	r1, r3
 f9 a6                 xor	r5, r1
 a6                    xor	r5, r6
 f1 2f                 mov	r7, r3
 d4 0f                 jmp8	avm_test_main+535
 f1 21                 mov	r4, r1
 f1 03                 mov	r0, r3
 f2 24                 add	r5, r0
 40                    ld8u	r4, [r4]
 24                    sub	r5, r4
 f4 af                 inc16	r7
 cf 07                 cmpi.s8	r7, 0x7
 da 70 fe              breq16	avm_test_main+135
 0b                    mov	r6, r7
 fa 55                 lsl16i	r6, 0x5
 c4 20 01              ldi16	r4, 0x120
 12                    add	r4, r6
 f0 04 00 01           ldi16	r0, 0x100
 f2 06                 add	r0, r6
 ed 00 20              ld8u	r0, [r0+0]
 f4 a0                 tst8	r0
 d0 df                 breq8	avm_test_main+522
 48                    ld8u	r6, [r4]
 f1 08                 mov	r1, r0
 f1 71                 zext8	r1
 f5 0e                 cmp	r1, r6
 d1 0f                 brne8	avm_test_main+579
 f1 0c                 mov	r1, r4
 f4 a9                 inc16	r1
 ed 08 01              ld8u	r0, [r4-31]
 f4 a0                 tst8	r0
 f1 21                 mov	r4, r1
 d1 ea                 brne8	avm_test_main+555
 d4 c5                 jmp8	avm_test_main+520
 f1 70                 zext8	r0
 d4 c5                 jmp8	avm_test_main+524
 f0 5d 80 02           stm16	[0x280], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	avm_halt+7
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
