
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
00000216 g     F .text	00000103 avm_test_main
00000319 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 14                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 01                    mov	r4, r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 03 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
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
 f4 72                 stsp16	[sp+0xc], r6
 f4 32                 ldsp16	r6, [sp+0xc]
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
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 ae                 inc16	r6
 f0 08 04              addi.s8	r0, 0x4
 f0 0c 40              cmpi.s8	r0, 0x40
 d1 bb                 brne8	avm_test_main+29
 aa                    xor	r6, r6
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 d7 01                 sys	debug_break
 f0 39 08              stsp16	[sp+0x8], r1
 f4 52                 stsp16	[sp+0x4], r6
 aa                    xor	r6, r6
 0e                    mov	r7, r6
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 3a 0a              stsp16	[sp+0xa], r2
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
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
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
 f0 32 0a              ldsp16	r2, [sp+0xa]
 03                    mov	r4, r7
 f1 74                 zext8	r4
 ff c1 42              u16tof	q2, r4
 ff 02                 fadd	q0, q2
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 ff 08                 fadd	q2, q0
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 f0 31 08              ldsp16	r1, [sp+0x8]
 f4 af                 inc16	r7
 ca 04                 addi.s8	r6, 0x4
 ce 40                 cmpi.s8	r6, 0x40
 d1 a2                 brne8	avm_test_main+127
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 ae                 inc16	r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 cc 10                 cmpi.s8	r4, 0x10
 d1 88                 brne8	avm_test_main+112
 c4 80 01              ldi16	r4, 0x180
 f4 32                 ldsp16	r6, [sp+0xc]
 f4 3b                 ldsp16	r7, [sp+0xe]
 f0 6b c8              st32	[r4], q3
 ff c2 43              ftos16	r4, q3
 f0 5c 84 01           stm16	[0x184], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
