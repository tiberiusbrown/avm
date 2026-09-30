
debug_printf_float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 debug_printf_float.c
0000030a l     F .text	00000175 print_fixed
0000047f l     F .text	00000127 print_exponent
000005a6 l     F .text	00000201 print_general
000007a7 l     F .text	0000020c print_hex
000009b3 l     F .text	00000092 print_mixed
00000a5c l     O .rodata	00000022 .L.avm.flashstr.0
00000a7e l     O .rodata	0000002f .L.avm.flashstr.1
00000a45 l     F .text	00000015 float_from_bits
00000aad l     O .rodata	0000001c .L.avm.flashstr.2
00000ac9 l     O .rodata	0000001b .L.avm.flashstr.3
00000ae4 l     O .rodata	00000018 .L.avm.flashstr.4
00000afc l     O .rodata	00000022 .L.avm.flashstr.5
00000b1e l     O .rodata	00000030 .L.avm.flashstr.6
00000b4e l     O .rodata	00000011 .L.avm.flashstr.7
00000b5f l     O .rodata	00000023 .L.avm.flashstr.8
00000b82 l     O .rodata	0000001a .L.avm.flashstr.9
00000b9c l     O .rodata	00000033 .L.avm.flashstr.10
00000bcf l     O .rodata	00000018 .L.avm.flashstr.11
00000be7 l     O .rodata	00000018 .L.avm.flashstr.12
00000bff l     O .rodata	0000001f .L.avm.flashstr.13
00000c1e l     O .rodata	0000002d .L.avm.flashstr.14
00000c4b l     O .rodata	00000018 .L.avm.flashstr.15
00000c63 l     O .rodata	00000018 .L.avm.flashstr.16
00000c7b l     O .rodata	0000002c .L.avm.flashstr.17
00000ca7 l     O .rodata	0000002f .L.avm.flashstr.18
00000cd6 l     O .rodata	00000028 .L.avm.flashstr.19
00000cfe l     O .rodata	00000023 .L.avm.flashstr.20
00000100 l     O .data	00000003 .L.str
00000d21 l     O .rodata	00000018 .L.avm.flashstr.21
00000000 l    df *ABS*	00000000 runtime.c
00000d39 l       .init_array	00000000 .hidden __init_array_end
00000d39 l       .init_array	00000000 .hidden __init_array_start
00000d39 l       .fini_array	00000000 .hidden __fini_array_start
00000d39 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000033 avm_test_main
00000a5a g     F .text	00000002 avm_halt
00000000  w      *UND*	00000000 __avm_run_local_dtors

Disassembly of section .text:

<_start>:
 b0                    push16	r0
 d5 1b                 call8	avm_run_constructors
 e1 d1 00              call16	avm_test_main
 f0 00 46              ldi8	r0, 0x46
 c1 50                 ldi8	r5, 0x50
 f6 2c                 tst16	r4
 fb 05                 cmov.eq	r0, r5
 d5 57                 call8	avm_run_destructors
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 d7 01                 sys	debug_break
 e1 3c 08              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 39 0d              ldi16	r4, 0xd39
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 39 0d              ldi16	r6, 0xd39
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 39 0d           ldi16	r0, 0xd39
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 39 0d           ldi16	r2, 0xd39
 f0 03 00              ldi8	r3, 0x0
 f1 73                 zext8	r3
 f0 63 80              ldp24	q2, [q0]
 ea                    callp	q2
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 62                 add32	q0, q2
 f2 68                 mov32	q2, q0
 f1 75                 zext8	r5
 f0 69 84              cmp32	q2, q1
 d1 ed                 brne8	avm_run_constructors+48
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_run_destructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+23
 e1 81 fd              call16	-639
 c4 39 0d              ldi16	r4, 0xd39
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 39 0d              ldi16	r6, 0xd39
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 39 0d           ldi16	r2, 0xd39
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 39 0d           ldi16	r0, 0xd39
 f0 01 00              ldi8	r1, 0x0
 f1 71                 zext8	r1
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 f7 66                 add32	q1, q2
 f0 63 84              ldp24	q2, [q1]
 ea                    callp	q2
 f2 69                 mov32	q2, q1
 f1 75                 zext8	r5
 f0 69 80              cmp32	q2, q0
 d1 ed                 brne8	avm_run_destructors+68
 c4 00 00              ldi16	r4, 0x0
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 aa                    xor	r6, r6
 af                    xor	r7, r7
 f0 69 8c              cmp32	q2, q3
 d0 03                 breq8	avm_run_destructors+104
 e1 30 fd              call16	-720
 d6 04                 adjsp	0x4
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_test_main>:
 d6 fe                 adjsp	-0x2
 d5 2f                 call8	print_fixed
 f4 40                 stsp16	[sp+0x0], r4
 e1 9f 01              call16	print_exponent
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 91                    or	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 e1 bd 02              call16	print_general
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 91                    or	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 e1 b5 04              call16	print_hex
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 91                    or	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 e1 b8 06              call16	print_mixed
 04                    mov	r5, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 91                    or	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 d6 02                 adjsp	0x2
 ef                    ret

<print_fixed>:
 d6 ac                 adjsp	-0x54
 a0                    xor	r4, r4
 f0 3c 52              stsp16	[sp+0x52], r4
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 3d 42              stsp16	[sp+0x42], r5
 f0 3c 44              stsp16	[sp+0x44], r4
 f0 3d 46              stsp16	[sp+0x46], r5
 a0                    xor	r4, r4
 c5 46 c1              ldi16	r5, 0xc146
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 3d 4a              stsp16	[sp+0x4a], r5
 c4 52 06              ldi16	r4, 0x652
 c5 9e 3f              ldi16	r5, 0x3f9e
 f0 3c 4c              stsp16	[sp+0x4c], r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 c4 5c 0a              ldi16	r4, 0xa5c
 c1 00                 ldi8	r5, 0x0
 f0 16 3c              leasp	r6, 0x3c
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 34 50              ldsp16	r4, [sp+0x50]
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 0d                 cset.ne	r5
 f0 34 52              ldsp16	r4, [sp+0x52]
 91                    or	r4, r5
 f0 3c 52              stsp16	[sp+0x52], r4
 a0                    xor	r4, r4
 c5 48 c1              ldi16	r5, 0xc148
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 a0                    xor	r4, r4
 c5 60 40              ldi16	r5, 0x4060
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 c4 f6 ff              ldi16	r4, 0xfff6
 f0 3c 34              stsp16	[sp+0x34], r4
 c0 03                 ldi8	r4, 0x3
 f0 3c 36              stsp16	[sp+0x36], r4
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 c4 7e 0a              ldi16	r4, 0xa7e
 c1 00                 ldi8	r5, 0x0
 f0 16 28              leasp	r6, 0x28
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 34 50              ldsp16	r4, [sp+0x50]
 cc 3a                 cmpi.s8	r4, 0x3a
 f8 0d                 cset.ne	r5
 f0 34 52              ldsp16	r4, [sp+0x52]
 91                    or	r4, r5
 f0 3c 52              stsp16	[sp+0x52], r4
 a0                    xor	r4, r4
 c5 80 4b              ldi16	r5, 0x4b80
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c4 ec 78              ldi16	r4, 0x78ec
 c5 ad 60              ldi16	r5, 0x60ad
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 c4 bd 37              ldi16	r4, 0x37bd
 c5 86 35              ldi16	r5, 0x3586
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 e1 6b 06              call16	float_from_bits
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 c4 ad 0a              ldi16	r4, 0xaad
 c1 00                 ldi8	r5, 0x0
 f0 16 18              leasp	r6, 0x18
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 34 50              ldsp16	r4, [sp+0x50]
 cc 44                 cmpi.s8	r4, 0x44
 f8 0d                 cset.ne	r5
 f0 34 52              ldsp16	r4, [sp+0x52]
 91                    or	r4, r5
 f0 3c 52              stsp16	[sp+0x52], r4
 c4 00 e0              ldi16	r4, 0xe000
 c5 79 44              ldi16	r5, 0x4479
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c4 00 f0              ldi16	r4, 0xf000
 c5 1f 41              ldi16	r5, 0x411f
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c6 00 e0              ldi16	r6, 0xe000
 c7 7f 3f              ldi16	r7, 0x3f7f
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c4 c9 0a              ldi16	r4, 0xac9
 c1 00                 ldi8	r5, 0x0
 f0 16 08              leasp	r6, 0x8
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 34 50              ldsp16	r4, [sp+0x50]
 cc 20                 cmpi.s8	r4, 0x20
 f8 0d                 cset.ne	r5
 f0 34 52              ldsp16	r4, [sp+0x52]
 91                    or	r4, r5
 f0 3c 52              stsp16	[sp+0x52], r4
 a0                    xor	r4, r4
 c5 20 40              ldi16	r5, 0x4020
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 c5 20 c0              ldi16	r5, 0xc020
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 e4 0a              ldi16	r4, 0xae4
 c1 00                 ldi8	r5, 0x0
 f0 16 00              leasp	r6, 0x0
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 34 50              ldsp16	r4, [sp+0x50]
 cc 12                 cmpi.s8	r4, 0x12
 f8 0d                 cset.ne	r5
 f0 34 52              ldsp16	r4, [sp+0x52]
 91                    or	r4, r5
 f0 3c 52              stsp16	[sp+0x52], r4
 f0 34 52              ldsp16	r4, [sp+0x52]
 d6 54                 adjsp	0x54
 ef                    ret

<print_exponent>:
 d6 c0                 adjsp	-0x40
 a0                    xor	r4, r4
 f0 3c 3e              stsp16	[sp+0x3e], r4
 a0                    xor	r4, r4
 c5 f7 42              ldi16	r5, 0x42f7
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 f0 3c 30              stsp16	[sp+0x30], r4
 f0 3d 32              stsp16	[sp+0x32], r5
 a0                    xor	r4, r4
 c5 80 47              ldi16	r5, 0x4780
 f0 3c 34              stsp16	[sp+0x34], r4
 f0 3d 36              stsp16	[sp+0x36], r5
 c4 52 06              ldi16	r4, 0x652
 c5 9e 3f              ldi16	r5, 0x3f9e
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 c4 fc 0a              ldi16	r4, 0xafc
 c1 00                 ldi8	r5, 0x0
 f0 16 28              leasp	r6, 0x28
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 cc 3e                 cmpi.s8	r4, 0x3e
 f8 0d                 cset.ne	r5
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 91                    or	r4, r5
 f0 3c 3e              stsp16	[sp+0x3e], r4
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 a0                    xor	r4, r4
 c5 00 bd              ldi16	r5, 0xbd00
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 c0 0e                 ldi8	r4, 0xe
 f0 3c 20              stsp16	[sp+0x20], r4
 c0 04                 ldi8	r4, 0x4
 f0 3c 22              stsp16	[sp+0x22], r4
 a0                    xor	r4, r4
 c5 00 3f              ldi16	r5, 0x3f00
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 c4 1e 0b              ldi16	r4, 0xb1e
 c1 00                 ldi8	r5, 0x0
 f0 16 14              leasp	r6, 0x14
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 cc 4b                 cmpi.s8	r4, 0x4b
 f8 0d                 cset.ne	r5
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 91                    or	r4, r5
 f0 3c 3e              stsp16	[sp+0x3e], r4
 c4 00 e0              ldi16	r4, 0xe000
 c5 7f 3f              ldi16	r5, 0x3f7f
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 c4 4e 0b              ldi16	r4, 0xb4e
 c1 00                 ldi8	r5, 0x0
 f0 16 10              leasp	r6, 0x10
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 cc 11                 cmpi.s8	r4, 0x11
 f8 0d                 cset.ne	r5
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 91                    or	r4, r5
 f0 3c 3e              stsp16	[sp+0x3e], r4
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 e1 ea 04              call16	float_from_bits
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 e1 e0 04              call16	float_from_bits
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 e1 d4 04              call16	float_from_bits
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 e1 ca 04              call16	float_from_bits
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 5f 0b              ldi16	r4, 0xb5f
 c1 00                 ldi8	r5, 0x0
 f0 16 00              leasp	r6, 0x0
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 34 3c              ldsp16	r4, [sp+0x3c]
 cc 44                 cmpi.s8	r4, 0x44
 f8 0d                 cset.ne	r5
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 91                    or	r4, r5
 f0 3c 3e              stsp16	[sp+0x3e], r4
 f0 34 3e              ldsp16	r4, [sp+0x3e]
 d6 40                 adjsp	0x40
 ef                    ret

<print_general>:
 b1                    push16	r1
 b0                    push16	r0
 d6 90                 adjsp	-0x70
 a0                    xor	r4, r4
 f0 3c 6e              stsp16	[sp+0x6e], r4
 c4 66 e6              ldi16	r4, 0xe666
 c5 f6 42              ldi16	r5, 0x42f6
 f0 3c 58              stsp16	[sp+0x58], r4
 f0 3d 5a              stsp16	[sp+0x5a], r5
 c4 5b 72              ldi16	r4, 0x725b
 c5 01 39              ldi16	r5, 0x3901
 f0 3c 5c              stsp16	[sp+0x5c], r4
 f0 3d 5e              stsp16	[sp+0x5e], r5
 c4 5f 1d              ldi16	r4, 0x1d5f
 c5 4f 37              ldi16	r5, 0x374f
 f0 3c 60              stsp16	[sp+0x60], r4
 f0 3d 62              stsp16	[sp+0x62], r5
 c4 38 b4              ldi16	r4, 0xb438
 c5 96 49              ldi16	r5, 0x4996
 f0 3c 64              stsp16	[sp+0x64], r4
 f0 3d 66              stsp16	[sp+0x66], r5
 c4 00 3e              ldi16	r4, 0x3e00
 c5 1c 46              ldi16	r5, 0x461c
 f0 3c 68              stsp16	[sp+0x68], r4
 f0 3d 6a              stsp16	[sp+0x6a], r5
 c4 82 0b              ldi16	r4, 0xb82
 c1 00                 ldi8	r5, 0x0
 f0 16 58              leasp	r6, 0x58
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 6c              stsp16	[sp+0x6c], r4
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 cc 37                 cmpi.s8	r4, 0x37
 f8 0d                 cset.ne	r5
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 91                    or	r4, r5
 f0 3c 6e              stsp16	[sp+0x6e], r4
 c4 cd cc              ldi16	r4, 0xcccd
 c5 44 41              ldi16	r5, 0x4144
 f0 3c 40              stsp16	[sp+0x40], r4
 f0 3d 42              stsp16	[sp+0x42], r5
 c6 52 06              ldi16	r6, 0x652
 c7 9e 3f              ldi16	r7, 0x3f9e
 f0 3e 44              stsp16	[sp+0x44], r6
 f0 3f 46              stsp16	[sp+0x46], r7
 f0 3c 48              stsp16	[sp+0x48], r4
 f0 3d 4a              stsp16	[sp+0x4a], r5
 c4 e5 07              ldi16	r4, 0x7e5
 c5 4f 37              ldi16	r5, 0x374f
 f0 3c 4c              stsp16	[sp+0x4c], r4
 f0 3d 4e              stsp16	[sp+0x4e], r5
 c4 cd cc              ldi16	r4, 0xcccd
 c5 f6 42              ldi16	r5, 0x42f6
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 3d 52              stsp16	[sp+0x52], r5
 c4 00 20              ldi16	r4, 0x2000
 c5 f1 47              ldi16	r5, 0x47f1
 f0 3c 54              stsp16	[sp+0x54], r4
 f0 3d 56              stsp16	[sp+0x56], r5
 c4 9c 0b              ldi16	r4, 0xb9c
 c1 00                 ldi8	r5, 0x0
 f0 16 40              leasp	r6, 0x40
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 6c              stsp16	[sp+0x6c], r4
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 cc 48                 cmpi.s8	r4, 0x48
 f8 0d                 cset.ne	r5
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 91                    or	r4, r5
 f0 3c 6e              stsp16	[sp+0x6e], r4
 c4 69 b4              ldi16	r4, 0xb469
 c5 d1 38              ldi16	r5, 0x38d1
 e1 ce 03              call16	float_from_bits
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 c4 cf 0b              ldi16	r4, 0xbcf
 c1 00                 ldi8	r5, 0x0
 f0 16 3c              leasp	r6, 0x3c
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 6c              stsp16	[sp+0x6c], r4
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 cc 19                 cmpi.s8	r4, 0x19
 f8 0d                 cset.ne	r5
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 91                    or	r4, r5
 f0 3c 6e              stsp16	[sp+0x6e], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 3c 2c              stsp16	[sp+0x2c], r4
 f0 3d 2e              stsp16	[sp+0x2e], r5
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 e1 90 03              call16	float_from_bits
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 38 30              stsp16	[sp+0x30], r0
 f0 39 32              stsp16	[sp+0x32], r1
 f0 3e 34              stsp16	[sp+0x34], r6
 f0 3f 36              stsp16	[sp+0x36], r7
 e1 77 03              call16	float_from_bits
 f0 3c 38              stsp16	[sp+0x38], r4
 f0 3d 3a              stsp16	[sp+0x3a], r5
 c4 e7 0b              ldi16	r4, 0xbe7
 c1 00                 ldi8	r5, 0x0
 f0 16 2c              leasp	r6, 0x2c
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 6c              stsp16	[sp+0x6c], r4
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 cc 1a                 cmpi.s8	r4, 0x1a
 f8 0d                 cset.ne	r5
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 91                    or	r4, r5
 f0 3c 6e              stsp16	[sp+0x6e], r4
 c4 f9 02              ldi16	r4, 0x2f9
 c5 15 50              ldi16	r5, 0x5015
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 3d 26              stsp16	[sp+0x26], r5
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 c4 ff 0b              ldi16	r4, 0xbff
 c1 00                 ldi8	r5, 0x0
 f0 16 24              leasp	r6, 0x24
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 6c              stsp16	[sp+0x6c], r4
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 0d                 cset.ne	r5
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 91                    or	r4, r5
 f0 3c 6e              stsp16	[sp+0x6e], r4
 a0                    xor	r4, r4
 c5 80 7f              ldi16	r5, 0x7f80
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e1 12 03              call16	float_from_bits
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 c5 80 ff              ldi16	r5, 0xff80
 e1 07 03              call16	float_from_bits
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 e1 f8 02              call16	float_from_bits
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 e1 e9 02              call16	float_from_bits
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 c0 01                 ldi8	r4, 0x1
 c5 c0 ff              ldi16	r5, 0xffc0
 e1 db 02              call16	float_from_bits
 f0 3c 1c              stsp16	[sp+0x1c], r4
 f0 3d 1e              stsp16	[sp+0x1e], r5
 c0 01                 ldi8	r4, 0x1
 c5 c0 7f              ldi16	r5, 0x7fc0
 e1 cd 02              call16	float_from_bits
 f0 3c 20              stsp16	[sp+0x20], r4
 f0 3d 22              stsp16	[sp+0x22], r5
 c4 1e 0c              ldi16	r4, 0xc1e
 c1 00                 ldi8	r5, 0x0
 f0 16 0c              leasp	r6, 0xc
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 6c              stsp16	[sp+0x6c], r4
 f0 34 6c              ldsp16	r4, [sp+0x6c]
 cc 36                 cmpi.s8	r4, 0x36
 f8 0d                 cset.ne	r5
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 91                    or	r4, r5
 f0 3c 6e              stsp16	[sp+0x6e], r4
 f0 34 6e              ldsp16	r4, [sp+0x6e]
 d6 70                 adjsp	0x70
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<print_hex>:
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 80                 adjsp	-0x80
 d6 fc                 adjsp	-0x4
 a0                    xor	r4, r4
 f0 3c 82              stsp16	[sp+0x82], r4
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f0 3c 6c              stsp16	[sp+0x6c], r4
 f0 3d 6e              stsp16	[sp+0x6e], r5
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 3c 70              stsp16	[sp+0x70], r4
 f0 3d 72              stsp16	[sp+0x72], r5
 c4 cd cc              ldi16	r4, 0xcccd
 c5 cc 3d              ldi16	r5, 0x3dcc
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 3c 74              stsp16	[sp+0x74], r4
 f0 3d 76              stsp16	[sp+0x76], r5
 f0 3c 78              stsp16	[sp+0x78], r4
 f0 3d 7a              stsp16	[sp+0x7a], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 e1 58 02              call16	float_from_bits
 f0 3c 7c              stsp16	[sp+0x7c], r4
 f0 3d 7e              stsp16	[sp+0x7e], r5
 c4 4b 0c              ldi16	r4, 0xc4b
 c1 00                 ldi8	r5, 0x0
 f0 16 6c              leasp	r6, 0x6c
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 f0 3c 80              stsp16	[sp+0x80], r4
 f0 34 80              ldsp16	r4, [sp+0x80]
 cc 44                 cmpi.s8	r4, 0x44
 f8 0d                 cset.ne	r5
 f0 34 82              ldsp16	r4, [sp+0x82]
 91                    or	r4, r5
 f0 3c 82              stsp16	[sp+0x82], r4
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 f0 3c 58              stsp16	[sp+0x58], r4
 f0 3d 5a              stsp16	[sp+0x5a], r5
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 e1 1f 02              call16	float_from_bits
 f0 3c 5c              stsp16	[sp+0x5c], r4
 f0 3d 5e              stsp16	[sp+0x5e], r5
 a0                    xor	r4, r4
 c1 40                 ldi8	r5, 0x40
 e1 13 02              call16	float_from_bits
 f0 3c 60              stsp16	[sp+0x60], r4
 f0 3d 62              stsp16	[sp+0x62], r5
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 e1 07 02              call16	float_from_bits
 f0 3c 64              stsp16	[sp+0x64], r4
 f0 3d 66              stsp16	[sp+0x66], r5
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 e1 fa 01              call16	float_from_bits
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 0b                 ldsp16	r7, [sp+0x2]
 f2 62                 mov32	q0, q2
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f0 38 68              stsp16	[sp+0x68], r0
 f0 39 6a              stsp16	[sp+0x6a], r1
 f0 04 63 0c           ldi16	r0, 0xc63
 f0 01 00              ldi8	r1, 0x0
 f0 12 58              leasp	r2, 0x58
 b4                    push16	r4
 b6                    push16	r6
 b7                    push16	r7
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 d7 37                 sys	debug_printfv_p
 f1 04                 mov	r0, r4
 bf                    pop16	r7
 be                    pop16	r6
 bc                    pop16	r4
 f0 38 80              stsp16	[sp+0x80], r0
 f0 30 80              ldsp16	r0, [sp+0x80]
 f0 0c 32              cmpi.s8	r0, 0x32
 f8 09                 cset.ne	r1
 f0 30 82              ldsp16	r0, [sp+0x82]
 f9 05                 or	r0, r1
 f0 38 82              stsp16	[sp+0x82], r0
 f0 3e 40              stsp16	[sp+0x40], r6
 f0 3f 42              stsp16	[sp+0x42], r7
 f2 30                 sub	r0, r0
 f0 05 a0 3f           ldi16	r1, 0x3fa0
 f0 38 44              stsp16	[sp+0x44], r0
 f0 39 46              stsp16	[sp+0x46], r1
 f2 30                 sub	r0, r0
 f0 05 84 3f           ldi16	r1, 0x3f84
 f0 38 48              stsp16	[sp+0x48], r0
 f0 39 4a              stsp16	[sp+0x4a], r1
 f2 30                 sub	r0, r0
 f0 05 8c 3f           ldi16	r1, 0x3f8c
 f0 38 4c              stsp16	[sp+0x4c], r0
 f0 39 4e              stsp16	[sp+0x4e], r1
 f0 3c 50              stsp16	[sp+0x50], r4
 f0 3d 52              stsp16	[sp+0x52], r5
 f0 3e 54              stsp16	[sp+0x54], r6
 f0 3f 56              stsp16	[sp+0x56], r7
 f0 04 7b 0c           ldi16	r0, 0xc7b
 f0 01 00              ldi8	r1, 0x0
 f0 12 40              leasp	r2, 0x40
 b4                    push16	r4
 b6                    push16	r6
 b7                    push16	r7
 f1 28                 mov	r6, r0
 f1 2d                 mov	r7, r1
 d7 37                 sys	debug_printfv_p
 f1 04                 mov	r0, r4
 bf                    pop16	r7
 be                    pop16	r6
 bc                    pop16	r4
 f0 38 80              stsp16	[sp+0x80], r0
 f0 30 80              ldsp16	r0, [sp+0x80]
 f0 0c 47              cmpi.s8	r0, 0x47
 f8 09                 cset.ne	r1
 f0 30 82              ldsp16	r0, [sp+0x82]
 f9 05                 or	r0, r1
 f0 38 82              stsp16	[sp+0x82], r0
 f0 3e 2c              stsp16	[sp+0x2c], r6
 f0 3f 2e              stsp16	[sp+0x2e], r7
 aa                    xor	r6, r6
 c7 20 c0              ldi16	r7, 0xc020
 f0 3e 30              stsp16	[sp+0x30], r6
 f0 3f 32              stsp16	[sp+0x32], r7
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f0 3e 34              stsp16	[sp+0x34], r6
 f0 3f 36              stsp16	[sp+0x36], r7
 c2 10                 ldi8	r6, 0x10
 f0 3e 38              stsp16	[sp+0x38], r6
 c2 04                 ldi8	r6, 0x4
 f0 3e 3a              stsp16	[sp+0x3a], r6
 f0 3c 3c              stsp16	[sp+0x3c], r4
 f0 3d 3e              stsp16	[sp+0x3e], r5
 c4 a7 0c              ldi16	r4, 0xca7
 c1 00                 ldi8	r5, 0x0
 f0 16 2c              leasp	r6, 0x2c
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 f0 3c 80              stsp16	[sp+0x80], r4
 f0 34 80              ldsp16	r4, [sp+0x80]
 cc 52                 cmpi.s8	r4, 0x52
 f8 0d                 cset.ne	r5
 f0 34 82              ldsp16	r4, [sp+0x82]
 91                    or	r4, r5
 f0 3c 82              stsp16	[sp+0x82], r4
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 e1 0f 01              call16	float_from_bits
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 e1 fd 00              call16	float_from_bits
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 20                 ldsp16	r4, [sp+0x8]
 f4 29                 ldsp16	r5, [sp+0xa]
 f0 3e 18              stsp16	[sp+0x18], r6
 f0 3f 1a              stsp16	[sp+0x1a], r7
 e1 ee 00              call16	float_from_bits
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3f 1e              stsp16	[sp+0x1e], r7
 e1 df 00              call16	float_from_bits
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f4 30                 ldsp16	r4, [sp+0xc]
 f4 39                 ldsp16	r5, [sp+0xe]
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 3f 22              stsp16	[sp+0x22], r7
 e1 d0 00              call16	float_from_bits
 08                    mov	r6, r4
 0d                    mov	r7, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 3f 26              stsp16	[sp+0x26], r7
 f0 3c 28              stsp16	[sp+0x28], r4
 f0 3d 2a              stsp16	[sp+0x2a], r5
 c4 d6 0c              ldi16	r4, 0xcd6
 c1 00                 ldi8	r5, 0x0
 f0 16 14              leasp	r6, 0x14
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 f0 3c 80              stsp16	[sp+0x80], r4
 f0 34 80              ldsp16	r4, [sp+0x80]
 cc 50                 cmpi.s8	r4, 0x50
 f8 0d                 cset.ne	r5
 f0 34 82              ldsp16	r4, [sp+0x82]
 91                    or	r4, r5
 f0 3c 82              stsp16	[sp+0x82], r4
 f0 34 82              ldsp16	r4, [sp+0x82]
 d6 7f                 adjsp	0x7f
 d6 05                 adjsp	0x5
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<print_mixed>:
 d6 da                 adjsp	-0x26
 a0                    xor	r4, r4
 f0 3c 24              stsp16	[sp+0x24], r4
 c6 ff ff              ldi16	r6, 0xffff
 f0 3e 10              stsp16	[sp+0x10], r6
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 3e 1c              stsp16	[sp+0x1c], r6
 f0 3c 1e              stsp16	[sp+0x1e], r4
 f0 3d 20              stsp16	[sp+0x20], r5
 c4 fe 0c              ldi16	r4, 0xcfe
 c1 00                 ldi8	r5, 0x0
 f0 16 10              leasp	r6, 0x10
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 cc 29                 cmpi.s8	r4, 0x29
 f8 0d                 cset.ne	r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 91                    or	r4, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 a0                    xor	r4, r4
 c5 50 40              ldi16	r5, 0x4050
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 c4 f9 ff              ldi16	r4, 0xfff9
 f4 50                 stsp16	[sp+0x4], r4
 a0                    xor	r4, r4
 c5 c0 40              ldi16	r5, 0x40c0
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 00 01              ldi16	r4, 0x100
 f4 68                 stsp16	[sp+0xa], r4
 a0                    xor	r4, r4
 c5 00 3e              ldi16	r5, 0x3e00
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 c4 21 0d              ldi16	r4, 0xd21
 c1 00                 ldi8	r5, 0x0
 f0 16 00              leasp	r6, 0x0
 b2                    push16	r2
 0d                    mov	r7, r5
 f1 16                 mov	r2, r6
 08                    mov	r6, r4
 d7 37                 sys	debug_printfv_p
 ba                    pop16	r2
 f0 3c 22              stsp16	[sp+0x22], r4
 f0 34 22              ldsp16	r4, [sp+0x22]
 cc 23                 cmpi.s8	r4, 0x23
 f8 0d                 cset.ne	r5
 f0 34 24              ldsp16	r4, [sp+0x24]
 91                    or	r4, r5
 f0 3c 24              stsp16	[sp+0x24], r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 d6 26                 adjsp	0x26
 ef                    ret

<float_from_bits>:
 d6 f8                 adjsp	-0x8
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 10                 ldsp16	r4, [sp+0x4]
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f4 00                 ldsp16	r4, [sp+0x0]
 f4 09                 ldsp16	r5, [sp+0x2]
 d6 08                 adjsp	0x8
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
