
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_calls.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_calls.c
00000287 l     F .text	00000002 add_values
0000027d l     F .text	0000000a call_indirect
00000289 l     F .text	00000009 xor_values
00000278 l     F .text	00000005 many_arguments
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	00000162 avm_test_main
00000292 g     F .text	00000002 avm_halt

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
 e1 7c 01              call16	avm_halt

<avm_test_main>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	-0x10
 c0 01                 ldi8	r4, 0x1
 f4 78                 stsp16	[sp+0xe], r4
 f0 31 0e              ldsp16	r1, [sp+0xe]
 c4 87 02              ldi16	r4, 0x287
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 34 12              ldi16	r6, 0x1234
 c7 67 45              ldi16	r7, 0x4567
 e1 4b 01              call16	call_indirect
 f1 04                 mov	r0, r4
 c4 89 02              ldi16	r4, 0x289
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cd ab              ldi16	r6, 0xabcd
 c7 0f 0f              ldi16	r7, 0xf0f
 e1 39 01              call16	call_indirect
 f4 70                 stsp16	[sp+0xc], r4
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 f0 02 30              ldi8	r2, 0x30
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 e1 22 01              call16	many_arguments
 08                    mov	r6, r4
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 2d                 cmp	r7, r1
 fc 25                 cmov.ult	r4, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f9 82                 xor	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3d                 cmov.ult	r7, r5
 f4 63                 stsp16	[sp+0x8], r7
 f0 00 0f              ldi8	r0, 0xf
 f4 6a                 stsp16	[sp+0xa], r6
 0e                    mov	r7, r6
 f9 e0                 and	r7, r0
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f4 4b                 stsp16	[sp+0x2], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 08                    mov	r6, r4
 f9 c0                 and	r6, r0
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 52                 stsp16	[sp+0x4], r6
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 41                 stsp16	[sp+0x0], r5
 f4 2a                 ldsp16	r6, [sp+0xa]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 28                 cmp	r6, r0
 fc 2c                 cmov.ult	r5, r4
 f4 30                 ldsp16	r4, [sp+0xc]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 f9 59                 or	r2, r6
 ca 37                 addi.s8	r6, 0x37
 f5 20                 cmp	r4, r0
 fc 32                 cmov.ult	r6, r2
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c4 2e 84              ldi16	r4, 0x842e
 f4 31                 ldsp16	r5, [sp+0xc]
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 c4 c6 01              ldi16	r4, 0x1c6
 f4 2b                 ldsp16	r7, [sp+0xa]
 3c                    cmp	r7, r4
 f8 0f                 cset.ne	r7
 9d                    or	r7, r5
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 42                 ldi8	r4, 0x42
 d7 00                 sys	debug_putc
 c0 38                 ldi8	r4, 0x38
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 d7 00                 sys	debug_putc
 c0 37                 ldi8	r4, 0x37
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d6 10                 adjsp	0x10
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<many_arguments>:
 c5 c5 01              ldi16	r5, 0x1c5
 11                    add	r4, r5
 ef                    ret

<call_indirect>:
 b1                    push16	r1
 b0                    push16	r0
 f2 62                 mov32	q0, q2
 02                    mov	r4, r6
 07                    mov	r5, r7
 e8                    callp	q0
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<add_values>:
 11                    add	r4, r5
 ef                    ret

<xor_values>:
 09                    mov	r6, r5
 fa 9d                 lsr16i	r6, 0xd
 15                    add	r5, r5
 15                    add	r5, r5
 15                    add	r5, r5
 99                    or	r6, r5
 a2                    xor	r4, r6
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
