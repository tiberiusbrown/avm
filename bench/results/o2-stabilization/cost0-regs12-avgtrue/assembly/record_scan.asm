
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/record_scan.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 record_scan.c
00000100 l     O .data	00000120 records
00000220 l     O .data	00000002 record_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	000000d2 avm_test_main
000003e8 g     F .text	00000002 avm_halt

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
 e1 d2 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 af                    xor	r7, r7
 f0 07 02 01           ldi16	r3, 0x102
 f0 01 03              ldi8	r1, 0x3
 f0 06 e8 03           ldi16	r2, 0x3e8
 c0 75                 ldi8	r4, 0x75
 f4 48                 stsp16	[sp+0x2], r4
 f0 00 fe              ldi8	r0, 0xfe
 c0 0b                 ldi8	r4, 0xb
 f4 40                 stsp16	[sp+0x0], r4
 0b                    mov	r6, r7
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 03                    mov	r4, r7
 22                    sub	r4, r6
 f9 80                 and	r4, r0
 f4 8c                 lsr16.1	r4
 12                    add	r4, r6
 fa 73                 lsr16i	r4, 0x3
 f4 01                 ldsp16	r5, [sp+0x0]
 f3 11                 mulu8.w	r4, r5
 c1 4f                 ldi8	r5, 0x4f
 0b                    mov	r6, r7
 f3 19                 mulu8.w	r6, r5
 fa 9a                 lsr16i	r6, 0xa
 c1 0d                 ldi8	r5, 0xd
 f3 19                 mulu8.w	r6, r5
 c1 5a                 ldi8	r5, 0x5a
 a7                    xor	r5, r7
 ee a6 20              st8	[r3+0], r5
 07                    mov	r5, r7
 26                    sub	r5, r6
 c9 fa                 addi.s8	r5, -0x6
 ee a6 1e              st8	[r3-2], r5
 07                    mov	r5, r7
 24                    sub	r5, r4
 c9 fb                 addi.s8	r5, -0x5
 ee a6 1f              st8	[r3-1], r5
 ee 56 22              st16	[r3+2], r2
 f0 0a 1d              addi.s8	r2, 0x1d
 ee 26 21              st8	[r3+1], r1
 f0 09 07              addi.s8	r1, 0x7
 f0 0b 06              addi.s8	r3, 0x6
 f4 af                 inc16	r7
 03                    mov	r4, r7
 f1 74                 zext8	r4
 cc 30                 cmpi.s8	r4, 0x30
 d1 b5                 brne8	avm_test_main+29
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f1 2c                 mov	r7, r0
 f1 20                 mov	r4, r0
 f1 28                 mov	r6, r0
 d4 0d                 jmp8	avm_test_main+129
 f0 30 00              ldsp16	r0, [sp+0x0]
 f4 a8                 inc16	r0
 f1 24                 mov	r5, r0
 f1 75                 zext8	r5
 cd 20                 cmpi.s8	r5, 0x20
 d0 41                 breq8	avm_test_main+194
 f0 38 00              stsp16	[sp+0x0], r0
 f0 04 00 01           ldi16	r0, 0x100
 f0 01 30              ldi8	r1, 0x30
 d4 1d                 jmp8	avm_test_main+170
 07                    mov	r5, r7
 f6 43                 sext8	r3
 f4 08                 ldsp16	r4, [sp+0x2]
 f2 23                 add	r4, r3
 f6 42                 sext8	r2
 f2 2a                 add	r6, r2
 ed f0 24              ld16	r7, [r0+4]
 f4 b7                 dec16	r7
 ee f0 24              st16	[r0+4], r7
 ad                    xor	r7, r5
 f0 08 06              addi.s8	r0, 0x6
 f4 b1                 dec16	r1
 f4 a1                 tst8	r1
 d0 ca                 breq8	avm_test_main+116
 f4 48                 stsp16	[sp+0x2], r4
 ed 60 21              ld8u	r3, [r0+1]
 ed 40 20              ld8u	r2, [r0+0]
 ed a0 22              ld8u	r5, [r0+2]
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
 f4 a4                 tst8	r4
 d0 d1                 breq8	avm_test_main+141
 ed 80 23              ld8u	r4, [r0+3]
 1c                    add	r7, r4
 d4 cb                 jmp8	avm_test_main+141
 a2                    xor	r4, r6
 a3                    xor	r4, r7
 f0 5c 20 02           stm16	[0x220], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+209
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
