
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/stdio_header.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 stdio_header.c
0000032e l     F .text	00000019 call_ram_plus_one
00000347 l     F .text	00000022 call_program_plus_one
00000100 l     O .data	00000003 .L.str
0000036b l     O .rodata	00000003 .L.avm.flashstr.0
00000000 l    df *ABS*	00000000 runtime.c
0000036e l       .init_array	00000000 .hidden __init_array_end
0000036e l       .init_array	00000000 .hidden __init_array_start
0000036e l       .fini_array	00000000 .hidden __fini_array_start
0000036e l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000057 avm_test_main
00000369 g     F .text	00000002 avm_halt
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
 e1 4b 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 6e 03              ldi16	r4, 0x36e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 6e 03              ldi16	r6, 0x36e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 6e 03           ldi16	r0, 0x36e
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 6e 03           ldi16	r2, 0x36e
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
 c4 6e 03              ldi16	r4, 0x36e
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 6e 03              ldi16	r6, 0x36e
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 6e 03           ldi16	r2, 0x36e
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 6e 03           ldi16	r0, 0x36e
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
 d6 fc                 adjsp	-0x4
 d6 f8                 adjsp	-0x8
 c0 07                 ldi8	r4, 0x7
 f4 58                 stsp16	[sp+0x6], r4
 f0 14 08              leasp	r4, 0x8
 f4 40                 stsp16	[sp+0x0], r4
 d5 48                 call8	call_ram_plus_one
 d6 08                 adjsp	0x8
 04                    mov	r5, r4
 c0 01                 ldi8	r4, 0x1
 f3 42                 ldsp8u	r6, [sp+0x0]
 cd 02                 cmpi.s8	r5, 0x2
 d1 0c                 brne8	avm_test_main+38
 f1 76                 zext8	r6
 ce 37                 cmpi.s8	r6, 0x37
 d1 06                 brne8	avm_test_main+38
 f3 45                 ldsp8u	r5, [sp+0x1]
 f4 a5                 tst8	r5
 d0 03                 breq8	avm_test_main+41
 d6 04                 adjsp	0x4
 ef                    ret
 d6 f7                 adjsp	-0x9
 c0 08                 ldi8	r4, 0x8
 f4 5c                 stsp16	[sp+0x7], r4
 f0 14 09              leasp	r4, 0x9
 f4 40                 stsp16	[sp+0x0], r4
 f4 50                 stsp16	[sp+0x4], r4
 f1 49                 stsp8	[sp+0x6], r5
 d5 36                 call8	call_program_plus_one
 d6 09                 adjsp	0x9
 04                    mov	r5, r4
 f3 46                 ldsp8u	r6, [sp+0x1]
 c0 02                 ldi8	r4, 0x2
 af                    xor	r7, r7
 f4 a6                 tst8	r6
 08                    mov	r6, r4
 fb 37                 cmov.eq	r6, r7
 f3 43                 ldsp8u	r7, [sp+0x0]
 f1 77                 zext8	r7
 cf 38                 cmpi.s8	r7, 0x38
 0c                    mov	r7, r4
 fb 3e                 cmov.eq	r7, r6
 cd 02                 cmpi.s8	r5, 0x2
 fb 27                 cmov.eq	r4, r7
 d6 04                 adjsp	0x4
 ef                    ret

<call_ram_plus_one>:
 b2                    push16	r2
 d6 fe                 adjsp	-0x2
 f4 1c                 ldsp16	r4, [sp+0x7]
 f0 17 0d              leasp	r7, 0xd
 f4 43                 stsp16	[sp+0x0], r7
 c6 00 01              ldi16	r6, 0x100
 c1 04                 ldi8	r5, 0x4
 f1 17                 mov	r2, r7
 d7 2f                 sys	vsnprintf
 f4 ac                 inc16	r4
 d6 02                 adjsp	0x2
 ba                    pop16	r2
 ef                    ret

<call_program_plus_one>:
 b2                    push16	r2
 b0                    push16	r0
 d6 fe                 adjsp	-0x2
 f4 34                 ldsp16	r4, [sp+0xd]
 f3 7d                 ldsp8u	r5, [sp+0xf]
 f4 24                 ldsp16	r4, [sp+0x9]
 f0 10 10              leasp	r0, 0x10
 f0 38 00              stsp16	[sp+0x0], r0
 c6 6b 03              ldi16	r6, 0x36b
 c3 00                 ldi8	r7, 0x0
 c1 04                 ldi8	r5, 0x4
 f1 10                 mov	r2, r0
 d7 30                 sys	vsnprintf_p
 f4 ac                 inc16	r4
 d6 02                 adjsp	0x2
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
