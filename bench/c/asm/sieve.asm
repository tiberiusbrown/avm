
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/sieve.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000051e l     F .text	0000004a avm_run_constructors
00000568 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 sieve.c
00000000 l    df *ABS*	00000000 runtime.c
00000628 l       .init_array	00000000 .hidden __init_array_end
00000628 l       .init_array	00000000 .hidden __init_array_start
00000628 l       .fini_array	00000000 .hidden __fini_array_start
00000628 l       .fini_array	00000000 .hidden __fini_array_end
00000500 g     F .text	0000001e _start
000005d7 g     F .text	0000004f avm_test_main
00000626 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
00000100 g     O .data	00000384 A

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 08 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 28 06              ldi16	r4, 0x628
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 28 06              ldi16	r6, 0x628
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 28 06           ldi16	r0, 0x628
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 28 06           ldi16	r2, 0x628
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
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
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fa              call16	-1407
 c4 28 06              ldi16	r4, 0x628
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 28 06              ldi16	r6, 0x628
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 28 06           ldi16	r2, 0x628
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 28 06           ldi16	r0, 0x628
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fa              call16	-1488
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c3 02                 ldi8	r7, 0x2
 f0 02 05              ldi8	r2, 0x5
 f0 05 04 01           ldi16	r1, 0x104
 d7 01                 sys	debug_break
 f0 04 00 01           ldi16	r0, 0x100
 d4 0b                 jmp8	avm_test_main+31
 f2 0a                 add	r1, r2
 f0 0a 02              addi.s8	r2, 0x2
 f4 af                 inc16	r7
 cf 1e                 cmpi.s8	r7, 0x1e
 d0 29                 breq8	avm_test_main+72
 0b                    mov	r6, r7
 f2 28                 add	r6, r0
 03                    mov	r4, r7
 f3 10                 mulu8.w	r4, r4
 4a                    ld8u	r6, [r6]
 f4 a6                 tst8	r6
 d1 ea                 brne8	avm_test_main+20
 c6 83 03              ldi16	r6, 0x383
 38                    cmp	r6, r4
 d2 e4                 brult8	avm_test_main+20
 f1 29                 mov	r6, r1
 c1 01                 ldi8	r5, 0x1
 59                    st8	[r6], r5
 13                    add	r4, r7
 1b                    add	r6, r7
 c5 84 03              ldi16	r5, 0x384
 31                    cmp	r4, r5
 d2 f5                 brult8	avm_test_main+50
 f2 0a                 add	r1, r2
 f0 0a 02              addi.s8	r2, 0x2
 f4 af                 inc16	r7
 cf 1e                 cmpi.s8	r7, 0x1e
 d1 d7                 brne8	avm_test_main+31
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
