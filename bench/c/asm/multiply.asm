
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
00000316 g     F .text	000000e4 avm_test_main
000003fa g     F .text	00000002 avm_halt

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
 e1 e4 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f6                 adjsp	_start+18
 a5                    xor	r5, r5
 c4 80 01              ldi16	r4, 0x180
 c6 40 01              ldi16	r6, 0x140
 c7 00 01              ldi16	r7, 0x100
 f0 07 01 01           ldi16	r3, 0x101
 f0 00 40              ldi8	r0, 0x40
 f0 01 f1              ldi8	r1, 0xf1
 f0 02 01              ldi8	r2, 0x1
 f4 53                 stsp16	[sp+0x4], r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 60                 stsp16	[sp+0x8], r4
 c2 09                 ldi8	r6, 0x9
 01                    mov	r4, r5
 f3 12                 mulu8.w	r4, r6
 fa 78                 lsr16i	r4, 0x8
 0d                    mov	r7, r5
 2c                    sub	r7, r4
 c2 fe                 ldi8	r6, 0xfe
 8b                    and	r6, r7
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 8e                 lsr16.1	r6
 18                    add	r6, r4
 fa 94                 lsr16i	r6, 0x4
 c0 1f                 ldi8	r4, 0x1f
 f3 18                 mulu8.w	r6, r4
 01                    mov	r4, r5
 22                    sub	r4, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 21                    sub	r4, r5
 f2 21                 add	r4, r1
 f6 1c                 st8	[r7+], r4
 f4 20                 ldsp16	r4, [sp+0x8]
 f6 12                 st8	[r6+], r2
 f0 0a 03              addi.s8	r2, 0x3
 f4 a9                 inc16	r1
 f7 43                 st16	[r4+], r3
 f0 0b 13              addi.s8	r3, 0x13
 f4 ad                 inc16	r5
 f4 b0                 dec16	r0
 f4 a0                 tst8	r0
 d1 c4                 brne8	avm_test_main+29
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 c7 80 01              ldi16	r7, 0x180
 f0 05 40 01           ldi16	r1, 0x140
 c5 00 01              ldi16	r5, 0x100
 f4 61                 stsp16	[sp+0x8], r5
 f0 03 05              ldi8	r3, 0x5
 f4 48                 stsp16	[sp+0x2], r4
 c1 3f                 ldi8	r5, 0x3f
 f1 23                 mov	r4, r3
 81                    and	r4, r5
 09                    mov	r6, r5
 10                    add	r4, r4
 c5 80 01              ldi16	r5, 0x180
 14                    add	r5, r4
 f5 44                 ld16	r0, [r5]
 f7 3c                 ld16	r4, [r7+]
 f4 5b                 stsp16	[sp+0x6], r7
 fe 04                 mul16	r0, r4
 f1 2f                 mov	r7, r3
 cb 3c                 addi.s8	r7, 0x3c
 8e                    and	r7, r6
 f0 06 40 01           ldi16	r2, 0x140
 03                    mov	r4, r7
 f2 22                 add	r4, r2
 40                    ld8u	r4, [r4]
 f0 6c c3              ld8u	r6, [r1+]
 f0 39 04              stsp16	[sp+0x4], r1
 f3 12                 mulu8.w	r4, r6
 f4 21                 ldsp16	r5, [sp+0x8]
 f7 09                 ld8u	r1, [r5+]
 f4 61                 stsp16	[sp+0x8], r5
 c6 00 01              ldi16	r6, 0x100
 1b                    add	r6, r7
 f1 2f                 mov	r7, r3
 cb 3e                 addi.s8	r7, 0x3e
 c1 3f                 ldi8	r5, 0x3f
 8d                    and	r7, r5
 f2 2e                 add	r7, r2
 4f                    ld8u	r7, [r7]
 4a                    ld8u	r6, [r6]
 f6 46                 sext8	r6
 1b                    add	r6, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 f6 41                 sext8	r1
 fe 31                 mul16	r6, r1
 f0 31 04              ldsp16	r1, [sp+0x4]
 f4 09                 ldsp16	r5, [sp+0x2]
 19                    add	r6, r5
 18                    add	r6, r4
 f2 28                 add	r6, r0
 f4 ab                 inc16	r3
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 cc 45                 cmpi.s8	r4, 0x45
 02                    mov	r4, r6
 d1 a4                 brne8	avm_test_main+110
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 02                    mov	r4, r6
 d1 87                 brne8	avm_test_main+93
 f0 5e 00 02           stm16	[0x200], r6
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
