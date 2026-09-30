
float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 float.c
00000100 l     O .data	00000040 input_a
00000140 l     O .data	00000040 input_b
00000180 l     O .data	00000004 float_result
00000184 l     O .data	00000002 float_integer_result
00000000 l    df *ABS*	00000000 runtime.c
000003d8 l       .init_array	00000000 .hidden __init_array_end
000003d8 l       .init_array	00000000 .hidden __init_array_start
000003d8 l       .fini_array	00000000 .hidden __fini_array_start
000003d8 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	000000ff avm_test_main
000003d6 g     F .text	00000002 avm_halt
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
 e1 b8 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 d8 03              ldi16	r4, 0x3d8
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 d8 03              ldi16	r6, 0x3d8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 d8 03           ldi16	r0, 0x3d8
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 d8 03           ldi16	r2, 0x3d8
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
 c4 d8 03              ldi16	r4, 0x3d8
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 d8 03              ldi16	r6, 0x3d8
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 d8 03           ldi16	r2, 0x3d8
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 d8 03           ldi16	r0, 0x3d8
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
 d6 f4                 adjsp	-0xc
 aa                    xor	r6, r6
 a0                    xor	r4, r4
 c5 80 3e              ldi16	r5, 0x3e80
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 05 00 01           ldi16	r1, 0x100
 f1 06                 mov	r0, r6
 f4 62                 stsp16	[sp+0x8], r6
 f4 22                 ldsp16	r6, [sp+0x8]
 f1 76                 zext8	r6
 ff c1 63              u16tof	q3, r6
 f2 67                 mov32	q1, q3
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 26                 fmul	q1, q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 06                 fadd	q1, q2
 f1 24                 mov	r5, r0
 f2 25                 add	r5, r1
 f0 6b 4a              st32	[r5], q1
 f2 42                 sub	r2, r2
 f0 07 00 3e           ldi16	r3, 0x3e00
 ff 2d                 fmul	q3, q1
 f2 42                 sub	r2, r2
 f0 07 40 3f           ldi16	r3, 0x3f40
 ff 0d                 fadd	q3, q1
 f0 06 40 01           ldi16	r2, 0x140
 f1 24                 mov	r5, r0
 f2 26                 add	r5, r2
 f0 6b ca              st32	[r5], q3
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 ae                 inc16	r6
 f0 08 04              addi.s8	r0, 0x4
 f0 0c 40              cmpi.s8	r0, 0x40
 d1 bb                 brne8	avm_test_main+29
 aa                    xor	r6, r6
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 d7 01                 sys	debug_break
 f4 52                 stsp16	[sp+0x4], r6
 aa                    xor	r6, r6
 0e                    mov	r7, r6
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 06                    mov	r5, r6
 f2 25                 add	r5, r1
 f0 6a 0a              ld32	q0, [r5]
 06                    mov	r5, r6
 f2 26                 add	r5, r2
 f0 6a 4a              ld32	q1, [r5]
 ff 21                 fmul	q0, q1
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 ff 06                 fadd	q1, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 ff 02                 fadd	q0, q2
 ff 31                 fdiv	q0, q1
 f2 42                 sub	r2, r2
 f0 07 00 c0           ldi16	r3, 0xc000
 ff c8 41              fcmp	r4, q0, q1
 cc ff                 cmpi.s8	r4, -0x1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f2 42                 sub	r2, r2
 f0 07 40 40           ldi16	r3, 0x4040
 ff c8 41              fcmp	r4, q0, q1
 cc 01                 cmpi.s8	r4, 0x1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f0 06 40 01           ldi16	r2, 0x140
 03                    mov	r4, r7
 f1 74                 zext8	r4
 ff c1 42              u16tof	q2, r4
 ff 02                 fadd	q0, q2
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 08                 fadd	q2, q0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 05 00 01           ldi16	r1, 0x100
 f4 af                 inc16	r7
 ca 04                 addi.s8	r6, 0x4
 ce 40                 cmpi.s8	r6, 0x40
 d1 a0                 brne8	avm_test_main+121
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 89                 brne8	avm_test_main+109
 c4 80 01              ldi16	r4, 0x180
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 6b c8              st32	[r4], q3
 ff c2 43              ftos16	r4, q3
 f0 5c 84 01           stm16	[0x184], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 0c                 adjsp	0xc
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
