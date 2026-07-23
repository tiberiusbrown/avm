
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/string_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_scan.c
00000100 l     O .data	00000100 strings
00000200 l     O .data	00000080 data
00000280 l     O .data	00000002 string_scan_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	00000270 avm_test_main
00000586 g     F .text	00000002 avm_halt

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
 e1 70 02              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	_start+16
 f0 05 00 01           ldi16	r1, 0x100
 f0 00 61              ldi8	r0, 0x61
 af                    xor	r7, r7
 c0 03                 ldi8	r4, 0x3
 f4 48                 stsp16	[sp+0x2], r4
 c0 1f                 ldi8	r4, 0x1f
 f4 40                 stsp16	[sp+0x0], r4
 07                    mov	r5, r7
 f1 17                 mov	r2, r7
 f1 1a                 mov	r3, r2
 f4 08                 ldsp16	r4, [sp+0x2]
 fe 1c                 mul16	r3, r4
 fa 45                 lsl16i	r5, 0x5
 c4 00 01              ldi16	r4, 0x100
 11                    add	r4, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 5b                 stsp16	[sp+0x6], r7
 f0 38 08              stsp16	[sp+0x8], r0
 f4 01                 ldsp16	r5, [sp+0x0]
 f0 39 0a              stsp16	[sp+0xa], r1
 c2 4f                 ldi8	r6, 0x4f
 03                    mov	r4, r7
 f3 12                 mulu8.w	r4, r6
 fa 7b                 lsr16i	r4, 0xb
 c2 1a                 ldi8	r6, 0x1a
 f3 12                 mulu8.w	r4, r6
 0b                    mov	r6, r7
 28                    sub	r6, r4
 2b                    sub	r6, r7
 f2 28                 add	r6, r0
 f0 6d c3              st8	[r1+], r6
 f4 af                 inc16	r7
 f4 a8                 inc16	r0
 f4 b5                 dec16	r5
 f4 a5                 tst8	r5
 d1 e3                 brne8	avm_test_main+49
 f1 73                 zext8	r3
 f4 11                 ldsp16	r5, [sp+0x4]
 f2 1d                 add	r3, r5
 a0                    xor	r4, r4
 ee 86 28              st8	[r3+8], r4
 ee 8a 3f              st8	[r5+31], r4
 f4 1b                 ldsp16	r7, [sp+0x6]
 cb 03                 addi.s8	r7, 0x3
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 08 03              addi.s8	r0, 0x3
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 09 20              addi.s8	r1, 0x20
 f4 aa                 inc16	r2
 f1 26                 mov	r5, r2
 f1 75                 zext8	r5
 cd 08                 cmpi.s8	r5, 0x8
 d1 a4                 brne8	avm_test_main+25
 c5 00 02              ldi16	r5, 0x200
 c2 80                 ldi8	r6, 0x80
 c3 07                 ldi8	r7, 0x7
 f6 0f                 st8	[r5+], r7
 cb 0b                 addi.s8	r7, 0xb
 f4 b6                 dec16	r6
 f4 a6                 tst8	r6
 d1 f6                 brne8	avm_test_main+124
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 d4 0c                 jmp8	avm_test_main+151
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 40                 cmpi.s8	r6, 0x40
 da cb 01              breq16	avm_test_main+610
 c7 00 01              ldi16	r7, 0x100
 f4 b5                 dec16	r5
 09                    mov	r6, r5
 f7 18                 ld8u	r0, [r7+]
 f4 ad                 inc16	r5
 f4 a0                 tst8	r0
 d1 f7                 brne8	avm_test_main+156
 c7 20 01              ldi16	r7, 0x120
 06                    mov	r5, r6
 f7 18                 ld8u	r0, [r7+]
 f4 ae                 inc16	r6
 f4 a0                 tst8	r0
 d1 f7                 brne8	avm_test_main+168
 c7 40 01              ldi16	r7, 0x140
 09                    mov	r6, r5
 f7 18                 ld8u	r0, [r7+]
 f4 ad                 inc16	r5
 f4 a0                 tst8	r0
 d1 f7                 brne8	avm_test_main+180
 c7 60 01              ldi16	r7, 0x160
 06                    mov	r5, r6
 f7 18                 ld8u	r0, [r7+]
 f4 ae                 inc16	r6
 f4 a0                 tst8	r0
 d1 f7                 brne8	avm_test_main+192
 c7 80 01              ldi16	r7, 0x180
 09                    mov	r6, r5
 f7 18                 ld8u	r0, [r7+]
 f4 ad                 inc16	r5
 f4 a0                 tst8	r0
 d1 f7                 brne8	avm_test_main+204
 c7 a0 01              ldi16	r7, 0x1a0
 06                    mov	r5, r6
 f7 18                 ld8u	r0, [r7+]
 f4 ae                 inc16	r6
 f4 a0                 tst8	r0
 d1 f7                 brne8	avm_test_main+216
 c7 c0 01              ldi16	r7, 0x1c0
 09                    mov	r6, r5
 f7 18                 ld8u	r0, [r7+]
 f4 ad                 inc16	r5
 f4 a0                 tst8	r0
 d1 f7                 brne8	avm_test_main+228
 c5 e0 01              ldi16	r5, 0x1e0
 f7 0f                 ld8u	r7, [r5+]
 f4 ae                 inc16	r6
 f4 a7                 tst8	r7
 d1 f8                 brne8	avm_test_main+240
 c7 00 02              ldi16	r7, 0x200
 c1 80                 ldi8	r5, 0x80
 f5 3c                 ld8u	r0, [r7]
 f4 a0                 tst8	r0
 d0 09                 breq8	avm_test_main+268
 f4 af                 inc16	r7
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 f2                 brne8	avm_test_main+253
 af                    xor	r7, r7
 f0 05 00 02           ldi16	r1, 0x200
 07                    mov	r5, r7
 f2 55                 sub	r5, r1
 f2 30                 sub	r0, r0
 f6 2f                 tst16	r7
 fb 28                 cmov.eq	r5, r0
 c3 80                 ldi8	r7, 0x80
 ed 42 20              ld8u	r2, [r1+0]
 f0 0e 21              cmpi.s8	r2, 0x21
 d0 0a                 breq8	avm_test_main+301
 f4 a9                 inc16	r1
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f0                 brne8	avm_test_main+283
 f1 08                 mov	r1, r0
 c7 00 02              ldi16	r7, 0x200
 f1 11                 mov	r2, r1
 f2 47                 sub	r2, r7
 f6 29                 tst16	r1
 fb 10                 cmov.eq	r2, r0
 f9 aa                 xor	r5, r2
 f0 00 80              ldi8	r0, 0x80
 f5 3d                 ld8u	r1, [r7]
 f0 0d 42              cmpi.s8	r1, 0x42
 d0 09                 breq8	avm_test_main+333
 f4 af                 inc16	r7
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 f1                 brne8	avm_test_main+317
 af                    xor	r7, r7
 f0 05 00 02           ldi16	r1, 0x200
 f1 17                 mov	r2, r7
 f2 41                 sub	r2, r1
 f2 30                 sub	r0, r0
 f6 2f                 tst16	r7
 fb 10                 cmov.eq	r2, r0
 f9 aa                 xor	r5, r2
 c3 80                 ldi8	r7, 0x80
 ed 42 20              ld8u	r2, [r1+0]
 f0 0e 63              cmpi.s8	r2, 0x63
 d0 0a                 breq8	avm_test_main+369
 f4 a9                 inc16	r1
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 f0                 brne8	avm_test_main+351
 f1 08                 mov	r1, r0
 c7 00 02              ldi16	r7, 0x200
 f1 11                 mov	r2, r1
 f2 47                 sub	r2, r7
 f6 29                 tst16	r1
 fb 10                 cmov.eq	r2, r0
 f9 aa                 xor	r5, r2
 f0 00 80              ldi8	r0, 0x80
 f5 3d                 ld8u	r1, [r7]
 f0 02 84              ldi8	r2, 0x84
 f5 0a                 cmp	r1, r2
 d0 09                 breq8	avm_test_main+403
 f4 af                 inc16	r7
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 ef                 brne8	avm_test_main+385
 af                    xor	r7, r7
 f0 06 00 02           ldi16	r2, 0x200
 f1 07                 mov	r0, r7
 f2 32                 sub	r0, r2
 f2 39                 sub	r1, r1
 f6 2f                 tst16	r7
 fb 01                 cmov.eq	r0, r1
 f9 a2                 xor	r5, r0
 c3 80                 ldi8	r7, 0x80
 ed 04 20              ld8u	r0, [r2+0]
 f0 03 a5              ldi8	r3, 0xa5
 f5 03                 cmp	r0, r3
 d0 0a                 breq8	avm_test_main+441
 f4 aa                 inc16	r2
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 ee                 brne8	avm_test_main+421
 f1 11                 mov	r2, r1
 f0 04 00 02           ldi16	r0, 0x200
 f1 2e                 mov	r7, r2
 f2 5c                 sub	r7, r0
 f6 2a                 tst16	r2
 fb 39                 cmov.eq	r7, r1
 a7                    xor	r5, r7
 c3 80                 ldi8	r7, 0x80
 f4 68                 stsp16	[sp+0xa], r4
 ed 20 20              ld8u	r1, [r0+0]
 f0 02 c6              ldi8	r2, 0xc6
 f5 0a                 cmp	r1, r2
 d0 0a                 breq8	avm_test_main+478
 f4 a8                 inc16	r0
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 ee                 brne8	avm_test_main+458
 f2 30                 sub	r0, r0
 f0 05 00 02           ldi16	r1, 0x200
 f1 10                 mov	r2, r0
 f2 41                 sub	r2, r1
 a0                    xor	r4, r4
 f6 28                 tst16	r0
 fb 14                 cmov.eq	r2, r4
 f9 aa                 xor	r5, r2
 f0 00 80              ldi8	r0, 0x80
 ed 42 20              ld8u	r2, [r1+0]
 f0 03 e7              ldi8	r3, 0xe7
 f5 13                 cmp	r2, r3
 d0 0a                 breq8	avm_test_main+516
 f4 a9                 inc16	r1
 f4 b0                 dec16	r0
 f6 28                 tst16	r0
 d1 ee                 brne8	avm_test_main+496
 f1 0c                 mov	r1, r4
 f0 04 00 02           ldi16	r0, 0x200
 f1 11                 mov	r2, r1
 f2 40                 sub	r2, r0
 f6 29                 tst16	r1
 fb 14                 cmov.eq	r2, r4
 f9 aa                 xor	r5, r2
 a6                    xor	r5, r6
 0c                    mov	r7, r4
 d4 14                 jmp8	avm_test_main+554
 f1 02                 mov	r0, r2
 f1 0c                 mov	r1, r4
 f2 25                 add	r5, r1
 ed c0 20              ld8u	r6, [r0+0]
 26                    sub	r5, r6
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 ce 07                 cmpi.s8	r6, 0x7
 da 61 fe              breq16	avm_test_main+139
 0b                    mov	r6, r7
 fa 55                 lsl16i	r6, 0x5
 f0 05 e0 1f           ldi16	r1, 0x1fe0
 f9 38                 and	r1, r6
 f0 04 20 01           ldi16	r0, 0x120
 f2 01                 add	r0, r1
 c6 00 01              ldi16	r6, 0x100
 f2 29                 add	r6, r1
 f5 39                 ld8u	r1, [r6]
 f4 a1                 tst8	r1
 d0 d4                 breq8	avm_test_main+536
 ed c0 20              ld8u	r6, [r0+0]
 f1 11                 mov	r2, r1
 f1 72                 zext8	r2
 f5 16                 cmp	r2, r6
 d1 0f                 brne8	avm_test_main+606
 f1 10                 mov	r2, r0
 f4 aa                 inc16	r2
 ed 20 01              ld8u	r1, [r0-31]
 f4 a1                 tst8	r1
 f1 02                 mov	r0, r2
 d1 e8                 brne8	avm_test_main+580
 d4 b8                 jmp8	avm_test_main+534
 f1 71                 zext8	r1
 d4 b8                 jmp8	avm_test_main+538
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
