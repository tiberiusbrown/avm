
float_comparisons.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	00000044 avm_run_constructors
00000262 l     F .text	00000065 avm_run_destructors
00000000 l    df *ABS*	00000000 float_comparisons.c
00000100 l     O .data	00000040 first
00000140 l     O .data	00000040 second
00000180 l     O .data	00000002 float_comparisons_result
00000000 l    df *ABS*	00000000 runtime.c
000003d5 l       .init_array	00000000 .hidden __init_array_end
000003d5 l       .init_array	00000000 .hidden __init_array_start
000003d5 l       .fini_array	00000000 .hidden __fini_array_start
000003d5 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002c7 g     F .text	0000010c avm_test_main
000003d3 g     F .text	00000002 avm_halt
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
 e1 b5 01              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 d5 03              ldi16	r4, 0x3d5
 c1 00                 ldi8	r5, 0x0
 c6 d5 03              ldi16	r6, 0x3d5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 28                 breq8	avm_run_constructors+61
 f0 04 d5 03           ldi16	r0, 0x3d5
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 d5 03           ldi16	r2, 0x3d5
 f0 03 00              ldi8	r3, 0x0
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+42
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
 d0 03                 breq8	avm_run_destructors+21
 e1 89 fd              call16	-631
 c4 d5 03              ldi16	r4, 0x3d5
 c1 00                 ldi8	r5, 0x0
 c6 d5 03              ldi16	r6, 0x3d5
 c3 00                 ldi8	r7, 0x0
 f0 69 c8              cmp32	q3, q2
 d0 2b                 breq8	avm_run_destructors+79
 f0 06 d5 03           ldi16	r2, 0x3d5
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 d5 03           ldi16	r0, 0x3d5
 f0 01 00              ldi8	r1, 0x0
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+60
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+94
 e1 40 fd              call16	-704
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
 d6 ec                 adjsp	-0x14
 c4 fa ff              ldi16	r4, 0xfffa
 a5                    xor	r5, r5
 f0 3d 12              stsp16	[sp+0x12], r5
 c6 f8 ff              ldi16	r6, 0xfff8
 c5 00 01              ldi16	r5, 0x100
 c7 40 01              ldi16	r7, 0x140
 f2 30                 sub	r0, r0
 f0 05 c0 3e           ldi16	r1, 0x3ec0
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 3c 10              stsp16	[sp+0x10], r4
 ff c0 61              s16tof	q1, r6
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 ff 24                 fmul	q1, q0
 f0 6b 4a              st32	[r5], q1
 f0 02 0d              ldi8	r2, 0xd
 f1 05                 mov	r0, r5
 f1 0e                 mov	r1, r6
 f0 36 12              ldsp16	r6, [sp+0x12]
 06                    mov	r5, r6
 ec 6a                 urem16	r5, r2
 26                    sub	r5, r6
 14                    add	r5, r4
 ff c0 51              s16tof	q1, r5
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 ff 26                 fmul	q1, q2
 f1 24                 mov	r5, r0
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 6b 4e              st32	[r7], q1
 cb 04                 addi.s8	r7, 0x4
 c9 04                 addi.s8	r5, 0x4
 ca 07                 addi.s8	r6, 0x7
 f0 3e 12              stsp16	[sp+0x12], r6
 f1 29                 mov	r6, r1
 c8 07                 addi.s8	r4, 0x7
 f4 ae                 inc16	r6
 ce 08                 cmpi.s8	r6, 0x8
 d1 bc                 brne8	avm_test_main+34
 a5                    xor	r5, r5
 d7 01                 sys	debug_break
 01                    mov	r4, r5
 09                    mov	r6, r5
 f4 42                 stsp16	[sp+0x0], r6
 c5 40 01              ldi16	r5, 0x140
 09                    mov	r6, r5
 c5 00 01              ldi16	r5, 0x100
 0d                    mov	r7, r5
 a5                    xor	r5, r5
 f1 0d                 mov	r1, r5
 f4 73                 stsp16	[sp+0xc], r7
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 6a 4e              ld32	q1, [r7]
 f0 3a 04              stsp16	[sp+0x4], r2
 f0 3b 06              stsp16	[sp+0x6], r3
 f0 35 10              ldsp16	r5, [sp+0x10]
 f0 6a ca              ld32	q3, [r5]
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 ff c8 57              fcmp	r5, q1, q3
 f4 49                 stsp16	[sp+0x2], r5
 cd 01                 cmpi.s8	r5, 0x1
 f1 25                 mov	r5, r1
 f2 63                 mov32	q0, q3
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 ff c8 01              fcmp	r0, q0, q1
 f1 0d                 mov	r1, r5
 c1 07                 ldi8	r5, 0x7
 f9 a4                 and	r5, r1
 f0 0c 02              cmpi.s8	r0, 0x2
 f8 16                 cset.ult	r6
 fa 09                 shl16v	r6, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 f4 09                 ldsp16	r5, [sp+0x2]
 cd ff                 cmpi.s8	r5, -0x1
 f4 22                 ldsp16	r6, [sp+0x8]
 f4 2b                 ldsp16	r7, [sp+0xa]
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 fb 32                 cmov.eq	r6, r2
 fb 3b                 cmov.eq	r7, r3
 f6 2d                 tst16	r5
 f8 05                 cset.eq	r5
 14                    add	r5, r4
 f8 08                 cset.ne	r0
 f2 05                 add	r0, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 ff c8 4e              fcmp	r4, q3, q2
 f4 33                 ldsp16	r7, [sp+0xc]
 f0 36 10              ldsp16	r6, [sp+0x10]
 cc ff                 cmpi.s8	r4, -0x1
 f8 04                 cset.eq	r4
 f2 20                 add	r4, r0
 f0 35 12              ldsp16	r5, [sp+0x12]
 a1                    xor	r4, r5
 ca 04                 addi.s8	r6, 0x4
 cb 04                 addi.s8	r7, 0x4
 f4 a9                 inc16	r1
 f0 0d 10              cmpi.s8	r1, 0x10
 d1 86                 brne8	avm_test_main+120
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 ae                 inc16	r6
 06                    mov	r5, r6
 f1 75                 zext8	r5
 cd 18                 cmpi.s8	r5, 0x18
 db 6d ff              brne16	avm_test_main+107
 f0 5c 80 01           stm16	[0x180], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
