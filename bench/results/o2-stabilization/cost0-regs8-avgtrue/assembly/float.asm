
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 float.c
00000140 l     O .data	00000040 input_b
00000100 l     O .data	00000040 input_a
00000180 l     O .data	00000004 float_result
00000184 l     O .data	00000002 float_integer_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000137 avm_test_main
0000034d g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 37 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e6                 adjsp	_start+2
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c6 40 01              ldi16	r6, 0x140
 c4 00 01              ldi16	r4, 0x100
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 00 10              ldi8	r0, 0x10
 a0                    xor	r4, r4
 c5 80 3e              ldi16	r5, 0x3e80
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f2 69                 mov32	q2, q1
 f0 36 10              ldsp16	r6, [sp+0x10]
 f0 37 12              ldsp16	r7, [sp+0x12]
 ff 2b                 fmul	q2, q3
 aa                    xor	r6, r6
 c7 c0 bf              ldi16	r7, 0xbfc0
 ff 0b                 fadd	q2, q3
 f0 31 14              ldsp16	r1, [sp+0x14]
 f0 6b 82              st32	[r1], q2
 a0                    xor	r4, r4
 c5 00 3e              ldi16	r5, 0x3e00
 f2 6b                 mov32	q3, q1
 ff 2e                 fmul	q3, q2
 a0                    xor	r4, r4
 c5 40 3f              ldi16	r5, 0x3f40
 ff 0e                 fadd	q3, q2
 f0 34 16              ldsp16	r4, [sp+0x16]
 f0 6b c8              st32	[r4], q3
 f0 36 16              ldsp16	r6, [sp+0x16]
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 06                 fadd	q1, q2
 f0 09 04              addi.s8	r1, 0x4
 f0 39 14              stsp16	[sp+0x14], r1
 ca 04                 addi.s8	r6, 0x4
 f4 b0                 dec16	r0
 f4 a0                 tst8	r0
 d1 bc                 brne8	avm_test_main+32
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 d7 01                 sys	debug_break
 f4 41                 stsp16	[sp+0x0], r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 06 40 01           ldi16	r2, 0x140
 f0 07 00 01           ldi16	r3, 0x100
 c0 10                 ldi8	r4, 0x10
 f0 3c 10              stsp16	[sp+0x10], r4
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 3b 0a              stsp16	[sp+0xa], r3
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 6a c6              ld32	q3, [r3]
 f0 30 14              ldsp16	r0, [sp+0x14]
 f0 6a 40              ld32	q1, [r0]
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f2 61                 mov32	q0, q1
 f4 08                 ldsp16	r4, [sp+0x2]
 f4 11                 ldsp16	r5, [sp+0x4]
 ff 02                 fadd	q0, q2
 ff 2d                 fmul	q3, q1
 f0 32 16              ldsp16	r2, [sp+0x16]
 f0 33 18              ldsp16	r3, [sp+0x18]
 ff 0d                 fadd	q3, q1
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 3c                 fdiv	q3, q0
 f2 30                 sub	r0, r0
 f0 05 00 c0           ldi16	r1, 0xc000
 ff c8 2c              fcmp	r2, q3, q0
 f0 0e ff              cmpi.s8	r2, -0x1
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 f2 30                 sub	r0, r0
 f0 05 40 40           ldi16	r1, 0x4040
 ff c8 2c              fcmp	r2, q3, q0
 f0 0e 01              cmpi.s8	r2, 0x1
 f0 32 14              ldsp16	r2, [sp+0x14]
 fb 30                 cmov.eq	r6, r0
 fb 39                 cmov.eq	r7, r1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 f0 31 0e              ldsp16	r1, [sp+0xe]
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 02                 fadd	q0, q2
 f2 68                 mov32	q2, q0
 f0 30 06              ldsp16	r0, [sp+0x6]
 f0 31 08              ldsp16	r1, [sp+0x8]
 ff 0c                 fadd	q3, q0
 f0 30 16              ldsp16	r0, [sp+0x16]
 f0 31 18              ldsp16	r1, [sp+0x18]
 ff 03                 fadd	q0, q3
 f0 0b 04              addi.s8	r3, 0x4
 f0 0a 04              addi.s8	r2, 0x4
 f0 36 10              ldsp16	r6, [sp+0x10]
 f4 b6                 dec16	r6
 f0 3e 10              stsp16	[sp+0x10], r6
 f4 a6                 tst8	r6
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 08                    mov	r6, r4
 0d                    mov	r7, r5
 db 6e ff              brne16	avm_test_main+130
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 db 4d ff              brne16	avm_test_main+109
 c4 80 01              ldi16	r4, 0x180
 f0 6b 08              st32	[r4], q0
 ff c2 40              ftos16	r4, q0
 f0 5c 84 01           stm16	[0x184], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 1a                 adjsp	avm_halt+21
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
