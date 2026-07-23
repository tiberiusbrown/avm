
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
00000316 g     F .text	000000c8 avm_test_main
000003de g     F .text	00000002 avm_halt

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
 e1 c8 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 f0 03 01              ldi8	r3, 0x1
 f0 05 01 01           ldi16	r1, 0x101
 f0 06 00 01           ldi16	r2, 0x100
 c7 40 01              ldi16	r7, 0x140
 c6 80 01              ldi16	r6, 0x180
 f0 00 f1              ldi8	r0, 0xf1
 a5                    xor	r5, r5
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c0 09                 ldi8	r4, 0x9
 09                    mov	r6, r5
 f3 18                 mulu8.w	r6, r4
 fa 98                 lsr16i	r6, 0x8
 0d                    mov	r7, r5
 2e                    sub	r7, r6
 c0 fe                 ldi8	r4, 0xfe
 83                    and	r4, r7
 f4 0b                 ldsp16	r7, [sp+0x2]
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
 f4 02                 ldsp16	r6, [sp+0x0]
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
 0c                    mov	r7, r4
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f0 04 80 01           ldi16	r0, 0x180
 f2 39                 sub	r1, r1
 f1 11                 mov	r2, r1
 f4 4b                 stsp16	[sp+0x2], r7
 f1 21                 mov	r4, r1
 c8 05                 addi.s8	r4, 0x5
 c2 3f                 ldi8	r6, 0x3f
 82                    and	r4, r6
 10                    add	r4, r4
 c7 80 01              ldi16	r7, 0x180
 1c                    add	r7, r4
 f5 4f                 ld16	r3, [r7]
 f0 6c 91              ld16	r4, [r0+]
 fe 1c                 mul16	r3, r4
 f1 21                 mov	r4, r1
 c8 03                 addi.s8	r4, 0x3
 82                    and	r4, r6
 c7 40 01              ldi16	r7, 0x140
 13                    add	r4, r7
 f1 25                 mov	r5, r1
 17                    add	r5, r7
 45                    ld8u	r5, [r5]
 f4 aa                 inc16	r2
 f9 c8                 and	r6, r2
 1e                    add	r7, r6
 4f                    ld8u	r7, [r7]
 f3 1d                 mulu8.w	r7, r5
 40                    ld8u	r4, [r4]
 c5 00 01              ldi16	r5, 0x100
 19                    add	r6, r5
 4a                    ld8u	r6, [r6]
 f6 46                 sext8	r6
 18                    add	r6, r4
 f2 0d                 add	r1, r5
 ed 82 20              ld8u	r4, [r1+0]
 f6 44                 sext8	r4
 fe 34                 mul16	r6, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 18                    add	r6, r4
 1b                    add	r6, r7
 f2 2b                 add	r6, r3
 f0 0e 40              cmpi.s8	r2, 0x40
 f1 0a                 mov	r1, r2
 0e                    mov	r7, r6
 d1 b6                 brne8	avm_test_main+100
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 0e                    mov	r7, r6
 d1 a0                 brne8	avm_test_main+90
 f0 5e 00 02           stm16	[0x200], r6
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+199
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
