
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/stack_array.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 stack_array.c
00000100 l     O .data	00000002 stack_seed
00000239 l     F .text	00000053 stack_kernel
00000102 l     O .data	00000002 stack_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000015 _start
00000215 g     F .text	00000024 avm_test_main
0000028c g     F .text	00000002 avm_halt

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
 d5 77                 call8	avm_halt

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
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 d0                 adjsp	_start+14
 a5                    xor	r5, r5
 f0 16 00              leasp	r6, 0x0
 19                    add	r6, r5
 78                    st16	[r6], r4
 c8 25                 addi.s8	r4, 0x25
 c9 02                 addi.s8	r5, 0x2
 cd 30                 cmpi.s8	r5, 0x30
 d1 f3                 brne8	stack_kernel+6
 a0                    xor	r4, r4
 04                    mov	r5, r4
 f4 03                 ldsp16	r7, [sp+0x0]
 08                    mov	r6, r4
 f0 10 00              leasp	r0, 0x0
 f2 06                 add	r0, r6
 f1 08                 mov	r1, r0
 f0 09 02              addi.s8	r1, 0x2
 f0 6c 52              ld16	r2, [r1]
 f9 5e                 xor	r2, r7
 f0 08 04              addi.s8	r0, 0x4
 f0 6c f0              ld16	r7, [r0]
 f9 ea                 xor	r7, r2
 ad                    xor	r7, r5
 f0 6d f2              st16	[r1], r7
 ca 02                 addi.s8	r6, 0x2
 ce 2c                 cmpi.s8	r6, 0x2c
 d1 df                 brne8	stack_kernel+24
 f4 ad                 inc16	r5
 cd 04                 cmpi.s8	r5, 0x4
 d1 d6                 brne8	stack_kernel+21
 a0                    xor	r4, r4
 04                    mov	r5, r4
 f0 16 00              leasp	r6, 0x0
 19                    add	r6, r5
 6a                    ld16	r6, [r6]
 12                    add	r4, r6
 c9 02                 addi.s8	r5, 0x2
 cd 30                 cmpi.s8	r5, 0x30
 d1 f4                 brne8	stack_kernel+65
 d6 30                 adjsp	avm_halt+44
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
