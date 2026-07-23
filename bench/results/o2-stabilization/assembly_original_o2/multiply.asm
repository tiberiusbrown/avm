
C:/tmp/avm-original-o2-root/build/bench/c/multiply.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 multiply.c
00000100 l     O .data	00000040 signed_bytes
00000140 l     O .data	00000040 unsigned_bytes
00000180 l     O .data	00000080 words
00000200 l     O .data	00000002 multiply_result
00000000 l    df *ABS*	00000000 runtime.c
00000300 g     F .text	00000016 _start
00000316 g     F .text	000000d6 avm_test_main
000003ec g     F .text	00000002 avm_halt

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
 e1 d6 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	avm_test_main+2
 f0 02 01              ldi8	r2, 0x1
 f0 07 01 01           ldi16	r3, 0x101
 c6 00 01              ldi16	r6, 0x100
 c7 40 01              ldi16	r7, 0x140
 f0 04 80 01           ldi16	r0, 0x180
 f0 01 f1              ldi8	r1, 0xf1
 a5                    xor	r5, r5
 f4 43                 stsp16	[sp+0x0], r7
 f4 4a                 stsp16	[sp+0x2], r6
 c3 09                 ldi8	r7, 0x9
 09                    mov	r6, r5
 f3 1b                 mulu8.w	r6, r7
 fa 98                 lsr16i	r6, 0x8
 01                    mov	r4, r5
 22                    sub	r4, r6
 c3 fe                 ldi8	r7, 0xfe
 8c                    and	r7, r4
 f4 8f                 lsr16.1	r7
 1e                    add	r7, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 fa a4                 lsr16i	r7, 0x4
 c0 1f                 ldi8	r4, 0x1f
 f3 1c                 mulu8.w	r7, r4
 01                    mov	r4, r5
 23                    sub	r4, r7
 f4 03                 ldsp16	r7, [sp+0x0]
 21                    sub	r4, r5
 f2 21                 add	r4, r1
 f6 14                 st8	[r6+], r4
 f4 ad                 inc16	r5
 f4 a9                 inc16	r1
 f6 1a                 st8	[r7+], r2
 f0 0a 03              addi.s8	r2, 0x3
 f0 6d 71              st16	[r0+], r3
 f0 0b 13              addi.s8	r3, 0x13
 c4 c1 05              ldi16	r4, 0x5c1
 f5 1c                 cmp	r3, r4
 d1 c6                 brne8	avm_test_main+27
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 08                    mov	r6, r4
 04                    mov	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 c7 80 01              ldi16	r7, 0x180
 f2 30                 sub	r0, r0
 f1 24                 mov	r5, r0
 f4 4a                 stsp16	[sp+0x2], r6
 f1 20                 mov	r4, r0
 c8 05                 addi.s8	r4, 0x5
 f0 03 3f              ldi8	r3, 0x3f
 f9 8c                 and	r4, r3
 10                    add	r4, r4
 c6 80 01              ldi16	r6, 0x180
 18                    add	r6, r4
 f5 4a                 ld16	r2, [r6]
 f7 3c                 ld16	r4, [r7+]
 fe 14                 mul16	r2, r4
 f1 08                 mov	r1, r0
 f0 09 03              addi.s8	r1, 0x3
 f9 2c                 and	r1, r3
 c4 40 01              ldi16	r4, 0x140
 f2 0c                 add	r1, r4
 f1 28                 mov	r6, r0
 18                    add	r6, r4
 4a                    ld8u	r6, [r6]
 f4 ad                 inc16	r5
 f9 74                 and	r3, r5
 f2 23                 add	r4, r3
 40                    ld8u	r4, [r4]
 f3 12                 mulu8.w	r4, r6
 ed c2 20              ld8u	r6, [r1+0]
 f0 05 00 01           ldi16	r1, 0x100
 f2 19                 add	r3, r1
 ed 66 20              ld8u	r3, [r3+0]
 f6 43                 sext8	r3
 f2 1e                 add	r3, r6
 f2 01                 add	r0, r1
 ed c0 20              ld8u	r6, [r0+0]
 f6 46                 sext8	r6
 fe 1e                 mul16	r3, r6
 f4 0a                 ldsp16	r6, [sp+0x2]
 f2 1e                 add	r3, r6
 f2 1c                 add	r3, r4
 f2 1a                 add	r3, r2
 cd 40                 cmpi.s8	r5, 0x40
 f1 05                 mov	r0, r5
 f1 2b                 mov	r6, r3
 d1 a8                 brne8	avm_test_main+99
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 08                 cmpi.s8	r4, 0x8
 f1 2b                 mov	r6, r3
 d1 92                 brne8	avm_test_main+90
 f0 5b 00 02           stm16	[0x200], r3
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	avm_test_main+213
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
