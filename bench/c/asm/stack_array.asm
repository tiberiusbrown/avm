
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/stack_array.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 stack_array.c
00000100 l     O .data	00000002 stack_seed
00000239 l     F .text	00000059 stack_kernel
00000102 l     O .data	00000002 stack_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000024 avm_test_main
00000292 g     F .text	00000002 avm_halt

Disassembly of section .text:

<_start>:
 d5 13                 call8	avm_test_main
 04                    mov	r5, r4
 c0 46                 ldi8	r4, 0x46
 c2 50                 ldi8	r6, 0x50
 f6 2d                 tst16	r5
 fb 26                 cmov.eq	r4, r6
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 d5 7d                 call8	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 f0 00 00              ldi8	r0, 0x0
 d7 01                 sys	debug_break
 f1 08                 mov	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 f2 20                 add	r4, r0
 d5 13                 call8	stack_kernel
 f9 32                 xor	r1, r4
 f4 a8                 inc16	r0
 f0 0c 10              cmpi.s8	r0, 0x10
 d1 ef                 brne8	avm_test_main+9
 f0 59 02 01           stm16	[0x102], r1
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<stack_kernel>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d0                 adjsp	_start+15
 f0 15 00              leasp	r5, 0x0
 c2 18                 ldi8	r6, 0x18
 f7 4c                 st16	[r7+], r4
 c8 25                 addi.s8	r4, 0x25
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	stack_kernel+11
 a0                    xor	r4, r4
 f0 15 02              leasp	r5, 0x2
 c2 16                 ldi8	r6, 0x16
 f0 30 00              ldsp16	r0, [sp+0x0]
 0e                    mov	r7, r6
 f1 15                 mov	r2, r5
 f1 0a                 mov	r1, r2
 f0 6c 74              ld16	r3, [r2]
 f9 62                 xor	r3, r0
 f0 09 02              addi.s8	r1, 0x2
 f0 6c 12              ld16	r0, [r1]
 f9 0e                 xor	r0, r3
 f9 12                 xor	r0, r4
 f0 6d 14              st16	[r2], r0
 f4 b7                 dec16	r7
 f6 2f                 tst16	r7
 f1 11                 mov	r2, r1
 d1 e6                 brne8	stack_kernel+35
 f4 ac                 inc16	r4
 cc 04                 cmpi.s8	r4, 0x4
 d1 d8                 brne8	stack_kernel+27
 a0                    xor	r4, r4
 f0 15 00              leasp	r5, 0x0
 c2 18                 ldi8	r6, 0x18
 f7 2f                 ld16	r7, [r7+]
 13                    add	r4, r7
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f7                 brne8	stack_kernel+73
 d6 30                 adjsp	avm_halt+43
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
