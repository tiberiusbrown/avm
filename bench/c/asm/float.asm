
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
00000216 g     F .text	000000da avm_test_main
000002f0 g     F .text	00000002 avm_halt

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
 e1 da 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	_start+20
 aa                    xor	r6, r6
 a0                    xor	r4, r4
 c5 80 3e              ldi16	r5, 0x3e80
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 a0                    xor	r4, r4
 c5 c0 bf              ldi16	r5, 0xbfc0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 06                    mov	r5, r6
 02                    mov	r4, r6
 f1 74                 zext8	r4
 ff c1 40              u16tof	q0, r4
 f2 64                 mov32	q1, q0
 02                    mov	r4, r6
 f4 12                 ldsp16	r6, [sp+0x4]
 f4 1b                 ldsp16	r7, [sp+0x6]
 ff 27                 fmul	q1, q3
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 ff 06                 fadd	q1, q2
 07                    mov	r5, r7
 c4 00 01              ldi16	r4, 0x100
 11                    add	r4, r5
 f0 6b 48              st32	[r4], q1
 f2 42                 sub	r2, r2
 f0 07 00 3e           ldi16	r3, 0x3e00
 ff 21                 fmul	q0, q1
 f2 42                 sub	r2, r2
 f0 07 40 3f           ldi16	r3, 0x3f40
 ff 01                 fadd	q0, q1
 c4 40 01              ldi16	r4, 0x140
 11                    add	r4, r5
 f0 6b 08              st32	[r4], q0
 f4 ae                 inc16	r6
 c9 04                 addi.s8	r5, 0x4
 cd 40                 cmpi.s8	r5, 0x40
 d1 c2                 brne8	avm_test_main+24
 aa                    xor	r6, r6
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 d7 01                 sys	debug_break
 0e                    mov	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 af                    xor	r7, r7
 0b                    mov	r6, r7
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 00 01              ldi16	r4, 0x100
 13                    add	r4, r7
 f0 6a 48              ld32	q1, [r4]
 c4 40 01              ldi16	r4, 0x140
 13                    add	r4, r7
 f0 6a 08              ld32	q0, [r4]
 ff 24                 fmul	q1, q0
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 ff 02                 fadd	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 06                 fadd	q1, q2
 ff 34                 fdiv	q1, q0
 f2 30                 sub	r0, r0
 f0 05 00 c0           ldi16	r1, 0xc000
 ff c8 44              fcmp	r4, q1, q0
 cc ff                 cmpi.s8	r4, -0x1
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 f2 30                 sub	r0, r0
 f0 05 40 40           ldi16	r1, 0x4040
 ff c8 44              fcmp	r4, q1, q0
 cc 01                 cmpi.s8	r4, 0x1
 fb 10                 cmov.eq	r2, r0
 fb 19                 cmov.eq	r3, r1
 02                    mov	r4, r6
 f1 74                 zext8	r4
 ff c1 42              u16tof	q2, r4
 ff 06                 fadd	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 09                 fadd	q2, q1
 f4 ae                 inc16	r6
 cb 04                 addi.s8	r7, 0x4
 cf 40                 cmpi.s8	r7, 0x40
 d1 aa                 brne8	avm_test_main+98
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 d1 9b                 brne8	avm_test_main+94
 c6 80 01              ldi16	r6, 0x180
 f0 6b 8c              st32	[r6], q2
 ff c2 42              ftos16	r4, q2
 f0 5c 84 01           stm16	[0x184], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 d6 08                 adjsp	avm_halt+3
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
