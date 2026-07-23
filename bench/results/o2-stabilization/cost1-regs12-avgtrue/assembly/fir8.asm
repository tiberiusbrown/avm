
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/fir8.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 fir8.c
00000100 l     O .data	00000060 samples
00000160 l     O .data	00000010 coefficients
00000170 l     O .data	00000002 fir_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000a2 avm_test_main
000002b8 g     F .text	00000002 avm_halt

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
 e1 a2 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fe                 adjsp	avm_test_main+4
 c4 00 01              ldi16	r4, 0x100
 c1 60                 ldi8	r5, 0x60
 c3 07                 ldi8	r7, 0x7
 f0 00 7f              ldi8	r0, 0x7f
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 ca c0                 addi.s8	r6, -0x40
 f6 06                 st8	[r4+], r6
 cb 13                 addi.s8	r7, 0x13
 f4 b5                 dec16	r5
 f4 a5                 tst8	r5
 d1 f1                 brne8	avm_test_main+16
 c4 29 32              ldi16	r4, 0x3229
 c5 3b 44              ldi16	r5, 0x443b
 c6 6c 01              ldi16	r6, 0x16c
 f0 6b 8c              st32	[r6], q2
 c4 05 0e              ldi16	r4, 0xe05
 c5 17 20              ldi16	r5, 0x2017
 c6 68 01              ldi16	r6, 0x168
 f0 6b 8c              st32	[r6], q2
 c4 e1 ea              ldi16	r4, 0xeae1
 c5 f3 fc              ldi16	r5, 0xfcf3
 c6 64 01              ldi16	r6, 0x164
 f0 6b 8c              st32	[r6], q2
 c4 bd c6              ldi16	r4, 0xc6bd
 c5 cf d8              ldi16	r5, 0xd8cf
 c6 60 01              ldi16	r6, 0x160
 f0 6b 8c              st32	[r6], q2
 f2 42                 sub	r2, r2
 d7 01                 sys	debug_break
 f1 26                 mov	r5, r2
 f4 41                 stsp16	[sp+0x0], r5
 f2 4b                 sub	r3, r3
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 f0 04 00 01           ldi16	r0, 0x100
 f2 04                 add	r0, r4
 c0 10                 ldi8	r4, 0x10
 f0 05 60 01           ldi16	r1, 0x160
 af                    xor	r7, r7
 f0 6c c3              ld8u	r6, [r1+]
 f0 6c a1              ld8u	r5, [r0+]
 f6 45                 sext8	r5
 f6 46                 sext8	r6
 f3 29                 muls8.w	r6, r5
 1e                    add	r7, r6
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 ed                 brne8	avm_test_main+106
 f2 17                 add	r2, r7
 f4 ab                 inc16	r3
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 d0                 brne8	avm_test_main+89
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 c1                 brne8	avm_test_main+85
 f0 5a 70 01           stm16	[0x170], r2
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 02                 adjsp	avm_test_main+159
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
