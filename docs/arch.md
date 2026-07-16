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
| `D4` | `JMP8 rel8` | 2 | Preserve |
| `D5` | `CALL8 rel8` | 2 | Preserve |
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
| `D4` | `JMP8 rel8` | Set `PC=target` |
| `D5` | `CALL8 rel8` | Push `nextPC`; set `PC=target` |
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

A normal call may replace `c0-c3` and `CC`. The callee MUST restore every used register from `r0-r3` and MUST restore `SP` before returning.

## 41. Argument classification and register allocation

Arguments are processed in source order using four 16-bit register units:

```text
unit 0 -> c0 = r4
unit 1 -> c1 = r5
unit 2 -> c2 = r6
unit 3 -> c3 = r7
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
    i16 -> c0
    skip c1
    i32 -> q3 = c2:c3

(i16, i64):
    i16 -> c0
    i64 does not fit at aligned unit 2 -> stack
    all later arguments -> stack

(i32, i16, i16):
    i32 -> q2 = c0:c1
    i16 -> c2
    i16 -> c3

(program pointer, i32):
    pointer -> q2
    i32 -> q3
```

### 41.3. Hidden arguments

A hidden structure-result pointer is logically inserted before all source-language arguments. It is a one-unit data pointer and normally occupies `c0`.

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
| 1-2 | Direct in `c0`, with unused high bytes unspecified |
| 3-4 | Direct in `q2`, with unused high bytes unspecified |
| Greater than 4 | Hidden structure-result pointer |

For an indirect return:

- The caller allocates result storage.
- A hidden data pointer to that storage is inserted as the first argument.
- The callee writes the complete result object.
- The callee returns the same pointer unchanged in `c0`.
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
| `i8`, `bool` | `low8(c0)` |
| `i16` | `c0` |
| Data pointer | `c0` |
| `i32`, `float` | `q2 = r4:r5` |
| Program/function pointer | Canonical pointer in `q2` |
| `i64` | `r4:r7` |
| Aggregate size 1-2 | `c0` |
| Aggregate size 3-4 | `q2` |
| Aggregate size greater than 4 | Hidden result pointer; pointer returned in `c0` |

For `i8` and `bool` returns, only `low8(c0)` is defined. `high8(c0)` is unspecified.

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

LLVM IR SHOULD NOT expose a generic service-number intrinsic. Each supported service has its own typed target intrinsic as specified in Section 59.

## 49. Defined services

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

### 49.1. `debug_putc`

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
c0 = low16(elapsed_milliseconds)
```

`elapsed_milliseconds` is an implementation-maintained unsigned millisecond counter whose epoch is runtime startup. The result wraps modulo `2^16`.

The service defines the complete 16-bit `c0` register and preserves `c1-c3`, `r0-r3`, `CC`, and `SP`.

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
q2 = c0:c1 = low32(elapsed_milliseconds)
```

The result wraps modulo `2^32`.

The service defines the complete 32-bit pair `q2`, and therefore defines both `c0` and `c1`. It preserves `c2-c3`, `r0-r3`, `CC`, and `SP`.

Each invocation observes the current timer state. Calls MUST NOT be removed, duplicated, speculated, common-subexpression eliminated, or hoisted from their program-order position.

---

# Part IX — LLVM and Clang Target Contract

## 50. Target identity

```text
target triple: avm-unknown-arduboyfx
EM_AVM:        0x4156
CPU name:      avm1
```

Version 1 defines no optional subtarget features and no feature-dependent ABI variants.

## 51. LLVM address spaces

```text
address space 0 = 16-bit data space
address space 1 = 24-bit program space
```

Functions reside in address space one.

Unqualified C data pointers use address space zero.

A target extension such as `__flash` should produce an address-space-one pointer.

## 52. LLVM data layout

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

## 53. LLVM register classes

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

`CPTR16` is used only by final encodings that require a compact pointer.

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
| `f32` | `GPR32` | Soft-float/custom libcall until direct ISA support exists |
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
| `UDIV`, `SDIV` | Promote to `i16` helper | Helper | Helper | Helper |
| `UREM`, `SREM` | Promote to `i16` helper | Helper | Helper | Helper |
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
| `MEMCPY`, `MEMMOVE`, `MEMSET` | Inline small constants; helper otherwise | — | — | — |

Variable-shift instructions may mask their hardware count. Selecting them is valid when the excess-count cases are already undefined or poison under LLVM semantics, or when the backend has explicitly constrained the count.

Program-pointer arithmetic is lowered as unsigned 24-bit arithmetic in `GPR32`, followed by canonicalization of bits `31:24` when required.

Future direct division, remainder, and floating-point instructions may replace helper calls during instruction selection without changing the language ABI or helper signatures.

## 56. Runtime helper ABI

Runtime helpers use the ordinary AVM calling convention.

Pure arithmetic helpers:

- Preserve `r0-r3` and `SP`.
- May clobber `c0-c3` and `CC`.
- Have no data-memory side effects.
- Are nonthrowing and return normally for defined inputs.

Division by zero and signed overflow in `INT_MIN / -1` have no guaranteed result because the corresponding LLVM operations are undefined or poison for those inputs.

### 56.1. Integer division and remainder helpers

```c
uint16_t __avm_udivhi3(uint16_t, uint16_t);
int16_t  __avm_divhi3(int16_t, int16_t);
uint16_t __avm_umodhi3(uint16_t, uint16_t);
int16_t  __avm_modhi3(int16_t, int16_t);

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

### 56.3. Floating-point helpers

`float`, `double`, and `long double` all use the 32-bit IEEE-754 binary32 ABI representation.

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

`__avm_cmpsf2` returns:

```text
-1  left < right
 0  left == right
 1  left > right
 2  unordered because at least one operand is NaN
```

The backend lowers ordered and unordered LLVM predicates using this result.

Future floating-point ISA instructions may replace these calls without changing their signatures or source-level ABI.

### 56.4. Memory helpers

```c
void *__avm_memcpy(void *dst, const void *src, uint16_t size);
void *__avm_memmove(void *dst, const void *src, uint16_t size);
void *__avm_memset(void *dst, int16_t byte_value, uint16_t size);
```

The result is `dst`.

Memory helpers have their ordinary C memory effects and use the normal calling convention.

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

1. Prefer `CGPR16` for arguments and short-lived values when spill cost does not increase.
2. Allocate pointers from `PTR16` using compact-first order.
3. Use a general memory pseudo before physical register assignment.
4. Expand the pseudo after allocation:
   - Pointer in `r4-r7`: fast compact-pointer encoding.
   - Pointer in `r0-r3`: cold `F0 6C/6D` encoding.
5. Prefer `CGPR32` for values likely to decompose into compact word operations.
6. Use `GPR32` for pair instructions accepting every `qN`.
7. Represent address-space-one values as canonical `PROGPTR`.
8. Model `CC` definitions and uses explicitly.
9. Select compact encodings after physical register assignment.
10. Place frequently accessed stack objects at low offsets.
11. Diagnose statically provable stack use above 256 bytes.
12. Emit stack-usage metadata.

## 59. LLVM system-service intrinsics

Each defined AVM service has a dedicated target intrinsic:

```llvm
declare void @llvm.avm.debug.putc(i8 %value)
declare void @llvm.avm.debug.break()
declare i16  @llvm.avm.millis()
declare i32  @llvm.avm.millis32()
```

A generic service-number intrinsic SHOULD NOT be the public LLVM interface.

### 59.1. Intrinsic-to-machine lowering

| LLVM intrinsic | Machine encoding | Fixed physical uses | Fixed physical definitions |
|---|---|---|---|
| `llvm.avm.debug.putc(i8)` | `SYS 0` | `low8(c0)` | None |
| `llvm.avm.debug.break()` | `SYS 1` | None | None |
| `llvm.avm.millis()` | `SYS 2` | None | `c0` |
| `llvm.avm.millis32()` | `SYS 3` | None | `q2` |

These instructions are not ordinary calls and carry no call-preserved register mask. Exact physical uses and definitions are modeled directly.

### 59.2. Optimization and scheduling

All service intrinsics are side-effecting.

They MUST NOT be removed, duplicated, speculated, commoned, merged, or reordered relative to another observable service.

`millis` and `millis32` observe evolving timer state.

The intrinsics have no AVM memory effects but retain a chain or unmodeled side effect.

`debug_break` is a scheduling barrier at its source position.

### 59.3. Source-language interfaces

Recommended C interfaces:

```c
void     __avm_debug_putc(unsigned char value);
void     __avm_debug_break(void);
uint16_t __avm_millis(void);
uint32_t __avm_millis32(void);
```

Clang builtins or runtime wrappers lower these interfaces to the target intrinsics.

## 60. Code model and C++ policy

The default code model is large.

Source-level direct jumps and calls normally use the relaxable pseudos `JMP symbol` and `CALL symbol`, allowing the linker to choose the shortest valid form for the final 24-bit layout. Exact-width forms use the distinct mnemonics `JMP8`, `JMP16`, `JMPF`, `CALL8`, `CALL16`, and `CALLF`.

The initial C++ environment supports:

- Classes and member functions.
- Templates.
- Virtual dispatch.
- Static constructors and destructors.
- Placement `new`.
- Function overloading.

Exceptions, RTTI, general dynamic allocation, and thread-local storage are disabled.

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
c0-c3
q0-q3
sp
pc
cc
```

An instruction requiring a compact register prints `cN`. An instruction using an aligned pair prints `qN`.

`cN` and `qN` are accepted only where their alias class is valid.

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

Exact encoded forms use width-specific mnemonics:

```text
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
br.eq symbol
br.ne symbol
br.ult symbol
br.slt symbol
```

Relaxable pseudos emit a maximal valid sequence plus `R_AVM_RELAX`. Their operands MUST be relocatable symbolic program-target expressions, optionally with a constant addend. Pure absolute expressions are invalid for `JMP`, `CALL`, and the `BR.*` pseudos.

There is no mnemonic overloading between exact and relaxable forms:

```text
jmp8 / jmp16 / jmpf       exact encoded jumps
call8 / call16 / callf    exact encoded calls
jmp / call                relaxable symbolic pseudos
```

An exact mnemonic without `R_AVM_RELAX` is never widened or shrunk. An overflow in an exact form is an error.

### 61.6. Canonical printing and pseudos

The disassembler prints actual encoded instructions, not multi-instruction pseudos.

It may print:

```text
nop
```

for the canonical encoding `mov c0,c0`.

It does not print `MOV32`, `LSL32.1`, or synthetic `ULE`/`UGT` aliases as single instructions.

## 62. Assembly directives and symbol expressions

Required directives include:

```text
.text
.rodata
.data
.bss
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

Instruction operands select `R_AVM_PCREL8`, `R_AVM_PCREL16`, or `R_AVM_FAR24` according to the encoded form.

Sections default to one-byte alignment unless an explicit directive requires more.

## 63. Inline-assembly constraints

Required target constraints:

| Constraint | Operand class |
|---|---|
| `r` | `GPR16` |
| `c` | `CGPR16` |
| `b` | `GPR8` low-byte operand |
| `B` | `CGPR8` low-byte operand |
| `p` | `PTR16` |
| `P` | `CPTR16` |
| `q` | `GPR32` |
| `Q` | `CGPR32` |
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
{c0} ... {c3}
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
SHF_AVM_PROGSPACE = 0x00100000
SHF_AVM_DATASPACE = 0x00200000
```

For an allocated section, these flags are mutually exclusive and identify the AVM address space.

### 64.2. Standard section contracts

| Section | Type | Required flags | Address space |
|---|---|---|---|
| `.text` | `SHT_PROGBITS` | `SHF_ALLOC | SHF_EXECINSTR | SHF_AVM_PROGSPACE` | Program |
| `.rodata` | `SHT_PROGBITS` | `SHF_ALLOC | SHF_AVM_PROGSPACE` | Program |
| `.data` | `SHT_PROGBITS` | `SHF_ALLOC | SHF_WRITE | SHF_AVM_DATASPACE` | Data |
| `.bss` | `SHT_NOBITS` | `SHF_ALLOC | SHF_WRITE | SHF_AVM_DATASPACE` | Data |
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

### 64.3. Symbols and unsupported ELF features

In `ET_REL`, symbol values are section-relative.

In a linked image:

- Program-space symbols have values in `0x000000-0xFFFFFF`.
- Data-space symbols have values in `0x0000-0xFFFF`.
- Section flags identify the address space.

`STT_FUNC` symbols reside in program-space sections.

`STT_OBJECT` symbols may reside in either address space.

Default section alignment is one byte. Explicit stronger alignment is honored.

`SHN_COMMON`, thread-local-storage sections, and target small-data sections are unsupported. Tentative definitions are emitted into `.bss`.

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

For `EQ` and `NE`, the maximal relaxable sequence is:

```text
inverse-condition rel8 over JMPF
JMPF target
```

Total maximal size: six bytes.

For `ULT` and `SLT`, whose inverse conditions lack direct branch opcodes, the maximal sequence is:

```text
requested-condition rel8 to JMPF
JMP8 rel8 over JMPF
JMPF target
```

Total maximal size: eight bytes.

When the final target fits signed `rel8`, either sequence relaxes to the direct two-byte conditional branch.

If it does not fit, the linker may relax only the embedded `JMPF` to `JMP16` or `JMP8` when valid.

### 66.4. Explicit nonrelaxable forms

The exact mnemonics `JMP8`, `JMP16`, `JMPF`, `CALL8`, `CALL16`, `CALLF`, `BREQ`, `BRNE`, `BRULT`, and `BRSLT` never receive `R_AVM_RELAX` and are never widened or shrunk.

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
7. Lay out initialized writable data as one contiguous data-space prefix.
8. Lay out zero-initialized writable data immediately after it.
9. Emit the `.data` initializer bytes into the linked program image.
10. Synthesize the runtime header and tail.
11. Validate encodings, aliases, relocations, and address ranges.
12. Fill required padding bytes.

Functions, basic blocks, fallthrough, jump tables, and program data may cross any 64 KiB address boundary.

## 68. Linked-image layout

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

`.bss` occupies no bytes in the flat image.

## 69. Header

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
imagePageCount != 0
```

## 71. Startup state

A loader or runtime validates at least:

```text
header magic
supported runtimeVersion
dataSize <= staticSize <= 1024
saveSize <= 1024
valid entry point
```

It establishes:

```text
SP = 0x0A00
CC = 0
PC = entryPoint
```

It clears `staticSize` bytes beginning at data address `0x0100`, then copies `dataSize` bytes from program address `0x000100` to data address `0x0100`.

General-purpose registers are unspecified at raw image entry unless a higher-level runtime ABI states otherwise.

## 71.1. Persistent save storage

`saveSize` is an exact byte count from zero through 1,024.

When `saveSize` is nonzero, the runtime provides a persistent storage object of at least that many bytes and exposes access only through defined system services or runtime-library contracts.

Guest code MUST NOT assume a data-space address for persistent storage.

A packer MAY reserve a larger physical erase unit, but bytes beyond `saveSize` are not part of the program-visible save object.

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
- Missing persistent storage when `saveSize` is nonzero.
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
    c0-c3 are four 16-bit argument units
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
    CPU avm1
    ELF32 little-endian
    PTR16 uses compact-first allocation
    PROGPTR is canonical p1:24 backed by GPR32
    division, remainder, and float use stable helper ABIs until direct ISA support
    atomics lower to ordinary operations in the single-thread VM model

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
    .data initializer at 0x000100
    mandatory 8-byte tail
    file offsets equal logical program addresses
```
