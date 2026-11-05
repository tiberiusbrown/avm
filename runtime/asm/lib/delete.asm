
delete.o:	file format elf32-avm

SYMBOL TABLE:
00000000 l    df *ABS*	00000000 delete.cpp
00000000 l    d  .text._ZdlPv	00000000 .text._ZdlPv
00000000 l    d  .text._ZdlPvRKSt9nothrow_t	00000000 .text._ZdlPvRKSt9nothrow_t
00000000 l    d  .text._ZdlPvj	00000000 .text._ZdlPvj
00000000 l    d  .text._ZdaPv	00000000 .text._ZdaPv
00000000 l    d  .text._ZdaPvRKSt9nothrow_t	00000000 .text._ZdaPvRKSt9nothrow_t
00000000 l    d  .text._ZdaPvj	00000000 .text._ZdaPvj
00000000 l    d  .text._ZdlPvSt11align_val_t	00000000 .text._ZdlPvSt11align_val_t
00000000 l    d  .text._ZdlPvSt11align_val_tRKSt9nothrow_t	00000000 .text._ZdlPvSt11align_val_tRKSt9nothrow_t
00000000 l    d  .text._ZdlPvjSt11align_val_t	00000000 .text._ZdlPvjSt11align_val_t
00000000 l    d  .text._ZdaPvSt11align_val_t	00000000 .text._ZdaPvSt11align_val_t
00000000 l    d  .text._ZdaPvSt11align_val_tRKSt9nothrow_t	00000000 .text._ZdaPvSt11align_val_tRKSt9nothrow_t
00000000 l    d  .text._ZdaPvjSt11align_val_t	00000000 .text._ZdaPvjSt11align_val_t
00000000 l    d  .debug_frame	00000000 .debug_frame
00000000  w    F .text._ZdlPv	00000004 operator delete(void*)
00000000         *UND*	00000000 free
00000000  w    F .text._ZdlPvRKSt9nothrow_t	00000004 operator delete(void*, std::nothrow_t const&)
00000000  w    F .text._ZdlPvj	00000004 operator delete(void*, unsigned int)
00000000  w    F .text._ZdaPv	00000004 operator delete[](void*)
00000000  w    F .text._ZdaPvRKSt9nothrow_t	00000004 operator delete[](void*, std::nothrow_t const&)
00000000  w    F .text._ZdaPvj	00000004 operator delete[](void*, unsigned int)
00000000  w    F .text._ZdlPvSt11align_val_t	00000018 operator delete(void*, std::align_val_t)
00000000  w    F .text._ZdlPvSt11align_val_tRKSt9nothrow_t	00000004 operator delete(void*, std::align_val_t, std::nothrow_t const&)
00000000  w    F .text._ZdlPvjSt11align_val_t	00000005 operator delete(void*, unsigned int, std::align_val_t)
00000000  w    F .text._ZdaPvSt11align_val_t	00000004 operator delete[](void*, std::align_val_t)
00000000  w    F .text._ZdaPvSt11align_val_tRKSt9nothrow_t	00000004 operator delete[](void*, std::align_val_t, std::nothrow_t const&)
00000000  w    F .text._ZdaPvjSt11align_val_t	00000005 operator delete[](void*, unsigned int, std::align_val_t)

Disassembly of section .text._ZdlPv:

<operator delete(void*)>:
 e2 00 00 00           jmpf	_ZdlPv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	free

Disassembly of section .text._ZdlPvRKSt9nothrow_t:

<operator delete(void*, std::nothrow_t const&)>:
 e2 00 00 00           jmpf	_ZdlPvRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*)

Disassembly of section .text._ZdlPvj:

<operator delete(void*, unsigned int)>:
 e2 00 00 00           jmpf	_ZdlPvj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*)

Disassembly of section .text._ZdaPv:

<operator delete[](void*)>:
 e2 00 00 00           jmpf	_ZdaPv
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*)

Disassembly of section .text._ZdaPvRKSt9nothrow_t:

<operator delete[](void*, std::nothrow_t const&)>:
 e2 00 00 00           jmpf	_ZdaPvRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete[](void*)

Disassembly of section .text._ZdaPvj:

<operator delete[](void*, unsigned int)>:
 e2 00 00 00           jmpf	_ZdaPvj
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete[](void*)

Disassembly of section .text._ZdlPvSt11align_val_t:

<operator delete(void*, std::align_val_t)>:
 f6 2c                 tst16	r4
 d1 04                 brne8	0x4 <L0>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZdlPvSt11align_val_t
		R_AVM_FAR24	.text._ZdlPvSt11align_val_t+0x17
<L0>:
 cd 02                 cmpi.s8	r5, 0x2
 d8 04                 bruge8	0x4 <L1>
		R_AVM_RELAX	*ABS*
 e2 00 00 00           jmpf	_ZdlPvSt11align_val_t
		R_AVM_FAR24	.text._ZdlPvSt11align_val_t+0x13
<L1>:
 ed 98 1e              ld16	r4, [r4-2]
 e3 00 00 00           callf	_ZdlPvSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	free
 ef                    ret

Disassembly of section .text._ZdlPvSt11align_val_tRKSt9nothrow_t:

<operator delete(void*, std::align_val_t, std::nothrow_t const&)>:
 e2 00 00 00           jmpf	_ZdlPvSt11align_val_tRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, std::align_val_t)

Disassembly of section .text._ZdlPvjSt11align_val_t:

<operator delete(void*, unsigned int, std::align_val_t)>:
 06                    mov	r5, r6
 e2 00 00 00           jmpf	_ZdlPvjSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, std::align_val_t)

Disassembly of section .text._ZdaPvSt11align_val_t:

<operator delete[](void*, std::align_val_t)>:
 e2 00 00 00           jmpf	_ZdaPvSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete(void*, std::align_val_t)

Disassembly of section .text._ZdaPvSt11align_val_tRKSt9nothrow_t:

<operator delete[](void*, std::align_val_t, std::nothrow_t const&)>:
 e2 00 00 00           jmpf	_ZdaPvSt11align_val_tRKSt9nothrow_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete[](void*, std::align_val_t)

Disassembly of section .text._ZdaPvjSt11align_val_t:

<operator delete[](void*, unsigned int, std::align_val_t)>:
 06                    mov	r5, r6
 e2 00 00 00           jmpf	_ZdaPvjSt11align_val_t
		R_AVM_RELAX	*ABS*
		R_AVM_FAR24	operator delete[](void*, std::align_val_t)
