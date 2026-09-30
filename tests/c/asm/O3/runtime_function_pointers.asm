
runtime_function_pointers.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 runtime_function_pointers.c
00000100 l     O .data	00000010 .L__const.avm_test_main.dst
0000043d l     F .text	00000012 snprintf
0000044f l     F .text	00000020 snprintf_P
00000496 l     O .rodata	00000003 .L.avm.flashstr.0
00000499 l     O .rodata	00000002 .L.avm.flashstr.1
00000110 l     O .data	00000003 .L.str
0000049b l     O .rodata	00000003 .L.avm.flashstr.2
00000000 l    df *ABS*	00000000 pgmspace.c
00000000 l    df *ABS*	00000000 runtime.c
00000000 l    df *ABS*	00000000 stdio.c
0000049e l       .init_array	00000000 .hidden __init_array_end
0000049e l       .init_array	00000000 .hidden __init_array_start
0000049e l       .fini_array	00000000 .hidden __fini_array_start
0000049e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000166 avm_test_main
00000485 g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors
0000046f g     F .text	0000000b strncpy_P
0000047a g     F .text	0000000b strncat_P
00000487 g     F .text	00000007 vsnprintf
0000048e g     F .text	00000008 vsnprintf_P

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
 e1 67 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 9e 04              ldi16	r4, 0x49e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9e 04              ldi16	r6, 0x49e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 9e 04           ldi16	r0, 0x49e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 9e 04           ldi16	r2, 0x49e
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
 c4 9e 04              ldi16	r4, 0x49e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9e 04              ldi16	r6, 0x49e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 9e 04           ldi16	r2, 0x49e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 9e 04           ldi16	r0, 0x49e
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
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e2                 adjsp	-0x1e
 c5 00 01              ldi16	r5, 0x100
 f0 10 0e              leasp	r0, 0xe
 f1 20                 mov	r4, r0
 c2 10                 ldi8	r6, 0x10
 d7 0f                 sys	memcpy
 c4 6f 04              ldi16	r4, 0x46f
 c1 00                 ldi8	r5, 0x0
 f4 6c                 stsp16	[sp+0xb], r4
 f1 65                 stsp8	[sp+0xd], r5
 c4 7a 04              ldi16	r4, 0x47a
 c1 00                 ldi8	r5, 0x0
 f4 60                 stsp16	[sp+0x8], r4
 f1 59                 stsp8	[sp+0xa], r5
 c4 3d 04              ldi16	r4, 0x43d
 c1 00                 ldi8	r5, 0x0
 f4 54                 stsp16	[sp+0x5], r4
 f1 4d                 stsp8	[sp+0x7], r5
 c4 4f 04              ldi16	r4, 0x44f
 c1 00                 ldi8	r5, 0x0
 f4 48                 stsp16	[sp+0x2], r4
 f1 41                 stsp8	[sp+0x4], r5
 f0 32 0b              ldsp16	r2, [sp+0xb]
 f0 1b 0d              ldsp8u	r3, [sp+0xd]
 d6 fe                 adjsp	-0x2
 f0 01 03              ldi8	r1, 0x3
 f0 39 00              stsp16	[sp+0x0], r1
 c6 96 04              ldi16	r6, 0x496
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f1 20                 mov	r4, r0
 e9                    callp	q1
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f3 7a                 ldsp8u	r6, [sp+0xe]
 f5 24                 cmp	r5, r0
 d1 0d                 brne8	avm_test_main+102
 f1 76                 zext8	r6
 ce 68                 cmpi.s8	r6, 0x68
 d1 07                 brne8	avm_test_main+102
 f0 1d 10              ldsp8u	r5, [sp+0x10]
 f4 a5                 tst8	r5
 d0 07                 breq8	avm_test_main+109
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 1b 0a              ldsp8u	r3, [sp+0xa]
 d6 fe                 adjsp	-0x2
 c0 01                 ldi8	r4, 0x1
 f4 40                 stsp16	[sp+0x0], r4
 c6 99 04              ldi16	r6, 0x499
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 10 10              leasp	r0, 0x10
 f1 20                 mov	r4, r0
 e9                    callp	q1
 d6 02                 adjsp	0x2
 04                    mov	r5, r4
 c0 02                 ldi8	r4, 0x2
 f0 1e 10              ldsp8u	r6, [sp+0x10]
 f5 24                 cmp	r5, r0
 d1 d4                 brne8	avm_test_main+102
 f1 76                 zext8	r6
 ce 21                 cmpi.s8	r6, 0x21
 d1 ce                 brne8	avm_test_main+102
 f4 14                 ldsp16	r4, [sp+0x5]
 f3 5d                 ldsp8u	r5, [sp+0x7]
 d6 f8                 adjsp	-0x8
 c2 2a                 ldi8	r6, 0x2a
 f4 5a                 stsp16	[sp+0x6], r6
 c6 10 01              ldi16	r6, 0x110
 f4 52                 stsp16	[sp+0x4], r6
 c2 10                 ldi8	r6, 0x10
 f4 4a                 stsp16	[sp+0x2], r6
 f0 16 16              leasp	r6, 0x16
 f4 42                 stsp16	[sp+0x0], r6
 ea                    callp	q2
 d6 08                 adjsp	0x8
 f3 79                 ldsp8u	r5, [sp+0xe]
 cc 02                 cmpi.s8	r4, 0x2
 db a7 00              brne16	avm_test_main+353
 f1 75                 zext8	r5
 cd 34                 cmpi.s8	r5, 0x34
 db a0 00              brne16	avm_test_main+353
 f3 7c                 ldsp8u	r4, [sp+0xf]
 cc 32                 cmpi.s8	r4, 0x32
 f1 21                 mov	r4, r1
 d1 9d                 brne8	avm_test_main+102
 f4 08                 ldsp16	r4, [sp+0x2]
 f3 51                 ldsp8u	r5, [sp+0x4]
 d6 f7                 adjsp	-0x9
 c2 39                 ldi8	r6, 0x39
 f4 5e                 stsp16	[sp+0x7], r6
 c6 9b 04              ldi16	r6, 0x49b
 c3 00                 ldi8	r7, 0x0
 f4 52                 stsp16	[sp+0x4], r6
 f1 4b                 stsp8	[sp+0x6], r7
 c2 10                 ldi8	r6, 0x10
 f4 4a                 stsp16	[sp+0x2], r6
 f0 16 17              leasp	r6, 0x17
 f4 42                 stsp16	[sp+0x0], r6
 ea                    callp	q2
 d6 09                 adjsp	0x9
 04                    mov	r5, r4
 c0 04                 ldi8	r4, 0x4
 f3 7e                 ldsp8u	r6, [sp+0xf]
 f3 7b                 ldsp8u	r7, [sp+0xe]
 cd 02                 cmpi.s8	r5, 0x2
 db 72 ff              brne16	avm_test_main+102
 f1 77                 zext8	r7
 cf 35                 cmpi.s8	r7, 0x35
 db 6b ff              brne16	avm_test_main+102
 f1 76                 zext8	r6
 ce 37                 cmpi.s8	r6, 0x37
 db 64 ff              brne16	avm_test_main+102
 c0 0c                 ldi8	r4, 0xc
 f4 40                 stsp16	[sp+0x0], r4
 f0 17 00              leasp	r7, 0x0
 c6 10 01              ldi16	r6, 0x110
 f0 14 0e              leasp	r4, 0xe
 c1 10                 ldi8	r5, 0x10
 f1 17                 mov	r2, r7
 d7 2f                 sys	vsnprintf
 0c                    mov	r7, r4
 c0 05                 ldi8	r4, 0x5
 f3 7d                 ldsp8u	r5, [sp+0xf]
 f3 7a                 ldsp8u	r6, [sp+0xe]
 cf 02                 cmpi.s8	r7, 0x2
 db 45 ff              brne16	avm_test_main+102
 f1 76                 zext8	r6
 ce 31                 cmpi.s8	r6, 0x31
 db 3e ff              brne16	avm_test_main+102
 f1 75                 zext8	r5
 cd 32                 cmpi.s8	r5, 0x32
 db 37 ff              brne16	avm_test_main+102
 c0 22                 ldi8	r4, 0x22
 f4 40                 stsp16	[sp+0x0], r4
 f0 10 00              leasp	r0, 0x0
 c6 9b 04              ldi16	r6, 0x49b
 c3 00                 ldi8	r7, 0x0
 f0 14 0e              leasp	r4, 0xe
 c1 10                 ldi8	r5, 0x10
 f1 10                 mov	r2, r0
 d7 30                 sys	vsnprintf_p
 04                    mov	r5, r4
 f3 7e                 ldsp8u	r6, [sp+0xf]
 f1 76                 zext8	r6
 c0 06                 ldi8	r4, 0x6
 af                    xor	r7, r7
 ce 34                 cmpi.s8	r6, 0x34
 08                    mov	r6, r4
 fb 37                 cmov.eq	r6, r7
 f3 7b                 ldsp8u	r7, [sp+0xe]
 f1 77                 zext8	r7
 cf 33                 cmpi.s8	r7, 0x33
 0c                    mov	r7, r4
 fb 3e                 cmov.eq	r7, r6
 cd 02                 cmpi.s8	r5, 0x2
 fb 27                 cmov.eq	r4, r7
 e0 05 ff              jmp16	avm_test_main+102
 f1 21                 mov	r4, r1
 e0 00 ff              jmp16	avm_test_main+102

<snprintf>:
 d6 fe                 adjsp	-0x2
 f4 26                 ldsp16	r6, [sp+0x9]
 f4 1d                 ldsp16	r5, [sp+0x7]
 f4 14                 ldsp16	r4, [sp+0x5]
 f0 17 0b              leasp	r7, 0xb
 f4 43                 stsp16	[sp+0x0], r7
 d5 3b                 call8	vsnprintf
 d6 02                 adjsp	0x2
 ef                    ret

<snprintf_P>:
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f4 25                 ldsp16	r5, [sp+0x9]
 f4 1c                 ldsp16	r4, [sp+0x7]
 f4 2e                 ldsp16	r6, [sp+0xb]
 f3 77                 ldsp8u	r7, [sp+0xd]
 f0 10 0e              leasp	r0, 0xe
 f0 38 00              stsp16	[sp+0x0], r0
 d6 fe                 adjsp	-0x2
 f0 38 00              stsp16	[sp+0x0], r0
 f1 77                 zext8	r7
 d5 25                 call8	vsnprintf_P
 d6 02                 adjsp	0x2
 d6 02                 adjsp	0x2
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
