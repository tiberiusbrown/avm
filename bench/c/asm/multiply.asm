
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/multiply.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 multiply.c
00000100 l     O .data	00000040 signed_bytes
00000140 l     O .data	00000040 unsigned_bytes
00000180 l     O .data	00000080 words
00000200 l     O .data	00000002 multiply_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	000000ea avm_test_main
00000400 g     F .text	00000002 avm_halt

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
 e1 ea 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f4                 adjsp	_start+16
 f0 02 01              ldi8	r2, 0x1
 f0 07 01 01           ldi16	r3, 0x101
 c6 00 01              ldi16	r6, 0x100
 c7 40 01              ldi16	r7, 0x140
 f0 04 80 01           ldi16	r0, 0x180
 f0 01 f1              ldi8	r1, 0xf1
 a5                    xor	r5, r5
 f4 63                 stsp16	[sp+0x8], r7
 f4 6a                 stsp16	[sp+0xa], r6
 c3 09                 ldi8	r7, 0x9
 09                    mov	r6, r5
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 01                    mov	r4, r5
 22                    sub	r4, r6
 c3 fe                 ldi8	r7, 0xfe
 8c                    and	r7, r4
 fa a1                 lsr16i	r7, 0x1
 1e                    add	r7, r6
 f4 2a                 ldsp16	r6, [sp+0xa]
 fa a4                 lsr16i	r7, 0x4
 c0 1f                 ldi8	r4, 0x1f
 f3 1c                 mulu8.w	r7, r4
 f1 21                 mov	r4, r1
 23                    sub	r4, r7
 f4 23                 ldsp16	r7, [sp+0x8]
 f6 14                 st8	[r6+], r4
 f4 ad                 inc16	r5
 f4 a9                 inc16	r1
 f6 1a                 st8	[r7+], r2
 f0 0a 03              addi.s8	r2, 0x3
 f0 6d 71              st16	[r0+], r3
 f0 0b 13              addi.s8	r3, 0x13
 c4 c1 05              ldi16	r4, 0x5c1
 f5 1c                 cmp	r3, r4
 d1 c8                 brne8	avm_test_main+27
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f0 02 05              ldi8	r2, 0x5
 f0 04 00 01           ldi16	r0, 0x100
 c5 40 01              ldi16	r5, 0x140
 f4 69                 stsp16	[sp+0xa], r5
 c6 80 01              ldi16	r6, 0x180
 f4 50                 stsp16	[sp+0x4], r4
 f0 03 3f              ldi8	r3, 0x3f
 f1 22                 mov	r4, r2
 f9 8c                 and	r4, r3
 fa 31                 lsl16i	r4, 0x1
 c5 80 01              ldi16	r5, 0x180
 14                    add	r5, r4
 65                    ld16	r5, [r5]
 f7 34                 ld16	r4, [r7+]
 f4 5a                 stsp16	[sp+0x6], r6
 fe 2c                 mul16	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f1 2a                 mov	r6, r2
 ca fc                 addi.s8	r6, -0x4
 f9 cc                 and	r6, r3
 c7 40 01              ldi16	r7, 0x140
 02                    mov	r4, r6
 13                    add	r4, r7
 40                    ld8u	r4, [r4]
 f0 31 0a              ldsp16	r1, [sp+0xa]
 f0 6c a3              ld8u	r5, [r1+]
 f0 39 0a              stsp16	[sp+0xa], r1
 f3 11                 mulu8.w	r4, r5
 f0 6c a1              ld8u	r5, [r0+]
 f0 38 08              stsp16	[sp+0x8], r0
 f0 04 00 01           ldi16	r0, 0x100
 f2 06                 add	r0, r6
 f1 2a                 mov	r6, r2
 ca fe                 addi.s8	r6, -0x2
 f9 cc                 and	r6, r3
 1b                    add	r6, r7
 4a                    ld8u	r6, [r6]
 f0 6c 60              ld8u	r3, [r0]
 f0 30 08              ldsp16	r0, [sp+0x8]
 f6 43                 sext8	r3
 f2 1e                 add	r3, r6
 f4 1a                 ldsp16	r6, [sp+0x6]
 f6 45                 sext8	r5
 fe 1d                 mul16	r3, r5
 f4 11                 ldsp16	r5, [sp+0x4]
 f2 1d                 add	r3, r5
 f2 1c                 add	r3, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f2 1c                 add	r3, r4
 f4 aa                 inc16	r2
 f0 0e 45              cmpi.s8	r2, 0x45
 f1 23                 mov	r4, r3
 d1 9a                 brne8	avm_test_main+104
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 f1 23                 mov	r4, r3
 db 7b ff              brne16	avm_test_main+87
 f0 5b 00 02           stm16	[0x200], r3
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
