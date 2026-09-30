
save_load_max.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000051e l     F .text	0000004a avm_run_constructors
00000568 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 save_load_max.c
0000078a l     F .text	00000007 call_save_exists
00000100 l     O .saved	00000400 saved_state
00000791 l     F .text	00000003 call_save
00000794 l     F .text	00000007 call_load
00000000 l    df *ABS*	00000000 runtime.c
0000079d l       .init_array	00000000 .hidden __init_array_end
0000079d l       .init_array	00000000 .hidden __init_array_start
0000079d l       .fini_array	00000000 .hidden __fini_array_start
0000079d l       .fini_array	00000000 .hidden __fini_array_end
00000500 g     F .text	0000001e _start
000005d7 g     F .text	000001b3 avm_test_main
0000079b g     F .text	00000002 avm_halt
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
 e1 7d 02              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 9d 07              ldi16	r4, 0x79d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9d 07              ldi16	r6, 0x79d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 9d 07           ldi16	r0, 0x79d
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 9d 07           ldi16	r2, 0x79d
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
 e1 81 fa              call16	-1407
 c4 9d 07              ldi16	r4, 0x79d
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 9d 07              ldi16	r6, 0x79d
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 9d 07           ldi16	r2, 0x79d
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 9d 07           ldi16	r0, 0x79d
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
 e1 30 fa              call16	-1488
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
 d6 f4                 adjsp	-0xc
 f0 00 01              ldi8	r0, 0x1
 f0 01 2b              ldi8	r1, 0x2b
 e1 a4 01              call16	call_save_exists
 f4 68                 stsp16	[sp+0xa], r4
 f2 42                 sub	r2, r2
 f0 07 00 04           ldi16	r3, 0x400
 f1 21                 mov	r4, r1
 c5 00 01              ldi16	r5, 0x100
 f1 2a                 mov	r6, r2
 0e                    mov	r7, r6
 fa a3                 lsr16i	r7, 0x3
 1c                    add	r7, r4
 f6 0f                 st8	[r5+], r7
 c8 0d                 addi.s8	r4, 0xd
 f4 ae                 inc16	r6
 f5 2b                 cmp	r6, r3
 d1 f2                 brne8	avm_test_main+30
 e1 8b 01              call16	call_save
 f0 09 2b              addi.s8	r1, 0x2b
 f4 a8                 inc16	r0
 f0 0c 05              cmpi.s8	r0, 0x5
 d1 de                 brne8	avm_test_main+23
 a0                    xor	r4, r4
 f4 58                 stsp16	[sp+0x6], r4
 f0 04 00 01           ldi16	r0, 0x100
 f0 01 fa              ldi8	r1, 0xfa
 e1 6d 01              call16	call_save_exists
 f4 19                 ldsp16	r5, [sp+0x6]
 f4 60                 stsp16	[sp+0x8], r4
 01                    mov	r4, r5
 fa 73                 lsr16i	r4, 0x3
 f2 21                 add	r4, r1
 f0 6d 81              st8	[r0+], r4
 f0 09 0d              addi.s8	r1, 0xd
 f4 ad                 inc16	r5
 f5 27                 cmp	r5, r3
 d1 ef                 brne8	avm_test_main+74
 a0                    xor	r4, r4
 f4 50                 stsp16	[sp+0x4], r4
 f0 02 ac              ldi8	r2, 0xac
 f0 05 00 01           ldi16	r1, 0x100
 e1 55 01              call16	call_load
 f4 13                 ldsp16	r7, [sp+0x4]
 f4 58                 stsp16	[sp+0x6], r4
 03                    mov	r4, r7
 c6 ff 03              ldi16	r6, 0x3ff
 f0 6c 03              ld8u	r0, [r1+]
 07                    mov	r5, r7
 fa 83                 lsr16i	r5, 0x3
 f2 26                 add	r5, r2
 f0 0a 0d              addi.s8	r2, 0xd
 f4 ac                 inc16	r4
 f1 75                 zext8	r5
 f5 24                 cmp	r5, r0
 d1 04                 brne8	avm_test_main+135
 3e                    cmp	r7, r6
 0c                    mov	r7, r4
 d1 e9                 brne8	avm_test_main+112
 f4 51                 stsp16	[sp+0x4], r5
 a0                    xor	r4, r4
 c5 00 01              ldi16	r5, 0x100
 c2 1f                 ldi8	r6, 0x1f
 0c                    mov	r7, r4
 fa a3                 lsr16i	r7, 0x3
 1e                    add	r7, r6
 f6 0f                 st8	[r5+], r7
 ca 0d                 addi.s8	r6, 0xd
 f4 ac                 inc16	r4
 f5 23                 cmp	r4, r3
 d1 f2                 brne8	avm_test_main+143
 a0                    xor	r4, r4
 f4 40                 stsp16	[sp+0x0], r4
 f0 01 ac              ldi8	r1, 0xac
 f0 06 00 01           ldi16	r2, 0x100
 e1 13 01              call16	call_load
 f4 02                 ldsp16	r6, [sp+0x0]
 f4 48                 stsp16	[sp+0x2], r4
 02                    mov	r4, r6
 c5 ff 03              ldi16	r5, 0x3ff
 f0 6c 65              ld8u	r3, [r2+]
 0e                    mov	r7, r6
 fa a3                 lsr16i	r7, 0x3
 f2 2d                 add	r7, r1
 f0 09 0d              addi.s8	r1, 0xd
 f4 ac                 inc16	r4
 f1 77                 zext8	r7
 f5 2f                 cmp	r7, r3
 d1 04                 brne8	avm_test_main+201
 39                    cmp	r6, r5
 08                    mov	r6, r4
 d1 e9                 brne8	avm_test_main+178
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 c2 30                 ldi8	r6, 0x30
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f0 01 01              ldi8	r1, 0x1
 f4 29                 ldsp16	r5, [sp+0xa]
 01                    mov	r4, r5
 f9 84                 and	r4, r1
 92                    or	r4, r6
 d7 00                 sys	debug_putc
 f5 2f                 cmp	r7, r3
 f8 02                 cset.eq	r2
 f4 10                 ldsp16	r4, [sp+0x4]
 f5 20                 cmp	r4, r0
 f8 00                 cset.eq	r0
 c6 ff ff              ldi16	r6, 0xffff
 a9                    xor	r6, r5
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 45                 ldi8	r4, 0x45
 d7 00                 sys	debug_putc
 f4 23                 ldsp16	r7, [sp+0x8]
 8b                    and	r6, r7
 f0 33 06              ldsp16	r3, [sp+0x6]
 f9 cc                 and	r6, r3
 f9 c0                 and	r6, r0
 f4 09                 ldsp16	r5, [sp+0x2]
 89                    and	r6, r5
 f9 c8                 and	r6, r2
 f9 e4                 and	r7, r1
 f9 64                 and	r3, r1
 f9 a4                 and	r5, r1
 f9 c6                 xor	r6, r1
 f0 01 30              ldi8	r1, 0x30
 f9 e5                 or	r7, r1
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 2d                 mov	r7, r1
 f9 7d                 or	r3, r7
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 23                 mov	r4, r3
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f9 1d                 or	r0, r7
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 4c                 ldi8	r4, 0x4c
 d7 00                 sys	debug_putc
 97                    or	r5, r7
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f9 5d                 or	r2, r7
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d6 0c                 adjsp	0xc
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

<call_save>:
 d7 2c                 sys	save
 ef                    ret

<call_load>:
 d7 2d                 sys	load
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
