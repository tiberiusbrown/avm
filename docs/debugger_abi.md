# AVM debugger ABI, version 2

This document specifies the debug representation of the AVM ABI in
[arch.md](arch.md). It applies to `EM_AVM` (`0x4156`) ELF32 little-endian
executables with `EF_AVM_ABI_V2`. Guest instructions, objects, and pointers
retain their architectural widths. DWARF address fields and program pointers
are three bytes; ELF section offsets remain four bytes.

## DWARF and registers

Producers emit DWARF version 4, with one-byte minimum instruction length and
three-byte address fields. A DWARF code address is a 24-bit AVM
program address. The one-byte
CFI data alignment factor permits both two-byte saved registers and a
three-byte return address. `.debug_frame` is nonallocated and must not change
the packaged image.

| DWARF number | Register | Bits | Notes |
| ---: | --- | ---: | --- |
| 0–7 | `r0`–`r7` | 16 each | A byte value occupies the low eight bits. |
| 8 | `sp` | 16 | Raw data-space address. |
| 9 | `pc` | 24 | Raw program-space address; also CFI return register. |
| 10 | `cc` | 3 | Only architectural condition bits are exposed. |
| 11–14 | `q0`–`q3` | 32 each | Aliases for `r0:r1`, `r2:r3`, `r4:r5`, `r6:r7`. |

The pair numbers are needed because code generation can place a 32-bit value
in one physical pair. A consumer must treat each pair as an alias, with the
lower numbered `r` holding bits 15:0. For a program pointer held in a pair,
bits 23:0 are the value and bits 31:24 are container padding. A pointer
stored in memory has exactly three bytes. DWARF expressions may use a pair
register for a 32-bit value or use the constituent `r` registers with
`DW_OP_piece`; either form denotes the same storage.

## Address spaces

Data pointers are raw 16-bit addresses in address space 0. Program and
function pointers are raw 24-bit addresses in address space 1. DWARF address
class 0 means data and class 1 means program. Types that denote program or
function pointers carry `DW_AT_address_class = 1`; ordinary data pointers
carry class 0. A pointer's class comes from its type, never its numeric value.

The debugger maps program addresses `p` to load addresses `p` and data
addresses `d` to load addresses `0x01000000 + d`. This mapping exists only in
the debugger. Register and memory values remain raw guest values. Code,
rodata, and function ranges use the program mapping; `.data`, `.bss`,
`.saved`, stack, and framebuffer use the data mapping. A data address and a
program address with the same low bits must resolve to different sections.
For an untyped LLDB `memory read`, `0x02000000 + p` explicitly selects
program space, including when `p` overlaps a data address. This tagged
address is a debugger-only read handle; it never appears in guest registers,
pointer objects, DWARF addresses, or ELF symbols.
`DW_OP_addr` in a variable location denotes data space unless the variable's
declared type/address class or section says otherwise. Code attributes such
as `DW_AT_low_pc` and line-table addresses denote program space.

## Frames and locations

`CALL8`, `CALL16`, `CALLF`, and `CALLP` push the address after the call as
three little-endian bytes. At callee entry, `sp` points to return-address
byte 0; the canonical frame address is `sp + 3`, and the saved return `pc`
is at CFA − 3. Incoming stack arguments start at CFA and have byte
alignment. The CFI register rule for `pc` reads a **three-byte** value from
that slot and zero extends it for the debugger. Callee-saved `r0`–`r3`
occupy two bytes each. CFI adjusts CFA after every prologue push and stack
adjustment and restores it through every epilogue action. When `r3` is a
frame pointer, CFI switches the CFA base after `GETSP r3`. Dynamic outgoing
argument allocation must not move the frame base. A missing or malformed CFI
record may fall back to a single current frame; it must not fabricate a
backtrace. `DW_OP_fbreg` is relative to the frame base established by CFI.

`DW_OP_reg*`, `DW_OP_breg*`, `DW_OP_fbreg`, `DW_OP_addr`, and `DW_OP_piece`
use the widths and address classes above. A location list gap or an absent
location for an optimized variable means unavailable/optimized out; a
debugger must not display a guessed value.

## Unwind tables and call-frame information

AVM builds emit unwind tables by default. The common compile options
`-funwind-tables` and `-fasynchronous-unwind-tables` apply to C and C++ objects,
and they require neither `-g` nor C++ exceptions. A compilation may override
them with later compile options. The compiler places call-frame information in
`.debug_frame`, which is nonallocated, rather than in the allocated
`.eh_frame`. The packaged image never contains it, so only the linked ELF
carries it. With `-fexceptions`, a function that needs an unwind entry and has
a personality also places its CFI in `.debug_frame`.

Call-frame information (CFI) gives, at each instruction address, the canonical
frame address (CFA) and the location of each saved register and of the return
`pc`. It is separate from the other debug sections. `.debug_line` maps code
addresses to source lines and exists only with `-g`. The AVD1 block maps a
trapped address to a function name and source line; it carries no CFI.

The CIE establishes `DW_CFA_def_cfa sp, 3` and `DW_CFA_offset pc, -3`. At entry,
the CFA is `sp + 3`, and the saved return `pc` is at `CFA − 3`. The data
alignment factor is −1, so rule offsets are byte counts. Each callee-saved
register `r0`–`r3` occupies a two-byte slot at the offset recorded by its
`PUSH16`. The prologue and epilogue record the CFA after every `PUSH16`,
`ADJSP`, and `POP16`. When `r3` is a frame pointer, the CFA becomes `r3 +
offset` after `GETSP r3`, with the offset unchanged. A dynamic allocation moves
`sp` but not that CFA, and `SETSP r3` restores `sp` before the frame is
released.

Each row change is a `DW_CFA_set_loc` operand rather than a relative advance.
The assembler records each row address as a three-byte absolute operand with an
`R_AVM_DEBUG24` relocation, so linker relaxation can move it, and the FDE's
initial location carries the same relocation. LLD adjusts each FDE's range
for the bytes that relaxation removes. The FDE of a discarded function keeps
its place, but its range becomes empty and its instructions become no-ops, so
it describes no code.

Code placed after an epilogue starts from the state that the epilogue leaves,
so the linked code restates its own state there: body code restates the body
state, and a shared return tail restates the state after the epilogue. This
keeps every row correct after block layout and tail duplication.

Outgoing call arguments stay inside their block. Without a frame pointer, the
CFI row after each argument-area `ADJSP` describes the stack in that block, so
branch folding neither hoists the adjustment into a predecessor nor tail-merges
it into a shared block. Every block therefore starts with no outgoing arguments
allocated, which is the state the restatement assumes.

A valid `.debug_frame` does not by itself mean that stack unwinding works on
the device. AVD1 has no unwind section. The guest unwinds only for C++ exceptions,
using the `AVEH4` block described in [arch.md](arch.md) Section 69.3. That block
is derived from `.debug_frame`, `.avm.eh_sites`, `.avm.eh_calls`, and the action
lists in `.avm.eh_sites`, and it exists only in programs that reference the exception
runtime. It is not a general debugger unwind table, and it does not describe variables
or locations.

A landing pad is entered in one of two ways, and a debugger sees both through the
installer. Selector 0 in r5 enters a cleanup pad, which runs destructors and then
calls `_Unwind_Resume`. A nonzero selector enters the handler, which calls
`__cxa_begin_catch`. The selector is the LLVM type ID of the matched catch, and the
pad compares it with the IDs of its own clauses. In both cases r4 holds the exception
header, which is 41 bytes and lies below the thrown object. Its first 15 bytes are
the landing context, and its last 15 bytes are the resume cursor that the next
`_Unwind_Resume` continues from. Bytes 15 to 17 hold the thrown type's descriptor
address, and bytes 39 and 40 hold the selector that phase one recorded. The landing
SP is the call-site SP plus the call's outgoing argument bytes. An AVEH4 site has an
action that names an action list. The list's flag bit 0 is a cleanup, and its catch
entries are a selector and an RTTI address each, where a zero address is catch-all.

## Stops and time

A guest stop snapshot is taken at a coherent AVM instruction boundary. Its
`pc` identifies the first byte of the next instruction, prior side effects
are complete, and registers, memory, and the cycle counter describe the same
instant. A breakpoint stops before its instruction. A watchpoint records the
accessing instruction's address and access details, then stops at the next
coherent boundary after that instruction completes. A debugger memory read
is not a guest access and cannot trigger a watchpoint. `SYS debug_break` is a
distinct stop reason. Interrupt, fault, and user-interrupt stops have distinct
reasons as well. Time is counted in AVR cycles at 16 MHz; a cycle is exactly
62,500 ps. The debugger reports both cycles since AVR reset and cycles since
the first AVM entry boundary.

## Host debugging and on-device crash metadata

Full host-side debugging uses the linked ELF. Its `.symtab`, DWARF
`.debug_info`, `.debug_line`, and `.debug_frame` sections, together with the
CFI and location rules above, describe frames, variables, and source positions.
The host debugger reads these files directly.

Every code address in `.debug_info`, `.debug_ranges`, `.debug_loc`, and
`.debug_line` is a three-byte absolute operand with an `R_AVM_DEBUG24`
relocation. Linker relaxation shortens instructions after assembly, so a
difference between two labels in the same section would be a constant that no
relocation can update. DWARF 4 range and location lists are relative to the
compile unit's base address, so each list that needs one starts with a base
address entry of zero. The linker moves each address by the bytes removed
before its original target, and a reference to a defined code symbol with an
addend is translated from the symbol's original offset plus that addend.

On-device crash metadata is a different, compact representation. It is the
`AVD1` block described in [arch.md](arch.md) Section 69.2. The image packer
includes it in every image by default, so it is a normal part of the image
rather than a debugging option. `--no-crash-info` and the CMake `NO_CRASH_INFO`
argument omit it to save flash.

The block holds compact function and source information. Function records map each program range to its complete demangled name,
parameter list included. Source
transitions map each program address to a filename and line, or to no line
where the DWARF rows have no source. The guest fatal-trap reporter reads it
from program flash through `__avm_trap_lookup`, and a lookup needs no guest
allocation. Function names need no `-g`. Source lines need DWARF from a `-g`
build.

A lookup returns program-memory pointers, so the strings stay where the image
holds them. `avm_trap_location_t` is ten bytes on AVM: a 24-bit pointer to the
function name at offset 0, a 24-bit pointer to the filename at offset 3, and the
32-bit line at offset 6. A null function pointer means no matching function, a
null file pointer means no matching source location, and line zero means no
line. Strings are read with `%S`, and nothing is copied into RAM.

The compact encoding does not replace DWARF. LLDB and the host tools continue to
read the full ELF and its `.debug_info`, `.debug_line`, and `.debug_frame`
sections, and they need nothing from AVD1. For one trapped program address,
AVD1 provides a function name and a source basename with its line. It does not
replace `.debug_frame`, and it does not describe frames, CFI rules, locations,
or variables. AVD1 does not yet contain unwind metadata, so it provides no stack
unwinding and no caller frames. The lookup uses the raw interpreter PC of the
trap context, which need not be the first byte of the faulting instruction.
