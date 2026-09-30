
debug_printf_float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 debug_printf_float.c
000002fa l     F .text	00000127 print_fixed
00000421 l     F .text	000000c4 print_exponent
000004e5 l     F .text	0000015d print_general
00000642 l     F .text	00000155 print_hex
00000797 l     F .text	00000069 print_mixed
00000802 l     O .rodata	00000022 .L.avm.flashstr.0
00000824 l     O .rodata	0000002f .L.avm.flashstr.1
00000853 l     O .rodata	0000001c .L.avm.flashstr.2
0000086f l     O .rodata	0000001b .L.avm.flashstr.3
0000088a l     O .rodata	00000018 .L.avm.flashstr.4
000008a2 l     O .rodata	00000022 .L.avm.flashstr.5
000008c4 l     O .rodata	00000030 .L.avm.flashstr.6
000008f4 l     O .rodata	00000011 .L.avm.flashstr.7
00000905 l     O .rodata	00000023 .L.avm.flashstr.8
00000928 l     O .rodata	0000001a .L.avm.flashstr.9
00000942 l     O .rodata	00000033 .L.avm.flashstr.10
00000975 l     O .rodata	00000018 .L.avm.flashstr.11
0000098d l     O .rodata	00000018 .L.avm.flashstr.12
000009a5 l     O .rodata	0000001f .L.avm.flashstr.13
000009c4 l     O .rodata	0000002d .L.avm.flashstr.14
000009f1 l     O .rodata	00000018 .L.avm.flashstr.15
00000a09 l     O .rodata	00000018 .L.avm.flashstr.16
00000a21 l     O .rodata	0000002c .L.avm.flashstr.17
00000a4d l     O .rodata	0000002f .L.avm.flashstr.18
00000a7c l     O .rodata	00000028 .L.avm.flashstr.19
00000aa4 l     O .rodata	00000023 .L.avm.flashstr.20
00000100 l     O .data	00000003 .L.str
00000ac7 l     O .rodata	00000018 .L.avm.flashstr.21
00000000 l    df *ABS*	00000000 runtime.c
00000adf l       .init_array	00000000 .hidden __init_array_end
00000adf l       .init_array	00000000 .hidden __init_array_start
00000adf l       .fini_array	00000000 .hidden __fini_array_start
00000adf l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000023 avm_test_main
00000800 g     F .text	00000002 avm_halt
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
 e1 e2 05              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 df 0a              ldi16	r4, 0xadf
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 df 0a              ldi16	r6, 0xadf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 df 0a           ldi16	r0, 0xadf
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 df 0a           ldi16	r2, 0xadf
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
 c4 df 0a              ldi16	r4, 0xadf
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 df 0a              ldi16	r6, 0xadf
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 df 0a           ldi16	r2, 0xadf
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 df 0a           ldi16	r0, 0xadf
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
 b1                    push16	r1
 b0                    push16	r0
 d5 1f                 call8	print_fixed
 f1 04                 mov	r0, r4
 e1 41 01              call16	print_exponent
 f1 0c                 mov	r1, r4
 f9 21                 or	r1, r0
 e1 fe 01              call16	print_general
 f1 04                 mov	r0, r4
 f9 05                 or	r0, r1
 e1 54 03              call16	print_hex
 f1 0c                 mov	r1, r4
 f9 21                 or	r1, r0
 e1 a2 04              call16	print_mixed
 f9 85                 or	r4, r1
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<print_fixed>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 ea                 adjsp	-0x16
 c4 52 06              ldi16	r4, 0x652
 c5 9e 3f              ldi16	r5, 0x3f9e
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 a0                    xor	r4, r4
 c5 46 c1              ldi16	r5, 0xc146
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 14 02              leasp	r4, 0x2
 c6 02 08              ldi16	r6, 0x802
 c3 00                 ldi8	r7, 0x0
 f1 14                 mov	r2, r4
 d7 37                 sys	debug_printfv_p
 f1 04                 mov	r0, r4
 aa                    xor	r6, r6
 c7 a0 3f              ldi16	r7, 0x3fa0
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 c6 f6 ff              ldi16	r6, 0xfff6
 c3 03                 ldi8	r7, 0x3
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 aa                    xor	r6, r6
 c7 60 40              ldi16	r7, 0x4060
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 aa                    xor	r6, r6
 c7 48 c1              ldi16	r7, 0xc148
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 15 02              leasp	r5, 0x2
 c6 24 08              ldi16	r6, 0x824
 c3 00                 ldi8	r7, 0x0
 f1 15                 mov	r2, r5
 d7 37                 sys	debug_printfv_p
 04                    mov	r5, r4
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 c6 bd 37              ldi16	r6, 0x37bd
 c7 86 35              ldi16	r7, 0x3586
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 c6 ec 78              ldi16	r6, 0x78ec
 c7 ad 60              ldi16	r7, 0x60ad
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 aa                    xor	r6, r6
 c7 80 4b              ldi16	r7, 0x4b80
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 14 02              leasp	r4, 0x2
 c6 53 08              ldi16	r6, 0x853
 c3 00                 ldi8	r7, 0x0
 f1 14                 mov	r2, r4
 d7 37                 sys	debug_printfv_p
 f4 40                 stsp16	[sp+0x0], r4
 f0 06 00 e0           ldi16	r2, 0xe000
 f0 07 7f 3f           ldi16	r3, 0x3f7f
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f0 06 00 f0           ldi16	r2, 0xf000
 f0 07 1f 41           ldi16	r3, 0x411f
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f0 06 00 e0           ldi16	r2, 0xe000
 f0 07 79 44           ldi16	r3, 0x4479
 f0 3a 02              stsp16	[sp+0x2], r2
 f0 3b 04              stsp16	[sp+0x4], r3
 f0 14 02              leasp	r4, 0x2
 f1 14                 mov	r2, r4
 c6 6f 08              ldi16	r6, 0x86f
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f0 0c 2d              cmpi.s8	r0, 0x2d
 f8 0f                 cset.ne	r7
 cd 3a                 cmpi.s8	r5, 0x3a
 f8 0d                 cset.ne	r5
 97                    or	r5, r7
 f2 30                 sub	r0, r0
 f0 05 20 c0           ldi16	r1, 0xc020
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 30                 sub	r0, r0
 f0 05 20 40           ldi16	r1, 0x4020
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f4 02                 ldsp16	r6, [sp+0x0]
 ce 44                 cmpi.s8	r6, 0x44
 f8 0e                 cset.ne	r6
 99                    or	r6, r5
 cc 20                 cmpi.s8	r4, 0x20
 f8 0d                 cset.ne	r5
 96                    or	r5, r6
 f0 14 02              leasp	r4, 0x2
 c6 8a 08              ldi16	r6, 0x88a
 c3 00                 ldi8	r7, 0x0
 f1 14                 mov	r2, r4
 d7 37                 sys	debug_printfv_p
 cc 12                 cmpi.s8	r4, 0x12
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<print_exponent>:
 b2                    push16	r2
 b0                    push16	r0
 d6 ec                 adjsp	-0x14
 c4 52 06              ldi16	r4, 0x652
 c5 9e 3f              ldi16	r5, 0x3f9e
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 a0                    xor	r4, r4
 c5 80 47              ldi16	r5, 0x4780
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 c5 f7 42              ldi16	r5, 0x42f7
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 14 00              leasp	r4, 0x0
 c6 a2 08              ldi16	r6, 0x8a2
 c3 00                 ldi8	r7, 0x0
 f1 14                 mov	r2, r4
 d7 37                 sys	debug_printfv_p
 f1 04                 mov	r0, r4
 aa                    xor	r6, r6
 c7 00 3f              ldi16	r7, 0x3f00
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3f 12              stsp16	[sp+0x12], r7
 c2 0e                 ldi8	r6, 0xe
 c3 04                 ldi8	r7, 0x4
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 aa                    xor	r6, r6
 c7 00 bd              ldi16	r7, 0xbd00
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 aa                    xor	r6, r6
 c7 a0 3f              ldi16	r7, 0x3fa0
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 12 00              leasp	r2, 0x0
 c6 c4 08              ldi16	r6, 0x8c4
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 04                    mov	r5, r4
 c6 00 e0              ldi16	r6, 0xe000
 c7 7f 3f              ldi16	r7, 0x3f7f
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 c6 f4 08              ldi16	r6, 0x8f4
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 c2 01                 ldi8	r6, 0x1
 af                    xor	r7, r7
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c6 ff ff              ldi16	r6, 0xffff
 c3 7f                 ldi8	r7, 0x7f
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 aa                    xor	r6, r6
 c3 80                 ldi8	r7, 0x80
 f4 52                 stsp16	[sp+0x4], r6
 f4 5b                 stsp16	[sp+0x6], r7
 c6 ff ff              ldi16	r6, 0xffff
 c7 7f 7f              ldi16	r7, 0x7f7f
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 0c 3e              cmpi.s8	r0, 0x3e
 f8 0e                 cset.ne	r6
 cd 4b                 cmpi.s8	r5, 0x4b
 f8 0d                 cset.ne	r5
 96                    or	r5, r6
 cc 11                 cmpi.s8	r4, 0x11
 f8 08                 cset.ne	r0
 f9 15                 or	r0, r5
 f0 14 00              leasp	r4, 0x0
 f1 14                 mov	r2, r4
 c6 05 09              ldi16	r6, 0x905
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 cc 44                 cmpi.s8	r4, 0x44
 f8 0c                 cset.ne	r4
 f9 81                 or	r4, r0
 d6 14                 adjsp	0x14
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret

<print_general>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e6                 adjsp	-0x1a
 c4 00 3e              ldi16	r4, 0x3e00
 c5 1c 46              ldi16	r5, 0x461c
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c4 38 b4              ldi16	r4, 0xb438
 c5 96 49              ldi16	r5, 0x4996
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c4 5f 1d              ldi16	r4, 0x1d5f
 c5 4f 37              ldi16	r5, 0x374f
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c4 5b 72              ldi16	r4, 0x725b
 c5 01 39              ldi16	r5, 0x3901
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 66 e6              ldi16	r4, 0xe666
 c5 f6 42              ldi16	r5, 0x42f6
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 14 02              leasp	r4, 0x2
 c6 28 09              ldi16	r6, 0x928
 c3 00                 ldi8	r7, 0x0
 f1 14                 mov	r2, r4
 d7 37                 sys	debug_printfv_p
 f1 04                 mov	r0, r4
 c6 00 20              ldi16	r6, 0x2000
 c7 f1 47              ldi16	r7, 0x47f1
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 c6 cd cc              ldi16	r6, 0xcccd
 c7 f6 42              ldi16	r7, 0x42f6
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 c6 e5 07              ldi16	r6, 0x7e5
 c7 4f 37              ldi16	r7, 0x374f
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 c6 52 06              ldi16	r6, 0x652
 c7 9e 3f              ldi16	r7, 0x3f9e
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 cd cc              ldi16	r6, 0xcccd
 c7 44 41              ldi16	r7, 0x4144
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 4a                 stsp16	[sp+0x2], r6
 f4 53                 stsp16	[sp+0x4], r7
 f0 12 02              leasp	r2, 0x2
 c6 42 09              ldi16	r6, 0x942
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f1 0c                 mov	r1, r4
 c4 69 b4              ldi16	r4, 0xb469
 c5 d1 38              ldi16	r5, 0x38d1
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c6 75 09              ldi16	r6, 0x975
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f1 1c                 mov	r3, r4
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 14 02              leasp	r4, 0x2
 f1 14                 mov	r2, r4
 c6 8d 09              ldi16	r6, 0x98d
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 40                 stsp16	[sp+0x0], r4
 f0 0c 37              cmpi.s8	r0, 0x37
 f8 0c                 cset.ne	r4
 f0 0d 48              cmpi.s8	r1, 0x48
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f0 04 f9 02           ldi16	r0, 0x2f9
 f0 05 15 50           ldi16	r1, 0x5015
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f0 14 02              leasp	r4, 0x2
 f1 14                 mov	r2, r4
 c6 a5 09              ldi16	r6, 0x9a5
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f0 0f 19              cmpi.s8	r3, 0x19
 f8 0e                 cset.ne	r6
 99                    or	r6, r5
 f0 00 01              ldi8	r0, 0x1
 f0 05 c0 7f           ldi16	r1, 0x7fc0
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 00 01              ldi8	r0, 0x1
 f0 05 c0 ff           ldi16	r1, 0xffc0
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f2 30                 sub	r0, r0
 f0 05 80 ff           ldi16	r1, 0xff80
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 30                 sub	r0, r0
 f0 05 80 7f           ldi16	r1, 0x7f80
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 38 02              stsp16	[sp+0x2], r0
 f0 39 04              stsp16	[sp+0x4], r1
 f4 01                 ldsp16	r5, [sp+0x0]
 cd 1a                 cmpi.s8	r5, 0x1a
 f8 0d                 cset.ne	r5
 96                    or	r5, r6
 cc 2d                 cmpi.s8	r4, 0x2d
 f8 08                 cset.ne	r0
 f9 15                 or	r0, r5
 f0 14 02              leasp	r4, 0x2
 f1 14                 mov	r2, r4
 c6 c4 09              ldi16	r6, 0x9c4
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 cc 36                 cmpi.s8	r4, 0x36
 f8 0c                 cset.ne	r4
 f9 81                 or	r4, r0
 d6 1a                 adjsp	0x1a
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<print_hex>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 cc 3d           ldi16	r1, 0x3dcc
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f0 16 04              leasp	r6, 0x4
 f1 16                 mov	r2, r6
 c6 f1 09              ldi16	r6, 0x9f1
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 48                 stsp16	[sp+0x2], r4
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f0 3c 14              stsp16	[sp+0x14], r4
 f0 3d 16              stsp16	[sp+0x16], r5
 c0 01                 ldi8	r4, 0x1
 a5                    xor	r5, r5
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 a0                    xor	r4, r4
 c1 40                 ldi8	r5, 0x40
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 c1 80                 ldi8	r5, 0x80
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 14 04              leasp	r4, 0x4
 c6 09 0a              ldi16	r6, 0xa09
 c3 00                 ldi8	r7, 0x0
 f1 14                 mov	r2, r4
 d7 37                 sys	debug_printfv_p
 f4 40                 stsp16	[sp+0x0], r4
 a0                    xor	r4, r4
 c5 8c 3f              ldi16	r5, 0x3f8c
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 a0                    xor	r4, r4
 c5 84 3f              ldi16	r5, 0x3f84
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c 18              stsp16	[sp+0x18], r4
 f0 3d 1a              stsp16	[sp+0x1a], r5
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 12 04              leasp	r2, 0x4
 c6 21 0a              ldi16	r6, 0xa21
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f1 1c                 mov	r3, r4
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 c0 10                 ldi8	r4, 0x10
 c1 04                 ldi8	r5, 0x4
 f0 3c 10              stsp16	[sp+0x10], r4
 f0 3d 12              stsp16	[sp+0x12], r5
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f4 70                 stsp16	[sp+0xc], r4
 f4 79                 stsp16	[sp+0xe], r5
 a0                    xor	r4, r4
 c5 20 c0              ldi16	r5, 0xc020
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f4 50                 stsp16	[sp+0x4], r4
 f4 59                 stsp16	[sp+0x6], r5
 f0 14 04              leasp	r4, 0x4
 f1 14                 mov	r2, r4
 c6 4d 0a              ldi16	r6, 0xa4d
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 09                 ldsp16	r5, [sp+0x2]
 cd 44                 cmpi.s8	r5, 0x44
 f8 0d                 cset.ne	r5
 f4 02                 ldsp16	r6, [sp+0x0]
 ce 32                 cmpi.s8	r6, 0x32
 f8 0f                 cset.ne	r7
 9d                    or	r7, r5
 f2 30                 sub	r0, r0
 f2 39                 sub	r1, r1
 f0 38 18              stsp16	[sp+0x18], r0
 f0 39 1a              stsp16	[sp+0x1a], r1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 05 7f 7f           ldi16	r1, 0x7f7f
 f0 38 14              stsp16	[sp+0x14], r0
 f0 39 16              stsp16	[sp+0x16], r1
 f0 38 10              stsp16	[sp+0x10], r0
 f0 39 12              stsp16	[sp+0x12], r1
 f0 04 ff ff           ldi16	r0, 0xffff
 f0 01 7f              ldi8	r1, 0x7f
 f0 38 0c              stsp16	[sp+0xc], r0
 f0 39 0e              stsp16	[sp+0xe], r1
 f0 38 08              stsp16	[sp+0x8], r0
 f0 39 0a              stsp16	[sp+0xa], r1
 f0 00 03              ldi8	r0, 0x3
 f2 39                 sub	r1, r1
 f0 38 04              stsp16	[sp+0x4], r0
 f0 39 06              stsp16	[sp+0x6], r1
 f0 0f 47              cmpi.s8	r3, 0x47
 f8 0d                 cset.ne	r5
 97                    or	r5, r7
 cc 52                 cmpi.s8	r4, 0x52
 f8 08                 cset.ne	r0
 f9 15                 or	r0, r5
 f0 14 04              leasp	r4, 0x4
 f1 14                 mov	r2, r4
 c6 7c 0a              ldi16	r6, 0xa7c
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 cc 50                 cmpi.s8	r4, 0x50
 f8 0c                 cset.ne	r4
 f9 81                 or	r4, r0
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<print_mixed>:
 b2                    push16	r2
 b0                    push16	r0
 d6 ee                 adjsp	-0x12
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 60                 stsp16	[sp+0x8], r4
 f4 69                 stsp16	[sp+0xa], r5
 f4 48                 stsp16	[sp+0x2], r4
 f4 51                 stsp16	[sp+0x4], r5
 c4 ff ff              ldi16	r4, 0xffff
 f4 70                 stsp16	[sp+0xc], r4
 f4 58                 stsp16	[sp+0x6], r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 14 00              leasp	r4, 0x0
 c6 a4 0a              ldi16	r6, 0xaa4
 c3 00                 ldi8	r7, 0x0
 f1 14                 mov	r2, r4
 d7 37                 sys	debug_printfv_p
 f1 04                 mov	r0, r4
 aa                    xor	r6, r6
 c7 00 3e              ldi16	r7, 0x3e00
 f4 72                 stsp16	[sp+0xc], r6
 f4 7b                 stsp16	[sp+0xe], r7
 c5 00 01              ldi16	r5, 0x100
 f4 69                 stsp16	[sp+0xa], r5
 aa                    xor	r6, r6
 c7 c0 40              ldi16	r7, 0x40c0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c5 f9 ff              ldi16	r5, 0xfff9
 f4 51                 stsp16	[sp+0x4], r5
 aa                    xor	r6, r6
 c7 50 40              ldi16	r7, 0x4050
 f4 42                 stsp16	[sp+0x0], r6
 f4 4b                 stsp16	[sp+0x2], r7
 f0 15 00              leasp	r5, 0x0
 c6 c7 0a              ldi16	r6, 0xac7
 c3 00                 ldi8	r7, 0x0
 f1 15                 mov	r2, r5
 d7 37                 sys	debug_printfv_p
 f0 0c 29              cmpi.s8	r0, 0x29
 f8 0d                 cset.ne	r5
 cc 23                 cmpi.s8	r4, 0x23
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 d6 12                 adjsp	0x12
 b8                    pop16	r0
 ba                    pop16	r2
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
