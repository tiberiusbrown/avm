
fenv.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 fenv.c
00000000 l    d  .text.feclearexcept	00000000 .text.feclearexcept
00000000 l    d  .text.fegetexceptflag	00000000 .text.fegetexceptflag
00000000 l    d  .text.feraiseexcept	00000000 .text.feraiseexcept
00000000 l    d  .text.fesetexceptflag	00000000 .text.fesetexceptflag
00000000 l    d  .text.fetestexcept	00000000 .text.fetestexcept
00000000 l    d  .text.fegetround	00000000 .text.fegetround
00000000 l    d  .text.fesetround	00000000 .text.fesetround
00000000 l    d  .text.fegetenv	00000000 .text.fegetenv
00000000 l    d  .text.feholdexcept	00000000 .text.feholdexcept
00000000 l    d  .text.fesetenv	00000000 .text.fesetenv
00000000 l    d  .text.feupdateenv	00000000 .text.feupdateenv
00000000 g     F .text.feclearexcept	00000005 feclearexcept
00000000 g     F .text.fegetexceptflag	0000000f fegetexceptflag
00000000 g     F .text.feraiseexcept	00000005 feraiseexcept
00000000 g     F .text.fesetexceptflag	00000005 fesetexceptflag
00000000 g     F .text.fetestexcept	00000002 fetestexcept
00000000 g     F .text.fegetround	00000002 fegetround
00000000 g     F .text.fesetround	00000005 fesetround
00000000 g     F .text.fegetenv	00000004 fegetenv
00000000 g     F .text.feholdexcept	00000004 feholdexcept
00000000 g     F .text.fesetenv	00000002 fesetenv
00000000 g     F .text.feupdateenv	00000002 feupdateenv

Disassembly of section .text.feclearexcept:

<feclearexcept>:
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

Disassembly of section .text.fegetexceptflag:

<fegetexceptflag>:
 08                    mov	r6, r4
 f6 2d                 tst16	r5
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	fegetexceptflag
		R_AVM_FAR24	.text.fegetexceptflag+0xc
<L0>:
 c0 01                 ldi8	r4, 0x1
 ef                    ret
 a0                    xor	r4, r4
 58                    st8	[r6], r4
 ef                    ret

Disassembly of section .text.feraiseexcept:

<feraiseexcept>:
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

Disassembly of section .text.fesetexceptflag:

<fesetexceptflag>:
 f6 2d                 tst16	r5
 f8 0c                 cset.ne	r4
 ef                    ret

Disassembly of section .text.fetestexcept:

<fetestexcept>:
 a0                    xor	r4, r4
 ef                    ret

Disassembly of section .text.fegetround:

<fegetround>:
 a0                    xor	r4, r4
 ef                    ret

Disassembly of section .text.fesetround:

<fesetround>:
 f6 2c                 tst16	r4
 f8 0c                 cset.ne	r4
 ef                    ret

Disassembly of section .text.fegetenv:

<fegetenv>:
 a5                    xor	r5, r5
 51                    st8	[r4], r5
 01                    mov	r4, r5
 ef                    ret

Disassembly of section .text.feholdexcept:

<feholdexcept>:
 a5                    xor	r5, r5
 51                    st8	[r4], r5
 01                    mov	r4, r5
 ef                    ret

Disassembly of section .text.fesetenv:

<fesetenv>:
 a0                    xor	r4, r4
 ef                    ret

Disassembly of section .text.feupdateenv:

<feupdateenv>:
 a0                    xor	r4, r4
 ef                    ret
