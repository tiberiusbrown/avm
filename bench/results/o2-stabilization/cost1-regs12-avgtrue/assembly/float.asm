
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
00000216 g     F .text	00000149 avm_test_main
0000035f g     F .text	00000002 avm_halt

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
 e1 49 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e8                 adjsp	_start+4
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c7 40 01              ldi16	r7, 0x140
 c4 00 01              ldi16	r4, 0x100
 f0 3c 14              stsp16	[sp+0x14], r4
 c0 10                 ldi8	r4, 0x10
 f2 30                 sub	r0, r0
 f0 05 80 3e           ldi16	r1, 0x3e80
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 3c 12              stsp16	[sp+0x12], r4
 f2 69                 mov32	q2, q1
 f0 30 0e              ldsp16	r0, [sp+0xe]
 f0 31 10              ldsp16	r1, [sp+0x10]
 ff 28                 fmul	q2, q0
 f2 30                 sub	r0, r0
 f0 05 c0 bf           ldi16	r1, 0xbfc0
 ff 08                 fadd	q2, q0
 f0 36 14              ldsp16	r6, [sp+0x14]
 f0 6b 8c              st32	[r6], q2
 a0                    xor	r4, r4
 c5 00 3e              ldi16	r5, 0x3e00
 f2 61                 mov32	q0, q1
 ff 22                 fmul	q0, q2
 a0                    xor	r4, r4
 c5 40 3f              ldi16	r5, 0x3f40
 ff 02                 fadd	q0, q2
 f0 6b 0e              st32	[r7], q0
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 ff 06                 fadd	q1, q2
 f0 34 12              ldsp16	r4, [sp+0x12]
 ca 04                 addi.s8	r6, 0x4
 f0 3e 14              stsp16	[sp+0x14], r6
 cb 04                 addi.s8	r7, 0x4
 f4 b4                 dec16	r4
 f4 a4                 tst8	r4
 d1 be                 brne8	avm_test_main+33
 a5                    xor	r5, r5
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 d7 01                 sys	debug_break
 f4 41                 stsp16	[sp+0x0], r5
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 c4 40 01              ldi16	r4, 0x140
 f0 3c 12              stsp16	[sp+0x12], r4
 c6 00 01              ldi16	r6, 0x100
 c3 10                 ldi8	r7, 0x10
 f0 3a 14              stsp16	[sp+0x14], r2
 f0 3b 16              stsp16	[sp+0x16], r3
 f4 4b                 stsp16	[sp+0x2], r7
 f0 3a 08              stsp16	[sp+0x8], r2
 f0 3b 0a              stsp16	[sp+0xa], r3
 f4 72                 stsp16	[sp+0xc], r6
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 6a 08              ld32	q0, [r4]
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 6a c8              ld32	q3, [r4]
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 02                    mov	r4, r6
 07                    mov	r5, r7
 f0 32 04              ldsp16	r2, [sp+0x4]
 f0 33 06              ldsp16	r3, [sp+0x6]
 ff 09                 fadd	q2, q1
 ff 23                 fmul	q0, q3
 f4 3a                 ldsp16	r6, [sp+0xe]
 f0 37 10              ldsp16	r7, [sp+0x10]
 ff 03                 fadd	q0, q3
 f4 0b                 ldsp16	r7, [sp+0x2]
 ff 32                 fdiv	q0, q2
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 ff c8 62              fcmp	r6, q0, q2
 ce ff                 cmpi.s8	r6, -0x1
 fb 04                 cmov.eq	r0, r4
 fb 0d                 cmov.eq	r1, r5
 f2 42                 sub	r2, r2
 f0 07 40 40           ldi16	r3, 0x4040
 ff c8 61              fcmp	r6, q0, q1
 ce 01                 cmpi.s8	r6, 0x1
 fb 02                 cmov.eq	r0, r2
 fb 0b                 cmov.eq	r1, r3
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f2 42                 sub	r2, r2
 f0 07 80 3f           ldi16	r3, 0x3f80
 f0 34 14              ldsp16	r4, [sp+0x14]
 f0 35 16              ldsp16	r5, [sp+0x16]
 ff 09                 fadd	q2, q1
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 01                 fadd	q0, q1
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 35 10              ldsp16	r5, [sp+0x10]
 ff 08                 fadd	q2, q0
 f2 62                 mov32	q0, q2
 f4 32                 ldsp16	r6, [sp+0xc]
 ca 04                 addi.s8	r6, 0x4
 f0 34 12              ldsp16	r4, [sp+0x12]
 c8 04                 addi.s8	r4, 0x4
 f0 3c 12              stsp16	[sp+0x12], r4
 f4 b7                 dec16	r7
 f4 a7                 tst8	r7
 f0 32 14              ldsp16	r2, [sp+0x14]
 f0 33 16              ldsp16	r3, [sp+0x16]
 db 5d ff              brne16	avm_test_main+131
 f4 01                 ldsp16	r5, [sp+0x0]
 f4 ad                 inc16	r5
 01                    mov	r4, r5
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 db 3a ff              brne16	avm_test_main+108
 c4 80 01              ldi16	r4, 0x180
 f0 6b 08              st32	[r4], q0
 ff c2 40              ftos16	r4, q0
 f0 5c 84 01           stm16	[0x184], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 18                 adjsp	avm_halt+19
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
