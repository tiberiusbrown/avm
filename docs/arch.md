# Arduboy Virtual Machine Architecture

**Status:** Version 1 design draft
**Target host:** ATmega32U4-based Arduboy FX
**Intended consumers:** AVR assembly interpreter, LLVM backend, Clang target, assembler, linker, image packer, debugger, and runtime library

---

## 1. Scope

The Arduboy Virtual Machine, abbreviated **AVM**, is a compact bytecode architecture designed to execute applications directly from external SPI flash on an ATmega32U4.

The architecture is optimized for:

* Bytecode programs and immutable assets larger than 64 KiB.
* Sequential bytecode streaming from SPI flash.
* One-byte encodings for high-frequency operations.
* Approximately 8–10 AVR cycles of execution work between byte fetches.
* A completely handwritten AVR assembly interpreter.
* Eight virtual registers permanently resident in native AVR registers.
* A fixed, operand-specialized dispatch table.
* Direct mapping of VM data pointers to ATmega32U4 data-space addresses.
* A custom LLVM and Clang target.
* C and a useful freestanding subset of C++.
* Static allocation only; no heap is provided.

The architecture does not attempt to:

* Provide memory protection in optimized execution mode.
* Provide a dynamically allocated heap.
* Guarantee constant instruction timing.
* Efficiently support unrestricted 64-bit arithmetic.
* Support an individual function larger than 64 KiB.
* Support self-modifying code.

---

## 2. Host constraints and design rationale

The ATmega32U4 data address space places the 32 native CPU registers at `0x0000–0x001F`, I/O and extended I/O below `0x0100`, and 2,560 bytes of internal SRAM at `0x0100–0x0AFF`. Native register-indirect addressing can address the register file as data memory, and only the native `Y` and `Z` pointer registers support displacement addressing. ([Microchip][1])

The device also provides three general-purpose I/O registers. `GPIOR1` and `GPIOR2` are within the range accessible by the one-cycle `IN` and `OUT` instructions, making them suitable for persistent interpreter state that is not needed by every handler. ([Microchip][1])

The native AVR instruction set has important register asymmetries:

* Immediate ALU operations generally require native registers `r16–r31`.
* `ADIW` and `SBIW` operate only on pairs beginning at `r24`, `r26`, `r28`, or `r30`.
* `MULS` uses the high native register set.
* `MULSU` is restricted to native registers `r16–r23`.
* Native multiplication places its result in `r1:r0`.

These restrictions motivate placing the AVM compact-register class in native `r16–r23`, placing the logical PC in `r24:r25`, and reserving native `r0:r1` as dispatch and multiply scratch. ([Microchip][2])

---

## 3. Terminology and notation

The words **MUST**, **MUST NOT**, **SHOULD**, and **MAY** describe architectural requirements and recommendations.

Notation used throughout this specification:

```text
rN      One of the eight 16-bit architectural registers r0–r7
bN      The low byte of rN
cN      One of the four compact-register aliases c0–c3
PC      Sixteen-bit offset of the current instruction
CB      Current code bank
PB      Program-address bank latch
SP      VM stack pointer
FLAGS   VM condition-code register
```

Multi-byte values use little-endian order unless explicitly stated otherwise.

Instruction operands are written in assembly order:

```text
OP destination, source
```

Memory operands use brackets:

```text
LD8 rD, [rA]
ST8 [rA], rS
```

---

# Part I — Architectural State

## 4. General-purpose registers

AVM has eight 16-bit general-purpose registers:

```text
r0  r1  r2  r3  r4  r5  r6  r7
```

Every register may hold:

* A 16-bit integer.
* A directly mapped data-space pointer.
* One word of a larger integer.
* Part of a 24-bit program pointer.
* Two unrelated byte values when managed explicitly by the compiler, though only the low byte is directly named by the ISA.

The low byte of each register is named:

```text
b0  b1  b2  b3  b4  b5  b6  b7
```

There are no independently allocated 8-bit registers. `bN` aliases bits `7:0` of `rN`.

---

## 5. Compact-register aliases

The four compact aliases correspond to architectural registers `r4–r7`:

```text
c0 = r4
c1 = r5
c2 = r6
c3 = r7
```

The compact-register field encoding is:

| Field | Alias | Architectural register |
| ----: | ----- | ---------------------- |
|  `00` | `c0`  | `r4`                   |
|  `01` | `c1`  | `r5`                   |
|  `10` | `c2`  | `r6`                   |
|  `11` | `c3`  | `r7`                   |

The `c0–c3` names do not identify additional storage. They indicate that an instruction uses a two-bit register field.

Primary instructions should generally be written using compact names:

```asm
ADD   c0, c1
LD8   c2, [c3]
CMP16 c0, c2
```

Equivalent architectural-register syntax may be accepted by the assembler:

```asm
ADD r4, r5
```

The disassembler should prefer compact names for instructions encoded in compact form.

---

## 6. Native AVR register assignment

The interpreter uses the following native register assignment:

```asm
; ------------------------------------------------------------
; Native dispatch and interpreter state
; ------------------------------------------------------------

AVR r0-r1      Native MUL result
               Dispatch table offset
               General temporary scratch

AVR r2         Permanent zero
               SPI dummy-transmit byte

AVR r3         AVM FLAGS

AVR r4         Interpreter scratch

AVR r5         Interpreter scratch

AVR r6         Current bytecode opcode
               Operand or secondary-opcode scratch

AVR r7         Constant
               Primary dispatch-slot multiplier in AVR words

; ------------------------------------------------------------
; AVM general-purpose register file
; ------------------------------------------------------------

AVR r8-r9      AVM r0
AVR r10-r11    AVM r1
AVR r12-r13    AVM r2
AVR r14-r15    AVM r3

AVR r16-r17    AVM r4 = c0
AVR r18-r19    AVM r5 = c1
AVR r20-r21    AVM r6 = c2
AVR r22-r23    AVM r7 = c3

; ------------------------------------------------------------
; Addressing and dispatch
; ------------------------------------------------------------

AVR r24-r25    AVM PC

AVR r26-r27    X
               General interpreter address scratch

AVR r28-r29    Y
               AVM SP

AVR r30-r31    Z
               Dispatch target
               Secondary-table target
               General address scratch

; ------------------------------------------------------------
; Persistent bank state
; ------------------------------------------------------------

GPIOR1         CB
GPIOR2         PB
```

The mapping of an architectural register to the native AVR register file is regular:

```text
AVM rN low byte  = AVR r(8 + 2N)
AVM rN high byte = AVR r(9 + 2N)
```

Examples:

```text
AVM r0 → AVR r8:r9
AVM r3 → AVR r14:r15
AVM r4 → AVR r16:r17
AVM r7 → AVR r22:r23
```

This allows generic extension handlers to calculate the native register-file data address as:

```text
native register-file address = 8 + 2 × AVM register number
```

Primary handlers MUST directly name the corresponding native registers rather than dynamically indexing the register file.

---

## 7. Program counter

The architectural execution address is 24 bits:

```text
CB:PC
```

`CB` contains bits `23:16`.

`PC` contains bits `15:0`.

At entry to an instruction handler:

```text
PC = logical address of the current primary opcode byte
```

The handler computes:

```text
nextPC = PC + encoded instruction length
```

For normal fallthrough, the handler commits:

```text
PC = nextPC
```

Relative branch and call displacements are relative to `nextPC`.

The interpreter stores `PC` in native `r24:r25`, allowing instruction-length increments through native `ADIW`.

The ordinary sequential path MUST NOT propagate PC overflow into `CB`. Linker constraints prevent valid sequential execution from crossing a 64 KiB bank boundary.

---

## 8. Current code bank

`CB` is the upper byte of the current execution address:

```text
execution address = CB:PC
```

Guest instructions do not directly read or write `CB`.

`CB` changes only through:

* Direct far jump.
* Direct far call.
* Indirect far jump.
* Indirect far call.
* Return.
* Interpreter startup.
* Debugger or trap recovery.

Near branches, near calls, same-bank indirect control flow, and sequential execution leave `CB` unchanged.

The interpreter stores `CB` in `GPIOR1`.

---

## 9. Program-address bank latch

`PB` is a separate bank latch used to construct a program-space address:

```text
program-space access address = PB:rN
```

`PB` is used by:

* Program-data loads.
* Indirect far jumps.
* Indirect far calls.

`PB` is distinct from `CB`:

```text
CB:PC  = where bytecode is executing
PB:rN  = which program-space object is being addressed
```

Changing `PB` does not affect sequential instruction execution.

The interpreter stores `PB` in `GPIOR2`.

`PB` is caller-saved under the ABI.

---

## 10. Stack pointer

`SP` is a 16-bit directly mapped data-space pointer.

It is stored in native `Y`, `r28:r29`.

The initial value is:

```text
SP = 0x0A00
```

The VM stack grows downward into:

```text
0x0900–0x09FF
```

The address `0x0A00` is one byte beyond the top of the VM stack and is a valid initial empty-stack value. Ordinary ABI-conforming guest code must not access it, although the ISA itself does not enforce that restriction.

---

## 11. FLAGS

`FLAGS` contains the architectural condition state:

| Bit | Name | Meaning                  |
| --: | ---- | ------------------------ |
|   0 | `C`  | Carry or borrow          |
|   1 | `Z`  | Zero                     |
|   2 | `N`  | Negative                 |
|   3 | `V`  | Signed overflow          |
|   4 | `S`  | Signed result, `N xor V` |
| 5–7 | —    | Reserved                 |

The interpreter stores `FLAGS` in native AVR `r3`.

Reserved bits are ignored by guest semantics.

The native dispatch sequence may modify AVR `SREG`; therefore branches MUST use saved AVM `FLAGS`, not the native status left by dispatch.

---

# Part II — Memory and Address Spaces

## 12. Data address space

AVM address space zero is the complete 16-bit ATmega32U4 data address space.

An AVM data pointer is the actual native data-space address:

```text
native data-space address = AVM pointer
```

No bias or translation is applied. The ISA permits accesses to the complete address range `0x0000–0xFFFF`, including the native AVR register file, memory-mapped I/O registers, SRAM, the framebuffer, and implementation-reserved regions. Accesses to addresses not implemented by the target device have target-defined behavior.

The runtime uses the following conventional layout:

| Address         |        Size | Conventional purpose                           |
| --------------- | ----------: | ---------------------------------------------- |
| `0x0000–0x001F` |    32 bytes | Native AVR register file                       |
| `0x0020–0x00FF` |   224 bytes | AVR I/O and extended I/O                       |
| `0x0100–0x04FF` | 1,024 bytes | Static global storage                          |
| `0x0500–0x08FF` | 1,024 bytes | Display framebuffer                            |
| `0x0900–0x09FF` |   256 bytes | VM stack                                       |
| `0x0A00–0x0AFF` |   256 bytes | Interpreter state and native AVR stack         |
| `0x0B00–0xFFFF` |           — | Unimplemented or target-specific data space    |

The null data pointer is represented as:

```text
0x0000
```

This representation does not make hardware address zero inaccessible. Source-language null dereferences remain undefined, while explicit low-level code may form and access address zero through integer conversion or direct-memory instructions.

---

## 13. Static global storage

The global region is:

```text
0x0100–0x04FF
```

The linker lays out writable static storage as one contiguous range beginning at `0x0100`:

```text
0x0100                       start of .data
0x0100 + dataSize            start of .bss
0x0100 + staticSize          first byte after static storage
```

`dataSize` is the number of initialized bytes copied from the linked image. `staticSize` is the total size of initialized and zero-initialized static storage. Therefore:

```text
0 <= dataSize <= staticSize <= 1024
bssSize = staticSize - dataSize
```

Linker-created padding inside `.data` or `.bss` is included in these sizes. Static-duration local objects, C++ static objects, compiler-generated writable data, and fixed-capacity application state are assigned within the same contiguous range.

The linker MUST reject an image whose `staticSize` exceeds 1,024 bytes.

There is no heap after `.bss`.

---

## 14. Framebuffer

The framebuffer occupies:

```text
0x0500–0x08FF
```

It is an ordinary guest-writable SRAM array of 1,024 bytes.

Its conventional Arduboy page layout is:

```text
address = 0x0500 + x + 128 × (y >> 3)
bit     = y & 7
```

The VM ISA does not assign special semantics to individual pixels. Graphics libraries and system services may operate on the fixed framebuffer range.

---

## 15. VM stack

The VM stack occupies:

```text
0x0900–0x09FF
```

It grows toward lower addresses.

A valid nonempty stack pointer lies in:

```text
0x0900–0x09FF
```

The valid empty-stack value is:

```text
0x0A00
```

No red zone exists.

Stack overflow and underflow are undefined behavior in optimized execution mode.

A diagnostic interpreter SHOULD trap stack accesses outside the VM stack.

---

## 16. Interpreter-reserved SRAM

The range:

```text
0x0A00–0x0AFF
```

is reserved by the runtime for some combination of:

* The native AVR hardware stack.
* The physical image base.
* SPI stream state.
* Runtime configuration.
* Debugger state.
* System-service state.
* Saved register state for native ABI bridges.

The ISA does not prevent a guest from addressing this range. Writing it may corrupt interpreter state and is undefined unless a separately documented system ABI explicitly assigns meaning to the access.

The implementation MUST ensure that fixed interpreter state and the descending native AVR stack cannot collide under supported interrupt and system-call nesting.

---

## 17. Raw data-space access

All ordinary indirect loads and stores, displaced loads and stores, and direct-memory instructions use raw 16-bit native data-space addresses.

Consequently:

* Low addresses may intentionally access the native register file or AVR I/O registers.
* The framebuffer is accessed through its deterministic address range rather than through framebuffer-specific instructions.
* The ISA provides no memory protection between guest data, interpreter state, and peripherals.
* Software that accesses hardware registers must account for each register's native read, write, and side-effect semantics.
* Untrusted bytecode MUST NOT be executed without validation or a separately sandboxed interpreter.

---

## 18. No heap

AVM provides no general-purpose dynamic allocation.

The standard runtime does not provide usable implementations of:

```text
malloc
calloc
realloc
free
operator new
operator delete
```

Placement `new` is permitted.

Variable-length arrays and unrestricted `alloca` SHOULD be disabled.

A user may implement a fixed-capacity allocator inside the 1 KiB global region, but such an allocator has no special architectural status.

---

## 19. Program address space

AVM address space one is a 24-bit logical, read-only program space:

```text
0x000000–0xFFFFFF
```

The first 256 bytes are reserved for the linked-image header:

```text
0x000000–0x0000FF  AVM image header
0x000100–...       Linker-placed program payload
```

The payload may contain, in any linker-selected order:

* Bytecode.
* Read-only constants.
* String literals.
* Sprite and bitmap data.
* Jump tables.
* Constructor tables.
* Initial values for `.data`.
* Function pointers.
* Optional debugger metadata.
* Other immutable assets.

The format does not require a global code region followed by a global data region. The linker may interleave or cluster code and immutable data when that improves bank placement, locality, or relaxation.

For every stored image byte, the file offset is equal to its logical program-space address. The image header is therefore addressable as program data, although ordinary source-language objects are never allocated within it.

The null program pointer is:

```text
0x000000
```

No allocatable symbol may be placed below logical address `0x000100`.

Program-space stores do not exist.

---

## 20. Physical flash translation

The loader supplies a 24-bit physical image base:

```text
imageBase
```

`imageBase` points to header byte `0x00` and MUST be aligned to 256 bytes:

```text
imageBase mod 256 = 0
```

A logical program-space address is translated as:

```text
physicalFlashAddress = imageBase + logicalProgramAddress
```

Because both the image base and the 256-byte header are page-aligned, every logical 256-byte page has the same 256-byte alignment in external flash. The first payload page begins at physical address `imageBase + 0x100`.

This addition is performed when:

* Starting the program.
* Restarting fetch after a control transfer.
* Restarting fetch after a program-data load.
* Performing a program-data access.

It is not performed for every sequential byte because the SPI flash read stream advances internally.

The loader or image packer MUST reject an image whose physical base is not 256-byte aligned or whose placement would overflow the available external-flash address range.

---

## 21. Program banks

The logical program space is divided into 256 banks:

```text
Bank 0     0x000000–0x00FFFF
Bank 1     0x010000–0x01FFFF
...
Bank 255   0xFF0000–0xFFFFFF
```

Each bank is 64 KiB.

The linker MUST enforce:

1. No instruction crosses a bank boundary.
2. No function crosses a bank boundary.
3. No basic-block fallthrough crosses a bank boundary.
4. No sequential path wraps `PC` from `0xFFFF` to `0x0000`.
5. Every bank-ending path uses an explicit control transfer.
6. Unused terminal bank space is filled with an invalid or diagnostic-fault encoding.
7. Every direct far target is two-byte aligned.
8. Every address-taken function is two-byte aligned.
9. Any basic block targeted directly from another bank is two-byte aligned or reached through an aligned veneer.

An individual function larger than 64 KiB is unsupported.

The complete program may occupy many banks.

---

## 22. Program pointers

### 22.1 Memory representation

A program pointer is three packed little-endian bytes:

```text
byte 0 = address bits 7:0
byte 1 = address bits 15:8
byte 2 = address bits 23:16
```

Program pointers have one-byte alignment.

```text
sizeof(program pointer)  = 3
sizeof(function pointer) = 3
```

### 22.2 Register representation

A program pointer held in registers consumes an even-aligned pair of 16-bit registers:

```text
low word      = address bits 15:0
high word     = zero-extended address bits 23:16
```

The canonical high word is in the range:

```text
0x0000–0x00FF
```

Preferred register pairs are:

```text
r0:r1
r2:r3
r4:r5
r6:r7
```

For example:

```text
r4 = low 16 bits
r5 = zero-extended bank byte
```

To access the pointer:

```asm
MTPB  r5
LDP8  r0, [PB:r4]
```

To call through it:

```asm
MTPB  r5
CALLP r4
```

### 22.3 Arithmetic

Program-pointer arithmetic is 24-bit unsigned arithmetic.

The compiler may lower addition as:

```text
ADD lowWord, offsetLow
ADC highWord, zeroOrOffsetHigh
```

The high word must subsequently remain canonical.

Pointer arithmetic outside the original object is governed by the source-language rules and need not receive defined wraparound behavior.

### 22.4 Address-space conversion

Data-space pointers and program pointers belong to disjoint address spaces.

Implicit conversion between them is forbidden.

Explicit integer conversion may be supported as a target extension, but no resulting cross-address-space dereference is guaranteed to be meaningful.

---

# Part III — Data Representation

## 23. Endianness and alignment

AVM is little-endian.

All scalar ABI alignments are one byte.

Unaligned 16-bit, 24-bit, 32-bit, and 64-bit objects are permitted.

The stack has one-byte alignment.

Structures receive no alignment padding beyond explicit language requirements because all target ABI alignments are one byte.

---

## 24. C and C++ data model

Recommended type sizes are:

| Type             |              Size |
| ---------------- | ----------------: |
| `bool`           |            1 byte |
| `char`           |            1 byte |
| `short`          |           2 bytes |
| `int`            |           2 bytes |
| `long`           |           4 bytes |
| `long long`      |           8 bytes |
| `float`          |           4 bytes |
| `double`         | 4 bytes initially |
| `long double`    | 4 bytes initially |
| Data pointer     |           2 bytes |
| Program pointer  |           3 bytes |
| Function pointer |           3 bytes |
| `size_t`         |           2 bytes |
| `ptrdiff_t`      |           2 bytes |
| `wchar_t`        |           2 bytes |

Plain `char` is signed by default.

`bool` values are represented canonically as zero or one.

`size_t` is 16 bits. Therefore, no single language-level object may exceed 65,535 bytes.

A program may exceed 65,535 bytes because it consists of many functions and objects.

Enums use a 16-bit signed representation by default unless short-enum behavior is explicitly requested.

---

## 25. Byte values in registers

A byte result occupies the low byte of a register.

The following instructions zero-extend byte loads or immediates into the full destination register:

```text
LD8
LD8_POST
LDSP8
LDM8
LDP8
LDI8
MFPB
```

Thus:

```text
destination bits 15:8 = 0
```

Byte stores use only the low byte of the source.

Byte comparisons and byte shifts inspect only the low byte.

Operations that conceptually produce an 8-bit wrapping result may leave noncanonical high bits when lowered through a 16-bit arithmetic operation. `ZEXT8` and `SEXT8` canonicalize such values.

---

## 26. Larger integers

A 32-bit integer uses two consecutive 16-bit words:

```text
low word
high word
```

A 64-bit integer uses four words.

The ISA provides `ADC`, `SBC`, and `CPC16` for multiword arithmetic and comparison.

There are no dedicated 32-bit or 64-bit architectural registers.

No dedicated 64-bit instructions are required. LLVM may expand operations or call compiler-runtime helpers.

---

# Part IV — Flag Semantics

## 27. General rules

Instructions not explicitly listed as flag-producing preserve all AVM flags.

Loads, stores, moves, constant loads, pointer operations, stack operations, and control transfers preserve flags.

### 27.1 Addition

`ADD` sets:

```text
C = carry out of bit 15
Z = result == 0
N = result bit 15
V = signed overflow
S = N xor V
```

### 27.2 Addition with carry

`ADC` consumes the old `C`.

It sets `C`, `N`, `V`, and `S` normally.

Its zero behavior is cumulative:

```text
new Z = old Z AND (result == 0)
```

This permits:

```asm
ADD lowDst, lowSrc
ADC highDst, highSrc
```

to produce a correct 32-bit zero flag.

### 27.3 Subtraction and comparison

For `SUB`, `CMP16`, `CMP8`, and immediate comparisons:

```text
C = 1 when an unsigned borrow occurs
Z = result == 0
N = result sign bit
V = signed overflow
S = N xor V
```

Therefore:

```text
ULT = C
UGE = !C
```

### 27.4 Subtraction with carry

`SBC` consumes `C` as an incoming borrow.

Its zero behavior is cumulative:

```text
new Z = old Z AND (result == 0)
```

### 27.5 Compare with carry

`CPC16` performs subtraction with incoming borrow but does not store the result.

It uses cumulative zero semantics.

A 32-bit comparison is:

```asm
CMP16 lowA, lowB
CPC16 highA, highB
```

### 27.6 Logical operations

`AND`, `OR`, `XOR`, `BIC`, `NOT16`, `TST16`, and `TST8`:

```text
C = preserved
Z = result == 0
N = result sign bit
V = 0
S = N
```

For byte operations, the sign bit is bit 7.

### 27.7 Increment and decrement

`INC16` and `DEC16` preserve `C`.

They update `Z`, `N`, `V`, and `S`.

### 27.8 Multiplication

Byte multiplication sets:

```text
Z = product == 0
C = product bit 15
```

`N`, `V`, and `S` are preserved.

### 27.9 Extensions and swaps

`ZEXT8`, `SEXT8`, `SWAP8`, `GETSP`, `SETSP`, `MTPB`, and `MFPB` preserve flags.

### 27.10 Negation

`NEG16` behaves as a 16-bit subtraction of the operand from zero:

```text
result = (0 - operand) mod 2^16

C = operand != 0
Z = result == 0
N = result bit 15
V = operand == 0x8000
S = N xor V
```

### 27.11 Fixed one-bit shifts

The fixed shift instructions update all five AVM flags.

`LSL16` sets:

```text
C = old operand bit 15
Z = result == 0
N = result bit 15
V = N xor C
S = N xor V
```

`LSR16` sets:

```text
C = old operand bit 0
Z = result == 0
N = 0
V = N xor C
S = N xor V
```

`ASR16` sets:

```text
C = old operand bit 0
Z = result == 0
N = result bit 15
V = N xor C
S = N xor V
```

`LSR8` and `ASR8` leave bits `15:8` of the destination unchanged, but their flags describe only the low-byte operation:

```text
C = old low-byte bit 0
Z = low8(result) == 0
N = result bit 7
V = N xor C
S = N xor V
```

For `LSR8`, `N` is necessarily zero.

### 27.12 Variable shifts

For `SHL16V`, `LSR16V`, and `ASR16V`:

```text
count = low4(source)
```

A count of zero leaves the destination and all AVM flags unchanged.

For a nonzero count, the value and flags are exactly those obtained by applying the corresponding fixed one-bit shift repeatedly `count` times. The final flags therefore come from the last one-bit shift: `C` is the last bit shifted out, while `Z`, `N`, `V`, and `S` describe the final shift step and result.

---

## 28. Branch conditions

The dedicated conditional-branch opcodes implement:

| Mnemonic | Condition                  |
| -------- | -------------------------- |
| `EQ`     | `Z == 1`                   |
| `NE`     | `Z == 0`                   |
| `ULT`    | `C == 1`                   |
| `UGE`    | `C == 0`                   |
| `SLT`    | `S == 1`                   |
| `SGE`    | `S == 0`                   |
| `ULE`    | `C == 1 or Z == 1`         |
| `UGT`    | `C == 0 and Z == 0`        |

---

# Part V — Instruction Encoding

## 29. General encoding rules

Instructions are one to four bytes long.

The first byte is the primary opcode.

Additional bytes are fetched sequentially.

Multi-byte immediates are little-endian.

Register-specifier bytes use:

```text
bit 7     = reserved, must be zero
bits 6:4  = destination
bit 3     = reserved, must be zero
bits 2:0  = source or address
```

This byte is called `RRSPEC`.

Placing the destination in bits `6:4` allows an AVR handler to bring the destination index into the low nibble with `SWAP`. Constructing the native register-file byte address is no more expensive than with bits `5:3`, while handlers that need only the register number avoid multiple shifts.

A malformed reserved encoding is:

* A trap in diagnostic mode.
* Undefined behavior in optimized mode.

---

## 30. Primary opcode map

| Range       | Instruction family                                |
| ----------- | ------------------------------------------------- |
| `0x00–0x0F` | Compact `MOV`; diagonal encodings are `CLR`       |
| `0x10–0x1F` | Compact `LD8`                                     |
| `0x20–0x2F` | Compact `ST8`                                     |
| `0x30–0x3F` | Compact `LD16`                                    |
| `0x40–0x4F` | Compact `ST16`                                    |
| `0x50–0x6F` | Reserved for profile-guided future use            |
| `0x70–0x77` | `PUSH16`                                          |
| `0x78–0x7F` | `POP16`                                           |
| `0x80–0x8F` | Compact `ADD`                                     |
| `0x90–0x9F` | Compact `SUB`                                     |
| `0xA0–0xAF` | Compact `CMP16`; diagonal encodings are `TST16`   |
| `0xB0–0xBF` | Compact `CMP8`; diagonal encodings are `TST8`     |
| `0xC0–0xCF` | One-byte short `BEQ`                              |
| `0xD0–0xDF` | One-byte short `BNE`                              |
| `0xE0–0xE7` | `INC16`                                           |
| `0xE8–0xEF` | `DEC16`                                           |
| `0xF0–0xF3` | Compact `LDI8`                                    |
| `0xF4`      | ALU, control, system, and relocated-core extension |
| `0xF5`      | `BREQ rel8`                                       |
| `0xF6`      | `BRNE rel8`                                       |
| `0xF7`      | `BRULT rel8`                                      |
| `0xF8`      | `BRUGE rel8`                                      |
| `0xF9`      | `BRSLT rel8`                                      |
| `0xFA`      | `BRSGE rel8`                                      |
| `0xFB`      | `BRULE rel8`                                      |
| `0xFC`      | `BRUGT rel8`                                      |
| `0xFD`      | Memory and program-space extension                |
| `0xFE`      | Direct far jump or call                           |
| `0xFF`      | Return                                            |

---

# Part VI — Primary Instructions

## 31. Compact field format

For compact binary families, the low nibble is:

```text
bits 3:2 = compact destination or address
bits 1:0 = compact source
```

Compact fields map to `r4–r7`.

---

## 32. `MOV` and `CLR`: `0x00–0x0F`

For differing fields:

```asm
MOV cD, cS
```

copies the complete 16-bit source.

The four diagonal encodings are reassigned:

```text
0x00  CLR c0    ; CLR r4
0x05  CLR c1    ; CLR r5
0x0A  CLR c2    ; CLR r6
0x0F  CLR c3    ; CLR r7
```

`CLR` writes `0x0000` and preserves flags.

A compact self-move is removed by the compiler or encoded using the extended `MOV` form if an explicit instruction boundary is required.

---

## 33. Compact indirect memory

### 33.1 Byte load: `0x10–0x1F`

```asm
LD8 cD, [cA]
```

Semantics:

```text
address = original cA
cD = zero_extend(memory8[address])
```

Destination and address may be the same register because the address is captured first.

### 33.2 Byte store: `0x20–0x2F`

```asm
ST8 [cA], cS
```

Stores `low8(cS)`.

### 33.3 Word load: `0x30–0x3F`

```asm
LD16 cD, [cA]
```

Loads two little-endian bytes.

The address is captured before either destination byte changes.

### 33.4 Word store: `0x40–0x4F`

```asm
ST16 [cA], cS
```

Stores the complete 16-bit source in little-endian order.

All memory operations preserve flags.

---

## 34. Reserved primary opcode space: `0x50–0x6F`

The 32 primary opcodes from `0x50` through `0x6F` are reserved.

Version-one assemblers and compilers MUST NOT emit these encodings. A diagnostic interpreter SHOULD report execution of one of these opcodes as an invalid instruction. Optimized execution may treat it as unrestricted undefined behavior.

The range is intentionally preserved as two contiguous 16-opcode blocks so that future profiling can justify complete operand-specialized compact families without fragmenting the primary map. Candidate uses must be evaluated using LLVM-generated workloads, including dynamic instruction frequency, compact-register eligibility, bytecode-size reduction, dispatch elimination, and native handler cost.

Postincrement data-space loads and stores remain available through the `0xFD` memory extension. There is no compact primary postincrement encoding and no `LDI1` primary instruction in this ISA version.

---

## 35. Stack push and pop

### 35.1 `PUSH16`: `0x70–0x77`

```asm
PUSH16 rN
```

Semantics:

```text
SP = SP - 2
memory[SP + 0] = low8(rN)
memory[SP + 1] = high8(rN)
```

### 35.2 `POP16`: `0x78–0x7F`

```asm
POP16 rN
```

Semantics:

```text
rN = memory[SP + 0] | memory[SP + 1] << 8
SP = SP + 2
```

Flags are preserved.

---

## 36. Compact arithmetic

### 36.1 `ADD`: `0x80–0x8F`

```asm
ADD cD, cS
```

Performs 16-bit addition and updates flags.

`ADD cN,cN` provides a one-bit left shift with normal addition flags.

### 36.2 `SUB`: `0x90–0x9F`

```asm
SUB cD, cS
```

Performs 16-bit subtraction and updates flags.

`SUB cN,cN` writes zero and sets arithmetic flags. It differs from `CLR`, which preserves flags.

---

## 37. Compact comparisons

### 37.1 Word compare and test: `0xA0–0xAF`

For differing fields:

```asm
CMP16 cD, cS
```

The diagonal encodings are:

```asm
TST16 cN
```

`TST16` tests the complete register against zero.

### 37.2 Byte compare and test: `0xB0–0xBF`

For differing fields:

```asm
CMP8 cD, cS
```

The low bytes are compared.

The diagonal encodings are:

```asm
TST8 cN
```

Only the low byte participates.

A source-level comparison of a value with itself should be constant-folded and must not be encoded using a diagonal compact comparison.

---

## 38. One-byte equality branches

### 38.1 `BEQ.S`: `0xC0–0xCF`

Branches when `Z == 1`.

### 38.2 `BNE.S`: `0xD0–0xDF`

Branches when `Z == 0`.

The low nibble selects a byte displacement:

| Nibble | Displacement |
| -----: | -----------: |
|  `0x0` |         `-8` |
|  `0x1` |         `-7` |
|  `0x2` |         `-6` |
|  `0x3` |         `-5` |
|  `0x4` |         `-4` |
|  `0x5` |         `-3` |
|  `0x6` |         `-2` |
|  `0x7` |         `-1` |
|  `0x8` |         `+1` |
|  `0x9` |         `+2` |
|  `0xA` |         `+3` |
|  `0xB` |         `+4` |
|  `0xC` |         `+5` |
|  `0xD` |         `+6` |
|  `0xE` |         `+7` |
|  `0xF` |         `+8` |

The target is:

```text
nextPC + displacement
```

The target MUST be an instruction boundary in the current bank.

---

## 39. Increment and decrement

```text
0xE0–0xE7  INC16 rN
0xE8–0xEF  DEC16 rN
```

These instructions support all eight registers.

They preserve `C` and update `Z`, `N`, `V`, and `S`.

---

## 40. Compact 8-bit immediate load

```text
0xF0  LDI8 c0, imm8
0xF1  LDI8 c1, imm8
0xF2  LDI8 c2, imm8
0xF3  LDI8 c3, imm8
```

Length: two bytes.

Semantics:

```text
cN = zero_extend(imm8)
```

Flags are preserved.

---

## 41. General conditional branches: `0xF5–0xFC`

Each condition has a dedicated primary opcode and handler:

| Opcode | Instruction  | Condition                  |
| -----: | ------------ | -------------------------- |
| `0xF5` | `BREQ rel8`  | `Z == 1`                   |
| `0xF6` | `BRNE rel8`  | `Z == 0`                   |
| `0xF7` | `BRULT rel8` | `C == 1`                   |
| `0xF8` | `BRUGE rel8` | `C == 0`                   |
| `0xF9` | `BRSLT rel8` | `S == 1`                   |
| `0xFA` | `BRSGE rel8` | `S == 0`                   |
| `0xFB` | `BRULE rel8` | `C == 1 or Z == 1`         |
| `0xFC` | `BRUGT rel8` | `C == 0 and Z == 0`        |

Each instruction is followed by one signed displacement byte.

Range:

```text
-128 to +127 bytes
```

The displacement is relative to `nextPC`. The target MUST be an instruction boundary in the current bank.

The condition is not encoded in the operand byte. This permits each primary handler to hardcode its flag test and leaves the complete operand byte available for the displacement.

---

# Part VII — ALU, Control, and System Extension `0xF4`

## 42. Extension encoding

`0xF4` is followed by a secondary opcode. Additional operand bytes are determined by the secondary opcode.

This page contains the former ALU, control, and system extension operations together with instructions relocated from primary opcodes `0xF4–0xFB` to make room for the dedicated conditional-branch handlers.

---

## 43. Relocated full-register and core operations

| Secondary | Instruction                 | Total length |
| --------: | --------------------------- | -----------: |
|    `0xB8` | `MOV rD,rS` + `RRSPEC`      |            3 |
|    `0xB9` | `ADD rD,rS` + `RRSPEC`      |            3 |
|    `0xBA` | `SUB rD,rS` + `RRSPEC`      |            3 |
|    `0xBB` | `CMP16 rD,rS` + `RRSPEC`    |            3 |
|    `0xBC` | `CMPI6 cN,simm6` + operand  |            3 |
|    `0xBD` | `JMP rel8`                  |            3 |
|    `0xBE` | `CALL rel8`                 |            3 |
|    `0xBF` | `ADJSP simm8`               |            3 |
|    `0xF9` | Compact `LDSP8/LDSP16`       |            3 |
|    `0xFA` | Compact `STSP8/STSP16`       |            3 |
| `0xFB–FF` | Reserved                    |            — |

The full-register operations support all eight registers. The assembler SHOULD select a one-byte compact primary encoding when one exists and is semantically equivalent. `MOV rN,rN` remains a true no-op in the full-register form.

### 43.1 Compact compare immediate

The `CMPI6` operand is:

```text
bits 7:2 = signed six-bit immediate
bits 1:0 = compact register
```

The immediate is sign-extended to 16 bits. Its range is `-32` to `+31`.

### 43.2 Relative same-bank jump and call

`JMP rel8` and `CALL rel8` use a signed displacement relative to `nextPC`, with range `-128` to `+127` bytes. `CB` is unchanged.

`CALL rel8` pushes the full 24-bit return address `CB:nextPC`.

### 43.3 Stack adjustment

`ADJSP simm8` performs:

```text
SP = SP + sign_extend(simm8)
```

Flags are preserved.

### 43.4 Compact stack-relative access

The operand format is:

```text
bit 7     width: 0 = byte, 1 = word
bits 6:5  compact register
bits 4:0  unsigned offset
```

The load secondary opcode encodes:

```asm
LDSP8  cN, [SP+u5]
LDSP16 cN, [SP+u5]
```

The store secondary opcode encodes:

```asm
STSP8  [SP+u5], cN
STSP16 [SP+u5], cN
```

Byte loads zero-extend. The effective address is calculated from the original SP. Flags are preserved.

---

## 44. Unary secondary opcodes

The register number is encoded in the low three bits of the secondary opcode.

| Secondary range | Instruction |
| --------------- | ----------- |
| `0x00–0x07`     | `NOT16 rN`  |
| `0x08–0x0F`     | `NEG16 rN`  |
| `0x10–0x17`     | `LSL16 rN`  |
| `0x18–0x1F`     | `LSR16 rN`  |
| `0x20–0x27`     | `ASR16 rN`  |
| `0x28–0x2F`     | `LSR8 rN`   |
| `0x30–0x37`     | `ASR8 rN`   |
| `0x38–0x3F`     | `ZEXT8 rN`  |
| `0x40–0x47`     | `SEXT8 rN`  |
| `0x48–0x4F`     | `SWAP8 rN`  |
| `0x50–0x57`     | `GETSP rN`  |
| `0x58–0x5F`     | `SETSP rN`  |

`GETSP` copies SP into `rN`.

`SETSP` copies `rN` into SP.

The remaining unary operations have the following value semantics:

```text
NEG16 rN: rN = (0 - rN) mod 2^16
LSL16 rN: rN = (rN << 1) mod 2^16
LSR16 rN: rN = unsigned(rN) >> 1
ASR16 rN: rN = signed(rN) >> 1
LSR8  rN: low8(rN) = unsigned(low8(rN)) >> 1
ASR8  rN: low8(rN) = signed(low8(rN)) >> 1
ZEXT8 rN: rN = zero_extend(low8(rN))
SEXT8 rN: rN = sign_extend(low8(rN))
SWAP8 rN: low8(rN) = swap_nibbles(low8(rN))
```

`LSR8`, `ASR8`, and `SWAP8` leave bits `15:8` unchanged. All source values are captured before the destination is written.

---

## 45. Binary ALU secondary opcodes

The following subopcodes are followed by `RRSPEC`:

|   Secondary | Instruction    |
| ----------: | -------------- |
|      `0x60` | `AND rD,rS`    |
|      `0x61` | `OR rD,rS`     |
|      `0x62` | `XOR rD,rS`    |
|      `0x63` | `BIC rD,rS`    |
|      `0x64` | `ADC rD,rS`    |
|      `0x65` | `SBC rD,rS`    |
|      `0x66` | `CMP8 rD,rS`   |
|      `0x67` | `CPC16 rD,rS`  |
|      `0x68` | `MULU8 rD,rS`  |
|      `0x69` | `MULS8 rD,rS`  |
|      `0x6A` | `MULSU8 rD,rS` |
|      `0x6B` | `SHL16V rD,rS` |
|      `0x6C` | `LSR16V rD,rS` |
|      `0x6D` | `ASR16V rD,rS` |
| `0x6E–0x6F` | Reserved       |

Total length: three bytes.

`BIC` means:

```text
rD = rD & ~rS
```

Variable shifts use:

```text
count = low4(rS)
```

The destination value and shift count are captured before the destination is written, so `rD` and `rS` may be the same register. `SHL16V` discards bits shifted above bit 15, `LSR16V` shifts in zeroes, and `ASR16V` shifts in copies of the sign bit.

A zero count preserves both the destination and all AVM flags. A nonzero variable shift has the same value and flags as repeatedly applying the corresponding fixed one-bit shift, with the final flags supplied by the last shift step as specified in Section 27.12.

The source-language result is only required for valid shift counts. The machine instruction itself is defined for every encoded count from 0 through 15.

`MULS8` and `MULSU8` support every architectural register, but compact registers are substantially cheaper on the native implementation. LLVM should strongly prefer `c0–c3` for signed and mixed-sign multiply operands.

---

## 46. Immediate ALU secondary opcodes

The destination register is the low three bits of the secondary opcode.

| Range       | Instruction       | Additional bytes |
| ----------- | ----------------- | ---------------: |
| `0x70–0x77` | `LDI16 rN,imm16`  |                2 |
| `0x78–0x7F` | `LDI8 rN,imm8`    |                1 |
| `0x80–0x87` | `ADDI16 rN,imm16` |                2 |
| `0x88–0x8F` | `SUBI16 rN,imm16` |                2 |
| `0x90–0x97` | `ANDI16 rN,imm16` |                2 |
| `0x98–0x9F` | `ORI16 rN,imm16`  |                2 |
| `0xA0–0xA7` | `XORI16 rN,imm16` |                2 |
| `0xA8–0xAF` | `CMPI16 rN,imm16` |                2 |
| `0xB0–0xB7` | `CMPI8 rN,imm8`   |                1 |

`LDI8` zero-extends.

The arithmetic and logical immediate instructions update flags according to their corresponding register operation.

---

## 47. Indirect control flow

| Range       | Instruction | Target  |
| ----------- | ----------- | ------- |
| `0xC0–0xC7` | `JMPR rN`   | `CB:rN` |
| `0xC8–0xCF` | `CALLR rN`  | `CB:rN` |
| `0xD0–0xD7` | `JMPP rN`   | `PB:rN` |
| `0xD8–0xDF` | `CALLP rN`  | `PB:rN` |

`JMPR` and `CALLR` are same-bank operations.

`JMPP` and `CALLP` replace both `CB` and `PC`:

```text
CB = PB
PC = rN
```

`CALLR` and `CALLP` push the full 24-bit return address.

An indirect target must be an instruction boundary.

A function pointer target must be two-byte aligned.

---

## 48. Program-bank transfer instructions

| Range       | Instruction |
| ----------- | ----------- |
| `0xE0–0xE7` | `MTPB rN`   |
| `0xE8–0xEF` | `MFPB rN`   |

Semantics:

```text
MTPB rN: PB = low8(rN)
MFPB rN: rN = zero_extend(PB)
```

Flags are preserved.

---

## 49. Miscellaneous control and system operations

|   Secondary | Instruction    | Total length |
| ----------: | -------------- | -----------: |
|      `0xF0` | `LDPBI imm8`   |            3 |
|      `0xF1` | `JMP16 abs16`  |            4 |
|      `0xF2` | `CALL16 abs16` |            4 |
|      `0xF3` | `NOP`          |            2 |
|      `0xF4` | `SYS imm8`     |            3 |
| `0xF5–0xF8` | Reserved       |            — |

`LDPBI` loads PB directly.

`JMP16` and `CALL16` use an absolute low-16-bit address in the current bank.

`SYS` invokes a service in the Arduboy system ABI. Program termination, frame yielding, debugger breaks, and explicit guest assertions or traps are system services rather than dedicated ISA instructions.

---

# Part VIII — Memory Extension `0xFD`

## 50. Generic indirect memory

The following secondary opcodes are followed by `RRSPEC`:

|   Secondary | Instruction          |
| ----------: | -------------------- |
|      `0x00` | `LD8 rD,[rA]`        |
|      `0x01` | `ST8 [rA],rS`        |
|      `0x02` | `LD16 rD,[rA]`       |
|      `0x03` | `ST16 [rA],rS`       |
|      `0x04` | `LD8_POST rD,[rA]+`  |
|      `0x05` | `ST8_POST [rA]+,rS`  |
|      `0x06` | `LD16_POST rD,[rA]+` |
|      `0x07` | `ST16_POST [rA]+,rS` |
|      `0x08` | `LEA rD,[rA+simm8]`  |
|      `0x09` | `LD8 rD,[rA+simm8]`  |
|      `0x0A` | `ST8 [rA+simm8],rS`  |
|      `0x0B` | `LD16 rD,[rA+simm8]` |
|      `0x0C` | `ST16 [rA+simm8],rS` |
| `0x0D–0x0F` | Reserved             |

Displaced forms have one additional signed byte.

For displaced forms:

```text
effectiveAddress = (original rA + sign_extend(simm8)) mod 2^16
```

`LEA` writes this effective address without accessing memory and preserves flags.

Postincrement operations capture the original address and store value, when applicable, before modifying either architectural operand. The address register is incremented by one for byte operations and by two for word operations, modulo `2^16`.

Postincrement load forms require `rD != rA`.

A diagnostic implementation traps an illegal overlap. Optimized behavior is undefined.

Word loads and stores access the second byte at `(effectiveAddress + 1) mod 2^16`.

These are the only postincrement load and store encodings in this ISA version. Compact-register operands do not produce a shorter primary encoding. All operations in this section preserve flags.

---

## 51. Extended stack-relative memory

The register is encoded in the low three secondary-opcode bits.

| Range       | Instruction         | Operand              |
| ----------- | ------------------- | -------------------- |
| `0x10–0x17` | `LDSP8 rN,[SP+u8]`  | unsigned byte offset |
| `0x18–0x1F` | `STSP8 [SP+u8],rN`  | unsigned byte offset |
| `0x20–0x27` | `LDSP16 rN,[SP+u8]` | unsigned byte offset |
| `0x28–0x2F` | `STSP16 [SP+u8],rN` | unsigned byte offset |

Byte loads zero-extend.

The effective address is `(original SP + u8) mod 2^16`. Word accesses use the next data-space byte modulo `2^16`. The architectural SP is not modified. These operations preserve flags.

---

## 52. Direct data-space memory

The register is encoded in the low three secondary-opcode bits. Each instruction is followed by a raw 16-bit little-endian data-space address.

| Range       | Instruction       |
| ----------- | ----------------- |
| `0x30–0x37` | `LDM8 rN,addr16`  |
| `0x38–0x3F` | `STM8 addr16,rN`  |
| `0x40–0x47` | `LDM16 rN,addr16` |
| `0x48–0x4F` | `STM16 addr16,rN` |
| `0x50–0x7F` | Reserved          |

Effective address:

```text
address = addr16
```

No global-data or framebuffer base is added. These instructions can directly access globals, the framebuffer, the VM stack, native AVR I/O registers, or any other data-space address.

Byte loads zero-extend. Word accesses transfer two little-endian bytes beginning at `addr16`; the second byte is accessed at `(addr16 + 1) mod 2^16`.

These operations preserve flags.

The former `LEAG` and framebuffer-specific direct-access instructions do not exist. Ordinary address constants are materialized directly, and the framebuffer is addressed through its fixed data-space location.

---

## 53. Program-space loads

The following subopcodes are followed by `RRSPEC`:

|   Secondary | Instruction             |
| ----------: | ----------------------- |
|      `0x80` | `LDP8 rD,[PB:rA]`       |
|      `0x81` | `LDP16 rD,[PB:rA]`      |
|      `0x82` | `LDP8 rD,[PB:rA+simm8]` |
|      `0x83` | `LDP16 rD,[PB:rA+simm8]`|
| `0x84–0xFF` | Reserved                |

Displaced forms include one signed displacement byte.

The effective program-space address is formed as a 24-bit addition:

```text
effectiveAddress = (PB:rA + sign_extend(simm8)) mod 2^24
```

Carry or borrow from the low 16-bit word therefore propagates into the bank byte. Neither `PB` nor `rA` is modified. Non-displaced forms use `PB:rA` directly. A word load accesses `effectiveAddress` and `(effectiveAddress + 1) mod 2^24`.

Byte loads zero-extend.

Program loads preserve flags.

Program loads interrupt the sequential instruction-fetch stream and are expected to be substantially more expensive than data-space loads. Repeated scalar postincrement program loads are intentionally not provided; bulk copies should use the system ABI's program-memory copy service.

---

# Part IX — Direct Far Control `0xFE`

## 54. Encoding

A direct far transfer is four bytes:

```text
0xFE T0 T1 T2
```

Interpretation:

```text
link   = T0 bit 0
target = (T2 << 16) | (T1 << 8) | (T0 & 0xFE)
```

Therefore the target must be even.

```text
link = 0  → JMPF target
link = 1  → CALLF target
```

### `JMPF`

```text
CB = target bits 23:16
PC = target bits 15:0
```

### `CALLF`

The instruction first pushes:

```text
CB:nextPC
```

then installs the target.

The linker may use an aligned veneer when a desired cross-bank destination is not naturally even-aligned.

---

# Part X — Return and Call Stack

## 55. Return-address format

Every call pushes a three-byte logical return address:

```text
SP = SP - 3

memory[SP + 0] = return bits 7:0
memory[SP + 1] = return bits 15:8
memory[SP + 2] = return bits 23:16
```

All call instructions use this same representation:

* `CALL rel8`
* `CALL16`
* `CALLR`
* `CALLP`
* `CALLF`

---

## 56. `RET`: `0xFF`

`RET` restores:

```text
PC = memory[SP + 0] |
     memory[SP + 1] << 8

CB = memory[SP + 2]

SP = SP + 3
```

The interpreter then restarts the SPI bytecode stream at `CB:PC`.

There is no separate near return.

---

# Part XI — Calling Convention

## 57. Register volatility

| Register          | ABI role                        |
| ----------------- | ------------------------------- |
| `r4–r7` / `c0–c3` | Caller-saved                    |
| `r0–r3`           | Callee-saved                    |
| `r3`              | Optional frame pointer          |
| `PB`              | Caller-saved                    |
| `FLAGS`           | Caller-saved                    |
| `SP`              | Restored by callee              |
| `CB`              | Restored by return/control flow |

The compact class is intentionally the caller-saved argument and temporary class.

---

## 58. Register arguments

Arguments are assigned in 16-bit units:

```text
unit 0 → c0 = r4
unit 1 → c1 = r5
unit 2 → c2 = r6
unit 3 → c3 = r7
```

Examples:

| Type            | Register units        |
| --------------- | --------------------- |
| `i8`            | one unit              |
| `i16`           | one unit              |
| Data pointer    | one unit              |
| `i32`           | two consecutive units |
| Program pointer | two consecutive units |
| `i64`           | four units            |

A program pointer uses:

```text
first unit  = low 16 bits
second unit = zero-extended bank byte
```

An argument that does not fully fit in the remaining register units is passed entirely on the stack.

Arguments are not split between registers and stack.

---

## 59. Stack arguments

The caller allocates stack-argument storage before executing the call.

Stack arguments:

* Appear in source order at ascending addresses.
* Use natural ABI size.
* Have one-byte alignment.
* Are packed without alignment gaps unless required by an explicit attribute.

After the call pushes the return address, callee entry sees:

```text
SP+0  return low byte
SP+1  return middle byte
SP+2  return bank byte
SP+3  first stack-argument byte
```

The caller removes outgoing stack arguments after return.

---

## 60. Variadic functions

All arguments to a variadic function are passed on the stack, including named arguments.

Default argument promotions apply.

`va_list` is a 16-bit data-space pointer.

This rule avoids:

* A register-save area.
* A compound register/stack iterator.
* Mandatory prologue spills of `c0–c3`.

---

## 61. Return values

| Return type              | Location                            |
| ------------------------ | ----------------------------------- |
| `i8`, `bool`             | low byte of `c0`                    |
| `i16`                    | `c0`                                |
| Data pointer             | `c0`                                |
| `i32`                    | `c0:c1`                             |
| Program/function pointer | low word in `c0`, bank word in `c1` |
| `i64`                    | `c0:c1:c2:c3`, when permitted       |
| Large aggregate          | hidden data-space result pointer     |

A hidden structure-result data pointer consumes the first argument unit.

---

## 62. Callee prologue and epilogue

A function saves only the callee-saved registers it uses.

Example fixed frame:

```asm
PUSH16 r0
PUSH16 r1
ADJSP  -12
```

Epilogue:

```asm
ADJSP  12
POP16  r1
POP16  r0
RET
```

The backend should order frame objects so frequently accessed values use compact stack offsets.

---

## 63. Frame pointer

The default is frame-pointer omission.

When required:

```asm
PUSH16 r3
GETSP  r3
ADJSP  -frameSize
```

The frame pointer denotes the SP value after saving the previous frame pointer and before allocating local storage.

Epilogue:

```asm
SETSP  r3
POP16  r3
RET
```

Dynamic stack allocation is not recommended but can use `GETSP`, `SETSP`, and `ADJSP`.

---

## 64. Tail calls

A tail call restores the current frame and uses:

```text
JMP
JMP16
JMPR
JMPP
JMPF
```

A cross-bank tail call MUST use a jump, not a call, so the callee returns directly to the original caller.

---

# Part XII — System ABI

## 65. `SYS`

`SYS imm8` invokes a service in the Arduboy system ABI. The service ABI may be maintained as a separate specification, but linked images express their complete interpreter compatibility through the single `runtimeVersion` field described in Part XVI.

Unless a service specifies otherwise:

```text
c0–c3  arguments and results
r0–r3  preserved
PB     clobbered
FLAGS  clobbered
SP     preserved
```

Likely service categories include:

* Display submission.
* Input sampling.
* Audio control.
* Frame timing and yield.
* Program exit or termination.
* Debugger break.
* Assertion and explicit guest-fault reporting.
* Random-number generation.
* Bulk flash-to-SRAM copy.
* Sprite rendering from program space.
* Save-data access.
* Debug output.

Service identifiers and detailed signatures belong in a separate system-ABI specification so that platform facilities can evolve without changing the integer ISA.

---

# Part XIII — LLVM and Clang Target

## 66. Target identity

A suitable target triple is:

```text
avm-unknown-arduboyfx
```

or:

```text
avm-none-arduboyfx
```

The exact spelling is a toolchain policy decision but must remain stable once object files are published.

---

## 67. LLVM address spaces

LLVM address spaces are:

```text
address space 0 = AVR data space
address space 1 = program space
```

Functions reside in address space 1.

Unqualified C data pointers use address space zero.

A Clang target extension such as:

```c
const __flash uint8_t *p;
```

should produce an address-space-one pointer.

LLVM supports target-defined address spaces and distinct pointer sizes, and its backend infrastructure expects the target to describe registers, instructions, lowering, calling convention, frame behavior, and object emission. ([LLVM][3])

---

## 68. LLVM data layout

Recommended initial data layout:

```text
e-m:e-p:16:8:8:16-p1:24:8:8:24-P1-G0-A0-i8:8:8-i16:8:8-i32:8:8-i64:8:8-f32:8:8-n8:16-S8
```

Meaning:

* Little-endian.
* Default data-space pointers are 16 bits.
* Program pointers are 24 bits.
* Functions use program address space one.
* Globals and stack allocations use address space zero and reside in SRAM by convention.
* Scalar ABI alignment is one byte.
* Native integer widths are 8 and 16 bits.
* Stack alignment is one byte.

Program pointers remain integral pointers; `ptrtoint` may lower to `i24` or an expanded integer representation.

---

## 69. LLVM register classes

Required register classes include:

```text
GPR16   = r0–r7
CGPR16  = r4–r7

GPR8    = b0–b7
CGPR8   = b4–b7
```

Recommended compound pairs:

```text
PAIR01 = r0:r1
PAIR23 = r2:r3
PAIR45 = r4:r5
PAIR67 = r6:r7
```

These pairs support:

* `i32`
* 24-bit program pointers
* 32-bit floating-point values
* Multiword argument allocation

A program-pointer register class may use the same even-aligned pairs while treating the upper byte of the second word as unused.

---

## 70. Legal and expanded types

Native or directly supported machine types:

```text
i8
i16
p0:16
```

Custom-lowered:

```text
p1:24
```

Expanded:

```text
i1
i24
i32
i64
f32
```

`i1` should normally remain in FLAGS through compare-and-branch patterns or be materialized as canonical `i8` zero/one.

`i32` uses a register pair.

`i64` uses four words or compiler-runtime calls.

Floating-point operations use compiler-runtime helpers.

---

## 71. Byte lowering

The backend should track whether an `i8` producer has already canonicalized the high byte.

Canonical zero-extending producers include:

```text
LD8
LD8_POST
LDSP8
LDM8
LDP8
LDI8
CLR
MFPB
```

`G_TRUNC i16 to i8` usually requires no instruction.

`G_ZEXT i8 to i16`:

* Requires no instruction if the producer is known canonical.
* Otherwise lowers to `ZEXT8`.

`G_SEXT i8 to i16` lowers to `SEXT8` unless folded into another operation.

---

## 72. Instruction-selection strategy

The backend SHOULD use the following sequence:

1. Legalize LLVM IR operations.
2. Select generic AVM machine pseudos.
3. Form postincrement memory operations.
4. Form compare-and-branch sequences.
5. Perform register allocation.
6. Prefer compact registers through allocation hints.
7. Lower stack frames.
8. Run a post-register-allocation compression pass.
9. Select one-byte primary encodings when physical operands permit.
10. Perform branch and call relaxation after layout.

Compact encodings should generally not be selected before register allocation.

---

## 73. Compact-register allocation policy

The allocator should prefer `r4–r7` for:

* Call arguments.
* Return values.
* Short-lived temporaries.
* Memory addresses.
* Memory values.
* Loop counters.
* Comparison operands.
* Arithmetic operands.
* Signed multiply operands.
* Values likely to use primary instructions.

The allocator should prefer `r0–r3` for:

* Long-lived values.
* Values live across calls.
* Callee-preserved state.
* Optional frame pointer.
* Values for which compact encoding provides little benefit.

---

## 74. Post-RA compression rules

Examples:

```text
MOV r4,r5      → one-byte MOV c0,c1
ADD r6,r7      → one-byte ADD c2,c3
LD8 r4,[r5]    → one-byte LD8 c0,[c1]
CMP16 r6,r4    → one-byte CMP16 c2,c0
```

Special cases:

* `MOV cN,cN` must be removed or left in extended form because the primary diagonal is `CLR`.
* `CMP16 cN,cN` must be constant-folded or left extended because the primary diagonal is `TST16`.
* `CMP8 cN,cN` has the same restriction.
* Postincrement memory operations have no one-byte compact form; compact physical registers do not change their `0xFD` encoding.
* Postincrement loads with destination equal to address are illegal and require a temporary.

---

## 75. Multiword arithmetic

### 75.1 Addition

```asm
ADD lowD, lowS
ADC highD, highS
```

### 75.2 Subtraction

```asm
SUB lowD, lowS
SBC highD, highS
```

### 75.3 Comparison

```asm
CMP16 lowA, lowB
CPC16 highA, highB
```

The cumulative-zero rules make these sequences produce correct whole-value flags.

---

## 76. Multiplication lowering

`MULU8` may use any registers efficiently enough.

`MULS8` and `MULSU8` should strongly prefer compact registers because `c0–c3` map to native `r16–r23`.

A noncompact multiply may require:

* Native-register copies.
* A generic out-of-line handler.
* A compiler-generated sequence.

A 16×16 multiply may lower to byte multiplies or a compiler-runtime helper.

Division and remainder should initially use runtime helpers.

---

## 77. Addressing-mode selection

The backend should recognize postincrement address updates before register allocation and represent them with target pseudos. Final lowering occurs after physical registers are known.

For a legal postincrement operation, the backend should compare:

* A single generic `0xFD` postincrement instruction, which supports all registers and eliminates a separate architectural increment.
* A compact primary load or store followed by `INC16`, when the operands are compact registers.

For byte accesses, the compact two-instruction sequence is shorter in bytecode, while the extension form may reduce handler and dispatch work. The target cost model should select between them according to the optimization goal and measured interpreter costs. Word postincrement operations are more likely to favor the extension form because an explicit increment by two requires additional work.

Apart from that choice, the backend should generally prefer:

1. Compact indirect access.
2. Compact stack-relative access.
3. Direct data-space access.
4. Generic full-register indirect access.
5. Generic displaced access.
6. Materialized pointer plus indirect access.

For example:

```c
x = *p++;
```

should first form the machine-level operation:

```asm
LD8_POST rD,[rA]+
```

After register allocation, it may remain the `0xFD` extension instruction or expand to:

```asm
LD8  cD,[cA]
INC16 cA
```

when that is preferable. Stores follow the same policy.

---

## 78. Flags as an explicit dependency

Machine instructions that define FLAGS must have an implicit physical-register definition.

Branches and `ADC`, `SBC`, or `CPC16` must have an implicit FLAGS use.

The scheduler and peephole passes must not move a flag-defining operation between a comparison and its branch.

Because dispatch overwrites native AVR flags, the compiler-visible AVM FLAGS register represents the saved architectural state, not native `SREG`.

---

## 79. PB as an explicit dependency

Instructions have the following implicit relationships:

```text
MTPB/LDPBI     define PB
MFPB           use PB
LDP*           use PB
JMPP/CALLP     use PB
CALL and SYS   clobber PB according to ABI
```

The backend may eliminate redundant consecutive PB loads when no intervening clobber exists.

PB must not be treated as general allocatable storage.

---

## 80. Calls and code model

The default code model is large.

The compiler should initially emit a relaxable far direct call for an external or unresolved target.

The linker relaxes it to:

```text
CALL rel8
CALL16
CALLF
```

according to final placement.

The same applies to jumps.

Indirect function calls always use the 24-bit function-pointer representation.

---

## 81. Switch lowering

Program-space jump tables are expensive because reading them interrupts sequential bytecode fetch.

The backend should therefore:

* Prefer compare chains for small switches.
* Use binary decision trees when appropriate.
* Use jump tables only above a target-specific density threshold.
* Store jump-table entries as packed 24-bit logical program addresses.
* Load the target into a program-pointer register pair.
* Transfer the bank to PB.
* Execute `JMPP`.

The threshold should be tuned from real Arduboy workloads.

---

## 82. Frame lowering

Frame lowering should:

* Omit the frame pointer by default.
* Keep frequently accessed frame objects in offsets `0–31`.
* Prefer compact-register spill and reload forms.
* Save only used callee-saved registers.
* Use `ADJSP` for fixed frames.
* Use `GETSP` and `SETSP` only when required.
* Emit stack-usage metadata.
* Diagnose statically provable stack use above 256 bytes.

---

## 83. C++ target policy

The initial C++ environment should support:

* Classes and member functions.
* Templates.
* Virtual dispatch.
* Static constructors.
* Placement `new`.
* Function overloading.
* Destructors for automatic and static objects.

The initial runtime should normally disable:

```text
-fexceptions
-frtti
```

General dynamic allocation is unavailable.

Virtual tables and type metadata reside in program space.

Virtual-function pointers are 24-bit function pointers.

---

# Part XIV — Assembler, ELF, and Linker

## 84. Object and linked-image formats

### 84.1 Relocatable objects

The compiler toolchain should use little-endian ELF objects.

A private `e_machine` value may be used during development until an official assignment exists.

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

`.text`, `.rodata`, and constructor arrays reside in program space.

`.data` and `.bss` receive native data-space virtual addresses beginning at `0x0100`. The linker places all initialized writable objects first and all zero-initialized writable objects immediately afterward, producing the contiguous SRAM layout defined in Section 13.

Debug information and other non-runtime metadata remain in the ELF file or a sidecar file. They are not required in the flat executable image.

### 84.2 Final linked image

The normal executable output is the flat AVM linked-image format defined in Part XVI.

The linker reserves logical/file offsets `0x000000–0x0000FF` for the header. The contiguous `.data` initializer image begins at logical/file offset `0x000100`. The first ordinary program-space section begins at:

```text
programStart = align_up(0x000100 + dataSize, 0x100)
```

The bytes between the end of the `.data` initializer and `programStart` are `0xFF` padding. This keeps the first code page 256-byte aligned without requiring separate header fields for load addresses.

For every stored byte:

```text
file offset = logical program-space address
```

The startup entry section is normally placed at `programStart`, but the three-byte `entryPoint` field is authoritative. After `programStart`, the linker may interleave code, read-only constants, constructor arrays, jump tables, and other immutable program data as appropriate for locality and bank placement. `.bss` occupies no bytes in the linked image.

The final eight bytes of the linked image are a mandatory tail locator. The image writer chooses:

```text
fileSize   = align_up(endOfPayload + 8, 0x100)
tailOffset = fileSize - 8
```

All unused bytes before the tail are filled with `0xFF`. The tail stores its own magic and the total image length in 256-byte pages. This allows an emulator or development build placed at the end of the FX address space to reconstruct the header address without a size field in the header.

The linker or final image writer synthesizes the header and tail after final layout and relaxation, computes `headerCrc32`, and verifies that the complete file length is a multiple of 256 bytes.

---

## 85. Required relocation classes

At minimum, the object format needs relocations equivalent to:

```text
R_AVM_DATA16       Absolute data-space address
R_AVM_PROG24       Packed 24-bit logical program address
R_AVM_PROG_LO16    Low 16 bits of a program address
R_AVM_PROG_HI8     Bank byte of a program address

R_AVM_PCREL8       Conditional branch, near jump, or near call displacement
R_AVM_BANK16       Absolute same-bank low-16-bit address
R_AVM_FAR24        Packed far-control target

R_AVM_RELAX        Linker relaxation marker
```

The far-control relocation must preserve the call/jump link bit in the encoded low byte.

---

## 86. Bank-aware linker placement

The linker must:

1. Build a function call graph.
2. Estimate hot caller/callee relationships when profile data is present.
3. Cluster related functions into banks.
4. Keep each function within one bank.
5. Place address-taken functions at even addresses.
6. Align cross-bank targets.
7. Prevent fallthrough across bank boundaries.
8. Insert veneers when needed.
9. Fill unused bank tails with an invalid or diagnostic-fault encoding.
10. Iteratively relax calls, jumps, and branches.

Cold error paths and infrequently used helpers may be moved to separate banks.

---

## 87. Relaxation

### 87.1 Calls

```text
CALLF → CALL rel8
```

when same-bank and within signed-eight-bit range.

Otherwise:

```text
CALLF → CALL16
```

when same-bank.

Otherwise it remains `CALLF`.

### 87.2 Jumps

```text
JMPF → JMP rel8
JMPF → JMP16
JMPF remains JMPF
```

### 87.3 Conditional branches

Equality branches use one-byte `BEQ.S` or `BNE.S` when possible.

Otherwise use the corresponding `BRcc rel8` opcode.

Larger conditional transfers become an inverted branch around:

```text
JMP
JMP16
JMPF
```

---

## 88. Veneers

A local cross-bank call veneer may be:

```asm
local_stub:
    JMPF remote_function
```

A caller performs a near call to the veneer.

The veneer jumps, so the remote function returns directly to the original caller.

A veneer may also provide even alignment for a far target whose final local destination is odd:

```asm
aligned_veneer:
    JMP16 odd_local_target
```

---

# Part XV — Interpreter Implementation

## 89. Primary dispatch table

The interpreter uses 256 fixed-stride primary slots, one for each primary opcode. Every primary opcode therefore has a distinct operand-specialized native entry point.

The slot stride is an interpreter implementation parameter rather than an architectural constant. It MAY be changed when handler-size requirements change, provided that:

* Every primary slot uses the same stride.
* Native AVR `r7` contains that stride expressed in AVR instruction words.
* The dispatch calculation and table placement agree on the configured stride.
* Each opcode's entry point remains computable directly from the opcode without an additional lookup.

The slot size, table alignment, and total dispatch-table footprint are not part of the AVM ISA and need not remain stable between interpreter implementations.

---

## 90. Dispatch sequence

Primary dispatch multiplies the opcode by the configured fixed-slot stride held in native AVR `r7`, adds the dispatch-table base, and jumps to the resulting entry point. A representative sequence is:

```asm
in    r6, SPDR
out   SPDR, r2
adiw  r24, 1

mul   r6, r7
movw  r30, r0
; Add the implementation-selected dispatch-table base to Z.
ijmp
```

With `r2 = 0`, the multiplication computes the handler offset in AVR instruction words. The exact table placement, base-address sequence, slot stride, dispatch latency, and instruction count are interpreter implementation details.

An implementation MAY select table alignment and placement that simplify addition of the table base. Changing those choices does not change the AVM ISA or bytecode format.

---

## 91. Handler-entry invariants

At primary handler entry:

```text
r2       = 0
r7       = configured primary dispatch-slot stride in AVR words
r24:r25  = current opcode address
Y        = AVM SP
GPIOR1   = CB
GPIOR2   = PB
r3       = AVM FLAGS
SPDR     = fetching the byte following the opcode
```

`r0:r1`, `r4`, `r5`, `r6`, `X`, and `Z` may be treated as scratch unless the particular dispatch path requires otherwise.

---

## 92. Operand-specialized handlers

Each compact primary opcode has its own native handler.

For example:

```text
ADD c0,c1
```

directly names:

```asm
add r16, r18
adc r17, r19
```

No runtime compact-register decoding is performed.

This is the central justification for assigning complete 16-opcode families to high-frequency compact operations.

---

## 93. Generic register indexing

Extension handlers may dynamically index AVM registers through the native AVR register-file data addresses.

For AVM register number in `r6`:

```asm
mov  r30, r6
lsl  r30
subi r30, -8
mov  r31, r2
```

`Z` then points at the low native byte of the AVM register.

This technique is suitable for:

* Extension-page slow paths.
* Register dump and restore.
* Debugger access.
* Generic system-call marshaling.
* Rare arbitrary-register operations.

It is not suitable for hot primary handlers.

---

## 94. PC maintenance

Every handler knows its encoded byte length.

For normal fallthrough:

```asm
adiw r24, instruction_length
```

The maximum instruction length in this specification is small enough for one `ADIW`.

No sequential handler tests for bank carry.

---

## 95. Operand fetch pipeline

For each additional instruction byte:

1. Wait until the current SPI transfer completes if necessary.
2. Read `SPDR`.
3. Immediately write the zero byte from native `r2` to `SPDR`.
4. Begin fetching the subsequent byte.
5. Decode or execute while the transfer proceeds.

The final speculative fetch is the next opcode on a fallthrough path.

A taken control transfer discards the speculative sequential byte.

---

## 96. Slot overflow

A primary handler that does not fit in the configured dispatch-slot stride must:

1. Perform any profitable fast prefix in its slot.
2. Jump to shared out-of-line code.
3. Return to the common dispatch path.

Extension-page primary handlers naturally enter secondary dispatch logic.

Alternatively, the interpreter may increase the uniform dispatch-slot stride and rebuild the table. The stride is measured in AVR instruction words; it is not necessarily equal to the number of native instructions because some AVR instructions occupy two words.

---

## 97. FLAGS implementation

A flag-producing native sequence saves relevant native status into AVR `r3`.

The dispatch `MUL` subsequently destroys native status without affecting saved AVM FLAGS.

Branch handlers inspect `r3`.

`ADC`, `SBC`, and `CPC16` handlers reconstruct the native carry input from saved AVM `C` before executing the native arithmetic sequence.

---

## 98. Program-data loads

A program-space data load performs:

1. Finish or abandon the sequential opcode transfer.
2. Form the logical address from `PB:rA`.
3. Add `imageBase`.
4. Start an external-flash data read.
5. Read the requested byte or word.
6. Form the physical address of `CB:nextPC`.
7. Restart sequential opcode fetch.
8. Dispatch the next opcode.

These operations are intentionally extension-page instructions because they are high latency.

Bulk operations should normally be implemented as system services that avoid repeatedly restarting the instruction stream.

---

## 99. Taken control flow

A taken jump, call, return, or branch:

1. Computes the logical target.
2. Updates `CB` and/or `PC`.
3. Adds `imageBase`.
4. Issues a new SPI read command and address.
5. Starts target-byte prefetch.
6. Dispatches the target opcode.

The ISA does not expose the exact cycle cost.

The LLVM cost model should treat taken control flow as substantially more expensive than fallthrough.

---

## 100. Native ABI bridges

Before calling ordinary AVR compiler-generated code, the interpreter must:

* Clear native `r1`.
* Save all AVM values occupying native registers that the native ABI may clobber.
* Preserve interpreter special state.
* Ensure adequate native stack space.

After returning, it must:

* Restore AVM registers.
* Restore `r2 = 0`.
* Restore `r7` to the configured primary dispatch-slot stride in AVR words.
* Restore any bank or PC state.
* Resume the bytecode stream.

Frequently used services should remain handwritten assembly to avoid this bridge.

---

## 101. Interrupt handling

Interrupt handlers must account for the custom native register convention.

An interrupt handler must save every native register it modifies, including interpreter-fixed registers.

Interrupt handlers should:

* Minimize hardware-stack use.
* Avoid calling deep native routines.
* Avoid modifying `GPIOR1` or `GPIOR2` without saving them.
* Preserve `r2`, `r3`, `r7`, `PC`, and VM register storage.
* Restore the SPI/interpreter state if an interrupt can touch the SPI peripheral.

---

# Part XVI — Runtime and Image Format

## 102. Startup sequence

The interpreter supports two ways to discover the physical image and save locations.

### 102.1 Arduboy FX flashcart launch

The FX flashcart loader communicates the selected image and save pages through the two reserved interrupt-vector slots used by the Arduboy FX convention:

| Internal-flash address | Size | Meaning |
| ---------------------: | ---: | ------- |
| `0x0014` | 2 | Data-vector key, little-endian `0x9518` |
| `0x0016` | 2 | Image base page, stored high byte then low byte |
| `0x0018` | 2 | Save-vector key, little-endian `0x9518` |
| `0x001A` | 2 | Save base page, stored high byte then low byte |

The interpreter first checks the data-vector key. When it is present, the following page number is authoritative and identifies the 256-byte physical page containing the AVM header. The save-vector key is checked independently; a missing save key is permitted only when the linked image requests `saveSize == 0`.

The page convention matches the Arduboy FX library: a page value `P` represents physical byte address `P << 8`.

### 102.2 Development and emulator launch

When the flashcart data-vector key is absent, the interpreter searches for the mandatory AVM tail locator in the two development placements supported by the packer:

```text
0xFFFFF8  image ends at the end of the 16 MiB flash; no save sector follows
0xFFEFF8  image ends immediately before the final 4 KiB save sector
```

The first location is checked first. If neither location contains a valid tail magic, startup fails.

For a tail found in physical page `tailPage`, the image header page is reconstructed as:

```text
imageBasePage = tailPage + 1 - imagePageCount
imageBase     = imageBasePage << 8
```

When the tail is found at `0xFFEFF8`, the save sector begins at physical page `0xFFF0`. When the tail is found at `0xFFFFF8`, no development save area exists and an image with nonzero `saveSize` is rejected.

### 102.3 Minimal on-device initialization

After discovering the physical image location, the normal Arduboy interpreter checks only:

```text
magic == { 0x41, 0x56, 0x4D, 0x01 }
runtimeVersion == 1
dataSize <= staticSize
staticSize <= 1024
saveSize <= 1024
saveSize == 0 or a valid save page was supplied or discovered
```

The magic bytes are ASCII `AVM` followed by linked-image format revision `1`. `runtimeVersion` is one combined compatibility number covering the bytecode ISA, calling convention, memory model, startup contract, and system ABI.

The interpreter then performs:

1. Install the physical image base page and save page.
2. Set the native AVR hardware stack to the top of SRAM.
3. Set AVM `SP = 0x0A00`.
4. Set `PB = 0` and clear AVM flags.
5. Clear `staticSize` bytes beginning at SRAM address `0x0100`.
6. Copy `dataSize` bytes from logical program address `0x000100` to SRAM address `0x0100`.
7. Retain `saveSize` and the physical save page for the system ABI.
8. Set `CB:PC` to `entryPoint`.
9. Start an FX read stream at the physical translation of `entryPoint`.
10. Fetch the first opcode, start fetching its following byte, enable interrupts, and enter primary dispatch.

Clearing all static storage before copying `.data` is intentionally used instead of separately calculating and clearing the `.bss` suffix. The maximum region is only 1,024 bytes and this keeps startup logic straightforward.

The linked entry point names the runtime startup symbol, conventionally `_start`. `_start` runs static constructors, performs any desired framebuffer initialization, calls `main`, runs required termination handlers, and invokes the appropriate system service when `main` returns.

A diagnostic interpreter MAY additionally verify `headerCrc32`, the tail reserved field, entry-point alignment, image bounds, and reserved header bytes. These checks are intentionally omitted from the normal Arduboy path.

General-purpose AVM registers are unspecified at raw image entry unless the runtime ABI specifies otherwise.

---

## 103. Linked binary image format

### 103.1 General layout

An AVM executable is a flat little-endian binary with this layout:

```text
0x000000–0x0000FF                           Fixed 256-byte header
0x000100–0x000100+dataSize-1                Contiguous .data initializer image
...–programStart-1                          0xFF alignment padding
programStart–...                            Linker-placed program-space contents
...–fileSize-9                              0xFF final padding
fileSize-8–fileSize-1                       Mandatory eight-byte tail locator
```

where:

```text
programStart = align_up(0x000100 + dataSize, 0x100)
fileSize     = align_up(endOfPayload + 8, 0x100)
file offset  = logical program-space address
fileSize mod 0x100 = 0
```

The first code page therefore remains 256-byte aligned even when initialized writable data is present. After `programStart`, code and immutable data need not occupy separate global ranges; the linker may interleave them while respecting function-bank and target-alignment requirements.

There are no `programSize` or `imageSize` fields in the header. The tail's `imagePageCount` provides the complete linked-image length when a locator-based launch needs it.

The physical `imageBase` MUST be 256-byte aligned. Because the flat image length is also a multiple of 256 bytes, ordinary flashcart packing preserves page alignment automatically.

### 103.2 Header byte layout

All multi-byte integer fields are unsigned and little-endian. `entryPoint` is a packed 24-bit program address.

| Offset | Size | Field | Description |
| -----: | ---: | ----- | ----------- |
| `0x00` | 4 | `magic` | Bytes `41 56 4D 01`: ASCII `AVM` plus header-format revision `1` |
| `0x04` | 1 | `runtimeVersion` | Required combined interpreter compatibility version; version one is `1` |
| `0x05` | 3 | `entryPoint` | Logical program address of `_start` |
| `0x08` | 2 | `dataSize` | Number of initialized static bytes copied from logical address `0x000100` |
| `0x0A` | 2 | `staticSize` | Total `.data` plus `.bss` SRAM usage beginning at `0x0100` |
| `0x0C` | 2 | `saveSize` | Requested persistent bytes, from `0` through `1024` |
| `0x0E` | 238 | — | Reserved; must be zero in header-format revision one |
| `0xFC` | 4 | `headerCrc32` | CRC-32 of header bytes `0x00–0xFB` |

A corresponding serialization description is:

```c
struct AvmImageHeader {
    uint8_t  magic[4];
    uint8_t  runtimeVersion;
    uint8_t  entryPoint[3];
    uint16_t dataSize;
    uint16_t staticSize;
    uint16_t saveSize;
    uint8_t  reserved[238];
    uint32_t headerCrc32;
};
```

This is a serialization description, not a native compiler-layout contract. Host tools should write fields explicitly or verify that any host structure is packed and exactly 256 bytes.

### 103.3 Header checksum

`headerCrc32` uses CRC-32/ISO-HDLC and covers exactly the first 252 header bytes:

```text
CRC input  = header[0x00 .. 0xFB]
stored CRC = little-endian header[0xFC .. 0xFF]
```

Because the checksum field follows the covered range, no zeroing or self-referential checksum rule is required.

The linker or image writer MUST populate `headerCrc32`. Host tools and diagnostic interpreters SHOULD verify it. A normal Arduboy interpreter MAY omit CRC verification.

### 103.4 Static initialization layout

The linker emits all initialized writable objects as one contiguous initializer image beginning at logical address `0x000100`. At startup these bytes are copied to SRAM beginning at `0x0100`.

Zero-initialized writable objects immediately follow initialized objects in SRAM and occupy no bytes in the image:

```text
.data source       = program address 0x000100
.data destination  = SRAM 0x0100
.data length       = dataSize
.bss destination   = SRAM 0x0100 + dataSize
.bss length        = staticSize - dataSize
```

The required invariants are:

```text
0 <= dataSize <= staticSize <= 1024
```

The current interpreter implements this by clearing all `staticSize` bytes and then copying the `dataSize`-byte initializer prefix over the cleared region.

Internal linker padding is included in `dataSize` or `staticSize` as appropriate. Static constructors and destructors are ordinary program-space arrays referenced by `_start` through linker-defined symbols; they need no header entries.

### 103.5 Save storage

`saveSize` is a 16-bit exact byte count and MUST be no greater than 1,024. Zero means that the image requests no persistent storage.

On Arduboy FX, the outer packer reserves a whole 4 KiB erase sector when save storage is present, even though the AVM program-visible size is at most 1,024 bytes. The save area is outside AVM logical program space.

For a normal flashcart launch, the loader supplies its physical page using the keyed save vector. For development placement with a save sector, the linked image ends at physical address `0xFFF000` and the save sector occupies:

```text
0xFFF000–0xFFFFFF
```

The system ABI must enforce `saveSize` even though the physical erase sector is larger.

### 103.6 Tail locator

The mandatory tail locator occupies the final eight bytes of every linked image:

| Tail offset | Size | Field | Description |
| ----------: | ---: | ----- | ----------- |
| `+0x00` | 4 | `magic` | Bytes `41 56 54 01`: ASCII `AVT` plus tail-format revision `1` |
| `+0x04` | 2 | `imagePageCount` | Total linked-image length in 256-byte pages |
| `+0x06` | 2 | — | Reserved; must be zero |

A serialization description is:

```c
struct AvmImageTail {
    uint8_t  magic[4];
    uint16_t imagePageCount;
    uint16_t reserved;
};
```

The required relationship is:

```text
imagePageCount = fileSize / 256
```

When the tail is read from physical page `tailPage`, the page containing the header is:

```text
imageBasePage = tailPage + 1 - imagePageCount
```

The tail magic is intentionally different from the header magic. The normal flashcart path does not need to inspect the tail because the image page is supplied by the keyed vector; the tail remains mandatory so the same linked binary can be used directly by emulators and development upload tools.

### 103.7 Development placement

A development uploader or emulator places the same linked image in one of two forms.

Without save storage:

```text
image end = 0x1000000
tail      = 0xFFFFF8
```

With a final save sector:

```text
image end   = 0xFFF000
tail        = 0xFFEFF8
save sector = 0xFFF000–0xFFFFFF
```

The image start is determined from the tail page count and need not be stored anywhere else. In both forms the linked image itself is unchanged; only its physical placement differs.

### 103.8 Metadata and debugging

Source-file tables, line tables, symbols, build identifiers, and other debugging metadata are intentionally absent from the runtime header and tail. They remain in the ELF file, a sidecar debug file, or outer package metadata.

This keeps the interpreter-visible format fixed and allows release images to discard debugging information without changing startup behavior.

### 103.9 Linker and packer validation

The linker or image writer MUST validate:

```text
header magic is exactly 41 56 4D 01
runtimeVersion is the selected target runtime version
entryPoint fits in 24 bits
entryPoint is an even instruction boundary
programStart <= entryPoint < tailOffset
dataSize <= staticSize <= 1024
saveSize <= 1024
all reserved header bytes are zero
headerCrc32 is correct
programStart = align_up(0x000100 + dataSize, 0x100)
tail magic is exactly 41 56 54 01
imagePageCount == fileSize / 256
imagePageCount != 0
tail reserved bytes are zero
all alignment gaps and non-tail final padding contain 0xFF
fileSize is a multiple of 256 bytes
all bank-layout rules are satisfied
```

The physical packer MUST additionally validate:

```text
imageBase mod 256 = 0
imageBase + fileSize fits in external flash
flashcart image and save allocations do not overlap
for development without save: imageBase + fileSize == 0x1000000
for development with save:    imageBase + fileSize == 0xFFF000
```

The minimal on-device checks are the smaller set listed in Section 102.3. All other validation belongs to host tooling unless a diagnostic interpreter elects to repeat it.

---

# Part XVII — Diagnostics and Undefined Behavior

## 104. Diagnostic interpreter

A diagnostic build should detect:

* VM stack overflow and underflow.
* Illegal register-specifier reserved bits.
* Reserved primary opcodes.
* Invalid extension subopcodes.
* Instruction crossing a bank boundary.
* Fallthrough across a bank boundary.
* Misaligned far target.
* Invalid data-space postincrement load overlap.
* Jump to a non-instruction boundary.
* Program address outside the packed image extent when that extent is known.
* Program-pointer overflow.
* Invalid image magic or unsupported `runtimeVersion`.
* `dataSize > staticSize`, `staticSize > 1024`, or `saveSize > 1024`.
* Nonzero reserved header bytes.
* Header checksum failure when checksum verification is enabled.
* Missing or malformed image tail, invalid tail page count, or inconsistent development placement.
* Invalid entry point, `.data` prefix, alignment padding, or final file padding.
* Misaligned physical image placement.
* Unsupported system-service identifier.

---

## 105. Optimized execution

For maximum performance, optimized execution may define the following as unrestricted undefined behavior:

* Access to an unimplemented or unsupported data-space address.
* Invalid program pointer access.
* Stack overflow.
* Stack underflow.
* Illegal instruction.
* Malformed register specifier.
* Jump into the middle of an instruction.
* Violation of a required operand restriction.
* Execution past the end of a bank.
* Execution of unvalidated bytecode.

The normal distribution toolchain should validate bytecode before packaging it.

---

# Part XVIII — Profiling and Future ISA Evolution

## 106. Version-one priorities

The assigned primary opcode map is weighted toward:

* Register and memory movement.
* Compact byte and word indirect memory access.
* Compact arithmetic.
* Comparisons and tests.
* Short equality branches.
* Stack operations.

Postincrement data-space operations remain available through the memory extension rather than consuming primary opcode families. Register-register `AND`, `OR`, and `XOR` likewise remain extension encodings.

The contiguous range `0x50–0x6F` is intentionally unassigned pending LLVM code-generation experience and profiling. It represents one eighth of the primary opcode space and should be allocated only when measured workloads identify instruction families whose one-byte operand-specialized forms justify that cost.

---

## 107. Required profiling

The toolchain should collect:

* Dynamic primary-opcode frequency.
* Dynamic extension-page frequency.
* Static and dynamic instruction-byte counts.
* Compact-register eligibility.
* Register-allocation spill frequency.
* Stack-offset distribution.
* Branch displacement distribution.
* Call displacement and bank distribution.
* Taken versus not-taken branches.
* Register-register versus immediate bitwise operations.
* Postincrement memory frequency.
* Frequency and cost of `0xFD` postincrement operations versus compact access-plus-increment sequences.
* Program-space scalar-load and bulk-copy frequency.
* Native handler cycle distributions.
* Candidate-family compact-register eligibility after register allocation.

Any assignment within `0x50–0x6F` should be justified by measured dynamic byte-fetch savings, dispatch reduction, and handler-cycle improvement across representative LLVM-generated applications.

---

## 108. Versioning rules

The linked image carries three compact version markers:

```text
header magic[3]  header and basic file-layout revision
tail magic[3]    tail-locator revision
runtimeVersion   complete interpreter compatibility revision
```

The first three header-magic bytes are always ASCII `AVM`; the fourth byte identifies the serialization of the 256-byte header and basic linked-image layout. The tail uses ASCII `AVT` plus its own revision byte. An incompatible change to either structure requires changing the corresponding revision byte.

`runtimeVersion` is a deliberately coarse one-byte compatibility number. It covers the complete contract required to execute an image:

* Opcode encodings and semantics.
* Architectural register and flag behavior.
* Pointer representation and memory layout.
* Calling convention and return-address format.
* Runtime startup contract.
* `SYS` identifiers and service signatures.
* Save-data behavior visible to the program.

An image names one required `runtimeVersion`. An interpreter may accept one value or an explicit set of values that it implements. The current version-one format uses `runtimeVersion = 1`.

There are no separate ISA-version, system-ABI-version, image-flags, or required-feature fields in the runtime header. If a new capability is fully backward compatible and an image does not depend on it, no version change is needed. If an image requires a new interpreter-visible capability, a new `runtimeVersion` is assigned.

This coarse versioning intentionally favors a small and fast Arduboy startup path over fine-grained capability negotiation. Toolchain documents may still version the ISA and system ABI independently for development purposes, but the linker maps the selected combination to one runtime compatibility value.

Reserved opcodes must trap or remain undefined until introduced by a later runtime version.

---

# Part XIX — Consolidated Architectural Summary

```text
Architectural registers:
    r0–r7, each 16 bits

Compact aliases:
    c0 = r4
    c1 = r5
    c2 = r6
    c3 = r7

Native AVM-register mapping:
    r0 → AVR r8:r9
    r1 → AVR r10:r11
    r2 → AVR r12:r13
    r3 → AVR r14:r15
    r4 → AVR r16:r17
    r5 → AVR r18:r19
    r6 → AVR r20:r21
    r7 → AVR r22:r23

Special state:
    PC    AVR r24:r25
    SP    AVR Y
    CB    GPIOR1
    PB    GPIOR2
    FLAGS AVR r3

Interpreter constants:
    AVR r2 = zero
    AVR r7 = configured primary dispatch-slot stride in AVR words

Data-space conventions:
    0x0000–0x00FF native registers and I/O
    0x0100–0x04FF globals
    0x0500–0x08FF framebuffer
    0x0900–0x09FF VM stack
    0x0A00–0x0AFF interpreter-reserved

Pointers:
    Data pointer      16 bits
    Program pointer   24 bits
    Function pointer  24 bits
    Null pointers     all zero

Execution address:
    CB:PC

Program-data address:
    PB:rN

Code banks:
    256 banks
    64 KiB each
    No function or instruction crosses a bank

Calling convention:
    c0–c3 caller-saved arguments/results
    r0–r3 callee-saved
    r3 optional frame pointer
    Three-byte return addresses

Primary dispatch:
    256 fixed-stride slots
    AVR r7 contains the configured stride in instruction words
    Slot size, table footprint, placement, and dispatch timing are implementation-defined

Reserved primary range:
    0x50–0x6F reserved for profile-guided future use
    Postincrement load/store remains in memory extension 0xFD

Linked image:
    256-byte header at logical address 0
    .data initializer begins at logical address 0x000100
    Mandatory 8-byte AVT tail stores imagePageCount
    Development tail is found at 0xFFFFF8 or 0xFFEFF8

Allocation model:
    Static SRAM only
    No heap

LLVM address spaces:
    AS0 AVR data space, 16-bit pointers
    AS1 program space, 24-bit pointers

Linked image:
    0x000000–0x0000FF fixed 256-byte header
    Magic is 41 56 4D 01; runtimeVersion is one compatibility byte
    .data initializer begins at logical/file offset 0x000100
    .data copies to SRAM 0x0100; .bss follows it contiguously
    First ordinary program section begins at the next 256-byte boundary
    File offsets equal logical program addresses
    File length, not a header field, is the stored image size
    Physical image base and flat file length are 256-byte aligned
    Header CRC is stored at 0xFC and covers bytes 0x00–0xFB
    saveSize is a 16-bit value limited to 1024 bytes
    Code and immutable data may be interleaved after programStart
```

This specification provides the architectural contract required to implement the AVM interpreter, assembler, linker, runtime, and LLVM/Clang backend.

[1]: https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7766-8-bit-AVR-ATmega16U4-32U4_Datasheet.pdf "ATmega16U4/32U4 Datasheet"
[2]: https://ww1.microchip.com/downloads/en/DeviceDoc/AVR-InstructionSet-Manual-DS40002198.pdf "AVR® Instruction Set Manual"
[3]: https://llvm.org/docs/WritingAnLLVMBackend.html?utm_source=chatgpt.com "Writing an LLVM Backend — LLVM 23.0.0git documentation"
