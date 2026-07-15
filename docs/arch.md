# Arduboy Virtual Machine Interface Specification

**Status:** Version 1 design draft  
**Intended consumers:** LLVM backend, Clang target, assembler, disassembler, linker, image writer, debugger, validator, runtime library, system libraries, and conforming VM implementations

---

## 1. Scope and authority

The Arduboy Virtual Machine, abbreviated **AVM**, is a compact bytecode architecture with:

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
cN        Compact alias c0-c3
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

## 4. Compact registers

The compact aliases are:

```text
c0 = r4
c1 = r5
c2 = r6
c3 = r7
```

Compact aliases name the same storage as their corresponding `rN` registers. They exist only to select shorter instruction encodings and the preferred ABI register class.

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

Layout:

```text
0x0100                       start of .data
0x0100 + dataSize            start of .bss
0x0100 + staticSize          first byte after static storage
```

Required:

```text
0 <= dataSize <= staticSize <= 1024
```

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

### 18.1. Compact matrix byte

For primary opcodes `00-AF`:

```text
bits 3:2  destination, address, or left compact register
bits 1:0  source, address, or right compact register
```

Register code `0-3` selects `c0-c3`.

### 18.2. Full-register pair index `PAIR48`

Several dense pages omit compact/compact forms because those have one-byte encodings.

For destination/left register `d` and source/right register `s`:

```text
if d in r0-r3:
    PAIR48(d,s) = 8*d + s                    ; 00-1F

else if d in r4-r7 and s in r0-r3:
    PAIR48(d,s) = 0x20 + 4*(d-4) + s        ; 20-2F

else:
    use the one-byte compact/compact form
```

### 18.3. Compact-pointer ordinary-memory index

For compact pointer `cA` and noncompact data register `rN`, where `N=0-3`:

```text
MEM16(cA,rN) = 4*A + N
```

### 18.4. Compact-pointer postincrement-memory index

For compact pointer `cA` and any data register `rN`, where `N=0-7`:

```text
MEM32(cA,rN) = 8*A + N
```

### 18.5. Stack-offset compact index

For unsigned four-bit stack displacement `u4` and compact register `cN`:

```text
STACK64(u4,cN) = 4*u4 + N
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

---

# Part IV — Complete Opcode Map

## 19. Primary opcode map

| Primary | Encoding / instruction | Length | `CC` |
|---:|---|---:|---|
| `00-0F` | `MOV cD,cS` | 1 | Preserve |
| `10-1F` | `ADD cD,cS` | 1 | Preserve |
| `20-2F` | `SUB cD,cS` | 1 | Preserve |
| `30-3F` | `CMP cL,cR` | 1 | Replace |
| `40-4F` | `LD8U cD,[cA]` | 1 | Preserve |
| `50-5F` | `ST8 [cA],cS` | 1 | Preserve |
| `60-6F` | `LD16 cD,[cA]` | 1 | Preserve |
| `70-7F` | `ST16 [cA],cS` | 1 | Preserve |
| `80-8F` | `AND cD,cS` | 1 | Preserve |
| `90-9F` | `OR cD,cS` | 1 | Preserve |
| `A0-AF` | `XOR cD,cS` | 1 | Preserve |
| `B0-B7` | `PUSH16 rN` | 1 | Preserve |
| `B8-BF` | `POP16 rN` | 1 | Preserve |
| `C0-C3` | `LDI8 cD,imm8` | 2 | Preserve |
| `C4-C7` | `LDI16 cD,imm16` | 3 | Preserve |
| `C8-CB` | `ADDI.S8 cD,simm8` | 2 | Preserve |
| `CC-CF` | `CMPI.S8 cL,simm8` | 2 | Replace |
| `D0` | `BREQ rel8` | 2 | Preserve |
| `D1` | `BRNE rel8` | 2 | Preserve |
| `D2` | `BRULT rel8` | 2 | Preserve |
| `D3` | `BRSLT rel8` | 2 | Preserve |
| `D4` | `JMP rel8` | 2 | Preserve |
| `D5` | `CALL rel8` | 2 | Preserve |
| `D6` | `ADJSP simm8` | 2 | Preserve |
| `D7` | `SYS service8` | 2 | Service-defined; default preserve |
| `D8-DF` | Reserved | — | — |
| `E0` | `JMP16 rel16` | 3 | Preserve |
| `E1` | `CALL16 rel16` | 3 | Preserve |
| `E2` | `JMPF target24` | 4 | Preserve |
| `E3` | `CALLF target24` | 4 | Preserve |
| `E4-E7` | `JMPP qN` | 1 | Preserve |
| `E8-EB` | `CALLP qN` | 1 | Preserve |
| `EC-EE` | Reserved | — | — |
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
| `FA` | Variable-shift page | 2 | Preserve |
| `FB-FD` | Conditional-move pages | 2 | Preserve |
| `FE` | `MUL16` page | 2 | Preserve |
| `FF` | Reserved | — | — |

## 20. One-byte instruction semantics

### 20.1. Compact register matrices

For `00-AF`, the low nibble is the compact matrix from Section 18.1.

| Range | Instruction | Semantics |
|---|---|---|
| `00-0F` | `MOV cD,cS` | `cD = cS` |
| `10-1F` | `ADD cD,cS` | `cD = low16(cD + cS)` |
| `20-2F` | `SUB cD,cS` | `cD = low16(cD - cS)` |
| `30-3F` | `CMP cL,cR` | Replace `CC` from 16-bit comparison; registers unchanged |
| `40-4F` | `LD8U cD,[cA]` | `cD = zero_extend8(mem8[cA])` |
| `50-5F` | `ST8 [cA],cS` | `mem8[cA] = low8(cS)` |
| `60-6F` | `LD16 cD,[cA]` | `cD = mem16le[cA]` |
| `70-7F` | `ST16 [cA],cS` | `mem16le[cA] = cS` |
| `80-8F` | `AND cD,cS` | `cD = cD & cS` |
| `90-9F` | `OR cD,cS` | `cD = cD | cS` |
| `A0-AF` | `XOR cD,cS` | `cD = cD ^ cS` |

Canonical aliases:

```text
NOP    = MOV c0,c0
CLR cN = XOR cN,cN
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

Compact destination is selected by the low two bits of the primary opcode.

| Primary | Instruction | Semantics |
|---:|---|---|
| `C0-C3` | `LDI8 cD,imm8` | `cD = zero_extend8(imm8)` |
| `C4-C7` | `LDI16 cD,imm16` | `cD = imm16` |
| `C8-CB` | `ADDI.S8 cD,simm8` | `cD = low16(cD + sign_extend8(simm8))` |
| `CC-CF` | `CMPI.S8 cL,simm8` | Compare `cL` with `sign_extend8(simm8)` and replace `CC` |

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

The ISA directly encodes branches for `EQ`, `NE`, `ULT`, and `SLT`. Other branch conditions are formed by inversion, fallthrough selection, or operand swapping.

### 22.2. Relative branches and transfers

For all relative forms:

```text
target = nextPC + sign_extend(displacement)
```

The target is computed in the full 24-bit program address space.

| Opcode | Instruction | Action |
|---:|---|---|
| `D0` | `BREQ rel8` | Set `PC=target` if `Z=1` |
| `D1` | `BRNE rel8` | Set `PC=target` if `Z=0` |
| `D2` | `BRULT rel8` | Set `PC=target` if `C=1` |
| `D3` | `BRSLT rel8` | Set `PC=target` if `S=1` |
| `D4` | `JMP rel8` | Set `PC=target` |
| `D5` | `CALL rel8` | Push `nextPC`; set `PC=target` |
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

### 22.4. Stack adjustment and services

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

Valid secondary values are `00-8F`.

| Secondary | Encoding | Instruction | Semantics |
|---:|---|---|---|
| `00-2F` | `PAIR48(rD,rS)` | `MOV rD,rS` | `rD = rS` |
| `30-6F` | `30 + STACK64(u4,cS)` | `STSP8 [SP+u4],cS` | Store `low8(cS)` |
| `70-77` | `70 + rD` | `ZEXT8 rD` | Clear `high8(rD)` |
| `78-7F` | `78 + rD` | `SWAP8 rD` | Exchange low-byte nibbles; preserve high byte |
| `80-87` | `80 + rD` | `GETSP rD` | `rD = SP` |
| `88-8F` | `88 + rS` | `SETSP rS` | `SP = rS` |

## 25. `F2` full-register arithmetic page

Valid secondary values are `00-5F`.

| Secondary | Encoding | Instruction | Semantics |
|---:|---|---|---|
| `00-2F` | `PAIR48(rD,rS)` | `ADD rD,rS` | `rD = low16(rD + rS)` |
| `30-5F` | `30 + PAIR48(rD,rS)` | `SUB rD,rS` | `rD = low16(rD - rS)` |

Compact/compact operands use the one-byte forms.

## 26. `F3` compact-pointer byte-store, multiply, and stack-byte page

Valid secondary values are `00-7F`.

| Secondary | Encoding | Instruction | Semantics |
|---:|---|---|---|
| `00-0F` | `MEM16(cA,rS)` | `ST8 [cA],rS` for `rS=r0-r3` | Store `low8(rS)` |
| `10-1F` | `10 + 4*cD + cS` | `MULU8.W cD,cS` | `cD = unsigned8(cD) * unsigned8(cS)` |
| `20-2F` | `20 + 4*cD + cS` | `MULS8.W cD,cS` | `cD = signed8(cD) * signed8(cS)` |
| `30-3F` | `30 + 4*cD + cS` | `MULSU8.W cD,cS` | `cD = signed8(cD) * unsigned8(cS)` |
| `40-7F` | `40 + STACK64(u4,cD)` | `LDSP8U cD,[SP+u4]` | Zero-extended byte load |

The widening multiply result is the complete 16-bit product.

## 27. `F4` stack-word, shift, unary, and test page

Valid secondary values are `00-B7`.

| Secondary | Encoding | Instruction | Semantics / `CC` |
|---:|---|---|---|
| `00-3F` | `STACK64(u4,cD)` | `LDSP16 cD,[SP+u4]` | Load word; preserve |
| `40-7F` | `40 + STACK64(u4,cS)` | `STSP16 [SP+u4],cS` | Store word; preserve |
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

## 28. `F5` compare and ordinary compact-pointer memory page

Valid secondary values are `00-5F`.

| Secondary | Encoding | Instruction | Semantics / `CC` |
|---:|---|---|---|
| `00-2F` | `PAIR48(rL,rR)` | `CMP rL,rR` | Compare 16-bit values; replace |
| `30-3F` | `30 + MEM16(cA,rD)` | `LD8U rD,[cA]`, `rD=r0-r3` | Zero-extended byte load; preserve |
| `40-4F` | `40 + MEM16(cA,rD)` | `LD16 rD,[cA]`, `rD=r0-r3` | Word load; preserve |
| `50-5F` | `50 + MEM16(cA,rS)` | `ST16 [cA],rS`, `rS=r0-r3` | Word store; preserve |

Compact data registers use the one-byte primary forms.

## 29. `F6` postincrement byte-store and unary page

Valid secondary values are `00-4F`.

| Secondary | Encoding | Instruction | Semantics / `CC` |
|---:|---|---|---|
| `00-1F` | `MEM32(cA,rS)` | `ST8 [cA+],rS` | Store byte; `cA += 1`; preserve |
| `20-27` | `20 + rD` | `BSWAP16 rD` | Exchange low and high bytes; preserve |
| `28-2F` | `28 + rD` | `TST16 rD` | Compare 16-bit value with zero; replace |
| `30-3F` | `30 + 4*cD + cS` | `MUL8 cD,cS` | `cD = zero_extend8(low8(cD)*low8(cS))` |
| `40-47` | `40 + rD` | `SEXT8 rD` | Sign-extend low byte |
| `48-4F` | `48 + rD` | `NEG16 rD` | `rD = low16(-rD)` |

For `TST16`:

```text
C = 0
Z = (rD == 0)
S = (signed16(rD) < 0)
```

Stores permit `cA == rS`; the stored byte is the original source value.

## 30. `F7` postincrement word-memory and 32-bit page

Valid secondary values are `00-8F`.

| Secondary | Encoding | Instruction | Semantics |
|---:|---|---|---|
| `00-1F` | `MEM32(cA,rD)` | `LD8U rD,[cA+]` | Load byte; zero-extend; `cA += 1` |
| `20-3F` | `20 + MEM32(cA,rD)` | `LD16 rD,[cA+]` | Load word; `cA += 2` |
| `40-5F` | `40 + MEM32(cA,rS)` | `ST16 [cA+],rS` | Store word; `cA += 2` |
| `60-6F` | `60 + 4*qD + qS` | `ADD32 qD,qS` | `qD = low32(qD + qS)` |
| `70-7F` | `70 + 4*qD + qS` | `SUB32 qD,qS` | `qD = low32(qD - qS)` |
| `80-83` | `80 + qD` | `LSR32.1 qD` | Logical right shift by 1 |
| `84-87` | `84 + qD` | `ASR32.1 qD` | Arithmetic right shift by 1 |
| `88-8F` | `88 + rD` | `BOOL rD` | `rD = (rD != 0) ? 1 : 0` |

Postincrement loads reserve `rD == cA`. Stores permit `rS == cA`.

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

Compact/compact combinations are valid but noncanonical; assemblers SHOULD emit the corresponding one-byte form.

## 33. `FA` variable-shift page

Valid secondary values are `00-2F`.

Within each family:

```text
bits 3:2  destination cD
bits 1:0  count register cCount
```

| Secondary | Instruction |
|---:|---|
| `00-0F` | `SHL16V cD,cCount` |
| `10-1F` | `LSR16V cD,cCount` |
| `20-2F` | `ASR16V cD,cCount` |

The shift count is:

```text
count = low8(cCount) & 15
```

The count register is preserved. `cD == cCount` is legal; the original count is used.

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
```

Logical and shift operations operate on the stated width.

## 39. Canonical assembler pseudos

The following names do not require separate encodings:

```text
NOP         MOV c0,c0
CLR cN      XOR cN,cN
MOV32 qD,qS two MOV instructions
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
| `r4-r7` / `c0-c3` | Caller-saved |
| `r0-r3` | Callee-saved |
| `r3` | Optional frame pointer |
| `CC` | Caller-saved across ordinary function calls |
| `SP` | Restored by the callee |
| `PC` | Controlled by call, jump, tail-call, and return |

## 41. Register arguments

Arguments are assigned in 16-bit units:

```text
unit 0 -> c0 = r4
unit 1 -> c1 = r5
unit 2 -> c2 = r6
unit 3 -> c3 = r7
```

| Type | Units |
|---|---:|
| `i8` | 1 |
| `i16` | 1 |
| Data pointer | 1 |
| `i32` | 2 |
| Program/function pointer | 2 |
| `i64` | 4 |

A value that does not completely fit in the remaining units is passed entirely on the stack.

Arguments are never split between registers and stack.

## 42. Stack arguments

The caller allocates outgoing stack-argument storage before the call.

Stack arguments:

- Appear in source order at ascending addresses.
- Use natural ABI size.
- Have one-byte alignment.
- Are packed without implicit alignment gaps.

A callee entered by any call sees:

```text
SP+0  return address bits 7:0
SP+1  return address bits 15:8
SP+2  return address bits 23:16
SP+3  first stack-argument byte
```

The caller removes outgoing stack arguments after return.

## 43. Variadic functions

All arguments to a variadic function are passed on the stack, including named arguments.

Default argument promotions apply.

`va_list` is a 16-bit data pointer.

## 44. Return values

| Return type | Location |
|---|---|
| `i8`, `bool` | `low8(c0)` |
| `i16` | `c0` |
| Data pointer | `c0` |
| `i32` | `q2 = r4:r5` |
| Program/function pointer | canonical pointer in `q2` |
| `i64` | `r4:r7`, when permitted |
| Large aggregate | Hidden data-space result pointer |

For `i8` and `bool`, `high8(c0)` is unspecified.

A returned `bool` is zero or one in the low byte.

## 45. Frames and tail calls

A function saves only the callee-saved registers it uses.

Frame-pointer omission is the default.

When required, `r3` is the frame pointer established after saving its incoming value and before local allocation.

A tail call restores the current frame and transfers control without creating a new return address.

---

# Part VIII — System ABI

## 46. Service invocation

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

LLVM IR SHOULD NOT expose a generic service-number intrinsic. Each supported service has its own typed target intrinsic as specified in Section 53.

## 47. Defined services

| ID | Name | Inputs | Results | Other clobbers |
|---:|---|---|---|---|
| `0` | `debug_putc` | `low8(c0)` | None | None |
| `1` | `debug_break` | None | None | None |
| `2` | `millis` | None | `c0` | None |
| `3` | `millis32` | None | `q2 = c0:c1` | None |
| `4-255` | Reserved | — | — | — |

All four defined services preserve:

```text
CC
SP
every general-purpose register not listed as a result
```

### 47.1. `debug_putc`

Encoding:

```text
D7 00
```

Input:

```text
low8(c0) = byte to emit
```

The service emits one byte to the implementation-defined debug output stream.

The service reads only `low8(c0)`. It preserves the complete value of `c0`, including `high8(c0)`, and preserves every other architectural register and state item.

The output operation is externally observable. It MUST NOT be removed, duplicated, speculated, combined with another call, or reordered across another observable system service.

### 47.2. `debug_break`

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

### 47.3. `millis`

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
c0 = low16(elapsed_milliseconds)
```

`elapsed_milliseconds` is an implementation-maintained unsigned millisecond counter whose epoch is runtime startup. The result wraps modulo `2^16`.

The service defines the complete 16-bit `c0` register and preserves `c1-c3`, `r0-r3`, `CC`, and `SP`.

Each invocation observes the current timer state. Calls MUST NOT be removed, duplicated, speculated, common-subexpression eliminated, or hoisted from their program-order position.

### 47.4. `millis32`

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
q2 = c0:c1 = low32(elapsed_milliseconds)
```

The result wraps modulo `2^32`.

The service defines the complete 32-bit pair `q2`, and therefore defines both `c0` and `c1`. It preserves `c2-c3`, `r0-r3`, `CC`, and `SP`.

Each invocation observes the current timer state. Calls MUST NOT be removed, duplicated, speculated, common-subexpression eliminated, or hoisted from their program-order position.

---

# Part IX — LLVM and Clang Target Contract

## 48. Target identity

```text
target triple: avm-unknown-arduboyfx
EM_AVM:        0x4156
```

## 49. LLVM address spaces

```text
address space 0 = 16-bit data space
address space 1 = 24-bit program space
```

Functions reside in address space one.

Unqualified C data pointers use address space zero.

A target extension such as `__flash` should produce an address-space-one pointer.

## 50. LLVM data layout

```text
e-m:e-p:16:8-p1:24:8-i8:8-i16:8-i32:8-i64:8-f16:8-f32:8-n8:16-S8
```

Meaning:

- Little-endian.
- Address-space-zero pointers are 16 bits.
- Address-space-one pointers are 24 bits.
- Scalar ABI alignment is one byte.
- Native integer widths are 8 and 16 bits.
- Stack alignment is one byte.

## 51. LLVM register classes

Required physical register classes are:

```text
GPR16   = r0-r7
CGPR16  = r4-r7

GPR8    = low-byte subregisters of r0-r7
CGPR8   = low-byte subregisters of r4-r7

PTR16   = r0-r7
CPTR16  = r4-r7

GPR32   = q0-q3
CGPR32  = q2-q3
```

Class relationships:

```text
CGPR16  is a subclass of GPR16
CGPR8   is a subclass of GPR8
CPTR16  has the same members as CGPR16
CGPR32  is a subclass of GPR32
```

`PTR16` contains every register that may legally hold a data pointer. Its preferred allocation order is:

```text
r4, r5, r6, r7, r0, r1, r2, r3
```

This compact-first order improves selection of fast compact-pointer memory instructions without making noncompact pointers illegal.

`CPTR16` is used only by instructions whose final encoding requires a compact pointer.

The 32-bit pair classes are:

```text
q0 = r0:r1
q1 = r2:r3
q2 = r4:r5
q3 = r6:r7
```

Each `qN` aliases both constituent 16-bit registers. `CGPR32` identifies pairs whose two constituent registers are compact.

Recommended subregister indices are:

```text
sub_lo16
sub_hi16
```

The byte classes alias only the low-byte subregisters of the corresponding 16-bit registers. They are not independently allocatable storage.

Instructions that define a zero-extended or sign-extended byte result define the complete `GPR16` destination, not merely a `GPR8` subregister. Examples include:

```text
LD8U
LD8S
LDI8
ZEXT8
SEXT8
BOOL
CSET
MUL8
```

Instructions that modify only the low byte while preserving the high byte may use a `GPR8` definition. `SWAP8` is the primary example.

Program and function pointers use the same physical members as `GPR32` but carry the canonical-value invariant:

```text
bits 31:24 = 0
```

The backend SHOULD model these values through a semantic operand class or value type named:

```text
PROGPTR
```

`PROGPTR` may be implemented as:

- A distinct operand type backed by `GPR32`.
- A custom `p1:24` value lowered into `GPR32`.
- A canonicalization pseudo plus `GPR32`.

A separate physical register class is not required because `PROGPTR` has the same physical members as `GPR32`.

`CC`, `SP`, and `PC` are nonallocatable architectural state.

## 52. Legalization and instruction selection

Directly representable values include:

```text
i8
i16
i32
p0:16
```

Program pointers are custom-lowered:

```text
p1:24
```

The backend should:

1. Prefer `CGPR16` for arguments and short-lived scalar values when doing so does not increase spill cost.
2. Allocate pointer-valued virtual registers from `PTR16` using compact-first allocation order.
3. Use `CPTR16` only for instructions whose final machine encoding requires a compact pointer.
4. Use a general pointer pseudo before physical register assignment when the final fast or cold memory form depends on the assigned register.
5. Expand that pseudo after physical register assignment:
   - Pointer in `r4-r7`: select the fast compact-pointer form.
   - Pointer in `r0-r3`: select `F0 6C` or `F0 6D`.
6. Prefer `CGPR32` for values likely to benefit from decomposition into compact 16-bit operations.
7. Use `GPR32` for direct pair operations that accept every `qN`.
8. Represent address-space-one and function-pointer values as canonical `PROGPTR` values backed by `GPR32`.
9. Model `CC` definitions and uses explicitly.
10. Select compact encodings after physical register assignment.
11. Relax branches and calls after layout.
12. Place frequently accessed stack objects at low offsets.
13. Diagnose statically provable VM-stack use above 256 bytes.
14. Emit stack-usage metadata.

A typical pre-allocation memory pseudo accepts:

```text
data register: GPR16
pointer:       PTR16
```

After allocation it becomes either:

```text
fast compact-pointer instruction
```

or:

```text
cold F0 6C/6D instruction
```

This avoids forcing every pointer into `CPTR16` and avoids unnecessary pointer copies.

`i64` and unsupported floating-point operations are expanded or lowered to runtime helpers.

## 53. LLVM system-service intrinsics

Each defined AVM service SHOULD have a dedicated target intrinsic.

Recommended LLVM IR interfaces:

```llvm
declare void @llvm.avm.debug.putc(i8 %value)
declare void @llvm.avm.debug.break()
declare i16  @llvm.avm.millis()
declare i32  @llvm.avm.millis32()
```

A generic intrinsic such as:

```llvm
declare ... @llvm.avm.sys(i8 %service, ...)
```

SHOULD NOT be used as the public target interface because it cannot express service-specific types, fixed-register constraints, clobbers, or optimization behavior precisely.

### 53.1. Intrinsic-to-machine lowering

| LLVM intrinsic | Machine encoding | Fixed physical uses | Fixed physical definitions |
|---|---|---|---|
| `llvm.avm.debug.putc(i8)` | `SYS 0` | `low8(c0)` | None |
| `llvm.avm.debug.break()` | `SYS 1` | None | None |
| `llvm.avm.millis()` | `SYS 2` | None | `c0` |
| `llvm.avm.millis32()` | `SYS 3` | None | `q2` |

The backend inserts copies between virtual values and fixed physical registers as needed.

For `debug_putc`, the argument copy targets only the low-byte subregister of `c0`; the service instruction itself has an implicit use of `low8(c0)` and no register definitions.

For `millis`, the service instruction has an implicit definition of `c0`.

For `millis32`, the service instruction has an implicit definition of `q2`, which aliases definitions of both `c0` and `c1`.

These machine instructions are not ordinary function calls and SHOULD NOT carry a call-preserved register mask. Their exact physical uses and definitions are represented directly.

### 53.2. Register and state modeling

The machine-level service instructions have these operand effects:

```text
SYS_DEBUG_PUTC:
    implicit-use low8(c0)
    no implicit register definitions
    preserve CC and SP

SYS_DEBUG_BREAK:
    no implicit register uses
    no implicit register definitions
    preserve CC and SP

SYS_MILLIS:
    implicit-def c0
    no other register definitions
    preserve CC and SP

SYS_MILLIS32:
    implicit-def q2
    no other register definitions
    preserve CC and SP
```

A live value occupying a fixed argument or result register is handled through normal register allocation, copying, spilling, or live-range splitting. The fact that a service itself preserves a register does not prevent an argument setup copy from replacing the previous value in that register.

### 53.3. Optimization and scheduling attributes

All four intrinsics are semantically side-effecting target operations.

The backend and middle end MUST NOT:

- Remove an invocation whose result is unused.
- Duplicate an invocation.
- Speculate an invocation.
- Common-subexpression eliminate repeated invocations.
- Merge adjacent invocations.
- Reorder invocations relative to other observable system services.

`millis` and `millis32` access evolving external timer state. Equal argument lists do not imply equal results.

The intrinsics do not access the AVM data or program address spaces and may be modeled as having no LLVM memory effects. They must nevertheless retain an explicit side-effect or chain dependency. Suitable target representations include:

- A target intrinsic marked as having side effects and no memory access.
- A chain-carrying SelectionDAG node.
- A side-effecting GlobalISel generic or target instruction.
- A `MachineInstr` with unmodeled side effects and exact implicit operands.

`debug_break` SHOULD additionally be treated as a scheduling barrier at its source position.

### 53.4. Clang and runtime-library exposure

Source-language interfaces SHOULD be provided through target builtins or freestanding runtime declarations rather than requiring applications to name LLVM intrinsics directly.

Recommended C interfaces:

```c
void     __avm_debug_putc(unsigned char value);
void     __avm_debug_break(void);
uint16_t __avm_millis(void);
uint32_t __avm_millis32(void);
```

A Clang builtin or runtime wrapper lowers each interface to its corresponding LLVM intrinsic.

The ordinary C signatures do not expose fixed register assignments. Those assignments are properties of target lowering, not the source-language calling convention.

## 54. Code model and C++ policy

The default code model is large.

Direct calls and jumps should use relaxable relocations so the linker can choose the shortest valid form for the final 24-bit layout.

The initial C++ environment should support:

- Classes and member functions.
- Templates.
- Virtual dispatch.
- Static constructors and destructors.
- Placement `new`.
- Function overloading.

Exceptions, RTTI, and general dynamic allocation are normally disabled.

---

# Part X — ELF, Linker, and Image Contract

## 55. Relocatable object format

The toolchain uses little-endian ELF32 relocatable objects.

Recommended sections:

```text
.text
.rodata
.data
.bss
.init_array
.fini_array
.avm.metadata
.debug_*
```

`.text`, `.rodata`, constructor tables, and immutable metadata reside in program space.

`.data` and `.bss` receive data-space virtual addresses beginning at `0x0100`.

## 56. Relocations

```text
R_AVM_NONE
R_AVM_DATA16
R_AVM_PROG24
R_AVM_PROG_LO16
R_AVM_PROG_HI8
R_AVM_PCREL8
R_AVM_FAR24
R_AVM_RELAX
```

| Relocation | Purpose |
|---|---|
| `R_AVM_DATA16` | Absolute data-space address |
| `R_AVM_PROG24` | Packed 24-bit logical program address |
| `R_AVM_PROG_LO16` | Low 16 bits of a program address |
| `R_AVM_PROG_HI8` | Bits `23:16` of a program address |
| `R_AVM_PCREL8` | Signed relative control-flow displacement |
| `R_AVM_FAR24` | Packed 24-bit absolute control-flow target |
| `R_AVM_RELAX` | Linker relaxation marker |


## 57. Linker responsibilities

The linker must:

1. Lay out code and program-resident data anywhere within the flat 24-bit program space.
2. Ensure that no instruction or program object extends beyond `0xFFFFFF`.
3. Ensure every control-flow target is a valid instruction boundary.
4. Satisfy alignment requirements for address-taken and explicitly aligned symbols.
5. Cluster related functions and data for locality when profitable.
6. Insert veneers or thunks only when required by displacement or encoding limits.
7. Relax calls, jumps, and conditional transfers after layout.
8. Lay out initialized writable data as one contiguous prefix.
9. Lay out zero-initialized writable data immediately after it.
10. Synthesize the runtime header and tail.
11. Validate instruction encodings, operand aliases, relocations, and address-range invariants.
12. Fill unused runtime bytes with the required padding.

The linker places no 64 KiB boundary restrictions on functions, basic blocks, fallthrough, jump tables, or program data.

## 58. Linked-image layout

The executable image is a flat little-endian binary:

```text
0x000000-0x0000FF                           fixed header
0x000100-0x000100+dataSize-1                .data initializer
...-programStart-1                          0xFF padding
programStart-...                            program-space contents
...-fileSize-9                              0xFF final padding
fileSize-8-fileSize-1                       mandatory tail
```

Definitions:

```text
programStart = align_up(0x000100 + dataSize, 0x100)
fileSize     = align_up(endOfPayload + 8, 0x100)
file offset  = logical program address
fileSize mod 0x100 = 0
```

`.bss` occupies no bytes in the image.

## 59. Header

The header is exactly 256 bytes.

| Offset | Size | Field | Description |
|---:|---:|---|---|
| `0x00` | 4 | `magic` | `41 56 4D 01` |
| `0x04` | 1 | `runtimeVersion` | Execution-contract version |
| `0x05` | 3 | `entryPoint` | Logical runtime entry address |
| `0x08` | 2 | `dataSize` | Initialized static bytes |
| `0x0A` | 2 | `staticSize` | Total `.data + .bss` bytes |
| `0x0C` | 2 | `saveSize` | Requested persistent bytes |
| `0x0E` | 238 | `reserved` | Must be zero |
| `0xFC` | 4 | `headerCrc32` | CRC of bytes `0x00-0xFB` |

`headerCrc32` uses CRC-32/ISO-HDLC and is stored little-endian.

## 60. Tail locator

The final eight bytes are:

| Tail offset | Size | Field | Description |
|---:|---:|---|---|
| `+0x00` | 4 | `magic` | `41 56 54 01` |
| `+0x04` | 2 | `imagePageCount` | File size in 256-byte pages |
| `+0x06` | 2 | `reserved` | Must be zero |

Required:

```text
imagePageCount = fileSize / 256
imagePageCount != 0
```

## 61. Startup state

A loader or runtime validates at least:

```text
header magic
supported runtimeVersion
dataSize <= staticSize <= 1024
saveSize <= 1024
valid entry point
```

It then establishes:

```text
SP = 0x0A00
CC = 0
PC = entryPoint
```

It clears `staticSize` bytes beginning at data address `0x0100`, then copies `dataSize` bytes from program address `0x000100` to data address `0x0100`.

General-purpose registers are unspecified at raw image entry unless a higher-level runtime ABI states otherwise.


## 61.1. Persistent save storage

`saveSize` is an exact byte count from zero through 1,024.

When `saveSize` is nonzero, the runtime provides a persistent storage object of at least that many bytes and exposes access only through defined system services or runtime-library contracts.

Guest code MUST NOT assume a data-space address for persistent storage.

A packer MAY reserve a larger physical erase unit, but bytes beyond `saveSize` are not part of the program-visible save object.
---

# Part XI — Validation, Undefined Behavior, and Versioning

## 62. Validation requirements

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
- `programStart` or `entryPoint` outside the linked payload.
- Missing persistent storage when `saveSize` is nonzero.

## 63. Unchecked execution

Unchecked execution may treat the following as unrestricted undefined behavior:

- Illegal or reserved instruction.
- Malformed operand byte.
- Prohibited operand alias.
- Jump into the middle of an instruction.
- Instruction or object placement beyond the 24-bit program-space limit.
- Stack overflow or underflow.
- Unsupported data-space access.
- Invalid program-space access.
- Noncanonical pointer use.
- Corruption of runtime-reserved data.

Distribution tooling SHOULD validate bytecode before packaging.

## 64. Versioning

The linked image carries:

```text
header magic[3]  file-layout revision
tail magic[3]    tail-locator revision
runtimeVersion   complete execution-contract revision
```

Version 1 uses:

```text
runtimeVersion = 1
```

`runtimeVersion` covers:

- Architectural state.
- Complete instruction encoding and semantics.
- Pointer representation.
- Calling convention.
- System ABI.
- Startup contract.
- Program-visible save behavior.

After stable Version 1 binaries are published, any incompatible change requires a new `runtimeVersion`.

---

# Part XII — Consolidated Interface Summary

```text
Registers:
    r0-r7, 16 bits each
    c0-c3 alias r4-r7
    q0-q3 alias aligned register pairs

Special state:
    PC  24 bits
    SP  16 bits
    CC  C/Z/S condition bits

Address spaces:
    AS0 data, 16-bit pointers
    AS1 program, 24-bit pointers, read-only

Calling convention:
    c0-c3 caller-saved arguments/results
    r0-r3 callee-saved
    r3 optional frame pointer
    three-byte return addresses

ISA:
    one-byte compact matrices at 00-AF
    immediate/control primaries at B0-EF
    secondary pages F0-FE
    FF reserved

Flags:
    CMP, CMPI.S8, CMP32, TST8, TST16 replace CC
    every other instruction preserves CC

Image:
    256-byte header
    .data initializer at 0x000100
    mandatory 8-byte tail
    file offsets equal logical program addresses

Toolchain:
    avm-unknown-arduboyfx
    ELF32 little-endian
    EM_AVM = 0x4156
    PTR16 uses r0-r7 with compact-first allocation
    CPTR16 uses r4-r7 for compact-pointer-only encodings
    GPR32 uses q0-q3
    CGPR32 uses q2-q3
    PROGPTR is a canonical 24-bit value backed by GPR32
```
