
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/multiply.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 multiply.c
00000180 l     O .data	00000080 words
00000140 l     O .data	00000040 unsigned_bytes
00000100 l     O .data	00000040 signed_bytes
00000200 l     O .data	00000002 multiply_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	000000f2 avm_test_main
00000408 g     F .text	00000002 avm_halt

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
 e1 f2 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	_start+18
 af                    xor	r7, r7
 c4 80 01              ldi16	r4, 0x180
 c5 40 01              ldi16	r5, 0x140
 c6 00 01              ldi16	r6, 0x100
 f0 04 01 01           ldi16	r0, 0x101
 f0 01 40              ldi8	r1, 0x40
 f0 02 f1              ldi8	r2, 0xf1
 f0 03 01              ldi8	r3, 0x1
 f4 52                 stsp16	[sp+0x4], r6
 f4 59                 stsp16	[sp+0x6], r5
 f4 60                 stsp16	[sp+0x8], r4
 c1 09                 ldi8	r5, 0x9
 03                    mov	r4, r7
 f3 11                 mulu8.w	r4, r5
 fa 78                 lsr16i	r4, 0x8
 0b                    mov	r6, r7
 28                    sub	r6, r4
 c1 fe                 ldi8	r5, 0xfe
 86                    and	r5, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 8d                 lsr16.1	r5
 14                    add	r5, r4
 fa 84                 lsr16i	r5, 0x4
 c0 1f                 ldi8	r4, 0x1f
 f3 14                 mulu8.w	r5, r4
 03                    mov	r4, r7
 21                    sub	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 23                    sub	r4, r7
 f2 22                 add	r4, r2
 f6 14                 st8	[r6+], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f6 0b                 st8	[r5+], r3
 f0 0b 03              addi.s8	r3, 0x3
 f4 aa                 inc16	r2
 f7 40                 st16	[r4+], r0
 f0 08 13              addi.s8	r0, 0x13
 f4 af                 inc16	r7
 f4 b1                 dec16	r1
 f4 a1                 tst8	r1
 d1 c4                 brne8	avm_test_main+29
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 c7 80 01              ldi16	r7, 0x180
 f0 04 40 01           ldi16	r0, 0x140
 c5 00 01              ldi16	r5, 0x100
 f4 61                 stsp16	[sp+0x8], r5
 c2 05                 ldi8	r6, 0x5
 f4 48                 stsp16	[sp+0x2], r4
 f0 03 3f              ldi8	r3, 0x3f
 02                    mov	r4, r6
 f9 8c                 and	r4, r3
 10                    add	r4, r4
 c5 80 01              ldi16	r5, 0x180
 14                    add	r5, r4
 f5 46                 ld16	r2, [r5]
 f7 3c                 ld16	r4, [r7+]
 f4 5b                 stsp16	[sp+0x6], r7
 fe 14                 mul16	r2, r4
 f1 0e                 mov	r1, r6
 f0 09 3c              addi.s8	r1, 0x3c
 f9 2c                 and	r1, r3
 c5 40 01              ldi16	r5, 0x140
 f1 21                 mov	r4, r1
 11                    add	r4, r5
 40                    ld8u	r4, [r4]
 f0 6c e1              ld8u	r7, [r0+]
 f0 38 04              stsp16	[sp+0x4], r0
 f3 13                 mulu8.w	r4, r7
 f0 30 08              ldsp16	r0, [sp+0x8]
 f0 6c e1              ld8u	r7, [r0+]
 f0 38 08              stsp16	[sp+0x8], r0
 f0 04 00 01           ldi16	r0, 0x100
 f2 01                 add	r0, r1
 f1 0e                 mov	r1, r6
 f0 09 3e              addi.s8	r1, 0x3e
 f9 2c                 and	r1, r3
 f2 0d                 add	r1, r5
 ed a2 20              ld8u	r5, [r1+0]
 ed 60 20              ld8u	r3, [r0+0]
 f0 30 04              ldsp16	r0, [sp+0x4]
 f6 43                 sext8	r3
 f2 1d                 add	r3, r5
 f6 47                 sext8	r7
 fe 1f                 mul16	r3, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 09                 ldsp16	r5, [sp+0x2]
 f2 1d                 add	r3, r5
 f2 1c                 add	r3, r4
 f2 1a                 add	r3, r2
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 45                 cmpi.s8	r4, 0x45
 f1 23                 mov	r4, r3
 d1 97                 brne8	avm_test_main+109
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 f1 23                 mov	r4, r3
 db 79 ff              brne16	avm_test_main+93
 f0 5b 00 02           stm16	[0x200], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0a                 adjsp	avm_halt+5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
