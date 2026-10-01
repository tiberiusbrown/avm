# AVM debugger ABI, version 1

This document specifies the debug representation of the AVM ABI in
[arch.md](arch.md). It applies to `EM_AVM` (`0x4156`) ELF32 little-endian
executables with `EF_AVM_ABI_V1`. Guest instructions, objects, and pointers
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
