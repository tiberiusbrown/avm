
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
000003d1 l       .init_array	00000000 .hidden __init_array_end
000003d1 l       .init_array	00000000 .hidden __init_array_start
000003d1 l       .fini_array	00000000 .hidden __fini_array_start
000003d1 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	00000108 avm_test_main
000003cf g     F .text	00000002 avm_halt
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
 e1 b1 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 d1 03              ldi16	r4, 0x3d1
 c1 00                 ldi8	r5, 0x0
 c6 d1 03              ldi16	r6, 0x3d1
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	0x28 <L1>
 f0 04 d1 03           ldi16	r0, 0x3d1
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 d1 03           ldi16	r2, 0x3d1
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
 c4 d1 03              ldi16	r4, 0x3d1
 c1 00                 ldi8	r5, 0x0
 c6 d1 03              ldi16	r6, 0x3d1
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	0x2b <L2>
 f0 06 d1 03           ldi16	r2, 0x3d1
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 d1 03           ldi16	r0, 0x3d1
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
 f2 42                 sub	r2, r2
 a0                    xor	r4, r4
 c5 80 3e              ldi16	r5, 0x3e80
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c5 c0 bf              ldi16	r5, 0xbfc0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f1 1a                 mov	r3, r2
<L0>:
 f1 22                 mov	r4, r2
 f1 74                 zext8	r4
 ff 0d                 u16tof
 f2 62                 mov32	q0, q2
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 02                 fmul
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 00                 fadd
 f1 2b                 mov	r6, r3
 c7 06 01              ldi16	r7, 0x106
 1b                    add	r6, r7
 f0 6b 8c              st32	[r6], q2
 aa                    xor	r6, r6
 c7 00 3e              ldi16	r7, 0x3e00
 f2 68                 mov32	q2, q0
 ff 02                 fmul
 c7 40 3f              ldi16	r7, 0x3f40
 ff 00                 fadd
 c7 46 01              ldi16	r7, 0x146
 f1 2b                 mov	r6, r3
 1b                    add	r6, r7
 f0 6b 8c              st32	[r6], q2
 f4 aa                 inc16	r2
 f0 0b 04              addi.s8	r3, 0x4
 f0 0f 40              cmpi.s8	r3, 0x40
 d1 c3                 brne8	-0x3d <L0>
 a0                    xor	r4, r4
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 d7 01                 sys	debug_break
 04                    mov	r5, r4
<L1>:
 f4 41                 stsp16	[sp+0x0], r5
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 08                    mov	r6, r4
<L2>:
 f4 4a                 stsp16	[sp+0x2], r6
 02                    mov	r4, r6
 c5 06 01              ldi16	r5, 0x106
 11                    add	r4, r5
 f0 6a 88              ld32	q2, [r4]
 1b                    add	r6, r7
 f0 6a cc              ld32	q3, [r6]
 ff 02                 fmul
 f2 66                 mov32	q1, q2
 f2 30                 sub	r0, r0
 f0 05 a0 3f           ldi16	r1, 0x3fa0
 02                    mov	r4, r6
 07                    mov	r5, r7
 f2 6a                 mov32	q3, q0
 ff 00                 fadd
 f2 62                 mov32	q0, q2
 f2 69                 mov32	q2, q1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 ff 00                 fadd
 f2 6a                 mov32	q3, q0
 ff 03                 fdiv
 f2 66                 mov32	q1, q2
 f2 30                 sub	r0, r0
 f0 05 00 c0           ldi16	r1, 0xc000
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce ff                 cmpi.s8	r6, -0x1
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 f0 05 40 40           ldi16	r1, 0x4040
 f2 69                 mov32	q2, q1
 f2 6a                 mov32	q3, q0
 ff 14                 fcmp
 ce 01                 cmpi.s8	r6, 0x1
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 f0 30 04              ldsp16	r0, [sp+0x4]
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 ff 0d                 u16tof
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f2 69                 mov32	q2, q1
 ff 00                 fadd
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 ff 00                 fadd
 f4 0a                 ldsp16	r6, [sp+0x2]
 c7 46 01              ldi16	r7, 0x146
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 a8                 inc16	r0
 f0 38 04              stsp16	[sp+0x4], r0
 ca 04                 addi.s8	r6, 0x4
 ce 40                 cmpi.s8	r6, 0x40
 d1 87                 brne8	-0x79 <L2>
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 cd 10                 cmpi.s8	r5, 0x10
 db 78 ff              brne16	-0x88 <L1>
 c6 02 01              ldi16	r6, 0x102
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 6b 8c              st32	[r6], q2
 ff 0e                 ftos16
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
