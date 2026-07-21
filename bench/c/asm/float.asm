
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
00000216 g     F .text	000000e5 avm_test_main
000002fb g     F .text	00000002 avm_halt

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
 e1 e5 00              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f8                 adjsp	_start+20
 a0                    xor	r4, r4
 aa                    xor	r6, r6
 c7 80 3e              ldi16	r7, 0x3e80
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 c0 bf              ldi16	r7, 0xbfc0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 04                    mov	r5, r4
 f1 14                 mov	r2, r4
 f1 72                 zext8	r2
 ff c1 23              u16tof	q3, r2
 f2 67                 mov32	q1, q3
 f0 30 04              ldsp16	r0, [sp+0x4]
 f0 31 06              ldsp16	r1, [sp+0x6]
 ff 24                 fmul	q1, q0
 f0 30 00              ldsp16	r0, [sp+0x0]
 f0 31 02              ldsp16	r1, [sp+0x2]
 ff 04                 fadd	q1, q0
 f0 04 00 01           ldi16	r0, 0x100
 f2 05                 add	r0, r5
 f0 6b 40              st32	[r0], q1
 f0 00 00              ldi8	r0, 0x0
 f0 05 00 3e           ldi16	r1, 0x3e00
 ff 2c                 fmul	q3, q0
 f0 00 00              ldi8	r0, 0x0
 f0 05 40 3f           ldi16	r1, 0x3f40
 ff 0c                 fadd	q3, q0
 f0 04 40 01           ldi16	r0, 0x140
 f2 05                 add	r0, r5
 f0 6b c0              st32	[r0], q3
 f4 ac                 inc16	r4
 c9 04                 addi.s8	r5, 0x4
 cd 40                 cmpi.s8	r5, 0x40
 d1 bb                 brne8	avm_test_main+24
 aa                    xor	r6, r6
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 d7 01                 sys	debug_break
 0e                    mov	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f0 01 00              ldi8	r1, 0x0
 f1 01                 mov	r0, r1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c6 00 01              ldi16	r6, 0x100
 f2 29                 add	r6, r1
 f0 6a 4c              ld32	q1, [r6]
 c6 40 01              ldi16	r6, 0x140
 f2 29                 add	r6, r1
 f0 6a cc              ld32	q3, [r6]
 ff 27                 fmul	q1, q3
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 ff 0e                 fadd	q3, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 06                 fadd	q1, q2
 ff 37                 fdiv	q1, q3
 a0                    xor	r4, r4
 c5 00 c0              ldi16	r5, 0xc000
 ff c8 66              fcmp	r6, q1, q2
 ce ff                 cmpi.s8	r6, -0x1
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 a0                    xor	r4, r4
 c5 40 40              ldi16	r5, 0x4040
 ff c8 66              fcmp	r6, q1, q2
 ce 01                 cmpi.s8	r6, 0x1
 fb 14                 cmov.eq	r2, r4
 fb 1d                 cmov.eq	r3, r5
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 ff c1 42              u16tof	q2, r4
 ff 06                 fadd	q1, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 ff 09                 fadd	q2, q1
 f4 a8                 inc16	r0
 f0 09 04              addi.s8	r1, 0x4
 f0 0d 40              cmpi.s8	r1, 0x40
 d1 a9                 brne8	avm_test_main+108
 f4 03                 ldsp16	r7, [sp+0x0]
 f4 af                 inc16	r7
 0b                    mov	r6, r7
 f1 76                 zext8	r6
 ce 10                 cmpi.s8	r6, 0x10
 d1 97                 brne8	avm_test_main+101
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
