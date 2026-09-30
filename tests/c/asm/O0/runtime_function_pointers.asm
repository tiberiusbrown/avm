
runtime_function_pointers.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 runtime_function_pointers.c
00000100 l     O .data	00000010 .L__const.avm_test_main.dst
00000470 l     F .text	0000001e snprintf
0000048e l     F .text	00000034 snprintf_P
000004e9 l     O .rodata	00000003 .L.avm.flashstr.0
000004ec l     O .rodata	00000002 .L.avm.flashstr.1
00000110 l     O .data	00000003 .L.str
000004ee l     O .rodata	00000003 .L.avm.flashstr.2
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdio.c
000004f1 l       .init_array	00000000 .hidden __init_array_end
000004f1 l       .init_array	00000000 .hidden __init_array_start
000004f1 l       .fini_array	00000000 .hidden __fini_array_start
000004f1 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000199 avm_test_main
000004d8 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
000004c2 g     F .text	0000000b strncpy_P
000004cd g     F .text	0000000b strncat_P
000004da g     F .text	00000007 vsnprintf
000004e1 g     F .text	00000008 vsnprintf_P

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
 e1 ba 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 f1 04              ldi16	r4, 0x4f1
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f1 04              ldi16	r6, 0x4f1
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 f1 04           ldi16	r0, 0x4f1
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 f1 04           ldi16	r2, 0x4f1
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
 c4 f1 04              ldi16	r4, 0x4f1
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 f1 04              ldi16	r6, 0x4f1
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 f1 04           ldi16	r2, 0x4f1
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 f1 04           ldi16	r0, 0x4f1
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
 b1                    push16	r1
 b0                    push16	r0
 d6 da                 adjsp	-0x26
 c6 00 01              ldi16	r6, 0x100
 c3 10                 ldi8	r7, 0x10
 f0 14 14              leasp	r4, 0x14
 f4 48                 stsp16	[sp+0x2], r4
 04                    mov	r5, r4
 b4                    push16	r4
 01                    mov	r4, r5
 06                    mov	r5, r6
 0b                    mov	r6, r7
 d7 0f                 sys	memcpy
 04                    mov	r5, r4
 c6 c2 04              ldi16	r6, 0x4c2
 c3 00                 ldi8	r7, 0x0
 bc                    pop16	r4
 f0 3e 11              stsp16	[sp+0x11], r6
 f0 2f 13              stsp8	[sp+0x13], r7
 c6 cd 04              ldi16	r6, 0x4cd
 c3 00                 ldi8	r7, 0x0
 f4 7a                 stsp16	[sp+0xe], r6
 f0 2f 10              stsp8	[sp+0x10], r7
 c6 70 04              ldi16	r6, 0x470
 c3 00                 ldi8	r7, 0x0
 f4 6e                 stsp16	[sp+0xb], r6
 f1 67                 stsp8	[sp+0xd], r7
 c6 8e 04              ldi16	r6, 0x48e
 c3 00                 ldi8	r7, 0x0
 f4 62                 stsp16	[sp+0x8], r6
 f1 5b                 stsp8	[sp+0xa], r7
 f0 30 11              ldsp16	r0, [sp+0x11]
 f0 19 13              ldsp8u	r1, [sp+0x13]
 d6 fe                 adjsp	-0x2
 c1 03                 ldi8	r5, 0x3
 f4 41                 stsp16	[sp+0x0], r5
 c6 e9 04              ldi16	r6, 0x4e9
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 e8                    callp	q0
 f4 11                 ldsp16	r5, [sp+0x4]
 d6 02                 adjsp	0x2
 31                    cmp	r4, r5
 d1 14                 brne8	avm_test_main+109
 d4 00                 jmp8	avm_test_main+91
 f0 24 14              ldsp8s	r4, [sp+0x14]
 cc 68                 cmpi.s8	r4, 0x68
 d1 0b                 brne8	avm_test_main+109
 d4 00                 jmp8	avm_test_main+100
 f0 24 16              ldsp8s	r4, [sp+0x16]
 f4 a4                 tst8	r4
 d0 0a                 breq8	avm_test_main+117
 d4 00                 jmp8	avm_test_main+109
 c0 01                 ldi8	r4, 0x1
 f0 3c 24              stsp16	[sp+0x24], r4
 e0 1c 01              jmp16	avm_test_main+401
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 19 10              ldsp8u	r1, [sp+0x10]
 d6 fe                 adjsp	-0x2
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 c6 ec 04              ldi16	r6, 0x4ec
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 14 16              leasp	r4, 0x16
 f4 48                 stsp16	[sp+0x2], r4
 e8                    callp	q0
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 02                 adjsp	0x2
 31                    cmp	r4, r5
 d1 0b                 brne8	avm_test_main+160
 d4 00                 jmp8	avm_test_main+151
 f0 24 16              ldsp8s	r4, [sp+0x16]
 cc 21                 cmpi.s8	r4, 0x21
 d0 0a                 breq8	avm_test_main+168
 d4 00                 jmp8	avm_test_main+160
 c0 02                 ldi8	r4, 0x2
 f0 3c 24              stsp16	[sp+0x24], r4
 e0 e9 00              jmp16	avm_test_main+401
 f4 2c                 ldsp16	r4, [sp+0xb]
 f3 75                 ldsp8u	r5, [sp+0xd]
 d6 f8                 adjsp	-0x8
 c2 2a                 ldi8	r6, 0x2a
 f4 5a                 stsp16	[sp+0x6], r6
 c6 10 01              ldi16	r6, 0x110
 f4 52                 stsp16	[sp+0x4], r6
 c2 10                 ldi8	r6, 0x10
 f4 4a                 stsp16	[sp+0x2], r6
 f0 16 1c              leasp	r6, 0x1c
 f4 42                 stsp16	[sp+0x0], r6
 ea                    callp	q2
 d6 08                 adjsp	0x8
 cc 02                 cmpi.s8	r4, 0x2
 d1 14                 brne8	avm_test_main+219
 d4 00                 jmp8	avm_test_main+201
 f0 24 14              ldsp8s	r4, [sp+0x14]
 cc 34                 cmpi.s8	r4, 0x34
 d1 0b                 brne8	avm_test_main+219
 d4 00                 jmp8	avm_test_main+210
 f0 24 15              ldsp8s	r4, [sp+0x15]
 cc 32                 cmpi.s8	r4, 0x32
 d0 0a                 breq8	avm_test_main+227
 d4 00                 jmp8	avm_test_main+219
 c0 03                 ldi8	r4, 0x3
 f0 3c 24              stsp16	[sp+0x24], r4
 e0 ae 00              jmp16	avm_test_main+401
 f4 20                 ldsp16	r4, [sp+0x8]
 f3 69                 ldsp8u	r5, [sp+0xa]
 d6 f7                 adjsp	-0x9
 c2 39                 ldi8	r6, 0x39
 f4 5e                 stsp16	[sp+0x7], r6
 c6 ee 04              ldi16	r6, 0x4ee
 c3 00                 ldi8	r7, 0x0
 f4 52                 stsp16	[sp+0x4], r6
 f1 4b                 stsp8	[sp+0x6], r7
 c2 10                 ldi8	r6, 0x10
 f4 4a                 stsp16	[sp+0x2], r6
 f0 16 1d              leasp	r6, 0x1d
 f4 42                 stsp16	[sp+0x0], r6
 ea                    callp	q2
 d6 09                 adjsp	0x9
 cc 02                 cmpi.s8	r4, 0x2
 d1 14                 brne8	avm_test_main+282
 d4 00                 jmp8	avm_test_main+264
 f0 24 14              ldsp8s	r4, [sp+0x14]
 cc 35                 cmpi.s8	r4, 0x35
 d1 0b                 brne8	avm_test_main+282
 d4 00                 jmp8	avm_test_main+273
 f0 24 15              ldsp8s	r4, [sp+0x15]
 cc 37                 cmpi.s8	r4, 0x37
 d0 09                 breq8	avm_test_main+289
 d4 00                 jmp8	avm_test_main+282
 c0 04                 ldi8	r4, 0x4
 f0 3c 24              stsp16	[sp+0x24], r4
 d4 70                 jmp8	avm_test_main+401
 c0 0c                 ldi8	r4, 0xc
 f4 58                 stsp16	[sp+0x6], r4
 c6 10 01              ldi16	r6, 0x110
 f0 17 06              leasp	r7, 0x6
 c1 10                 ldi8	r5, 0x10
 f0 14 14              leasp	r4, 0x14
 b2                    push16	r2
 f1 17                 mov	r2, r7
 d7 2f                 sys	vsnprintf
 cc 02                 cmpi.s8	r4, 0x2
 ba                    pop16	r2
 d1 14                 brne8	avm_test_main+334
 d4 00                 jmp8	avm_test_main+316
 f0 24 14              ldsp8s	r4, [sp+0x14]
 cc 31                 cmpi.s8	r4, 0x31
 d1 0b                 brne8	avm_test_main+334
 d4 00                 jmp8	avm_test_main+325
 f0 24 15              ldsp8s	r4, [sp+0x15]
 cc 32                 cmpi.s8	r4, 0x32
 d0 09                 breq8	avm_test_main+341
 d4 00                 jmp8	avm_test_main+334
 c0 05                 ldi8	r4, 0x5
 f0 3c 24              stsp16	[sp+0x24], r4
 d4 3c                 jmp8	avm_test_main+401
 c0 22                 ldi8	r4, 0x22
 f4 50                 stsp16	[sp+0x4], r4
 c6 ee 04              ldi16	r6, 0x4ee
 c3 00                 ldi8	r7, 0x0
 f0 10 04              leasp	r0, 0x4
 c1 10                 ldi8	r5, 0x10
 f0 14 14              leasp	r4, 0x14
 b2                    push16	r2
 f1 10                 mov	r2, r0
 d7 30                 sys	vsnprintf_p
 cc 02                 cmpi.s8	r4, 0x2
 ba                    pop16	r2
 d1 14                 brne8	avm_test_main+388
 d4 00                 jmp8	avm_test_main+370
 f0 24 14              ldsp8s	r4, [sp+0x14]
 cc 33                 cmpi.s8	r4, 0x33
 d1 0b                 brne8	avm_test_main+388
 d4 00                 jmp8	avm_test_main+379
 f0 24 15              ldsp8s	r4, [sp+0x15]
 cc 34                 cmpi.s8	r4, 0x34
 d0 09                 breq8	avm_test_main+395
 d4 00                 jmp8	avm_test_main+388
 c0 06                 ldi8	r4, 0x6
 f0 3c 24              stsp16	[sp+0x24], r4
 d4 06                 jmp8	avm_test_main+401
 a0                    xor	r4, r4
 f0 3c 24              stsp16	[sp+0x24], r4
 d4 00                 jmp8	avm_test_main+401
 f0 34 24              ldsp16	r4, [sp+0x24]
 d6 26                 adjsp	0x26
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<snprintf>:
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
 d5 53                 call8	vsnprintf
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 04                 adjsp	0x4
 ef                    ret

<snprintf_P>:
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
 d5 29                 call8	vsnprintf_P
 d6 02                 adjsp	0x2
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 d6 07                 adjsp	0x7
 b8                    pop16	r0
 ef                    ret

<strncpy_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 16                 sys	strncpy_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<strncat_P>:
 b0                    push16	r0
 f1 04                 mov	r0, r4
 f4 15                 ldsp16	r5, [sp+0x5]
 d7 17                 sys	strncat_p
 f1 20                 mov	r4, r0
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt

<vsnprintf>:
 b2                    push16	r2
 f1 17                 mov	r2, r7
 d7 2f                 sys	vsnprintf
 ba                    pop16	r2
 ef                    ret

<vsnprintf_P>:
 b2                    push16	r2
 f0 32 05              ldsp16	r2, [sp+0x5]
 d7 30                 sys	vsnprintf_p
 ba                    pop16	r2
 ef                    ret
