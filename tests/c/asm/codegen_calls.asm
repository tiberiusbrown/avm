
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_calls.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_calls.c
000002a2 l     F .text	00000002 add_values
00000298 l     F .text	0000000a call_indirect
000002a4 l     F .text	00000009 xor_values
00000293 l     F .text	00000005 many_arguments
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	0000017d avm_test_main
000002ad g     F .text	00000002 avm_halt

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
 e1 97 01              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 f0                 adjsp	_start+12
 c0 01                 ldi8	r4, 0x1
 f4 78                 stsp16	[sp+0xe], r4
 f0 31 0e              ldsp16	r1, [sp+0xe]
 c4 a2 02              ldi16	r4, 0x2a2
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 34 12              ldi16	r6, 0x1234
 c7 67 45              ldi16	r7, 0x4567
 e1 65 01              call16	call_indirect
 f1 04                 mov	r0, r4
 c4 a4 02              ldi16	r4, 0x2a4
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 cd ab              ldi16	r6, 0xabcd
 c7 0f 0f              ldi16	r7, 0xf0f
 e1 53 01              call16	call_indirect
 f4 70                 stsp16	[sp+0xc], r4
 f0 02 41              ldi8	r2, 0x41
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 03 30              ldi8	r3, 0x30
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 f1 21                 mov	r4, r1
 e1 39 01              call16	many_arguments
 08                    mov	r6, r4
 0e                    mov	r7, r6
 f1 77                 zext8	r7
 03                    mov	r4, r7
 fa 74                 lsr16i	r4, 0x4
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 2d                 cmp	r7, r1
 fc 25                 cmov.ult	r4, r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 30                 ldsp16	r4, [sp+0xc]
 f9 82                 xor	r4, r0
 f4 70                 stsp16	[sp+0xc], r4
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 ad                 or	r5, r3
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3d                 cmov.ult	r7, r5
 f4 53                 stsp16	[sp+0x4], r7
 f0 00 0f              ldi8	r0, 0xf
 0e                    mov	r7, r6
 f4 6b                 stsp16	[sp+0xa], r7
 07                    mov	r5, r7
 f9 a0                 and	r5, r0
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a0                 and	r5, r0
 09                    mov	r6, r5
 f9 cd                 or	r6, r3
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 40                 stsp16	[sp+0x0], r4
 f4 33                 ldsp16	r7, [sp+0xc]
 0b                    mov	r6, r7
 f9 c0                 and	r6, r0
 02                    mov	r4, r6
 f9 8d                 or	r4, r3
 06                    mov	r5, r6
 c9 37                 addi.s8	r5, 0x37
 ce 0a                 cmpi.s8	r6, 0xa
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 fa a8                 lsr16i	r7, 0x8
 f9 e0                 and	r7, r0
 03                    mov	r4, r7
 f9 8d                 or	r4, r3
 0b                    mov	r6, r7
 ca 37                 addi.s8	r6, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 34                 cmov.ult	r6, r4
 f4 2b                 ldsp16	r7, [sp+0xa]
 03                    mov	r4, r7
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 ad                 or	r5, r3
 c8 37                 addi.s8	r4, 0x37
 f0 04 00 a0           ldi16	r0, 0xa000
 f5 2c                 cmp	r7, r0
 fc 25                 cmov.ult	r4, r5
 f4 33                 ldsp16	r7, [sp+0xc]
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 f9 75                 or	r3, r5
 c9 37                 addi.s8	r5, 0x37
 f5 2c                 cmp	r7, r0
 fc 2b                 cmov.ult	r5, r3
 f0 00 3d              ldi8	r0, 0x3d
 b4                    push16	r4
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 bc                    pop16	r4
 d7 00                 sys	debug_putc
 c4 2e 84              ldi16	r4, 0x842e
 3c                    cmp	r7, r4
 f8 09                 cset.ne	r1
 f4 03                 ldsp16	r7, [sp+0x0]
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 23                 ldsp16	r7, [sp+0x8]
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f4 1b                 ldsp16	r7, [sp+0x6]
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c7 c6 01              ldi16	r7, 0x1c6
 f4 28                 ldsp16	r4, [sp+0xa]
 33                    cmp	r4, r7
 f8 0f                 cset.ne	r7
 f9 e5                 or	r7, r1
 c0 0a                 ldi8	r4, 0xa
 f4 70                 stsp16	[sp+0xc], r4
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 f4 68                 stsp16	[sp+0xa], r4
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 f4 58                 stsp16	[sp+0x6], r4
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 f4 60                 stsp16	[sp+0x8], r4
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 c0 42                 ldi8	r4, 0x42
 d7 00                 sys	debug_putc
 c0 38                 ldi8	r4, 0x38
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 d7 00                 sys	debug_putc
 c0 36                 ldi8	r4, 0x36
 f4 50                 stsp16	[sp+0x4], r4
 d7 00                 sys	debug_putc
 c1 37                 ldi8	r5, 0x37
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 c1 33                 ldi8	r5, 0x33
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d6 10                 adjsp	call_indirect+6
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
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
