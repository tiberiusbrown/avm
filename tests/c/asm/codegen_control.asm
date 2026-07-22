
C:/Users/Brown/Documents/GitHub/avm/build/tests/c/codegen_control.elf:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 crt0_test.c
00000000 l    df *ABS*	00000000 codegen_control.c
00000478 l     F .text	00000012 dense_switch
00000100 l     O .data	0000000c .L__const.avm_test_main.sparse_inputs
0000048a l     F .text	00000037 sparse_switch
000004c1 l     F .text	00000030 loop_control
000004f1 l     F .text	0000004e run_state_machine
00000000 l    df *ABS*	00000000 runtime.c
00000200 g     F .text	00000016 _start
00000216 g     F .text	00000262 avm_test_main
0000053f g     F .text	00000002 avm_halt

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
 e1 29 03              call16	avm_halt

<avm_test_main>:
 b1                    push16	r1
 b0                    push16	r0
 d6 d8                 adjsp	-0x28
 a5                    xor	r5, r5
 f1 05                 mov	r0, r5
 f0 3d 26              stsp16	[sp+0x26], r5
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 e1 51 02              call16	dense_switch
 f0 35 26              ldsp16	r5, [sp+0x26]
 14                    add	r5, r4
 f4 a8                 inc16	r0
 f1 20                 mov	r4, r0
 f1 74                 zext8	r4
 cc 0c                 cmpi.s8	r4, 0xc
 d1 e8                 brne8	avm_test_main+7
 f0 3d 26              stsp16	[sp+0x26], r5
 c6 0f 0f              ldi16	r6, 0xf0f
 f0 04 00 01           ldi16	r0, 0x100
 f0 01 06              ldi8	r1, 0x6
 f0 3e 24              stsp16	[sp+0x24], r6
 f0 6c 91              ld16	r4, [r0+]
 e1 3f 02              call16	sparse_switch
 f0 36 24              ldsp16	r6, [sp+0x24]
 06                    mov	r5, r6
 fa 8f                 lsr16i	r5, 0xf
 fa 51                 lsl16i	r6, 0x1
 99                    or	r6, r5
 a8                    xor	r6, r4
 f4 b1                 dec16	r1
 f6 29                 tst16	r1
 d1 e7                 brne8	avm_test_main+44
 f0 34 26              ldsp16	r4, [sp+0x26]
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
 f0 3f 1a              stsp16	[sp+0x1a], r7
 f0 3e 24              stsp16	[sp+0x24], r6
 e1 34 02              call16	loop_control
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
 e1 4c 02              call16	run_state_machine
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
 f0 3e 16              stsp16	[sp+0x16], r6
 f0 01 0f              ldi8	r1, 0xf
 f0 34 26              ldsp16	r4, [sp+0x26]
 04                    mov	r5, r4
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 10              stsp16	[sp+0x10], r7
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 58                 stsp16	[sp+0x6], r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 04                    mov	r5, r4
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 0d                    mov	r7, r5
 cb 37                 addi.s8	r7, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 3e                 cmov.ult	r7, r6
 f0 3f 12              stsp16	[sp+0x12], r7
 04                    mov	r5, r4
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 68                 stsp16	[sp+0xa], r4
 f0 37 1c              ldsp16	r7, [sp+0x1c]
 07                    mov	r5, r7
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 78                 stsp16	[sp+0xe], r4
 07                    mov	r5, r7
 fa 88                 lsr16i	r5, 0x8
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 60                 stsp16	[sp+0x8], r4
 f0 37 1e              ldsp16	r7, [sp+0x1e]
 07                    mov	r5, r7
 f9 a4                 and	r5, r1
 09                    mov	r6, r5
 f9 c1                 or	r6, r0
 01                    mov	r4, r5
 c8 37                 addi.s8	r4, 0x37
 cd 0a                 cmpi.s8	r5, 0xa
 fc 26                 cmov.ult	r4, r6
 f4 70                 stsp16	[sp+0xc], r4
 fa a8                 lsr16i	r7, 0x8
 f9 e4                 and	r7, r1
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 0b                    mov	r6, r7
 ca 37                 addi.s8	r6, 0x37
 cf 0a                 cmpi.s8	r7, 0xa
 fc 34                 cmov.ult	r6, r4
 f4 52                 stsp16	[sp+0x4], r6
 f0 36 26              ldsp16	r6, [sp+0x26]
 06                    mov	r5, r6
 fa 8c                 lsr16i	r5, 0xc
 01                    mov	r4, r5
 f9 81                 or	r4, r0
 c9 37                 addi.s8	r5, 0x37
 f0 05 00 a0           ldi16	r1, 0xa000
 f5 29                 cmp	r6, r1
 fc 2c                 cmov.ult	r5, r4
 f0 34 24              ldsp16	r4, [sp+0x24]
 0c                    mov	r7, r4
 fa ac                 lsr16i	r7, 0xc
 0b                    mov	r6, r7
 f9 c1                 or	r6, r0
 cb 37                 addi.s8	r7, 0x37
 f5 21                 cmp	r4, r1
 fc 3e                 cmov.ult	r7, r6
 f4 43                 stsp16	[sp+0x0], r7
 f0 34 1c              ldsp16	r4, [sp+0x1c]
 08                    mov	r6, r4
 fa 9c                 lsr16i	r6, 0xc
 0e                    mov	r7, r6
 f9 e1                 or	r7, r0
 ca 37                 addi.s8	r6, 0x37
 f5 21                 cmp	r4, r1
 fc 37                 cmov.ult	r6, r7
 f4 4a                 stsp16	[sp+0x2], r6
 f0 36 1e              ldsp16	r6, [sp+0x1e]
 0e                    mov	r7, r6
 fa ac                 lsr16i	r7, 0xc
 03                    mov	r4, r7
 f9 81                 or	r4, r0
 cb 37                 addi.s8	r7, 0x37
 f5 29                 cmp	r6, r1
 fc 3c                 cmov.ult	r7, r4
 0b                    mov	r6, r7
 c3 43                 ldi8	r7, 0x43
 03                    mov	r4, r7
 f0 3c 22              stsp16	[sp+0x22], r4
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d7 00                 sys	debug_putc
 c0 3d                 ldi8	r4, 0x3d
 f0 3c 20              stsp16	[sp+0x20], r4
 d7 00                 sys	debug_putc
 01                    mov	r4, r5
 d7 00                 sys	debug_putc
 c4 bc 44              ldi16	r4, 0x44bc
 f0 35 24              ldsp16	r5, [sp+0x24]
 34                    cmp	r5, r4
 f8 0f                 cset.ne	r7
 c5 c0 04              ldi16	r5, 0x4c0
 f0 34 26              ldsp16	r4, [sp+0x26]
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
 f0 3c 26              stsp16	[sp+0x26], r4
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 c0 31                 ldi8	r4, 0x31
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f4 00                 ldsp16	r4, [sp+0x0]
 d7 00                 sys	debug_putc
 f4 28                 ldsp16	r4, [sp+0xa]
 d7 00                 sys	debug_putc
 f0 34 1a              ldsp16	r4, [sp+0x1a]
 d7 00                 sys	debug_putc
 f0 34 12              ldsp16	r4, [sp+0x12]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 c0 32                 ldi8	r4, 0x32
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 f4 08                 ldsp16	r4, [sp+0x2]
 d7 00                 sys	debug_putc
 f4 20                 ldsp16	r4, [sp+0x8]
 d7 00                 sys	debug_putc
 f0 34 18              ldsp16	r4, [sp+0x18]
 d7 00                 sys	debug_putc
 f4 38                 ldsp16	r4, [sp+0xe]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 c0 33                 ldi8	r4, 0x33
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 02                    mov	r4, r6
 d7 00                 sys	debug_putc
 f4 10                 ldsp16	r4, [sp+0x4]
 d7 00                 sys	debug_putc
 f0 34 16              ldsp16	r4, [sp+0x16]
 d7 00                 sys	debug_putc
 f4 30                 ldsp16	r4, [sp+0xc]
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f0 34 22              ldsp16	r4, [sp+0x22]
 d7 00                 sys	debug_putc
 c0 34                 ldi8	r4, 0x34
 d7 00                 sys	debug_putc
 f0 34 20              ldsp16	r4, [sp+0x20]
 d7 00                 sys	debug_putc
 c0 41                 ldi8	r4, 0x41
 d7 00                 sys	debug_putc
 c0 35                 ldi8	r4, 0x35
 d7 00                 sys	debug_putc
 c0 39                 ldi8	r4, 0x39
 d7 00                 sys	debug_putc
 c0 46                 ldi8	r4, 0x46
 d7 00                 sys	debug_putc
 f0 34 26              ldsp16	r4, [sp+0x26]
 d7 00                 sys	debug_putc
 f1 20                 mov	r4, r0
 d6 28                 adjsp	sparse_switch+19
 b8                    pop16	r0
 b9                    pop16	r1
 ef                    ret

<dense_switch>:
 c1 11                 ldi8	r5, 0x11
 08                    mov	r6, r4
 f3 19                 mulu8.w	r6, r5
 ca 10                 addi.s8	r6, 0x10
 c5 99 ff              ldi16	r5, 0xff99
 cc 08                 cmpi.s8	r4, 0x8
 fc 2e                 cmov.ult	r5, r6
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
 b2                    push16	r2
 b1                    push16	r1
 b0                    push16	r0
 c4 2b 6d              ldi16	r4, 0x6d2b
 a5                    xor	r5, r5
 c2 55                 ldi8	r6, 0x55
 f0 02 03              ldi8	r2, 0x3
 f0 04 23 01           ldi16	r0, 0x123
 f1 0d                 mov	r1, r5
 f9 28                 and	r1, r2
 f0 0d 01              cmpi.s8	r1, 0x1
 d0 0b                 breq8	loop_control+36
 0c                    mov	r7, r4
 fa af                 lsr16i	r7, 0xf
 fa 31                 lsl16i	r4, 0x1
 93                    or	r4, r7
 a2                    xor	r4, r6
 cd 25                 cmpi.s8	r5, 0x25
 d0 08                 breq8	loop_control+44
 f2 28                 add	r6, r0
 f4 ad                 inc16	r5
 cd 40                 cmpi.s8	r5, 0x40
 d1 e4                 brne8	loop_control+16
 b8                    pop16	r0
 b9                    pop16	r1
 ba                    pop16	r2
 ef                    ret

<run_state_machine>:
 b0                    push16	r0
 c3 02                 ldi8	r7, 0x2
 c4 34 12              ldi16	r4, 0x1234
 a5                    xor	r5, r5
 c6 11 01              ldi16	r6, 0x111
 f0 04 87 01           ldi16	r0, 0x187
 f1 77                 zext8	r7
 cf 02                 cmpi.s8	r7, 0x2
 d9 10                 brsge8	run_state_machine+36
 f4 a7                 tst8	r7
 d0 21                 breq8	run_state_machine+57
 cf 01                 cmpi.s8	r7, 0x1
 d1 18                 brne8	run_state_machine+52
 c7 22 22              ldi16	r7, 0x2222
 a3                    xor	r4, r7
 c3 04                 ldi8	r7, 0x4
 d4 21                 jmp8	run_state_machine+69
 cf 02                 cmpi.s8	r7, 0x2
 d0 16                 breq8	run_state_machine+62
 cf 03                 cmpi.s8	r7, 0x3
 d1 08                 brne8	run_state_machine+52
 c7 cd fc              ldi16	r7, 0xfccd
 13                    add	r4, r7
 c3 01                 ldi8	r7, 0x1
 d4 11                 jmp8	run_state_machine+69
 11                    add	r4, r5
 c3 02                 ldi8	r7, 0x2
 d4 0c                 jmp8	run_state_machine+69
 12                    add	r4, r6
 c3 03                 ldi8	r7, 0x3
 d4 07                 jmp8	run_state_machine+69
 0c                    mov	r7, r4
 fa ad                 lsr16i	r7, 0xd
 fa 33                 lsl16i	r4, 0x3
 93                    or	r4, r7
 af                    xor	r7, r7
 c9 11                 addi.s8	r5, 0x11
 f5 24                 cmp	r5, r0
 d1 c3                 brne8	run_state_machine+14
 a3                    xor	r4, r7
 b8                    pop16	r0
 ef                    ret

<avm_halt>:
 d4 fe                 jmp8	avm_halt
