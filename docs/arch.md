# Arduboy Virtual Machine Interface Specification

**Status:** Version 1 design draft
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

This document is the normative Version 1 interface specification. It defines:

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
- Part of a canonical program or function pointer.

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

A program or function pointer in registers occupies one `qN`:

```text
low register                  = bits 15:0
low byte of high register     = bits 23:16
high byte of high register    = zero
```

Canonical register-form pointers therefore satisfy:

```text
qN[31:24] = 0
```

### 12.3. Pointer arithmetic

Program-pointer arithmetic is unsigned 24-bit arithmetic.

Data and program pointers belong to disjoint address spaces. Implicit conversion between them is forbidden. Explicit integer conversion is target-defined.


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
| `wchar_t` | 2 bytes |

Plain `char` is signed by default.

`bool` is represented canonically as zero or one.

Source-level `_Float16` is not supported by the Version 1 C or C++ target.
Clang MUST diagnose its use rather than assigning it an ABI. LLVM IR may still
contain `f16` values for data-layout and IR-compatibility purposes; such values
are not a source-language ABI type and require expansion or promotion before
machine instruction selection.

## 16. Byte and larger values in registers

A byte value occupies `low8(rN)`.

The instruction definition determines the high byte:

- `LD8U`, `LDM8U`, `LDSP8U`, `LDP8U`, `LDI8`, `ZEXT8`, `MUL8`, `BOOL`, and `CSET` clear it.
- `LD8S`, `LDSP8S`, `LDP8S`, and `SEXT8` sign-extend it.
- Byte stores use only `low8(rN)`.
- `SWAP8` modifies only `low8(rN)` and preserves `high8(rN)`.

A 32-bit integer occupies one `qN`.

A 64-bit integer occupies four 16-bit registers or is lowered through runtime helpers.


## 16.1. Allocation model

AVM provides no architectural general-purpose heap.

The standard freestanding runtime does not provide usable implementations of:

```text
malloc
calloc
realloc
free
operator new
operator delete
```

Placement `new` is permitted.

Variable-length arrays and unrestricted dynamic `alloca` SHOULD be disabled.

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

### 18.11. Floating-point operand specifiers

The `FF C0-C9` extended forms use one trailing operand byte in one of three
formats. Reserved bits MUST be zero.

#### `RQSPEC`: scalar register and pair register

```text
0rrr00qq
```

`rrr` selects `r0-r7`; `qq` selects `q0-q3`. The secondary opcode determines
which field is the source and which is the destination.

| Secondary | Instruction | `rrr` | `qq` |
|---:|---|---|---|
| `C0` | `S16TOF qD,rS` | `rS` | `qD` |
| `C1` | `U16TOF qD,rS` | `rS` | `qD` |
| `C2` | `FTOS16 rD,qS` | `rD` | `qS` |
| `C3` | `FTOU16 rD,qS` | `rD` | `qS` |
| `C9` | `FCLASS rD,qS` | `rD` | `qS` |

```text
RQSPEC(rN,qN) = (rN << 4) | qN
```

A value is malformed if `(specifier & 0x8C) != 0`.

#### `QQSPEC`: destination pair and source pair

```text
0000ddss
```

`dd` selects `qD`; `ss` selects `qS`. This format is used by `C4-C7` and
matches the low-nibble `ddss` layout of the binary floating-point operations.

```text
QQSPEC(qD,qS) = (qD << 2) | qS
```

A value is malformed if `(specifier & 0xF0) != 0`.

#### `RQQSPEC`: scalar destination and two pair sources

```text
0dddllrr
```

`ddd` selects `rD`; `ll` selects `qL`; `rr` selects `qR`. This format is used
by `FCMP` (`C8`).

```text
RQQSPEC(rD,qL,qR) = (rD << 4) | (qL << 2) | qR
```

A value is malformed if `(specifier & 0x80) != 0`.

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
| `ED-EE` | Reserved | — | — |
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
| `FF` | Floating-point page | 2-3 | Preserve |

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
| `E4-E7` | `JMPP qN` | Require canonical `qN`; `PC = qN[23:0]` |
| `E8-EB` | `CALLP qN` | Push `nextPC`; require canonical `qN`; `PC = qN[23:0]` |
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

### 22.5. Stack adjustment and services

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
| `63` | `LDP24 qD,[qA]` | 3 | Load 24 packed bits and clear bits `31:24` |
| `64` | `LDP32 qD,[qA]` | 3 | Little-endian 32-bit program load |
| `65` | `LDP8U rD,[qA+]` | 3 | Load byte, then add 1 to `qA` |
| `66` | `LDP16 rD,[qA+]` | 3 | Load word, then add 2 to `qA` |
| `67` | `LDP24 qD,[qA+]` | 3 | Load canonical pointer, then add 3 to `qA` |
| `68` | `LDP32 qD,[qA+]` | 3 | Load dword, then add 4 to `qA` |

`qA` MUST be canonical before the access.

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
rounding direction. NaN result payloads are unspecified except for `FMIN`,
`FMAX`, `FNEG`, `FABS`, and `FCLASS`, whose bit-level behavior is defined below.

### 35.1.1. Binary matrix

For `FF 00-5F`:

```text
bits 7:4  operation
bits 3:2  destination/left qD
bits 1:0  preserved source/right qS
```

| Secondary | Instruction | Semantics |
|---:|---|---|
| `00-0F` | `FADD qD,qS` | `qD = binary32(qD + qS)` |
| `10-1F` | `FSUB qD,qS` | `qD = binary32(qD - qS)` |
| `20-2F` | `FMUL qD,qS` | `qD = binary32(qD * qS)` |
| `30-3F` | `FDIV qD,qS` | `qD = binary32(qD / qS)` |
| `40-4F` | `FMIN qD,qS` | Number-preferred minimum |
| `50-5F` | `FMAX qD,qS` | Number-preferred maximum |

All combinations, including `qD == qS`, are legal.

For `FMIN` and `FMAX`, let `a` be the original `qD` and `b` be `qS`:

1. If `a` is NaN, return `b`.
2. Otherwise, if `b` is NaN, return `a`.
3. Otherwise, return the lesser (`FMIN`) or greater (`FMAX`) operand.
4. Opposite-signed zeros are ordered as `-0.0 < +0.0`.

If both operands are NaNs, the second operand is returned. A selected operand
is copied unchanged, including its sign, NaN payload, and signaling/quiet bit.
Thus `FMIN` returns negative zero and `FMAX` returns positive zero for
opposite-signed zeros.

### 35.1.2. Unary operations

```text
secondary = operationBase + qD
```

| Secondary | Instruction | Semantics |
|---:|---|---|
| `60-63` | `FNEG qD` | Toggle the binary32 sign bit |
| `64-67` | `FABS qD` | Clear the binary32 sign bit |
| `68-6B` | `FSQRT qD` | Binary32 square root |
| `6C-6F` | `FTRUNC qD` | Integral-valued result, toward zero |
| `70-73` | `FFLOOR qD` | Integral-valued result, toward negative infinity |
| `74-77` | `FCEIL qD` | Integral-valued result, toward positive infinity |
| `78-7B` | `FROUND qD` | Integral-valued result, nearest with ties away from zero |
| `7C-BF` | Reserved | — |

`FNEG` and `FABS` are bit operations and preserve every non-sign bit,
including NaN payload and signaling state. The four rounding operations return
NaNs and infinities unchanged and preserve the sign of zero.

### 35.1.3. Extended operations

| Secondary | Instruction | Specifier | Semantics |
|---:|---|---|---|
| `C0` | `S16TOF qD,rS` | Section 18.11 | Signed `i16` to binary32 |
| `C1` | `U16TOF qD,rS` | Section 18.11 | Unsigned `i16` to binary32 |
| `C2` | `FTOS16 rD,qS` | Section 18.11 | Binary32 to signed `i16` |
| `C3` | `FTOU16 rD,qS` | Section 18.11 | Binary32 to unsigned `i16` |
| `C4` | `S32TOF qD,qS` | Section 18.11 | Signed `i32` to binary32 |
| `C5` | `U32TOF qD,qS` | Section 18.11 | Unsigned `i32` to binary32 |
| `C6` | `FTOS32 qD,qS` | Section 18.11 | Binary32 to signed `i32` |
| `C7` | `FTOU32 qD,qS` | Section 18.11 | Binary32 to unsigned `i32` |
| `C8` | `FCMP rD,qL,qR` | Section 18.11 | Four-way comparison result |
| `C9` | `FCLASS rD,qS` | Section 18.11 | One-hot class mask |
| `CA-FF` | Reserved | — | — |

Integer-to-float conversion rounds to nearest with ties to even. Float-to-
integer conversion truncates toward zero for finite in-range inputs. For NaN
or out-of-range float-to-integer inputs, the result is unspecified; the
instruction still completes and preserves `CC`.

`FCMP` returns:

```text
0xFFFF  qL < qR
0x0000  qL == qR
0x0001  qL > qR
0x0002  unordered because either operand is NaN
```

`FCLASS` returns exactly one of:

| Mask | Class |
|---:|---|
| `0x0001` | signaling NaN |
| `0x0002` | quiet NaN |
| `0x0004` | negative infinity |
| `0x0008` | negative normal |
| `0x0010` | negative subnormal |
| `0x0020` | negative zero |
| `0x0040` | positive zero |
| `0x0080` | positive subnormal |
| `0x0100` | positive normal |
| `0x0200` | positive infinity |

No fused floating-point operation is assigned.

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
| Program/function pointer | Canonical pointer in `q2` |
| `i64` | `r4:r7` |
| Aggregate size 1-2 | `r4` |
| Aggregate size 3-4 | `q2` |
| Aggregate size greater than 4 | Hidden result pointer; pointer returned in `r4` |

For `i8` and `bool` returns, only `low8(r4)` is defined. `high8(r4)` is unspecified.

A returned `bool` is zero or one in the low byte.

A returned program pointer is canonical:

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

Variable-sized `alloca`, variable-length arrays, and dynamic stack realignment are unsupported by the Version 1 ABI.

All fixed stack objects use one-byte alignment.

### 47.6. Epilogue and tail calls

An epilogue:

1. Releases fixed local and spill storage.
2. Restores saved registers.
3. Restores the entry `SP`.
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
services use dedicated target intrinsics. Memory-copy services MAY instead use
the corresponding generic LLVM memory intrinsic when that representation
preserves the service's address spaces and memory semantics.

## 49. Defined services

| ID | Name | Inputs | Results | Other clobbers |
|---:|---|---|---|---|
| `0x00` | `debug_putc` | `low8(r4)` | None | None |
| `0x01` | `debug_break` | None | None | None |
| `0x02` | `millis` | None | `r4` | None |
| `0x03` | `millis32` | None | `q2 = r4:r5` | None |
| `0x04` | `sinf` | `q0` | `q0` | None |
| `0x05` | `cosf` | `q0` | `q0` | None |
| `0x06` | `atan2f` | `q0 = y`, `q1 = x` | `q0` | None |
| `0x07` | `tanf` | `q0` | `q0` | None |
| `0x08` | `expf` | `q0` | `q0` | None |
| `0x09` | `logf` | `q0` | `q0` | None |
| `0x0A` | `log2f` | `q0` | `q0` | None |
| `0x0B` | `log10f` | `q0` | `q0` | None |
| `0x0C` | `powf` | `q0 = x`, `q1 = y` | `q0` | None |
| `0x0D` | `hypotf` | `q0 = x`, `q1 = y` | `q0` | None |
| `0x0E` | `fmodf` | `q0 = x`, `q1 = y` | `q0` | None |
| `0x0F` | `memcpy` | `r4 = dst`, `r5 = src`, `r6 = n` | `r4 = dst` | Data-space memory |
| `0x10` | `memcpy_P` | `r4 = dst`, `q3 = src`, `r5 = n` | `r4 = dst` | Data-space memory |
| `0x11` | `memset` | `r4 = dst`, `r5 = val`, `r6 = n` | `r4 = dst` | Data-space memory |
| `0x12-0xFF` | Reserved | — | — | — |

Every defined service preserves:

```text
CC
SP
every general-purpose register not listed as a result
```

An input-only register is preserved. In particular, every floating-point math
service defines only `q0`; binary services preserve the original value of
`q1`.

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

### 49.5. Floating-point math services

Services `0x04-0x0E` operate on IEEE-754 binary32 values in `q0` and, for
binary services, `q1`. The result replaces `q0`. They preserve `q1`, `q2`,
`q3`, `CC`, and `SP`.

Angles are measured in radians. The services expose no floating-point exception
state and do not set `errno`. NaN result payloads are unspecified. Subject to
those rules, each service has the semantics of the corresponding single-
precision C math function.

| ID | Encoding | Operation |
|---:|---|---|
| `0x04` | `D7 04` | `q0 = sinf(q0)` |
| `0x05` | `D7 05` | `q0 = cosf(q0)` |
| `0x06` | `D7 06` | `q0 = atan2f(q0, q1)` where the original `q0` is `y` and `q1` is `x` |
| `0x07` | `D7 07` | `q0 = tanf(q0)` |
| `0x08` | `D7 08` | `q0 = expf(q0)` |
| `0x09` | `D7 09` | `q0 = logf(q0)` |
| `0x0A` | `D7 0A` | `q0 = log2f(q0)` |
| `0x0B` | `D7 0B` | `q0 = log10f(q0)` |
| `0x0C` | `D7 0C` | `q0 = powf(q0, q1)` where the original `q0` is `x` and `q1` is `y` |
| `0x0D` | `D7 0D` | `q0 = hypotf(q0, q1)` where the original operands are `x` and `y` |
| `0x0E` | `D7 0E` | `q0 = fmodf(q0, q1)` where the original `q0` is `x` and `q1` is `y` |

For finite `x` and finite nonzero `y`, `fmodf` computes:

```text
x - trunc(x / y) * y
```

A nonzero `fmodf` result has the sign of `x`. `atan2f` returns an angle in the
closed interval `[-pi, +pi]`.

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

`src` is a canonical image-relative 24-bit program pointer; a noncanonical
`q3` operand is invalid. The service copies exactly `n` bytes from program-space addresses `src` through `src+n-1` to
data-space addresses `dst` through `dst+n-1`, in increasing address order. If
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

---

# Part IX — LLVM and Clang Target Contract

## 50. Target identity

```text
target triple:    avm-unknown-arduboyfx
EM_AVM:          0x4156
ISA CPU name:    avm1
default tune CPU: avm-interpreter-32u4-v1
```

Version 1 defines no optional ISA subtarget features and no feature-dependent
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

Program and function pointers use the same physical members as `GPR32` but carry:

```text
bits 31:24 = 0
```

The backend SHOULD model these values through a semantic operand class or value type named `PROGPTR`, backed by `GPR32`.

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
| `p1:24` | Canonical `PROGPTR` backed by `GPR32` | Custom |

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
| Extending `i8` load to `i16` | Direct `LD8U`/`LD8S` | — | Load plus extension | — |
| Truncating store to `i8` | Direct byte store | Direct byte store | Direct byte store | Split |
| AS1 load | Custom `LDP*` | Custom `LDP*` | Custom `LDP*` | Split/helper |
| AS1 store | Invalid | Invalid | Invalid | Invalid |
| `PTRTOINT` / `INTTOPTR` AS0 | Legal bit-preserving `i16` conversion | — | — | — |
| `PTRTOINT` / `INTTOPTR` AS1 | Custom 24-bit canonical conversion | — | — | — |
| `ADDRSPACECAST` AS0↔AS1 | Unsupported | Unsupported | Unsupported | Must be explicit through integer conversion |
| Dynamic `alloca` | Unsupported | — | — | Backend diagnostic |
| `VAARG` | Custom packed-stack lowering | — | — | — |
| `BR_JT` / switch | Custom program-space jump table or branch tree | — | — | — |
| AS0-to-AS0 `MEMCPY` | Inline small constants; `SYS 0x0F` or helper otherwise | — | — | — |
| AS1-to-AS0 `MEMCPY` | Inline small constants with `LDP*` plus AS0 stores; `SYS 0x10` otherwise | — | — | — |
| `MEMSET` | Inline small constants; `SYS 0x11` or helper otherwise | — | — | — |
| `MEMMOVE` | Inline small constants; helper otherwise | — | — | — |

The `FA` page provides variable and immediate 16-bit shifts restricted to the upper registers.
Immediate counts in the range `0-15` select `LSL16I`, `LSR16I`, or `ASR16I`.
Variable shifts mask the hardware count with `& 15`; selecting them is valid
when excess-count cases are already undefined or poison under LLVM semantics,
or when the backend has explicitly constrained the count. Constant shifts
outside `0-15` require normal LLVM legalization rather than truncating the
constant into the four-bit instruction field.

Program-pointer arithmetic is lowered as unsigned 24-bit arithmetic in `GPR32`, followed by canonicalization of bits `31:24` when required.

The `EC` family directly implements all four `i16` division and remainder
operations. Wider integer division and remainder continue to use helpers.
The `FF` page directly implements the binary32 operations listed in Section
35.1; unsupported floating operations continue to use helpers.

### 55.1. Floating-point legalization and selection

The backend directly selects `FADD`, `FSUB`, `FMUL`, `FDIV`, `FSQRT`, `FNEG`,
`FABS`, integer conversions, `FCMP`, and `FCLASS` for `f32` operations with
matching semantics. The instructions are two-address where the ISA names a
`qD` input/output; the destination is tied to the left or sole source.

`FMIN` and `FMAX` directly implement the legacy LLVM number-preferred
operations whose signaling-NaN behavior permits either a NaN result or treating
the signaling NaN as a quiet NaN:

```text
llvm.minnum / llvm.maxnum
ISD::FMINNUM / ISD::FMAXNUM
G_FMINNUM / G_FMAXNUM
```

They do not directly implement `llvm.minimum` / `llvm.maximum`,
`llvm.minimumnum` / `llvm.maximumnum`, or the corresponding SelectionDAG and
GlobalISel nodes. Those operations may select `FMIN` or `FMAX` only when `nnan`
or value analysis proves both operands non-NaN, making the NaN distinction
unobservable.

The selected machine instructions MUST retain operand order and SHOULD NOT be
marked unconditionally commutable, because the exact NaN returned when both
operands are NaNs is the second operand. Target-independent nodes may be
commuted before selection when LLVM semantics permit it.

An arbitrary floating compare plus `select` MUST NOT be folded to `FMIN` or
`FMAX` unless its NaN and signed-zero behavior is equivalent or made
unobservable by fast-math flags.

`FCLASS` returns the LLVM `FPClassTest` one-hot bit. Lower `llvm.is.fpclass` or
`G_IS_FPCLASS` by applying the requested mask to the `FCLASS` result and testing
for nonzero. `FCMP` supplies ordered and unordered predicates without modifying
architectural `CC`.

Strict/constrained floating-point operations remain custom-expanded unless the
requested exception behavior is compatible with AVM's lack of architectural
floating-point exception state.

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
```

The result is `dst`. Memory helpers have their ordinary C memory effects.

Clang SHOULD provide the target builtin:

```c
void *__builtin_avm_memcpy_p(
    void *dst,
    avm_progmem_cptr src,
    uint16_t size);
```

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

## 57. Atomic and volatile policy

AVM Version 1 is single-threaded.

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
   `LDP*` instruction.
8. Select `i16` `UDIV`, `UREM`, `SDIV`, and `SREM` directly to the two-address
   `EC` instructions. The destination is both the original dividend use and the
   result definition; the divisor source is preserved.
9. Prefer `UpperGPR32` for values likely to decompose into compact word
   operations. Select `MOV32` after physical assignment: two compact `MOV`s for
   upper-pair copies and the `F2` form otherwise.
10. Use `GPR32` for pair and binary32 instructions accepting every `qN`.
11. Select direct `FF` operations only when their NaN, signed-zero, rounding,
    and exception semantics match.
12. Represent address-space-one values as canonical `PROGPTR` and model `CC`
    definitions and uses explicitly.
13. Place frequently accessed stack objects at low offsets and diagnose
    statically provable single-function stack use above 256 bytes.
14. Stack-usage metadata is optional. Version 1 does not standardize its
    section name, record layout, or semantics; no backend implementation may
    invent a mandatory object-format contract for it.

## 59. LLVM system-service representations

The non-memory services and the AS0 `memcpy` and `memset` services have
dedicated typed target intrinsics:

```llvm
declare void  @llvm.avm.debug.putc(i8 %value)
declare void  @llvm.avm.debug.break()
declare i16   @llvm.avm.millis()
declare i32   @llvm.avm.millis32()

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

declare ptr @llvm.avm.memcpy(ptr %dst, ptr %src, i16 %n)
declare ptr @llvm.avm.memset(ptr %dst, i16 %val, i16 %n)
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

### 59.1. Compiler-representation-to-machine lowering

| LLVM representation | Machine encoding | Fixed physical uses | Fixed physical definitions |
|---|---|---|---|
| `llvm.avm.debug.putc(i8)` | `SYS 0x00` | `low8(r4)` | None |
| `llvm.avm.debug.break()` | `SYS 0x01` | None | None |
| `llvm.avm.millis()` | `SYS 0x02` | None | `r4` |
| `llvm.avm.millis32()` | `SYS 0x03` | None | `q2` |
| `llvm.avm.sinf(float)` | `SYS 0x04` | `q0` | `q0` |
| `llvm.avm.cosf(float)` | `SYS 0x05` | `q0` | `q0` |
| `llvm.avm.atan2f(float,float)` | `SYS 0x06` | `q0 = y`, `q1 = x` | `q0` |
| `llvm.avm.tanf(float)` | `SYS 0x07` | `q0` | `q0` |
| `llvm.avm.expf(float)` | `SYS 0x08` | `q0` | `q0` |
| `llvm.avm.logf(float)` | `SYS 0x09` | `q0` | `q0` |
| `llvm.avm.log2f(float)` | `SYS 0x0A` | `q0` | `q0` |
| `llvm.avm.log10f(float)` | `SYS 0x0B` | `q0` | `q0` |
| `llvm.avm.powf(float,float)` | `SYS 0x0C` | `q0 = x`, `q1 = y` | `q0` |
| `llvm.avm.hypotf(float,float)` | `SYS 0x0D` | `q0 = x`, `q1 = y` | `q0` |
| `llvm.avm.fmodf(float,float)` | `SYS 0x0E` | `q0 = x`, `q1 = y` | `q0` |
| `llvm.avm.memcpy(ptr,ptr,i16)` | `SYS 0x0F` | `r4 = dst`, `r5 = src`, `r6 = n` | tied `r4 = dst` |
| AS0-destination, AS1-source `llvm.memcpy` | `SYS 0x10` through `SYS_MEMCPY_P` | `r4 = dst`, `q3 = src`, `r5 = n` | tied `r4 = dst` |
| `llvm.avm.memset(ptr,i16,i16)` or eligible AS0 `llvm.memset` | `SYS 0x11` through `SYS_MEMSET` | `r4 = dst`, `r5 = val`, `r6 = n` | tied `r4 = dst` |

These instructions and machine pseudos are not ordinary calls and carry no
call-preserved register mask. Exact physical uses and definitions are modeled
directly. Input-only physical registers remain live across the instruction; in
particular, the binary math services preserve `q1`.

For `SYS_MEMCPY_P`, `r4` is a tied input/definition containing `dst`; `q3` and
`r5` are input-only and are preserved by the service. The pseudo retains the
AS1-read and AS0-write memory operands, aliasing information, volatility, and
ordering constraints of the generic `llvm.memcpy`.

For `SYS_MEMSET`, `r4` is a tied input/definition containing `dst`; `r5` and
`r6` are input-only and are preserved by the service. Only `low8(r5)` affects
memory. The pseudo retains the AS0 destination memory operand, aliasing
information, volatility, and ordering constraints of the originating memset
operation.

Generic LLVM math intrinsics and recognized libcalls MAY lower directly to
these services when their required semantics match the service definitions in
Section 49.5. Recognized AS0-to-AS0 `memcpy` operations MAY lower to service
`0x0F`. AS0-destination, AS1-source nonvolatile `llvm.memcpy` operations MAY
lower to service `0x10` when their size and legality make the service preferable
to an inline `LDP*`/store sequence. Recognized nonvolatile AS0 `memset`
operations MAY lower to service `0x11` when preferable to an inline store
sequence.

### 59.2. Optimization and scheduling

`debug_putc`, `debug_break`, `millis`, and `millis32` retain the observable or
evolving-state constraints specified in Sections 49.1-49.4. They have no AVM
memory effects but retain a chain or unmodeled side effect. `debug_break` is a
scheduling barrier at its source position.

The floating-point math services are deterministic, have no AVM memory effects,
set neither `errno` nor floating-point exception state, and have no observable
side effects. They MAY be common-subexpression eliminated, duplicated,
speculated, or reordered when ordinary data dependencies and the requested
floating-point semantics permit it.

The memory services have their precise address-space effects:

- `memcpy` reads address space zero and writes address space zero.
- `memcpy_P` reads address space one and writes address space zero.
- `memset` writes address space zero and reads no memory.

They MUST NOT be speculated or reordered across accesses that may alias a
written destination or, for a copy, the source. They MAY be eliminated,
combined, or otherwise transformed only when the ordinary legality rules for
the corresponding nonvolatile `memcpy` or `memset` operation permit it.

### 59.3. Source-language interfaces

Recommended target-specific C interfaces:

```c
void     __avm_debug_putc(unsigned char value);
void     __avm_debug_break(void);
uint16_t __avm_millis(void);
uint32_t __avm_millis32(void);

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
```

Clang builtins or runtime wrappers lower these interfaces to the target
intrinsics. The target math library MAY expose the standard C names `sinf`,
`cosf`, `atan2f`, `tanf`, `expf`, `logf`, `log2f`, `log10f`, `powf`, `hypotf`,
and `fmodf` as wrappers or aliases for the corresponding services.

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

## 60. Code model and C++ policy

The default code model is large. The supported relocation model is static.

Source-level direct jumps and calls normally use the relaxable pseudos `JMP symbol` and `CALL symbol`, allowing the linker to choose the shortest valid form for the final 24-bit layout. Exact-width forms use the distinct mnemonics `JMP8`, `JMP16`, `JMPF`, `CALL8`, `CALL16`, and `CALLF`.

The initial C++ environment supports:

- Classes and member functions.
- Templates.
- Virtual dispatch.
- Static constructors and destructors.
- Placement `new`.
- Function overloading.

Exceptions, RTTI, general dynamic allocation, and thread-local storage are disabled.

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
| `t` | Canonical `PROGPTR` backed by `GPR32` |
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
e_flags   = EF_AVM_ABI_V1 = 0x00000001
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

1. If a valid persistent save object is available, copy exactly `saveSize`
   bytes from that object to data address `0x0100`.
2. Otherwise, copy the default `.saved` initializer from program address
   `0x000100` to data address `0x0100`.
3. Always copy the remaining `dataSize - saveSize` ordinary initializer bytes
   from program address `0x000100 + saveSize` to data address
   `0x0100 + saveSize`.

No static clearing pass is performed because all static bytes have explicit
initializer bytes.

General-purpose registers are unspecified at raw image entry unless a higher-level runtime ABI states otherwise.

## 71.1. Persistent save storage

The persistent program-visible range is exactly:

```text
data address 0x0100 through 0x0100 + saveSize - 1
```

It corresponds to the linked `.saved` section and is always a contiguous prefix
of static storage.

A save operation persists exactly those `saveSize` bytes. A load operation
restores exactly those bytes and does not modify the following ordinary
`.data` range.

When no valid persistent object exists, the image’s `.saved` initializer
provides the initial value. This permits both explicitly initialized and
zero-initialized saved global variables.

A packer or storage backend MAY reserve a larger physical erase unit, but bytes
beyond `saveSize` are not part of the program-visible save object.

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
- Noncanonical indirect pointers.
- Unsupported system-service identifiers.
- Invalid image header, tail, sizes, CRC, or padding.
- A flat image larger than `0xFFFF00` bytes or an overflowing 16-bit `imagePageCount`.
- Invalid persistent save-object size, format, or integrity when a save object is present.
- Relocation overflow.
- Unsupported TLS, common symbols, or dynamic stack allocation.

## 73. Unchecked execution

Unchecked execution may treat the following as unrestricted undefined behavior:

- Illegal or reserved instruction.
- Malformed operand byte.
- Prohibited operand alias.
- Jump into the middle of an instruction.
- Stack overflow or underflow.
- Unsupported data-space access.
- Invalid program-space access.
- Noncanonical pointer use.
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

Version 1 uses:

```text
runtimeVersion = 1
EF_AVM_ABI_V1 = 1
```

`runtimeVersion` covers:

- Architectural state.
- Complete instruction encoding and semantics.
- Pointer representation.
- Calling convention and frame contract.
- System ABI.
- Startup contract.
- Program-visible save behavior.

After stable Version 1 binaries are published, any incompatible change requires a new `runtimeVersion` and, when object compatibility changes, a new ELF ABI flag value.

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
    dynamic alloca unsupported

LLVM:
    avm-unknown-arduboyfx
    ISA CPU avm1
    default tune CPU avm-interpreter-32u4-v1
    data layout uses P1-G0-A0
    source-level _Float16 unsupported
    ELF32 little-endian
    PTR16 uses upper-register-first allocation
    PROGPTR is canonical p1:24 backed by GPR32
    division, remainder, and binary32 arithmetic use direct instructions with stable helper fallbacks
    atomics lower to ordinary operations in the single-thread VM model
    memcpy_P lowers through generic AS0<-AS1 llvm.memcpy and SYS_MEMCPY_P
    memset lowers through llvm.avm.memset or generic llvm.memset and SYS_MEMSET

Assembly:
    GNU-style syntax
    lowercase canonical printer
    exact and relaxable control-transfer spellings
    target register and immediate constraints defined

ELF:
    EM_AVM = 0x4156
    EF_AVM_ABI_V1 = 1
    SHT_RELA only
    R_AVM_PCREL8 and R_AVM_PCREL16
    24-bit absolute relocation and iterative relaxation
    explicit program/data section flags

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
