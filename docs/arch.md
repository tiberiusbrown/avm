Below is the consolidated architecture report incorporating the large code-space model, direct SRAM pointers, no-heap environment, fixed-slot dispatch table, and revised AVR register assignment.

# Arduboy Virtual Machine Architecture

## 1. Purpose and design goals

The Arduboy Virtual Machine is a compact bytecode architecture intended for the Arduboy FX, an ATmega32U4-based handheld console with external SPI flash.

The VM is intended to:

* Support applications substantially larger than 64 KiB.
* Serve as a practical target for a custom LLVM/Clang backend.
* Execute bytecode directly from external SPI flash.
* Overlap bytecode fetch with instruction execution.
* Use one-byte instructions whenever practical.
* Keep common instruction handlers within approximately 8–10 AVR cycles.
* Minimize runtime SRAM overhead.
* Map VM registers directly onto AVR CPU registers.
* Preserve invalid null pointers through direct SRAM addressing.
* Support C and a useful subset of C++ without requiring dynamic allocation.
* Use a completely handwritten AVR assembly interpreter.

The architecture is optimized for the following approximate instruction timing:

```text
External SPI byte fetch: 17–18 cycles
Dispatch overhead:        8–9 cycles
Available execution time: 8–10 cycles
```

Longer or uncommon instructions may take additional cycles and may use secondary dispatch tables or out-of-line handlers.

---

# 2. Architectural summary

The VM has:

```text
Eight 16-bit general-purpose registers
Four compact general-purpose registers
One 16-bit VM stack pointer
One 16-bit within-bank program counter
One 8-bit current code bank
One 8-bit program-address bank latch
One condition-code register

16-bit directly mapped SRAM pointers
24-bit program-space and function pointers

1 KiB static global storage
1 KiB framebuffer
256-byte VM stack
No heap
```

The basic architectural state is:

```text
r0–r7     Eight 16-bit general-purpose registers
SP        16-bit VM stack pointer
PC        16-bit offset within the current code bank
CB        8-bit current code bank
PB        8-bit program-address bank latch
FLAGS     VM condition flags
```

The complete execution address is:

```text
CB:PC
```

A program-space pointer used for data access or indirect control flow is formed as:

```text
PB:rN
```

where `rN` supplies the low 16 bits.

---

# 3. General-purpose registers

## 3.1 Register file

The VM has eight uniform 16-bit registers:

```text
r0 r1 r2 r3 r4 r5 r6 r7
```

Each register also has an addressable low byte:

```text
b0 b1 b2 b3 b4 b5 b6 b7
```

An 8-bit value is stored in the low byte of a register. Unless explicitly extended, the high byte may be undefined.

For example:

```text
LD8 r0,[r1]
```

updates `b0`, but does not necessarily clear the high byte of `r0`.

Instructions such as the following explicitly canonicalize byte values:

```text
ZEXT8 rN
SEXT8 rN
```

## 3.2 Compact register class

The compact register class consists of:

```text
r0 r1 r2 r3
```

Two compact registers can be encoded in one nibble:

```text
bits 3:2 = destination
bits 1:0 = source
```

This permits one-byte encodings for common register-to-register operations.

The remaining registers:

```text
r4 r5 r6 r7
```

use extended instruction encodings when an instruction needs to name them explicitly.

---

# 4. Recommended AVR CPU register assignment

The recommended interpreter register assignment is:

```asm
; ------------------------------------------------------------
; Fixed interpreter and dispatch state
; ------------------------------------------------------------

r0-r1      Native MUL result, dispatch multiplication result,
           temporary scratch

r2         Permanent zero register and SPI dummy-transmit byte

r3         General interpreter scratch

r4         General interpreter scratch

r5         VM FLAGS

r6         Current bytecode opcode or operand scratch

r7         Constant 32, the handler-slot stride in AVR words

; ------------------------------------------------------------
; VM register file
; ------------------------------------------------------------

r8-r9      VM r4
r10-r11    VM r5
r12-r13    VM r6
r14-r15    VM r7

r16-r17    VM r0, compact register
r18-r19    VM r1, compact register
r20-r21    VM r2, compact register
r22-r23    VM r3, compact register

; ------------------------------------------------------------
; Persistent addressing state
; ------------------------------------------------------------

r24-r25    Logical PC within the current 64 KiB code bank

r26-r27    X: general-purpose address scratch

r28-r29    Y: VM stack pointer

r30-r31    Z: dispatch target and general address scratch

; ------------------------------------------------------------
; State held in AVR general-purpose I/O registers
; ------------------------------------------------------------

GPIOR1     Current Code Bank, CB
GPIOR2     Program Address Bank, PB
```

An alternative implementation may keep `CB` and `PB` in AVR registers such as `r3` and `r4`. However, placing them in `GPIOR1` and `GPIOR2` frees two CPU registers for scratch use while still allowing one-cycle `IN` and `OUT` access.

`CB` and `PB` are not needed during most one-byte arithmetic or RAM instructions, so they do not need to occupy scarce CPU registers permanently.

---

# 5. Rationale for the AVR register assignment

## 5.1 Compact registers occupy AVR `r16–r23`

The compact VM registers are mapped to:

```text
VM r0 → AVR r16:r17
VM r1 → AVR r18:r19
VM r2 → AVR r20:r21
VM r3 → AVR r22:r23
```

This is important because AVR instructions have asymmetric register restrictions.

Relevant native instructions include:

```text
LDI, CPI, SUBI, SBCI, ANDI, ORI    r16–r31 only
MULS                                r16–r31 only
MULSU                               r16–r23 only
ADIW, SBIW                          selected upper register pairs only
```

Mapping the most commonly used VM registers to `r16–r23` gives them access to the most useful AVR instruction subset.

In particular, `r16–r23` is the only native register range supporting `MULSU` directly.

The physical mapping therefore reinforces the ISA distinction between compact and noncompact registers.

## 5.2 Noncompact registers occupy AVR `r8–r15`

VM registers `r4–r7` are expected to hold:

* Longer-lived values
* Callee-saved values
* Values live across calls
* Less frequently accessed locals

They do not need access to AVR immediate or signed-multiply instructions as frequently as the compact class.

All four pairs remain compatible with `MOVW`.

## 5.3 `r0:r1` are native multiply and dispatch scratch

All AVR multiply instructions write their result to:

```text
r1:r0
```

The dispatch implementation also uses `MUL`, so `r0:r1` are necessarily destroyed during every bytecode dispatch.

They must therefore remain interpreter scratch and cannot contain persistent VM state.

## 5.4 `r2` is the permanent zero register

The normal AVR-GCC ABI expects `r1` to remain zero. That convention is unsuitable for this interpreter because every dispatch may execute `MUL`, which overwrites `r1`.

The interpreter instead reserves:

```text
r2 = 0
```

This zero register can be used for:

* SPI dummy writes
* Clearing bytes
* Carry propagation
* Zero extension
* Comparisons against zero

For example:

```asm
out SPDR, r2
```

starts the next SPI transfer using a zero dummy byte.

Any boundary into ordinary compiler-generated AVR code must restore the native ABI expectation that `r1` is zero.

## 5.5 `PC` occupies `r24:r25`

The low 16 bits of the logical program counter are persistent interpreter state and must be available for:

* Relative branches
* Calls
* Return-address construction
* Restarting instruction fetch after data reads
* Debugging and traps
* Computing physical flash addresses

Using `r24:r25` permits efficient increments with `ADIW`:

```asm
adiw r24, 1
adiw r24, 2
adiw r24, 3
adiw r24, 4
```

The linker guarantees that sequential execution never crosses a 64 KiB bank boundary, so an ordinary PC increment never propagates into `CB`.

## 5.6 `Y` is the VM stack pointer

The VM stack pointer is mapped to:

```text
Y = r28:r29
```

rather than `X`.

Both support predecrement and postincrement, but `Y` additionally supports displacement addressing through `LDD` and `STD`.

A stack-relative VM instruction can therefore map directly to native AVR operations:

```text
LDSP8 r0,[SP+7]
```

may execute approximately as:

```asm
ldd r16, Y+7
```

A 16-bit stack-relative access can use:

```asm
ldd r18, Y+12
ldd r19, Y+13
```

This is substantially cheaper than using `X`, which would require copying the pointer into `Y` or `Z` before displaced access.

## 5.7 `X` and `Z` are interpreter address scratch

`X` is available for:

* General RAM addresses
* Pointer calculations
* Temporary framebuffer access
* System-call handlers

`Z` is used for:

* Computed dispatch targets
* Secondary dispatch tables
* General address calculations
* Out-of-line handler jumps

Handlers may use `Z` temporarily, but it must contain the next dispatch target before `IJMP`.

---

# 6. VM flags

The VM condition register is stored in AVR `r5`.

Recommended bit assignments mirror the relevant AVR status-register positions:

```text
bit 0    C    Carry or borrow
bit 1    Z    Zero
bit 2    N    Negative
bit 3    V    Signed overflow
bit 4    S    Signed result, N xor V
```

The `S` flag is stored explicitly because signed branches are common and should not need to recompute `N xor V`.

A flag-producing 16-bit operation might end with:

```asm
add VM_DST_LO, VM_SRC_LO
adc VM_DST_HI, VM_SRC_HI
in  r5, SREG
andi r5, 0x1F
```

The dispatch process may overwrite native `SREG`, but the VM flags remain preserved in `r5`.

Operations that do not architecturally modify VM flags must not alter `r5`.

---

# 7. SRAM memory model

## 7.1 Direct physical mapping

VM pointers are actual ATmega32U4 data-space addresses.

The VM uses:

| Address range   |        Size | Purpose                                |
| --------------- | ----------: | -------------------------------------- |
| `0x0000–0x00FF` |   256 bytes | Invalid VM pointer range               |
| `0x0100–0x04FF` | 1,024 bytes | Static globals                         |
| `0x0500–0x08FF` | 1,024 bytes | Display framebuffer                    |
| `0x0900–0x09FF` |   256 bytes | VM stack                               |
| `0x0A00–0x0AFF` |   256 bytes | Interpreter state and native AVR stack |

A VM RAM pointer requires no translation:

```text
VM pointer = AVR SRAM address
```

This allows:

```text
nullptr = 0x0000
```

to be a genuinely invalid pointer.

All addresses below `0x0100` are invalid for VM memory accesses.

## 7.2 Global memory

The 1 KiB global region contains:

* `.data`
* `.bss`
* Static local variables
* Compiler-generated static objects
* Fixed application runtime state

Its address range is:

```text
0x0100–0x04FF
```

The linker must reject applications whose total static RAM allocation exceeds 1 KiB.

## 7.3 Framebuffer

The framebuffer occupies:

```text
0x0500–0x08FF
```

This is 1,024 bytes, corresponding to a 128×64 monochrome display.

Framebuffer pointers are ordinary RAM pointers.

## 7.4 VM stack

The VM stack occupies:

```text
0x0900–0x09FF
```

Initial stack pointer:

```text
SP = 0x0A00
```

The stack grows downward.

## 7.5 Invalid accesses

Release execution may treat invalid accesses as undefined behavior.

A diagnostic interpreter may trap accesses outside:

```text
0x0100–0x09FF
```

This includes:

* Null dereferences
* Low AVR register-file or I/O addresses
* Interpreter-private SRAM
* Native stack memory

---

# 8. No heap

The VM has no dynamic heap.

The standard runtime does not provide ordinary implementations of:

```text
malloc
calloc
realloc
free
operator new
operator delete
```

Placement `new` remains valid because it does not allocate memory.

Variable-length arrays and `alloca` should be disabled or strongly discouraged because the VM stack is only 256 bytes.

C++ features that implicitly allocate memory must either:

* Be unsupported
* Use user-provided fixed storage
* Be lowered to a specialized fixed-capacity implementation

The lack of a heap does not otherwise require changes to the instruction set.

---

# 9. Program address space

## 9.1 24-bit program addresses

Code and immutable program data use a 24-bit logical address space:

```text
0x000000–0xFFFFFF
```

This allows a VM image to address up to 16 MiB of code and constant data.

Program address zero is reserved as the null program pointer:

```text
null program pointer = 0x000000
```

The linker must not place code or data at logical program address zero.

## 9.2 Banked execution model

The program address space is divided into 256 banks of 64 KiB each:

```text
bank 0      0x000000–0x00FFFF
bank 1      0x010000–0x01FFFF
...
bank 255    0xFF0000–0xFFFFFF
```

Execution state is represented as:

```text
CB:PC
```

where:

```text
CB = address bits 23:16
PC = address bits 15:0
```

`CB` is the current code bank.

`PC` is the offset of the next bytecode byte within that bank.

## 9.3 Bank-boundary restrictions

To keep ordinary PC updates 16-bit, the linker must guarantee:

* No function crosses a 64 KiB boundary.
* No bytecode instruction crosses a bank boundary.
* No basic-block fallthrough crosses a bank boundary.
* No sequential instruction stream wraps from `0xFFFF` to `0x0000`.
* Each function ends with an explicit control transfer before the bank boundary.
* Unused space at the end of a bank contains trapping opcodes.

An individual function larger than 64 KiB is rejected.

The full application may occupy many banks.

---

# 10. Difference between CB and PB

## 10.1 Current code bank

`CB` is part of the currently executing program counter:

```text
execution address = CB:PC
```

It identifies the bank from which bytecode is currently being executed.

Ordinary instructions, short branches, and near calls do not change `CB`.

Far calls, far jumps, indirect far control flow, and returns may change it.

## 10.2 Program-address bank latch

`PB` is an addressing latch used to form a separate program-space address:

```text
program access address = PB:rN
```

It is used for:

* Program-space data loads
* Flash-resident strings
* Sprite data
* Lookup tables
* Indirect far calls
* Indirect far jumps

For example:

```text
CB = 0x03
PC = 0x8000

PB = 0x0A
r2 = 0x1200
```

means that execution is occurring at:

```text
0x038000
```

while:

```text
LDP8 r0,[PB:r2]
```

reads from:

```text
0x0A1200
```

`CB` answers:

```text
Where is the VM executing?
```

`PB` answers:

```text
Which program-space bank is the VM accessing or jumping to indirectly?
```

---

# 11. Program-pointer representation

## 11.1 In memory

Program-space pointers and function pointers occupy three packed bytes:

```text
byte 0    address bits 7:0
byte 1    address bits 15:8
byte 2    address bits 23:16
```

They have one-byte alignment.

Therefore:

```text
sizeof(function pointer) = 3
sizeof(program pointer)  = 3
```

## 11.2 In VM registers

The canonical register representation of a program pointer uses two VM registers:

```text
rL             low 16 bits
low byte rH    high 8 bits
high byte rH   unspecified
```

For example:

```text
r2  = address bits 15:0
b3  = address bits 23:16
```

Before an access, the compiler emits:

```text
MTPB b3
LDP8 r0,[PB:r2]
```

For an indirect call:

```text
MTPB b3
CALLP r2
```

`PB` is therefore a temporary hardware-style address latch, not the canonical storage location for arbitrary live program pointers.

This permits multiple program pointers to remain live simultaneously.

## 11.3 Program-pointer arithmetic

Program pointers are legalized as a 16-bit low component and an 8-bit high component.

Adding a 16-bit value conceptually performs:

```text
low16 += offset
high8 += carry
```

The ISA does not need a general-purpose 24-bit register file.

Rare or complex 24-bit operations may be implemented by compiler-generated sequences or runtime helpers.

---

# 12. Physical flash translation

Each VM image has a 24-bit physical base address in the FX flash.

The physical address of a logical program location is:

```text
physical flash address = image base + logical program address
```

This translation is needed when:

* Starting program execution
* Taking a jump
* Taking a call
* Returning
* Reading program-space data
* Restarting the instruction stream after a data access

It is not needed for every sequential byte fetch because the SPI flash internally advances its read address.

The VM image therefore remains position-independent within the physical FX flash.

---

# 13. Primary bytecode encoding

The ISA is variable-length and optimized around one-byte compact-register instructions.

## 13.1 Compact binary instruction format

For primary opcodes `0x00–0xBF`:

```text
bits 3:2    destination or address register
bits 1:0    source register
```

The register fields name only:

```text
r0–r3
```

## 13.2 Primary opcode map

| Opcode range | Instruction    | Length |
| ------------ | -------------- | -----: |
| `0x0dss`     | `MOV cD,cS`    |      1 |
| `0x1dss`     | `ADD cD,cS`    |      1 |
| `0x2dss`     | `SUB cD,cS`    |      1 |
| `0x3dss`     | `AND cD,cS`    |      1 |
| `0x4dss`     | `OR cD,cS`     |      1 |
| `0x5dss`     | `XOR cD,cS`    |      1 |
| `0x6dss`     | `CMP16 cD,cS`  |      1 |
| `0x7dss`     | `CMP8 cD,cS`   |      1 |
| `0x8daa`     | `LD8 cD,[cA]`  |      1 |
| `0x9aas`     | `ST8 [cA],cS`  |      1 |
| `0xAdaa`     | `LD16 cD,[cA]` |      1 |
| `0xBaas`     | `ST16 [cA],cS` |      1 |

Here:

```text
d = compact destination
s = compact source
a = compact address register
```

`MOV r0,r0` may be used as `NOP`.

## 13.3 Unary and stack operations

| Opcode range | Instruction | Length |
| ------------ | ----------- | -----: |
| `0xC0–0xC7`  | `INC16 rN`  |      1 |
| `0xC8–0xCF`  | `DEC16 rN`  |      1 |
| `0xD0–0xD7`  | `LSR8 rN`   |      1 |
| `0xD8–0xDF`  | `ASR8 rN`   |      1 |
| `0xE0–0xE7`  | `PUSH16 rN` |      1 |
| `0xE8–0xEF`  | `POP16 rN`  |      1 |

These instructions encode any of the eight VM registers directly in the low three opcode bits.

## 13.4 Immediate, branch, and escape instructions

| Opcode      | Instruction                        |   Length |
| ----------- | ---------------------------------- | -------: |
| `0xF0–0xF3` | `LDI8 cN,imm8`                     |        2 |
| `0xF4`      | `CMPI6 cN,simm6`                   |        2 |
| `0xF5`      | `BRcc rel5`                        |        2 |
| `0xF6`      | `JMP rel8`                         |        2 |
| `0xF7`      | `LDSP width,cN,[SP+u5]`            |        2 |
| `0xF8`      | `STSP width,[SP+u5],cN`            |        2 |
| `0xF9`      | `CALL rel8`                        |        2 |
| `0xFA`      | `ADJSP simm8`                      |        2 |
| `0xFB`      | Full-register extension page       | Variable |
| `0xFC`      | Extended ALU/control/system page   | Variable |
| `0xFD`      | Extended memory/program-space page | Variable |
| `0xFE`      | Direct far control transfer        |        4 |
| `0xFF`      | `RET`                              |        1 |

An extended `LDI8` form must be provided for `r4–r7`.

The compact two-byte form is retained because compact registers are expected to receive most immediate values.

---

# 14. Full-register extension page

Opcode `0xFB` introduces common operations involving any of the eight VM registers.

A useful second-byte format is:

```text
bits 7:6    operation
bits 5:3    destination
bits 2:0    source
```

Suggested operations:

| Operation field | Instruction   |
| --------------: | ------------- |
|            `00` | `MOV rD,rS`   |
|            `01` | `ADD rD,rS`   |
|            `10` | `SUB rD,rS`   |
|            `11` | `CMP16 rD,rS` |

These two-byte forms allow all eight VM registers to participate without requiring moves through the compact register class.

Less common full-register operations may use additional subopcodes in other extension pages.

---

# 15. Extended ALU instructions

The extended ALU page should include:

```text
NOT16 rN
NEG16 rN

LSL16 rN
LSR16 rN
ASR16 rN

ZEXT8 rN
SEXT8 rN
SWAP8 rN

ANDX rD,rS
ORX  rD,rS
XORX rD,rS

CMP8X rD,rS

ADC rD,rS
SBC rD,rS

LDI8  rD,imm8
LDI16 rD,imm16

ADDI16 rD,imm16
SUBI16 rD,imm16
ANDI16 rD,imm16
ORI16  rD,imm16
XORI16 rD,imm16
CMPI16 rD,imm16
```

The physical AVR register mapping affects the native cost of these operations but not their architectural meaning.

For example, immediate operations on VM `r0–r3` may use native upper-register instructions more easily than the same operations on VM `r4–r7`.

The LLVM cost model should account for this difference.

---

# 16. Multiplication

## 16.1 Unsigned multiplication

Native AVR `MUL` accepts all CPU registers, so an unsigned byte multiply can support any VM registers.

Suggested semantic operation:

```text
MULU8 rD,rS
```

The low bytes are multiplied and the 16-bit result is written to `rD`.

Because native multiplication overwrites AVR `r1:r0`, the handler must move the result before returning to dispatch.

## 16.2 Signed multiplication

Native `MULS` operates only on AVR `r16–r31`.

VM `r0–r3` are mapped to `r16–r23`, so compact signed multiplication can be implemented directly.

Suggested compact operation:

```text
MULS8 cD,cS
```

A full-register signed multiply may:

* Copy operands into high-register scratch
* Use an out-of-line handler
* Be lowered by the compiler through compact registers

## 16.3 Mixed signed/unsigned multiplication

Native `MULSU` is restricted to AVR `r16–r23`.

That range exactly contains compact VM registers `r0–r3`.

The preferred architectural form is therefore:

```text
MULSU8 cD,cS
```

with compact operands only.

For noncompact operands, LLVM should insert moves into compact registers or use a software sequence.

This is one of the few cases where native AVR register restrictions should directly influence the VM instruction operand class.

## 16.4 Sixteen-bit multiplication

A full 16×16 multiplication may be implemented as:

* A compiler-generated sequence of byte multiplies
* A runtime helper
* A future extended VM instruction if profiling justifies it

No dedicated 32-bit result register is required.

---

# 17. RAM memory operations

## 17.1 Indirect access

Ordinary RAM loads and stores use direct 16-bit pointers:

```text
LD8   rD,[rA]
ST8   [rA],rS
LD16  rD,[rA]
ST16  [rA],rS
```

The compact forms are one byte when both registers are compact.

The native handler copies the pointer into `X` or `Z` as needed.

## 17.2 Displaced access

The extended memory page should provide:

```text
LD8   rD,[rA+simm8]
ST8   [rA+simm8],rS
LD16  rD,[rA+simm8]
ST16  [rA+simm8],rS
LEA   rD,[rA+simm8]
```

These are useful for:

* Structures
* Arrays
* Stack frames too large for compact offsets
* Field accesses
* Compiler-generated address calculations

## 17.3 Direct global access

Direct-global instructions encode a 10-bit offset:

```text
address = 0x0100 + global10
```

Suggested forms:

```text
LDG8
STG8
LDG16
STG16
LEAG
```

These avoid materializing a full 16-bit pointer for accesses to statically allocated objects.

## 17.4 Direct framebuffer access

Framebuffer instructions use:

```text
address = 0x0500 + framebuffer10
```

Suggested forms:

```text
LDFB8
STFB8
LDFB16
STFB16
LEAFB
```

These are optional performance encodings rather than a distinct pointer type.

---

# 18. Stack-relative access

Compact stack-relative instructions use an unsigned five-bit displacement:

```text
0–31 bytes
```

Operand format:

```text
bit 7       width: 0 = byte, 1 = word
bits 6:5    compact VM register
bits 4:0    stack offset
```

Instructions:

```text
LDSP
STSP
```

The stack pointer’s placement in AVR `Y` allows these to map directly to native `LDD` and `STD`.

Although native AVR displacement addressing supports a larger range, the five-bit VM field is retained to preserve the two-byte encoding.

Larger offsets use extended stack or general displaced-memory instructions.

---

# 19. Stack behavior

The VM stack grows downward from:

```text
0x0A00
```

## 19.1 Word push

For a 16-bit word:

```text
SP = SP - 2
memory[SP + 0] = low byte
memory[SP + 1] = high byte
```

A native implementation may store the high byte first with predecrement, followed by the low byte.

## 19.2 Word pop

A pop reads:

```text
low byte  = memory[SP + 0]
high byte = memory[SP + 1]
SP = SP + 2
```

## 19.3 Return addresses

All return addresses are 24-bit logical program addresses.

A call pushes:

```text
SP = SP - 3
memory[SP + 0] = return address bits 7:0
memory[SP + 1] = return address bits 15:8
memory[SP + 2] = return address bits 23:16
```

`RET` restores both `PC` and `CB`.

Using a uniform three-byte return address avoids separate near-return and far-return conventions.

---

# 20. Near control flow

## 20.1 Conditional branch

```text
BRcc rel5
```

The condition and signed displacement are encoded in one operand byte.

Suggested conditions:

```text
EQ     equal
NE     not equal
ULT    unsigned less than
UGE    unsigned greater than or equal
SLT    signed less than
SGE    signed greater than or equal
ULE    unsigned less than or equal
UGT    unsigned greater than
```

A short branch does not change `CB`.

## 20.2 Short jump

```text
JMP rel8
```

The target must remain in the current bank.

## 20.3 Short call

```text
CALL rel8
```

The target remains in the current bank, but the call still pushes a full 24-bit return address.

## 20.4 Same-bank long control flow

Extended control instructions provide:

```text
JMP16 address16
CALL16 address16
```

These replace the low 16-bit `PC` while retaining the current `CB`.

Indirect same-bank operations may include:

```text
JMPR rN
CALLR rN
```

where the target is:

```text
CB:rN
```

---

# 21. Direct far control flow

Opcode `0xFE` encodes a direct 24-bit control target.

Suggested format:

```text
0xFE T0 T1 T2
```

The low target bit can distinguish call from jump because direct far targets are required to be two-byte aligned:

```text
link   = T0 bit 0
target = T2:T1:(T0 & 0xFE)
```

Semantics:

```text
link = 0    JMPF target
link = 1    CALLF target
```

## 21.1 Far call

`CALLF`:

1. Pushes the 24-bit return address.
2. Loads the target bank into `CB`.
3. Loads the target offset into `PC`.
4. Translates the logical address to a physical FX address.
5. Restarts sequential SPI instruction fetch.

## 21.2 Far jump

`JMPF`:

1. Loads the target bank into `CB`.
2. Loads the target offset into `PC`.
3. Restarts sequential instruction fetch.
4. Does not modify the stack.

Far jumps are used for:

* Cross-bank tail calls
* Linker-generated veneers
* Cross-bank runtime entries

---

# 22. Program-bank instructions

The control extension page should provide:

```text
MTPB bN       PB = low byte of rN
MFPB bN       low byte of rN = PB
LDPBI imm8    PB = immediate
```

With `PB` stored in a GPIOR, these operations map naturally to `OUT` and `IN`.

Indirect program control uses:

```text
CALLP rN
JMPP  rN
```

Their target is:

```text
PB:rN
```

For example:

```text
MTPB b3
CALLP r2
```

performs a far indirect call to the 24-bit program pointer held in `r2` and `b3`.

---

# 23. Program-space data access

The extended memory page should provide:

```text
LDP8       rD,[PB:rA]
LDP16      rD,[PB:rA]

LDP8_POST  rD,[PB:rA]+
LDP16_POST rD,[PB:rA]+
```

Postincrement updates the complete 24-bit address, including carry into `PB`.

A scalar program-space access interrupts sequential bytecode fetch:

1. Preserve the logical next-PC state.
2. End or suspend the current SPI read stream.
3. Form the physical address from `PB:rA`.
4. Read the requested program data.
5. Reconstruct the physical address of `CB:PC`.
6. Restart bytecode prefetch.

Consequently, scalar program-space loads are architecturally necessary but expensive.

Libraries should prefer:

* Bulk program-memory copies
* Sequential postincrement reads
* Flash-aware sprite operations
* System services that consume complete assets
* Hoisting frequently used constants into static RAM

---

# 24. System services

Platform-specific operations should use a versioned system-call interface rather than consuming core opcode space.

Suggested form:

```text
SYS service_id
```

Possible services include:

```text
SYS_YIELD
SYS_GET_BUTTONS
SYS_DISPLAY
SYS_CLEAR_DISPLAY
SYS_AUDIO
SYS_RANDOM
SYS_FLASH_COPY
SYS_DRAW_SPRITE
SYS_SAVE_READ
SYS_SAVE_WRITE
SYS_EXIT
```

Arguments and results use ordinary VM registers.

The system ABI is versioned separately from the integer ISA.

Because the interpreter is entirely handwritten assembly, system-call handlers should also be written in assembly or use a carefully defined bridge to native compiled code.

---

# 25. Calling convention

## 25.1 Register volatility

```text
r0–r3    Caller-saved
r4–r7    Callee-saved

PB       Caller-saved
FLAGS    Caller-saved

SP       Restored by the callee
CB       Restored by RET
```

`r7` may optionally serve as a frame pointer.

## 25.2 Arguments

Arguments are assigned in 16-bit units:

```text
unit 0    r0
unit 1    r1
unit 2    r2
unit 3    r3
remaining units on the stack
```

Examples:

| Type            | Argument representation                            |
| --------------- | -------------------------------------------------- |
| `i8`            | Low byte of one register                           |
| `i16`           | One register                                       |
| RAM pointer     | One register                                       |
| `i32`           | Two registers                                      |
| Program pointer | Low 16 bits in one register, bank byte in the next |
| `i64`           | Four 16-bit units                                  |

## 25.3 Return values

| Type            | Return location                   |
| --------------- | --------------------------------- |
| `i8`            | `b0`                              |
| `i16`           | `r0`                              |
| RAM pointer     | `r0`                              |
| `i32`           | `r0:r1`                           |
| Program pointer | Low 16 bits in `r0`, bank in `b1` |
| Large aggregate | Hidden RAM result pointer         |

## 25.4 Variadic functions

All arguments to variadic functions should be passed on the stack.

This allows `va_list` to remain a simple RAM pointer and avoids creating a register-save area.

## 25.5 Frame pointer

The frame pointer is omitted by default.

`r7` may be reserved as a frame pointer for:

* Debug builds
* Dynamic stack adjustments
* Functions whose frame cannot be efficiently addressed from `SP`

## 25.6 Tail calls

Tail calls restore the current frame and then use:

```text
JMP
JMP16
JMPR
JMPF
JMPP
```

depending on target distance and pointer type.

---

# 26. C and C++ data model

Recommended sizes:

| Type                  |              Size |
| --------------------- | ----------------: |
| `char`                |            8 bits |
| `short`               |           16 bits |
| `int`                 |           16 bits |
| `long`                |           32 bits |
| `long long`           |           64 bits |
| RAM pointer           |           16 bits |
| Function pointer      |           24 bits |
| Program-space pointer |           24 bits |
| `float`               |           32 bits |
| `double`              | Initially 32 bits |

All ABI alignments may be one byte.

Unaligned 16-bit accesses are legal.

## 26.1 `long long`

No dedicated 64-bit VM support is required.

LLVM may support `long long` using:

* Four 16-bit values
* Expanded arithmetic sequences
* Runtime helper functions
* Memory-based argument or return conventions

Programs that do not use 64-bit operations pay no bytecode or runtime cost.

Complex 64-bit operations such as division should lower to compiler runtime calls.

## 26.2 Floating point

Floating-point operations are implemented through runtime helpers.

No floating-point bytecode instructions are required initially.

---

# 27. LLVM address spaces

Use distinct LLVM address spaces:

```text
address space 0    SRAM
address space 1    Program space
```

Functions reside in program address space 1.

RAM pointers are 16 bits.

Program and function pointers are 24 bits.

A possible data layout is:

```text
e-m:e-p:16:8:8:16-p1:24:8:8:24-P1-G0-A0-i8:8:8-i16:8:8-i32:8:8-i64:8:8-n8:16-S8
```

The exact mangling and frontend address-space syntax can be refined during backend implementation.

---

# 28. LLVM register classes

Suggested register classes:

```text
GPR16     r0–r7
CGPR16    r0–r3

GPR8      low-byte subregisters b0–b7
CGPR8     low-byte subregisters b0–b3
```

Program pointers use a compound representation:

```text
low 16 bits     GPR16
high 8 bits     low-byte subregister of another GPR16
```

`PB` is a fixed physical machine register or special register used only by selected machine instructions.

It is not part of the general register allocator.

---

# 29. LLVM instruction selection and compression

Instruction selection should initially produce generic target machine instructions.

The recommended pipeline is:

1. Select generic VM operations.
2. Perform instruction legalization.
3. Allocate registers.
4. Prefer `r0–r3` through allocation hints.
5. Run a post-register-allocation compression pass.
6. Replace eligible instructions with compact one-byte forms.
7. Retain extended forms when operands use `r4–r7`.

This avoids constraining register allocation prematurely.

The allocator should strongly prefer compact registers for:

* Call arguments
* Return values
* Arithmetic
* Comparisons
* RAM pointers
* Multiply operands
* Short-lived temporaries
* Values used by one-byte instructions

Long-lived values and values live across calls naturally move toward `r4–r7`.

---

# 30. LLVM cost model implications

The native AVR mapping makes some VM operations cheaper on compact registers.

The compiler cost model should recognize:

* Compact arithmetic may encode in one byte.
* Compact registers occupy AVR `r16–r23`.
* Compact signed multiply can use native `MULS`.
* Compact mixed multiply can use native `MULSU`.
* Some constant operations are cheaper on compact registers.
* Noncompact forms may require extra native moves.
* Stack-relative accesses within 31 bytes are particularly cheap.
* Taken control transfers are much more expensive than sequential execution.
* Program-space scalar loads are high latency.
* Cross-bank calls are more expensive than same-bank calls.

This should influence:

* Register allocation
* Inlining
* Branch inversion
* Loop rotation
* Function placement
* Tail-call conversion
* Constant materialization
* Spill-slot ordering

---

# 31. Linker and bank placement

The linker must be bank-aware.

Required behavior:

1. Partition functions into 64 KiB banks.
2. Keep each function entirely within one bank.
3. Prevent instructions from crossing bank boundaries.
4. Prevent fallthrough across bank boundaries.
5. Align direct far-control targets to two bytes.
6. Reserve logical program address zero.
7. Relax far transfers into near transfers where possible.
8. Cluster strongly connected functions.
9. Place hot caller/callee groups together.
10. Reject any individual function larger than one bank.

## 31.1 Control-transfer relaxation

After final placement:

```text
CALLF → CALL rel8
```

when the target is close and in the same bank.

```text
CALLF → CALL16
```

when the target is in the same bank but not close.

Otherwise it remains:

```text
CALLF
```

Likewise:

```text
JMPF → JMP rel8
JMPF → JMP16
JMPF remains JMPF
```

## 31.2 Cross-bank veneers

A bank-local veneer may be emitted:

```asm
local_stub:
    JMPF remote_function
```

Local callers can then use a near call to the veneer.

Because the veneer jumps rather than calls, the remote function’s `RET` returns directly to the original caller.

---

# 32. Fixed-slot primary dispatch table

The interpreter uses 256 primary handler slots.

Each slot is:

```text
64 bytes
32 AVR instruction words
```

The complete table occupies:

```text
256 × 64 bytes = 16 KiB
```

The table base is aligned to at least 64 bytes.

Each starting bytecode opcode therefore has a statically known native handler address.

## 32.1 Operand-specialized handlers

Compact register operands are encoded into the primary opcode.

Each opcode has its own handler slot.

For example:

```text
0x11    ADD r0,r1
0x12    ADD r0,r2
0x16    ADD r1,r2
```

Each handler directly names the corresponding native AVR register pairs.

There is no runtime compact-register decoder.

This is a major reason for encoding compact register operands directly in the primary opcode.

## 32.2 Dispatch address calculation

The table is indexed in AVR instruction words.

Each handler occupies 32 words, so the target offset is:

```text
opcode × 32
```

Reserve:

```text
r6 = opcode
r7 = 32
```

A representative dispatch sequence is:

```asm
in    r6, SPDR
out   SPDR, r2

mul   r6, r7
movw  r30, r0

subi  r30, lo8(-(dispatch_table >> 1))
sbci  r31, hi8(-(dispatch_table >> 1))

ijmp
```

Approximate cycle count:

```text
IN             1
OUT            1
MUL            2
MOVW           1
SUBI           1
SBCI           1
IJMP           2
----------------
Total          9 cycles
```

This matches the expected dispatch budget.

If the table placement permits simpler base-address construction, dispatch may be reduced further.

## 32.3 Handler slot limits

A 64-byte slot contains 32 AVR words, not necessarily 32 AVR instructions, because some AVR instructions occupy two words.

A handler that does not fit should:

1. Perform its fast prefix within the slot.
2. Jump to an out-of-line implementation.
3. Return through the common dispatch path.

Escape opcodes naturally use secondary tables outside the primary 16 KiB dispatch region.

---

# 33. Instruction fetch pipeline

During normal execution:

1. The completed opcode byte is read from `SPDR`.
2. A dummy byte is immediately written to `SPDR`.
3. The next SPI transfer begins.
4. The current opcode is dispatched.
5. The handler executes while the next byte transfers.

A one-byte handler should ideally complete near the time the next SPI byte becomes available.

Multi-byte instructions consume already-prefetched operand bytes and initiate subsequent transfers as early as possible.

---

# 34. PC maintenance

Each primary handler knows its instruction length.

The handler advances `PC` using `ADIW` on AVR `r24:r25`.

Examples:

```asm
adiw r24, 1
adiw r24, 2
adiw r24, 4
```

Because instructions may not cross bank boundaries, ordinary sequential PC updates do not test for overflow and do not modify `CB`.

A malformed stream that wraps `PC` is undefined in release mode and may trap in diagnostic mode.

---

# 35. Taken control-transfer cost

A taken branch, jump, call, return, or program-space data access interrupts the sequential SPI stream.

A redirected fetch generally requires:

1. Compute the new logical address.
2. Add the VM image’s physical base.
3. Send a new SPI read command.
4. Send the physical flash address.
5. Restart prefetch.
6. Dispatch the target opcode.

The compiler should therefore prefer:

* Fallthrough on likely paths
* Branch inversion
* Small-function inlining
* Tail calls
* Same-bank placement
* Near calls
* Loop rotation
* Limited tail duplication
* Branchless sequences when cheaper

Encoded instruction length alone is not an adequate measure of branch cost.

---

# 36. Native ABI boundaries

The main interpreter uses a custom assembly convention.

If it calls ordinary AVR compiler-generated code:

* `r1` must be cleared before the call.
* Required AVR call-preserved registers must be saved.
* VM state occupying native registers must be protected.
* The native hardware stack must remain within its reserved SRAM.
* Interpreter invariants such as `r2 = 0` and `r7 = 32` must be restored afterward.

A representative bridge may perform:

```asm
clr r1
; save required VM and interpreter state
call native_function
; restore state
clr r2
ldi r24, 32
mov r7, r24
```

Frequently used services should remain handwritten assembly to avoid the bridge overhead.

Interrupt handlers should also be assembly-aware and minimize native stack usage.

---

# 37. Image format

Program-space sizes and offsets may exceed 64 KiB.

A host-side image header may use 32-bit fields while requiring program addresses to fit in 24 bits:

```c
struct AvmImageHeader {
    uint32_t magic;
    uint16_t isaVersion;
    uint16_t systemAbiVersion;

    uint32_t entryPoint;
    uint32_t programSize;

    uint32_t textOffset;
    uint32_t textSize;

    uint32_t rodataOffset;
    uint32_t rodataSize;

    uint32_t dataImageOffset;
    uint16_t dataImageSize;
    uint16_t bssSize;

    uint16_t requiredStaticBytes;
    uint16_t estimatedStackBytes;

    uint16_t flags;
    uint32_t crc32;
};
```

The packer verifies:

```text
entryPoint  < 2^24
programSize ≤ 2^24
all program addresses fit in 24 bits
static RAM usage ≤ 1024 bytes
estimated stack usage ≤ 256 bytes
```

Suggested sections:

```text
.header
.text
.rodata
.data.init
.metadata
.debug
```

`.data.init` resides in program space and is copied into SRAM during startup.

---

# 38. Final architecture

The resulting architecture is:

```text
Eight 16-bit VM registers
Four compact VM registers

Compact VM r0–r3 mapped to AVR r16–r23
Noncompact VM r4–r7 mapped to AVR r8–r15

Logical PC mapped to AVR r24:r25
VM stack pointer mapped to AVR Y
Dispatch target mapped through AVR Z
General RAM pointer scratch through AVR X

VM FLAGS stored in AVR r5
Zero stored in AVR r2
Opcode stored in AVR r6
Dispatch stride 32 stored in AVR r7

CB and PB stored in AVR general-purpose I/O registers

16-bit directly mapped SRAM pointers
24-bit program and function pointers

1 KiB static global memory
1 KiB framebuffer
256-byte VM stack
No heap

Banked 24-bit code space
No function or instruction crosses a 64 KiB bank boundary
Uniform three-byte return addresses

One-byte compact arithmetic and RAM operations
Two-byte short control, immediate, and stack operations
Four-byte direct far call and jump

Compact signed and mixed-sign multiply operations
Extended forms for noncompact registers

256 fixed primary handler slots
64 bytes per primary opcode
16 KiB primary dispatch table
Approximately nine-cycle dispatch
```

This design preserves a fast one-byte common path while supporting the full Arduboy FX program-address range and providing a sufficiently complete target for LLVM and Clang.
