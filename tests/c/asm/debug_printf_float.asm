
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/debug_printf_float.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 debug_printf_float.c
0000083a l     O .rodata	00000022 .L.avm.flashstr.0
0000085c l     O .rodata	0000002f .L.avm.flashstr.1
0000088b l     O .rodata	0000001c .L.avm.flashstr.2
000008a7 l     O .rodata	0000001b .L.avm.flashstr.3
000008c2 l     O .rodata	00000018 .L.avm.flashstr.4
000008da l     O .rodata	00000022 .L.avm.flashstr.5
000008fc l     O .rodata	00000030 .L.avm.flashstr.6
0000092c l     O .rodata	00000011 .L.avm.flashstr.7
0000093d l     O .rodata	00000023 .L.avm.flashstr.8
00000960 l     O .rodata	0000001a .L.avm.flashstr.9
0000097a l     O .rodata	00000033 .L.avm.flashstr.10
000009ad l     O .rodata	00000018 .L.avm.flashstr.11
000009c5 l     O .rodata	00000018 .L.avm.flashstr.12
000009dd l     O .rodata	0000001f .L.avm.flashstr.13
000009fc l     O .rodata	0000002d .L.avm.flashstr.14
00000a29 l     O .rodata	00000018 .L.avm.flashstr.15
00000a41 l     O .rodata	00000018 .L.avm.flashstr.16
00000a59 l     O .rodata	0000002c .L.avm.flashstr.17
00000a85 l     O .rodata	0000002f .L.avm.flashstr.18
00000ab4 l     O .rodata	00000028 .L.avm.flashstr.19
00000adc l     O .rodata	00000023 .L.avm.flashstr.20
00000100 l     O .data	00000003 .L.str
00000aff l     O .rodata	00000018 .L.avm.flashstr.21
00000000 l    df *ABS*	00000000 runtime.c
00000b17 l       .init_array	00000000 .hidden __init_array_end
00000b17 l       .init_array	00000000 .hidden __init_array_start
00000b17 l       .fini_array	00000000 .hidden __fini_array_start
00000b17 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	00000561 avm_test_main
00000838 g     F .text	00000002 avm_halt
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
 e1 1a 06              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 17 0b              ldi16	r4, 0xb17
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 17 0b              ldi16	r6, 0xb17
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 17 0b           ldi16	r0, 0xb17
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 17 0b           ldi16	r2, 0xb17
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
 c4 17 0b              ldi16	r4, 0xb17
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 17 0b              ldi16	r6, 0xb17
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 17 0b           ldi16	r2, 0xb17
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 17 0b           ldi16	r0, 0xb17
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
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e2                 adjsp	-0x1e
 a0                    xor	r4, r4
 c5 46 c1              ldi16	r5, 0xc146
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c4 52 06              ldi16	r4, 0x652
 c5 9e 3f              ldi16	r5, 0x3f9e
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 14 06              leasp	r4, 0x6
 c6 3a 08              ldi16	r6, 0x83a
 c3 00                 ldi8	r7, 0x0
 f1 14                 mov	r2, r4
 d7 37                 sys	debug_printfv_p
 f1 04                 mov	r0, r4
 c6 f6 ff              ldi16	r6, 0xfff6
 c3 03                 ldi8	r7, 0x3
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 aa                    xor	r6, r6
 c7 60 40              ldi16	r7, 0x4060
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 aa                    xor	r6, r6
 c7 48 c1              ldi16	r7, 0xc148
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 a0                    xor	r4, r4
 c5 00 40              ldi16	r5, 0x4000
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 15 06              leasp	r5, 0x6
 c6 5c 08              ldi16	r6, 0x85c
 c3 00                 ldi8	r7, 0x0
 f1 15                 mov	r2, r5
 d7 37                 sys	debug_printfv_p
 f1 0c                 mov	r1, r4
 c4 bd 37              ldi16	r4, 0x37bd
 c5 86 35              ldi16	r5, 0x3586
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 c4 ec 78              ldi16	r4, 0x78ec
 c5 ad 60              ldi16	r5, 0x60ad
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 a0                    xor	r4, r4
 c5 80 4b              ldi16	r5, 0x4b80
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 a0                    xor	r4, r4
 c5 00 80              ldi16	r5, 0x8000
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f0 14 06              leasp	r4, 0x6
 f1 14                 mov	r2, r4
 c6 8b 08              ldi16	r6, 0x88b
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f1 1c                 mov	r3, r4
 c4 00 f0              ldi16	r4, 0xf000
 c5 1f 41              ldi16	r5, 0x411f
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c4 00 e0              ldi16	r4, 0xe000
 c5 79 44              ldi16	r5, 0x4479
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 00 e0              ldi16	r4, 0xe000
 c5 7f 3f              ldi16	r5, 0x3f7f
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f0 12 06              leasp	r2, 0x6
 c6 a7 08              ldi16	r6, 0x8a7
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 48                 stsp16	[sp+0x2], r4
 f0 0c 2d              cmpi.s8	r0, 0x2d
 f8 0c                 cset.ne	r4
 f0 0d 3a              cmpi.s8	r1, 0x3a
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 f2 30                 sub	r0, r0
 f0 05 20 40           ldi16	r1, 0x4020
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f2 30                 sub	r0, r0
 f0 05 20 c0           ldi16	r1, 0xc020
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 14 06              leasp	r4, 0x6
 f1 14                 mov	r2, r4
 c6 c2 08              ldi16	r6, 0x8c2
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 50                 stsp16	[sp+0x4], r4
 f0 0f 44              cmpi.s8	r3, 0x44
 f8 0b                 cset.ne	r3
 f9 75                 or	r3, r5
 f2 30                 sub	r0, r0
 f0 05 80 47           ldi16	r1, 0x4780
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f2 30                 sub	r0, r0
 f0 05 f7 42           ldi16	r1, 0x42f7
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f0 04 52 06           ldi16	r0, 0x652
 f0 05 9e 3f           ldi16	r1, 0x3f9e
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 16 06              leasp	r6, 0x6
 f1 16                 mov	r2, r6
 c6 da 08              ldi16	r6, 0x8da
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 cc 20                 cmpi.s8	r4, 0x20
 f8 0d                 cset.ne	r5
 f9 ad                 or	r5, r3
 f2 30                 sub	r0, r0
 f0 05 00 3f           ldi16	r1, 0x3f00
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 00 0e              ldi8	r0, 0xe
 f0 01 04              ldi8	r1, 0x4
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f2 30                 sub	r0, r0
 f0 05 00 bd           ldi16	r1, 0xbd00
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f2 30                 sub	r0, r0
 f0 05 00 40           ldi16	r1, 0x4000
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f2 30                 sub	r0, r0
 f0 05 a0 3f           ldi16	r1, 0x3fa0
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f0 14 06              leasp	r4, 0x6
 f1 14                 mov	r2, r4
 c6 fc 08              ldi16	r6, 0x8fc
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f1 04                 mov	r0, r4
 f4 10                 ldsp16	r4, [sp+0x4]
 cc 12                 cmpi.s8	r4, 0x12
 f8 09                 cset.ne	r1
 f9 35                 or	r1, r5
 c4 00 e0              ldi16	r4, 0xe000
 c5 7f 3f              ldi16	r5, 0x3f7f
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 15 06              leasp	r5, 0x6
 f1 15                 mov	r2, r5
 c6 2c 09              ldi16	r6, 0x92c
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 48                 stsp16	[sp+0x2], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 3e                 cmpi.s8	r4, 0x3e
 f8 0d                 cset.ne	r5
 f9 a5                 or	r5, r1
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 03 7f              ldi8	r3, 0x7f
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f0 06 ff ff           ldi16	r2, 0xffff
 f0 07 7f 7f           ldi16	r3, 0x7f7f
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f0 14 06              leasp	r4, 0x6
 f1 14                 mov	r2, r4
 c6 3d 09              ldi16	r6, 0x93d
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 50                 stsp16	[sp+0x4], r4
 f0 0c 4b              cmpi.s8	r0, 0x4b
 f8 0b                 cset.ne	r3
 f9 75                 or	r3, r5
 f0 04 00 3e           ldi16	r0, 0x3e00
 f0 05 1c 46           ldi16	r1, 0x461c
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 04 38 b4           ldi16	r0, 0xb438
 f0 05 96 49           ldi16	r1, 0x4996
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 f0 04 5f 1d           ldi16	r0, 0x1d5f
 f0 05 4f 37           ldi16	r1, 0x374f
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 04 5b 72           ldi16	r0, 0x725b
 f0 05 01 39           ldi16	r1, 0x3901
 f0 38 0a              stsp16	[sp+0xa], r0
 f0 39 0c              stsp16	[sp+0xc], r1
 f0 04 66 e6           ldi16	r0, 0xe666
 f0 05 f6 42           ldi16	r1, 0x42f6
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f0 16 06              leasp	r6, 0x6
 f1 16                 mov	r2, r6
 c6 60 09              ldi16	r6, 0x960
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 40                 stsp16	[sp+0x0], r4
 f4 08                 ldsp16	r4, [sp+0x2]
 cc 11                 cmpi.s8	r4, 0x11
 f8 0c                 cset.ne	r4
 f9 8d                 or	r4, r3
 f1 1c                 mov	r3, r4
 f0 04 00 20           ldi16	r0, 0x2000
 f0 05 f1 47           ldi16	r1, 0x47f1
 f0 38 1a              stsp16	[sp+0x1a], r0
 f0 39 1c              stsp16	[sp+0x1c], r1
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 f6 42           ldi16	r1, 0x42f6
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 04 e5 07           ldi16	r0, 0x7e5
 f0 05 4f 37           ldi16	r1, 0x374f
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 c6 52 06              ldi16	r6, 0x652
 c7 9e 3f              ldi16	r7, 0x3f9e
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 44 41           ldi16	r1, 0x4144
 f0 38 0e              stsp16	[sp+0xe], r0
 f0 39 10              stsp16	[sp+0x10], r1
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 f0 12 06              leasp	r2, 0x6
 c6 7a 09              ldi16	r6, 0x97a
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 48                 stsp16	[sp+0x2], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 cc 44                 cmpi.s8	r4, 0x44
 f8 0d                 cset.ne	r5
 f9 ad                 or	r5, r3
 f0 04 69 b4           ldi16	r0, 0xb469
 f0 05 d1 38           ldi16	r1, 0x38d1
 f0 38 06              stsp16	[sp+0x6], r0
 f0 39 08              stsp16	[sp+0x8], r1
 c6 ad 09              ldi16	r6, 0x9ad
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f1 0c                 mov	r1, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 37                 cmpi.s8	r4, 0x37
 f8 0b                 cset.ne	r3
 f9 75                 or	r3, r5
 aa                    xor	r6, r6
 c7 00 80              ldi16	r7, 0x8000
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 16 06              leasp	r6, 0x6
 f1 16                 mov	r2, r6
 c6 c5 09              ldi16	r6, 0x9c5
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f1 04                 mov	r0, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 cc 48                 cmpi.s8	r4, 0x48
 f8 0d                 cset.ne	r5
 f9 ad                 or	r5, r3
 c6 f9 02              ldi16	r6, 0x2f9
 c7 15 50              ldi16	r7, 0x5015
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 f0 12 06              leasp	r2, 0x6
 c6 dd 09              ldi16	r6, 0x9dd
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f1 1c                 mov	r3, r4
 f0 0d 19              cmpi.s8	r1, 0x19
 f8 09                 cset.ne	r1
 f9 35                 or	r1, r5
 c2 01                 ldi8	r6, 0x1
 c7 c0 7f              ldi16	r7, 0x7fc0
 f0 3e 1a              stsp16	[sp+0x1a], r6
 f0 3f 1c              stsp16	[sp+0x1c], r7
 c2 01                 ldi8	r6, 0x1
 c7 c0 ff              ldi16	r7, 0xffc0
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 3f 18              stsp16	[sp+0x18], r7
 aa                    xor	r6, r6
 c7 80 ff              ldi16	r7, 0xff80
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 aa                    xor	r6, r6
 c7 80 7f              ldi16	r7, 0x7f80
 f0 3e 12              stsp16	[sp+0x12], r6
 f0 3f 14              stsp16	[sp+0x14], r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 fc 09              ldi16	r6, 0x9fc
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 40                 stsp16	[sp+0x0], r4
 f0 0c 1a              cmpi.s8	r0, 0x1a
 f8 08                 cset.ne	r0
 f9 05                 or	r0, r1
 a0                    xor	r4, r4
 c5 80 3f              ldi16	r5, 0x3f80
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 c4 cd cc              ldi16	r4, 0xcccd
 c5 cc 3d              ldi16	r5, 0x3dcc
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 f0 14 06              leasp	r4, 0x6
 f1 14                 mov	r2, r4
 c6 29 0a              ldi16	r6, 0xa29
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 50                 stsp16	[sp+0x4], r4
 f0 0f 2d              cmpi.s8	r3, 0x2d
 f8 0d                 cset.ne	r5
 f9 a1                 or	r5, r0
 f2 42                 sub	r2, r2
 f0 07 00 80           ldi16	r3, 0x8000
 f0 3a 16              stsp16	[sp+0x16], r2
 f0 3b 18              stsp16	[sp+0x18], r3
 f0 02 01              ldi8	r2, 0x1
 f2 4b                 sub	r3, r3
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 f2 42                 sub	r2, r2
 f0 03 40              ldi8	r3, 0x40
 f0 3a 0e              stsp16	[sp+0xe], r2
 f0 3b 10              stsp16	[sp+0x10], r3
 f2 42                 sub	r2, r2
 f0 03 80              ldi8	r3, 0x80
 f0 3a 0a              stsp16	[sp+0xa], r2
 f0 3b 0c              stsp16	[sp+0xc], r3
 f2 42                 sub	r2, r2
 f2 4b                 sub	r3, r3
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f0 17 06              leasp	r7, 0x6
 f1 17                 mov	r2, r7
 c6 41 0a              ldi16	r6, 0xa41
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 48                 stsp16	[sp+0x2], r4
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 36                 cmpi.s8	r4, 0x36
 f8 0b                 cset.ne	r3
 f9 75                 or	r3, r5
 a0                    xor	r4, r4
 c5 8c 3f              ldi16	r5, 0x3f8c
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 a0                    xor	r4, r4
 c5 84 3f              ldi16	r5, 0x3f84
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 a0                    xor	r4, r4
 c5 a0 3f              ldi16	r5, 0x3fa0
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 a0                    xor	r4, r4
 c5 c0 3f              ldi16	r5, 0x3fc0
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 f0 04 cd cc           ldi16	r0, 0xcccd
 f0 05 cc 3d           ldi16	r1, 0x3dcc
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 12 06              leasp	r2, 0x6
 c6 59 0a              ldi16	r6, 0xa59
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f4 40                 stsp16	[sp+0x0], r4
 f4 10                 ldsp16	r4, [sp+0x4]
 cc 44                 cmpi.s8	r4, 0x44
 f8 0d                 cset.ne	r5
 f9 ad                 or	r5, r3
 f0 38 16              stsp16	[sp+0x16], r0
 f0 39 18              stsp16	[sp+0x18], r1
 f0 00 10              ldi8	r0, 0x10
 f0 01 04              ldi8	r1, 0x4
 f0 38 12              stsp16	[sp+0x12], r0
 f0 39 14              stsp16	[sp+0x14], r1
 aa                    xor	r6, r6
 c7 00 40              ldi16	r7, 0x4000
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 aa                    xor	r6, r6
 c7 20 c0              ldi16	r7, 0xc020
 f4 6a                 stsp16	[sp+0xa], r6
 f4 73                 stsp16	[sp+0xc], r7
 aa                    xor	r6, r6
 c7 c0 3f              ldi16	r7, 0x3fc0
 f4 5a                 stsp16	[sp+0x6], r6
 f4 63                 stsp16	[sp+0x8], r7
 c6 85 0a              ldi16	r6, 0xa85
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f1 0c                 mov	r1, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 cc 32                 cmpi.s8	r4, 0x32
 f8 0b                 cset.ne	r3
 f9 75                 or	r3, r5
 a0                    xor	r4, r4
 a5                    xor	r5, r5
 f0 3c 1a              stsp16	[sp+0x1a], r4
 f0 3d 1c              stsp16	[sp+0x1c], r5
 c4 ff ff              ldi16	r4, 0xffff
 c5 7f 7f              ldi16	r5, 0x7f7f
 f0 3c 16              stsp16	[sp+0x16], r4
 f0 3d 18              stsp16	[sp+0x18], r5
 f0 3c 12              stsp16	[sp+0x12], r4
 f0 3d 14              stsp16	[sp+0x14], r5
 c4 ff ff              ldi16	r4, 0xffff
 c1 7f                 ldi8	r5, 0x7f
 f4 78                 stsp16	[sp+0xe], r4
 f0 3d 10              stsp16	[sp+0x10], r5
 f4 68                 stsp16	[sp+0xa], r4
 f4 71                 stsp16	[sp+0xc], r5
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 58                 stsp16	[sp+0x6], r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 14 06              leasp	r4, 0x6
 f1 14                 mov	r2, r4
 c6 b4 0a              ldi16	r6, 0xab4
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 f1 04                 mov	r0, r4
 f4 00                 ldsp16	r4, [sp+0x0]
 cc 47                 cmpi.s8	r4, 0x47
 f8 0d                 cset.ne	r5
 f9 ad                 or	r5, r3
 aa                    xor	r6, r6
 c7 c0 3f              ldi16	r7, 0x3fc0
 f0 3e 14              stsp16	[sp+0x14], r6
 f0 3f 16              stsp16	[sp+0x16], r7
 f4 7a                 stsp16	[sp+0xe], r6
 f0 3f 10              stsp16	[sp+0x10], r7
 f4 62                 stsp16	[sp+0x8], r6
 f4 6b                 stsp16	[sp+0xa], r7
 c6 ff ff              ldi16	r6, 0xffff
 f0 3e 12              stsp16	[sp+0x12], r6
 f4 72                 stsp16	[sp+0xc], r6
 f4 5a                 stsp16	[sp+0x6], r6
 f0 16 06              leasp	r6, 0x6
 f1 16                 mov	r2, r6
 c6 dc 0a              ldi16	r6, 0xadc
 c3 00                 ldi8	r7, 0x0
 d7 37                 sys	debug_printfv_p
 08                    mov	r6, r4
 f0 0d 52              cmpi.s8	r1, 0x52
 f8 0c                 cset.ne	r4
 91                    or	r4, r5
 f2 42                 sub	r2, r2
 f0 07 00 3e           ldi16	r3, 0x3e00
 f0 3a 12              stsp16	[sp+0x12], r2
 f0 3b 14              stsp16	[sp+0x14], r3
 c5 00 01              ldi16	r5, 0x100
 f0 3d 10              stsp16	[sp+0x10], r5
 f2 42                 sub	r2, r2
 f0 07 c0 40           ldi16	r3, 0x40c0
 f0 3a 0c              stsp16	[sp+0xc], r2
 f0 3b 0e              stsp16	[sp+0xe], r3
 c5 f9 ff              ldi16	r5, 0xfff9
 f4 69                 stsp16	[sp+0xa], r5
 f2 42                 sub	r2, r2
 f0 07 50 40           ldi16	r3, 0x4050
 f0 3a 06              stsp16	[sp+0x6], r2
 f0 3b 08              stsp16	[sp+0x8], r3
 f0 0c 50              cmpi.s8	r0, 0x50
 f8 0d                 cset.ne	r5
 94                    or	r5, r4
 ce 29                 cmpi.s8	r6, 0x29
 f8 08                 cset.ne	r0
 f9 15                 or	r0, r5
 f0 15 06              leasp	r5, 0x6
 c6 ff 0a              ldi16	r6, 0xaff
 c3 00                 ldi8	r7, 0x0
 f1 15                 mov	r2, r5
 d7 37                 sys	debug_printfv_p
 cc 23                 cmpi.s8	r4, 0x23
 f8 0d                 cset.ne	r5
 f9 a1                 or	r5, r0
 c0 01                 ldi8	r4, 0x1
 81                    and	r4, r5
 d6 1e                 adjsp	0x1e
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
