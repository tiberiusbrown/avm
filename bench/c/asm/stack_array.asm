
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/stack_array.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 stack_array.c
00000100 l     O .data	00000002 stack_seed
00000238 l     F .text	0000004e stack_kernel
00000102 l     O .data	00000002 stack_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000023 avm_test_main
00000286 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 c1 46                 ldi8	r5, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2c                 tst16	r4
 fb 2e                 cmov.eq	r5, r6
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 71                 call8	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 f2 30                 sub	r0, r0
 d7 01                 sys	debug_break
 f1 08                 mov	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 f2 20                 add	r4, r0
 d5 13                 call8	stack_kernel
 f9 32                 xor	r1, r4
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 ef                 brne8	avm_test_main+8
 f0 59 02 01           stm16	[0x102], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<stack_kernel>:
 b1                    push16	r1
 b0                    push16	r0
 d6 d0                 adjsp	_start+12
 f0 15 00              leasp	r5, 0x0
 c2 18                 ldi8	r6, 0x18
 f7 4c                 st16	[r7+], r4
 c8 25                 addi.s8	r4, 0x25
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	stack_kernel+9
 a0                    xor	r4, r4
 c1 16                 ldi8	r5, 0x16
 f0 16 00              leasp	r6, 0x0
 f0 30 00              ldsp16	r0, [sp+0x0]
 0d                    mov	r7, r5
 ed 3c 22              ld16	r1, [r6+2]
 f9 22                 xor	r1, r0
 ed 1c 24              ld16	r0, [r6+4]
 f9 06                 xor	r0, r1
 f9 12                 xor	r0, r4
 ee 1c 22              st16	[r6+2], r0
 ca 02                 addi.s8	r6, 0x2
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 d1 e9                 brne8	stack_kernel+29
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 d1 dc                 brne8	stack_kernel+22
 a0                    xor	r4, r4
 f0 15 00              leasp	r5, 0x0
 c2 18                 ldi8	r6, 0x18
 f7 2f                 ld16	r7, [r7+]
 13                    add	r4, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f7                 brne8	stack_kernel+64
 d6 30                 adjsp	avm_halt+45
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
