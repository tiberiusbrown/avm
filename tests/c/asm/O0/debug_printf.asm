
debug_printf.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000011e l     F .text	0000004a avm_run_constructors
00000168 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 debug_printf.c
000001f3 l     O .rodata	00000007 .L.avm.flashstr.0
00000000 l    df *ABS*	00000000 runtime.c
000001fa l       .init_array	00000000 .hidden __init_array_end
000001fa l       .init_array	00000000 .hidden __init_array_start
000001fa l       .fini_array	00000000 .hidden __fini_array_start
000001fa l       .fini_array	00000000 .hidden __fini_array_end
00000100 g     F .text	0000001e _start
000001d7 g     F .text	0000001a avm_test_main
000001f1 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

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
 e1 d3 00              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 fa 01              ldi16	r4, 0x1fa
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 fa 01              ldi16	r6, 0x1fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 fa 01           ldi16	r0, 0x1fa
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 fa 01           ldi16	r2, 0x1fa
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
 e1 81 fe              call16	-383
 c4 fa 01              ldi16	r4, 0x1fa
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 fa 01              ldi16	r6, 0x1fa
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 fa 01           ldi16	r2, 0x1fa
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 fa 01           ldi16	r0, 0x1fa
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
 e1 30 fe              call16	-464
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 d6 fe                 adjsp	-0x2
 c0 2a                 ldi8	r4, 0x2a
 f4 40                 stsp16	[sp+0x0], r4
 c4 f3 01              ldi16	r4, 0x1f3
 c1 00                 ldi8	r5, 0x0
 f0 16 00              leasp	r6, 0x0
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 a0                    xor	r4, r4
 ba                    pop16	r2
 d6 02                 adjsp	0x2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
