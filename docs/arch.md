# Arduboy Virtual Machine Interface Specification

**Status:** Execution contract version 2; image layout version 1
**Intended consumers:** LLVM backend, Clang target, assembler, disassembler, linker, image writer, debugger, validator, runtime library, system libraries, and conforming VM implementations

---

## 1. Scope and authority

The Arduboy Virtual Machine, abbreviated **AVM**, is a bytecode architecture with:

- Eight 16-bit general-purpose registers.
- A flat 24-bit program counter and read-only program address space.
- A 16-bit data address space.
- A downward-growing VM stack.
- A three-bit architectural condition state.
- A defined calling convention, system ABI, object-file model, and linked-image format.

This document is the normative version 2 interface specification. It defines:

- Architectural state.
- Scalar, pointer, and aggregate representation.
- Every instruction encoding and operand-byte format.
- Instruction semantics and condition-state behavior.
- Calling convention.
- System-service ABI.
- LLVM and Clang target contracts.
- ELF relocations and linker responsibilities.
- Flat-image layout, startup state, diagnostics, and versioning.

Implementation details and performance estimates are outside this specification.

---

## 2. Terminology and notation

The words **MUST**, **MUST NOT**, **SHOULD**, and **MAY** describe architectural requirements and recommendations.

```text
rN        One of the eight 16-bit registers r0-r7
low8(rN)  Bits 7:0 of rN
high8(rN) Bits 15:8 of rN
qN        Aligned 32-bit pair q0-q3
PC        Flat 24-bit logical program counter
SP        16-bit VM stack pointer
CC        Architectural condition state
```

Multi-byte quantities are little-endian unless stated otherwise.

Arithmetic on 8-, 16-, 24-, and 32-bit values is modulo the corresponding power of two unless the instruction explicitly performs signed extension, comparison, or arithmetic right shift.

---

# Part I — Architectural State

## 3. General-purpose registers

AVM has eight 16-bit registers:

```text
r0  r1  r2  r3  r4  r5  r6  r7
```

Each register may hold:

- A 16-bit integer.
- A 16-bit data pointer.
- A byte value in bits `7:0`.
- One word of a larger integer.
- Part of the register container for a program or function pointer.

There is no separate architectural byte-register file.

## 4. Upper registers

Registers `r4-r7` are called the **upper registers**. They are ordinary
16-bit architectural registers with no separate aliases or semantics. Several
instruction encodings are restricted to this subset, and the assembler selects
those encodings automatically when the operands are in `r4-r7`.

## 5. Aligned 32-bit register pairs

The aligned pair aliases are:

```text
q0 = r0:r1
q1 = r2:r3
q2 = r4:r5
q3 = r6:r7
```

For each `qN`:

```text
first register   = bits 15:0
second register  = bits 31:16
```

The pair aliases do not add storage.

## 6. Program counter

`PC` is a flat 24-bit logical address:

```text
PC[23:0]
```

At instruction execution, `PC` identifies the first byte of the current instruction.

Unless an instruction transfers control, execution continues at:

```text
nextPC = PC + encoded_instruction_length
```

Relative displacements are measured from `nextPC`.


## 7. Stack pointer

`SP` is a 16-bit data-space pointer.

The initial value is:

```text
SP = 0x0A00
```

The conventional VM stack range is:

```text
0x0900-0x09FF
```

The stack grows downward. There is no red zone.

## 8. Architectural condition state

`CC` contains three architecturally visible bits:

| Bit | Name | Meaning after compare/test |
|---:|---|---|
| 0 | `C` | Unsigned left operand is less than unsigned right operand |
| 1 | `Z` | Operands are equal, or tested value is zero |
| 4 | `S` | Signed left operand is less than signed right operand |

Only these instruction families replace `CC`:

```text
CMP
CMPI.S8
CMP32
TST8
TST16
```

All other instructions preserve `CC`.

Nonarchitectural bits in the storage used for `CC` are unspecified and MUST NOT be observed by guest code.

---

# Part II — Memory, Pointers, and Data Representation

## 9. Data address space

Address space zero is a 16-bit byte-addressed data space:

```text
0x0000-0xFFFF
```

A data pointer is the raw 16-bit address. No bias or translation is applied by the ISA.

The conventional runtime layout is:

| Address | Size | Conventional purpose |
|---|---:|---|
| `0x0000-0x00FF` | 256 bytes | Platform-mapped low data space |
| `0x0100-0x04FF` | 1,024 bytes | Static global storage |
| `0x0500-0x08FF` | 1,024 bytes | Display framebuffer |
| `0x0900-0x09FF` | 256 bytes | VM stack |
| `0x0A00-0x0AFF` | 256 bytes | Runtime-reserved data |
| `0x0B00-0xFFFF` | — | Platform-defined or unimplemented |

The null data pointer is `0x0000`.

Access to unsupported, reserved, or platform-defined addresses has target-defined behavior and may be rejected by a validating implementation.

## 10. Static storage and framebuffer

Writable static storage occupies:

```text
0x0100-0x04FF
```

All static storage has explicit initializer bytes in the image. AVM has no runtime
`.bss` region and no allocated `SHT_NOBITS` static-storage section.

Layout:

```text
0x0100                       start of .saved
0x0100 + saveSize            start of .data
0x0100 + dataSize            first byte after static storage
```

Definitions:

```text
saveSize         = size of the persistent .saved prefix
dataSize         = total size of .saved + .data
ordinaryDataSize = dataSize - saveSize
```

Required:

```text
0 <= saveSize <= dataSize <= 1024
```

All `.saved` bytes are contiguous and precede all ordinary `.data` bytes.
A zero-initialized global contributes explicit zero initializer bytes to its
own section.

The framebuffer occupies:

```text
0x0500-0x08FF
```

The conventional pixel mapping is:

```text
address = 0x0500 + x + 128 * (y >> 3)
bit     = y & 7
```

## 11. Program address space

Address space one is a 24-bit byte-addressed, read-only program space:

```text
0x000000-0xFFFFFF
```

The first 256 bytes are reserved for the linked-image header:

```text
0x000000-0x0000FF  image header
0x000100-...       linked payload
```

The null program pointer is `0x000000`.

Program-space stores do not exist.

## 12. Program and function pointers

### 12.1. Memory representation

Program and function pointers are packed little-endian 24-bit values:

```text
byte 0 = bits 7:0
byte 1 = bits 15:8
byte 2 = bits 23:16
```

```text
sizeof(program pointer)  = 3
sizeof(function pointer) = 3
alignment                = 1
```

### 12.2. Register representation

A program or function pointer in registers occupies one `qN` container:

```text
low register                  = logical pointer bits 15:0
low byte of high register     = logical pointer bits 23:16
high byte of high register    = register-container padding
```

The logical pointer value is always:

```text
pointerAddress = qN[23:0]
```

Bits `qN[31:24]` are not part of the program- or function-pointer value.
Those register-container padding bits are unspecified and may contain any
value.

A **normalized program pointer** satisfies:

```text
qN[31:24] = 0
```

Every architectural instruction and system service that consumes a program or
function pointer uses only bits `23:0` and ignores bits `31:24`. No instruction
or system service requires a normalized register input. This rule includes all
program-space loads, indirect jump and call targets, and every program-space
pointer accepted by `SYS`.

Program pointers passed through a variadic argument area use the packed
three-byte memory representation from Section 12.1. They have no register-
container padding byte. In particular, the `%S` and `%P` conversions defined
in Section 49.27 each consume exactly three consecutive variadic bytes.

Ordinary function-call ABI boundaries retain normalized register
representation:

- A program- or function-pointer argument passed in a `qN` register is
  normalized when control enters the callee.
- A program- or function-pointer return value is normalized.
- Packed three-byte memory representation contains only the logical 24 bits and
  has no padding byte.

Temporary register values need not be normalized when all consumers interpret
them as program or function pointers.

### 12.3. Pointer arithmetic and observation

Program-pointer arithmetic is unsigned arithmetic modulo `2^24`:

```text
resultAddress = low24(pointerAddress + offset)
```

The padding bits of a register result are unspecified unless the operation
explicitly produces a normalized pointer. A full 32-bit addition may therefore
implement temporary program-pointer arithmetic without subsequently clearing
bits `31:24`, provided every use consumes the result as a program pointer.

Program-pointer equality and ordering compare only the logical 24-bit values.
An implementation using a full 32-bit comparison must normalize the operands
first or otherwise exclude the padding bits.

Conversion of a program pointer to an integer wider than 24 bits zero-extends
the logical 24-bit value. Conversion from an integer to a program pointer uses
the low 24 bits; register-container padding is unspecified until normalization
is required.

Data and program pointers belong to disjoint address spaces. Implicit conversion
between them is forbidden. Explicit integer conversion is target-defined
subject to the logical-width rules above.


## 13. Program-space layout constraints

The program address space is flat across the full range:

```text
0x000000-0xFFFFFF
```

The linker MAY place functions, basic blocks, jump tables, constants, and other program-resident objects anywhere in that range, subject only to:

1. No instruction may extend past `0xFFFFFF`.
2. Every control-flow target must identify the first byte of a valid instruction.
3. Every direct or indirect target must satisfy any alignment requirement of the selected instruction form.
4. Every program-resident object must fit entirely within the 24-bit address space.
5. Relative control transfers must fit their encoded displacement range.
6. Absolute and indirect control transfers may cross any `0xXXXXXX` address boundary.

Functions, basic blocks, fallthrough paths, and program data may freely cross 64 KiB boundaries.

## 14. Endianness and alignment

AVM is little-endian.

All scalar ABI alignments are one byte.

Unaligned 16-, 24-, 32-, and 64-bit memory objects are permitted.

The VM stack has one-byte alignment.

## 15. C and C++ data model

| Type | Size |
|---|---:|
| `bool` | 1 byte |
| `char` | 1 byte |
| `short` | 2 bytes |
| `int` | 2 bytes |
| `long` | 4 bytes |
| `long long` | 8 bytes |
| `float` | 4 bytes |
| `double` | 4 bytes |
| `long double` | 4 bytes |
| Data pointer | 2 bytes |
| Program pointer | 3 bytes |
| Function pointer | 3 bytes |
| `size_t` | 2 bytes |
| `ptrdiff_t` | 2 bytes |
| `wchar_t` | 1 byte |

`wchar_t` has an unsigned 8-bit representation. In C its underlying type is `unsigned char`; in C++ it remains a distinct built-in type. The compiler's `wint_t` underlying type is signed 16-bit `int`, permitting all `wchar_t` values and a separate negative `WEOF` sentinel. The supported execution locale is `"C"`; no Unicode or wide-character glyph rendering is specified.

Plain `char` is signed by default.

`bool` is represented canonically as zero or one.

Source-level `_Float16` is not supported by the AVM C or C++ target.
Clang MUST diagnose its use rather than assigning it an ABI. LLVM IR may still
contain `f16` values for data-layout and IR-compatibility purposes; such values
are not a source-language ABI type and require expansion or promotion before
machine instruction selection.

## 16. Byte and larger values in registers

A byte value occupies `low8(rN)`.

The instruction definition determines the high byte:

- `LD8U`, `LDM8U`, `LDSP8U`, `LDP8U`, `LDI8`, `ZEXT8`, `MUL8`, `BOOL`, and `CSET` clear it.
- `LDSP8S`, `LDP8S`, and `SEXT8` sign-extend it.
- Byte stores use only `low8(rN)`.
- `SWAP8` modifies only `low8(rN)` and preserves `high8(rN)`.

A 32-bit integer occupies one `qN`.

A 64-bit integer occupies four 16-bit registers or is lowered through runtime helpers.


## 16.1. Allocation model

The architecture reserves no separate heap region. The standard runtime provides
`malloc`, `calloc`, `realloc`, and `free` using unused static RAM immediately
after the final `.saved` and `.data` storage, up to the exclusive boundary
`0x0500`. The default linker defines the storage-free, hidden absolute symbol
`__avm_heap_start` at `0x0100 + dataSize`, including any termination reservations
and the allocator's own state. Custom linker scripts must supply this boundary.

The allocator uses a two-byte high-water mark and a two-byte little-endian
implicit block header (allocation flag and total size). It uses first-fit
allocation without alignment padding, immediately coalesces adjacent free blocks,
and reclaims free heap-tail space. `realloc` shrinks or grows in place when
possible, otherwise copying to a new allocation; failure preserves the original.
`calloc` checks multiplication overflow and zeros the requested bytes.
`malloc(0)` returns NULL; `realloc(ptr, 0)` frees a non-NULL allocation and returns
NULL. Allocation failures do not change `errno`.

Allocator code and state are linked only when allocation functionality is used;
there is no reserved heap array or storage overhead otherwise. The allocator is
non-reentrant and must not be called from an interrupt handler that can interrupt
an allocation operation. All types retain their one-byte ABI alignment.
Ordinary C++ `new` and `delete` remain unsupported; placement `new` is permitted.

C99 variable-length arrays and variable-sized `alloca` use the stack as described in Section 47.5. They do not require a heap or global allocation state.

A program may implement a fixed-capacity allocator within its own global or stack storage, but that allocator has no architectural status.
---

# Part III — ISA Encoding

## 17. General encoding rules

Instruction bytes are stored in increasing program-address order.

Immediate and address operands are little-endian:

```text
imm16 / addr16 / rel16:
    low byte, then high byte

target24:
    low byte, middle byte, high byte
```

Reserved primary opcodes, out-of-range secondary bytes, malformed operand specifiers, and prohibited operand aliases are invalid instructions.

Except for the five condition-producing families listed in Section 8, every instruction preserves `CC`.

## 18. Register-field conventions

### 18.1. Upper-register matrix byte

For primary opcodes `00-AF`:

```text
bits 3:2  destination, address, or left upper-register code
bits 1:0  source, address, or right upper-register code
```

Register code `0-3` selects architectural registers `r4-r7`.

For encoding formulas, `U(rN) = N - 4` for an upper register `rN` in `r4-r7`.

### 18.2. Full-register pair index `PAIR48`

Several dense pages omit forms where both operands are upper registers because those have one-byte encodings.

For destination/left register `d` and source/right register `s`:

```text
if d in r0-r3:
    PAIR48(d,s) = 8*d + s                    ; 00-1F

else if d in r4-r7 and s in r0-r3:
    PAIR48(d,s) = 0x20 + 4*(d-4) + s        ; 20-2F

else:
    use the one-byte upper-register form
```

### 18.3. Upper-register-pointer ordinary-memory index

For pointer `rA` in `r4-r7` and data register `rN` in `r0-r3`:

```text
MEM16(rA,rN) = 4*U(rA) + N
```

### 18.4. Upper-register-pointer postincrement-memory index

For pointer `rA` in `r4-r7` and any data register `rN`, where `N=0-7`:

```text
MEM32(rA,rN) = 8*U(rA) + N
```

### 18.5. Stack-offset upper-register index

For unsigned four-bit stack displacement `u4` and `rN` in `r4-r7`:

```text
STACK64(u4,rN) = 4*u4 + U(rN)
```

### 18.6. Program-load operand byte `PSPEC`

Program-space scalar loads use:

```text
bits 7:4  destination register code = 2*rD
bits 3:0  address-pair code         = 4*qA
```

Program-space pair loads use:

```text
bits 7:4  destination-pair code = 4*qD
bits 3:0  address-pair code     = 4*qA
```

Thus:

```text
rN code = 2*N   -> 0,2,4,6,8,10,12,14
qN code = 4*N   -> 0,4,8,12
```

Any other `PSPEC` value is invalid.

### 18.7. Cold 32-bit operand byte `RRSPEC32`

```text
bits 7:4  high operand code
bits 3:0  low operand code
```

Codes:

```text
rN = 2*N
qN = 4*N
```

Interpretation:

```text
CMP32: high=qL, low=qR
LD32:  high=qD, low=rA
ST32:  high=qS, low=rA
```

Malformed alignment codes are invalid.

### 18.8. Cold general-memory operand byte

```text
dddWaaaP
```

| Field | Meaning |
|---|---|
| `ddd` bits `7:5` | Data register `rD` or `rS` |
| `W` bit `4` | `0` byte, `1` word |
| `aaa` bits `3:1` | Pointer register `rA` |
| `P` bit `0` | `0` ordinary, `1` postincrement |

Every bit pattern selects valid registers and modifiers.

### 18.8.1. Biased-displacement general-memory operand bytes

Primary opcodes `ED` and `EE` are followed by a register/width specifier and a
biased unsigned offset byte:

```text
ED dddWaaa0 off8    load
EE dddWaaa0 off8    store
```

| Field | Meaning |
|---|---|
| `ddd` bits `7:5` | Data register `rD` or `rS` |
| `W` bit `4` | `0` byte, `1` word |
| `aaa` bits `3:1` | Pointer register `rA` |
| bit `0` | Reserved; MUST be zero |
| `off8` | Biased displacement byte |

The architectural displacement is:

```text
displacement = unsigned8(off8) - 32
```

Therefore the representable displacement range is `-32..+223`, and zero
displacement is encoded as `off8 = 0x20`.

### 18.9. Division/remainder operand byte

The `EC` instruction family uses:

```text
oo ddd sss
```

| Field | Meaning |
|---|---|
| `oo` bits `7:6` | Operation selector |
| `ddd` bits `5:3` | Destination and dividend register `rD` |
| `sss` bits `2:0` | Preserved source and divisor register `rS` |

Every bit pattern is valid. The complete original values of both operands are
used. `rD == rS` is legal.

### 18.10. `MOV32` pair index `QPAIR12`

The `F2` page omits the four `MOV32` combinations where both operands are
`q2` or `q3`, because those expand to two one-byte upper-register `MOV`
instructions.

```text
if qD < 2:
    QPAIR12(qD,qS) = 4*qD + qS
else if qS < 2:
    QPAIR12(qD,qS) = 8 + 2*(qD - 2) + qS
else:
    use two upper-register MOV instructions
```

### 18.11. Floating-point operands

The FF page has no register-specifier bytes. All operands are fixed except
FNEG/FABS, whose q-register is encoded in the secondary. Only FPOLY has
trailing count/coefficient data. See Section 35.1.

---

# Part IV — Complete Opcode Map

## 19. Primary opcode map

| Primary | Encoding / instruction | Length | `CC` |
|---:|---|---:|---|
| `00-0F` | `MOV rD,rS` | 1 | Preserve |
| `10-1F` | `ADD rD,rS` | 1 | Preserve |
| `20-2F` | `SUB rD,rS` | 1 | Preserve |
| `30-3F` | `CMP rL,rR` | 1 | Replace |
| `40-4F` | `LD8U rD,[rA]` | 1 | Preserve |
| `50-5F` | `ST8 [rA],rS` | 1 | Preserve |
| `60-6F` | `LD16 rD,[rA]` | 1 | Preserve |
| `70-7F` | `ST16 [rA],rS` | 1 | Preserve |
| `80-8F` | `AND rD,rS` | 1 | Preserve |
| `90-9F` | `OR rD,rS` | 1 | Preserve |
| `A0-AF` | `XOR rD,rS` | 1 | Preserve |
| `B0-B7` | `PUSH16 rN` | 1 | Preserve |
| `B8-BF` | `POP16 rN` | 1 | Preserve |
| `C0-C3` | `LDI8 rD,imm8` | 2 | Preserve |
| `C4-C7` | `LDI16 rD,imm16` | 3 | Preserve |
| `C8-CB` | `ADDI.S8 rD,simm8` | 2 | Preserve |
| `CC-CF` | `CMPI.S8 rL,simm8` | 2 | Replace |
| `D0` | `BREQ8 rel8` | 2 | Preserve |
| `D1` | `BRNE8 rel8` | 2 | Preserve |
| `D2` | `BRULT8 rel8` | 2 | Preserve |
| `D3` | `BRSLT8 rel8` | 2 | Preserve |
| `D4` | `JMP8 rel8` | 2 | Preserve |
| `D5` | `CALL8 rel8` | 2 | Preserve |
| `D6` | `ADJSP simm8` | 2 | Preserve |
| `D7` | `SYS service8` | 2 | Service-defined; default preserve |
| `D8` | `BRUGE8 rel8` | 2 | Preserve |
| `D9` | `BRSGE8 rel8` | 2 | Preserve |
| `DA` | `BREQ16 rel16` | 3 | Preserve |
| `DB` | `BRNE16 rel16` | 3 | Preserve |
| `DC` | `BRULT16 rel16` | 3 | Preserve |
| `DD` | `BRUGE16 rel16` | 3 | Preserve |
| `DE` | `BRSLT16 rel16` | 3 | Preserve |
| `DF` | `BRSGE16 rel16` | 3 | Preserve |
| `E0` | `JMP16 rel16` | 3 | Preserve |
| `E1` | `CALL16 rel16` | 3 | Preserve |
| `E2` | `JMPF target24` | 4 | Preserve |
| `E3` | `CALLF target24` | 4 | Preserve |
| `E4-E7` | `JMPP qN` | 1 | Preserve |
| `E8-EB` | `CALLP qN` | 1 | Preserve |
| `EC` | `UDIV16` / `UREM16` / `SDIV16` / `SREM16` | 2 | Preserve |
| `ED` | `LD8U` / `LD16 rD,[rA+disp]` | 3 | Preserve |
| `EE` | `ST8` / `ST16 [rA+disp],rS` | 3 | Preserve |
| `EF` | `RET` | 1 | Preserve |
| `F0` | Cold-form page | 2-4 | Instruction-defined |
| `F1` | Dense page 1 | 2 | Instruction-defined |
| `F2` | Dense page 2 | 2 | Preserve |
| `F3` | Dense page 3 | 2 | Preserve |
| `F4` | Dense page 4 | 2 | Instruction-defined |
| `F5` | Dense page 5 | 2 | Instruction-defined |
| `F6` | Dense page 6 | 2 | Instruction-defined |
| `F7` | Dense page 7 | 2 | Preserve |
| `F8` | `CSET` page | 2 | Preserve |
| `F9` | General bitwise page | 2 | Preserve |
| `FA` | Upper-register 16-bit shift page | 2 | Preserve |
| `FB-FD` | Conditional-move pages | 2 | Preserve |
| `FE` | `MUL16` page | 2 | Preserve |
| `FF` | Floating-point page | 2; FPOLY 3 + 4N | Preserve |

## 20. One-byte instruction semantics

### 20.1. Upper-register matrices

For `00-AF`, the low nibble is the upper-register matrix from Section 18.1. Every `rD`, `rS`, `rL`, `rR`, and `rA` operand in this table is restricted to `r4-r7`.

| Range | Instruction | Semantics |
|---|---|---|
| `00-0F` | `MOV rD,rS` | `rD = rS` |
| `10-1F` | `ADD rD,rS` | `rD = low16(rD + rS)` |
| `20-2F` | `SUB rD,rS` | `rD = low16(rD - rS)` |
| `30-3F` | `CMP rL,rR` | Replace `CC` from 16-bit comparison; registers unchanged |
| `40-4F` | `LD8U rD,[rA]` | `rD = zero_extend8(mem8[rA])` |
| `50-5F` | `ST8 [rA],rS` | `mem8[rA] = low8(rS)` |
| `60-6F` | `LD16 rD,[rA]` | `rD = mem16le[rA]` |
| `70-7F` | `ST16 [rA],rS` | `mem16le[rA] = rS` |
| `80-8F` | `AND rD,rS` | `rD = rD & rS` |
| `90-9F` | `OR rD,rS` | `rD = rD | rS` |
| `A0-AF` | `XOR rD,rS` | `rD = rD ^ rS` |

Canonical aliases:

```text
NOP    = MOV r4,r4
CLR rN = XOR rN,rN    ; rN must be r4-r7
```

### 20.2. Stack register operations

```text
B0 + N    PUSH16 rN
B8 + N    POP16 rN
```

`PUSH16 rN`:

```text
SP = SP - 2
mem8[SP+0] = low8(rN)
mem8[SP+1] = high8(rN)
```

`POP16 rN`:

```text
rN = mem16le[SP]
SP = SP + 2
```

## 21. Immediate instructions

Upper-register destination is selected by the low two bits of the primary opcode.

| Primary | Instruction | Semantics |
|---:|---|---|
| `C0-C3` | `LDI8 rD,imm8` | `rD = zero_extend8(imm8)` |
| `C4-C7` | `LDI16 rD,imm16` | `rD = imm16` |
| `C8-CB` | `ADDI.S8 rD,simm8` | `rD = low16(rD + sign_extend8(simm8))` |
| `CC-CF` | `CMPI.S8 rL,simm8` | Compare `rL` with `sign_extend8(simm8)` and replace `CC` |

## 22. Control-flow and system instructions

### 22.1. Conditions

```text
EQ   CC.Z == 1
NE   CC.Z == 0
ULT  CC.C == 1
UGE  CC.C == 0
SLT  CC.S == 1
SGE  CC.S == 0
```

The ISA directly encodes branches for `EQ`, `NE`, `ULT`, `UGE`, `SLT`, and `SGE` with both signed 8-bit and signed 16-bit relative displacements. Unsigned `ULE` and `UGT` branch conditions are formed by swapping comparison operands and using `UGE` or `ULT`.

### 22.2. Relative branches and transfers

For all relative forms:

```text
target = nextPC + sign_extend(displacement)
```

The target is computed in the full 24-bit program address space.

| Opcode | Instruction | Action |
|---:|---|---|
| `D0` | `BREQ8 rel8` | Set `PC=target` if `Z=1` |
| `D1` | `BRNE8 rel8` | Set `PC=target` if `Z=0` |
| `D2` | `BRULT8 rel8` | Set `PC=target` if `C=1` |
| `D3` | `BRSLT8 rel8` | Set `PC=target` if `S=1` |
| `D4` | `JMP8 rel8` | Set `PC=target` |
| `D5` | `CALL8 rel8` | Push `nextPC`; set `PC=target` |
| `D8` | `BRUGE8 rel8` | Set `PC=target` if `C=0` |
| `D9` | `BRSGE8 rel8` | Set `PC=target` if `S=0` |
| `DA` | `BREQ16 rel16` | Set `PC=target` if `Z=1` |
| `DB` | `BRNE16 rel16` | Set `PC=target` if `Z=0` |
| `DC` | `BRULT16 rel16` | Set `PC=target` if `C=1` |
| `DD` | `BRUGE16 rel16` | Set `PC=target` if `C=0` |
| `DE` | `BRSLT16 rel16` | Set `PC=target` if `S=1` |
| `DF` | `BRSGE16 rel16` | Set `PC=target` if `S=0` |
| `E0` | `JMP16 rel16` | Set `PC=target` |
| `E1` | `CALL16 rel16` | Push `nextPC`; set `PC=target` |

### 22.3. Absolute and indirect transfers

| Opcode | Instruction | Action |
|---:|---|---|
| `E2` | `JMPF target24` | `PC = target24` |
| `E3` | `CALLF target24` | Push `nextPC`; `PC = target24` |
| `E4-E7` | `JMPP qN` | Ignore `qN[31:24]`; `PC = qN[23:0]` |
| `E8-EB` | `CALLP qN` | Push `nextPC`; ignore `qN[31:24]`; `PC = qN[23:0]` |
| `EF` | `RET` | Pop a 24-bit return address into `PC` |

A call pushes its three-byte return address as:

```text
SP = SP - 3
mem8[SP+0] = nextPC[7:0]
mem8[SP+1] = nextPC[15:8]
mem8[SP+2] = nextPC[23:16]
```

`RET` performs the inverse operation and then adds three to `SP`.

### 22.4. 16-bit division and remainder

Encoding:

```text
EC oo ddd sss
```

```text
bits 7:6  operation
bits 5:3  destination and dividend rD
bits 2:0  preserved source and divisor rS
```

| `oo` | Instruction | Result written to `rD` |
|---:|---|---|
| `00` | `UDIV16 rD,rS` | Unsigned quotient |
| `01` | `UREM16 rD,rS` | Unsigned remainder |
| `10` | `SDIV16 rD,rS` | Signed quotient, truncated toward zero |
| `11` | `SREM16 rD,rS` | Signed remainder with the dividend's sign |

`rD` supplies the dividend and receives the selected result. `rS` supplies the
divisor and is not independently written. When the operands are distinct,
`rS` is preserved. The implementation uses both complete original operands
before writing `rD`, so `rD == rS` is legal; in that case the shared register
receives the result.

For nonzero divisors:

```text
UDIV16(a,b) = floor(unsigned16(a) / unsigned16(b))
UREM16(a,b) = unsigned16(a) mod unsigned16(b)

SDIV16(a,b) = trunc_toward_zero(signed16(a) / signed16(b))
SREM16(a,b) = signed16(a) - SDIV16(a,b) * signed16(b)
```

The signed remainder is zero or has the same sign as the dividend.

Division by zero has deterministic architectural results:

```text
UDIV16(a,0) = 0xFFFF
SDIV16(a,0) = 0xFFFF
UREM16(a,0) = a
SREM16(a,0) = a
```

The signed overflow case also has deterministic modulo-16-bit results:

```text
SDIV16(0x8000,0xFFFF) = 0x8000
SREM16(0x8000,0xFFFF) = 0x0000
```

All four instructions preserve every unrelated general-purpose register,
`CC`, and `SP`. A distinct `rS` is preserved.

### 22.5. Biased-displacement data-space memory

The three-byte `ED` and `EE` families use the operand format from Section
18.8.1. All data and pointer registers may be any of `r0-r7`.

```text
ED ddd0aaa0 off8    LD8U rD,[rA+disp]
ED ddd1aaa0 off8    LD16 rD,[rA+disp]
EE ddd0aaa0 off8    ST8  [rA+disp],rS
EE ddd1aaa0 off8    ST16 [rA+disp],rS
```

Let:

```text
disp = unsigned8(off8) - 32
effectiveAddress = low16(original(rA) + disp)
```

Semantics:

```text
LD8U: rD = zero_extend8(mem8[effectiveAddress])
LD16: rD = mem16le[effectiveAddress]
ST8:  mem8[effectiveAddress] = low8(original(rS))
ST16: mem16le[effectiveAddress] = original(rS)
```

The pointer register is not modified. Loads and stores use the original pointer
and source values, so all aliases are legal, including `rD == rA` and
`rS == rA`. Multi-byte accesses are little-endian. All four instructions
preserve `CC`.

For an ordinary access through a general register, assemblers SHOULD prefer an
applicable one-byte or dense upper-pointer encoding first, then use `ED` or
`EE` with `off8 = 0x20`. The ordinary `P=0` forms in `F0 6C-6D` remain valid
but are noncanonical when the corresponding `ED` or `EE` encoding is
available.

### 22.6. Stack adjustment and services

`ADJSP simm8`:

```text
SP = low16(SP + sign_extend8(simm8))
```

`SYS service8` invokes the service identified by the unsigned byte operand.

---

# Part V — Secondary Opcode Pages

## 23. `F0` cold-form page

Valid secondary values are `00-6D`. Values `6E-FF` are invalid.

### 23.1. Immediate and stack-relative forms

| Secondary | Instruction | Length | Semantics |
|---:|---|---:|---|
| `00-03` | `LDI8 r0-r3,imm8` | 3 | Zero-extend `imm8` into selected register |
| `04-07` | `LDI16 r0-r3,imm16` | 4 | Load `imm16` |
| `08-0B` | `ADDI.S8 r0-r3,simm8` | 3 | Add sign-extended immediate modulo `2^16` |
| `0C-0F` | `CMPI.S8 r0-r3,simm8` | 3 | Compare against sign-extended immediate; replace `CC` |
| `10-17` | `LEASP rN,u8` | 3 | `rN = low16(SP + u8)` |
| `18-1F` | `LDSP8U rN,[SP+u8]` | 3 | Zero-extended byte load |
| `20-27` | `LDSP8S rN,[SP+u8]` | 3 | Sign-extended byte load |
| `28-2F` | `STSP8 [SP+u8],rN` | 3 | Store `low8(rN)` |
| `30-37` | `LDSP16 rN,[SP+u8]` | 3 | Little-endian word load |
| `38-3F` | `STSP16 [SP+u8],rN` | 3 | Little-endian word store |

Within each eight-entry family, the low three bits select `rN`. Within each four-entry family, the low two bits select `r0-r3`.

The offset does not modify `SP`.

### 23.2. Absolute data-space forms

| Secondary | Instruction | Length | Semantics |
|---:|---|---:|---|
| `40-47` | `LDM8U rN,addr16` | 4 | `rN = zero_extend8(mem8[addr16])` |
| `48-4F` | `STM8 addr16,rN` | 4 | `mem8[addr16] = low8(rN)` |
| `50-57` | `LDM16 rN,addr16` | 4 | `rN = mem16le[addr16]` |
| `58-5F` | `STM16 addr16,rN` | 4 | `mem16le[addr16] = rN` |

The low three secondary bits select `rN`.

### 23.3. Program-space forms

Each instruction is followed by `PSPEC` from Section 18.6.

| Secondary | Instruction | Length | Semantics |
|---:|---|---:|---|
| `60` | `LDP8U rD,[qA]` | 3 | Zero-extended program byte load |
| `61` | `LDP8S rD,[qA]` | 3 | Sign-extended program byte load |
| `62` | `LDP16 rD,[qA]` | 3 | Little-endian 16-bit program load |
| `63` | `LDP24 qD,[qA]` | 3 | Load 24 packed bits and normalize `qD` |
| `64` | `LDP32 qD,[qA]` | 3 | Little-endian 32-bit program load |
| `65` | `LDP8U rD,[qA+]` | 3 | Load byte, then add 1 modulo `2^24` to `qA` |
| `66` | `LDP16 rD,[qA+]` | 3 | Load word, then add 2 modulo `2^24` to `qA` |
| `67` | `LDP24 qD,[qA+]` | 3 | Load and normalize a 24-bit value, then add 3 modulo `2^24` to `qA` |
| `68` | `LDP32 qD,[qA+]` | 3 | Load dword, then add 4 modulo `2^24` to `qA` |

Every program-space load uses:

```text
effectiveAddress = qA[23:0]
```

and ignores `qA[31:24]`.

For a postincrement load, let `oldA = qA[23:0]`. The memory access uses `oldA`,
then:

```text
qA[23:0] = low24(oldA + accessWidth)
qA[31:24] = unspecified
```

For postincrement loads, the destination MUST NOT overlap the address pair:

- Scalar destinations may not be either component register of `qA`.
- Pair destinations may not equal `qA`.

Non-postincrement loads permit overlap because the effective address is the original `qA` value.

### 23.4. Cold 32-bit forms

Each instruction is followed by `RRSPEC32` from Section 18.7.

| Secondary | Instruction | Length | Semantics |
|---:|---|---:|---|
| `69` | `CMP32 qL,qR` | 3 | Compare 32-bit values; replace `CC` |
| `6A` | `LD32 qD,[rA]` | 3 | `qD = mem32le[rA]` |
| `6B` | `ST32 [rA],qS` | 3 | `mem32le[rA] = qS` |

`CMP32 qL,qL` is legal.

For ordinary `LD32` and `ST32`, overlap between the pair operand and `rA` is legal; the effective address is the original `rA` value.

### 23.5. Cold general-pointer memory forms

Each instruction is followed by `dddWaaaP` from Section 18.8.

| Secondary | Instruction family | Length |
|---:|---|---:|
| `6C` | Load | 3 |
| `6D` | Store | 3 |

Decoded load semantics:

```text
W=0, P=0  LD8U rD,[rA]
W=1, P=0  LD16 rD,[rA]
W=0, P=1  LD8U rD,[rA+]
W=1, P=1  LD16 rD,[rA+]
```

Decoded store semantics:

```text
W=0, P=0  ST8 [rA],rS
W=1, P=0  ST16 [rA],rS
W=0, P=1  ST8 [rA+],rS
W=1, P=1  ST16 [rA+],rS
```

Postincrement adds one for byte operations and two for word operations.

Ordinary loads and all stores permit `rD/rS == rA`. Postincrement loads reserve `rD == rA`.

The ordinary `P=0` encodings remain architecturally valid. An assembler SHOULD
normally use the `ED` or `EE` biased-displacement form with `off8 = 0x20`
instead, unless a shorter upper-register encoding is available.

## 24. `F1` register, stack-byte, and SP page

Valid secondary values are `00-8F`. Pointer `rA` in the postincrement memory families is restricted to `r4-r7`.

| Secondary | Encoding | Instruction | Semantics |
|---:|---|---|---|
| `00-2F` | `PAIR48(rD,rS)` | `MOV rD,rS` | `rD = rS` |
| `30-6F` | `30 + STACK64(u4,rS)` | `STSP8 [SP+u4],rS` | Store `low8(rS)` |
| `70-77` | `70 + rD` | `ZEXT8 rD` | Clear `high8(rD)` |
| `78-7F` | `78 + rD` | `SWAP8 rD` | Exchange low-byte nibbles; preserve high byte |
| `80-87` | `80 + rD` | `GETSP rD` | `rD = SP` |
| `88-8F` | `88 + rS` | `SETSP rS` | `SP = rS` |

## 25. `F2` full-register arithmetic and `MOV32` page

Valid secondary values are `00-6B`.

| Secondary | Encoding | Instruction | Semantics |
|---:|---|---|---|
| `00-2F` | `PAIR48(rD,rS)` | `ADD rD,rS` | `rD = low16(rD + rS)` |
| `30-5F` | `30 + PAIR48(rD,rS)` | `SUB rD,rS` | `rD = low16(rD - rS)` |
| `60-6B` | `60 + QPAIR12(qD,qS)` | `MOV32 qD,qS` | Copy all 32 bits; preserve source |

Upper-register `ADD` and `SUB` operands use their one-byte forms. When both
`MOV32` operands are `q2` or `q3`, the assembler emits two one-byte `MOV`
instructions instead of an `F2` encoding. All aliases, including `qD == qS`,
are legal.

## 26. `F3` upper-register-pointer byte-store, multiply, and stack-byte page

Valid secondary values are `00-7F`. In this page, `rA`, `rD`, and `rS` in the upper-register-only families are restricted to `r4-r7`.

| Secondary | Encoding | Instruction | Semantics |
|---:|---|---|---|
| `00-0F` | `MEM16(rA,rS)` | `ST8 [rA],rS` for `rS=r0-r3` | Store `low8(rS)` |
| `10-1F` | `10 + 4*U(rD) + U(rS)` | `MULU8.W rD,rS` | `rD = unsigned8(rD) * unsigned8(rS)` |
| `20-2F` | `20 + 4*U(rD) + U(rS)` | `MULS8.W rD,rS` | `rD = signed8(rD) * signed8(rS)` |
| `30-3F` | `30 + 4*U(rD) + U(rS)` | `MULSU8.W rD,rS` | `rD = signed8(rD) * unsigned8(rS)` |
| `40-7F` | `40 + STACK64(u4,rD)` | `LDSP8U rD,[SP+u4]` | Zero-extended byte load |

The widening multiply result is the complete 16-bit product.

## 27. `F4` stack-word, shift, unary, and test page

Valid secondary values are `00-B7`. The `LDSP16` and `STSP16` operands in `00-7F` are restricted to `r4-r7`.

| Secondary | Encoding | Instruction | Semantics / `CC` |
|---:|---|---|---|
| `00-3F` | `STACK64(u4,rD)` | `LDSP16 rD,[SP+u4]` | Load word; preserve |
| `40-7F` | `40 + STACK64(u4,rS)` | `STSP16 [SP+u4],rS` | Store word; preserve |
| `80-87` | `80 + rD` | `LSL16.1 rD` | Logical left shift by 1; preserve |
| `88-8F` | `88 + rD` | `LSR16.1 rD` | Logical right shift by 1; preserve |
| `90-97` | `90 + rD` | `ASR16.1 rD` | Arithmetic right shift by 1; preserve |
| `98-9F` | `98 + rD` | `NOT16 rD` | Bitwise complement; preserve |
| `A0-A7` | `A0 + rD` | `TST8 rD` | Compare signed/unsigned low byte with zero; replace |
| `A8-AF` | `A8 + rD` | `INC16 rD` | Add one modulo `2^16`; preserve |
| `B0-B7` | `B0 + rD` | `DEC16 rD` | Subtract one modulo `2^16`; preserve |

For `TST8`:

```text
C = 0
Z = (low8(rD) == 0)
S = (signed8(low8(rD)) < 0)
```

## 28. `F5` compare and ordinary upper-register-pointer memory page

Valid secondary values are `00-5F`. Memory pointer `rA` in `30-5F` is restricted to `r4-r7`.

| Secondary | Encoding | Instruction | Semantics / `CC` |
|---:|---|---|---|
| `00-2F` | `PAIR48(rL,rR)` | `CMP rL,rR` | Compare 16-bit values; replace |
| `30-3F` | `30 + MEM16(rA,rD)` | `LD8U rD,[rA]`, `rD=r0-r3` | Zero-extended byte load; preserve |
| `40-4F` | `40 + MEM16(rA,rD)` | `LD16 rD,[rA]`, `rD=r0-r3` | Word load; preserve |
| `50-5F` | `50 + MEM16(rA,rS)` | `ST16 [rA],rS`, `rS=r0-r3` | Word store; preserve |

Data operands in upper registers use the one-byte primary forms.

## 29. `F6` postincrement byte-store and unary page

Valid secondary values are `00-4F`. The pointer and multiply operands in the upper-register-only families are restricted to `r4-r7`.

| Secondary | Encoding | Instruction | Semantics / `CC` |
|---:|---|---|---|
| `00-1F` | `MEM32(rA,rS)` | `ST8 [rA+],rS` | Store byte; `rA += 1`; preserve |
| `20-27` | `20 + rD` | `BSWAP16 rD` | Exchange low and high bytes; preserve |
| `28-2F` | `28 + rD` | `TST16 rD` | Compare 16-bit value with zero; replace |
| `30-3F` | `30 + 4*U(rD) + U(rS)` | `MUL8 rD,rS` | `rD = zero_extend8(low8(rD)*low8(rS))` |
| `40-47` | `40 + rD` | `SEXT8 rD` | Sign-extend low byte |
| `48-4F` | `48 + rD` | `NEG16 rD` | `rD = low16(-rD)` |

For `TST16`:

```text
C = 0
Z = (rD == 0)
S = (signed16(rD) < 0)
```

Stores permit `rA == rS`; the stored byte is the original source value.

## 30. `F7` postincrement word-memory and 32-bit page

Valid secondary values are `00-8F`.

| Secondary | Encoding | Instruction | Semantics |
|---:|---|---|---|
| `00-1F` | `MEM32(rA,rD)` | `LD8U rD,[rA+]` | Load byte; zero-extend; `rA += 1` |
| `20-3F` | `20 + MEM32(rA,rD)` | `LD16 rD,[rA+]` | Load word; `rA += 2` |
| `40-5F` | `40 + MEM32(rA,rS)` | `ST16 [rA+],rS` | Store word; `rA += 2` |
| `60-6F` | `60 + 4*qD + qS` | `ADD32 qD,qS` | `qD = low32(qD + qS)` |
| `70-7F` | `70 + 4*qD + qS` | `SUB32 qD,qS` | `qD = low32(qD - qS)` |
| `80-83` | `80 + qD` | `LSR32.1 qD` | Logical right shift by 1 |
| `84-87` | `84 + qD` | `ASR32.1 qD` | Arithmetic right shift by 1 |
| `88-8F` | `88 + rD` | `BOOL rD` | `rD = (rD != 0) ? 1 : 0` |

Postincrement loads reserve `rD == rA`. Stores permit `rS == rA`.

## 31. `F8` condition materialization page

Valid secondary values are `00-2F`.

| Secondary | Instruction | Result |
|---:|---|---|
| `00-07` | `CSET.EQ rD` | `rD = Z ? 1 : 0` |
| `08-0F` | `CSET.NE rD` | `rD = !Z ? 1 : 0` |
| `10-17` | `CSET.ULT rD` | `rD = C ? 1 : 0` |
| `18-1F` | `CSET.UGE rD` | `rD = !C ? 1 : 0` |
| `20-27` | `CSET.SLT rD` | `rD = S ? 1 : 0` |
| `28-2F` | `CSET.SGE rD` | `rD = !S ? 1 : 0` |

The low three bits select `rD`. Results are 16-bit zero or one.

`CSET.ULE` and `CSET.UGT` have no direct encodings. They are formed by swapping comparison operands and using `CSET.UGE` or `CSET.ULT`.

## 32. `F9` full-register bitwise page

```text
F9 oodddsss
```

| Field | Meaning |
|---|---|
| `ddd` bits `7:5` | Destination `rD` |
| `sss` bits `4:2` | Source `rS` |
| `oo` bits `1:0` | Operation |

Operation codes:

```text
00  AND rD,rS
01  OR  rD,rS
10  XOR rD,rS
11  invalid
```

Semantics are 16-bit bitwise operations. All aliases, including `rD == rS`, are legal.

Combinations where both operands are upper registers are valid but noncanonical; assemblers SHOULD emit the corresponding one-byte form.

## 33. `FA` upper-register 16-bit shift page

All instructions in this section use primary opcode `FA` and one secondary
byte. Secondary values `00-EF` are valid. Values `F0-FF` are reserved and
trap as invalid instructions.

| Secondary | Instruction |
|---:|---|
| `00-0F` | `SHL16V rD,rCount` |
| `10-1F` | `LSR16V rD,rCount` |
| `20-2F` | `ASR16V rD,rCount` |
| `30-6F` | `LSL16I rD,imm4` |
| `70-AF` | `LSR16I rD,imm4` |
| `B0-EF` | `ASR16I rD,imm4` |
| `F0-FF` | Reserved / trap |

Variable-count encodings use:

```text
SHL16V secondary = 0x00 + (U(rD) << 2) + U(rCount)
LSR16V secondary = 0x10 + (U(rD) << 2) + U(rCount)
ASR16V secondary = 0x20 + (U(rD) << 2) + U(rCount)
```

For these forms:

```text
bits 3:2  destination upper-register code for rD
bits 1:0  upper-register code for rCount
count     = low8(rCount) & 15
```

The count register is preserved. `rD == rCount` is legal; the original count
is used.

Immediate-count encodings use:

```text
LSL16I secondary = 0x30 + (U(rD) << 4) + imm4
LSR16I secondary = 0x70 + (U(rD) << 4) + imm4
ASR16I secondary = 0xB0 + (U(rD) << 4) + imm4
```

For these forms:

```text
bits 5:4  destination upper-register code for rD
bits 3:0  immediate shift count imm4
imm4      = 0-15
```

Semantics:

```text
SHL16V / LSL16I:
    rD = low16(rD << count)

LSR16V / LSR16I:
    rD = unsigned16(rD) >> count

ASR16V / ASR16I:
    rD = signed16(rD) >> count
```

For an immediate form, `count = imm4`. A count of zero leaves `rD`
unchanged. All six shift families preserve `CC`.

## 34. `FB-FD` conditional-move pages

All three pages require:

```text
secondary < 0x80
bit 6      invert condition
bits 5:3   destination rD
bits 2:0   source rS
```

| Prefix | `00-3F` | `40-7F` |
|---:|---|---|
| `FB` | `CMOV.EQ rD,rS` | `CMOV.NE rD,rS` |
| `FC` | `CMOV.ULT rD,rS` | `CMOV.UGE rD,rS` |
| `FD` | `CMOV.SLT rD,rS` | `CMOV.SGE rD,rS` |

Semantics:

```text
if condition:
    rD = rS
else:
    rD is unchanged
```

`rD == rS` is legal. `CC` is preserved.

Unsigned `ULE` and `UGT` are formed by swapping comparison operands and using `UGE` or `ULT`.

## 35. `FE` multiply page

Valid secondary values are `00-3F`.

```text
bits 5:3  destination rD
bits 2:0  source rS
```

Instruction:

```text
MUL16 rD,rS
```

Semantics:

```text
rD = low16(rD * rS)
```

Signed and unsigned multiplication have identical low sixteen bits, so one instruction serves both.

All aliases, including `rD == rS`, are legal.

## 35.1. `FF` floating-point page

All floating-point operands are IEEE-754 binary32 values held in `q0-q3`.
Floating-point instructions preserve `CC` and expose no architectural
floating-point exception state. Arithmetic and conversion results use
round-to-nearest, ties-to-even unless an instruction specifies another
rounding direction. NaN result payloads are unspecified except for `FNEG` and `FABS`,
whose bit-level behavior is defined below. Math functions live in
the guest runtime; see the [migration measurements](math-runtime-tradeoff.md).

The C99 `<fenv.h>` interface supports only `FE_TONEAREST` and no
exception flags (`FE_ALL_EXCEPT == 0`). Saved environments are invariant;
the interface adds no architectural state, flags, or traps.

### 35.1.1. Complete secondary map

| Secondary | Assembly | Inputs | Outputs | Bytes |
|---:|---|---|---|---:|
| `00` | `fadd` | `q2, q3` | `q2` | `2` |
| `01` | `fsub` | `q2, q3` | `q2` | `2` |
| `02` | `fmul` | `q2, q3` | `q2` | `2` |
| `03` | `fdiv` | `q2, q3` | `q2` | `2` |
| `04-07` | `fneg q0 through fneg q3` | `selected qN` | `same qN` | `2` |
| `08-0B` | `fabs q0 through fabs q3` | `selected qN` | `same qN` | `2` |
| `0C` | `s16tof` | `r4` | `q2` | `2` |
| `0D` | `u16tof` | `r4` | `q2` | `2` |
| `0E` | `ftos16` | `q2` | `r4` | `2` |
| `0F` | `ftou16` | `q2` | `r4` | `2` |
| `10` | `s32tof` | `q2` | `q2` | `2` |
| `11` | `u32tof` | `q2` | `q2` | `2` |
| `12` | `ftos32` | `q2` | `q2` | `2` |
| `13` | `ftou32` | `q2` | `q2` | `2` |
| `14` | `fcmp` | `q2, q3` | `r6` | `2` |
| `15` | `fpoly count` | `q2, coefficients` | `q2` | `3 + 4N` |
| `16` | `fsqrt` | `q2` | `q2` | `2` |
| `17` | `ftrunc` | `q2` | `q2` | `2` |
| `18` | `ffloor` | `q2` | `q2` | `2` |
| `19` | `fceil` | `q2` | `q2` | `2` |
| `1A` | `fround` | `q2` | `q2` | `2` |
| `1B` | `fmod` | `q2, q3` | `q2` | `2` |
| `1C` | `frempio2` | `q2` | `q2, r6` | `2` |
| `1D` | `fma` | `q2, q3, q0` | `q2` | `2` |
| `1E-FF` | `Reserved` | `—` | `Invalid-secondary trap` | `—` |

Fixed-register mnemonics have no assembly operands. Explicit register operands
are rejected. No legacy FF encoding is supported. Exactly 30 two-word dispatch
entries occupy 120 bytes. Far handlers use direct `JMP` entries; nearby handlers
start in the entry and use `RJMP` to continue. The decoder rejects `>= 0x1E`
before table indexing. This opcode compaction intentionally breaks ISA
compatibility; rebuild all objects and images. No old encoding aliases exist.

### 35.1.2. Arithmetic and sign operations

Arithmetic computes `q2 = binary32(q2 op q3)`, preserving q3, q0, and q1.
Subtraction and division use q2 as the left operand. FNEG toggles bit 31 and
FABS clears it; all other bits, including NaN payloads and signaling state,
are preserved exactly. Every FF operation preserves CC, SP, guest memory, and
all architectural registers except its designated output. PC advances by the
complete instruction length.

### Native math accelerators

FSQRT uses avr-libc's restoring square root, including subnormal normalization
and the final rounding decision. Signed zeros and positive infinity are
preserved; negative nonzero arguments return NaN. The four rounding operations
share one bit-level engine. FROUND uses halfway-away-from-zero C `roundf`
semantics; the others truncate, floor, or ceil. FMOD performs exact normalized
significand shift/subtract division, preserving the dividend's sign on zero.
These operations define only q2 and preserve q0, q1, q3, CC, SP, and guest memory.

FREMPIO2 returns the nearest-multiple remainder in q2 and the signed quotient
modulo four in r6 (0–3). It preserves r7, q0, q1, CC, SP, and guest memory.
Nonfinite inputs return NaN and quadrant zero. Signed zeros pass through.
The compact avr-libc reducer uses `D = 0xC90FDAA2 * 2^-31` for pi/2, with a
32-bit significand in a flt40_t value. Division and nearest-quotient correction
are integer operations; the final remainder rounds once to binary32.
It accepts all finite inputs. Production `sinf`, `cosf`, `tanf`, and `sincosf`
unconditionally reduce with FREMPIO2, then evaluate their polynomial and apply
the quadrant. Their large-angle and tangent-pole accuracy follows avr-libc's
flt40_t constant. No magnitude dispatch or guest fallback is used by these
functions. The separate legacy guest reducer remains available through
`__ieee754_rem_pio2f`.

FMA uses q2*q3+q0 and preserves q0, q1, and q3. Per the compact avr-libc
[fma.S implementation](https://github.com/vancegroup-mirrors/avr-libc/blob/master/avr-libc/libm/fplib/fma.S),
it retains the existing flt40_t multiply/add state and rounds only after the
addition. This is the selected precision contract: the product retains a
32-bit significand, not all 48 product bits. Severe cancellation, intermediate
overflow/underflow, and exponent gaps above 32 can differ from a correctly
rounded mathematical FMA. For example `(1+2^-23)*(1-2^-23)-1` returns `0xAFFF0000` (-255*2^-39),
where the exact fused result is -2^-46. Ordinary multiply/add expressions are
not contracted unless compiler flags permit it.

LLVM models q2 ties, q3 and q0 inputs, and both FREMPIO2 definitions before
allocation, using Q2Only, Q3Only, Q0Only, and R6Only. The r6/q3 alias remains
visible to liveness and spilling. `llvm.avm.rempio2` returns `{float,i16}`;
`__builtin_avm_rempio2(x,&q)` exposes that pair to C/C++ and promotes the local
quadrant store away during optimization. MC syntax remains operand-free.

### 35.1.3. Conversions, comparison, and classification

S16TOF/U16TOF capture original r4 before writing q2 (r4:r5).
FTOS16/FTOU16 write only r4, preserving r5. The four 32-bit conversions read
original q2 before replacing it. FCMP captures both original q2/q3 operands
before defining r6, the low half of q3; q2 and r7 are preserved.
These are ordinary read-before-write operations without early clobbers.

Integer-to-float conversion rounds to nearest with ties to even. Float-to-
integer conversion truncates toward zero for finite in-range inputs. For NaN
or out-of-range float-to-integer inputs, the result is unspecified; the
instruction still completes and preserves `CC`.

`FCMP` treats signed zeros as equal and returns in r6:

```text
0xFFFF  q2 < q3
0x0000  q2 == q3
0x0001  q2 > q3
0x0002  unordered because either operand is NaN
```

### 35.1.4. Inline polynomial evaluation

`FPOLY` has the variable-length encoding `FF 15 N C[0] ... C[N-1]`.
`N` is an unsigned byte in `1..255`; zero enters the invalid-secondary trap.
Each coefficient occupies four little-endian bytes containing an IEEE-754
binary32 value, ordered from highest degree to constant. Total size is
`3 + 4*N` bytes; degree is `N-1`.

`q2` supplies `x` and receives the result:

```text
y = C[0]
for i = 1 .. N-1: y = y*x + C[i]
q2 = roundToBinary32(y)
```

The multiply and add cores retain a 32-bit significand (including the native
eight-bit extension), with the native binary32 exponent range and gradual
underflow. Alignment, packing and sticky bits follow the native helpers;
**only the final result is rounded to binary32**, using nearest, ties to even. This is finite
extended precision, not an exact or fused multiply-add. Results can differ
from a sequence of ordinary `FMUL`/`FADD` instructions. Nonfinite arithmetic
uses the existing native helpers; NaN payloads are unspecified. `N=1` returns
the single coefficient without using `x`.

All other registers, `SP`, `CC`, and guest memory are preserved. `PC` resumes at
the byte immediately following the coefficients, including carries through
all 24 bits. Coefficients are read directly from the current instruction SPI
transaction. Neither RAM nor program-pointer coefficient services are defined.

All three assembly forms produce identical bytes:

```asm
fpoly 3, 2.0, -3.0, 4.0
; or a count header followed by data:
fpoly 3
.float 2.0, -3.0, 4.0
; alternatively, exact binary32 bits (nonfinite payloads use this form in disassembly):
fpoly 3, 0x40000000, 0xc0400000, 0x40800000
```

C/C++ inline assembly can use a fixed register operand, allowing the compiler
to coalesce surrounding values or supply inexpensive `mov32` copies:

```c
register float y __asm__("q2") = x;
__asm__("fpoly 3, 0x40000000, 0xc0400000, 0x40800000" : "+r"(y));
```

Decimal and hexadecimal float literals, optional signs, and `inf`/`nan` are
accepted. Integer expressions denote exact coefficient bits. Finite values
disassemble as round-trippable float literals. Runtime `math/fpoly.h` supplies
constant-coefficient macros. Odd/even components
use ordinary `fpoly(x*x, ...)` with their existing outer factors.


---

# Part VI — Instruction Semantic Details

## 36. Comparison semantics

For an `n`-bit comparison of `L` and `R`:

```text
C = unsigned_n(L) < unsigned_n(R)
Z = bit_pattern_n(L) == bit_pattern_n(R)
S = signed_n(L) < signed_n(R)
```

`CMP` uses `n=16`.

`CMP32` uses `n=32`.

`CMPI.S8` sign-extends its immediate to 16 bits and then performs a 16-bit comparison.

`TST8` compares the low byte with signed/unsigned zero.

`TST16` compares the full register with zero.

## 37. Load and store semantics

All multi-byte memory operations use little-endian byte order.

A biased-displacement operation computes its effective address from the
original pointer, performs no pointer writeback, and interprets its encoded
offset as `unsigned8(off8) - 32`.

For a postincrement operation:

1. The memory access uses the original pointer.
2. The pointer is increased by the access width.
3. Source values are the original register values.
4. Prohibited load aliases are invalid encodings.

Memory access does not change `CC`.

## 38. Arithmetic and logical semantics

All noncomparison arithmetic and logical operations preserve `CC`.

```text
ADD / ADDI / INC     modulo 2^16
SUB / DEC / NEG      modulo 2^16
ADD32 / SUB32        modulo 2^32
MUL8                 low 8 bits, then zero-extension
MUL16                low 16 bits
widening byte MUL    complete 16-bit product
UDIV16 / UREM16      unsigned 16-bit quotient / remainder
SDIV16 / SREM16      signed 16-bit quotient / remainder, truncating toward zero
```

Division and remainder use the deterministic zero-divisor and signed-overflow
results defined in Section 22.4.

Logical and shift operations operate on the stated width. Floating-point
semantics are defined in Section 35.1.

## 39. Canonical assembler pseudos

The following names do not require separate encodings:

```text
NOP         MOV r4,r4
CLR rN      XOR rN,rN    ; rN must be r4-r7
MOV32 qD,qS F2 60-6B, except upper-pair copies use two one-byte MOV instructions
LSL32.1 qD  ADD32 qD,qD
CSET.ULE    swapped compare + CSET.UGE
CSET.UGT    swapped compare + CSET.ULT
CMOV.ULE    swapped compare + CMOV.UGE
CMOV.UGT    swapped compare + CMOV.ULT
```

An assembler MAY expose additional aliases provided they lower to the normative encodings above.

---

# Part VII — Calling Convention

## 40. Register volatility

| State | ABI role |
|---|---|
| `r4-r7` | Caller-saved |
| `r0-r3` | Callee-saved |
| `r3` | Optional frame pointer |
| `CC` | Caller-saved across ordinary function calls |
| `SP` | Restored by the callee |
| `PC` | Controlled by call, jump, tail-call, and return |

A normal call may replace `r4-r7` and `CC`. The callee MUST restore every used register from `r0-r3` and MUST restore `SP` before returning.

## 41. Argument classification and register allocation

Arguments are processed in source order using four 16-bit register units:

```text
unit 0 -> r4
unit 1 -> r5
unit 2 -> r6
unit 3 -> r7
```

### 41.1. Register classes by ABI size

| Argument class | ABI examples | Register units | Unit alignment |
|---|---|---:|---:|
| One-unit scalar | `i8`, `i16`, data pointer | 1 | 1 |
| One-unit aggregate | Aggregate size 1-2 | 1 | 1 |
| Indirect aggregate pointer | Aggregate size greater than 4 | 1 | 1 |
| Two-unit scalar | `i32`, `float` | 2 | 2 |
| Program/function pointer | Packed 24-bit pointer | 2 | 2 |
| Two-unit aggregate | Aggregate size 3-4 | 2 | 2 |
| Four-unit scalar | `i64` | 4 | 2 |

A four-unit argument necessarily begins at unit zero.

### 41.2. Allocation algorithm

The allocation cursor begins at unit zero.

For each argument:

1. Classify the argument and determine its unit count and unit alignment.
2. Round the cursor upward to the required unit alignment.
3. If the complete argument fits in units `0-3`, assign all of its units and advance the cursor.
4. If the aligned argument does not fit, pass it entirely on the stack.
5. After the first stack-assigned argument, register allocation is closed and every later argument is passed on the stack.

Arguments are never split between registers and stack.

Unused alignment units are skipped and are unavailable to later arguments.

Examples:

```text
(i16, i32):
    i16 -> r4
    skip r5
    i32 -> q3 = r6:r7

(i16, i64):
    i16 -> r4
    i64 does not fit at aligned unit 2 -> stack
    all later arguments -> stack

(i32, i16, i16):
    i32 -> q2 = r4:r5
    i16 -> r6
    i16 -> r7

(program pointer, i32):
    pointer -> q2
    i32 -> q3
```

A program- or function-pointer argument assigned to `q2` or `q3` is normalized
before transfer of control to an ordinary callee. This is an ABI-boundary rule,
not a requirement for temporary program-pointer values within a function.
Fixed-register system services ignore program-pointer padding as required by
Section 12.2.

### 41.3. Hidden arguments

A hidden structure-result pointer is logically inserted before all source-language arguments. It is a one-unit data pointer and normally occupies `r4`.

An indirect aggregate argument is represented by a one-unit data pointer to a caller-created private copy. It participates in the allocation algorithm like any other data pointer.

## 42. Narrow argument representation

A narrow integer argument passed in a register occupies a complete 16-bit unit in canonical form:

```text
signed i8       sign-extended to 16 bits
unsigned i8     zero-extended to 16 bits
plain char      sign-extended because plain char is signed
bool            16-bit value zero or one
```

This rule applies to named nonvariadic arguments.

A narrow stack argument occupies its ABI size rather than a complete register unit:

```text
i8 / unsigned i8 / bool stack argument = 1 byte
```

The callee performs any extension required for register computation after loading the stack byte.

Default argument promotions apply before variadic arguments are classified, so variadic `char`, signed byte, unsigned byte, and `bool` arguments are passed as 16-bit `int`.

## 43. Aggregate ABI

Zero-sized aggregates consume no register units or stack bytes unless the source language requires a distinct address.

### 43.1. Direct aggregate arguments

Aggregates of one through four bytes are passed directly:

| Aggregate size | Register form | Stack size |
|---:|---|---:|
| 1 | Low byte of one 16-bit unit; high byte unspecified | 1 |
| 2 | One 16-bit unit | 2 |
| 3 | Low 24 bits of one aligned `qN`; bits `31:24` unspecified | 3 |
| 4 | One aligned `qN` | 4 |

Aggregate bytes map into registers in little-endian order:

```text
lowest-addressed aggregate byte -> least-significant register byte
```

Unions follow the same size-based classification.

### 43.2. Indirect aggregate arguments

An aggregate larger than four bytes is passed indirectly.

The caller:

1. Allocates a private writable copy with the aggregate's ABI size.
2. Copies the source value into that object.
3. Passes a 16-bit data pointer to the copy as a one-unit argument.

The copy is valid for the duration of the call. The callee may modify its private copy, but modifications are not written back to the source object.

LLVM should represent this as a `byval` pointer with one-byte ABI alignment.

### 43.3. Aggregate returns

| Aggregate size | Return mechanism |
|---:|---|
| 0 | No result storage |
| 1-2 | Direct in `r4`, with unused high bytes unspecified |
| 3-4 | Direct in `q2`, with unused high bytes unspecified |
| Greater than 4 | Hidden structure-result pointer |

For an indirect return:

- The caller allocates result storage.
- A hidden data pointer to that storage is inserted as the first argument.
- The callee writes the complete result object.
- The callee returns the same pointer unchanged in `r4`.
- User-visible arguments are allocated after the hidden pointer.

LLVM should model the hidden pointer with `sret`, `noalias`, and one-byte ABI alignment.

## 44. Stack arguments

The caller allocates outgoing stack-argument storage immediately before the call.

Stack arguments:

- Appear in source order at ascending addresses.
- Occupy their exact ABI size.
- Have one-byte alignment.
- Are packed without implicit alignment gaps.
- Use packed three-byte representation for program and function pointers.
- Use the aggregate's exact size for direct aggregates.
- Use a two-byte data pointer for indirect aggregates.

A call pushes a three-byte return address below the outgoing arguments. Callee entry therefore sees:

```text
SP+0  return address bits 7:0
SP+1  return address bits 15:8
SP+2  return address bits 23:16
SP+3  first stack-argument byte
```

The caller removes its outgoing stack arguments after return.

## 45. Variadic functions

All arguments to a variadic function are passed on the stack, including named arguments.

Default argument promotions apply before stack layout.

Variadic arguments:

- Appear in source order.
- Use their promoted ABI size.
- Have one-byte alignment.
- Are packed without alignment gaps.

`va_list` is a 16-bit data pointer to the next unread argument byte.

Aggregate variadic arguments follow the ordinary direct-or-indirect aggregate classification after language-required promotions.

## 46. Return values

| Return type | Location |
|---|---|
| `i8`, `bool` | `low8(r4)` |
| `i16` | `r4` |
| Data pointer | `r4` |
| `i32`, `float` | `q2 = r4:r5` |
| Program/function pointer | Normalized pointer in `q2` |
| `i64` | `r4:r7` |
| Aggregate size 1-2 | `r4` |
| Aggregate size 3-4 | `q2` |
| Aggregate size greater than 4 | Hidden result pointer; pointer returned in `r4` |

For `i8` and `bool` returns, only `low8(r4)` is defined. `high8(r4)` is unspecified.

A returned `bool` is zero or one in the low byte.

A returned program or function pointer is normalized at the ordinary ABI
boundary:

```text
q2[31:24] = 0
```

## 47. Frame layout

The stack grows toward lower addresses.

### 47.1. Callee-entry layout

At callee entry:

```text
higher addresses
    incoming stack arguments, in source order
    three-byte return address
SP -> return address byte 0
lower addresses
```

### 47.2. Fixed frame organization

A function saves only the callee-saved registers it uses.

After saving callee-saved registers and allocating the fixed frame, memory from low to high addresses is:

```text
fixed-frame SP / frame base
    local objects
    spill slots
    optional two-byte register-scavenger emergency slot
    saved callee-saved registers
    return address
    incoming stack arguments
```

There is no mandatory padding between areas.

Saved-register slots appear in ascending register-number order in memory:

```text
r0, r1, r2, r3
```

A canonical prologue may achieve this by saving used registers in descending register-number order.

Local objects and spill slots with the greatest dynamic access frequency SHOULD receive the lowest nonnegative offsets from the fixed-frame base.

### 47.3. Frame pointer

Frame-pointer omission is the default.

When a frame pointer is required:

- The incoming value of `r3` is saved.
- `r3` is set to the fixed-frame base after fixed allocation.
- Fixed locals, spills, saved registers, the return address, and incoming arguments are addressed at nonnegative offsets from `r3`.
- Dynamic call-site stack adjustments do not change `r3`.

A function that does not use `r3` as a frame pointer may allocate it as an ordinary callee-saved register.

### 47.4. Outgoing call frames

The canonical policy does not reserve a permanent outgoing-argument area.

Immediately before a call, the caller:

1. Decrements `SP` by the outgoing stack-argument size.
2. Writes stack arguments at ascending addresses beginning at the new `SP`.
3. Executes the call.
4. Restores `SP` after return.

A backend may reserve a maximum outgoing area as an internal optimization if it preserves the externally visible frame and argument layout.

### 47.5. Dynamic allocation and realignment

Variable-sized `alloca` and C99 variable-length arrays allocate below the current 16-bit `SP`: `GETSP` reads the old pointer, subtraction reserves the requested byte count, and `SETSP` installs the resulting object base. Element counts are multiplied by element sizes using the source language's required arithmetic. All stack objects use one-byte alignment; arbitrary dynamic stack realignment is unsupported.

Only functions requiring a frame pointer reserve `r3`. A function with variable-sized objects saves the incoming `r3` through the normal callee-saved convention and establishes `r3` after allocating its fixed frame. Fixed locals, spills, incoming arguments, and emergency scavenger slots remain relative to that stable base while `SP` changes. Ordinary functions retain frame-pointer omission without additional per-frame storage.

LLVM `stacksave` captures the current `SP`; `stackrestore` restores precisely that value. Clang emits these operations where needed to reclaim VLA storage on lexical scope exits, including nested scopes, loops, `break`, `continue`, and permitted `goto` exits. VLA addresses remain ordinary data pointers across subsequent allocations and calls. Outgoing stack arguments are allocated below the current dynamic `SP` and released after each call. Function epilogues restore `SP` from `r3` before releasing fixed storage and restoring saved registers; tail transfers likewise require the frame to be fully released.

There is no mandatory runtime overflow check. Exceeding the available stack is undefined behavior. Stack-usage metadata reports the known fixed-frame contribution and marks functions with variable-sized objects as having incomplete bounds. LLD continues to diagnose statically provable overflow, but an unknown dynamic contribution alone does not reject a program or certify a complete bound.

### 47.6. Epilogue and tail calls

An epilogue:

1. Discards active dynamic storage by restoring `SP` from `r3`, when a frame pointer is used.
2. Releases fixed local and spill storage.
3. Restores saved registers and the entry `SP`.
4. Executes `RET`.

Mandatory tail-call support is limited to calls that:

- Use the same calling convention.
- Pass no stack arguments.
- Do not require a new hidden result pointer.
- Have restored all callee-saved registers.
- Have fully deallocated the current frame.

An implementation MAY support additional sibling-call cases when it can preserve the caller's existing return record and construct the callee's stack-argument layout correctly.

---

# Part VIII — System ABI

## 48. Service invocation

`SYS service8` invokes the runtime service identified by the unsigned immediate operand.

Every service has an explicit interface consisting of:

- Service identifier.
- Logical arguments and results.
- Fixed physical input and result registers.
- Preserved architectural registers and state.
- Observable side effects.
- Ordering and optimization constraints.

A result register is an explicit definition, not a clobber. “Clobbers nothing else” means that every general-purpose register outside the result, plus `CC` and `SP`, is preserved.

Unsupported service identifiers are invalid instructions.

The assembler exposes the generic machine instruction:

```text
SYS service8
```

LLVM IR SHOULD NOT expose a generic service-number intrinsic. Each supported
service has a typed compiler representation specified in Section 59. Most
services use dedicated target intrinsics. `memcpy`, `memcpy_P`, `memset`, and
`memmove` MAY instead use corresponding generic LLVM memory intrinsics when
those representations preserve the required address spaces and memory
semantics. The comparison, string, and formatted-output services use
dedicated typed target intrinsics because LLVM has no generic intrinsics with
their complete semantics. The display, drawing, and text services also use dedicated typed target
intrinsics because their fixed framebuffer effects, program-space effects,
hidden selected-state dependencies, or externally observable display output
have no generic LLVM representation.

## 49. Defined services

| ID | Name | Inputs | Results | Other clobbers |
|---:|---|---|---|---|
| `0x00` | `debug_putc` | `low8(r4)` | None | None |
| `0x01` | `debug_break` | None | None | None |
| `0x02` | `millis` | None | `r4` | None |
| `0x03` | `millis32` | None | `q2 = r4:r5` | None |
| `0x04-0x0E` | Reserved (former math services) | — | Invalid-secondary trap | — |
| `0x0F` | `memcpy` | `r4 = dst`, `r5 = src`, `r6 = n` | `r4 = dst` | Data-space memory |
| `0x10` | `memcpy_P` | `r4 = dst`, `q3 = src`, `r5 = n` | `r4 = dst` | Data-space memory |
| `0x11` | `memset` | `r4 = dst`, `r5 = val`, `r6 = n` | `r4 = dst` | Data-space memory |
| `0x12` | `memmove` | `r4 = dst`, `r5 = src`, `r6 = n` | `r4 = dst` | Data-space memory |
| `0x13` | `memcmp_P` | `r4 = RAM lhs`, `q3 = program rhs`, `r5 = n` | signed `-1`, `0`, or `+1` in `r4` | Data- and program-space reads |
| `0x14` | `strcmp_P` | `r4 = RAM lhs`, `q3 = program rhs` | signed `-1`, `0`, or `+1` in `r4` | Data- and program-space reads |
| `0x15` | `strlen_P` | `q3 = program string` | `r4 = length` | Program-space reads |
| `0x16` | `strncpy_P` | `r4 = dst`, `q3 = program src`, `r5 = n` | `r4 = dst` | Program-space reads; data-space writes |
| `0x17` | `strncat_P` | `r4 = dst`, `q3 = program src`, `r5 = n` | `r4 = dst` | Data- and program-space reads; data-space writes |
| `0x18` | `memcmp` | `r4 = lhs`, `r5 = rhs`, `r6 = n` | exact signed byte difference in `r4` | Data-space reads |
| `0x19` | `strcmp` | `r4 = lhs`, `r5 = rhs` | exact signed byte difference in `r4` | Data-space reads |
| `0x1A` | `strlen` | `r4 = string` | `r4 = length` | Data-space reads |
| `0x1B` | `strncpy` | `r4 = dst`, `r5 = src`, `r6 = n` | `r4 = dst` | Data-space reads and writes |
| `0x1C` | `strncat` | `r4 = dst`, `r5 = src`, `r6 = n` | `r4 = dst` | Data-space reads and writes |
| `0x1D` | `display` | `r4 = clear` | None | Framebuffer reads; optional framebuffer clearing; display output |
| `0x1E` | `draw_sprite_overwrite` | `r4 = x`, `r5 = y`, `q1 = sprite`, `r6 = frame` | None | Program-space reads; framebuffer reads and writes |
| `0x1F` | `draw_sprite_plus_mask` | `r4 = x`, `r5 = y`, `q1 = sprite`, `r6 = frame` | None | Program-space reads; framebuffer reads and writes |
| `0x20` | `draw_sprite_self_masked` | `r4 = x`, `r5 = y`, `q1 = sprite`, `r6 = frame` | None | Program-space reads; framebuffer reads and writes |
| `0x21` | `draw_sprite_erase` | `r4 = x`, `r5 = y`, `q1 = sprite`, `r6 = frame` | None | Program-space reads; framebuffer reads and writes |
| `0x22` | `set_sprite` | `q2 = sprite` | None | Program-space header read; selected-sprite state update |
| `0x23` | `draw_overwrite` | `r4 = x`, `r5 = y`, `r6 = frame` | None | Selected-sprite and program-space reads; framebuffer reads and writes |
| `0x24` | `draw_plus_mask` | `r4 = x`, `r5 = y`, `r6 = frame` | None | Selected-sprite and program-space reads; framebuffer reads and writes |
| `0x25` | `draw_self_masked` | `r4 = x`, `r5 = y`, `r6 = frame` | None | Selected-sprite and program-space reads; framebuffer reads and writes |
| `0x26` | `draw_erase` | `r4 = x`, `r5 = y`, `r6 = frame` | None | Selected-sprite and program-space reads; framebuffer reads and writes |
| `0x27` | `draw_filled_rect_white` | `r4 = x`, `r5 = y`, `low8(r6) = w`, `low8(r7) = h` | None | Framebuffer reads and writes |
| `0x28` | `draw_filled_rect_black` | `r4 = x`, `r5 = y`, `low8(r6) = w`, `low8(r7) = h` | None | Framebuffer reads and writes |
| `0x29` | `buttons` | None | zero-extended button mask in `r4` | Button input |
| `0x2A` | `idle` | None | None | Processor sleep until interrupt |
| `0x2B` | `generate_random_seed` | None | `r4` | ADC and Timer0 reads |
| `0x2C` | `save` | None | None | Image-header read; persistent-storage read, erase, and write; saved-prefix read |
| `0x2D` | `load` | None | canonical Boolean in `r4` | Image-header and persistent-storage reads; saved-prefix write on success |
| `0x2E` | `save_exists` | None | canonical Boolean in `r4` | Image-header and persistent-storage reads |
| `0x2F` | `vsnprintf` | `r4 = dst`, `r5 = size`, `r6 = RAM format`, `r2 = va_list cursor` | signed count or `-1` in `r4` | Data-space reads and writes; possible program-space reads |
| `0x30` | `vsnprintf_P` | `r4 = dst`, `r5 = size`, `q3 = program format`, `r2 = va_list cursor` | signed count or `-1` in `r4` | Data-space reads and writes; program-space reads |
| `0x31` | `set_text_font` | `q2 = program font` | None | Program-space header read; selected-font state update |
| `0x32` | `set_text_mode` | `low8(r4) = mode` | None | Selected-mode state update |
| `0x33` | `draw_text` | `r4 = x`, `r5 = baseline y`, `r6 = RAM string` | `r4 = final x`, `r5 = final baseline y` | Data-space string read; selected-text and program-space font reads; framebuffer reads and writes |
| `0x34` | `draw_text_P` | `r4 = x`, `r5 = baseline y`, `q3 = program string` | `r4 = final x`, `r5 = final baseline y` | Selected-text, program-space string/font reads; framebuffer reads and writes |
| `0x35` | `draw_textfv` | `r4 = x`, `r5 = baseline y`, `r6 = RAM format`, `r2 = va_list cursor` | `r4 = final x`, `r5 = final baseline y` | Formatted AS0/AS1 reads; selected-text and program-space font reads; framebuffer reads and writes |
| `0x36` | `draw_textfv_P` | `r4 = x`, `r5 = baseline y`, `q3 = program format`, `r2 = va_list cursor` | `r4 = final x`, `r5 = final baseline y` | Formatted AS0/AS1 reads; selected-text and program-space font reads; framebuffer reads and writes |
| `0x37` | `debug_printfv_P` | `q3 = program format`, `r2 = va_list cursor` | signed count or `-1` in `r4` | Formatted AS0/AS1 reads; `%n` AS0 writes; observable debug output |
| `0x38` | `audio` | `low8(r7) = command`; command-specific `r4-r6` | Status command: zero-extended bit mask in `r4`; otherwise none | Program-space song reads; hidden audio state and speaker output |
| `0x39` | `send_display_command` | `low8(r4) = command` | None | Observable display command |
| `0x3A` | `get_system_width` | None | Width in `r4` | System query |
| `0x3B` | `get_system_height` | None | Height in `r4` | System query |
| `0x3C` | `get_system_display_type` | None | Display type in `r4` | System query |
| `0x3D` | `debug_printfv` | `r6 = RAM format`, `r2 = va_list cursor` | signed count or `-1` in `r4` | AS0 format/argument reads, indirect AS0/AS1 reads, `%n` AS0 writes; observable debug output |
| `0x3E-0xFF` | Reserved | — | — | — |

Every defined service preserves:

```text
CC
SP
every general-purpose register not listed as a result
```

An input-only service register is preserved. Guest math functions use the
ordinary C ABI, including its call-clobbered registers and `CC`.

### 49.1. `debug_putc`

Encoding:

```text
D7 00
```

Input:

```text
low8(r4) = byte to emit
```

The service emits one byte to the implementation-defined debug output stream.

The service reads only `low8(r4)`. It preserves the complete value of `r4`, including `high8(r4)`, and preserves every other architectural register and state item.

The output operation is externally observable. It MUST NOT be removed, duplicated, speculated, combined with another call, or reordered across another observable system service.

### 49.2. `debug_break`

Encoding:

```text
D7 01
```

Inputs and results:

```text
none
```

The service requests a debugger or simulator breakpoint. An implementation may stop execution and later resume at the following instruction.

The service preserves all general-purpose registers, `CC`, and `SP`.

The breakpoint is externally observable. It MUST remain at its program-order position and MUST NOT be removed, duplicated, speculated, or commoned.

### 49.3. `millis`

Encoding:

```text
D7 02
```

Input:

```text
none
```

Result:

```text
r4 = low16(elapsed_milliseconds)
```

`elapsed_milliseconds` is an implementation-maintained unsigned millisecond counter whose epoch is runtime startup. The result wraps modulo `2^16`.

The service defines the complete 16-bit `r4` register and preserves `r5-r7`, `r0-r3`, `CC`, and `SP`.

Each invocation observes the current timer state. Calls MUST NOT be removed, duplicated, speculated, common-subexpression eliminated, or hoisted from their program-order position.

### 49.4. `millis32`

Encoding:

```text
D7 03
```

Input:

```text
none
```

Result:

```text
q2 = r4:r5 = low32(elapsed_milliseconds)
```

The result wraps modulo `2^32`.

The service defines the complete 32-bit pair `q2`, and therefore defines both `r4` and `r5`. It preserves `r6-r7`, `r0-r3`, `CC`, and `SP`.

Each invocation observes the current timer state. Calls MUST NOT be removed, duplicated, speculated, common-subexpression eliminated, or hoisted from their program-order position.

### 49.5. Retired floating-point math services

`SYS 0x04-0x0E` are reserved and enter the invalid-secondary trap. Rebuild
applications that used them or the former `FF` math instructions with the
matching compiler and runtime.

The runtime provides `sqrtf`, `sinf`, `cosf`, `atan2f`, `tanf`, `expf`, `logf`,
`log2f`, `log10f`, `exp2f`, `expm1f`, `log1pf`, `cbrtf`, `asinf`, `acosf`,
`ldexpf`, `frexpf`, `modff`, `nextafterf`, `powf`, `hypotf`, `fmodf`, `truncf`, `floorf`, `ceilf`,
`roundf`, `fmaf`, `fminf`, and `fmaxf` as ordinary C ABI functions. Angles are radians;
`atan2f` returns an angle in `[-pi, +pi]`. Math errors are reported through
`errno` (`math_errhandling == MATH_ERRNO`); no floating-point exception state
is exposed. NaN result payloads are unspecified. `fmodf` has
the sign of its first operand and computes the mathematical remainder with
quotient truncated toward zero, without forming an overflowing float quotient.

`math.h` also provides `fpclassify`, `isfinite`, `isinf`, `isnan`, `isnormal`,
`signbit`, and the six C99 ordered/unordered comparison macros. Their arguments
are evaluated once. Classification uses native 16-bit integer bit tests
and sign extraction; comparisons use FCMP. AVM float, double, and long double
are all binary32. All C99 real math functions also have standard unsuffixed
`double` and `l`-suffixed `long double` entry points with correctly typed
parameters and results. These adapters reuse the float kernels, including their
`errno` behavior; `modf` and `modfl` copy the integral output through a float
local rather than aliasing a differently typed pointer. `float_t` and `double_t`
follow `FLT_EVAL_METHOD`. The header retains wider types when compiled for a host.
Signaling NaNs are classified without requiring floating-point exceptions.
`frexpf`, `modff`, and `nextafterf` use exact representation operations;
`ldexpf` shares `scalbnf` and its ties-to-even gradual underflow. See the
[math runtime](../runtime/lib/math/README.md) for algorithms, accuracy policy,
and measured costs.

### 49.6. `memcpy`

Encoding:

```text
D7 0F
```

C interface and fixed service-register assignment:

```c
void *memcpy(void *dst, void const *src, uint16_t n);
```

```text
r4 = dst
r5 = src
r6 = n
```

The service copies exactly `n` bytes from data-space addresses `src` through
`src+n-1` to data-space addresses `dst` through `dst+n-1`, in increasing
address order. If `n` is zero, it performs no memory access. As for the C
`memcpy` function, behavior is undefined when the source and destination
objects overlap. The caller must provide valid source and destination ranges;
otherwise behavior is undefined.

The result is the original `dst` value in `r4`. The service preserves the
bit patterns of `r4`, `r5`, and `r6`, so `r4` simultaneously serves as the
first input and the result. It also preserves `r0-r3`, `r7`, `CC`, and `SP`.

### 49.7. `memcpy_P`

Encoding:

```text
D7 10
```

C interface and fixed service-register assignment:

```c
void *memcpy_P(
    void *dst,
    void const __attribute__((address_space(1))) *src,
    uint16_t n);
```

```text
r4 = dst
q3 = src
r5 = n
```

The logical source address is `q3[23:0]`; the service ignores `q3[31:24]`.
The service copies exactly `n` bytes from program-space addresses `src` through
`src+n-1` to data-space addresses `dst` through `dst+n-1`, in increasing
address order. If
`n` is zero, it performs no program- or data-space memory access. The caller
must provide valid source and destination ranges; otherwise behavior is
undefined.

The result is the original `dst` value in `r4`. The service preserves the bit
patterns of `r4`, `q3`, and `r5`, so `r4` simultaneously serves as the first
input and the result. It also preserves `r0-r3`, `CC`, and `SP`.

The physical service-register order is independent of the source-language
parameter order. Compilers retain the conventional C signature
`(dst, src, n)` while assigning `n` to `r5` and `src` to `q3` when selecting
`SYS 0x10`.


### 49.8. `memset`

Encoding:

```text
D7 11
```

C interface and fixed service-register assignment:

```c
void *memset(void *dst, int16_t val, uint16_t n);
```

```text
r4 = dst
r5 = val
r6 = n
```

The fill byte is:

```text
fill = low8(r5)
```

The service writes `fill` to exactly `n` consecutive data-space bytes at
addresses `dst` through `dst+n-1`, in increasing address order. Bits `15:8` of
`val` do not affect the bytes written. If `n` is zero, the service performs no
memory access. The caller must provide a valid destination range; otherwise
behavior is undefined.

The result is the original `dst` value in `r4`. The service preserves the bit
patterns of `r4`, `r5`, and `r6`, so `r4` simultaneously serves as the first
input and the result and the complete original `val` and `n` remain available
after the service. It also preserves `r0-r3`, `r7`, `CC`, and `SP`.


### 49.9. `memmove`

Encoding:

```text
D7 12
```

C interface and fixed service-register assignment:

```c
void *memmove(void *dst, void const *src, uint16_t n);
```

```text
r4 = dst
r5 = src
r6 = n
```

The service copies exactly `n` bytes from the data-space source range to the
data-space destination range with the semantics of copying through a temporary
array, so overlapping ranges are supported.

If `n` is zero or `dst == src`, the service performs no memory access.

Otherwise, copying proceeds as follows:

```text
if dst < src or dst - src >= n:
    copy forward:
        for i = 0 .. n-1:
            mem8[dst+i] = mem8[src+i]
else:
    copy backward:
        for i = n-1 .. 0:
            mem8[dst+i] = mem8[src+i]
```

Equivalently, backward copying is used exactly when:

```text
dst > src and dst - src < n
```

The caller must provide valid source and destination ranges of `n` bytes;
otherwise behavior is undefined. The valid ranges must not wrap around the
16-bit data address space.

The result is the original `dst` value in `r4`. The service preserves the bit
patterns of `r4`, `r5`, and `r6`, so `r4` simultaneously serves as the first
input and the result. It also preserves `r0-r3`, `r7`, `CC`, and `SP`.


### 49.10. `memcmp_P`

Encoding:

```text
D7 13
```

C interface and fixed service-register assignment:

```c
int memcmp_P(
    void const *lhs,
    void const __attribute__((address_space(1))) *rhs,
    uint16_t n);
```

```text
r4 = lhs
q3 = rhs
r5 = n
```

The logical program address is `q3[23:0]`; the service ignores
`q3[31:24]`. For `i` from zero upward, the service compares
`unsigned(mem8[lhs+i])` with `unsigned(prog8[rhs+i])`. It stops at the first
mismatch or after exactly `n` equal bytes. It returns `-1`, `0`, or `+1` in
`r4` according to whether the first differing RAM byte is less than, equal to,
or greater than the program byte. The magnitude of a nonzero result is not the
byte difference.

If `n` is zero, the result is zero and the service performs no memory access.
The caller must provide valid readable ranges of `n` bytes in the respective
address spaces; otherwise behavior is undefined. The service preserves `q3`,
`r5`, `r0-r3`, `r6`, `CC`, and `SP`.

### 49.11. `strcmp_P`

Encoding:

```text
D7 14
```

C interface and fixed service-register assignment:

```c
int strcmp_P(
    char const *lhs,
    char const __attribute__((address_space(1))) *rhs);
```

```text
r4 = lhs
q3 = rhs
```

The logical program address is `q3[23:0]`; the service ignores
`q3[31:24]`. The service compares corresponding bytes as unsigned
characters. It stops at the first mismatch or when equal zero bytes are found.
It returns `-1`, `0`, or `+1` in `r4` according to the ordering of the first
differing bytes. A nonzero result need not equal their arithmetic difference.
Both pointers must identify readable NUL-terminated strings; otherwise behavior
is undefined. The service preserves `q3`, `r0-r3`, `r5`, `CC`, and `SP`.

### 49.12. `strlen_P`

Encoding:

```text
D7 15
```

C interface and fixed service-register assignment:

```c
uint16_t strlen_P(
    char const __attribute__((address_space(1))) *src);
```

```text
q3 = src
```

The logical program address is `q3[23:0]`; the service ignores
`q3[31:24]`. The service returns in `r4` the number of consecutive nonzero
program-space bytes before the first zero byte. The terminating zero is
not included. The source must identify a readable NUL-terminated string whose
length is representable in `uint16_t`; otherwise behavior is undefined. The
service preserves `q3`, `r0-r3`, `r5`, `CC`, and `SP`.

### 49.13. `strncpy_P`

Encoding:

```text
D7 16
```

C interface and fixed service-register assignment:

```c
char *strncpy_P(
    char *dst,
    char const __attribute__((address_space(1))) *src,
    uint16_t n);
```

```text
r4 = dst
q3 = src
r5 = n
```

The logical program address is `q3[23:0]`; the service ignores
`q3[31:24]`. The service copies at most `n` bytes from program space to data
space. If a source zero byte is encountered before `n` bytes have
been written, that zero is copied and every remaining destination byte through
`dst+n-1` is set to zero. If no source zero occurs in the first `n` bytes,
exactly `n` bytes are copied and no terminating zero is added.

If `n` is zero, no memory is accessed. Source and destination ranges must be
valid and must not overlap through any implementation-defined aliasing of the
address spaces. The result is the original `dst` in `r4`. The service preserves
`q3`, `r5`, `r0-r3`, `r6`, `CC`, and `SP`.

### 49.14. `strncat_P`

Encoding:

```text
D7 17
```

C interface and fixed service-register assignment:

```c
char *strncat_P(
    char *dst,
    char const __attribute__((address_space(1))) *src,
    uint16_t n);
```

```text
r4 = dst
q3 = src
r5 = n
```

The logical program address is `q3[23:0]`; the service ignores
`q3[31:24]`. If `n` is nonzero, the service locates the terminating zero of the
data-space destination, appends at most `n` nonzero source
characters, and writes one terminating zero. A source zero encountered within
the bound is copied as the terminator; otherwise the service writes an
additional zero after the `n` copied characters. If `n` is zero, the service
performs no memory access and returns `dst`.

For nonzero `n`, `dst` must identify a writable NUL-terminated string with
space for the appended bytes and terminator, and `src` must be readable through
the first zero or the first `n` bytes, whichever comes first. The objects must
not overlap. The result is the original `dst` in `r4`. The service preserves
`q3`, `r5`, `r0-r3`, `r6`, `CC`, and `SP`.

### 49.15. `memcmp`

Encoding:

```text
D7 18
```

C interface and fixed service-register assignment:

```c
int memcmp(void const *lhs, void const *rhs, uint16_t n);
```

```text
r4 = lhs
r5 = rhs
r6 = n
```

The service compares corresponding bytes as unsigned values until the first
mismatch or until `n` bytes have compared equal. It returns the exact signed
16-bit value

```text
unsigned(mem8[lhs+i]) - unsigned(mem8[rhs+i])
```

for the first mismatching index `i`, or zero when all `n` bytes compare equal.
The possible result range is `-255..+255`. If `n` is zero, the result is zero
and no memory is accessed. The caller must provide valid readable ranges of
`n` bytes. The service preserves `r5`, `r6`, `r0-r3`, `r7`, `CC`, and `SP`.

### 49.16. `strcmp`

Encoding:

```text
D7 19
```

C interface and fixed service-register assignment:

```c
int strcmp(char const *lhs, char const *rhs);
```

```text
r4 = lhs
r5 = rhs
```

The service compares corresponding bytes as unsigned characters. It returns
the exact signed 16-bit difference of the first unequal bytes, in the range
`-255..+255`, or zero when both strings reach equal zero bytes. Both inputs
must be readable NUL-terminated strings. The service preserves `r5`, `r0-r3`,
`r6-r7`, `CC`, and `SP`.

### 49.17. `strlen`

Encoding:

```text
D7 1A
```

C interface and fixed service-register assignment:

```c
uint16_t strlen(char const *src);
```

```text
r4 = src
```

The service returns in `r4` the number of consecutive nonzero data-space bytes
before the first zero byte. The terminator is not included. The input must be a
readable NUL-terminated string. The service preserves `r0-r3`, `r5-r7`, `CC`,
and `SP`.

### 49.18. `strncpy`

Encoding:

```text
D7 1B
```

C interface and fixed service-register assignment:

```c
char *strncpy(char *dst, char const *src, uint16_t n);
```

```text
r4 = dst
r5 = src
r6 = n
```

The service has the standard bounded-copy semantics described for `strncpy_P`,
with both source and destination in data space. If `n` is zero, no memory is
accessed. Source and destination objects must not overlap. The result is the
original `dst` in `r4`. The service preserves `r5`, `r6`, `r0-r3`, `r7`, `CC`,
and `SP`.

### 49.19. `strncat`

Encoding:

```text
D7 1C
```

C interface and fixed service-register assignment:

```c
char *strncat(char *dst, char const *src, uint16_t n);
```

```text
r4 = dst
r5 = src
r6 = n
```

The service has the bounded-append semantics described for `strncat_P`, with
both strings in data space. If `n` is zero, it performs no memory access and
returns `dst`. For nonzero `n`, the destination must have space for the
appended characters and one terminator. The source and destination objects must
not overlap. The result is the original `dst` in `r4`. The service preserves
`r5`, `r6`, `r0-r3`, `r7`, `CC`, and `SP`.

### 49.20. `display`

Encoding:

```text
D7 1D
```

C interface and fixed service-register assignment:

```c
void display(bool clear);
```

```text
r4 = clear
```

The service updates the configured physical display from the complete
1,024-byte framebuffer at data-space addresses `0x0500-0x08FF`. The bytes are
interpreted using the conventional framebuffer mapping from Section 10.

The logical clear value is:

```text
clear = (low8(r4) != 0)
```

Bits `15:8` of `r4` do not affect the operation. The complete original bit
pattern of `r4` is preserved.

For every framebuffer byte, the value present when the service reads that byte
is transferred to the display. If `clear` is false, the framebuffer is not
modified. If `clear` is true, each framebuffer byte is set to zero after its
display value has been captured. Therefore, when the service returns:

- the physical display shows the framebuffer image that existed when the
  service processed it; and
- the complete framebuffer contains zero when `clear` is true.

The configured display controller may be SSD1306, SSD1309, or SH1106. Controller
commands, transfer ordering, and physical bus timing are implementation details;
all supported controllers provide the same architectural framebuffer and clear
semantics.

Display output is externally observable. The service MUST NOT be removed,
duplicated, speculated, commoned, or reordered across another display update or
across a framebuffer access that could change the image it observes. The
service preserves every general-purpose register, `CC`, and `SP`.

### 49.21. Sprite selection and drawing services

Encodings:

| ID | Encoding | Service |
|---:|---|---|
| `0x1E` | `D7 1E` | `draw_sprite_overwrite` |
| `0x1F` | `D7 1F` | `draw_sprite_plus_mask` |
| `0x20` | `D7 20` | `draw_sprite_self_masked` |
| `0x21` | `D7 21` | `draw_sprite_erase` |
| `0x22` | `D7 22` | `set_sprite` |
| `0x23` | `D7 23` | `draw_overwrite` |
| `0x24` | `D7 24` | `draw_plus_mask` |
| `0x25` | `D7 25` | `draw_self_masked` |
| `0x26` | `D7 26` | `draw_erase` |

The four `draw_sprite_*` services take an explicit program-space sprite pointer:

```text
r4 = signed 16-bit x coordinate
r5 = signed 16-bit y coordinate
q1 = program-space sprite pointer
r6 = unsigned 16-bit frame index
```

The logical sprite address is `q1[23:0]`; bits `q1[31:24]` are ignored.
These services preserve the complete original bit patterns of `r4`, `r5`,
`q1`, and `r6`, and preserve every other general-purpose register, `CC`, and
`SP`. An explicit-pointer draw does not change the selected-sprite state.

`set_sprite` uses:

```text
q2 = program-space sprite pointer
```

The logical sprite address is `q2[23:0]`; bits `q2[31:24]` are ignored.
`set_sprite` reads the two-byte sprite header immediately and selects that
sprite for later cached-pointer drawing. It does not read or modify the
framebuffer. It preserves the complete original `q2` bit pattern and every
other general-purpose register, `CC`, and `SP`.

The four shorter `draw_*` services use the most recently selected sprite:

```text
r4 = signed 16-bit x coordinate
r5 = signed 16-bit y coordinate
r6 = unsigned 16-bit frame index
```

They preserve the complete original bit patterns of `r4`, `r5`, and `r6`, and
preserve every other general-purpose register, `CC`, and `SP`. Runtime startup
has no selected sprite. Until `set_sprite` is invoked, cached-pointer draws are
no-ops. A later `set_sprite` replaces the previous selection. The selected
sprite is runtime-private state and is not addressable as ordinary AVM data
memory.

The program-space sprite object begins with a two-byte header:

```text
sprite[0] = width in pixels, as an unsigned byte
sprite[1] = height in pixels, as an unsigned byte
sprite[2] = first byte of frame zero
```

Let:

```text
pages        = (height + 7) >> 3
             = ceil(height / 8)
bitmapStride = width * pages
```

The overwrite, self-masked, and erase formats use `bitmapStride` bytes per
frame. Frame bytes are page-major: page zero contains `width` consecutive
column bytes, followed by page one, and so on. Bit `b` of the byte for source
column `sx` and source page `sp` represents source pixel `(sx, 8*sp+b)`.

When `height` is not divisible by eight, bits in the final source page whose
source row is greater than or equal to `height` are padding. Their requirements
depend on the drawing mode:

| Mode | Services | Final-page padding requirement |
|---|---|---|
| Overwrite | `draw_sprite_overwrite`, `draw_overwrite` | Padding bits may have any value; the service ignores them. |
| Self-masked | `draw_sprite_self_masked`, `draw_self_masked` | Every padding bit MUST be zero. |
| Erase | `draw_sprite_erase`, `draw_erase` | Every padding bit MUST be zero. |

The plus-mask format uses an interleaved image byte followed by a mask byte for
each source column. For every image/mask pair in the selected frame:

```text
imageByte & ~maskByte = 0
```

Thus an image bit may be set only where the corresponding mask bit is set. When
`height` is not divisible by eight, every padding bit in both the final-page
image byte and its corresponding mask byte MUST be zero. Its frame stride is:

```text
plusMaskStride = 2 * bitmapStride
```

For an explicit-pointer draw, `sprite` is the logical value in `q1`. For a
cached-pointer draw, `sprite` is the most recently selected logical pointer and
`width` and `height` are the header values captured by `set_sprite`. The
selected frame begins at:

```text
frameBase = low24(sprite + 2 + frame * frameStride)
```

where `frameStride` is `bitmapStride` for the single-plane modes and
`plusMaskStride` for the plus-mask mode. An explicit-pointer draw requires a
valid two-byte header and complete selected frame. `set_sprite` requires a
valid readable two-byte header, and each later cached-pointer draw requires a
complete selected frame for the cached dimensions and requested mode. The
selected frame must satisfy the padding and plus-mask restrictions above.
Violating those requirements is an invalid service invocation. The header and
selected frame ranges must not wrap the 24-bit program address space.

The sprite rectangle is positioned with its upper-left source pixel at signed
coordinates `(x,y)` and is clipped to the framebuffer rectangle:

```text
0 <= destination x < 128
0 <= destination y < 64
```

Pixels outside the framebuffer are ignored. A zero-width or zero-height sprite,
or a sprite whose rectangle does not intersect the framebuffer, leaves the
framebuffer unchanged. Drawing never modifies framebuffer pixels outside the
clipped sprite rectangle.

For each visible source pixel, let `d` be the original framebuffer bit, `s` the
source image bit, and, for the plus-mask format, `m` the source mask bit. The
new framebuffer bit is:

```text
overwrite:   s
plus-mask:   (d & !m) | (s & m)
self-masked: d | s
erase:       d & !s
```

The explicit-pointer drawing services read the program-space header and
selected frame. The cached-pointer drawing services read the selected-sprite
state and the selected frame; they do not reread the header. All eight drawing
services read and write the fixed framebuffer at `0x0500-0x08FF`. None updates
the physical display; a later `display` service transfers the modified
framebuffer.

The selected-sprite state imposes an ordering dependency. `set_sprite` MUST NOT
be duplicated, speculated, commoned, or reordered across another `set_sprite`
or a cached-pointer draw. A cached-pointer draw MUST NOT be reordered across a
`set_sprite` that may determine its selected sprite. An explicit-pointer draw
has no selected-state effect and may be reordered relative to `set_sprite` only
when all program-space, framebuffer, and other observable dependencies permit
it.

Framebuffer writes are observable program memory effects. A drawing service
MUST NOT be removed when its writes may be observed and MUST NOT be speculated
or reordered across an access that may alias the framebuffer. It may be
reordered relative to provably disjoint data-space memory only when its
program-space read, selected-state dependencies, and all other observable
service constraints are preserved.

### 49.22. Filled rectangle drawing services

Encodings:

| ID | Encoding | Service |
|---:|---|---|
| `0x27` | `D7 27` | `draw_filled_rect_white` |
| `0x28` | `D7 28` | `draw_filled_rect_black` |

Both services use the same fixed service-register assignment:

```text
r4       = signed 16-bit x coordinate
r5       = signed 16-bit y coordinate
low8(r6) = unsigned 8-bit width
low8(r7) = unsigned 8-bit height
```

Bits `15:8` of `r6` and `r7` do not affect the operation. Both services
preserve the complete original bit patterns of `r4-r7`, including those ignored
high bytes, and preserve `r0-r3`, `CC`, and `SP`.

Let `x`, `y`, `w`, and `h` denote the input values above. The logical rectangle
uses half-open mathematical-integer bounds:

```text
x <= px < x + w
y <= py < y + h
```

The additions in those bounds are mathematical additions for clipping
purposes; they do not wrap at 8 or 16 bits. The rectangle is clipped to the
framebuffer pixel range:

```text
0 <= px < 128
0 <= py < 64
```

If `w` or `h` is zero, or if the logical rectangle does not intersect the
framebuffer, the framebuffer is unchanged.

For every pixel within the clipped rectangle:

```text
draw_filled_rect_white: framebuffer pixel = 1
draw_filled_rect_black: framebuffer pixel = 0
```

Every framebuffer pixel outside the clipped rectangle is unchanged. The
services read and write the fixed framebuffer at data-space addresses
`0x0500-0x08FF`, using the pixel mapping from Section 10. They do not read
program space, modify selected-sprite state, or update the physical display. A
later `display` service transfers the modified framebuffer to the display.

The framebuffer writes are observable program memory effects. A filled-
rectangle service MUST NOT be speculated or reordered across an access that may
alias the framebuffer. It MAY be removed only when all affected framebuffer
writes are proven dead. It MAY be reordered relative to provably disjoint
memory when all program-order dependencies and observable-service constraints
remain satisfied.

### 49.23. `buttons`

Encoding:

```text
D7 29
```

Inputs:

```text
none
```

Result:

```text
r4 = zero_extend16(buttonMask)
```

The returned active-button mask uses the canonical Arduboy bit assignments:

| Button | Mask |
|---|---:|
| Up | `0x80` |
| Right | `0x40` |
| Left | `0x20` |
| Down | `0x10` |
| A | `0x08` |
| B | `0x04` |

A set bit denotes a currently pressed button. Simultaneous presses are combined
with bitwise OR. Bits `1:0` are zero. The complete high byte of `r4` is zero,
regardless of the ordinary ABI rule for an `uint8_t` function result.

The service observes evolving external input state. It MUST NOT be treated as a
constant, speculated, or common-subexpression eliminated across an operation
that may allow button state to change.

### 49.24. `idle`

Encoding:

```text
D7 2A
```

Inputs and results:

```text
none
```

The service places the processor in idle sleep mode until an enabled interrupt
wakes it, then resumes execution at the following AVM instruction. Timer0 and
other clocks available in idle mode continue to operate according to the
platform configuration.

The service is an observable scheduling and power-management point. It MUST NOT
be removed, duplicated, speculated, or reordered across another observable
system service.

### 49.25. `generate_random_seed`

Encoding:

```text
D7 2B
```

Inputs:

```text
none
```

Result:

```text
r4 = low16(adcReading + timer0Counter)
```

`adcReading` is one conversion from the platform random-seed ADC input.
`timer0Counter` is the unsigned eight-bit Timer0 counter sampled after that
conversion. The addition is unsigned modulo `2^16`.

The service reads evolving hardware state and MUST NOT be constant-folded,
common-subexpression eliminated, speculated, or duplicated.

### 49.26. Persistent save services

Encodings:

| ID | Encoding | Service |
|---:|---|---|
| `0x2C` | `D7 2C` | `save` |
| `0x2D` | `D7 2D` | `load` |
| `0x2E` | `D7 2E` | `save_exists` |

The services take no arguments. `save` has no result. `load` and `save_exists`
return a canonical Boolean:

```text
r4 = 0x0000  false
r4 = 0x0001  true
```

In particular, both services clear `high8(r4)`.

Each invocation rereads the little-endian `saveSize` field from image-header
offset `0x0A`. Implementations MUST NOT require a cached SRAM copy of this
field. The program-visible save source and destination range is:

```text
[0x0100, 0x0100 + saveSize)
```

When `saveSize == 0`, `save` is a no-op and the two Boolean services return
false.

#### Persistent record format

The selected persistent-storage erase sector contains an append-only sequence
of records:

```text
record offset + 0: saveSize low byte
record offset + 1: saveSize high byte
record offset + 2: saveSize payload bytes
```

The record size is therefore an unsigned little-endian 16-bit value. A record
belongs to the current image exactly when its stored size equals the image
header's current `saveSize`.

The Arduboy runtime uses one 4,096-byte erase sector and leaves its
final two bytes erased. A record is eligible for storage only when:

```text
recordOffset + 2 + saveSize <= 4094
```

#### `save`

`save` appends a new record containing the current saved-prefix bytes. It scans
matching records from sector offset zero. At the first nonmatching header:

- an erased `0xFFFF` header with sufficient remaining space is the append
  position;
- any other header, or insufficient remaining space, causes the sector to be
  erased and the new record to be written at offset zero.

Programming is split at physical 256-byte flash-page boundaries. The service
does not return until all erase or program operations have completed.

#### `load`

`load` scans matching records from sector offset zero and copies each matching
payload to the saved-prefix range. Consequently, after at least one matching
record, the newest matching record remains loaded and the service returns true.
If the first record does not match, the service returns false and does not
modify the saved-prefix range.

`load` never modifies bytes at or above `0x0100 + saveSize`.

#### `save_exists`

`save_exists` returns true exactly when the first record header equals the
current image's `saveSize`. It does not copy payload data and does not scan later
records.

The persistence services access externally retained state. They MUST NOT be
removed, duplicated, speculated, common-subexpression eliminated, or reordered
relative to one another. `save` reads the saved-prefix range; `load` may write
that range; `save_exists` does not access AVM data memory.

### 49.27. Formatted-output services

Encodings:

| ID | Encoding | Service |
|---:|---|---|
| `0x2F` | `D7 2F` | `vsnprintf` |
| `0x30` | `D7 30` | `vsnprintf_P` |
| `0x37` | `D7 37` | `debug_printfv_P` |

C interfaces:

```c
int vsnprintf(
    char *restrict dst,
    size_t size,
    char const *restrict format,
    va_list ap);

int vsnprintf_P(
    char *restrict dst,
    size_t size,
    char const __attribute__((address_space(1))) *restrict format,
    va_list ap);

int debug_printfv_P(
    char const __attribute__((address_space(1))) *restrict format,
    va_list ap);
```

The fixed service-register assignments are:

```text
vsnprintf:
    r4 = destination data pointer
    r5 = destination size
    r6 = data-space format pointer
    r2 = va_list cursor

vsnprintf_P:
    r4 = destination data pointer
    r5 = destination size
    q3 = program-space format pointer
    r2 = va_list cursor

debug_printfv_P:
    q3 = program-space format pointer
    r2 = va_list cursor
```

For `vsnprintf_P` and `debug_printfv_P`, the logical format address is
`q3[23:0]` and `q3[31:24]` is ignored. Format-address advancement is modulo
`2^24`.

`r2` is the 16-bit data-space address of the next unread variadic argument
byte. The service advances only an internal copy of this cursor. It preserves
the architectural value of `r2` and does not write an updated cursor back to
caller memory.

#### 49.27.1. Destination and return semantics

The two `vsnprintf` services have standard bounded-buffer counting semantics
for the supported format language:

```text
size == 0:
    do not access dst
    produce no stored bytes or terminator

size > 0:
    store at most size-1 formatted bytes
    store one terminating zero byte
```

Truncation does not stop parsing or argument consumption. The successful result
is the number of bytes that would have been written, excluding the terminating
zero, if the destination had been sufficiently large.

AVM `int` is signed 16-bit. A service returns `-1` in `r4` when:

- the required output count exceeds `INT_MAX` (`32767`); or
- the format string contains a byte not accepted by the grammar below.

When `size` is nonzero, the service writes a terminating zero even on either
error. On a format error, bytes emitted before the invalid construct remain in
the destination, subject to the size bound. Count overflow does not change the
bounded writes or termination behavior.

The original `dst` input in `r4` is replaced by the signed result. The two
buffer services preserve `r0-r3`, `r5-r7`, `CC`, and `SP`. They also preserve
the complete input bit patterns of `r2`, `r5`, and the applicable format
register (`r6` or `q3`).

`debug_printfv` (`SYS 0x3D`, encoding `D7 3D`) uses the same formatter and
debug sink as `debug_printfv_P`, with a 16-bit AS0 format pointer in `r6`
and a packed AS0 argument cursor in `r2`. It preserves every architectural
register except the signed 16-bit count/error result in `r4`, as well as CC
and SP. It reads the RAM format and variadic area, can read indirect AS0/AS1
arguments, and can write guest RAM through `%n`. Output goes directly to
`UEDATX`, without guest scratch buffers, static storage, or a second native
formatter workspace. Both FX and FX-C share this implementation.

`debug_printfv_P` emits every formatted byte to the implementation-defined
debug output stream and emits no terminating zero. On success it returns the
number of emitted bytes in `r4`. It returns `-1` under the same invalid-format
and count-overflow conditions as the buffer services. Bytes emitted before an
invalid construct remain observable, and count overflow does not stop output.
The service preserves `r0-r3`, `r5-r7`, `CC`, `SP`, and the complete input bit
patterns of `r2` and `q3`.

All four services read the variadic argument area in data space and may read
additional data-space objects through `%s` and program-space objects through
`%S`. `vsnprintf_P` and `debug_printfv_P` additionally read their formats from
program space. The buffer services write the bounded destination region
described above and may additionally write through `%n` destination pointers.
`debug_printfv_P` may write through `%n` destination pointers despite having no
ordinary output buffer. `%P` formats a program address value and performs no
program-space read.

Debug output is externally observable. `debug_printfv_P` MUST NOT be removed,
duplicated, speculated, combined with another call, or reordered across another
observable debug-output service.

#### 49.27.2. Accepted format grammar

A conversion begins with `%` and, except for `%%`, has this form:

```text
% [flags] [width] [.precision] [length] conversion
```

Accepted components are:

```text
flags:       -  +  space  #  0
width:       decimal digits or *
precision:   . followed by decimal digits, *, or no characters
length:      hh  h  l  ll  j  z  t  L
conversion:  c  s  S  d  i  u  o  x  X  p  P  f  F  e  E  g  G  a  A  n
```

`%lc` and `%ls` use AVM's fixed C locale: `wchar_t` is an unsigned byte,
all 256 byte values are representable, and no shift state is required. `%lc`
consumes a promoted two-byte integer and emits its wide-character byte;
`%ls` consumes a two-byte RAM pointer and uses byte precision and field width.
`%S` remains the separate three-byte program-memory string extension.

`%%` emits one literal `%` and consumes no argument. It accepts no flags,
width, precision, or length modifier.

A decimal width or precision is nonnegative. A `*` width or precision consumes
a promoted signed 16-bit `int`:

- a negative width sets the `-` flag and uses the unsigned magnitude of the
  value as the width;
- a negative precision is treated as though precision were omitted;
- `.` with no digits or `*` specifies precision zero.

The `INT16_MIN` dynamic-width case has width `32768`; it is not subject to
signed negation overflow. Repeated flags are permitted and have the same effect
as one occurrence.

The integer conversions `d`, `i`, `u`, `o`, `x`, and `X` accept `hh`, `h`,
`l`, `ll`, `j`, `z`, and `t`; `j` has the same 64-bit width as `ll` on AVM.
Floating-point conversions `f`, `F`, `e`, `E`, `g`, `G`, `a`, and `A` accept
the default length, `l`, and `L`. `l` also retains its existing integer use;
`L` is valid only for floating-point conversions. The complete
length/conversion pair is validated before its conversion value is consumed.
Arguments already consumed for `*` width or precision remain consumed if a
later byte makes the conversion invalid.

Any format byte not accepted in the current parser state causes the deterministic
`-1` result described above. This includes a terminating zero before a
conversion is complete, an unsupported conversion, or an unsupported length.
Incomplete `%ll` or `%j`, excess length characters (for example `%llld`),
noninteger pairs such as `%lls`, `%llc`, `%llp`, `%llf`, and `%jf`, and
integer pairs using `L` are invalid. `%n` accepts no flags, width, or
precision. It accepts `hh`, `h`, no length, `l`, `ll`, `j`, `z`, and `t`;
`L` is invalid. Invalid `%n` syntax is rejected before its destination
pointer is read.
The parser does not assign implementation-specific
semantics to an unrecognized form.

#### 49.27.3. Variadic argument representation

All values are read consecutively from the packed variadic area with one-byte
alignment and no implicit gaps:

| Format use | Bytes consumed |
|---|---:|
| `*` width or precision | 2 |
| `%c` | 2 |
| Integer conversion with `hh`, `h`, default, `z`, or `t` | 2 |
| Integer conversion with `l` | 4 |
| Integer conversion with `ll` or `j` | 8 |
| Floating-point conversion with default, `l`, or `L` | 4 |
| `%s` data pointer | 2 |
| `%S` program-string pointer | 3 |
| `%p` data pointer | 2 |
| `%P` program pointer | 3 |
| `%n` destination pointer (any valid length) | 2 |

Default argument promotions apply. In particular, `char`, `signed char`,
`unsigned char`, `bool`, `short`, and `unsigned short` arrive as 16-bit
promoted integers. AVM represents `float`, `double`, and `long double` as the
same 32-bit IEEE-754 binary32 value. `%S` and `%P` consume packed
little-endian program pointers:

```text
byte 0 = address bits 7:0
byte 1 = address bits 15:8
byte 2 = address bits 23:16
```

There is no fourth padding byte. A following variadic argument begins
immediately after byte 2.

For `ll`, all eight bytes are little-endian: byte 0 holds bits 7:0 and byte 7
holds bits 63:56. The next argument begins immediately after byte 7, even when
preceded by a three-byte `%P` or `%S` pointer. Neither the explicit `va_list`
interfaces nor the true-variadic builtins insert alignment padding.

#### 49.27.4. Conversion semantics

| Conversion | Argument and result |
|---|---|
| `%%` | Emit one `%`; consume no argument. |
| `%c` | Consume a promoted 16-bit integer and emit its low byte. |
| `%n` | Consume a 16-bit data pointer and store the logical count of previously formatted bytes without emitting output. |
| `%s` | Consume a 16-bit data pointer and emit its NUL-terminated data-space string. |
| `%S` | Consume a packed 24-bit program pointer and emit its NUL-terminated program-space string. |
| `%d`, `%i` | Format a signed decimal integer. |
| `%u` | Format an unsigned decimal integer. |
| `%o` | Format an unsigned octal integer. |
| `%x` | Format an unsigned hexadecimal integer using lowercase digits. |
| `%X` | Format an unsigned hexadecimal integer using uppercase digits. |
| `%p` | Emit `0x` followed by exactly four lowercase hexadecimal digits for a 16-bit data pointer. |
| `%P` | Emit `0x` followed by exactly six lowercase hexadecimal digits for a packed 24-bit program pointer. |
| `%f`, `%F` | Format fixed-point decimal; `%F` uses uppercase special values. |
| `%e`, `%E` | Format exponential decimal. |
| `%g`, `%G` | Select fixed or exponential decimal form. |
| `%a`, `%A` | Format hexadecimal floating point. |

`%p` and `%P` always include the prefix and complete fixed-width digit field,
including for a null pointer. `%P` does not dereference the pointer.

Integer lengths select these effective widths:

| Length | Effective integer width |
|---|---:|
| `hh` | Low 8 bits of a promoted 16-bit argument |
| `h` | 16 bits |
| default | 16 bits |
| `l` | 32 bits |
| `ll` | 64 bits |
| `j` | 64 bits |
| `z` | 16 bits |
| `t` | 16 bits |

For signed `hh` conversions, the selected low byte is interpreted as signed
8-bit. For unsigned `hh` conversions, it is interpreted as unsigned 8-bit.
Signed magnitude formation correctly handles `INT16_MIN`, `INT32_MIN`, and
`INT64_MIN`. The `ll` and `j` modifiers both select 64 bits for all six integer
conversions: `d`, `i`, `u`, `o`, `x`, and `X`. Signed decimal supports
`INT64_MIN` through `INT64_MAX`; unsigned conversions support zero through
`UINT64_MAX`. All existing integer flags, width, precision, prefix, and
output-count semantics apply equally to 64-bit values and to every formatting
sink.

The nonreentrant native formatter reuses its existing scratch allocation:
the 22-byte reversed integer digit buffer overlaps conversion-local string
state, the RAM-format cursor aliases the mutually exclusive program-format
cursor, and the eight-byte integer magnitude aliases floating-point state.
All integer lengths use one SRAM conversion engine operating on 1, 2, 4, or
8 active bytes. It tests the sign bit of the highest active byte and negates
only those bytes; it does not sign-extend narrower values to eight bytes.
Decimal digits use the existing bytewise divide-by-ten primitive, while octal
and hexadecimal digits use one variable-width right-shift loop.
These aliases add no native SRAM or persistent guest RAM. Integer and float
conversions initialize their own state before use; `%S` retains separate
program-string cursors and never overwrites the active format cursor.

#### 49.27.5. Flags, width, and precision

Field width counts the complete conversion result, including any sign or base
prefix. When the result is shorter than the width, padding is added; a field is
never truncated to its width.

For integer conversions:

- `-` left-adjusts the field and disables `0` width padding.
- `+` emits a plus sign for a nonnegative signed decimal result.
- space emits a leading space for a nonnegative signed decimal result when `+`
  is absent.
- `#` prefixes a nonzero hexadecimal value with `0x` or `0X` and requests an
  octal leading zero.
- `0` pads between any sign/prefix and the digits when `-` is absent and no
  precision was specified.
- an explicit precision gives the minimum number of digits and disables `0`
  width padding.
- precision zero suppresses the digits for numeric zero, except that alternate
  octal form still emits one zero.

For `%c`, `%s`, `%S`, `%p`, and `%P`, padding is always spaces. `-` selects
trailing rather than leading padding. The other parsed flags do not alter these
conversions. Precision is invalid for `%c`; for `%s` and `%S`, it limits the
maximum number of emitted string bytes; for `%p` and `%P`, it does not change
the fixed digit count.

For `%s` and `%S`, the effective string length is the number of bytes before
the first zero, capped by precision when specified. The service determines that
length before right-aligned output so leading padding is correct. Precision
zero emits an empty string without dereferencing the string pointer. Program-
string pointer advancement for `%S` is modulo `2^24`.

Formatting is byte-oriented and locale-independent. The supported language has
no wide-character, positional-argument, or locale-specific conversion. `%n`
stores one byte for `hh`, two bytes for `h`, default, `z`, or `t`, four bytes
for `l`, and eight bytes for `ll` or `j`. Stores are little-endian; wider
stores zero-extend the shared 16-bit count. It counts logical bytes even when
buffer output is truncated or text glyphs are missing, clipped, or invisible.
It is supported by all five formatting services: `vsnprintf`, `vsnprintf_P`,
`debug_printfv_P`, `draw_textfv`, and `draw_textfv_P`.

All sinks share the native `r8:r9` logical output counter. The text glyph
renderer preserves both registers while processing glyphs. `%n` records counts
through the existing successful 16-bit count range. The counter remains
16-bit; exact wide `%n` values after count overflow are not defined here.

#### 49.27.6. Caller requirements and ordering

The caller must provide:

- a valid writable destination of at least `size` bytes when `size != 0`;
- a readable NUL-terminated format string in the required address space;
- variadic arguments whose promoted types and packed sizes match the accepted
  conversion sequence; and
- readable NUL-terminated `%s` and `%S` strings, except that a zero precision
  permits the corresponding pointer not to be dereferenced.

Violating these requirements is undefined behavior. Source and destination
objects must also satisfy the C `restrict` contract of the interface.

The services have no externally observable effect other than their specified
memory accesses. A compiler must preserve ordering relative to data-space or
program-space accesses that may affect bytes read by the service or observe its
destination writes.

### 49.28. Text-state and text-drawing services

Encodings:

| ID | Encoding | Service |
|---:|---|---|
| `0x31` | `D7 31` | `set_text_font` |
| `0x32` | `D7 32` | `set_text_mode` |
| `0x33` | `D7 33` | `draw_text` |
| `0x34` | `D7 34` | `draw_text_P` |
| `0x35` | `D7 35` | `draw_textfv` |
| `0x36` | `D7 36` | `draw_textfv_P` |

The services use target-private selected-font and selected-mode state. This
state is not addressable through ordinary AVM data memory.

#### 49.28.1. Font object format

A font is a packed program-space object beginning with this three-byte header:

```text
font + 0  line_height
font + 1  glyph_first
font + 2  num_glyphs
font + 3  first glyph record; also the glyph-table base
```

All three header fields are unsigned bytes. The glyph table contains exactly
`num_glyphs` consecutive seven-byte records. Record `i` begins at:

```text
glyphTable + 7 * i
```

Each record has this byte layout:

| Byte | Field | Type |
|---:|---|---|
| `0` | `h` | unsigned 8-bit glyph height |
| `1` | `yoff` | signed 8-bit vertical bearing |
| `2` | `w` | unsigned 8-bit glyph width |
| `3` | `xoff` | signed 8-bit horizontal bearing |
| `4` | `image_offset` bits `7:0` | unsigned little-endian 16-bit offset |
| `5` | `image_offset` bits `15:8` | unsigned little-endian 16-bit offset |
| `6` | `xadv` | unsigned 8-bit cursor advance |

The image offset is relative to `glyphTable`, not to the beginning of the
font object or to the glyph record:

```text
glyphImage = low24(glyphTable + image_offset)
```

All bytes of every referenced glyph image MUST lie within the unsigned 64-KiB
relative window beginning at `glyphTable`. Equivalently, for an image of
`imageSize` bytes:

```text
image_offset + imageSize <= 65536
```

This relative-window restriction does not prohibit the corresponding logical
program-space range from crossing a physical or logical 64-KiB address
boundary. Addition of the glyph-table base is performed modulo `2^24`.

The represented character range does not wrap:

```text
glyph_first + num_glyphs <= 256
```

For an input byte `c`, interpreted as unsigned:

```text
if c < glyph_first:
    missing glyph
else:
    index = c - glyph_first
    if index >= num_glyphs:
        missing glyph
    else:
        use glyph[index]
```

A missing glyph has no framebuffer effect and advances the cursor by zero.
There is no implicit replacement glyph.

A nonempty glyph image uses the single-plane page-major format:

```text
pages     = (h + 7) >> 3
imageSize = w * pages
```

For source page `sp`, the image stores `w` consecutive column bytes. Bit `b`
of the byte for source column `sx` represents source pixel:

```text
(sx, 8 * sp + b)
```

When `h` is not divisible by eight, every unused bit in the final source page
MUST be zero. For `w == 0` or `h == 0`, the service reads no image byte and
ignores `image_offset`, but still applies `xadv`.

A corresponding source-language representation may use:

```c
typedef struct __attribute__((packed)) {
    uint8_t h;
    int8_t  yoff;
    uint8_t w;
    int8_t  xoff;
    uint8_t image_offset[2];
    uint8_t xadv;
} avm_font_glyph_t;

typedef struct __attribute__((packed)) {
    uint8_t line_height;
    uint8_t glyph_first;
    uint8_t num_glyphs;
    uint8_t data[]; /* records followed by page-major images */
} avm_font_t;
```

#### 49.28.2. Selected text state

Runtime startup has no selected font and uses white-transparent mode:

```text
selected font: none
selected mode: 2
```

A zero selected `line_height` is the architectural no-font state. While no
font is selected, all four drawing services leave the framebuffer unchanged,
do not read or parse their string, format, or variadic arguments, and return
the input cursor unchanged.

`set_text_font` uses:

```text
q2[23:0] = program-space font pointer
q2[31:24] ignored
```

A null logical pointer deselects the font without reading program space. For a
nonnull pointer, the service reads the three-byte font header and replaces the
selected-font state. A header whose `line_height` is zero also selects the
no-font state. The caller must keep the complete selected font object readable
for every later draw that uses it. `set_text_font` preserves the complete
original `q2` container and every other general-purpose register, `CC`, and
`SP`.

`set_text_mode` uses:

```text
low8(r4) = mode
```

Bits `15:8` of `r4` are ignored. Accepted values are:

| Value | Name | Per-pixel effect for glyph bit `s` and original framebuffer bit `d` |
|---:|---|---|
| `0` | `AVM_TEXT_OVERWRITE` | result `s` |
| `2` | `AVM_TEXT_WHITE_TRANSPARENT` | result `d | s` |
| `3` | `AVM_TEXT_BLACK_TRANSPARENT` | result `d & !s` |

Any other low-byte value is ignored and leaves the selected mode unchanged.
The complete original `r4` bit pattern and all other architectural state are
preserved.

#### 49.28.3. Cursor and glyph rendering

All four drawing services take a signed 16-bit initial cursor:

```text
r4 = initial cursor x
r5 = initial baseline y
```

They return the final cursor in the same registers:

```text
r4 = final cursor x
r5 = final baseline y
```

The result therefore occupies `q2`, with x in bits `15:0` and baseline y in
bits `31:16`. Both result registers are complete definitions. All other
input-only registers and every unlisted general-purpose register are
preserved, as are `CC` and `SP`.

For an available ordinary glyph:

```text
glyphLeft = cursorX  + sign_extend(glyph.xoff)
glyphTop  = baselineY + sign_extend(glyph.yoff)
```

The bitmap occupies the half-open mathematical rectangle:

```text
glyphLeft <= px < glyphLeft + glyph.w
glyphTop  <= py < glyphTop  + glyph.h
```

It is clipped to the framebuffer rectangle:

```text
0 <= px < 128
0 <= py < 64
```

Pixels outside the framebuffer are ignored. Rendering never changes a pixel
outside the clipped glyph bitmap rectangle. Overwrite mode does not implicitly
clear the glyph's advance cell or the font's line-height cell.

After every available non-newline glyph, whether visible, empty, or completely
clipped:

```text
cursorX = low16(cursorX + glyph.xadv)
```

Only byte `0x0A` (`'\n'`) has control meaning:

```text
cursorX   = initialX
baselineY = low16(baselineY + line_height)
```

Every other emitted byte, including carriage return and a zero byte produced
by `%c`, undergoes ordinary glyph lookup. Raw-string terminating zero bytes
end their source and are not emitted. Cursor arithmetic is modulo `2^16`; the
resulting bit patterns are interpreted as signed coordinates for clipping.

#### 49.28.4. Raw text services

`draw_text` uses:

```text
r4 = initial x
r5 = initial baseline y
r6 = data-space NUL-terminated string
```

`draw_text_P` uses:

```text
r4 = initial x
r5 = initial baseline y
q3 = program-space NUL-terminated string
```

For `draw_text_P`, the logical string address is `q3[23:0]`, bits
`q3[31:24]` are ignored, and address advancement is modulo `2^24`.

The service consumes consecutive nonzero source bytes and renders them in
order. The terminating zero is read as the terminator but is not passed to
glyph lookup. The caller must supply a readable NUL-terminated string in the
specified address space. `draw_text` preserves `r6`; `draw_text_P` preserves
the complete original `q3` container.

#### 49.28.5. Formatted text services

`draw_textfv` uses:

```text
r4 = initial x
r5 = initial baseline y
r6 = data-space format pointer
r2 = va_list cursor
```

`draw_textfv_P` uses:

```text
r4 = initial x
r5 = initial baseline y
q3 = program-space format pointer
r2 = va_list cursor
```

For `draw_textfv_P`, the logical format address is `q3[23:0]`, bits
`q3[31:24]` are ignored, and format-address advancement is modulo `2^24`.
The architectural `r2` value is preserved; parsing advances only an internal
copy of the packed variadic cursor.

These services use exactly the accepted grammar, argument representation,
conversion semantics, and source/argument requirements from Sections 49.27.2
through 49.27.6. The destination-buffer, size, termination, and `restrict`
requirements that are specific to `vsnprintf` do not apply. Instead of writing
a bounded character buffer or returning an output count, each formatted byte is
passed directly to the glyph processor and the service returns the final
cursor. Consequently:

- there is no destination size, terminating output byte, or truncation;
- no 16-bit formatted-output count limit applies;
- formatter-generated spaces, string bytes, and conversion bytes are rendered
  in order;
- a `%c` argument whose low byte is zero is delivered to ordinary glyph lookup;
- source terminators for `%s` and `%S` are not emitted;
- `%n` stores the count reached so far, while a selected font with zero line
  height retains the existing early return and performs no `%n` store; and
- malformed format syntax stops processing at the malformed conversion and
  returns the cursor reached after all earlier emitted bytes. There is no
  separate error result, and earlier framebuffer writes remain in place.

`draw_textfv` preserves `r6` and `r2`. `draw_textfv_P` preserves `q3` and
`r2`.

#### 49.28.6. Memory effects and ordering

`set_text_font` conditionally reads the program-space header and defines hidden
selected-font state. `set_text_mode` defines hidden selected-mode state. These
state definitions MUST remain ordered relative to draws that may observe them.
A state-setting service MUST NOT be speculated, duplicated, or commoned in a
way that changes the selected state observed by a draw.

Every drawing service reads the hidden selected text state, glyph records and
images in program space, and its explicit source. The formatted services also
read the variadic area in data space and may indirectly read `%s` and `%S`
objects in either address space. Formatted drawing may also write through `%n`
destination pointers. Drawing reads and writes the fixed framebuffer range
`0x0500-0x08FF`; it does not update the physical display.

A drawing service MUST NOT be speculated or reordered across a selected-state
update that may affect it, or across an access that may alias the framebuffer.
It must remain ordered relative to writes that may change any explicit or
indirect string, format, variadic, font-record, or glyph-image byte it reads.
An implementation may eliminate or reorder a draw only when its cursor result,
framebuffer effects, source reads, and selected-state dependencies are all
proven unobservable under the ordinary nonvolatile memory rules.

The text services use nonreentrant call-lifetime runtime workspace. Recursive
or concurrent execution of a text or formatted-output service is unsupported.

### 49.29. Audio control

`SYS 0x38` (`D7 38`) takes its command in `low8(r7)`:

| Command | Operation | Additional inputs / result |
| ---: | --- | --- |
| 0 | Play music | `q2[23:0] = program pointer` to an End-terminated asset; `r6` unused |
| 1 | Play SFX | Same as play music |
| 2 | Stop music | None |
| 3 | Pause music | None |
| 4 | Resume music | None |
| 5 | Set shared output gain | `low8(r4) = 0..255`; 32=100%, default 128 |
| 6 | Enable output | None |
| 7 | Disable output and stop both streams | None |
| 8 | Stop SFX | None |
| 9 | Query status | `r4 = bit 0 playing, bit 1 paused, bit 2 SFX` |
| 10 | Direct SFX tone | `low8(r4) = channel`, `low8(r5) = MIDI note`, `low8(r6) = amplitude` |
| 11 | Shared gain compatibility alias | Same as command 5; also affects SFX/direct tones |
| 12 | Shared gain compatibility alias | Same as command 5; also affects music |
| 13 | Set synthesis rate | `low8(r4) = 0` (7812.5 Hz) or `1` (15625 Hz); other values ignored |
| 14 | Set music looping | `low8(r4) = 0` disables, nonzero enables; default disabled; persists across playback controls |
| 15 | Set global tonal low-pass | `low8(r4) = alpha`: 0 bypass (default), 1..255 coefficient; 128 mild, 64 medium, 32 strong |

All inputs and architectural flags are preserved except the status result.
Reserved commands have no command effect, but may service pending elapsed time.
Pointers retain the existing packed 24-bit program-space representation.
At End, music stops or rewinds according to command 14; SFX always stops.
Loop-setting changes preserve position, and enabling stopped music does not
restart it. Compiled streams contain no terminal Loop command.
Each channel retains its original 0..31 amplitude, or 255 for a stopped voice.
There is one shared output gain, default 128; commands 5/11/12 all set it.
Mixing and tonal filtering use biased bytes (128 means silence); four voices
fit in 4..252. Gain applies after filtering and noise addition. The hardware
multiply product is rounded, divided by 32, biased and saturated to PWM limits.
Gain changes preserve phases, filter history, ownership and stream timing.
Command 15 filters the unclipped sum of channels 0..2 before adding noise
channel 3. The level persists across playback controls. Startup, output restart,
and OFF-to-enabled transitions initialize the biased byte filter history to
silence; enabled-level and rate changes retain it. No asset-format change is
required. Stop and pause allow a brief filtered tonal decay while output runs.
Smaller nonzero alpha smooths more. The ISR updates byte history with one
subtract/multiply/add operation; half-rate coefficient conversion occurs in
foreground when alpha or the synthesis rate changes.
Playback is autonomous at normal interpreter stream-restart safe points and
idle wakeups. Timer interrupts synthesize only latched controls; they never
read FX assets or advance the event stream. Audio calls define hidden
playback state and observable speaker output and MUST NOT be removed,
speculated, duplicated, or reordered. See [audio.md](audio.md) for the terminated
asset format, channel priority, timer allocations, timing, and runtime API.

### 49.30. `send_display_command`

Encoding: `D7 39`.

Public runtime interface and fixed service-register assignment:

```c
void avm_send_display_command(uint8_t const *cmd, size_t n);
```

```text
r4 = data-space command-buffer pointer
r5 = unsigned 16-bit byte count
```

The service sends exactly `n` bytes from RAM to the configured display
controller with D/C low. The count includes command opcodes and all parameter
bytes, and may exceed 255. Transmission is complete before return; the caller
can immediately reuse the buffer. The buffer, framebuffer, and all other guest
RAM remain unmodified. When `n == 0`, no memory is accessed and no display
commands are sent; `cmd` may be null. Otherwise, `cmd` must name `n` readable
data-space bytes.

This is a low-level controller interface. Bytes are not validated or translated.
The caller is responsible for selecting commands appropriate to the configured
controller and maintaining or restoring settings required by `avm_display()`,
including addressing mode and column/page state. Display updates do not restore
arbitrary controller state. There is no program-memory `_P` variant.

The interpreter drains its speculative instruction fetch before borrowing the
shared SPI bus, waits for every command byte including the final byte, releases
display CS, restores data mode, and restarts the instruction stream. Every
general-purpose register (including both input registers), `CC`, and `SP` is
preserved. The service's externally observable I/O MUST NOT be removed,
duplicated, speculated, commoned, or reordered across another command stream or
display update. Conflicting command-buffer accesses must retain their ordering.

### 49.31. System configuration queries

| ID | Encoding | Public runtime interface | Complete `r4` result |
|---:|---|---|---|
| `0x3A` | `D7 3A` | `uint16_t avm_get_system_width(void)` | Logical visible width in pixels |
| `0x3B` | `D7 3B` | `uint16_t avm_get_system_height(void)` | Logical visible height in pixels |
| `0x3C` | `D7 3C` | `uint8_t avm_get_system_display_type(void)` | Zero-extended controller identifier |

These services have no arguments. They describe immutable interpreter
configuration, rather than detecting hardware or reading controller registers.
All current display configurations have logical dimensions `128 x 64` and use
the existing 1024-byte framebuffer. These dimensions describe visible pixels,
not the controller's internal RAM geometry, and do not change after raw commands.

The `<avm.h>` controller constants have stable numeric values:

| Constant | Value | Meaning |
|---|---:|---|
| `AVM_DISPLAY_UNKNOWN` | `0` | Other or unknown controller |
| `AVM_DISPLAY_SSD1306` | `1` | SSD1306 |
| `AVM_DISPLAY_SSD1309` | `2` | SSD1309 |
| `AVM_DISPLAY_SH1106` | `3` | SH1106 |

The interpreter reports the corresponding `AVM_DISPLAY_*` build selection,
including accepted `OLED_*` aliases. The default selection is SSD1306. The
public constants do not select the firmware's build configuration.

Each service defines the complete `r4`, preserves every other general-purpose
register, `CC`, and `SP`, and has no guest-memory or externally observable
effects. The compiler may eliminate, common, or speculate these queries.

---

# Part IX — LLVM and Clang Target Contract

## 50. Target identity

```text
target triple:    avm-unknown-arduboyfx
EM_AVM:          0x4156
ISA CPU name:    avm1
default tune CPU: avm-interpreter-32u4-v1
```

AVM defines no optional ISA subtarget features and no feature-dependent
ABI variants. `avm1` identifies the ISA and ABI.
`avm-interpreter-32u4-v1` identifies the measured optimization and scheduling
model for the current ATmega32U4 interpreter; it does not change instruction
semantics, object compatibility, or `runtimeVersion`.

The Clang driver MUST select `avm1` when `-mcpu` is absent and MUST select
`avm-interpreter-32u4-v1` whenever `-mtune` is absent, including when
`-mcpu=avm1` is supplied explicitly. An explicit supported `-mtune` overrides
the tuning model without changing the ISA CPU. Backend entry points that receive
IR without a tune attribute use the same default. Unknown CPU or tune names are
diagnosed. Measured instruction costs belong to the tuning model and are not
architectural timing guarantees.

## 51. LLVM address spaces

```text
address space 0 = 16-bit data space
address space 1 = 24-bit program space
```

Functions reside in address space one. Function pointers therefore use the
24-bit address-space-one representation.

Unqualified C data pointers, ordinary globals, string literals, and automatic
objects use address space zero. A `const` qualifier does not by itself move an
object to program space.

Program-resident data must be declared explicitly in address space one, using
Clang's generic `__attribute__((address_space(1)))` spelling or a target header
alias such as `__flash`. Dereferencing an address-space-one pointer lowers to
the corresponding native `LDP*` load. Stores through address-space-one pointers
are invalid and MUST be diagnosed.

## 52. LLVM data layout

```text
e-m:e-p:16:8-p1:24:8-i8:8-i16:8-i32:8-i64:8-f16:8-f32:8-n8:16-S8-P1-G0-A0
```

Meaning:

- Little-endian.
- Address-space-zero pointers are 16 bits.
- Address-space-one pointers are 24 bits.
- LLVM's program address space is address space one (`P1`), so functions and
  function pointers use the 24-bit representation.
- LLVM's default global and alloca address spaces are address space zero
  (`G0` and `A0`).
- Scalar ABI alignment is one byte.
- Native integer widths are 8 and 16 bits.
- Stack alignment is one byte.
- The `f16` entry defines IR layout only; it does not make `_Float16` a
  supported source-language ABI type.

## 53. LLVM register classes

Required physical register classes are:

```text
GPR16   = r0-r7
UpperGPR16 = r4-r7

GPR8    = low-byte subregisters of r0-r7
UpperGPR8 = low-byte subregisters of r4-r7

PTR16   = r0-r7
UpperPTR16 = r4-r7

GPR32   = q0-q3
UpperGPR32 = q2-q3
```

Class relationships:

```text
UpperGPR16 is a subclass of GPR16
UpperGPR8 is a subclass of GPR8
UpperPTR16 has the same members as UpperGPR16
UpperGPR32 is a subclass of GPR32
```

The required preferred allocation orders are:

```text
GPR16 / GPR8 / PTR16: r4, r5, r6, r7, r0, r1, r2, r3
GPR32:                 q2, q3, q0, q1
```

These orders prefer registers that admit compact encodings while retaining all
physical members in the general classes. `PTR16` contains every register that
may legally hold a data pointer. `UpperPTR16` is used only by final encodings
that require a pointer in `r4-r7`.

The 32-bit pair classes are:

```text
q0 = r0:r1
q1 = r2:r3
q2 = r4:r5
q3 = r6:r7
```

Each `qN` aliases both constituent 16-bit registers. `UpperGPR32` identifies pairs whose two constituent registers are upper registers.

Recommended subregister indices are:

```text
sub_lo16
sub_hi16
```

The byte classes alias only the low-byte subregisters of the corresponding 16-bit registers. They are not independently allocatable storage.

Instructions that define a zero-extended or sign-extended byte result define the complete `GPR16` destination. Instructions that modify only the low byte while preserving the high byte may use a `GPR8` definition.

Program and function pointers use the same physical members as `GPR32`.
Their logical value occupies bits `23:0`; bits `31:24` are machine-level
container padding and are not part of the LLVM `p1:24` value.

The backend SHOULD model these values through a semantic operand class or value
type named `PROGPTR`, backed by `GPR32`. A `PROGPTR` value does not imply that
the padding byte is zero. The backend SHOULD separately track or produce a
normalized form only where the ordinary ABI or an observing operation requires
bits `31:24 = 0`.

The unspecified padding exists only in the target register representation. It
MUST NOT be represented as an undefined, poison, or partially undefined LLVM
pointer value.

`CC`, `SP`, and `PC` are nonallocatable architectural state.

## 54. Type legalization

| LLVM type | Register representation | Legalization policy |
|---|---|---|
| `i1` | `CC` or materialized 16-bit zero/one | Custom |
| `i8` | Low-byte subregister or canonical `GPR16` | Legal for memory/subregister operations; arithmetic custom-promoted |
| `i16` | `GPR16` | Legal |
| `i24` | No general scalar class | Expand; used only as `p1:24` semantics |
| `i32` | `GPR32` | Legal |
| `i64` | Four `GPR16` values or stack | Expand/custom libcall |
| `f16` | No source-language ABI class | IR-layout compatibility only; expand or promote before selection |
| `f32` | `GPR32` | Legal; direct `FF` operations with helper expansion for unsupported operations |
| `f64` | Not an AVM ABI type | Unsupported; frontend maps `double` and `long double` to `f32` |
| `p0:16` | `PTR16` | Legal |
| `p1:24` | Logical 24-bit `PROGPTR` backed by `GPR32`; padding byte unspecified | Custom |

General `i8` arithmetic is promoted to `i16`, performed at 16-bit width, and truncated when an `i8` result is required.

General `i1` values are materialized as 16-bit zero or one. Compare-and-branch patterns should retain the value in `CC` without materialization when possible.

## 55. Operation legalization

| LLVM operation | `i8` | `i16` | `i32` | `i64` / notes |
|---|---|---|---|---|
| Constant, copy, phi | Legal/custom subregister | Legal | Legal | Expand |
| `ADD`, `SUB` | Promote to `i16`, truncate | Legal | Legal | Expand or helper |
| `MUL` | Custom byte/widening selection | Legal | Helper until direct ISA support | Helper |
| `UDIV`, `SDIV` | Promote to `i16`, select direct instruction, truncate | Legal direct `UDIV16` / `SDIV16` | Helper | Helper |
| `UREM`, `SREM` | Promote to `i16`, select direct instruction, truncate | Legal direct `UREM16` / `SREM16` | Helper | Helper |
| `AND`, `OR`, `XOR` | Promote/truncate | Legal | Split into two `i16` operations | Expand |
| `SHL`, `LSHR`, `ASHR` | Promote/truncate | Custom direct selection | Custom direct/sequence/helper | Helper |
| `ROTL`, `ROTR`, funnel shifts | Expand | Expand | Expand | Expand |
| `BSWAP` | No-op for `i8` | Legal | Split/custom | Expand |
| `CTPOP`, `CTLZ`, `CTTZ` | Expand/helper | Expand/helper | Expand/helper | Helper |
| Integer compare | Custom `CC` | Custom `CC` | Custom `CMP32` | Expand/helper |
| `SETCC` | Custom `CSET`, truncate as needed | Custom `CSET` | Custom compare plus `CSET` | Expand/helper |
| `SELECT` | Custom `CMOV` | Custom `CMOV` | Two word `CMOV` operations | Expand |
| Conditional branch | Custom compare plus branch | Custom | Custom `CMP32` plus branch | Expand/helper |
| AS0 load/store `i8/i16/i32` | Legal/custom addressing | Legal/custom addressing | Legal/custom addressing | Split/helper |
| Extending `i8` load to `i16` | Direct `LD8U`; signed loads use `LD8U` plus `SEXT8` | — | Load plus extension | — |
| Truncating store to `i8` | Direct byte store | Direct byte store | Direct byte store | Split |
| AS1 load | Custom `LDP*` | Custom `LDP*` | Custom `LDP*` | Split/helper |
| AS1 store | Invalid | Invalid | Invalid | Invalid |
| `PTRTOINT` / `INTTOPTR` AS0 | Legal bit-preserving `i16` conversion | — | — | — |
| `PTRTOINT` / `INTTOPTR` AS1 | Custom logical 24-bit conversion; wider integer results zero-extend | — | — | — |
| AS1 pointer comparison | Compare logical bits `23:0`; normalize or use a 24-bit-aware sequence | — | — | — |
| `ADDRSPACECAST` AS0↔AS1 | Unsupported | Unsupported | Unsupported | Must be explicit through integer conversion |
| Dynamic `alloca` | — | Expand through `GETSP` / `SUB` / `SETSP` | — | — |
| `STACKSAVE` / `STACKRESTORE` | — | Expand through `GETSP` / `SETSP` | — | — |
| `VAARG` | Custom packed-stack lowering | — | — | — |
| `BR_JT` / switch | Custom program-space jump table or branch tree | — | — | — |
| AS0-to-AS0 `MEMCPY` | Inline small constants; `SYS 0x0F` or helper otherwise | — | — | — |
| AS1-to-AS0 `MEMCPY` | Inline small constants with `LDP*` plus AS0 stores; `SYS 0x10` otherwise | — | — | — |
| `MEMSET` | Inline small constants; `SYS 0x11` or helper otherwise | — | — | — |
| `MEMMOVE` | Inline small constants; `SYS 0x12` or helper otherwise | — | — | — |
| `memcmp_P`, `strcmp_P`, `strlen_P` | Dedicated typed AVM intrinsic and `SYS 0x13-0x15` | — | — | Read-only AS0/AS1 effects as applicable |
| `strncpy_P`, `strncat_P` | Dedicated typed AVM intrinsic and `SYS 0x16-0x17` | — | — | AS1 read plus AS0 write; `strncat_P` also reads AS0 destination |
| `memcmp`, `strcmp`, `strlen` | Recognized libcall or dedicated AVM intrinsic and `SYS 0x18-0x1A` | — | — | Read-only AS0 effects |
| `strncpy`, `strncat` | Recognized libcall or dedicated AVM intrinsic and `SYS 0x1B-0x1C` | — | — | AS0 read/write effects |
| `display` | Dedicated AVM intrinsic and `SYS 0x1D` | — | — | Reads the fixed framebuffer, may clear it, and has externally observable display output |
| `draw_sprite_overwrite`, `draw_sprite_plus_mask`, `draw_sprite_self_masked`, `draw_sprite_erase` | Dedicated typed AVM intrinsics and `SYS 0x1E-0x21` | — | — | Read an explicit AS1 sprite and read/write the fixed framebuffer |
| `set_sprite`, `draw_overwrite`, `draw_plus_mask`, `draw_self_masked`, `draw_erase` | Dedicated typed AVM intrinsics and `SYS 0x22-0x26` | — | — | Select an AS1 sprite or draw from selected-sprite state into the fixed framebuffer |
| `draw_filled_rect_white`, `draw_filled_rect_black` | Dedicated typed AVM intrinsics and `SYS 0x27-0x28` | — | — | Read/write the fixed framebuffer |
| `vsnprintf`, `vsnprintf_P` | Dedicated typed AVM intrinsics and `SYS 0x2F-0x30` | — | — | Bounded AS0 write; AS0 and AS1 reads selected by the format |
| `debug_printfv_P` | Dedicated typed AVM intrinsic and `SYS 0x37` | — | — | AS0/AS1 reads selected by the format; `%n` AS0 writes; externally observable debug output |
| `set_text_font`, `set_text_mode`, `draw_text`, `draw_text_P`, `draw_textfv`, `draw_textfv_P` | Dedicated typed AVM intrinsics and `SYS 0x31-0x36` | — | — | Hidden selected-text state; AS0/AS1 source reads; fixed-framebuffer read/write effects |

The `FA` page provides variable and immediate 16-bit shifts restricted to the upper registers.
Immediate counts in the range `0-15` select `LSL16I`, `LSR16I`, or `ASR16I`.
Variable shifts mask the hardware count with `& 15`; selecting them is valid
when excess-count cases are already undefined or poison under LLVM semantics,
or when the backend has explicitly constrained the count. Constant shifts
outside `0-15` require normal LLVM legalization rather than truncating the
constant into the four-bit instruction field.

Program-pointer arithmetic is lowered as unsigned 24-bit arithmetic in
`GPR32`. The backend MUST NOT normalize every arithmetic result
unconditionally. It may select a full `ADD32` or `SUB32` when the low 24 result
bits have the required modulo-`2^24` value and leave bits `31:24` unspecified.

Normalization is required only before a use that observes the complete
container or at an ordinary ABI boundary. Required cases include:

- passing a computed program or function pointer in an ordinary call;
- returning a computed program or function pointer;
- `ptrtoint` to an integer wider than 24 bits;
- a full-width comparison unless a 24-bit-aware comparison is selected;
- any explicit operation that observes the complete `GPR32` bit pattern.

Normalization is not required before any instruction or system service,
because every architectural program-pointer consumer uses only the logical low
24 bits. It is also unnecessary before another program-pointer arithmetic
operation or a packed three-byte pointer store. Ordinary ABI boundaries and
operations that explicitly observe a complete `GPR32` value retain the
normalization requirements listed above.

The `EC` family directly implements all four `i16` division and remainder
operations. Wider integer division and remainder continue to use helpers.
The `FF` page directly implements the binary32 operations listed in Section
35.1; unsupported floating operations continue to use helpers.

### 55.1. Floating-point legalization and selection

The backend directly selects `FADD`, `FSUB`, `FMUL`, `FDIV`, `FNEG`, `FABS`,
integer conversions and `FCMP` for matching `f32` operations. Math
intrinsics, including square root, rounding, number-preferred min/max and
transcendentals, lower to ordinary calls into `libavm.a`. Legacy
`llvm.avm.*f` math intrinsics use the same calls. Float/integer bitcasts copy
the shared 32-bit register pair without numerical conversion.

An arbitrary floating compare plus `select` MUST NOT be folded to a min/max
call unless its NaN and signed-zero behavior is equivalent or made
unobservable by fast-math flags.

`llvm.is.fpclass` lowers to native 16-bit integer tests of the binary32
exponent, fraction, quiet bit, and sign. Finite and normal predicates use only
the high word; fraction tests include the low word. Every class-mask
combination, including empty and all-classes masks, is supported. `FCMP` supplies
ordered and unordered predicates without modifying architectural `CC`.

Constrained binary32 addition, subtraction, multiplication, division, square
root, comparisons, and 16-/32-bit integer conversions lower to existing
floating-point operations. The C99 environment fixes dynamic rounding
to nearest-even and has no observable exception state. See the
[backend crash regression](fenv-backend-crash.md).

Physical `GPR32` copies select `MOV32`. Upper-pair-to-upper-pair copies expand
to two compact `MOV` instructions; all other pair copies use `F2 60-6B`.

## 56. Runtime helper ABI

Runtime helpers use the ordinary AVM calling convention.

Pure arithmetic helpers:

- Preserve `r0-r3` and `SP`.
- May clobber `r4-r7` and `CC`.
- Have no data-memory side effects.
- Are nonthrowing and return normally for defined inputs.

The ISA defines deterministic results for division by zero and signed
`INT_MIN / -1`, as specified in Section 22.4. LLVM IR division and remainder
operations nevertheless retain LLVM's undefined or poison semantics for those
inputs. The backend may therefore select the direct instructions without
inserting guards; the deterministic edge results remain observable to assembly
programs and other producers whose semantics permit those inputs.

### 56.1. Integer division and remainder helpers

Direct `i16` division and remainder use the `EC` instructions. The following
16-bit helper names are reserved compatibility entry points and MAY be supplied
by a runtime for previously generated objects, but new instruction selection
SHOULD NOT call them:

```c
uint16_t __avm_udivhi3(uint16_t, uint16_t);
int16_t  __avm_divhi3(int16_t, int16_t);
uint16_t __avm_umodhi3(uint16_t, uint16_t);
int16_t  __avm_modhi3(int16_t, int16_t);
```

Wide integer division and remainder continue to use helpers:

```c
uint32_t __avm_udivsi3(uint32_t, uint32_t);
int32_t  __avm_divsi3(int32_t, int32_t);
uint32_t __avm_umodsi3(uint32_t, uint32_t);
int32_t  __avm_modsi3(int32_t, int32_t);

uint64_t __avm_udivdi3(uint64_t, uint64_t);
int64_t  __avm_divdi3(int64_t, int64_t);
uint64_t __avm_umoddi3(uint64_t, uint64_t);
int64_t  __avm_moddi3(int64_t, int64_t);
```

### 56.2. Wide arithmetic and shift helpers

```c
uint32_t __avm_mulsi3(uint32_t, uint32_t);

uint64_t __avm_adddi3(uint64_t, uint64_t);
uint64_t __avm_subdi3(uint64_t, uint64_t);
uint64_t __avm_muldi3(uint64_t, uint64_t);

uint32_t __avm_ashlsi3(uint32_t, uint16_t);
uint32_t __avm_lshrsi3(uint32_t, uint16_t);
int32_t  __avm_ashrsi3(int32_t, uint16_t);

uint64_t __avm_ashldi3(uint64_t, uint16_t);
uint64_t __avm_lshrdi3(uint64_t, uint16_t);
int64_t  __avm_ashrdi3(int64_t, uint16_t);
```

The backend may use inline instruction sequences instead of these helpers whenever profitable.

### 56.3. Floating-point compatibility helpers

The direct `FF` instructions are preferred for supported `f32` operations.
The following symbols remain stable compatibility and fallback entry points:

```c
float __avm_addsf3(float, float);
float __avm_subsf3(float, float);
float __avm_mulsf3(float, float);
float __avm_divsf3(float, float);

float __avm_floathisf(int16_t);
float __avm_floatunshisf(uint16_t);
float __avm_floatsisf(int32_t);
float __avm_floatunsisf(uint32_t);

int16_t  __avm_fixsfhi(float);
uint16_t __avm_fixunssfhi(float);
int32_t  __avm_fixsfsi(float);
uint32_t __avm_fixunssfsi(float);

int16_t __avm_cmpsf2(float, float);
```

`__avm_cmpsf2` uses the same four result values as `FCMP`. New instruction
selection SHOULD use the direct instructions when their semantics match and
MAY use these helpers for compatibility or unsupported strict operations.

### 56.4. Memory helpers

```c
typedef const void __attribute__((address_space(1))) *avm_progmem_cptr;

void *__avm_memcpy(void *dst, const void *src, uint16_t size);
void *__avm_memmove(void *dst, const void *src, uint16_t size);
void *__avm_memset(void *dst, int16_t byte_value, uint16_t size);

void *__avm_memcpy_P(
    void *dst,
    avm_progmem_cptr src,
    uint16_t size);

int      __avm_memcmp_P(const void *lhs, avm_progmem_cptr rhs, uint16_t n);
int      __avm_strcmp_P(const char *lhs, avm_progmem_cptr rhs);
uint16_t __avm_strlen_P(avm_progmem_cptr src);
char    *__avm_strncpy_P(char *dst, avm_progmem_cptr src, uint16_t n);
char    *__avm_strncat_P(char *dst, avm_progmem_cptr src, uint16_t n);

int      __avm_memcmp(const void *lhs, const void *rhs, uint16_t n);
int      __avm_strcmp(const char *lhs, const char *rhs);
uint16_t __avm_strlen(const char *src);
char    *__avm_strncpy(char *dst, const char *src, uint16_t n);
char    *__avm_strncat(char *dst, const char *src, uint16_t n);
```

Pointer-returning copy and concatenation helpers return the original `dst`.
The comparison helpers return the values defined in Sections 49.10, 49.11,
49.15, and 49.16. All helpers have the precise C memory effects of their
corresponding service definitions.

Clang SHOULD provide the target builtin:

```c
void *__builtin_avm_memcpy_p(
    void *dst,
    avm_progmem_cptr src,
    uint16_t size);
```


Clang SHOULD also provide direct target builtins for the comparison and string
services:

```c
int      __builtin_avm_memcmp_p(const void *lhs, avm_progmem_cptr rhs, uint16_t n);
int      __builtin_avm_strcmp_p(const char *lhs, avm_progmem_cptr rhs);
uint16_t __builtin_avm_strlen_p(avm_progmem_cptr src);
char    *__builtin_avm_strncpy_p(char *dst, avm_progmem_cptr src, uint16_t n);
char    *__builtin_avm_strncat_p(char *dst, avm_progmem_cptr src, uint16_t n);

int      __avm_memcmp(const void *lhs, const void *rhs, uint16_t n);
int      __avm_strcmp(const char *lhs, const char *rhs);
uint16_t __avm_strlen(const char *src);
char    *__avm_strncpy(char *dst, const char *src, uint16_t n);
char    *__avm_strncat(char *dst, const char *src, uint16_t n);
```

The `_p` builtins retain conventional source-language argument order. Clang
lowers all ten interfaces to the dedicated typed AVM intrinsics from Section
59. Direct program-memory builtins need not normalize program-pointer operands
before machine selection. Runtime headers MAY expose the conventional `_P`
spellings as function-like macros while retaining addressable out-of-line
wrappers.

The builtin retains the conventional source-language argument order
`(dst, src, size)`. Clang lowers it to an ordinary cross-address-space LLVM
memory copy:

```llvm
call void @llvm.memcpy.p0.p1.i16(
    ptr %dst,
    ptr addrspace(1) %src,
    i16 %size,
    i1 false)
```

The LLVM intrinsic returns `void`; the builtin expression's result is the
original evaluated `dst` value. Each argument is evaluated exactly once using
the source language's ordinary call-argument rules. No
`llvm.avm.memcpy.p` target intrinsic is used.

The backend lowers an AS0-destination, AS1-source nonvolatile `llvm.memcpy` to
one of:

1. An inline sequence of `LDP*` loads and AS0 stores for profitable constant
   sizes.
2. A semantic `SYS_MEMCPY_P` machine pseudo for dynamic or larger copies.

After physical-register assignment, `SYS_MEMCPY_P` has:

```text
use/def r4 = dst
use     q3 = src
use     r5 = size
encoding   = SYS 0x10
```

The `r4` input and definition are tied. The pseudo carries the AS1-read and
AS0-write memory effects of the original `llvm.memcpy` and has no ordinary
call-preserved register mask.

An ordinary function call to `__avm_memcpy_P` or `memcpy_P` uses the normal AVM
calling convention. It remains available as an out-of-line fallback and for
address-taking. Such a wrapper performs the required register shuffle before
issuing `SYS 0x10`. A target header MAY expose ordinary calls through a
function-like macro:

```c
#define memcpy_P(dst, src, size)     __builtin_avm_memcpy_p((dst), (src), (size))
```

Because the macro is function-like, `&memcpy_P` continues to name the
out-of-line function rather than invoking the builtin macro. The compiler MAY
also recognize direct calls to the out-of-line symbol and replace them with the
same generic `llvm.memcpy` representation when interposition and other
language-level rules permit it.


The AS0 `memset` service has the dedicated target intrinsic:

```llvm
declare ptr @llvm.avm.memset(ptr %dst, i16 %val, i16 %size)
```

The intrinsic returns the original `dst` pointer. Only `low8(%val)` determines
the byte written; the high byte is ignored by the memory operation. The backend
also recognizes an ordinary nonvolatile generic LLVM memset:

```llvm
call void @llvm.memset.p0.i16(
    ptr %dst,
    i8 %val,
    i16 %size,
    i1 false)
```

For generic `llvm.memset`, the backend zero-extends the `i8` fill value to the
16-bit service operand. It lowers AS0 memset operations to one of:

1. An inline sequence of AS0 stores for profitable constant sizes.
2. A semantic `SYS_MEMSET` machine pseudo for dynamic or larger fills.

After physical-register assignment, `SYS_MEMSET` has:

```text
use/def r4 = dst
use     r5 = val
use     r6 = size
encoding   = SYS 0x11
```

The `r4` input and definition are tied. The pseudo writes AS0 memory, reads no
memory, and has no ordinary call-preserved register mask. An ordinary function
call to `__avm_memset` or `memset` uses the normal AVM calling convention, which
already assigns `dst`, `val`, and `size` to `r4`, `r5`, and `r6`. The compiler
MAY recognize direct calls to those symbols and replace them with
`llvm.avm.memset` or generic `llvm.memset` when interposition and other
language-level rules permit it.

The AS0 `memmove` service has the dedicated target intrinsic:

```llvm
declare ptr @llvm.avm.memmove(ptr %dst, ptr %src, i16 %size)
```

The intrinsic returns the original `dst` pointer and has ordinary overlapping
AS0 `memmove` effects. The backend also recognizes an ordinary nonvolatile
generic LLVM memmove:

```llvm
call void @llvm.memmove.p0.p0.i16(
    ptr %dst,
    ptr %src,
    i16 %size,
    i1 false)
```

It lowers an AS0 memmove to one of:

1. An overlap-correct inline sequence for profitable constant sizes.
2. A semantic `SYS_MEMMOVE` machine pseudo for dynamic or larger moves.

After physical-register assignment, `SYS_MEMMOVE` has:

```text
use/def r4 = dst
use     r5 = src
use     r6 = size
encoding   = SYS 0x12
```

The `r4` input and definition are tied. The pseudo reads and writes AS0 memory,
preserves the overlap semantics of the originating operation, and has no
ordinary call-preserved register mask. An ordinary function call to
`__avm_memmove` or `memmove` uses the normal AVM calling convention, which
already assigns `dst`, `src`, and `size` to `r4`, `r5`, and `r6`. The compiler
MAY recognize direct calls to those symbols and replace them with
`llvm.avm.memmove` or generic `llvm.memmove` when interposition and other
language-level rules permit it.

### 56.4.1. Formatted-output helpers

The target runtime provides:

```c
int __avm_vsnprintf(
    char *restrict dst,
    size_t size,
    char const *restrict format,
    va_list ap);

int __avm_vsnprintf_P(
    char *restrict dst,
    size_t size,
    char const __attribute__((address_space(1))) *restrict format,
    va_list ap);

int __avm_debug_printfv_P(
    char const __attribute__((address_space(1))) *restrict format,
    va_list ap);
```

Clang SHOULD provide corresponding target builtins:

```c
int __builtin_avm_vsnprintf(
    char *dst, size_t size, char const *format, va_list ap);
int __builtin_avm_vsnprintf_p(
    char *dst, size_t size,
    char const __attribute__((address_space(1))) *format,
    va_list ap);
int __builtin_avm_debug_printfv_p(
    char const __attribute__((address_space(1))) *format,
    va_list ap);
```

The source-language argument order is `(dst, size, format, ap)` for the buffer
services and `(format, ap)` for `debug_printfv_P`. Direct builtin lowering uses
the typed intrinsics from Section 59. Runtime headers MAY expose `vsnprintf`,
`vsnprintf_P`, and `debug_printfv_P` as function-like macros that call the
target builtins while retaining addressable out-of-line wrappers.

Under the ordinary calling convention, `__avm_vsnprintf` receives `dst`,
`size`, `format`, and `ap` in `r4`, `r5`, `r6`, and `r7`; its wrapper copies
`ap` to the service's fixed `r2` input. `__avm_vsnprintf_P` receives `dst` and
`size` in `r4` and `r5`, the normalized ordinary-ABI program format in `q3`,
and `ap` as the first stack argument at callee entry. Its wrapper loads that
16-bit stack argument into `r2`. Under the ordinary calling convention,
`__avm_debug_printfv_P` receives its normalized program format in `q2` and
`ap` in `r6`; its wrapper moves the logical program pointer to `q3` and the
cursor to `r2`. These wrapper-entry rules do not change the fixed SYS interfaces
in Section 49.27.

The builtin format checker, when enabled, MUST implement the exact grammar from
Section 49.27. It must interpret `%S` as a packed address-space-one character
pointer and `%P` as a packed address-space-one pointer value. A generic host
`printf` checker that treats `%S` as a wide-string conversion or does not know
`%P` MUST NOT be applied without target-specific adjustment.

### 56.5. Display and drawing helpers

The target runtime provides:

```c
void __avm_display(bool clear);
```

Clang SHOULD provide the corresponding target builtin:

```c
void __builtin_avm_display(bool clear);
```

The helper and builtin lower to the typed display intrinsic from Section 59.
The source-language `bool` argument is represented canonically as zero or one.
Machine selection assigns it to `r4` and emits `SYS 0x1D`.

The operation reads the fixed framebuffer range `0x0500-0x08FF`, may write
zeros to that range when `clear` is true, and always has externally observable
display output. It is not an ordinary function call after lowering and carries
no call-preserved register mask.

The display command and configuration interfaces also have recognized target
builtins, exposed by inline public wrappers without the leading underscores:

```c
void __avm_send_display_command(uint8_t const *cmd, size_t n);
uint16_t __avm_get_system_width(void);
uint16_t __avm_get_system_height(void);
uint8_t __avm_get_system_display_type(void);
```

The command builtin lowers to `llvm.avm.send.display.command(ptr,i16)`, with
AS0 argument-memory reads and inaccessible-memory read/write effects for
observable controller I/O. A read-only IR memory effect alone would incorrectly
permit dead-call removal. Its machine
descriptor reads `n` bytes through `cmd`, uses preserved inputs `r4` and `r5`,
and defines no architectural registers. The three queries lower to their
`llvm.avm.get.system.*()` intrinsics as pure, speculatable `i16` results.
Clang truncates the display-type result to the public `uint8_t` type. Their
machine descriptors define only `r4` and have no memory effects. See Sections
49.30 and 49.31 for the contracts and fixed service IDs.

The target runtime and Clang target provide explicit-pointer sprite interfaces:

```c
void __avm_draw_sprite_overwrite(
    int16_t x, int16_t y, avm_progmem_cptr sprite, uint16_t frame);
void __avm_draw_sprite_plus_mask(
    int16_t x, int16_t y, avm_progmem_cptr sprite, uint16_t frame);
void __avm_draw_sprite_self_masked(
    int16_t x, int16_t y, avm_progmem_cptr sprite, uint16_t frame);
void __avm_draw_sprite_erase(
    int16_t x, int16_t y, avm_progmem_cptr sprite, uint16_t frame);
```

Machine selection assigns `x` to `r4`, `y` to `r5`, `sprite` to `q1`, and
`frame` to `r6`, then emits the corresponding service in `SYS 0x1E-0x21`.
The sprite pointer's padding byte need not be normalized because the services
consume only `q1[23:0]`.

The runtime and Clang target also provide selected-sprite interfaces:

```c
void __avm_set_sprite(avm_progmem_cptr sprite);
void __avm_draw_overwrite(int16_t x, int16_t y, uint16_t frame);
void __avm_draw_plus_mask(int16_t x, int16_t y, uint16_t frame);
void __avm_draw_self_masked(int16_t x, int16_t y, uint16_t frame);
void __avm_draw_erase(int16_t x, int16_t y, uint16_t frame);
```

Machine selection assigns the `set_sprite` pointer to `q2` and emits
`SYS 0x22`. Its padding byte need not be normalized because the service consumes
only `q2[23:0]`. The cached-pointer drawing interfaces assign `x`, `y`, and
`frame` to `r4`, `r5`, and `r6`, then emit `SYS 0x23-0x26`.

Clang SHOULD provide corresponding `__builtin_avm_*` interfaces for all nine
operations. All are represented by typed sprite intrinsics from Section 59.
They are not ordinary function calls after lowering and carry no call-preserved
register mask. Explicit-pointer draws read their AS1 sprite object. `set_sprite`
reads its AS1 header and updates selected-sprite state. Cached-pointer draws read
that state and the selected AS1 frame. All drawing operations read and write the
fixed framebuffer range `0x0500-0x08FF`.

The target runtime and Clang target also provide:

```c
void __avm_draw_filled_rect_white(
    int16_t x, int16_t y, uint8_t width, uint8_t height);
void __avm_draw_filled_rect_black(
    int16_t x, int16_t y, uint8_t width, uint8_t height);

void __builtin_avm_draw_filled_rect_white(
    int16_t x, int16_t y, uint8_t width, uint8_t height);
void __builtin_avm_draw_filled_rect_black(
    int16_t x, int16_t y, uint8_t width, uint8_t height);
```

Clang lowers these interfaces to the two typed filled-rectangle intrinsics from
Section 59. Machine selection assigns `x` to `r4`, `y` to `r5`, `width` to
`low8(r6)`, and `height` to `low8(r7)`, then emits `SYS 0x27` or `SYS 0x28`.
The services ignore the high bytes of `r6` and `r7`.

Each operation reads and writes the fixed framebuffer range
`0x0500-0x08FF`. It is not an ordinary function call after lowering and carries
no call-preserved register mask.


The target runtime and Clang target also provide text-state and text-drawing
interfaces:

```c
typedef struct __attribute__((packed)) {
    uint8_t h;
    int8_t  yoff;
    uint8_t w;
    int8_t  xoff;
    uint8_t image_offset[2];
    uint8_t xadv;
} avm_font_glyph_t;

typedef struct __attribute__((packed)) {
    uint8_t line_height;
    uint8_t glyph_first;
    uint8_t num_glyphs;
    uint8_t data[];
} avm_font_t;

typedef enum {
    AVM_TEXT_OVERWRITE = 0,
    AVM_TEXT_WHITE_TRANSPARENT = 2,
    AVM_TEXT_BLACK_TRANSPARENT = 3,
} avm_text_mode_t;

typedef struct {
    int16_t x;
    int16_t baseline_y;
} avm_text_cursor_t;

void __avm_set_text_font(
    avm_font_t const __attribute__((address_space(1))) *font);
void __avm_set_text_mode(uint8_t mode);

uint32_t __avm_draw_text(
    int16_t x, int16_t baseline_y, char const *string);
uint32_t __avm_draw_text_P(
    int16_t x, int16_t baseline_y,
    char const __attribute__((address_space(1))) *string);
uint32_t __avm_draw_textfv(
    int16_t x, int16_t baseline_y, char const *format, va_list ap);
uint32_t __avm_draw_textfv_P(
    int16_t x, int16_t baseline_y,
    char const __attribute__((address_space(1))) *format, va_list ap);
```

The four drawing helpers return the packed machine result:

```text
bits 15:0  final x
bits 31:16 final baseline y
```

Runtime headers SHOULD expose wrappers returning `avm_text_cursor_t`. Variadic
`avm_draw_textf` and `avm_draw_textf_P` wrappers construct a `va_list` and use
the corresponding `draw_textfv` interface.

Clang SHOULD provide corresponding `__builtin_avm_*` interfaces for all six
operations. They lower to the typed text intrinsics in Section 59 rather than
to ordinary calls. Machine selection assigns the fixed registers from Section
49.28 and emits `SYS 0x31-0x36`. The `i8` text-mode operand is zero-extended
into `r4`; the service observes only its low byte. Program-pointer padding is
not normalized solely for a text service because each program-space input
consumes only its logical low 24 bits.

The compiler representation must retain hidden selected-font and selected-mode
dependencies. Drawing operations also retain their explicit and indirect
source reads, program-space font reads, and fixed framebuffer effects. They
carry no ordinary call-preserved register mask after lowering.

## 57. Atomic and volatile policy

AVM is single-threaded.

The VM interface exposes:

- No threads.
- No user-visible asynchronous signal handlers.
- No user-visible interrupts capable of observing intermediate guest state.

### 57.1. Atomic operations

Atomic operations are accepted for source compatibility.

Because no concurrent AVM observer exists:

- Atomic loads and stores lower to ordinary loads and stores.
- Atomic read-modify-write operations lower to ordinary load/compute/store sequences.
- `cmpxchg` lowers to one ordinary compare and conditional store sequence.
- No machine fence instruction is required.
- LLVM ordering constraints remain compiler-ordering constraints.
- An atomic fence emits no instruction but acts as a compiler scheduling barrier.

The target reports these sizes as always lock-free at any data-space alignment:

```text
1 byte
2 bytes
4 bytes
```

Eight-byte atomics are not reported as lock-free and are expanded through runtime support when required.

Atomic operations on platform-defined or externally observed memory do not gain additional hardware-atomic guarantees from this ABI.

Thread-local storage, `-pthread`, and cross-thread synchronization are unsupported.

### 57.2. Volatile accesses

A volatile access:

- Uses the source-requested width.
- Is not removed.
- Is not merged with another volatile access.
- Is not widened or narrowed.
- Preserves LLVM-required ordering relative to other volatile operations.
- May target platform-defined data-space addresses.

Volatile does not imply atomicity and does not create a thread-synchronization operation.

## 58. General instruction selection policy

The backend should:

1. Use semantic machine pseudos before physical register allocation whenever
   the final opcode depends on the assigned registers. Expand those pseudos
   after allocation.
2. Use the exact upper-first allocation orders in Section 53. Prefer upper
   registers for arguments, pointers, and short-lived values when doing so does
   not increase spill cost.
3. Select compact scalar ALU, move, compare, and immediate forms whenever all
   final operands satisfy the upper-register constraints; otherwise select the
   applicable full or cold form.
4. Use a general AS0 memory pseudo before physical register assignment and
   choose the final ordinary-indirect form mechanically:
   - upper pointer and upper data register: compact one-byte form;
   - upper pointer and lower data register: the applicable dense `F3`/`F5` form;
   - lower pointer: the general `F0` form.
5. Choose postincrement AS0 forms mechanically:
   - upper pointer: the applicable `F6`/`F7` form;
   - lower pointer: the general `F0` postincrement form.
6. Choose stack-relative forms mechanically:
   - upper data register and offset `0-15`: compact stack form;
   - otherwise, for offsets `0-255`: the `F0` stack form.
7. Select a native postincrement `LDP*` when an AS1 load is followed by adding
   the access width to the same pointer and the destination obeys the ISA's
   nonoverlap rule. Other AS1 dereferences select the corresponding ordinary
   `LDP*` instruction. All `LDP*` address operands consume only the low 24 bits;
   do not normalize a temporary pointer solely for an `LDP*` use.
8. Select `i16` `UDIV`, `UREM`, `SDIV`, and `SREM` directly to the two-address
   `EC` instructions. The destination is both the original dividend use and the
   result definition; the divisor source is preserved.
9. Prefer `UpperGPR32` for values likely to decompose into compact word
   operations. Select `MOV32` after physical assignment: two compact `MOV`s for
   upper-pair copies and the `F2` form otherwise.
10. Use `GPR32` for pair and binary32 instructions accepting every `qN`.
11. Select direct `FF` operations only when their NaN, signed-zero, rounding,
    and exception semantics match.
12. Represent address-space-one values as logical 24-bit `PROGPTR` values in
    `GPR32`. Treat bits `31:24` as nonsemantic padding, insert normalization only
    at observing uses or ordinary ABI boundaries, and model `CC` definitions
    and uses explicitly.
13. Place frequently accessed stack objects at low offsets and diagnose
    statically provable single-function stack use above 256 bytes.
14. Stack-usage metadata is optional. This contract does not standardize its
    section name, record layout, or semantics; no backend implementation may
    invent a mandatory object-format contract for it.

## 59. LLVM system-service representations

The scalar, floating-point, memory, comparison, string, formatted-output,
display, sprite, rectangle, and text services have dedicated typed target
intrinsics:

```llvm
declare void  @llvm.avm.debug.putc(i8 %value)
declare void  @llvm.avm.debug.break()
declare i16   @llvm.avm.millis()
declare i32   @llvm.avm.millis32()
declare i8    @llvm.avm.buttons()
declare void  @llvm.avm.idle()
declare i16   @llvm.avm.generate.random.seed()
declare void  @llvm.avm.save()
declare i1    @llvm.avm.load()
declare i1    @llvm.avm.save.exists()

declare float @llvm.avm.sinf(float %x)
declare float @llvm.avm.cosf(float %x)
declare float @llvm.avm.atan2f(float %y, float %x)
declare float @llvm.avm.tanf(float %x)
declare float @llvm.avm.expf(float %x)
declare float @llvm.avm.logf(float %x)
declare float @llvm.avm.log2f(float %x)
declare float @llvm.avm.log10f(float %x)
declare float @llvm.avm.powf(float %x, float %y)
declare float @llvm.avm.hypotf(float %x, float %y)
declare float @llvm.avm.fmodf(float %x, float %y)

declare void @llvm.avm.display(i1 %clear)

declare void @llvm.avm.draw.sprite.overwrite(
    i16 %x, i16 %y, ptr addrspace(1) %sprite, i16 %frame)
declare void @llvm.avm.draw.sprite.plus.mask(
    i16 %x, i16 %y, ptr addrspace(1) %sprite, i16 %frame)
declare void @llvm.avm.draw.sprite.self.masked(
    i16 %x, i16 %y, ptr addrspace(1) %sprite, i16 %frame)
declare void @llvm.avm.draw.sprite.erase(
    i16 %x, i16 %y, ptr addrspace(1) %sprite, i16 %frame)

declare void @llvm.avm.set.sprite(ptr addrspace(1) %sprite)
declare void @llvm.avm.draw.overwrite(i16 %x, i16 %y, i16 %frame)
declare void @llvm.avm.draw.plus.mask(i16 %x, i16 %y, i16 %frame)
declare void @llvm.avm.draw.self.masked(i16 %x, i16 %y, i16 %frame)
declare void @llvm.avm.draw.erase(i16 %x, i16 %y, i16 %frame)

declare void @llvm.avm.draw.filled.rect.white(
    i16 %x, i16 %y, i8 %width, i8 %height)
declare void @llvm.avm.draw.filled.rect.black(
    i16 %x, i16 %y, i8 %width, i8 %height)

declare ptr @llvm.avm.memcpy(ptr %dst, ptr %src, i16 %n)
declare ptr @llvm.avm.memset(ptr %dst, i16 %val, i16 %n)
declare ptr @llvm.avm.memmove(ptr %dst, ptr %src, i16 %n)

declare i16 @llvm.avm.memcmp.p(ptr %lhs, ptr addrspace(1) %rhs, i16 %n)
declare i16 @llvm.avm.strcmp.p(ptr %lhs, ptr addrspace(1) %rhs)
declare i16 @llvm.avm.strlen.p(ptr addrspace(1) %src)
declare ptr @llvm.avm.strncpy.p(ptr %dst, ptr addrspace(1) %src, i16 %n)
declare ptr @llvm.avm.strncat.p(ptr %dst, ptr addrspace(1) %src, i16 %n)

declare i16 @llvm.avm.memcmp(ptr %lhs, ptr %rhs, i16 %n)
declare i16 @llvm.avm.strcmp(ptr %lhs, ptr %rhs)
declare i16 @llvm.avm.strlen(ptr %src)
declare ptr @llvm.avm.strncpy(ptr %dst, ptr %src, i16 %n)
declare ptr @llvm.avm.strncat(ptr %dst, ptr %src, i16 %n)

declare i16 @llvm.avm.vsnprintf(
    ptr %dst, i16 %size, ptr %format, ptr %ap)
declare i16 @llvm.avm.vsnprintf.p(
    ptr %dst, i16 %size, ptr addrspace(1) %format, ptr %ap)
declare i16 @llvm.avm.debug.printfv.p(
    ptr addrspace(1) %format, ptr %ap)

declare void @llvm.avm.set.text.font(ptr addrspace(1) %font)
declare void @llvm.avm.set.text.mode(i8 %mode)
declare i32 @llvm.avm.draw.text(
    i16 %x, i16 %baseline_y, ptr %string)
declare i32 @llvm.avm.draw.text.p(
    i16 %x, i16 %baseline_y, ptr addrspace(1) %string)
declare i32 @llvm.avm.draw.textfv(
    i16 %x, i16 %baseline_y, ptr %format, ptr %ap)
declare i32 @llvm.avm.draw.textfv.p(
    i16 %x, i16 %baseline_y, ptr addrspace(1) %format, ptr %ap)
```

AS1-to-AS0 `memcpy_P` is represented by the generic overloaded LLVM memory
intrinsic with destination address space zero and source address space one:

```llvm
call void @llvm.memcpy.p0.p1.i16(
    ptr %dst,
    ptr addrspace(1) %src,
    i16 %n,
    i1 false)
```

A generic AVM service-number intrinsic and an
`llvm.avm.memcpy.p` target intrinsic SHOULD NOT be public LLVM interfaces.
The `.p` suffix on the comparison, string, formatted-output, and text
intrinsics is part of the target intrinsic name and denotes an
address-space-one format or source. Those operations have no corresponding
generic LLVM intrinsic.

### 59.1. Compiler-representation-to-machine lowering

| LLVM representation | Machine encoding | Fixed physical uses | Fixed physical definitions |
|---|---|---|---|
| `llvm.avm.debug.putc(i8)` | `SYS 0x00` | `low8(r4)` | None |
| `llvm.avm.debug.break()` | `SYS 0x01` | None | None |
| `llvm.avm.millis()` | `SYS 0x02` | None | `r4` |
| `llvm.avm.millis32()` | `SYS 0x03` | None | `q2` |
| `llvm.avm.sinf(...)` | `CALL sinf` | C ABI arguments | C ABI result/clobbers |
| `llvm.avm.cosf(...)` | `CALL cosf` | C ABI arguments | C ABI result/clobbers |
| `llvm.avm.atan2f(...)` | `CALL atan2f` | C ABI arguments | C ABI result/clobbers |
| `llvm.avm.tanf(...)` | `CALL tanf` | C ABI arguments | C ABI result/clobbers |
| `llvm.avm.expf(...)` | `CALL expf` | C ABI arguments | C ABI result/clobbers |
| `llvm.avm.logf(...)` | `CALL logf` | C ABI arguments | C ABI result/clobbers |
| `llvm.avm.log2f(...)` | `CALL log2f` | C ABI arguments | C ABI result/clobbers |
| `llvm.avm.log10f(...)` | `CALL log10f` | C ABI arguments | C ABI result/clobbers |
| `llvm.avm.powf(...)` | `CALL powf` | C ABI arguments | C ABI result/clobbers |
| `llvm.avm.hypotf(...)` | `CALL hypotf` | C ABI arguments | C ABI result/clobbers |
| `llvm.avm.fmodf(...)` | `CALL fmodf` | C ABI arguments | C ABI result/clobbers |
| `llvm.avm.memcpy(ptr,ptr,i16)` | `SYS 0x0F` | `r4 = dst`, `r5 = src`, `r6 = n` | tied `r4 = dst` |
| AS0-destination, AS1-source `llvm.memcpy` | `SYS 0x10` through `SYS_MEMCPY_P` | `r4 = dst`, `q3 = src`, `r5 = n` | tied `r4 = dst` |
| `llvm.avm.memset(ptr,i16,i16)` or eligible AS0 `llvm.memset` | `SYS 0x11` through `SYS_MEMSET` | `r4 = dst`, `r5 = val`, `r6 = n` | tied `r4 = dst` |
| `llvm.avm.memmove(ptr,ptr,i16)` or eligible AS0 `llvm.memmove` | `SYS 0x12` through `SYS_MEMMOVE` | `r4 = dst`, `r5 = src`, `r6 = n` | tied `r4 = dst` |
| `llvm.avm.memcmp.p(ptr,p1,i16)` | `SYS 0x13` through `SYS_MEMCMP_P` | `r4 = lhs`, `q3 = rhs`, `r5 = n` | tied `r4 = result` |
| `llvm.avm.strcmp.p(ptr,p1)` | `SYS 0x14` through `SYS_STRCMP_P` | `r4 = lhs`, `q3 = rhs` | tied `r4 = result` |
| `llvm.avm.strlen.p(p1)` | `SYS 0x15` through `SYS_STRLEN_P` | `q3 = src` | `r4 = length` |
| `llvm.avm.strncpy.p(ptr,p1,i16)` | `SYS 0x16` through `SYS_STRNCPY_P` | `r4 = dst`, `q3 = src`, `r5 = n` | tied `r4 = dst` |
| `llvm.avm.strncat.p(ptr,p1,i16)` | `SYS 0x17` through `SYS_STRNCAT_P` | `r4 = dst`, `q3 = src`, `r5 = n` | tied `r4 = dst` |
| `llvm.avm.memcmp(ptr,ptr,i16)` | `SYS 0x18` through `SYS_MEMCMP` | `r4 = lhs`, `r5 = rhs`, `r6 = n` | tied `r4 = result` |
| `llvm.avm.strcmp(ptr,ptr)` | `SYS 0x19` through `SYS_STRCMP` | `r4 = lhs`, `r5 = rhs` | tied `r4 = result` |
| `llvm.avm.strlen(ptr)` | `SYS 0x1A` through `SYS_STRLEN` | `r4 = src` | tied `r4 = length` |
| `llvm.avm.strncpy(ptr,ptr,i16)` | `SYS 0x1B` through `SYS_STRNCPY` | `r4 = dst`, `r5 = src`, `r6 = n` | tied `r4 = dst` |
| `llvm.avm.strncat(ptr,ptr,i16)` | `SYS 0x1C` through `SYS_STRNCAT` | `r4 = dst`, `r5 = src`, `r6 = n` | tied `r4 = dst` |
| `llvm.avm.display(i1)` | `SYS 0x1D` through `SYS_DISPLAY` | `r4 = zero_extend(clear)` | None |
| `llvm.avm.draw.sprite.overwrite(i16,i16,p1,i16)` | `SYS 0x1E` through `SYS_DRAW_SPRITE_OVERWRITE` | `r4 = x`, `r5 = y`, `q1 = sprite`, `r6 = frame` | None |
| `llvm.avm.draw.sprite.plus.mask(i16,i16,p1,i16)` | `SYS 0x1F` through `SYS_DRAW_SPRITE_PLUS_MASK` | `r4 = x`, `r5 = y`, `q1 = sprite`, `r6 = frame` | None |
| `llvm.avm.draw.sprite.self.masked(i16,i16,p1,i16)` | `SYS 0x20` through `SYS_DRAW_SPRITE_SELF_MASKED` | `r4 = x`, `r5 = y`, `q1 = sprite`, `r6 = frame` | None |
| `llvm.avm.draw.sprite.erase(i16,i16,p1,i16)` | `SYS 0x21` through `SYS_DRAW_SPRITE_ERASE` | `r4 = x`, `r5 = y`, `q1 = sprite`, `r6 = frame` | None |
| `llvm.avm.set.sprite(p1)` | `SYS 0x22` through `SYS_SET_SPRITE` | `q2 = sprite` | None |
| `llvm.avm.draw.overwrite(i16,i16,i16)` | `SYS 0x23` through `SYS_DRAW_OVERWRITE` | `r4 = x`, `r5 = y`, `r6 = frame` | None |
| `llvm.avm.draw.plus.mask(i16,i16,i16)` | `SYS 0x24` through `SYS_DRAW_PLUS_MASK` | `r4 = x`, `r5 = y`, `r6 = frame` | None |
| `llvm.avm.draw.self.masked(i16,i16,i16)` | `SYS 0x25` through `SYS_DRAW_SELF_MASKED` | `r4 = x`, `r5 = y`, `r6 = frame` | None |
| `llvm.avm.draw.erase(i16,i16,i16)` | `SYS 0x26` through `SYS_DRAW_ERASE` | `r4 = x`, `r5 = y`, `r6 = frame` | None |
| `llvm.avm.draw.filled.rect.white(i16,i16,i8,i8)` | `SYS 0x27` through `SYS_DRAW_FILLED_RECT_WHITE` | `r4 = x`, `r5 = y`, `low8(r6) = width`, `low8(r7) = height` | None |
| `llvm.avm.draw.filled.rect.black(i16,i16,i8,i8)` | `SYS 0x28` through `SYS_DRAW_FILLED_RECT_BLACK` | `r4 = x`, `r5 = y`, `low8(r6) = width`, `low8(r7) = height` | None |
| `llvm.avm.buttons()` | `SYS 0x29` through `SYS_BUTTONS` | None | `r4 = zero-extended mask` |
| `llvm.avm.idle()` | `SYS 0x2A` through `SYS_IDLE` | None | None |
| `llvm.avm.generate.random.seed()` | `SYS 0x2B` through `SYS_GENERATE_RANDOM_SEED` | None | `r4` |
| `llvm.avm.save()` | `SYS 0x2C` through `SYS_SAVE` | None | None |
| `llvm.avm.load()` | `SYS 0x2D` through `SYS_LOAD` | None | `r4 = canonical Boolean` |
| `llvm.avm.save.exists()` | `SYS 0x2E` through `SYS_SAVE_EXISTS` | None | `r4 = canonical Boolean` |
| `llvm.avm.vsnprintf(ptr,i16,ptr,ptr)` | `SYS 0x2F` through `SYS_VSNPRINTF` | `r4 = dst`, `r5 = size`, `r6 = format`, `r2 = ap` | tied `r4 = signed result` |
| `llvm.avm.vsnprintf.p(ptr,i16,p1,ptr)` | `SYS 0x30` through `SYS_VSNPRINTF_P` | `r4 = dst`, `r5 = size`, `q3 = format`, `r2 = ap` | tied `r4 = signed result` |
| `llvm.avm.set.text.font(p1)` | `SYS 0x31` through `SYS_SET_TEXT_FONT` | `q2 = font` | None |
| `llvm.avm.set.text.mode(i8)` | `SYS 0x32` through `SYS_SET_TEXT_MODE` | `low8(r4) = mode` | None |
| `llvm.avm.draw.text(i16,i16,ptr)` | `SYS 0x33` through `SYS_DRAW_TEXT` | tied `r4 = x`, tied `r5 = baseline y`, `r6 = string` | tied `q2 = final cursor` |
| `llvm.avm.draw.text.p(i16,i16,p1)` | `SYS 0x34` through `SYS_DRAW_TEXT_P` | tied `r4 = x`, tied `r5 = baseline y`, `q3 = string` | tied `q2 = final cursor` |
| `llvm.avm.draw.textfv(i16,i16,ptr,ptr)` | `SYS 0x35` through `SYS_DRAW_TEXTFV` | tied `r4 = x`, tied `r5 = baseline y`, `r6 = format`, `r2 = ap` | tied `q2 = final cursor` |
| `llvm.avm.draw.textfv.p(i16,i16,p1,ptr)` | `SYS 0x36` through `SYS_DRAW_TEXTFV_P` | tied `r4 = x`, tied `r5 = baseline y`, `q3 = format`, `r2 = ap` | tied `q2 = final cursor` |
| `llvm.avm.debug.printfv(ptr,ptr)` | `SYS 0x3D` through `SYS_DEBUG_PRINTFV_PSEUDO` | `r6 = format`, `r2 = ap` | `r4 = signed result` |
| `llvm.avm.debug.printfv.p(p1,ptr)` | `SYS 0x37` through `SYS_DEBUG_PRINTFV_P` | `q3 = format`, `r2 = ap` | `r4 = signed result` |
| `llvm.avm.send.display.command(ptr,i16)` | `SYS 0x39` through `SYS_SEND_DISPLAY_COMMAND_PSEUDO` | `r4 = cmd`, `r5 = n` | None |
| `llvm.avm.get.system.width()` | `SYS 0x3A` through `SYS_GET_SYSTEM_WIDTH_PSEUDO` | None | `r4 = width` |
| `llvm.avm.get.system.height()` | `SYS 0x3B` through `SYS_GET_SYSTEM_HEIGHT_PSEUDO` | None | `r4 = height` |
| `llvm.avm.get.system.display.type()` | `SYS 0x3C` through `SYS_GET_SYSTEM_DISPLAY_TYPE_PSEUDO` | None | `r4 = zero-extended type` |

The SYS instructions and their machine pseudos carry no call-preserved
register mask. Exact physical uses and definitions are modeled directly, and
input-only registers remain live across them. Math calls carry the ordinary
C ABI call-preserved mask and may clobber `q3` and `CC`.

For `SYS_MEMCPY_P`, `r4` is a tied input/definition containing `dst`; `q3` and
`r5` are input-only and are preserved by the service. The source address is
`q3[23:0]`; `q3[31:24]` is ignored, so no normalization is required solely for
this pseudo. The pseudo retains the AS1-read and AS0-write memory operands,
aliasing information, volatility, and ordering constraints of the generic
`llvm.memcpy`.

For `SYS_MEMSET`, `r4` is a tied input/definition containing `dst`; `r5` and
`r6` are input-only and are preserved by the service. Only `low8(r5)` affects
memory. The pseudo retains the AS0 destination memory operand, aliasing
information, volatility, and ordering constraints of the originating memset
operation.

For `SYS_MEMMOVE`, `r4` is a tied input/definition containing `dst`; `r5` and
`r6` are input-only and are preserved by the service. The pseudo retains both
AS0 memory operands, their aliasing relationship, the possibility of overlap,
the transfer size, volatility, and ordering constraints of the originating
memmove operation.


`SYS_VSNPRINTF` and `SYS_VSNPRINTF_P` have a tied `r4` input and result.
Their `r5` size and `r2` variadic cursor inputs are preserved. `SYS_VSNPRINTF`
uses an input-only `r6` data-space format pointer; `SYS_VSNPRINTF_P` uses an
input-only `q3` program-space format pointer and consumes only `q3[23:0]`, so
selection MUST NOT normalize the pointer solely for this service.

Both pseudos carry a bounded address-space-zero write through `dst`, an
address-space-zero read through `ap`, and conservative indirect reads from both
address spaces because `%s` and `%S` obtain their pointers from the variadic
area. `SYS_VSNPRINTF` also carries its explicit address-space-zero format read;
`SYS_VSNPRINTF_P` carries an explicit address-space-one format read. They MUST
NOT be marked `argmemonly`, because the indirectly obtained string pointers are
not intrinsic pointer operands. They have no ordinary call-preserved register
mask.

`SYS_DEBUG_PRINTFV_P` defines `r4` and has input-only, preserved uses of `q3`
and `r2`. The format address is `q3[23:0]`; `q3[31:24]` is ignored, so selection
MUST NOT normalize the pointer solely for this service. Its pseudo carries an
explicit address-space-one format read, an address-space-zero read through
`ap`, conservative indirect reads from both address spaces, indirect AS0 `%n`
writes, and an unmodeled
externally observable debug-output side effect. It MUST NOT be marked
`argmemonly` and has no ordinary call-preserved register mask.

`SYS_SET_TEXT_FONT` has an input-only fixed use of `q2`, consumes only
`q2[23:0]`, and defines hidden selected-font state. A nonnull font operand
carries an address-space-one header read. `SYS_SET_TEXT_MODE` has an input-only
fixed use of `r4`, observes only `low8(r4)`, and defines hidden selected-mode
state. The backend zero-extends the intrinsic's `i8` mode into the complete
physical `r4` use. Both pseudos have no architectural register definitions and
preserve their input registers.

Each text-drawing pseudo has a tied `q2` coordinate input and final-cursor
result. In the tied input, `r4` is initial x and `r5` is initial baseline y; in
the result they contain final x and final baseline y. `SYS_DRAW_TEXT` has an
input-only `r6` data-space string pointer. `SYS_DRAW_TEXT_P` has an input-only
`q3` program-space string pointer. `SYS_DRAW_TEXTFV` has input-only `r6` format
and `r2` variadic-cursor uses. `SYS_DRAW_TEXTFV_P` has input-only `q3` format
and `r2` variadic-cursor uses. Program pointers consume only their logical low
24 bits, so selection MUST NOT normalize them solely for these services.

The draw pseudos have hidden uses of both selected-font and selected-mode state.
They carry a conservative address-space-one read for the selected font records
and images and conservative address-space-zero read/write effects for the
complete framebuffer. Raw draws additionally carry the explicit string read.
Formatted draws carry the same direct and indirect reads as the corresponding
formatted-output service but no destination-buffer write. None is an ordinary
call or carries a call-preserved register mask.

The four explicit-pointer sprite pseudos have input-only fixed uses of `r4`,
`r5`, `q1`, and `r6`, and no architectural register definitions. Their sprite
address is `q1[23:0]`; `q1[31:24]` is ignored, so selection MUST NOT normalize
the pointer solely for an explicit sprite service. Each pseudo carries an
address-space-one read for the header and selected frame and conservative
address-space-zero read and write effects for the complete 1,024-byte
framebuffer. More precise references MAY be used when the sprite dimensions,
frame, and clipping are statically known.

`SYS_SET_SPRITE` has an input-only fixed use of `q2` and no architectural
register definitions. It consumes `q2[23:0]`, ignores `q2[31:24]`, reads the
two-byte AS1 sprite header, and defines hidden selected-sprite state. The four
cached-pointer drawing pseudos have input-only fixed uses of `r4`, `r5`, and
`r6`, no architectural register definitions, and a hidden use of that selected-
sprite state. They carry a conservative AS1 read for the selected frame and
conservative AS0 read and write effects for the complete framebuffer. The
selected-state definition and uses MUST be represented by a chain, token, or
other unmodeled dependency that prevents illegal reordering of `set_sprite`
and cached-pointer draws.

The two filled-rectangle pseudos have input-only fixed uses of `r4-r7` and no
architectural register definitions. Only `low8(r6)` and `low8(r7)` determine
the width and height, but the complete physical registers are preserved across
the service and therefore remain live. Each pseudo carries conservative
address-space-zero read and write effects for the complete 1,024-byte
framebuffer. More precise framebuffer references MAY be used when the clipped
rectangle is statically known.

The five program-string pseudos consume only `q3[23:0]`; `q3[31:24]` is ignored.
Selection MUST NOT normalize the pointer solely for these services. Their
machine memory operands describe AS1 reads and any AS0 reads or writes listed
in Section 49. `SYS_STRNCPY_P` writes at most `n` destination bytes;
`SYS_STRNCAT_P` has an unbounded destination read and writes the append region
and terminator.

The AS0 comparison and string pseudos use the fixed registers shown in the
table. Result-producing services define the complete `r4`. `SYS_MEMCMP` and
`SYS_STRCMP` replace the original left pointer with the comparison result;
`SYS_STRLEN` replaces the source pointer with the length. `SYS_STRNCPY` and
`SYS_STRNCAT` preserve the original destination bit pattern through the tied
`r4` result.

`SYS_DISPLAY` is not an ordinary call. It has an input-only `r4` use and no
architectural register definition. The backend zero-extends the `i1` clear
operand into `r4`. The machine pseudo carries:

- an address-space-zero read of exactly 1,024 bytes beginning at `0x0500`;
- a conservative address-space-zero write of the same range, because a
  nonconstant true `clear` operand clears the framebuffer; and
- an unmodeled externally observable display side effect.

When `clear` is a compile-time false constant, the backend MAY omit the
framebuffer write effect, but it MUST retain the read and the externally
observable side effect. The pseudo has no call-preserved register mask and
preserves every architectural register.

Generic LLVM math intrinsics and recognized libcalls MAY lower directly to
these services when their required semantics match the service definitions in
Section 49.5. Recognized AS0-to-AS0 `memcpy` operations MAY lower to service
`0x0F`. AS0-destination, AS1-source nonvolatile `llvm.memcpy` operations MAY
lower to service `0x10` when their size and legality make the service preferable
to an inline `LDP*`/store sequence. Recognized nonvolatile AS0 `memset`
operations MAY lower to service `0x11` when preferable to an inline store
sequence. Recognized nonvolatile AS0 `memmove` operations MAY lower to service
`0x12` when preferable to an overlap-correct inline sequence. Direct calls or
target builtins for the comparison and string functions lower to services
`0x13-0x1C`. The target display builtin lowers to service `0x1D`. The four explicit-pointer target sprite builtins lower to services
`0x1E-0x21`; `set_sprite` and the four cached-pointer draw builtins lower to
services `0x22-0x26`. The two filled-rectangle
builtins lower to services `0x27-0x28`. Platform and persistence builtins lower
to services `0x29-0x2E`. The formatted-output builtins lower to services
`0x2F-0x30`, the text-state and text-drawing builtins lower to services
`0x31-0x36`, and `debug_printfv_P` lowers to service `0x37`. A compiler MAY
recognize
ordinary C library calls and replace them with the corresponding target
intrinsic when interposition, object-size, and language rules permit it.

### 59.2. Optimization and scheduling

`debug_putc`, `debug_printfv_P`, `debug_break`, `millis`, and `millis32`
retain the observable or evolving-state constraints specified in their service
definitions. The debug-output services retain an ordering chain or unmodeled
side effect; `debug_printfv_P` additionally carries its explicit and indirect
AS0/AS1 reads. `debug_break` is a scheduling barrier at its source position.

`buttons` and `generate_random_seed` read evolving hardware state and retain a
chain or unmodeled side effect. `idle` is an observable scheduling and power-
management point. None of these services may be speculated, duplicated, or
common-subexpression eliminated.

`save`, `load`, and `save_exists` are mutually ordered externally observable
persistent-storage operations. `save` reads the saved-prefix range, `load` may
write it, and `save_exists` has no AVM-memory effect. None may be removed,
duplicated, speculated, or reordered relative to another persistence service.
They also remain ordered relative to AVM memory operations that may alias the
saved-prefix range when applicable.

The floating-point math intrinsics are deterministic, have no observable memory effects,
set neither `errno` nor floating-point exception state, and have no observable
side effects. They MAY be common-subexpression eliminated, duplicated,
speculated, or reordered when ordinary data dependencies and the requested
floating-point semantics permit it. This IR contract does not apply to ordinary
`math.h` runtime calls: those entry points report domain and range errors through
`errno` (`math_errhandling == MATH_ERRNO`). Optimizations that discard those
memory effects require an errno-independent math contract.

The memory services have their precise address-space effects:

- `memcpy` reads address space zero and writes address space zero.
- `memcpy_P` reads address space one and writes address space zero.
- `memset` writes address space zero and reads no memory.
- `memmove` reads address space zero and writes address space zero, and its
  source and destination may overlap.
- `memcmp_P` and `strcmp_P` read address spaces zero and one.
- `strlen_P` reads address space one.
- `strncpy_P` reads address space one and writes address space zero.
- `strncat_P` reads address spaces zero and one and writes address space zero.
- `memcmp`, `strcmp`, and `strlen` read address space zero.
- `strncpy` reads and writes address space zero through nonoverlapping source
  and destination objects.
- `strncat` reads and writes address space zero through nonoverlapping source
  and destination objects.
- Each explicit-pointer sprite draw reads its address-space-one sprite object
  and reads and writes the fixed address-space-zero framebuffer range
  `0x0500-0x08FF`.
- `set_sprite` reads a two-byte address-space-one header and updates hidden
  selected-sprite state without accessing the framebuffer.
- Each cached-pointer sprite draw reads the hidden selected-sprite state and the
  selected address-space-one frame, then reads and writes the fixed framebuffer
  range `0x0500-0x08FF`.
- Each filled-rectangle service reads and writes the fixed address-space-zero
  framebuffer range `0x0500-0x08FF`.
- `vsnprintf` reads its AS0 format, the AS0 variadic area, and any AS0 or AS1
  strings selected by the format, and writes its bounded AS0 destination.
- `vsnprintf_P` has the same indirect effects and additionally reads its AS1
  format.
- `debug_printfv_P` reads its AS1 format, the AS0 variadic area, and any AS0 or
  AS1 strings selected by the format, and produces externally observable debug
  output without writing a destination buffer; `%n` may write indirect AS0 RAM.
- `debug_printfv` has the same effects with an AS0 format.
- `set_text_font` conditionally reads an AS1 font header and defines hidden
  selected-font state.
- `set_text_mode` defines hidden selected-mode state.
- `draw_text` reads an AS0 string, hidden text state, and selected AS1 font data,
  then reads and writes the fixed framebuffer.
- `draw_text_P` reads an AS1 string, hidden text state, and selected AS1 font
  data, then reads and writes the fixed framebuffer.
- `draw_textfv` and `draw_textfv_P` have the formatter's explicit and indirect
  AS0/AS1 reads, read hidden text state and selected AS1 font data, and read and
  write the fixed framebuffer; they perform no destination-buffer write.

They MUST NOT be speculated or reordered across accesses that may alias a
written destination or, for a copy or move, the source. They MAY be eliminated,
combined, or otherwise transformed only when the ordinary legality rules for
the corresponding nonvolatile `memcpy`, `memset`, or `memmove` operation
permit it. A `memmove` may be converted to `memcpy` only when overlap is proven
impossible. Read-only comparison and length calls may be eliminated when their
results are dead, but they may not be moved across stores that can modify any
byte they inspect. String-copy and concatenation calls may be transformed only
when their NUL-termination, padding, bound, and aliasing semantics are
preserved. Formatted-output calls must remain ordered relative to stores that may change
their format, variadic arguments, or referenced strings and, for buffer
services, relative to accesses that may observe destination writes.
Both debug formatters additionally remain ordered with other observable debug
output and MUST NOT be removed, duplicated, or speculated. Buffer-service
results and writes may be eliminated only when ordinary nonvolatile memory-
effect and undefined-behavior rules permit it.


Text-state operations and text draws carry an additional hidden-state ordering
chain. `set_text_font` and `set_text_mode` MUST NOT move across a draw that may
observe the changed selection. A draw MUST remain ordered relative to stores
that may change its explicit or indirect strings, format, variadic area, font
records, or glyph images, and relative to accesses that may alias the
framebuffer. A text draw may be removed only when both its cursor result and all
framebuffer writes are dead and its remaining reads and hidden-state uses are
unobservable under the ordinary nonvolatile rules.

`display` reads the complete framebuffer and may clear it. It also performs an
externally observable hardware update regardless of the `clear` value. It MUST
NOT be removed, duplicated, speculated, common-subexpression eliminated, or
reordered across another display operation. It MUST remain ordered relative to
any access that may alias the framebuffer range `0x0500-0x08FF`. Operations on
provably disjoint memory may be reordered only when doing so preserves all
other observable-service ordering constraints.

A sprite drawing service has no physical-display side effect, but its
framebuffer writes are observable. It MUST NOT be speculated or reordered
across an access that may alias `0x0500-0x08FF`. It MAY be removed only when
all of its framebuffer writes are proven dead, and MAY be reordered relative
to provably disjoint memory only when the AS1 sprite read and all other
dependencies remain valid. `set_sprite` and cached-pointer draws additionally
carry a hidden selected-state dependence. `set_sprite` MUST NOT be duplicated,
commoned, or reordered across another `set_sprite` or a cached-pointer draw.
A cached-pointer draw MUST NOT move across a `set_sprite` that may determine its
selection. `set_sprite` MAY be removed only when its selected-state update and
header read are both proven unobservable before replacement or function exit.

A filled-rectangle service likewise has no physical-display side effect, but
its framebuffer writes are observable. It MUST NOT be speculated or reordered
across an access that may alias `0x0500-0x08FF`. It MAY be removed only when
all affected framebuffer writes are proven dead, and MAY be reordered relative
to provably disjoint memory when all other dependencies remain valid.

### 59.3. Source-language interfaces

Recommended target-specific C interfaces:

```c
void     __avm_debug_putc(unsigned char value);
void     __avm_debug_break(void);
uint16_t __avm_millis(void);
uint32_t __avm_millis32(void);
uint8_t  __avm_buttons(void);
void     __avm_idle(void);
uint16_t __avm_generate_random_seed(void);
void     __avm_save(void);
bool     __avm_load(void);
bool     __avm_save_exists(void);

int __avm_vsnprintf(
    char *restrict dst, size_t size,
    char const *restrict format, va_list ap);
int __avm_vsnprintf_P(
    char *restrict dst, size_t size,
    char const __attribute__((address_space(1))) *restrict format,
    va_list ap);
int __avm_debug_printfv_P(
    char const __attribute__((address_space(1))) *restrict format,
    va_list ap);

typedef struct __attribute__((packed)) {
    uint8_t h;
    int8_t  yoff;
    uint8_t w;
    int8_t  xoff;
    uint8_t image_offset[2];
    uint8_t xadv;
} avm_font_glyph_t;

typedef struct __attribute__((packed)) {
    uint8_t line_height;
    uint8_t glyph_first;
    uint8_t num_glyphs;
    uint8_t data[];
} avm_font_t;

typedef enum {
    AVM_TEXT_OVERWRITE = 0,
    AVM_TEXT_WHITE_TRANSPARENT = 2,
    AVM_TEXT_BLACK_TRANSPARENT = 3,
} avm_text_mode_t;

typedef struct {
    int16_t x;
    int16_t baseline_y;
} avm_text_cursor_t;

void __avm_set_text_font(
    avm_font_t const __attribute__((address_space(1))) *font);
void __avm_set_text_mode(uint8_t mode);
uint32_t __avm_draw_text(
    int16_t x, int16_t baseline_y, char const *string);
uint32_t __avm_draw_text_P(
    int16_t x, int16_t baseline_y,
    char const __attribute__((address_space(1))) *string);
uint32_t __avm_draw_textfv(
    int16_t x, int16_t baseline_y, char const *format, va_list ap);
uint32_t __avm_draw_textfv_P(
    int16_t x, int16_t baseline_y,
    char const __attribute__((address_space(1))) *format, va_list ap);

float __avm_sinf(float x);
float __avm_cosf(float x);
float __avm_atan2f(float y, float x);
float __avm_tanf(float x);
float __avm_expf(float x);
float __avm_logf(float x);
float __avm_log2f(float x);
float __avm_log10f(float x);
float __avm_powf(float x, float y);
float __avm_hypotf(float x, float y);
float __avm_fmodf(float x, float y);

void __avm_display(bool clear);

void __avm_draw_sprite_overwrite(
    int16_t x, int16_t y, avm_progmem_cptr sprite, uint16_t frame);
void __avm_draw_sprite_plus_mask(
    int16_t x, int16_t y, avm_progmem_cptr sprite, uint16_t frame);
void __avm_draw_sprite_self_masked(
    int16_t x, int16_t y, avm_progmem_cptr sprite, uint16_t frame);
void __avm_draw_sprite_erase(
    int16_t x, int16_t y, avm_progmem_cptr sprite, uint16_t frame);

void __avm_set_sprite(avm_progmem_cptr sprite);
void __avm_draw_overwrite(int16_t x, int16_t y, uint16_t frame);
void __avm_draw_plus_mask(int16_t x, int16_t y, uint16_t frame);
void __avm_draw_self_masked(int16_t x, int16_t y, uint16_t frame);
void __avm_draw_erase(int16_t x, int16_t y, uint16_t frame);

void __avm_draw_filled_rect_white(
    int16_t x, int16_t y, uint8_t width, uint8_t height);
void __avm_draw_filled_rect_black(
    int16_t x, int16_t y, uint8_t width, uint8_t height);

int      __avm_memcmp_P(const void *lhs, avm_progmem_cptr rhs, uint16_t n);
int      __avm_strcmp_P(const char *lhs, avm_progmem_cptr rhs);
uint16_t __avm_strlen_P(avm_progmem_cptr src);
char    *__avm_strncpy_P(char *dst, avm_progmem_cptr src, uint16_t n);
char    *__avm_strncat_P(char *dst, avm_progmem_cptr src, uint16_t n);

int      __avm_memcmp(const void *lhs, const void *rhs, uint16_t n);
int      __avm_strcmp(const char *lhs, const char *rhs);
uint16_t __avm_strlen(const char *src);
char    *__avm_strncpy(char *dst, const char *src, uint16_t n);
char    *__avm_strncat(char *dst, const char *src, uint16_t n);
```

Clang builtins or runtime wrappers lower these interfaces to the target
intrinsics. The target math library supplies the standard C float math names. The
compatibility math builtins and target intrinsics lower to these ordinary
functions rather than SYS instructions.

`memcpy_P` and `__builtin_avm_memcpy_p` use the conventional source signature
specified in Section 56.4. Clang lowers the builtin to generic
AS0-destination, AS1-source `llvm.memcpy`, returns the original `dst` expression
value, and leaves selection of inline code versus `SYS 0x10` to the AVM
backend.

The standard C `memset` interface and `__avm_memset` use the signature from
Section 56.4. Clang may emit generic `llvm.memset`; the AVM optimizer or backend
may instead use `llvm.avm.memset` when retaining a pointer result is useful.
Both representations preserve the ordinary C rule that the low eight bits of
`val` are repeated and leave selection of inline stores versus `SYS 0x11` to
the backend.

The standard C `memmove` interface and `__avm_memmove` use the signature from
Section 56.4. Clang may emit generic `llvm.memmove`; the AVM optimizer or
backend may instead use `llvm.avm.memmove` when retaining a pointer result is
useful. Both representations preserve overlapping-range semantics and leave
selection of an overlap-correct inline sequence versus `SYS 0x12` to the
backend.


The target comparison and string builtins lower directly to the typed
intrinsics in Section 59. The conventional `_P` spellings may be exposed as
function-like macros or recognized direct builtins; address-taking continues
to use out-of-line runtime wrappers. Standard AS0 names may remain ordinary
Clang library builtins and be recognized during optimization, while target
headers use the `__avm_*` forms when direct service selection is required.

The target builtin spellings `__builtin_avm_vsnprintf` and
`__builtin_avm_vsnprintf_p`, together with the target aliases
`__avm_vsnprintf` and `__avm_vsnprintf_P`, lower to `llvm.avm.vsnprintf` and
`llvm.avm.vsnprintf.p`, respectively. The backend assigns `dst`, `size`,
`format`, and `ap` to the fixed registers listed in Section 59.1 and selects
`SYS 0x2F` or `SYS 0x30`. The program-format operand is not normalized solely
for `SYS 0x30`. Address-taking uses the out-of-line runtime functions. Inline
`snprintf` and `snprintf_P` wrappers may construct a `va_list` and call the
corresponding `vsnprintf` interface; they inherit the format language in
Section 49.27.

`__builtin_avm_debug_printfv_p` and `__avm_debug_printfv_P` lower to
`llvm.avm.debug.printfv.p`. The backend assigns the program format to `q3`, the
cursor to `r2`, selects `SYS 0x37`, and receives the signed result in `r4`.
The program-format operand is not normalized solely for this service.
Address-taking uses the out-of-line runtime function.

Target format diagnostics must understand the AVM `%S` and `%P` extensions and
the supported integer lengths, including `ll`. Applying an unmodified host
`printf` format attribute is not conforming when it diagnoses `%S` as a wide
string or fails to recognize `%P`.

`__avm_display` and `__builtin_avm_display` lower to
`llvm.avm.display(i1)`. The backend materializes the canonical boolean in `r4`
and selects `SYS 0x1D`. The operation retains its framebuffer memory effects
and externally observable display side effect.

The four `__avm_draw_sprite_*` interfaces lower to their corresponding
`llvm.avm.draw.sprite.*` intrinsics. The backend assigns `x`, `y`, `sprite`, and
`frame` to `r4`, `r5`, `q1`, and `r6`, respectively, and selects
`SYS 0x1E-0x21`. These operations retain the explicit AS1 sprite read and fixed
framebuffer read/write effects described in Sections 49.21 and 59.2.

`__avm_set_sprite` lowers to `llvm.avm.set.sprite`; the backend assigns the
pointer to `q2` and selects `SYS 0x22`. The four shorter `__avm_draw_*`
interfaces lower to `llvm.avm.draw.overwrite`, `llvm.avm.draw.plus.mask`,
`llvm.avm.draw.self.masked`, and `llvm.avm.draw.erase`. The backend assigns
`x`, `y`, and `frame` to `r4`, `r5`, and `r6`, respectively, and selects
`SYS 0x23-0x26`. These operations retain the hidden selected-sprite ordering,
AS1 reads, and framebuffer effects described in Sections 49.21 and 59.2.

The two `__avm_draw_filled_rect_*` interfaces lower to their corresponding
`llvm.avm.draw.filled.rect.*` intrinsics. The backend assigns `x`, `y`,
`width`, and `height` to `r4`, `r5`, `low8(r6)`, and `low8(r7)`,
respectively, and selects `SYS 0x27-0x28`. These operations retain the fixed
framebuffer read/write effects described in Sections 49.22 and 59.2.


The text-state and text-drawing interfaces lower to the corresponding
`llvm.avm.set.text.*`, `llvm.avm.draw.text*`, and
`llvm.avm.draw.textfv*` intrinsics. The backend selects `SYS 0x31-0x36` with
the fixed registers from Section 59.1. `set_text_font` and `set_text_mode`
retain hidden selected-state definitions; drawing operations retain hidden uses
of that state, selected-font AS1 reads, their explicit and indirect source
reads, and fixed-framebuffer effects.

The four low-level drawing interfaces return a packed `uint32_t` whose low and
high halves are final x and final baseline y. Runtime headers SHOULD convert
that representation to `avm_text_cursor_t`. They MAY expose inline
`avm_draw_text`, `avm_draw_text_P`, `avm_draw_textfv`, and
`avm_draw_textfv_P` wrappers and variadic `avm_draw_textf` and
`avm_draw_textf_P` conveniences. A variadic convenience must construct a
`va_list` and use the corresponding `fv` interface; it does not receive a
separate SYS identifier.

Target format diagnostics for formatted text use the same grammar and AVM `%S`
and `%P` extensions as Section 49.27. Unlike `vsnprintf`, formatted text has no
bounded destination or output-count result, and diagnostics or lowering MUST
not impose a 32767-byte output-count limit on the text sink.

## 60. Code model and C++ policy

The default code model is large. The supported relocation model is static.

Source-level direct jumps and calls normally use the relaxable pseudos `JMP symbol` and `CALL symbol`, allowing the linker to choose the shortest valid form for the final 24-bit layout. Exact-width forms use the distinct mnemonics `JMP8`, `JMP16`, `JMPF`, `CALL8`, `CALL16`, and `CALLF`.

The initial C++ environment supports:

- Classes and member functions.
- Templates.
- Virtual dispatch.
- Nonlocal static constructors and destructors.
- Function-local static constructors and destructors.
- Placement `new`.
- Function overloading.

Exceptions, RTTI, ordinary C++ allocation operators, and thread-local storage are disabled.

AVM vtables and construction vtables reside in AS1 program memory. An object's
vptr is a 24-bit AS1 pointer to the vtable address point. Every vtable
component occupies three little-endian bytes: function entries hold a 24-bit
program address, signed offsets use 24-bit two's-complement form, and data
addresses (including an RTTI address if one is emitted) occupy the low two
bytes with a zero high byte. Virtual calls load function entries with `LDP24`.
Virtual member-function pointers encode a byte offset in this three-byte
layout. VTTs also reside in AS1 and contain 24-bit vtable address points.

Startup runs `.init_array` entries before `main()` or sketch `setup()`.
Clang emits nonlocal global object destructors into program-memory `.fini_array`
entries, visited in reverse order during normal termination. Function-local
static objects register destructors only after construction; the linker reserves
one five-byte RAM slot per live object, plus a two-byte next-slot pointer. The
shared two-byte construction phase lives in the raw startup stack frame and is
counted by ordinary stack analysis. The registry code and static RAM are linked
only when needed. Programs with only nonlocal destructors need no RAM registry.

`<stdlib.h>` provides C99 `atexit`, `exit`, `_Exit`, and `abort`, with C linkage
and nonreturning declarations usable in C99 and C++. Returning from ordinary
`main()` and calling `exit(status)` perform normal termination: registered
callbacks and applicable C++ destructors execute, then `avm_halt()` stops guest
execution. `exit` does not unwind automatic objects. `_Exit(status)` and the
weak `abort()` implementation call `avm_halt()` immediately, skipping normal
cleanup. Calling `avm_halt()` directly also skips cleanup. These operations do
not reset hardware or flush hosted streams. Hardware has no process exit-status
interface, so `exit` and `_Exit` discard their status argument. The test CRT
retains its P/F report from `avm_test_main()`'s return value, after cleanup;
explicit `exit` bypasses that return path and report. The sketch CRT still calls
`setup()` once and `loop()` indefinitely, with no per-iteration termination work.
A sketch can terminate explicitly with `exit`.

`atexit` returns zero on success and nonzero when full. The default capacity is
32 outstanding registrations. Set `-Wl,--avm-atexit-capacity=N` with `avm-clang`
(or `--avm-atexit-capacity=N` with `avm-ld`) to choose 1..255 entries, subject to
the static-RAM limit. A capacity below 32 deliberately relaxes the C99 minimum
guarantee. The linker sizes storage after LTO and section GC; no runtime rebuild
is needed. Repeated registrations are distinct entries. An entry is consumed
before its callback runs. Registrations during cleanup run before earlier
pending entries, reusing consumed capacity. As in C99, recursively calling
`exit` has undefined behavior.

Plain C uses packed three-byte function pointers plus a one-byte count:
`3 * N + 1` bytes (13 at capacity 4; 97 at capacity 32). No callback table or
count is linked without a live `atexit` reference, including programs returning
from `main`, programs using only `exit`, and existing C++ destructor programs.
Immediate termination does not itself pull in the normal termination registry.
With nonlocal or local C++ destructors, callbacks share the local-destructor LIFO:
each slot contains a three-byte code pointer and a two-byte phase/tag. This
preserves exact reverse registration order within a construction phase and
ordering around completed global constructions. Mixed storage is
`5 * (N + L) + 3` bytes, where L is the number of live local-static destructor
slots; static bookkeeping is a shared next pointer and callback count. At
capacity 32 this is 163 bytes plus five per local-static destructor, excluding
the objects and their existing guards. No heap or analysis-only target records
are stored in guest RAM. The shared phase/tag supports at most 32767 fini-array
entries; the linker rejects a larger array when construction tracking is linked.

Global construction/destruction hooks identify the object's fini-array stub
with its ordinary 24-bit code pointer. Its final array position supplies the
phase across translation units and initialization priorities. The phase advances
only after construction completes. Explicit `exit` also links construction
tracking, so unfinished nonlocal objects are skipped when exiting during
initialization. Even an explicit C++ `exit` without callbacks needs no additional
static termination storage: its phase is in the startup frame and there is no
dynamic-table pointer, callback table, or count. The supplied CRTs reserve and
initialize the two-byte phase once at startup, including when unused; this is
stack usage, not static RAM, and adds no sketch-loop work. Rebuild C++
objects when updating this runtime/compiler hook ABI. The default configuration
still disables `__cxa_atexit`.

The default linker places `.data.avm_local_dtor_slot.*` contiguously at the start
of `.data`, followed by optional callback capacity and shared bookkeeping.
Custom SECTIONS layouts must reproduce this contract:
`__avm_local_dtor_slots_start/end` bound the compiler slots;
`__avm_termination_slots_end` follows the callback slots;
`__avm_termination_next` names a zero-initialized two-byte pointer when there is
a mixed dynamic table; `__avm_termination_phase` aliases the absolute
`__avm_crt_termination_phase` address exported for the raw startup frame.
`__builtin_avm_termination_context()` reserves and initializes that word in
`_start`; the backend exports its finalized address relative to the loader's
initial SP of 0x0A00. Absolute `__avm_termination_entry_size` is 3 or 5 and
`__avm_atexit_capacity` is the requested capacity. A custom CRT without the
stack-context contract requires a two-byte static phase fallback. Plain C omits
mixed-registry static bookkeeping. Explicit section-start overrides
also bypass default allocation. The capacity option configures the default AVM
layout, not user-supplied SECTIONS allocation expressions.

Persistent AS0 global variables are placed in `.saved` or `.saved.*`. Other
AS0 global objects are placed in `.data` or `.data.*`, including ordinary
`const` objects and string literals. A source-level `const` qualifier never
changes the address space because an unqualified C pointer must still be able to
address the object.

Functions are placed in `.text`. Data objects explicitly declared in AS1 are
placed in `.rodata` or `.rodata.*` and are accessed through 24-bit program
pointers and `LDP*`; they are not writable. The frontend or runtime headers MAY
provide target-specific attributes or macros for selecting persistent AS0
storage and AS1 program storage, but the LLVM address space and ELF section
contracts are authoritative.

Zero-initialized AS0 globals in either `.saved` or `.data` are emitted with
explicit zero initializer bytes.

---

# Part X — MC and Assembly Language Contract

## 61. Canonical assembly syntax

The assembly language follows GNU-style line-oriented syntax.

### 61.1. Lexical rules

- Mnemonics, register names, and directives are case-insensitive.
- Symbol names are case-sensitive.
- The canonical printer emits lowercase mnemonics, register names, and directives.
- `;` begins a comment extending to end of line.
- A label is written `symbol:`.
- Local compiler-generated labels begin with `.L`.
- Operands are separated by commas.
- Whitespace is otherwise insignificant.

Identifiers begin with a letter, `_`, `.`, or `$` and may continue with letters, digits, `_`, `.`, or `$`.

### 61.2. Literals

Accepted integer forms:

```text
123          decimal
0x7b         hexadecimal
0b1111011    binary
0173         octal
-12          signed expression
'A'          character literal
'\n'         escaped character literal
```

Immediates have no prefix character.

Expression operators follow standard GNU assembler precedence for arithmetic and bitwise expressions.

### 61.3. Register spelling

Canonical names:

```text
r0-r7
q0-q3
sp
pc
cc
```

An instruction using a 16-bit register prints `rN`. An instruction using an aligned pair prints `qN`.

`rN` and `qN` are accepted only where the instruction's register constraints permit them.

The canonical division and remainder spellings are:

```text
udiv16 rD,rS
urem16 rD,rS
sdiv16 rD,rS
srem16 rD,rS
```

Both operands must be `r0-r7`. The printer emits the destination/dividend first
and the preserved source/divisor second.

### 61.4. Memory operands

Canonical forms:

```text
[rA]          ordinary data-space indirect
[rA+]         postincrement data-space indirect
[sp+u8]       stack-relative
[addr16]      absolute data-space address
[qA]          program-space indirect
[qA+]         postincrement program-space indirect
```

A zero stack displacement prints as `[sp+0]`.

### 61.5. Exact and relaxable control-transfer spelling

Exact encoded forms use these mnemonics:

```text
breq8 rel8
brne8 rel8
brult8 rel8
bruge8 rel8
brslt8 rel8
brsge8 rel8

breq16 rel16
brne16 rel16
brult16 rel16
bruge16 rel16
brslt16 rel16
brsge16 rel16

jmp8 rel8
jmp16 rel16
jmpf target24
call8 rel8
call16 rel16
callf target24
```

The assembler accepts these relaxable pseudos:

```text
jmp symbol
call symbol
breq symbol
brne symbol
brult symbol
bruge symbol
brslt symbol
brsge symbol
```

Relaxable pseudos emit a maximal valid sequence plus `R_AVM_RELAX`. Their operands MUST be relocatable symbolic program-target expressions, optionally with a constant addend. Pure absolute expressions are invalid for `jmp`, `call`, `breq`, `brne`, `brult`, `bruge`, `brslt`, and `brsge`.

There is no mnemonic overloading between exact and relaxable forms:

```text
breq8 / brne8 / brult8 / bruge8 / brslt8 / brsge8
    exact signed-8-bit conditional branches

breq16 / brne16 / brult16 / bruge16 / brslt16 / brsge16
    exact signed-16-bit conditional branches

jmp8 / jmp16 / jmpf       exact encoded jumps
call8 / call16 / callf    exact encoded calls
jmp / call / breq / brne / brult / bruge / brslt / brsge
    relaxable symbolic pseudos
```

An exact mnemonic without `R_AVM_RELAX` is never widened or shrunk. An overflow in an exact form is an error.

The MC target MUST advertise a maximum instruction length of six bytes, which
is the size of the maximal relaxable conditional-branch sequence.

### 61.6. Canonical printing and pseudos

The disassembler prints actual encoded instructions, not multi-instruction pseudos.

`llvm-objdump --disassemble --symbolize-operands` preserves existing target
symbols and generates local `L0`, `L1`, ... labels for unnamed direct branch and
jump destinations at instruction boundaries within a function. The project build
uses this option when generating disassembly artifacts. Relative branch operands
are offsets from the end of the instruction; the accompanying `<L...>` annotation
identifies the destination. Indirect transfers retain their register operands.

It may print:

```text
nop
```

for the canonical encoding `mov r4,r4`.

It prints encoded `F2 60-6B` instructions as `mov32`. It does not combine two adjacent compact `mov` instructions into `mov32`, and it does not print `LSL32.1` or synthetic `ULE`/`UGT` aliases as single instructions.

## 62. Assembly directives and symbol expressions

Required directives include:

```text
.text
.rodata
.saved
.data
.section
.globl
.weak
.local
.type
.size
.byte
.short
.word
.long
.progptr
.ascii
.asciz
.zero
.align
.p2align
```

Data widths:

```text
.byte      1 byte
.short     2 bytes
.word      2 bytes
.long      4 bytes
.progptr   3-byte packed program pointer
```

`.progptr expression` emits `R_AVM_PROG24` when relocation is required.

Required target expression modifiers:

```text
%lo16(symbol + addend)
%hi8(symbol + addend)
%prog24(symbol + addend)
```

Instruction operands select `R_AVM_PCREL8`, `R_AVM_PCREL16`, or `R_AVM_FAR24` according to the encoded form. The six short conditional branches use `R_AVM_PCREL8`; the six `*16` conditional branches use `R_AVM_PCREL16`.

Sections default to one-byte alignment unless an explicit directive requires
more. When the assembler inserts padding in an executable program-space
section, each padding byte is `0x00`, the canonical one-byte `nop` encoding.

## 63. Inline-assembly constraints

Required target constraints:

| Constraint | Operand class |
|---|---|
| `r` | `GPR16` |
| `c` | `UpperGPR16` |
| `b` | `GPR8` low-byte operand |
| `B` | `UpperGPR8` low-byte operand |
| `p` | `PTR16` |
| `P` | `UpperPTR16` |
| `q` | `GPR32` |
| `Q` | `UpperGPR32` |
| `t` | Logical 24-bit `PROGPTR` backed by `GPR32`; padding byte ignored by pointer consumers |
| `I` | Signed 8-bit immediate |
| `J` | Unsigned 8-bit immediate |
| `K` | Unsigned 4-bit immediate |
| `L` | Signed 16-bit immediate |
| `M` | Unsigned 16-bit immediate |
| `N` | Shift count `0-15` |
| `O` | Constant zero |
| `m` | Address-space-zero memory operand |
| `o` | Offsettable address-space-zero memory operand |

Fixed-register constraints use braces:

```text
{r0} ... {r7}
{q0} ... {q3}
```

Standard matching constraints, early-clobber `&`, read/write `+`, and commutative `%` modifiers are supported.

Special clobbers:

```text
"cc"      architectural CC
"memory"  compiler memory barrier
```

`sp` and `pc` may not be allocated, named as output operands, or listed as ordinary clobbers.

Raw `SYS` may appear in inline assembly, but callers must describe all fixed uses, results, and ordering effects correctly. Target builtins are preferred.

---

# Part XI — ELF, Relocations, Linker, and Image Contract

## 64. ELF header and object format

The toolchain uses ELF32.

Required ELF identification:

```text
EI_CLASS      ELFCLASS32
EI_DATA       ELFDATA2LSB
EI_VERSION    EV_CURRENT
EI_OSABI      ELFOSABI_NONE
EI_ABIVERSION 0
```

Required ELF header fields:

```text
e_machine = EM_AVM = 0x4156
e_version = EV_CURRENT
e_flags   = EF_AVM_ABI_V2 = 0x00000002
```

Relocatable objects use `ET_REL`.

A linked ELF image MAY use `ET_EXEC`; its `e_entry` is the zero-extended 24-bit entry address.

### 64.1. Target section flags

```text
SHF_AVM_PROGSPACE = 0x10000000
SHF_AVM_DATASPACE = 0x20000000
```

For an allocated section, these flags are mutually exclusive and identify the AVM address space.

### 64.2. Standard section contracts

| Section | Type | Required flags | Address space |
|---|---|---|---|
| `.text` | `SHT_PROGBITS` | `SHF_ALLOC | SHF_EXECINSTR | SHF_AVM_PROGSPACE` | Program |
| `.rodata` | `SHT_PROGBITS` | `SHF_ALLOC | SHF_AVM_PROGSPACE` | Program |
| `.saved` | `SHT_PROGBITS` | `SHF_ALLOC | SHF_WRITE | SHF_AVM_DATASPACE` | Data |
| `.data` | `SHT_PROGBITS` | `SHF_ALLOC | SHF_WRITE | SHF_AVM_DATASPACE` | Data |
| `.init_array` | `SHT_INIT_ARRAY` | `SHF_ALLOC | SHF_AVM_PROGSPACE` | Program |
| `.fini_array` | `SHT_FINI_ARRAY` | `SHF_ALLOC | SHF_AVM_PROGSPACE` | Program |
| `.avm.metadata` | `SHT_PROGBITS` | No `SHF_ALLOC` by default | None |
| `.debug_*` | Tool-defined nonallocated debug section types | No `SHF_ALLOC` | None |
| `.rela.*` | `SHT_RELA` | No `SHF_ALLOC` | None |

`.rela.*` sections use the ELF32 `Elf32_Rela` layout:

```text
sh_entsize = 12
sh_link    = associated symbol table
sh_info    = relocated section index
```

`.init_array` and `.fini_array` use:

```text
sh_entsize = 3
element     = packed 24-bit function pointer
relocation  = R_AVM_PROG24
```

`.saved` and `.saved.*` contain persistent global objects. `.data` and `.data.*`
contain ordinary global objects. Both initialized and language-level
zero-initialized objects use `SHT_PROGBITS`; zero-initialized objects contribute
explicit zero bytes.

A linked image merges all live `.saved` inputs before all live `.data` inputs.
The complete `.saved` range is therefore one contiguous prefix beginning at
data address `0x0100`.

Allocated AVM data-space `SHT_NOBITS` sections are unsupported.

### 64.3. Symbols and unsupported ELF features

In `ET_REL`, symbol values are section-relative.

In a linked image:

- Program-space symbols have values in `0x000000-0xFFFFFF`.
- Data-space symbols have values in `0x0000-0xFFFF`.
- Section flags identify the address space.

`STT_FUNC` symbols reside in program-space sections.

`STT_OBJECT` symbols may reside in either address space.

Default section alignment is one byte. Explicit stronger alignment is honored.

`SHN_COMMON`, thread-local-storage sections, and target small-data sections are unsupported. Tentative definitions are emitted into `.data` with explicit zero initializer bytes.

COMDAT and ELF section groups use standard ELF semantics.

## 65. Relocation format and identifiers

AVM uses `SHT_RELA` relocation sections with explicit signed 32-bit addends.

`SHT_REL` is unsupported.

Definitions:

```text
S = resolved symbol value
A = explicit relocation addend
P = address of the first byte of the relocated instruction or data field
N = encoded instruction length
```

Relocation identifiers:

| Value | Name |
|---:|---|
| `0` | `R_AVM_NONE` |
| `1` | `R_AVM_DATA16` |
| `2` | `R_AVM_PROG24` |
| `3` | `R_AVM_PROG_LO16` |
| `4` | `R_AVM_PROG_HI8` |
| `5` | `R_AVM_PCREL8` |
| `6` | `R_AVM_PCREL16` |
| `7` | `R_AVM_FAR24` |
| `8` | `R_AVM_RELAX` |

### 65.1. Relocation calculations

| Relocation | Calculation | Field | Range |
|---|---|---|---|
| `R_AVM_NONE` | None | None | — |
| `R_AVM_DATA16` | `S + A` | 16-bit little-endian | `0..0xFFFF` |
| `R_AVM_PROG24` | `S + A` | 24-bit little-endian | `0..0xFFFFFF` |
| `R_AVM_PROG_LO16` | `(S + A) & 0xFFFF` | 16-bit little-endian | Source must fit 24 bits |
| `R_AVM_PROG_HI8` | `((S + A) >> 16) & 0xFF` | 8-bit | Source must fit 24 bits |
| `R_AVM_PCREL8` | `S + A - (P + 2)` | Signed 8-bit operand | `-128..127` |
| `R_AVM_PCREL16` | `S + A - (P + 3)` | Signed 16-bit little-endian operand | `-32768..32767` |
| `R_AVM_FAR24` | `S + A` | 24-bit little-endian target | `0..0xFFFFFF` |
| `R_AVM_RELAX` | Marker only | None | — |

Every overflow is a link error. Silent truncation is forbidden except for the explicitly extracting `PROG_LO16` and `PROG_HI8` relocations.

For instruction relocations, `P` is the primary opcode address.

`R_AVM_RELAX` appears at the same offset as the relocation-bearing instruction or maximal branch sequence. It uses symbol index zero and addend zero.

## 66. Linker relaxation

Relaxation is iterative and continues until section sizes stabilize.

The linker updates:

- Section contents and sizes.
- Symbol values.
- Relocation offsets.
- Line-table and other address-bearing metadata.
- Entry-point and image-layout calculations.

### 66.1. Unconditional jump relaxation

```text
JMPF target24  -> JMP16 rel16 -> JMP8 rel8
```

A step is permitted when the target fits the smaller form after accounting for the smaller instruction's own `nextPC`.

### 66.2. Call relaxation

```text
CALLF target24 -> CALL16 rel16 -> CALL8 rel8
```

The pushed return address is always the address after the final relaxed instruction.

### 66.3. Conditional-branch relaxation

All six conditions use the same maximal relaxable sequence:

```text
inverse-condition +4
JMPF target
```

Condition pairs are:

```text
EQ  <-> NE
ULT <-> UGE
SLT <-> SGE
```

The maximal sequence is six bytes. The linker selects the shortest direct branch whose displacement fits after accounting for the candidate instruction's own length and all other layout changes:

```text
6 bytes: inverse-condition +4; JMPF target
3 bytes: requested-condition16 rel16
2 bytes: requested-condition rel8
```

The direct mappings are:

```text
pseudo   signed-16-bit form   signed-8-bit form

breq     BREQ16               BREQ8
brne     BRNE16               BRNE8
brult    BRULT16              BRULT8
bruge    BRUGE16              BRUGE8
brslt    BRSLT16              BRSLT8
brsge    BRSGE16              BRSGE8
```

For a relaxation site beginning at `P` and final target `T`:

```text
requested-condition rel8:
    displacement = T - (P + 2)
    range        = -128..127

requested-condition16 rel16:
    displacement = T - (P + 3)
    range        = -32768..32767
```

The linker MUST choose the two-byte form when its signed `rel8` displacement fits. Otherwise it MUST choose the three-byte `*16` form when its signed `rel16` displacement fits. Otherwise it retains the six-byte maximal sequence.

There is no five-byte inverse-condition-plus-`JMP16` relaxation form and no four-byte inverse-condition-plus-`JMP8` form. A relaxation is valid only when the final target fits the selected direct form after accounting for all size changes.

### 66.4. Explicit nonrelaxable forms

The exact mnemonics `JMP8`, `JMP16`, `JMPF`, `CALL8`, `CALL16`, `CALLF`, `BREQ8`, `BRNE8`, `BRULT8`, `BRUGE8`, `BRSLT8`, `BRSGE8`, `BREQ16`, `BRNE16`, `BRULT16`, `BRUGE16`, `BRSLT16`, and `BRSGE16` never receive `R_AVM_RELAX` and are never widened or shrunk.

A relocation overflow in an exact form is an error.

Indirect `JMPP` and `CALLP` are not relaxed.

## 67. Linker responsibilities

The linker must:

1. Lay out code and program-resident data anywhere within the flat 24-bit program space.
2. Ensure no instruction or object extends beyond `0xFFFFFF`.
3. Ensure every control-flow target is a valid instruction boundary.
4. Honor explicit symbol and section alignment.
5. Insert no range veneer when a 24-bit absolute form can express the target.
6. Relax marked calls, jumps, and conditional transfers.
7. Lay out all live `.saved` input sections as one contiguous data-space prefix beginning at `0x0100`.
8. Lay out all live ordinary `.data` input sections immediately after `.saved`.
9. Materialize language-level zero-initialized globals as explicit zero bytes; do not create a runtime `.bss`.
10. Emit the complete `.saved + .data` initializer prefix into the linked program image.
11. Record both `saveSize` and total `dataSize` in the runtime header.
12. Synthesize the runtime header and tail.
13. Validate encodings, aliases, relocations, section ordering, and address ranges.
14. Fill required padding bytes.

Functions, basic blocks, fallthrough, jump tables, and program data may cross any 64 KiB address boundary.

## 68. Linked-image layout

The executable image is a flat little-endian binary:

```text
0x000000-0x0000FF                           fixed header
0x000100-0x000100+saveSize-1                .saved default initializer
0x000100+saveSize-0x000100+dataSize-1       ordinary .data initializer
...-programStart-1                          0xFF padding
programStart-...                            program-space contents
...-fileSize-9                              0xFF final padding
fileSize-8-fileSize-1                       mandatory tail
```

Definitions:

```text
programStart   = align_up(0x000100 + dataSize, 0x100)
endOfPayload   = first byte after the highest occupied payload byte
fileSize       = align_up(endOfPayload + 8, 0x100)
file offset    = logical program address
fileSize mod 0x100 = 0
```

Here `dataSize` is the total byte count of `.saved + .data`, not merely the
ordinary `.data` suffix. Every static byte, including every language-level
zero-initialized byte, occupies one initializer byte in the flat image.

The Version 1 tail uses an unsigned 16-bit page count, so a packaged image is
limited to:

```text
maximum imagePageCount = 0xFFFF
maximum fileSize       = 0xFFFF00 bytes
maximum endOfPayload   = 0xFFFEF8
highest payload byte   = 0xFFFEF7
```

Program-space addresses remain architecturally 24-bit through `0xFFFFFF`, but
program bytes at logical addresses `0xFFFEF8-0xFFFFFF` cannot be represented in
a Version 1 flat image because the mandatory tail and page-aligned file size
would make `imagePageCount` overflow.

A linked AVM `ET_EXEC` may use the full architectural address range. A
Version 1 image packer MUST reject an otherwise valid ELF when packaging it
would require a file larger than `0xFFFF00` bytes.

## 69. Header

The header is exactly 256 bytes.

| Offset | Size | Field | Description |
|---:|---:|---|---|
| `0x00` | 4 | `magic` | `41 56 4D 01` |
| `0x04` | 1 | `runtimeVersion` | Execution-contract version |
| `0x05` | 3 | `entryPoint` | Logical runtime entry address |
| `0x08` | 2 | `dataSize` | Total `.saved + .data` initializer bytes |
| `0x0A` | 2 | `saveSize` | Persistent prefix bytes within `dataSize` |
| `0x0C` | 240 | `reserved` | Must be zero |
| `0xFC` | 4 | `headerCrc32` | CRC of bytes `0x00-0xFB` |

`headerCrc32` uses CRC-32/ISO-HDLC and is stored little-endian.

## 70. Tail locator

The final eight bytes are:

| Tail offset | Size | Field | Description |
|---:|---:|---|---|
| `+0x00` | 4 | `magic` | `41 56 54 01` |
| `+0x04` | 2 | `imagePageCount` | File size in 256-byte pages |
| `+0x06` | 2 | `reserved` | Must be zero |

Required:

```text
imagePageCount = fileSize / 256
1 <= imagePageCount <= 0xFFFF
fileSize <= 0xFFFF00
```

The stored value is an unsigned 16-bit little-endian integer. A packer MUST
diagnose an image that would require `imagePageCount = 0x10000` or greater; it
MUST NOT wrap, truncate, or encode zero.

## 71. Startup state

A loader or runtime validates at least:

```text
header magic
supported runtimeVersion
0 <= saveSize <= dataSize <= 1024
valid entry point
```

It establishes:

```text
SP = 0x0A00
CC = 0
PC = entryPoint
```

Static initialization is:

1. Copy all `dataSize` initializer bytes, including the `.saved` prefix, from
   program address `0x000100` to data address `0x0100`.
2. Clear the complete framebuffer at data addresses `0x0500-0x08FF` to zero.
3. Update the configured physical display from the cleared framebuffer before
   beginning guest execution.

Startup does not automatically restore persistent storage. A program invokes
`load` explicitly when it wants to replace the default `.saved` initializer
with the newest compatible persistent record.

No static-storage clearing pass is performed because all static bytes have
explicit initializer bytes. The framebuffer clear is a separate platform
initialization step and does not alter `.saved` or `.data`.

General-purpose registers are unspecified at raw image entry unless a higher-level runtime ABI states otherwise.

## 71.1. Persistent save storage

The persistent program-visible range is exactly:

```text
data address 0x0100 through 0x0100 + saveSize - 1
```

It corresponds to the linked `.saved` section and is always a contiguous prefix
of static storage.

The `save` service persists exactly those `saveSize` bytes. The `load`
service restores exactly those bytes and does not modify the following ordinary
`.data` range. Until `load` succeeds, the image's `.saved` initializer remains
the program-visible value. This permits both explicitly initialized and zero-
initialized saved global variables.

The persistent record stores `saveSize` as an unsigned little-endian 16-bit
value followed immediately by the payload. A packer or storage backend MAY
reserve a larger physical erase unit, but bytes beyond `saveSize` are not part
of the program-visible save object.

---

# Part XII — Validation, Undefined Behavior, and Versioning

## 72. Validation requirements

A validating tool or VM should detect:

- Reserved or malformed instruction encodings.
- Invalid secondary-page values.
- Malformed `PSPEC` or `RRSPEC32`.
- Prohibited postincrement-load aliases.
- Stack overflow or underflow.
- Invalid or misaligned control-flow targets.
- Instruction or object placement beyond the 24-bit program-space limit.
- Program access outside the image.
- Unsupported system-service identifiers.
- Invalid image header, tail, sizes, CRC, or padding.
- A flat image larger than `0xFFFF00` bytes or an overflowing 16-bit `imagePageCount`.
- Invalid persistent save-object size, format, or integrity when a save object is present.
- Relocation overflow.
- Unsupported TLS or common symbols.

## 73. Unchecked execution

Unchecked execution may treat the following as unrestricted undefined behavior:

- Illegal or reserved instruction.
- Malformed operand byte.
- Prohibited operand alias.
- Jump into the middle of an instruction.
- Stack overflow or underflow.
- Unsupported data-space access.
- Invalid program-space access.
- Instruction or object placement beyond the 24-bit program-space limit.
- Corruption of runtime-reserved data.

Distribution tooling SHOULD validate bytecode before packaging.

## 74. Versioning

The linked image carries:

```text
header magic[3]  file-layout revision
tail magic[3]    tail-locator revision
runtimeVersion   complete execution-contract revision
```

The fixed-register FF ISA uses:

```text
runtimeVersion = 2
EF_AVM_ABI_V2 = 2
```

`runtimeVersion` covers:

- Architectural state.
- Complete instruction encoding and semantics.
- Pointer representation.
- Calling convention and frame contract.
- System ABI.
- Startup contract.
- Program-visible save behavior.

The FF migration bumps runtimeVersion and ELF ABI flags to 2. Header/tail
layout revisions remain 1. The interpreter rejects runtimeVersion 1 images;
the linker rejects ABI 0/1 objects, and the image packer requires ABI 2.
Rebuild all guest objects and images. Old FF bytes must never be silently
reinterpreted. Future incompatible changes require another contract version
and corresponding object ABI flag.

---

# Part XIII — Consolidated Interface Summary

```text
Registers:
    r0-r7, 16 bits each
    q0-q3 alias aligned register pairs

Special state:
    PC  24 bits
    SP  16 bits
    CC  C/Z/S condition bits

Address spaces:
    AS0 data, 16-bit pointers
    AS1 program, 24-bit pointers, read-only
    AS1 register containers are 32 bits; only bits 23:0 are the pointer value

Calling convention:
    r4-r7 are four 16-bit argument units
    two-unit arguments align to even units
    allocation closes after the first stack argument
    narrow register arguments are canonical 16-bit values
    aggregates 1-4 bytes are direct
    larger aggregates are indirect
    r0-r3 are callee-saved
    three-byte return addresses

Frame:
    locals and spills at low positive frame offsets
    saved r0-r3 above fixed storage
    optional r3 frame pointer
    outgoing arguments allocated at call sites
    dynamic alloca -> generic expansion using 16-bit SP, GETSP/SUB/SETSP

LLVM:
    avm-unknown-arduboyfx
    ISA CPU avm1
    default tune CPU avm-interpreter-32u4-v1
    data layout uses P1-G0-A0
    source-level _Float16 unsupported
    ELF32 little-endian
    PTR16 uses upper-register-first allocation
    PROGPTR is logical p1:24 backed by GPR32 with an unspecified padding byte
    every instruction and SYS program-pointer consumer ignores PROGPTR bits 31:24
    ordinary program-pointer arguments and returns are normalized
    division, remainder, and binary32 arithmetic use direct instructions with stable helper fallbacks
    atomics lower to ordinary operations in the single-thread VM model
    memcpy_P lowers through generic AS0<-AS1 llvm.memcpy and SYS_MEMCPY_P
    memset lowers through llvm.avm.memset or generic llvm.memset and SYS_MEMSET
    memmove lowers through llvm.avm.memmove or generic llvm.memmove and SYS_MEMMOVE
    comparison and string builtins use typed AVM intrinsics and SYS 0x13-0x1C
    display uses llvm.avm.display and SYS 0x1D with fixed framebuffer effects
    explicit sprite drawing uses typed llvm.avm.draw.sprite.* intrinsics and SYS 0x1E-0x21
    explicit sprite services use r4=x, r5=y, q1=sprite, r6=frame and ignore q1 padding
    selected-sprite drawing uses llvm.avm.set.sprite / llvm.avm.draw.* and SYS 0x22-0x26
    set_sprite uses q2=sprite; cached draws use r4=x, r5=y, r6=frame
    overwrite ignores final-page padding; other sprite modes require canonical padding
    filled rectangles use typed llvm.avm.draw.filled.rect.* intrinsics and SYS 0x27-0x28
    filled rectangles use r4=x, r5=y, low8(r6)=width, low8(r7)=height

Assembly:
    GNU-style syntax
    lowercase canonical printer
    exact and relaxable control-transfer spellings
    target register and immediate constraints defined

ELF:
    EM_AVM = 0x4156
    EF_AVM_ABI_V2 = 2
    SHT_RELA only
    R_AVM_PCREL8 and R_AVM_PCREL16
    24-bit absolute relocation and iterative relaxation
    explicit program/data section flags

Startup:
    framebuffer 0x0500-0x08FF is cleared and transferred to the display

Image:
    256-byte header
    saveSize and total dataSize fields
    contiguous .saved + .data initializer at 0x000100
    mandatory 8-byte tail
    unsigned 16-bit imagePageCount
    maximum file size 0xFFFF00 bytes
    highest representable payload byte 0xFFFEF7
    file offsets equal logical program addresses
```

### RAM debug formatting compiler interface

`__builtin_avm_debug_printf` / `__avm_debug_printf` accept a RAM format and
true variadic arguments. `__builtin_avm_debug_printfv` / `__avm_debug_printfv`
accept a RAM format and explicit `va_list`. All lower to
`llvm.avm.debug.printfv(ptr, ptr) -> i16`, selected through
`AVMSystemCalls.inc` into `SYS_DEBUG_PRINTFV_PSEUDO` and finally `SYS 0x3D`.
The descriptor places format in `r6`, arguments in `r2`, and result in `r4`.
Inputs are preserved; no ordinary call register mask applies. Packed slots
retain byte alignment: promoted int/data pointer two bytes, long/float four
bytes, and program pointer three bytes. The intrinsic retains conservative
memory effects and observable side effects. The pseudo and memory operands
model reads and indirect `%n` writes; neither debug formatter may be removed,
speculated, or reordered across output or potentially aliasing memory accesses.
Formatting has variable cost and no fabricated fixed cycle cost.

The public `avm_debug_printf` and `avm_debug_printfv` interfaces complement
the existing `_P` APIs; C++ overloads select by format pointer address space.
