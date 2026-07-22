
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/string_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 string_scan.c
00000100 l     O .data	00000100 strings
00000200 l     O .data	00000080 data
00000280 l     O .data	00000002 string_scan_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	00000131 avm_test_main
00000447 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 31 01              call16	avm_halt

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
 02                    mov	r4, r6
 21                    sub	r4, r5
 f0 6d 83              st8	[r1+], r4
 f4 af                 inc16	r7
 f4 ae                 inc16	r6
 f4 b3                 dec16	r3
 f6 2b                 tst16	r3
 d1 e6                 brne8	avm_test_main+51
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
 d1 ab                 brne8	avm_test_main+24
 c4 00 02              ldi16	r4, 0x200
 c1 07                 ldi8	r5, 0x7
 c2 80                 ldi8	r6, 0x80
 f6 05                 st8	[r4+], r5
 c9 0b                 addi.s8	r5, 0xb
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+116
 d7 01                 sys	debug_break
 f1 1f                 mov	r3, r7
 07                    mov	r5, r7
 0b                    mov	r6, r7
 02                    mov	r4, r6
 fa 35                 lsl16i	r4, 0x5
 c7 00 01              ldi16	r7, 0x100
 1c                    add	r7, r4
 f4 b5                 dec16	r5
 f7 1c                 ld8u	r4, [r7+]
 f4 ad                 inc16	r5
 f4 a4                 tst8	r4
 d1 f8                 brne8	avm_test_main+141
 f4 ae                 inc16	r6
 ce 08                 cmpi.s8	r6, 0x8
 d1 e9                 brne8	avm_test_main+132
 af                    xor	r7, r7
 c0 21                 ldi8	r4, 0x21
 f1 07                 mov	r0, r7
 fe 04                 mul16	r0, r4
 c4 00 02              ldi16	r4, 0x200
 f0 01 80              ldi8	r1, 0x80
 f1 28                 mov	r6, r0
 f1 76                 zext8	r6
 f5 32                 ld8u	r2, [r4]
 f5 16                 cmp	r2, r6
 d0 09                 breq8	avm_test_main+187
 f4 ac                 inc16	r4
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 ee                 brne8	avm_test_main+168
 a0                    xor	r4, r4
 c6 00 02              ldi16	r6, 0x200
 f1 0c                 mov	r1, r4
 f2 3e                 sub	r1, r6
 f2 30                 sub	r0, r0
 f6 2c                 tst16	r4
 fb 08                 cmov.eq	r1, r0
 f9 a6                 xor	r5, r1
 f4 af                 inc16	r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 d1 c9                 brne8	avm_test_main+156
 f1 2c                 mov	r7, r0
 03                    mov	r4, r7
 fa 35                 lsl16i	r4, 0x5
 f0 06 20 01           ldi16	r2, 0x120
 f2 14                 add	r2, r4
 c6 00 01              ldi16	r6, 0x100
 18                    add	r6, r4
 42                    ld8u	r4, [r6]
 f4 a4                 tst8	r4
 d0 1b                 breq8	avm_test_main+258
 ed c4 20              ld8u	r6, [r2+0]
 f1 0c                 mov	r1, r4
 f1 71                 zext8	r1
 f5 0e                 cmp	r1, r6
 d1 16                 brne8	avm_test_main+264
 f1 0a                 mov	r1, r2
 f4 a9                 inc16	r1
 ed 84 01              ld8u	r4, [r2-31]
 f4 a4                 tst8	r4
 f1 11                 mov	r2, r1
 d1 e8                 brne8	avm_test_main+231
 a0                    xor	r4, r4
 d4 08                 jmp8	avm_test_main+266
 f1 0a                 mov	r1, r2
 f1 20                 mov	r4, r0
 d4 04                 jmp8	avm_test_main+268
 f1 0a                 mov	r1, r2
 f1 74                 zext8	r4
 14                    add	r5, r4
 ed 82 20              ld8u	r4, [r1+0]
 24                    sub	r5, r4
 f4 af                 inc16	r7
 cf 07                 cmpi.s8	r7, 0x7
 d1 be                 brne8	avm_test_main+213
 f4 ab                 inc16	r3
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 af                    xor	r7, r7
 db 60 ff              brne16	avm_test_main+131
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
