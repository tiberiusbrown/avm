
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_control.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_control.c
00000406 l     F .text	00000032 loop_control
00000438 l     F .text	00000069 run_state_machine
000003b9 l     F .text	00000011 dense_switch
000003ca l     F .text	0000003c sparse_switch
00000000 l    df *ABS*	00000000 runtime.c
00000100 g     F .text	00000016 _start
00000116 g     F .text	000002a3 avm_test_main
000004a1 g     F .text	00000002 avm_halt

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
 e1 8b 03              call16	avm_halt

<avm_test_main>:
 b3                    push16	r3
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 d6 e4                 adjsp	-0x1c
 e1 e7 02              call16	loop_control
 f0 3c 18              stsp16	[sp+0x18], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 f0 02 30              ldi8	r2, 0x30
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 c0 a0                 ldi8	r4, 0xa0
 3c                    cmp	r7, r4
 f1 04                 mov	r0, r4
 fc 35                 cmov.ult	r6, r5
 f0 3e 10              stsp16	[sp+0x10], r6
 e1 fb 02              call16	run_state_machine
 f0 3c 1a              stsp16	[sp+0x1a], r4
 0c                    mov	r7, r4
 f1 77                 zext8	r7
 0b                    mov	r6, r7
 fa 94                 lsr16i	r6, 0x4
 06                    mov	r5, r6
 f9 a9                 or	r5, r2
 ca 37                 addi.s8	r6, 0x37
 f5 2c                 cmp	r7, r0
 fc 35                 cmov.ult	r6, r5
 f0 3e 12              stsp16	[sp+0x12], r6
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 a0                    xor	r4, r4
 e1 5b 02              call16	dense_switch
 f1 04                 mov	r0, r4
 c0 01                 ldi8	r4, 0x1
 e1 54 02              call16	dense_switch
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 c0 02                 ldi8	r4, 0x2
 e1 4b 02              call16	dense_switch
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 c0 03                 ldi8	r4, 0x3
 e1 42 02              call16	dense_switch
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 c0 04                 ldi8	r4, 0x4
 e1 39 02              call16	dense_switch
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 c0 05                 ldi8	r4, 0x5
 e1 30 02              call16	dense_switch
 f1 0c                 mov	r1, r4
 f2 08                 add	r1, r0
 c0 06                 ldi8	r4, 0x6
 e1 27 02              call16	dense_switch
 f1 04                 mov	r0, r4
 f2 01                 add	r0, r1
 c0 07                 ldi8	r4, 0x7
 e1 1e 02              call16	dense_switch
 f1 1c                 mov	r3, r4
 f2 18                 add	r3, r0
 c0 08                 ldi8	r4, 0x8
 e1 15 02              call16	dense_switch
 f1 04                 mov	r0, r4
 f2 03                 add	r0, r3
 c0 09                 ldi8	r4, 0x9
 e1 0c 02              call16	dense_switch
 f1 1c                 mov	r3, r4
 f2 18                 add	r3, r0
 f0 00 0a              ldi8	r0, 0xa
 f1 20                 mov	r4, r0
 e1 00 02              call16	dense_switch
 f1 0c                 mov	r1, r4
 f2 0b                 add	r1, r3
 c0 0b                 ldi8	r4, 0xb
 e1 f7 01              call16	dense_switch
 f2 21                 add	r4, r1
 f0 03 0f              ldi8	r3, 0xf
 0c                    mov	r7, r4
 f0 3c 16              stsp16	[sp+0x16], r4
 f9 ec                 and	r7, r3
 07                    mov	r5, r7
 f9 a9                 or	r5, r2
 cf 0a                 cmpi.s8	r7, 0xa
 cb 37                 addi.s8	r7, 0x37
 fc 3d                 cmov.ult	r7, r5
 04                    mov	r5, r4
 f1 75                 zext8	r5
 f0 01 a0              ldi8	r1, 0xa0
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 09                    mov	r6, r5
 f9 c9                 or	r6, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2e                 cmov.ult	r5, r6
 c0 3d                 ldi8	r4, 0x3d
 d7 00                 sys	debug_putc
 f1 22                 mov	r4, r2
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 fa 78                 lsr16i	r4, 0x8
 f9 89                 or	r4, r2
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 43                 ldi8	r4, 0x43
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 c0 01                 ldi8	r4, 0x1
 e1 bb 01              call16	sparse_switch
 c5 1e 1e              ldi16	r5, 0x1e1e
 a4                    xor	r5, r4
 15                    add	r5, r5
 fa 7f                 lsr16i	r4, 0xf
 91                    or	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 c0 11                 ldi8	r4, 0x11
 e1 ab 01              call16	sparse_switch
 f0 35 14              ldsp16	r5, [sp+0x14]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 c4 01 01              ldi16	r4, 0x101
 e1 99 01              call16	sparse_switch
 f0 35 14              ldsp16	r5, [sp+0x14]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 c4 00 10              ldi16	r4, 0x1000
 e1 87 01              call16	sparse_switch
 f0 35 14              ldsp16	r5, [sp+0x14]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 c4 00 80              ldi16	r4, 0x8000
 e1 75 01              call16	sparse_switch
 f0 35 14              ldsp16	r5, [sp+0x14]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 f0 3c 14              stsp16	[sp+0x14], r4
 c0 07                 ldi8	r4, 0x7
 e1 64 01              call16	sparse_switch
 f0 35 14              ldsp16	r5, [sp+0x14]
 a1                    xor	r4, r5
 04                    mov	r5, r4
 0c                    mov	r7, r4
 f0 3f 14              stsp16	[sp+0x14], r7
 f1 75                 zext8	r5
 f5 25                 cmp	r5, r1
 fa 84                 lsr16i	r5, 0x4
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 61                 stsp16	[sp+0x8], r5
 f0 35 18              ldsp16	r5, [sp+0x18]
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 7a                 stsp16	[sp+0xe], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 6a                 stsp16	[sp+0xa], r6
 f0 35 1a              ldsp16	r5, [sp+0x1a]
 09                    mov	r6, r5
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 72                 stsp16	[sp+0xc], r6
 09                    mov	r6, r5
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f4 5a                 stsp16	[sp+0x6], r6
 07                    mov	r5, r7
 f9 ac                 and	r5, r3
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 cd 0a                 cmpi.s8	r5, 0xa
 c9 37                 addi.s8	r5, 0x37
 fc 2c                 cmov.ult	r5, r4
 f4 49                 stsp16	[sp+0x2], r5
 0b                    mov	r6, r7
 fa 98                 lsr16i	r6, 0x8
 f9 cc                 and	r6, r3
 02                    mov	r4, r6
 f9 89                 or	r4, r2
 ce 0a                 cmpi.s8	r6, 0xa
 ca 37                 addi.s8	r6, 0x37
 fc 34                 cmov.ult	r6, r4
 f0 37 18              ldsp16	r7, [sp+0x18]
 03                    mov	r4, r7
 fa 7c                 lsr16i	r4, 0xc
 04                    mov	r5, r4
 f9 a9                 or	r5, r2
 c8 37                 addi.s8	r4, 0x37
 f0 07 00 a0           ldi16	r3, 0xa000
 f5 2f                 cmp	r7, r3
 fc 25                 cmov.ult	r4, r5
 f4 40                 stsp16	[sp+0x0], r4
 f0 37 1a              ldsp16	r7, [sp+0x1a]
 07                    mov	r5, r7
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 89                 or	r4, r2
 c9 37                 addi.s8	r5, 0x37
 f5 2f                 cmp	r7, r3
 fc 2c                 cmov.ult	r5, r4
 f4 51                 stsp16	[sp+0x4], r5
 f0 34 14              ldsp16	r4, [sp+0x14]
 04                    mov	r5, r4
 fa 8c                 lsr16i	r5, 0xc
 f9 55                 or	r2, r5
 c9 37                 addi.s8	r5, 0x37
 f5 23                 cmp	r4, r3
 fc 2a                 cmov.ult	r5, r2
 c7 10 e6              ldi16	r7, 0xe610
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 33                    cmp	r4, r7
 f8 0a                 cset.ne	r2
 c7 e4 41              ldi16	r7, 0x41e4
 f0 34 18              ldsp16	r4, [sp+0x18]
 33                    cmp	r4, r7
 f8 0b                 cset.ne	r3
 c7 c0 04              ldi16	r7, 0x4c0
 f0 34 16              ldsp16	r4, [sp+0x16]
 33                    cmp	r4, r7
 f8 0f                 cset.ne	r7
 f0 00 3d              ldi8	r0, 0x3d
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 c4 bc 44              ldi16	r4, 0x44bc
 f0 35 14              ldsp16	r5, [sp+0x14]
 34                    cmp	r5, r4
 f8 0d                 cset.ne	r5
 97                    or	r5, r7
 f9 ad                 or	r5, r3
 c3 0a                 ldi8	r7, 0xa
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 c2 43                 ldi8	r6, 0x43
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f9 a9                 or	r5, r2
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 10              ldsp16	r4, [sp+0x10]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f4 18                 ldsp16	r4, [sp+0x6]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 c0 39                 ldi8	r4, 0x39
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 03                    mov	r4, r7
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d6 1c                 adjsp	0x1c
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 bb                    pop16	r3
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
 c5 11 11              ldi16	r5, 0x1111
 cc 11                 cmpi.s8	r4, 0x11
 d3 15                 brslt8	sparse_switch+28
 c5 00 10              ldi16	r5, 0x1000
 31                    cmp	r4, r5
 d0 1b                 breq8	sparse_switch+40
 c5 01 01              ldi16	r5, 0x101
 31                    cmp	r4, r5
 d0 1a                 breq8	sparse_switch+45
 cc 11                 cmpi.s8	r4, 0x11
 d1 20                 brne8	sparse_switch+55
 c5 22 22              ldi16	r5, 0x2222
 01                    mov	r4, r5
 ef                    ret
 c6 00 80              ldi16	r6, 0x8000
 32                    cmp	r4, r6
 d0 10                 breq8	sparse_switch+50
 cc 01                 cmpi.s8	r4, 0x1
 d1 11                 brne8	sparse_switch+55
 01                    mov	r4, r5
 ef                    ret
 c5 44 44              ldi16	r5, 0x4444
 01                    mov	r4, r5
 ef                    ret
 c5 33 33              ldi16	r5, 0x3333
 01                    mov	r4, r5
 ef                    ret
 c5 55 55              ldi16	r5, 0x5555
 01                    mov	r4, r5
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
 d1 0f                 brne8	loop_control+37
 f2 28                 add	r6, r0
 f4 af                 inc16	r7
 cf 40                 cmpi.s8	r7, 0x40
 d0 11                 breq8	loop_control+47
 07                    mov	r5, r7
 f9 a4                 and	r5, r1
 cd 01                 cmpi.s8	r5, 0x1
 d0 f1                 breq8	loop_control+22
 04                    mov	r5, r4
 fa 8f                 lsr16i	r5, 0xf
 10                    add	r4, r4
 91                    or	r4, r5
 a2                    xor	r4, r6
 cf 25                 cmpi.s8	r7, 0x25
 d1 e7                 brne8	loop_control+22
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
 d9 25                 brsge8	run_state_machine+57
 d4 0e                 jmp8	run_state_machine+36
 11                    add	r4, r5
 c3 02                 ldi8	r7, 0x2
 c9 11                 addi.s8	r5, 0x11
 36                    cmp	r5, r6
 d0 48                 breq8	run_state_machine+102
 f1 77                 zext8	r7
 cf 02                 cmpi.s8	r7, 0x2
 d9 15                 brsge8	run_state_machine+57
 f4 a7                 tst8	r7
 d0 26                 breq8	run_state_machine+78
 cf 01                 cmpi.s8	r7, 0x1
 d1 ea                 brne8	run_state_machine+22
 c7 22 22              ldi16	r7, 0x2222
 a3                    xor	r4, r7
 c3 04                 ldi8	r7, 0x4
 c9 11                 addi.s8	r5, 0x11
 36                    cmp	r5, r6
 d1 e7                 brne8	run_state_machine+30
 d4 2d                 jmp8	run_state_machine+102
 cf 02                 cmpi.s8	r7, 0x2
 d0 1c                 breq8	run_state_machine+89
 cf 03                 cmpi.s8	r7, 0x3
 d1 d5                 brne8	run_state_machine+22
 c7 cd fc              ldi16	r7, 0xfccd
 13                    add	r4, r7
 c3 01                 ldi8	r7, 0x1
 c9 11                 addi.s8	r5, 0x11
 36                    cmp	r5, r6
 d1 d2                 brne8	run_state_machine+30
 d4 18                 jmp8	run_state_machine+102
 f2 20                 add	r4, r0
 c3 03                 ldi8	r7, 0x3
 c9 11                 addi.s8	r5, 0x11
 36                    cmp	r5, r6
 d1 c7                 brne8	run_state_machine+30
 d4 0d                 jmp8	run_state_machine+102
 0c                    mov	r7, r4
 fa ad                 lsr16i	r7, 0xd
 10                    add	r4, r4
 10                    add	r4, r4
 10                    add	r4, r4
 93                    or	r4, r7
 af                    xor	r7, r7
 c9 11                 addi.s8	r5, 0x11
 36                    cmp	r5, r6
 d1 b8                 brne8	run_state_machine+30
 a3                    xor	r4, r7
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
