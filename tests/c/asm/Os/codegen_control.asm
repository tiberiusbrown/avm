
codegen_control.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
0000021e l     F .text	0000004a avm_run_constructors
00000268 l     F .text	0000006f avm_run_destructors
00000000 l    df *ABS*	00000000 codegen_control.c
00000512 l     F .text	00000011 dense_switch
00000100 l     O .data	0000000c .L__const.avm_test_main.sparse_inputs
00000523 l     F .text	00000037 sparse_switch
0000055a l     F .text	0000002c loop_control
00000586 l     F .text	00000062 run_state_machine
00000000 l    df *ABS*	00000000 runtime.c
000005ea l       .init_array	00000000 .hidden __init_array_end
000005ea l       .init_array	00000000 .hidden __init_array_start
000005ea l       .fini_array	00000000 .hidden __fini_array_start
000005ea l       .fini_array	00000000 .hidden __fini_array_end
00000200 g     F .text	0000001e _start
000002d7 g     F .text	0000023b avm_test_main
000005e8 g     F .text	00000002 avm_halt
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
 e1 ca 03              call16	avm_halt

<avm_run_constructors>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 fc                 adjsp	-0x4
 c4 ea 05              ldi16	r4, 0x5ea
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 ea 05              ldi16	r6, 0x5ea
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2a                 breq8	avm_run_constructors+67
 f0 04 ea 05           ldi16	r0, 0x5ea
 f0 01 00              ldi8	r1, 0x0
 c0 03                 ldi8	r4, 0x3
 a5                    xor	r5, r5
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 06 ea 05           ldi16	r2, 0x5ea
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
 c4 ea 05              ldi16	r4, 0x5ea
 c1 00                 ldi8	r5, 0x0
 f1 75                 zext8	r5
 c6 ea 05              ldi16	r6, 0x5ea
 c3 00                 ldi8	r7, 0x0
 f1 77                 zext8	r7
 f0 69 c8              cmp32	q3, q2
 d0 2d                 breq8	avm_run_destructors+87
 f0 06 ea 05           ldi16	r2, 0x5ea
 f0 03 00              ldi8	r3, 0x0
 c4 fd ff              ldi16	r4, 0xfffd
 c5 ff ff              ldi16	r5, 0xffff
 f4 40                 stsp16	[sp+0x0], r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 04 ea 05           ldi16	r0, 0x5ea
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
 d6 dc                 adjsp	-0x24
 a5                    xor	r5, r5
 f1 05                 mov	r0, r5
 f0 3d 22              stsp16	[sp+0x22], r5
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 e1 2a 02              call16	dense_switch
 f0 35 22              ldsp16	r5, [sp+0x22]
 14                    add	r5, r4
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 cc 0c                 cmpi.s8	r4, 0xc
 d1 e8                 brne8	avm_test_main+7
 f0 3d 22              stsp16	[sp+0x22], r5
 c6 0f 0f              ldi16	r6, 0xf0f
 f0 04 00 01           ldi16	r0, 0x100
 f0 01 06              ldi8	r1, 0x6
 f0 3e 20              stsp16	[sp+0x20], r6
 f0 6c 91              ld16	r4, [r0+]
 e1 17 02              call16	sparse_switch
 f0 36 20              ldsp16	r6, [sp+0x20]
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 fa 51                 lsl16i	r6, 0x1
 99                    or	r6, r5
 a8                    xor	r6, r4
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 e7                 brne8	avm_test_main+44
 f0 34 22              ldsp16	r4, [sp+0x22]
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 f0 00 30              ldi8	r0, 0x30
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 f0 01 a0              ldi8	r1, 0xa0
 f5 21                 cmp	r4, r1
 fc 3d                 cmov.ult	r7, r5
 f0 3f 14              stsp16	[sp+0x14], r7
 02                    mov	r4, r6
 f1 74                 zext8	r4
 0c                    mov	r7, r4
 fa a4                 lsr16i	r7, 0x4
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3d                 cmov.ult	r7, r5
 f0 3f 16              stsp16	[sp+0x16], r7
 f0 3e 20              stsp16	[sp+0x20], r6
 e1 0c 02              call16	loop_control
 f0 3c 1c              stsp16	[sp+0x1c], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 18              stsp16	[sp+0x18], r6
 e1 20 02              call16	run_state_machine
 f0 3c 1e              stsp16	[sp+0x1e], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ca 37                 addi.s8	r6, 0x37
 f5 2d                 cmp	r7, r1
 fc 35                 cmov.ult	r6, r5
 f0 3e 1a              stsp16	[sp+0x1a], r6
 c0 0f                 ldi8	r4, 0xf
 f0 36 22              ldsp16	r6, [sp+0x22]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 10              stsp16	[sp+0x10], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f4 5b                 stsp16	[sp+0x6], r7
 f0 36 20              ldsp16	r6, [sp+0x20]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f0 3f 12              stsp16	[sp+0x12], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f4 6b                 stsp16	[sp+0xa], r7
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 0e                    mov	r7, r6
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f4 7b                 stsp16	[sp+0xe], r7
 0e                    mov	r7, r6
 fa a8                 lsr16i	r7, 0x8
 8c                    and	r7, r4
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 f4 63                 stsp16	[sp+0x8], r7
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 0b                    mov	r6, r7
 88                    and	r6, r4
 06                    mov	r5, r6
 f9 a1                 or	r5, r0
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 35                 cmov.ult	r6, r5
 f4 72                 stsp16	[sp+0xc], r6
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 84                    and	r5, r4
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 22              ldsp16	r4, [sp+0x22]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 07                    mov	r5, r7
 f9 a1                 or	r5, r0
 cb 37                 addi.s8	r7, 0x37
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 21                 cmp	r4, r1
 fc 3d                 cmov.ult	r7, r5
 f0 36 20              ldsp16	r6, [sp+0x20]
 02                    mov	r4, r6
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a1                 or	r5, r0
 c8 37                 addi.s8	r4, 0x37
 f5 29                 cmp	r6, r1
 fc 25                 cmov.ult	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 36 1c              ldsp16	r6, [sp+0x1c]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 f5 29                 cmp	r6, r1
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 01                    mov	r4, r5
 fa 7c                 lsr16i	r4, 0xc
 f9 11                 or	r0, r4
 c8 37                 addi.s8	r4, 0x37
 f5 25                 cmp	r5, r1
 fc 20                 cmov.ult	r4, r0
 08                    mov	r6, r4
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 30                 ldi8	r4, 0x30
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c4 bc 44              ldi16	r4, 0x44bc
 f0 35 20              ldsp16	r5, [sp+0x20]
 34                    cmp	r5, r4
 f8 0f                 cset.ne	r7
 c5 c0 04              ldi16	r5, 0x4c0
 f0 34 22              ldsp16	r4, [sp+0x22]
 31                    cmp	r4, r5
 f8 0d                 cset.ne	r5
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 97                    or	r5, r7
 c4 e4 41              ldi16	r4, 0x41e4
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 3c                    cmp	r7, r4
 f8 0f                 cset.ne	r7
 f0 34 14              ldsp16	r4, [sp+0x14]
 d7 00                 sys	debug_putc
 9d                    or	r7, r5
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 c4 10 e6              ldi16	r4, 0xe610
 f0 35 1e              ldsp16	r5, [sp+0x1e]
 34                    cmp	r5, r4
 f8 08                 cset.ne	r0
 f9 1d                 or	r0, r7
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 c0 39                 ldi8	r4, 0x39
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 c0 0a                 ldi8	r4, 0xa
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d6 24                 adjsp	0x24
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<dense_switch>:
 c1 11                 ldi8	r5, 0x11
 cc 08                 cmpi.s8	r4, 0x8
 f3 11                 mulu8.w	r4, r5
 c8 10                 addi.s8	r4, 0x10
 c5 99 ff              ldi16	r5, 0xff99
 fc 2c                 cmov.ult	r5, r4
 f1 75                 zext8	r5
 01                    mov	r4, r5
 ef                    ret

<sparse_switch>:
 cc 11                 cmpi.s8	r4, 0x11
 d3 14                 brslt8	sparse_switch+24
 c5 00 10              ldi16	r5, 0x1000
 31                    cmp	r4, r5
 d0 1c                 breq8	sparse_switch+38
 c5 01 01              ldi16	r5, 0x101
 31                    cmp	r4, r5
 d0 1a                 breq8	sparse_switch+42
 cc 11                 cmpi.s8	r4, 0x11
 d1 1e                 brne8	sparse_switch+50
 c4 22 22              ldi16	r4, 0x2222
 ef                    ret
 c5 00 80              ldi16	r5, 0x8000
 31                    cmp	r4, r5
 d0 10                 breq8	sparse_switch+46
 cc 01                 cmpi.s8	r4, 0x1
 d1 10                 brne8	sparse_switch+50
 c4 11 11              ldi16	r4, 0x1111
 ef                    ret
 c4 44 44              ldi16	r4, 0x4444
 ef                    ret
 c4 33 33              ldi16	r4, 0x3333
 ef                    ret
 c4 55 55              ldi16	r4, 0x5555
 ef                    ret
 c5 5a a5              ldi16	r5, 0xa55a
 a1                    xor	r4, r5
 ef                    ret

<loop_control>:
 b1                    push16	r1
 b0                    push16	r0
 c4 2b 6d              ldi16	r4, 0x6d2b
 af                    xor	r7, r7
 c2 55                 ldi8	r6, 0x55
 f0 01 03              ldi8	r1, 0x3
 f0 04 23 01           ldi16	r0, 0x123
 07                    mov	r5, r7
 f9 a4                 and	r5, r1
 cd 01                 cmpi.s8	r5, 0x1
 d0 0b                 breq8	loop_control+33
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 fa 31                 lsl16i	r4, 0x1
 91                    or	r4, r5
 a2                    xor	r4, r6
 cf 25                 cmpi.s8	r7, 0x25
 d0 08                 breq8	loop_control+41
 f2 28                 add	r6, r0
 f4 af                 inc16	r7
 cf 40                 cmpi.s8	r7, 0x40
 d1 e6                 brne8	loop_control+15
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<run_state_machine>:
 b0                    push16	r0
 c3 02                 ldi8	r7, 0x2
 c4 34 12              ldi16	r4, 0x1234
 a5                    xor	r5, r5
 f0 04 11 01           ldi16	r0, 0x111
 c6 87 01              ldi16	r6, 0x187
 f1 77                 zext8	r7
 cf 02                 cmpi.s8	r7, 0x2
 d9 15                 brsge8	run_state_machine+41
 f4 a7                 tst8	r7
 d0 30                 breq8	run_state_machine+72
 cf 01                 cmpi.s8	r7, 0x1
 d1 22                 brne8	run_state_machine+62
 c7 22 22              ldi16	r7, 0x2222
 a3                    xor	r4, r7
 c3 04                 ldi8	r7, 0x4
 c9 11                 addi.s8	r5, 0x11
 36                    cmp	r5, r6
 d1 e7                 brne8	run_state_machine+14
 d4 36                 jmp8	run_state_machine+95
 cf 02                 cmpi.s8	r7, 0x2
 d0 26                 breq8	run_state_machine+83
 cf 03                 cmpi.s8	r7, 0x3
 d1 0d                 brne8	run_state_machine+62
 c7 cd fc              ldi16	r7, 0xfccd
 13                    add	r4, r7
 c3 01                 ldi8	r7, 0x1
 c9 11                 addi.s8	r5, 0x11
 36                    cmp	r5, r6
 d1 d2                 brne8	run_state_machine+14
 d4 21                 jmp8	run_state_machine+95
 11                    add	r4, r5
 c3 02                 ldi8	r7, 0x2
 c9 11                 addi.s8	r5, 0x11
 36                    cmp	r5, r6
 d1 c8                 brne8	run_state_machine+14
 d4 17                 jmp8	run_state_machine+95
 f2 20                 add	r4, r0
 c3 03                 ldi8	r7, 0x3
 c9 11                 addi.s8	r5, 0x11
 36                    cmp	r5, r6
 d1 bd                 brne8	run_state_machine+14
 d4 0c                 jmp8	run_state_machine+95
 0c                    mov	r7, r4
 fa ad                 lsr16i	r7, 0xd
 fa 33                 lsl16i	r4, 0x3
 93                    or	r4, r7
 af                    xor	r7, r7
 c9 11                 addi.s8	r5, 0x11
 36                    cmp	r5, r6
 d1 af                 brne8	run_state_machine+14
 a3                    xor	r4, r7
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
