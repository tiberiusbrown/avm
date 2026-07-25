
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
00000316 g     F .text	000000da avm_test_main
000003f0 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 da 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	-0x8
 f0 03 01              ldi8	r3, 0x1
 f0 05 01 01           ldi16	r1, 0x101
 f0 06 00 01           ldi16	r2, 0x100
 c7 40 01              ldi16	r7, 0x140
 c6 80 01              ldi16	r6, 0x180
 f0 00 f1              ldi8	r0, 0xf1
 a5                    xor	r5, r5
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c0 09                 ldi8	r4, 0x9
 09                    mov	r6, r5
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 0d                    mov	r7, r5
 2e                    sub	r7, r6
 c0 fe                 ldi8	r4, 0xfe
 83                    and	r4, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 8c                 lsr16.1	r4
 12                    add	r4, r6
 fa 74                 lsr16i	r4, 0x4
 c2 1f                 ldi8	r6, 0x1f
 f3 12                 mulu8.w	r4, r6
 09                    mov	r6, r5
 28                    sub	r6, r4
 29                    sub	r6, r5
 f2 28                 add	r6, r0
 f0 6d c5              st8	[r2+], r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 ad                 inc16	r5
 f4 a8                 inc16	r0
 f6 1b                 st8	[r7+], r3
 f0 0b 03              addi.s8	r3, 0x3
 f7 51                 st16	[r6+], r1
 f0 09 13              addi.s8	r1, 0x13
 c4 c1 05              ldi16	r4, 0x5c1
 f5 0c                 cmp	r1, r4
 d1 c6                 brne8	avm_test_main+27
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 f0 06 80 01           ldi16	r2, 0x180
 0c                    mov	r7, r4
 08                    mov	r6, r4
 f4 42                 stsp16	[sp+0x0], r6
 f1 0a                 mov	r1, r2
 f2 30                 sub	r0, r0
 f1 18                 mov	r3, r0
 f4 5b                 stsp16	[sp+0x6], r7
 f1 28                 mov	r6, r0
 ca 05                 addi.s8	r6, 0x5
 c0 3f                 ldi8	r4, 0x3f
 88                    and	r6, r4
 1a                    add	r6, r6
 f2 2a                 add	r6, r2
 66                    ld16	r5, [r6]
 f0 6c d3              ld16	r6, [r1+]
 fe 2e                 mul16	r5, r6
 f4 49                 stsp16	[sp+0x2], r5
 f1 2c                 mov	r7, r0
 cb 03                 addi.s8	r7, 0x3
 8c                    and	r7, r4
 f0 06 40 01           ldi16	r2, 0x140
 f2 2e                 add	r7, r2
 f1 28                 mov	r6, r0
 f2 2a                 add	r6, r2
 46                    ld8u	r5, [r6]
 f4 51                 stsp16	[sp+0x4], r5
 f4 ab                 inc16	r3
 f9 8c                 and	r4, r3
 08                    mov	r6, r4
 f2 2a                 add	r6, r2
 4a                    ld8u	r6, [r6]
 f4 11                 ldsp16	r5, [sp+0x4]
 f3 19                 mulu8.w	r6, r5
 f5 3e                 ld8u	r2, [r7]
 c7 00 01              ldi16	r7, 0x100
 13                    add	r4, r7
 40                    ld8u	r4, [r4]
 f6 44                 sext8	r4
 f2 22                 add	r4, r2
 f2 07                 add	r0, r7
 ed e0 20              ld8u	r7, [r0+0]
 f6 47                 sext8	r7
 fe 27                 mul16	r4, r7
 c7 80 01              ldi16	r7, 0x180
 f1 17                 mov	r2, r7
 f4 1b                 ldsp16	r7, [sp+0x6]
 13                    add	r4, r7
 12                    add	r4, r6
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 f0 0f 40              cmpi.s8	r3, 0x40
 f1 03                 mov	r0, r3
 0c                    mov	r7, r4
 d1 a6                 brne8	avm_test_main+102
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 06                    mov	r5, r6
 f1 75                 zext8	r5
 cd 08                 cmpi.s8	r5, 0x8
 0c                    mov	r7, r4
 d1 92                 brne8	avm_test_main+94
 f0 5c 00 02           stm16	[0x200], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	0x8
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
