
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 float.c
00000100 l     O .data	00000040 input_a
00000140 l     O .data	00000040 input_b
00000180 l     O .data	00000004 float_result
00000184 l     O .data	00000002 float_integer_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000116 avm_test_main
0000032c g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 16 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ec                 adjsp	_start+8
 f0 06 00 01           ldi16	r2, 0x100
 c4 40 01              ldi16	r4, 0x140
 aa                    xor	r6, r6
 c3 10                 ldi8	r7, 0x10
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3a 0e              stsp16	[sp+0xe], r2
 f1 06                 mov	r0, r6
 f1 70                 zext8	r0
 ff c1 02              u16tof	q2, r0
 f0 02 00              ldi8	r2, 0x0
 f0 07 80 3e           ldi16	r3, 0x3e80
 f2 62                 mov32	q0, q2
 ff 21                 fmul	q0, q1
 f0 02 00              ldi8	r2, 0x0
 f0 07 c0 bf           ldi16	r3, 0xbfc0
 ff 01                 fadd	q0, q1
 f0 32 0e              ldsp16	r2, [sp+0xe]
 f0 6b 04              st32	[r2], q0
 f0 00 00              ldi8	r0, 0x0
 f0 05 00 3e           ldi16	r1, 0x3e00
 ff 28                 fmul	q2, q0
 f0 00 00              ldi8	r0, 0x0
 f0 05 40 3f           ldi16	r1, 0x3f40
 ff 08                 fadd	q2, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 6b 80              st32	[r0], q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f4 ae                 inc16	r6
 c8 04                 addi.s8	r4, 0x4
 f0 0a 04              addi.s8	r2, 0x4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 b1                 brne8	avm_test_main+16
 aa                    xor	r6, r6
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 d7 01                 sys	debug_break
 f4 42                 stsp16	[sp+0x0], r6
 0e                    mov	r7, r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 00 01              ldi16	r6, 0x100
 f0 04 40 01           ldi16	r0, 0x140
 c3 10                 ldi8	r7, 0x10
 f0 31 00              ldsp16	r1, [sp+0x0]
 f0 39 04              stsp16	[sp+0x4], r1
 f4 5b                 stsp16	[sp+0x6], r7
 f0 38 0c              stsp16	[sp+0xc], r0
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f4 38                 ldsp16	r4, [sp+0xe]
 f0 6a c8              ld32	q3, [r4]
 f4 30                 ldsp16	r4, [sp+0xc]
 f0 6a 08              ld32	q0, [r4]
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f2 68                 mov32	q2, q0
 f0 32 08              ldsp16	r2, [sp+0x8]
 f0 33 0a              ldsp16	r3, [sp+0xa]
 ff 09                 fadd	q2, q1
 ff 2c                 fmul	q3, q0
 f0 30 10              ldsp16	r0, [sp+0x10]
 f0 31 12              ldsp16	r1, [sp+0x12]
 ff 0c                 fadd	q3, q0
 f0 31 04              ldsp16	r1, [sp+0x4]
 ff 3e                 fdiv	q3, q2
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 ff c8 0e              fcmp	r0, q3, q2
 f0 0c ff              cmpi.s8	r0, -0x1
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 a0                    xor	r4, r4
 c5 40 40              ldi16	r5, 0x4040
 ff c8 0e              fcmp	r0, q3, q2
 f0 0c 01              cmpi.s8	r0, 0x1
 f0 30 0c              ldsp16	r0, [sp+0xc]
 fb 34                 cmov.eq	r6, r4
 fb 3d                 cmov.eq	r7, r5
 f1 21                 mov	r4, r1
 f1 74                 zext8	r4
 ff c1 42              u16tof	q2, r4
 ff 0e                 fadd	q3, q2
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 ff 0b                 fadd	q2, q3
 f4 1b                 ldsp16	r7, [sp+0x6]
 f4 3a                 ldsp16	r6, [sp+0xe]
 f4 a9                 inc16	r1
 f0 08 04              addi.s8	r0, 0x4
 ca 04                 addi.s8	r6, 0x4
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 84                 brne8	avm_test_main+119
 f4 0b                 ldsp16	r7, [sp+0x2]
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 db 6a ff              brne16	avm_test_main+105
 c6 80 01              ldi16	r6, 0x180
 f0 6b 8c              st32	[r6], q2
 ff c2 42              ftos16	r4, q2
 f0 5c 84 01           stm16	[0x184], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 14                 adjsp	avm_halt+15
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
