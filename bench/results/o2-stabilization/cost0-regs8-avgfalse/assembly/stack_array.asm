
C:/Users/Brown/Documents/GitHub/avm/build/bench/c/stack_array.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 stack_array.c
00000100 l     O .data	00000002 stack_seed
000002e4 l     F .text	000000e4 stack_kernel
00000102 l     O .data	00000002 stack_result
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	000000ce avm_test_main
000003c8 g     F .text	00000002 avm_halt

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
 e1 b2 01              call16	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d7 01                 sys	debug_break
 f0 54 00 01           ldm16	r4, [0x100]
 e1 c3 00              call16	stack_kernel
 f1 04                 mov	r0, r4
 f0 54 00 01           ldm16	r4, [0x100]
 f4 ac                 inc16	r4
 e1 b8 00              call16	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 02                 addi.s8	r4, 0x2
 e1 ab 00              call16	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 03                 addi.s8	r4, 0x3
 e1 9e 00              call16	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 04                 addi.s8	r4, 0x4
 e1 91 00              call16	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 05                 addi.s8	r4, 0x5
 e1 84 00              call16	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 06                 addi.s8	r4, 0x6
 d5 78                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 07                 addi.s8	r4, 0x7
 d5 6c                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 08                 addi.s8	r4, 0x8
 d5 60                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 09                 addi.s8	r4, 0x9
 d5 54                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0a                 addi.s8	r4, 0xa
 d5 48                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0b                 addi.s8	r4, 0xb
 d5 3c                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0c                 addi.s8	r4, 0xc
 d5 30                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0d                 addi.s8	r4, 0xd
 d5 24                 call8	stack_kernel
 f1 0c                 mov	r1, r4
 f9 22                 xor	r1, r0
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0e                 addi.s8	r4, 0xe
 d5 18                 call8	stack_kernel
 f1 04                 mov	r0, r4
 f9 06                 xor	r0, r1
 f0 54 00 01           ldm16	r4, [0x100]
 c8 0f                 addi.s8	r4, 0xf
 d5 0c                 call8	stack_kernel
 f9 82                 xor	r4, r0
 f0 5c 02 01           stm16	[0x102], r4
 d7 01                 sys	debug_break
 a0                    xor	r4, r4
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<stack_kernel>:
 b0                    push16	r0
 d6 d0                 adjsp	avm_test_main+161
 f0 15 00              leasp	r5, 0x0
 c2 18                 ldi8	r6, 0x18
 f7 4c                 st16	[r5+], r4
 c8 25                 addi.s8	r4, 0x25
 f4 b6                 dec16	r6
 f6 2e                 tst16	r6
 d1 f6                 brne8	stack_kernel+8
 f0 14 00              leasp	r4, 0x0
 c1 16                 ldi8	r5, 0x16
 f4 02                 ldsp16	r6, [sp+0x0]
 ed f8 22              ld16	r7, [r4+2]
 ae                    xor	r7, r6
 ed d8 24              ld16	r6, [r4+4]
 ab                    xor	r6, r7
 ee d8 22              st16	[r4+2], r6
 c8 02                 addi.s8	r4, 0x2
 f4 b5                 dec16	r5
 f6 2d                 tst16	r5
 d1 ed                 brne8	stack_kernel+25
 c0 16                 ldi8	r4, 0x16
 f0 15 00              leasp	r5, 0x0
 f4 02                 ldsp16	r6, [sp+0x0]
 ed fa 22              ld16	r7, [r5+2]
 ae                    xor	r7, r6
 ed 1a 24              ld16	r0, [r5+4]
 f9 1e                 xor	r0, r7
 c2 01                 ldi8	r6, 0x1
 f9 c2                 xor	r6, r0
 ee da 22              st16	[r5+2], r6
 c9 02                 addi.s8	r5, 0x2
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 e8                 brne8	stack_kernel+51
 c0 16                 ldi8	r4, 0x16
 f0 15 00              leasp	r5, 0x0
 f4 02                 ldsp16	r6, [sp+0x0]
 ed fa 22              ld16	r7, [r5+2]
 ae                    xor	r7, r6
 ed 1a 24              ld16	r0, [r5+4]
 f9 1e                 xor	r0, r7
 c2 02                 ldi8	r6, 0x2
 f9 c2                 xor	r6, r0
 ee da 22              st16	[r5+2], r6
 c9 02                 addi.s8	r5, 0x2
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 e8                 brne8	stack_kernel+82
 c0 16                 ldi8	r4, 0x16
 f0 15 00              leasp	r5, 0x0
 f4 02                 ldsp16	r6, [sp+0x0]
 ed fa 22              ld16	r7, [r5+2]
 ae                    xor	r7, r6
 ed 1a 24              ld16	r0, [r5+4]
 f9 1e                 xor	r0, r7
 c2 03                 ldi8	r6, 0x3
 f9 c2                 xor	r6, r0
 ee da 22              st16	[r5+2], r6
 c9 02                 addi.s8	r5, 0x2
 f4 b4                 dec16	r4
 f6 2c                 tst16	r4
 d1 e8                 brne8	stack_kernel+113
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 14                    add	r5, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 11                    add	r4, r5
 f4 19                 ldsp16	r5, [sp+0x6]
 14                    add	r5, r4
 f4 20                 ldsp16	r4, [sp+0x8]
 11                    add	r4, r5
 f4 29                 ldsp16	r5, [sp+0xa]
 14                    add	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 11                    add	r4, r5
 f4 39                 ldsp16	r5, [sp+0xe]
 14                    add	r5, r4
 f0 34 10              ldsp16	r4, [sp+0x10]
 11                    add	r4, r5
 f0 35 12              ldsp16	r5, [sp+0x12]
 14                    add	r5, r4
 f0 34 14              ldsp16	r4, [sp+0x14]
 11                    add	r4, r5
 f0 35 16              ldsp16	r5, [sp+0x16]
 14                    add	r5, r4
 f0 34 18              ldsp16	r4, [sp+0x18]
 11                    add	r4, r5
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 14                    add	r5, r4
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 11                    add	r4, r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 14                    add	r5, r4
 f0 34 20              ldsp16	r4, [sp+0x20]
 11                    add	r4, r5
 f0 35 22              ldsp16	r5, [sp+0x22]
 14                    add	r5, r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 11                    add	r4, r5
 f0 35 26              ldsp16	r5, [sp+0x26]
 14                    add	r5, r4
 f0 34 28              ldsp16	r4, [sp+0x28]
 11                    add	r4, r5
 f0 35 2a              ldsp16	r5, [sp+0x2a]
 14                    add	r5, r4
 f0 36 2c              ldsp16	r6, [sp+0x2c]
 19                    add	r6, r5
 f0 34 2e              ldsp16	r4, [sp+0x2e]
 12                    add	r4, r6
 d6 30                 adjsp	avm_halt+46
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
