
multiply.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000031e l     F .text	00000044 avm_run_constructors
00000362 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 multiply.c
00000100 l     O .data	00000080 words
00000180 l     O .data	00000002 multiply_result
00000182 l     O .data	00000040 signed_bytes
000001c2 l     O .data	00000040 unsigned_bytes
00000000 l    df *ABS*	00000000 runtime.c
0000048e l       .init_array	00000000 .hidden __init_array_end
0000048e l       .init_array	00000000 .hidden __init_array_start
0000048e l       .fini_array	00000000 .hidden __fini_array_start
0000048e l       .fini_array	00000000 .hidden __fini_array_end
00000300 g     F .text	0000001e _start
000003c7 g     F .text	000000c5 avm_test_main
0000048c g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 c1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 51                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 6e 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 8e 04              ldi16	r4, 0x48e
 c1 00                 ldi8	r5, 0x0
 c6 8e 04              ldi16	r6, 0x48e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 8e 04           ldi16	r0, 0x48e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 8e 04           ldi16	r2, 0x48e
 f0 03 00              ldi8	r3, 0x0
<L0>:
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	-0x13 <L0>
<L1>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L0>
 e1 89 fc              call16	-887 <__avm_run_local_dtors>
<L0>:
 c4 8e 04              ldi16	r4, 0x48e
 c1 00                 ldi8	r5, 0x0
 c6 8e 04              ldi16	r6, 0x48e
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 8e 04           ldi16	r2, 0x48e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 8e 04           ldi16	r0, 0x48e
 f0 01 00              ldi8	r1, 0x0
<L1>:
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	-0x13 <L1>
<L2>:
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	0x3 <L3>
 e1 40 fc              call16	-960 <__avm_run_local_dtors>
<L3>:
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 f0 03 01              ldi8	r3, 0x1
 f0 05 01 01           ldi16	r1, 0x101
 f0 06 82 01           ldi16	r2, 0x182
 c7 c2 01              ldi16	r7, 0x1c2
 c6 00 01              ldi16	r6, 0x100
 f0 00 f1              ldi8	r0, 0xf1
 a5                    xor	r5, r5
<L0>:
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
 d1 c6                 brne8	-0x3a <L0>
 a0                    xor	r4, r4
 d7 01                 sys	debug_break
 04                    mov	r5, r4
 08                    mov	r6, r4
<L1>:
 f4 42                 stsp16	[sp+0x0], r6
 f0 07 00 01           ldi16	r3, 0x100
 aa                    xor	r6, r6
 f1 06                 mov	r0, r6
<L2>:
 f4 49                 stsp16	[sp+0x2], r5
 02                    mov	r4, r6
 c8 05                 addi.s8	r4, 0x5
 f0 02 3f              ldi8	r2, 0x3f
 f9 88                 and	r4, r2
 10                    add	r4, r4
 c7 00 01              ldi16	r7, 0x100
 13                    add	r4, r7
 f5 41                 ld16	r1, [r4]
 f0 6c 97              ld16	r4, [r3+]
 fe 0c                 mul16	r1, r4
 02                    mov	r4, r6
 c8 03                 addi.s8	r4, 0x3
 f9 88                 and	r4, r2
 c5 c2 01              ldi16	r5, 0x1c2
 11                    add	r4, r5
 f4 a8                 inc16	r0
 f9 40                 and	r2, r0
 c5 82 01              ldi16	r5, 0x182
 f2 15                 add	r2, r5
 19                    add	r6, r5
 ed ac 60              ld8u	r5, [r6+64]
 ed e4 60              ld8u	r7, [r2+64]
 f3 1d                 mulu8.w	r7, r5
 44                    ld8u	r5, [r4]
 ed 84 20              ld8u	r4, [r2+0]
 f6 44                 sext8	r4
 11                    add	r4, r5
 46                    ld8u	r5, [r6]
 f6 45                 sext8	r5
 fe 25                 mul16	r4, r5
 f4 09                 ldsp16	r5, [sp+0x2]
 11                    add	r4, r5
 13                    add	r4, r7
 f2 21                 add	r4, r1
 f0 0c 40              cmpi.s8	r0, 0x40
 f1 28                 mov	r6, r0
 04                    mov	r5, r4
 d1 b5                 brne8	-0x4b <L2>
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 ce 08                 cmpi.s8	r6, 0x8
 04                    mov	r5, r4
 d1 a3                 brne8	-0x5d <L1>
 f0 5c 80 01           stm16	[0x180], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
