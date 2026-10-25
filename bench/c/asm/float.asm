
float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 float.c
00000100 l     O .data	00000002 float_integer_result
00000102 l     O .data	00000004 float_result
00000106 l     O .data	00000040 input_a
00000146 l     O .data	00000040 input_b
00000000 l    df *ABS*	00000000 runtime.c
000003bc l       .init_array	00000000 .hidden __init_array_end
000003bc l       .init_array	00000000 .hidden __init_array_start
000003bc l       .fini_array	00000000 .hidden __fini_array_start
000003bc l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	000000f3 avm_test_main
000003ba g     F .text	00000002 avm_halt
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
 e1 9c 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 bc 03              ldi16	r4, 0x3bc
 c1 00                 ldi8	r5, 0x0
 c6 bc 03              ldi16	r6, 0x3bc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 bc 03           ldi16	r0, 0x3bc
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 bc 03           ldi16	r2, 0x3bc
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
 e1 89 fd              call16	-631 <__avm_run_local_dtors>
<L0>:
 c4 bc 03              ldi16	r4, 0x3bc
 c1 00                 ldi8	r5, 0x0
 c6 bc 03              ldi16	r6, 0x3bc
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 bc 03           ldi16	r2, 0x3bc
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 bc 03           ldi16	r0, 0x3bc
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
 e1 40 fd              call16	-704 <__avm_run_local_dtors>
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
 d6 f4                 adjsp	-0xc
 aa                    xor	r6, r6
 a0                    xor	r4, r4
 c5 80 3e              ldi16	r5, 0x3e80
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c5 c0 bf              ldi16	r5, 0xbfc0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 05 06 01           ldi16	r1, 0x106
 f1 06                 mov	r0, r6
<L0>:
 f4 6a                 stsp16	[sp+0xa], r6
 f1 76                 zext8	r6
 ff c1 63              u16tof	q3, r6
 f2 67                 mov32	q1, q3
 f4 18                 ldsp16	r4, [sp+0x6]
 f4 21                 ldsp16	r5, [sp+0x8]
 ff 26                 fmul	q1, q2
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 06                 fadd	q1, q2
 f1 24                 mov	r5, r0
 f2 25                 add	r5, r1
 f0 6b 4a              st32	[r5], q1
 f2 42                 sub	r2, r2
 f0 07 00 3e           ldi16	r3, 0x3e00
 ff 2d                 fmul	q3, q1
 f0 07 40 3f           ldi16	r3, 0x3f40
 ff 0d                 fadd	q3, q1
 f0 06 46 01           ldi16	r2, 0x146
 f1 24                 mov	r5, r0
 f2 26                 add	r5, r2
 f0 6b ca              st32	[r5], q3
 f4 2a                 ldsp16	r6, [sp+0xa]
 f4 ae                 inc16	r6
 f0 08 04              addi.s8	r0, 0x4
 f0 0c 40              cmpi.s8	r0, 0x40
 d1 bf                 brne8	-0x41 <L0>
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 d7 01                 sys	debug_break
 04                    mov	r5, r4
<L1>:
 f4 41                 stsp16	[sp+0x0], r5
 a0                    xor	r4, r4
 f1 1c                 mov	r3, r4
<L2>:
 f4 68                 stsp16	[sp+0xa], r4
 f0 3b 02              stsp16	[sp+0x2], r3
 04                    mov	r5, r4
 f2 25                 add	r5, r1
 f0 6a 0a              ld32	q0, [r5]
 f4 29                 ldsp16	r5, [sp+0xa]
 f2 26                 add	r5, r2
 f0 6a 4a              ld32	q1, [r5]
 ff 21                 fmul	q0, q1
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 ff 06                 fadd	q1, q2
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 ff 03                 fadd	q0, q3
 ff 31                 fdiv	q0, q1
 f2 42                 sub	r2, r2
 f0 07 00 c0           ldi16	r3, 0xc000
 ff c8 41              fcmp	r4, q0, q1
 cc ff                 cmpi.s8	r4, -0x1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f0 07 40 40           ldi16	r3, 0x4040
 ff c8 41              fcmp	r4, q0, q1
 cc 01                 cmpi.s8	r4, 0x1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f0 33 02              ldsp16	r3, [sp+0x2]
 f0 06 46 01           ldi16	r2, 0x146
 f1 23                 mov	r4, r3
 f1 74                 zext8	r4
 ff c1 42              u16tof	q2, r4
 ff 02                 fadd	q0, q2
 f4 28                 ldsp16	r4, [sp+0xa]
 ff 0c                 fadd	q3, q0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 05 06 01           ldi16	r1, 0x106
 f4 ab                 inc16	r3
 c8 04                 addi.s8	r4, 0x4
 cc 40                 cmpi.s8	r4, 0x40
 d1 9e                 brne8	-0x62 <L2>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 10                 cmpi.s8	r5, 0x10
 d1 91                 brne8	-0x6f <L1>
 c4 02 01              ldi16	r4, 0x102
 f4 1a                 ldsp16	r6, [sp+0x6]
 f4 23                 ldsp16	r7, [sp+0x8]
 f0 6b c8              st32	[r4], q3
 ff c2 43              ftos16	r4, q3
 f0 5c 00 01           stm16	[0x100], r4
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
