
save_load.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 save_load.c
00000100 l     O .saved	00000040 saved_state
000005f3 l     F .text	00000007 call_save_exists
000005fa l     F .text	00000007 call_load
00000601 l     F .text	00000003 call_save
00000140 l     O .data	00000003 .L.str
00000143 l     O .data	00000003 .L.str.1
00000146 l     O .data	00000003 .L.str.2
00000149 l     O .data	00000003 .L.str.3
0000014c l     O .data	00000003 .L.str.4
0000014f l     O .data	00000003 .L.str.5
00000152 l     O .data	00000003 .L.str.6
00000155 l     O .data	00000003 .L.str.7
00000158 l     O .data	00000003 .L.str.8
0000015b l     O .data	00000003 .L.str.9
0000015e l     O .data	00000003 .L.str.10
00000000 l    df *ABS*	00000000 runtime.c
00000606 l       .init_array	00000000 .hidden __init_array_end
00000606 l       .init_array	00000000 .hidden __init_array_start
00000606 l       .fini_array	00000000 .hidden __fini_array_start
00000606 l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000031c avm_test_main
00000604 g     F .text	00000002 avm_halt
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
 e1 e6 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 06 06              ldi16	r4, 0x606
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 06 06              ldi16	r6, 0x606
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 06 06           ldi16	r0, 0x606
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 06 06           ldi16	r2, 0x606
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
 c4 06 06              ldi16	r4, 0x606
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 06 06              ldi16	r6, 0x606
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 06 06           ldi16	r2, 0x606
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 06 06           ldi16	r0, 0x606
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
 d6 ea                 adjsp	-0x16
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 c2 ed                 ldi8	r6, 0xed
 0c                    mov	r7, r4
 f4 8f                 lsr16.1	r7
 1e                    add	r7, r6
 f6 0f                 st8	[r5+], r7
 ca 11                 addi.s8	r6, 0x11
 f4 ac                 inc16	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 f2                 brne8	avm_test_main+12
 e1 ff 02              call16	call_save_exists
 f4 40                 stsp16	[sp+0x0], r4
 f2 42                 sub	r2, r2
 f0 00 ed              ldi8	r0, 0xed
 f0 05 00 01           ldi16	r1, 0x100
 e1 f8 02              call16	call_load
 f0 3c 14              stsp16	[sp+0x14], r4
 f1 22                 mov	r4, r2
 f0 6c a3              ld8u	r5, [r1+]
 f1 2a                 mov	r6, r2
 f4 8e                 lsr16.1	r6
 f2 28                 add	r6, r0
 f0 08 11              addi.s8	r0, 0x11
 f4 ac                 inc16	r4
 f1 76                 zext8	r6
 39                    cmp	r6, r5
 d1 07                 brne8	avm_test_main+74
 f0 0e 3f              cmpi.s8	r2, 0x3f
 f1 14                 mov	r2, r4
 d1 e6                 brne8	avm_test_main+48
 f0 3e 10              stsp16	[sp+0x10], r6
 f0 3d 12              stsp16	[sp+0x12], r5
 e1 d7 02              call16	call_save
 f2 30                 sub	r0, r0
 f0 05 00 01           ldi16	r1, 0x100
 f0 02 da              ldi8	r2, 0xda
 e1 bd 02              call16	call_save_exists
 f4 78                 stsp16	[sp+0xe], r4
 f1 20                 mov	r4, r0
 f4 8c                 lsr16.1	r4
 f2 22                 add	r4, r2
 f0 6d 83              st8	[r1+], r4
 f0 0a 11              addi.s8	r2, 0x11
 f4 a8                 inc16	r0
 f0 0c 40              cmpi.s8	r0, 0x40
 d1 ed                 brne8	avm_test_main+97
 f2 30                 sub	r0, r0
 f0 01 ed              ldi8	r1, 0xed
 f0 06 00 01           ldi16	r2, 0x100
 e1 a3 02              call16	call_load
 f4 70                 stsp16	[sp+0xc], r4
 f1 20                 mov	r4, r0
 f0 6c a5              ld8u	r5, [r2+]
 f1 28                 mov	r6, r0
 f4 8e                 lsr16.1	r6
 f2 29                 add	r6, r1
 f0 09 11              addi.s8	r1, 0x11
 f4 ac                 inc16	r4
 f1 76                 zext8	r6
 39                    cmp	r6, r5
 d1 07                 brne8	avm_test_main+158
 f0 0c 3f              cmpi.s8	r0, 0x3f
 f1 04                 mov	r0, r4
 d1 e6                 brne8	avm_test_main+132
 f4 62                 stsp16	[sp+0x8], r6
 f4 69                 stsp16	[sp+0xa], r5
 f0 02 01              ldi8	r2, 0x1
 f0 01 1d              ldi8	r1, 0x1d
 f2 30                 sub	r0, r0
 f0 07 00 01           ldi16	r3, 0x100
 f1 21                 mov	r4, r1
 f1 27                 mov	r5, r3
 f1 28                 mov	r6, r0
 0e                    mov	r7, r6
 f4 8f                 lsr16.1	r7
 1c                    add	r7, r4
 f6 0f                 st8	[r5+], r7
 c8 11                 addi.s8	r4, 0x11
 f4 ae                 inc16	r6
 ce 40                 cmpi.s8	r6, 0x40
 d1 f2                 brne8	avm_test_main+180
 e1 65 02              call16	call_save
 f0 09 1d              addi.s8	r1, 0x1d
 f4 aa                 inc16	r2
 f0 0e 47              cmpi.s8	r2, 0x47
 d1 df                 brne8	avm_test_main+174
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 c2 f6                 ldi8	r6, 0xf6
 0c                    mov	r7, r4
 f4 8f                 lsr16.1	r7
 1e                    add	r7, r6
 f6 0f                 st8	[r5+], r7
 ca 11                 addi.s8	r6, 0x11
 f4 ac                 inc16	r4
 cc 40                 cmpi.s8	r4, 0x40
 d1 f2                 brne8	avm_test_main+213
 e1 36 02              call16	call_save_exists
 f4 58                 stsp16	[sp+0x6], r4
 f2 30                 sub	r0, r0
 f0 01 ee              ldi8	r1, 0xee
 f0 06 00 01           ldi16	r2, 0x100
 e1 2f 02              call16	call_load
 f4 50                 stsp16	[sp+0x4], r4
 f1 20                 mov	r4, r0
 f0 6c a5              ld8u	r5, [r2+]
 f1 18                 mov	r3, r0
 f4 8b                 lsr16.1	r3
 f2 19                 add	r3, r1
 f0 09 11              addi.s8	r1, 0x11
 f4 ac                 inc16	r4
 f1 73                 zext8	r3
 f5 1d                 cmp	r3, r5
 d1 07                 brne8	avm_test_main+275
 f0 0c 3f              cmpi.s8	r0, 0x3f
 f1 04                 mov	r0, r4
 d1 e5                 brne8	avm_test_main+248
 f4 49                 stsp16	[sp+0x2], r5
 c0 45                 ldi8	r4, 0x45
 c5 41 01              ldi16	r5, 0x141
 f7 0f                 ld8u	r7, [r5+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a7                 tst8	r7
 03                    mov	r4, r7
 d1 f5                 brne8	avm_test_main+282
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 01                 ldi8	r4, 0x1
 f0 31 00              ldsp16	r1, [sp+0x0]
 f1 25                 mov	r5, r1
 f1 14                 mov	r2, r4
 84                    and	r5, r4
 f0 00 30              ldi8	r0, 0x30
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c2 4c                 ldi8	r6, 0x4c
 c7 44 01              ldi16	r7, 0x144
 f7 1d                 ld8u	r5, [r7+]
 02                    mov	r4, r6
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 09                    mov	r6, r5
 d1 f4                 brne8	avm_test_main+332
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 35 14              ldsp16	r5, [sp+0x14]
 f9 a8                 and	r5, r2
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 55                 ldi8	r4, 0x55
 c7 47 01              ldi16	r7, 0x147
 f7 1d                 ld8u	r5, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 01                    mov	r4, r5
 d1 f5                 brne8	avm_test_main+375
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 f0 35 10              ldsp16	r5, [sp+0x10]
 34                    cmp	r5, r4
 f8 05                 cset.eq	r5
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 c7 4a 01              ldi16	r7, 0x14a
 f7 1d                 ld8u	r5, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 01                    mov	r4, r5
 d1 f5                 brne8	avm_test_main+421
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 39                 ldsp16	r5, [sp+0xe]
 f9 a8                 and	r5, r2
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 c7 4d 01              ldi16	r7, 0x14d
 f7 1d                 ld8u	r5, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 01                    mov	r4, r5
 d1 f5                 brne8	avm_test_main+462
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 31                 ldsp16	r5, [sp+0xc]
 f9 a8                 and	r5, r2
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 c7 50 01              ldi16	r7, 0x150
 f7 1d                 ld8u	r5, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 01                    mov	r4, r5
 d1 f5                 brne8	avm_test_main+503
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 21                 ldsp16	r5, [sp+0x8]
 34                    cmp	r5, r4
 f8 05                 cset.eq	r5
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 c7 53 01              ldi16	r7, 0x153
 f7 1d                 ld8u	r5, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 01                    mov	r4, r5
 d1 f5                 brne8	avm_test_main+547
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 c7 56 01              ldi16	r7, 0x156
 f7 1d                 ld8u	r5, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 01                    mov	r4, r5
 d1 f5                 brne8	avm_test_main+583
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 19                 ldsp16	r5, [sp+0x6]
 f9 a8                 and	r5, r2
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 c7 59 01              ldi16	r7, 0x159
 f7 1d                 ld8u	r5, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 01                    mov	r4, r5
 d1 f5                 brne8	avm_test_main+624
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 11                 ldsp16	r5, [sp+0x4]
 f9 a8                 and	r5, r2
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 53                 ldi8	r4, 0x53
 c7 5c 01              ldi16	r7, 0x15c
 f7 1d                 ld8u	r5, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 01                    mov	r4, r5
 d1 f5                 brne8	avm_test_main+665
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 f5 1c                 cmp	r3, r4
 f8 05                 cset.eq	r5
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 44                 ldi8	r4, 0x44
 c7 5f 01              ldi16	r7, 0x15f
 f7 1d                 ld8u	r5, [r7+]
 f1 74                 zext8	r4
 d7 00                 sys	debug_putc
 f4 a5                 tst8	r5
 01                    mov	r4, r5
 d1 f5                 brne8	avm_test_main+708
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f0 34 14              ldsp16	r4, [sp+0x14]
 f9 31                 or	r1, r4
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 c4 ff ff              ldi16	r4, 0xffff
 f9 86                 xor	r4, r1
 f0 35 12              ldsp16	r5, [sp+0x12]
 f0 36 10              ldsp16	r6, [sp+0x10]
 39                    cmp	r6, r5
 f8 05                 cset.eq	r5
 84                    and	r5, r4
 f4 38                 ldsp16	r4, [sp+0xe]
 84                    and	r5, r4
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 84                    and	r5, r4
 f4 28                 ldsp16	r4, [sp+0xa]
 f4 22                 ldsp16	r6, [sp+0x8]
 38                    cmp	r6, r4
 f8 06                 cset.eq	r6
 89                    and	r6, r5
 f4 18                 ldsp16	r4, [sp+0x6]
 88                    and	r6, r4
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 88                    and	r6, r4
 f4 08                 ldsp16	r4, [sp+0x2]
 f5 1c                 cmp	r3, r4
 f8 0c                 cset.ne	r4
 f9 ca                 xor	r6, r2
 98                    or	r6, r4
 02                    mov	r4, r6
 d6 16                 adjsp	0x16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
 ef                    ret

<call_save_exists>:
 d7 2e                 sys	save_exists
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<call_load>:
 d7 2d                 sys	load
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<call_save>:
 d7 2c                 sys	save
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
