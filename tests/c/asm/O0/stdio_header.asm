
stdio_header.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 stdio_header.c
00000100 l     O .data	00000003 .L.str
00000357 l     F .text	0000001e call_ram_plus_one
000003ed l     O .rodata	00000003 .L.avm.flashstr.0
00000375 l     F .text	00000034 call_program_plus_one
000003a9 l     F .text	0000001d ram_plus_one
000003c6 l     F .text	00000025 program_plus_one
00000000 l    df *ABS*	00000000 runtime.c
000003f0 l       .init_array	00000000 .hidden __init_array_end
000003f0 l       .init_array	00000000 .hidden __init_array_start
000003f0 l       .fini_array	00000000 .hidden __fini_array_start
000003f0 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000080 avm_test_main
000003eb g     F .text	00000002 avm_halt
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
 e1 cd 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f0 03              ldi16	r4, 0x3f0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f0 03              ldi16	r6, 0x3f0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 f0 03           ldi16	r0, 0x3f0
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f0 03           ldi16	r2, 0x3f0
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
 e1 81 fd              call16	-639
 c4 f0 03              ldi16	r4, 0x3f0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f0 03              ldi16	r6, 0x3f0
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 f0 03           ldi16	r2, 0x3f0
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f0 03           ldi16	r0, 0x3f0
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
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 d6 fa                 adjsp	-0x6
 d6 f8                 adjsp	-0x8
 c0 07                 ldi8	r4, 0x7
 f4 58                 stsp16	[sp+0x6], r4
 c4 00 01              ldi16	r4, 0x100
 f4 50                 stsp16	[sp+0x4], r4
 c0 04                 ldi8	r4, 0x4
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 08              leasp	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 d5 68                 call8	call_ram_plus_one
 d6 08                 adjsp	0x8
 cc 02                 cmpi.s8	r4, 0x2
 d1 16                 brne8	avm_test_main+52
 d4 00                 jmp8	avm_test_main+32
 f3 40                 ldsp8u	r4, [sp+0x0]
 f6 44                 sext8	r4
 cc 37                 cmpi.s8	r4, 0x37
 d1 0c                 brne8	avm_test_main+52
 d4 00                 jmp8	avm_test_main+42
 f3 44                 ldsp8u	r4, [sp+0x1]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d0 08                 breq8	avm_test_main+58
 d4 00                 jmp8	avm_test_main+52
 c0 01                 ldi8	r4, 0x1
 f4 50                 stsp16	[sp+0x4], r4
 d4 41                 jmp8	avm_test_main+123
 d6 f7                 adjsp	-0x9
 c0 08                 ldi8	r4, 0x8
 f4 5c                 stsp16	[sp+0x7], r4
 c4 ed 03              ldi16	r4, 0x3ed
 c1 00                 ldi8	r5, 0x0
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 c0 04                 ldi8	r4, 0x4
 f4 48                 stsp16	[sp+0x2], r4
 f0 14 09              leasp	r4, 0x9
 f4 40                 stsp16	[sp+0x0], r4
 d5 4a                 call8	call_program_plus_one
 d6 09                 adjsp	0x9
 cc 02                 cmpi.s8	r4, 0x2
 d1 16                 brne8	avm_test_main+112
 d4 00                 jmp8	avm_test_main+92
 f3 40                 ldsp8u	r4, [sp+0x0]
 f6 44                 sext8	r4
 cc 38                 cmpi.s8	r4, 0x38
 d1 0c                 brne8	avm_test_main+112
 d4 00                 jmp8	avm_test_main+102
 f3 44                 ldsp8u	r4, [sp+0x1]
 f6 44                 sext8	r4
 f4 a4                 tst8	r4
 d0 08                 breq8	avm_test_main+118
 d4 00                 jmp8	avm_test_main+112
 c0 02                 ldi8	r4, 0x2
 f4 50                 stsp16	[sp+0x4], r4
 d4 05                 jmp8	avm_test_main+123
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 d4 00                 jmp8	avm_test_main+123
 f4 10                 ldsp16	r4, [sp+0x4]
 d6 06                 adjsp	0x6
 ef                    ret

<call_ram_plus_one>:
 d6 fc                 adjsp	-0x4
 f4 2c                 ldsp16	r4, [sp+0xb]
 f4 24                 ldsp16	r4, [sp+0x9]
 f4 1c                 ldsp16	r4, [sp+0x7]
 f0 14 0d              leasp	r4, 0xd
 f4 48                 stsp16	[sp+0x2], r4
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 25                 ldsp16	r5, [sp+0x9]
 f4 2e                 ldsp16	r6, [sp+0xb]
 f4 0b                 ldsp16	r7, [sp+0x2]
 d5 3b                 call8	ram_plus_one
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 04                 adjsp	0x4
 ef                    ret

<call_program_plus_one>:
 b0                    push16	r0
 d6 f9                 adjsp	-0x7
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 1d 12              ldsp8u	r5, [sp+0x12]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 f0 14 13              leasp	r4, 0x13
 f4 48                 stsp16	[sp+0x2], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 12                 ldsp16	r6, [sp+0x4]
 f3 5b                 ldsp8u	r7, [sp+0x6]
 f0 30 02              ldsp16	r0, [sp+0x2]
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 f1 77                 zext8	r7
 d5 27                 call8	program_plus_one
 d6 02                 adjsp	0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 07                 adjsp	0x7
 b8                    pop16	r0
 ef                    ret

<ram_plus_one>:
 d6 f8                 adjsp	-0x8
 f4 58                 stsp16	[sp+0x6], r4
 f4 51                 stsp16	[sp+0x4], r5
 f4 4a                 stsp16	[sp+0x2], r6
 f4 43                 stsp16	[sp+0x0], r7
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 11                 ldsp16	r5, [sp+0x4]
 f4 0a                 ldsp16	r6, [sp+0x2]
 f4 03                 ldsp16	r7, [sp+0x0]
 b2                    push16	r2
 f1 17                 mov	r2, r7
 d7 2f                 sys	vsnprintf
 f4 ac                 inc16	r4
 ba                    pop16	r2
 d6 08                 adjsp	0x8
 ef                    ret

<program_plus_one>:
 b0                    push16	r0
 d6 f9                 adjsp	-0x7
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f4 54                 stsp16	[sp+0x5], r4
 f4 4d                 stsp16	[sp+0x3], r5
 f4 42                 stsp16	[sp+0x0], r6
 f1 3b                 stsp8	[sp+0x2], r7
 f4 14                 ldsp16	r4, [sp+0x5]
 f4 0d                 ldsp16	r5, [sp+0x3]
 f4 02                 ldsp16	r6, [sp+0x0]
 f3 4b                 ldsp8u	r7, [sp+0x2]
 f0 30 0c              ldsp16	r0, [sp+0xc]
 b2                    push16	r2
 f1 10                 mov	r2, r0
 d7 30                 sys	vsnprintf_p
 f4 ac                 inc16	r4
 ba                    pop16	r2
 d6 07                 adjsp	0x7
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
