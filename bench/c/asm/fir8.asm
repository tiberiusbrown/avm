
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/fir8.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 fir8.c
00000100 l     O .data	00000060 samples
00000160 l     O .data	00000010 coefficients
00000170 l     O .data	00000002 fir_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	0000007d avm_test_main
00000292 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 7d                 call8	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+4
 c4 00 01              ldi16	r4, 0x100
 c1 07                 ldi8	r5, 0x7
 c2 60                 ldi8	r6, 0x60
 c3 7f                 ldi8	r7, 0x7f
 f1 05                 mov	r0, r5
 f9 1c                 and	r0, r7
 f0 08 c0              addi.s8	r0, -0x40
 f6 00                 st8	[r4+], r0
 c9 13                 addi.s8	r5, 0x13
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 ef                 brne8	avm_test_main+15
 c0 bd                 ldi8	r4, 0xbd
 c5 60 01              ldi16	r5, 0x160
 c2 10                 ldi8	r6, 0x10
 f6 0c                 st8	[r5+], r4
 c8 09                 addi.s8	r4, 0x9
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	avm_test_main+39
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 01                    mov	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 af                    xor	r7, r7
 f0 04 00 01           ldi16	r0, 0x100
 f2 07                 add	r0, r7
 f0 01 10              ldi8	r1, 0x10
 f0 06 60 01           ldi16	r2, 0x160
 f0 03 00              ldi8	r3, 0x0
 f0 6c c5              ld8u	r6, [r2+]
 f0 6c 81              ld8u	r4, [r0+]
 f6 44                 sext8	r4
 f6 46                 sext8	r6
 f3 28                 muls8.w	r6, r4
 f2 1e                 add	r3, r6
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 ec                 brne8	avm_test_main+72
 f2 27                 add	r5, r3
 f4 af                 inc16	r7
 cf 40                 cmpi.s8	r7, 0x40
 d1 d4                 brne8	avm_test_main+56
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 ac                 inc16	r4
 08                    mov	r6, r4
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 d1 c6                 brne8	avm_test_main+53
 f0 5d 70 01           stm16	[0x170], r5
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	avm_test_main+122
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
