# Arduboy Virtual Machine Architecture

**Status:** Version 1 design draft  
**Target host:** ATmega32U4-based Arduboy FX  
**Intended consumers:** AVR assembly interpreter, LLVM backend, Clang target, assembler, linker, image packer, debugger, runtime library, and system libraries

---

## 1. Document scope and authority

The Arduboy Virtual Machine, abbreviated **AVM**, is a compact bytecode architecture designed to execute applications directly from external SPI flash on an ATmega32U4.

This document defines the non-instruction architectural contract:

- Architectural state and register organization.
- Data and program address spaces.
- Pointer and scalar data representation.
- Calling convention.
- System ABI.
- LLVM and Clang target model.
- ELF, relocation, linker, and flat-image contracts.
- Interpreter integration requirements.
- Startup, save-storage, and image-discovery behavior.
- Diagnostics, compatibility, and undefined behavior.

The instruction set is specified separately in:

```text
docs/avm_isa.md
```

That document is the sole normative source for:

- Primary and secondary opcode assignments.
- Instruction mnemonics and operand forms.
- Encoded lengths and operand-byte formats.
- Instruction value semantics.
- Per-instruction condition-code effects.
- Branch displacement encodings.
- Reserved instruction encodings.
- Native AVR cycle estimates.

Instruction-level information is intentionally not duplicated here. If this document and `docs/avm_isa.md` appear to disagree about an instruction encoding or instruction semantic, `docs/avm_isa.md` is authoritative.

---

## 2. Design goals

AVM is optimized for:

- Bytecode programs and immutable assets larger than 64 KiB.
- Sequential bytecode streaming from SPI flash.
- One-byte encodings for high-frequency operations.
- A handwritten AVR assembly interpreter.
- Eight virtual registers permanently resident in native AVR registers.
- Operand-specialized primary dispatch.
- Direct mapping of VM data pointers to ATmega32U4 data-space addresses.
- A custom LLVM and Clang target.
- C and a useful freestanding subset of C++.
- Static allocation without a general-purpose heap.

AVM does not attempt to:

- Provide memory protection in optimized execution mode.
- Provide a built-in dynamically allocated heap.
- Guarantee constant instruction timing.
- Efficiently support unrestricted 64-bit arithmetic.
- Support an individual function larger than 64 KiB.
- Support self-modifying code.

---

## 3. Host constraints and design rationale

The ATmega32U4 data address space places the 32 native CPU registers at `0x0000–0x001F`, I/O and extended I/O below `0x0100`, and 2,560 bytes of internal SRAM at `0x0100–0x0AFF`. Native register-indirect addressing can address the register file as data memory, and only native `Y` and `Z` support displacement addressing. ([Microchip][1])

The device provides three general-purpose I/O registers. `GPIOR1` and `GPIOR2` are accessible through one-cycle `IN` and `OUT`, making them suitable for persistent bank state. ([Microchip][1])

Important native AVR register restrictions include:

- Immediate ALU operations generally require native registers `r16–r31`.
- `ADIW` and `SBIW` operate only on pairs beginning at `r24`, `r26`, `r28`, or `r30`.
- `MULS` uses the high native register set.
- `MULSU` is restricted to native registers `r16–r23`.
- Native multiplication places its result in `r1:r0`.

These restrictions motivate placing the compact AVM registers in native `r16–r23`, placing logical `PC` in `r24:r25`, placing AVM `SP` in native `Y`, and reserving native `r0:r1` as multiplication and dispatch scratch. ([Microchip][2])

---

## 4. Terminology and notation

The words **MUST**, **MUST NOT**, **SHOULD**, and **MAY** describe architectural requirements and recommendations.

```text
rN      One of the eight 16-bit architectural registers r0-r7
bN      The low byte of rN
cN      One of the four compact-register aliases c0-c3
A       Accumulator alias for c0/r4
qN      One of the four aligned 32-bit register-pair aliases q0-q3
PC      Sixteen-bit offset of the current instruction
CB      Current code bank
PB      Program-address bank latch
SP      VM stack pointer
CC      Architectural condition state
```

Existing interpreter source may use the implementation name `VM_FLAGS` for the native register that stores `CC`. `CC` is the architectural name.

Multi-byte values use little-endian order unless explicitly stated otherwise.

---

# Part I — Architectural State

## 5. General-purpose registers

AVM has eight 16-bit general-purpose registers:

```text
r0  r1  r2  r3  r4  r5  r6  r7
```

A register may hold:

- A 16-bit integer.
- A directly mapped data-space pointer.
- One word of a larger integer.
- Part of a 24-bit program pointer.
- Two independently managed byte values, although only the low byte has a distinct architectural name.

The low byte of each register is named:

```text
b0  b1  b2  b3  b4  b5  b6  b7
```

`bN` aliases bits `7:0` of `rN`. It is not separate storage.

---

## 6. Compact registers and accumulator

The compact aliases are:

```text
c0 = r4
c1 = r5
c2 = r6
c3 = r7
```

The accumulator alias is:

```text
A = c0 = r4
```

`A` does not add architectural storage. It names the register selected by accumulator-oriented instruction families and remains the first argument and return-value register under the calling convention.

The compact aliases exist because the corresponding native AVR registers occupy `r16–r23`, where the host ISA offers its strongest immediate and signed-multiply support.

---

## 7. Aligned 32-bit register pairs

The four aligned pair aliases are:

```text
q0 = r0:r1
q1 = r2:r3
q2 = r4:r5
q3 = r6:r7
```

Within each pair:

```text
first register   = bits 15:0
second register  = bits 31:16
```

The same pair representation is used for:

- 32-bit integer values.
- 32-bit floating-point values.
- Register-form 24-bit program and function pointers.
- Multiword argument and return allocation.

A 24-bit pointer held in a pair uses the low register for bits `15:0` and the low byte of the high register for bits `23:16`. The remaining high byte is zero in canonical form.

---

## 8. Native AVR register assignment

The current handwritten interpreter uses:

```asm
; Native dispatch and interpreter state
AVR r0-r1      Native MUL result, dispatch offset, scratch
AVR r2         Permanent zero and SPI dummy byte
AVR r3         AVM CC storage; may retain nonarchitectural SREG bits
AVR r4-r5      Interpreter scratch
AVR r6         Current opcode or operand scratch
AVR r7         Primary dispatch-slot stride in AVR words

; AVM register file
AVR r8-r9      AVM r0
AVR r10-r11    AVM r1
AVR r12-r13    AVM r2
AVR r14-r15    AVM r3
AVR r16-r17    AVM r4 = c0 = A
AVR r18-r19    AVM r5 = c1
AVR r20-r21    AVM r6 = c2
AVR r22-r23    AVM r7 = c3

; Addressing and dispatch
AVR r24-r25    AVM PC
AVR r26-r27    X, interpreter address scratch
AVR r28-r29    Y, AVM SP
AVR r30-r31    Z, dispatch and address scratch

; Persistent bank state
GPIOR1         CB
GPIOR2         PB
```

The mapping of an AVM register to the native register-file data address is regular:

```text
AVM rN low byte  = AVR r(8 + 2N)
AVM rN high byte = AVR r(9 + 2N)
```

This mapping is an interpreter contract used by generic handlers and debugger integrations. The ISA operand encodings that exploit it are defined only in `docs/avm_isa.md`.

---

## 9. Program counter and code bank

The architectural execution address is 24 bits:

```text
CB:PC
```

`CB` contains bits `23:16`.  
`PC` contains bits `15:0`.

At entry to a primary instruction handler:

```text
PC = logical address of the current primary opcode byte
```

Each handler computes the following instruction address from the encoded instruction length defined by `docs/avm_isa.md`.

Relative control-flow displacements are relative to the address immediately following the complete instruction.

The ordinary sequential path MUST NOT propagate `PC` overflow into `CB`. Linker constraints prevent valid fallthrough from crossing a 64 KiB bank boundary.

`CB` changes only through control transfers that explicitly replace the bank, return, startup, or debugger/trap recovery. Near control flow and sequential execution leave `CB` unchanged.

---

## 10. Program-address bank latch

`PB` is a separate bank latch used only to construct program-data addresses:

```text
program-data address = PB:rN
```

`PB` is distinct from `CB`:

```text
CB:PC  = current bytecode execution address
PB:rN  = independently constructed program-data address
```

Changing `PB` does not affect sequential instruction execution.

Indirect jumps and calls do not consume `PB`; they consume a canonical 24-bit
program or function pointer held in an aligned `qN` pair.

`PB` is caller-saved under the ABI.

---

## 11. Stack pointer

`SP` is a 16-bit directly mapped data-space pointer held in native `Y`.

The initial value is:

```text
SP = 0x0A00
```

The VM stack grows downward into:

```text
0x0900–0x09FF
```

`0x0A00` is the valid empty-stack value immediately above the VM stack.

There is no red zone. Stack overflow and underflow are undefined behavior in optimized execution mode.

---

## 12. Architectural condition state

AVM exposes only three architectural condition bits:

| Bit | Name | Architectural role |
|---:|---|---|
| 0 | `C` | Unsigned carry/borrow or unsigned-less condition |
| 1 | `Z` | Zero/equal condition |
| 4 | `S` | Signed-result or signed-less condition |

The bit positions intentionally match the corresponding AVR `SREG` positions.

After comparison and test operations:

```text
C = unsigned left operand is less than unsigned right operand
Z = operands are equal
S = signed left operand is less than signed right operand
```

The one-byte compact add and subtract operations also replace `CC` using the native 16-bit AVR arithmetic result:

```text
ADD: C = carry, Z = result is zero, S = N xor V
SUB: C = borrow, Z = result is zero, S = signed left operand is less than right
```

All other instructions preserve `CC` unless `docs/avm_isa.md` explicitly identifies them as condition-producing.

The interpreter stores `CC` in native AVR `r3`. It MAY retain other native `SREG` bits in that byte for implementation convenience, but those bits are not architectural and guest software MUST NOT depend on them.

Native dispatch modifies AVR `SREG`. Conditional operations therefore consume saved `CC`, not the transient native status left by dispatch.

---

# Part II — Memory and Address Spaces

## 13. Data address space

AVM address space zero is the complete 16-bit ATmega32U4 data address space.

An AVM data pointer is the native data-space address:

```text
native data-space address = AVM pointer
```

No bias or translation is applied.

The ISA permits access to the full `0x0000–0xFFFF` range, including native registers, I/O, SRAM, framebuffer storage, interpreter-reserved regions, and unimplemented addresses. Access to an address not implemented by the target device has target-defined behavior.

The conventional runtime layout is:

| Address | Size | Conventional purpose |
|---|---:|---|
| `0x0000–0x001F` | 32 bytes | Native AVR register file |
| `0x0020–0x00FF` | 224 bytes | AVR I/O and extended I/O |
| `0x0100–0x04FF` | 1,024 bytes | Static global storage |
| `0x0500–0x08FF` | 1,024 bytes | Display framebuffer |
| `0x0900–0x09FF` | 256 bytes | VM stack |
| `0x0A00–0x0AFF` | 256 bytes | Interpreter state and native stack |
| `0x0B00–0xFFFF` | — | Unimplemented or target-specific |

The null data pointer is:

```text
0x0000
```

This representation does not make hardware address zero inaccessible. Source-language null dereferences remain undefined, while explicit low-level code may form address zero through integer conversion or absolute data-space access.

---

## 14. Static global storage

The global region is:

```text
0x0100–0x04FF
```

Writable static storage is laid out contiguously:

```text
0x0100                       start of .data
0x0100 + dataSize            start of .bss
0x0100 + staticSize          first byte after static storage
```

Required invariants:

```text
0 <= dataSize <= staticSize <= 1024
bssSize = staticSize - dataSize
```

Linker-created padding within `.data` or `.bss` is included in these sizes.

Static-duration local objects, C++ static objects, compiler-generated writable data, and fixed-capacity application state all occupy this same region.

There is no heap after `.bss`.

---

## 15. Framebuffer

The framebuffer occupies:

```text
0x0500–0x08FF
```

It is ordinary guest-writable SRAM.

The conventional Arduboy page layout is:

```text
address = 0x0500 + x + 128 × (y >> 3)
bit     = y & 7
```

The architecture assigns no pixel semantics beyond the fixed address range. Graphics libraries and system services define higher-level behavior.

---

## 16. VM stack and interpreter-reserved SRAM

The VM stack occupies:

```text
0x0900–0x09FF
```

The range:

```text
0x0A00–0x0AFF
```

is reserved for interpreter implementation state, including:

- Native AVR stack.
- Physical image and save-page state.
- Runtime configuration.
- Debugger and service state.
- Saved state for native ABI bridges.

The architecture does not prevent guest access to this range. Guest writes may corrupt interpreter state and are undefined unless a separately documented system service assigns meaning to them.

The implementation MUST ensure that fixed interpreter state and the descending native stack cannot collide under supported interrupt and service nesting.

---

## 17. Raw data-space access

All data-memory addressing uses raw 16-bit native addresses.

Consequences include:

- Low addresses may intentionally access native registers or I/O.
- The framebuffer is addressed through its fixed SRAM range.
- Guest code is not isolated from peripherals or interpreter state.
- Hardware-register access observes native read, write, and side-effect behavior.
- Untrusted bytecode MUST NOT execute without validation or a separately sandboxed interpreter.

---

## 18. Allocation model

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

Variable-length arrays and unrestricted dynamic `alloca` SHOULD be disabled.

A program may implement a fixed-capacity allocator within its global or stack storage, but such an allocator has no architectural status.

---

## 19. Program address space

AVM address space one is a 24-bit logical, read-only program space:

```text
0x000000–0xFFFFFF
```

The first 256 bytes are reserved for the linked-image header:

```text
0x000000–0x0000FF  image header
0x000100–...       linked program payload
```

The payload may contain:

- Bytecode.
- Read-only constants.
- Strings.
- Graphics and other immutable assets.
- Jump tables.
- Constructor and destructor tables.
- `.data` initializers.
- Function pointers.
- Optional runtime metadata.

After the required header and contiguous `.data` initializer prefix, code and immutable data may be interleaved according to linker policy.

For every stored image byte:

```text
file offset = logical program-space address
```

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

`imageBase` points to logical address zero and MUST be aligned to 256 bytes:

```text
imageBase mod 256 = 0
```

Translation is:

```text
physicalFlashAddress = imageBase + logicalProgramAddress
```

This translation is performed when:

- Entering the image.
- Restarting fetch after control transfer.
- Restarting fetch after program-data access.
- Performing program-data access.

It is not performed for each sequential byte because the external SPI read stream advances internally.

The image packer MUST reject placement that is not page aligned or would exceed the physical flash address range.

---

## 21. Program banks

The logical program space contains 256 banks of 64 KiB:

```text
Bank 0     0x000000–0x00FFFF
Bank 1     0x010000–0x01FFFF
...
Bank 255   0xFF0000–0xFFFFFF
```

The linker MUST enforce:

1. No instruction crosses a bank boundary.
2. No function crosses a bank boundary.
3. No basic-block fallthrough crosses a bank boundary.
4. No sequential path wraps `PC` from `0xFFFF` to `0x0000`.
5. Every bank-ending path uses an explicit control transfer.
6. Unused terminal bank space is filled with an invalid or diagnostic-fault encoding.
7. Every direct far target is two-byte aligned.
8. Every address-taken function is two-byte aligned.
9. Cross-bank entry points are aligned or reached through aligned veneers.

An individual function larger than 64 KiB is unsupported.

---

## 22. Program and function pointers

### 22.1 Memory representation

A program or function pointer is three packed little-endian bytes:

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

### 22.2 Register representation

A program pointer in registers occupies one aligned `qN` pair:

```text
low register             = bits 15:0
low byte of high register = bits 23:16
high byte of high register = 0
```

The high word is canonical in the range:

```text
0x0000–0x00FF
```

### 22.3 Arithmetic and conversions

Program-pointer arithmetic is unsigned 24-bit arithmetic.

Data-space and program-space pointers belong to disjoint address spaces. Implicit conversion between them is forbidden.

Explicit integer conversion may be supported as a target extension, but a converted pointer is meaningful only in the destination address space when the program explicitly establishes that contract.

### 22.4 Indirect control-flow use

An indirect jump, call, or tail call consumes a canonical register-form pointer
in one aligned `qN` pair:

```text
bits 15:0   = low register of qN
bits 23:16  = low byte of the high register
bits 31:24  = zero
```

The instruction copies bits `23:16` into `CB` and bits `15:0` into `PC`.
`PB` is not an operand and is preserved by the indirect-control instruction.

A diagnostic implementation may reject a nonzero `bits 31:24`. Optimized
execution may treat a noncanonical register-form program pointer as undefined.

---

# Part III — Data Representation

## 23. Endianness and alignment

AVM is little-endian.

All scalar ABI alignments are one byte.

Unaligned 16-bit, 24-bit, 32-bit, and 64-bit objects are permitted.

The stack has one-byte alignment.

Structures receive no target-imposed alignment padding beyond explicit language requirements.

---

## 24. C and C++ data model

Recommended target sizes are:

| Type | Size |
|---|---:|
| `bool` | 1 byte |
| `char` | 1 byte |
| `short` | 2 bytes |
| `int` | 2 bytes |
| `long` | 4 bytes |
| `long long` | 8 bytes |
| `float` | 4 bytes |
| `double` | 4 bytes initially |
| `long double` | 4 bytes initially |
| Data pointer | 2 bytes |
| Program pointer | 3 bytes |
| Function pointer | 3 bytes |
| `size_t` | 2 bytes |
| `ptrdiff_t` | 2 bytes |
| `wchar_t` | 2 bytes |

Plain `char` is signed by default.

`bool` is represented canonically as zero or one.

`size_t` is 16 bits, so no single source-language object may exceed 65,535 bytes. A complete program may exceed that size because it consists of multiple functions and objects.

Enums use a 16-bit signed representation by default unless short-enum behavior is requested.

---

## 25. Byte values in registers

A byte value occupies the low byte of a 16-bit register.

Byte-producing operations that promise canonical zero extension clear bits `15:8`. The exact list of such instructions is maintained in `docs/avm_isa.md`.

Byte stores use only the low byte.

The backend must track whether a byte producer has already canonicalized the high byte so that redundant extension operations can be eliminated.

---

## 26. Larger integers

A 32-bit integer occupies one `qN` pair:

```text
low register   = bits 15:0
high register  = bits 31:16
```

A 64-bit integer occupies four 16-bit registers or is lowered through runtime helpers.

The revised ISA contains direct 32-bit pair operations, but the architecture does not require every compiler phase to legalize `i32` immediately. Early backend implementations may expand unsupported operations until complete instruction selection exists.

---

# Part IV — Calling Convention

## 27. Register volatility

| State | ABI role |
|---|---|
| `r4–r7` / `c0–c3` | Caller-saved |
| `A` | Caller-saved; alias of `r4` |
| `r0–r3` | Callee-saved |
| `r3` | Optional frame pointer |
| `PB` | Caller-saved |
| `CC` | Caller-saved |
| `SP` | Restored by callee |
| `CB` | Restored by return/control flow |

The compact register class is the preferred argument, result, and temporary class.

---

## 28. Register arguments

Arguments are assigned in 16-bit units:

```text
unit 0 -> c0 = r4 = A
unit 1 -> c1 = r5
unit 2 -> c2 = r6
unit 3 -> c3 = r7
```

Typical unit counts are:

| Type | Units |
|---|---:|
| `i8` | 1 |
| `i16` | 1 |
| Data pointer | 1 |
| `i32` | 2 |
| Program/function pointer | 2 |
| `i64` | 4 |

A 32-bit first argument occupies `q2 = r4:r5`. A second 32-bit argument occupies `q3 = r6:r7`.

A program pointer uses one unit for the low word and one unit for the zero-extended bank byte.

An argument that does not completely fit in the remaining units is passed entirely on the stack. Arguments are never split between registers and stack.

---

## 29. Stack arguments

The caller allocates outgoing stack-argument storage before the call.

Stack arguments:

- Appear in source order at ascending addresses.
- Use their natural ABI size.
- Have one-byte alignment.
- Are packed without alignment gaps unless explicitly attributed.

All call forms push a three-byte return address. Callee entry therefore sees:

```text
SP+0  return address bits 7:0
SP+1  return address bits 15:8
SP+2  return address bits 23:16
SP+3  first stack-argument byte
```

The caller removes outgoing stack arguments after return.

---

## 30. Variadic functions

All arguments to a variadic function are passed on the stack, including named arguments.

Default argument promotions apply.

`va_list` is a 16-bit data-space pointer.

This avoids a register-save area and compound register/stack iteration.

---

## 31. Return values

| Return type | Location |
|---|---|
| `i8`, `bool` | low byte of `A` |
| `i16` | `A` |
| Data pointer | `A` |
| `i32` | `q2 = r4:r5` |
| Program/function pointer | low word in `r4`, bank word in `r5` |
| `i64` | `r4:r7`, when permitted |
| Large aggregate | hidden data-space result pointer |

For `i8` and `bool` returns, only bits `7:0` of `A` are defined. Bits `15:8` of `A` are unspecified and are not required to be cleared by the callee. A caller that widens an `i8` result must perform the extension required by the source type: zero-extension for an unsigned byte and sign-extension for a signed byte. A returned `bool` is canonical in the low byte as zero or one, while the high byte remains unspecified.

A hidden structure-result pointer consumes the first argument unit.

---

## 32. Frames and tail calls

A function saves only the callee-saved registers it uses.

The default is frame-pointer omission.

When a frame pointer is required, `r3` holds the stack position established after saving the previous frame pointer and before allocating local storage.

Dynamic stack allocation is discouraged.

A tail call restores the current frame and transfers control without creating a new return record. A cross-bank tail call must use a jump form so the final callee returns directly to the original caller.

The exact instruction sequences used for prologues, epilogues, stack adjustment, and tail transfer are defined by the backend using the instruction forms in `docs/avm_isa.md`.

---

# Part V — System ABI

## 33. Service invocation

The ISA provides an immediate system-service invocation instruction defined in `docs/avm_isa.md`.

Unless a service states otherwise:

```text
c0-c3 / A  arguments and results
r0-r3      preserved
PB         clobbered
CC         clobbered
SP         preserved
```

A service specification MUST define:

- Identifier.
- Arguments.
- Results.
- Preserved and clobbered state.
- Blocking behavior.
- Hardware side effects.
- Simulator-specific behavior, if any.

---

## 34. Defined services

| Service ID | Name | Purpose |
|---:|---|---|
| `0` | `debug_putc` | Write one byte to the simulator debug stream |
| `1` | `debug_break` | Execute a native AVR debugger break |
| `2–255` | Reserved | Unassigned |

An unsupported service identifier is invalid. A diagnostic interpreter MUST trap it. Optimized execution may treat it as unrestricted undefined behavior.

### 34.1 `debug_putc`

Input:

```text
low8(A) = byte to write
```

The interpreter performs one direct write to ATmega32U4 `UEDATX`.

It does not initialize USB, select an endpoint, test readiness, wait for buffer space, commit a packet, translate characters, or retry.

A simulator may record each `UEDATX` write as serial output even without a complete USB stack.

This service preserves:

```text
r0-r7
PB
CC
SP
```

apart from normal instruction progression.

### 34.2 `debug_break`

The interpreter executes one native AVR `BREAK`.

A simulator or debugger may stop execution. If execution resumes, AVM continues with the following instruction.

This service preserves:

```text
r0-r7
PB
CC
SP
```

apart from normal instruction progression.

---

# Part VI — LLVM and Clang Target

## 35. Target identity

The canonical target triple is:

```text
avm-unknown-arduboyfx
```

The ELF machine identifier used by the current toolchain is:

```text
EM_AVM = 0x4156
```

---

## 36. LLVM address spaces

```text
address space 0 = ATmega32U4 data space
address space 1 = AVM program space
```

Functions reside in address space one.

Unqualified C data pointers use address space zero.

A Clang target extension such as `__flash` should produce an address-space-one pointer.

LLVM's target infrastructure represents these distinctions through the target data layout, register information, instruction definitions, lowering, and object emission. ([LLVM][3])

---

## 37. LLVM data layout

The current backend data layout is:

```text
e-m:e-p:16:8-p1:24:8-i8:8-i16:8-i32:8-i64:8-f16:8-f32:8-n8:16-S8
```

Meaning:

- Little-endian.
- Default pointers are 16-bit data-space pointers.
- Address-space-one pointers are 24 bits.
- Scalar ABI alignment is one byte, including 64-bit integers and 16-bit and
  32-bit floating-point values.
- Native integer widths are 8 and 16 bits.
- Stack alignment is one byte.

Functions and program-resident objects use address space one by target policy.

---

## 38. LLVM register classes

Required scalar classes are:

```text
GPR16   = r0-r7
CGPR16  = r4-r7

GPR8    = b0-b7
CGPR8   = b4-b7
```

Required 32-bit pair representation:

```text
GPR32 = q0-q3
```

A preferred compact-pair subset may contain:

```text
q2 = r4:r5
q3 = r6:r7
```

Program-pointer values use the same aligned pair representation with a canonical high word.

`A`, `c0`, and `r4` are aliases, not separate physical registers.

`CC`, `PB`, `SP`, and `CB` are nonallocatable architectural state.

---

## 39. Type legalization policy

Directly representable values include:

```text
i8
i16
p0:16
```

The register file also directly represents `i32` through `qN` pairs.

Program pointers are custom-lowered:

```text
p1:24
```

`i1` should remain in `CC` through compare-and-branch patterns when possible, or be materialized as canonical zero/one.

`i64` and unsupported floating-point operations are expanded or lowered to compiler-runtime helpers.

During early backend bring-up, `i32` operations may be expanded until the complete 32-bit instruction-selection path is available.

---

## 40. Backend policy

`docs/avm_isa.md` is the source of truth for machine instruction definitions and encoding choices.

The backend should:

1. Legalize IR into AVM-supported scalar and pointer representations.
2. Preserve explicit dependencies on `CC`, `PB`, `SP`, and `CB`.
3. Allocate argument and short-lived values preferentially to compact registers.
4. Allocate long-lived values preferentially to callee-saved registers.
5. Represent 32-bit values with aligned `qN` pairs.
6. Select compact encodings only after physical register assignment when encoding depends on the final register class.
7. Perform branch and call relaxation after layout.
8. Keep stack objects with the highest dynamic access frequency at the cheapest offsets.
9. Diagnose statically provable stack use above 256 bytes.
10. Emit stack-usage metadata.

Instruction-specific combine, compression, and relaxation rules belong in the ISA and backend implementation documents rather than here.

---

## 41. Explicit machine dependencies

Instructions that replace or consume `CC` must model the corresponding implicit physical-register definitions and uses.

The scheduler and peephole passes must not move a `CC`-defining operation across a dependent branch or condition materialization.

Operations that access or replace `PB` must model it explicitly. Indirect
jump/call instructions consume a `qN` pointer and do not use or define `PB`.
Calls and system services model their ABI clobbers.

Because dispatch overwrites native `SREG`, compiler-visible `CC` represents saved architectural state, not transient native flags.

---

## 42. Code model and C++ policy

The default code model is large.

Unresolved direct calls and jumps should initially use relaxable relocations that permit the linker to select the shortest valid final form.

Indirect function calls and indirect tail calls consume the canonical 24-bit
function-pointer representation in an aligned `qN` pair. They do not use `PB`.

The initial C++ environment should support:

- Classes and member functions.
- Templates.
- Virtual dispatch.
- Static constructors and destructors.
- Placement `new`.
- Function overloading.

The initial runtime should normally disable exceptions and RTTI.

General dynamic allocation is unavailable.

Virtual tables and related metadata reside in program space.

---

# Part VII — ELF, Linker, and Flat Image

## 43. Relocatable object format

The toolchain uses little-endian ELF32 relocatable objects.

Recommended sections include:

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

Debug information remains in the ELF file or a sidecar and is not required in the flat runtime image.

---

## 44. Relocation classes

The object format defines:

```text
R_AVM_NONE
R_AVM_DATA16
R_AVM_PROG24
R_AVM_PROG_LO16
R_AVM_PROG_HI8
R_AVM_PCREL8
R_AVM_BANK16
R_AVM_FAR24
R_AVM_RELAX
```

Roles:

| Relocation | Purpose |
|---|---|
| `R_AVM_DATA16` | Absolute data-space address |
| `R_AVM_PROG24` | Packed 24-bit logical program address |
| `R_AVM_PROG_LO16` | Low 16 bits of program address |
| `R_AVM_PROG_HI8` | Program-address bank byte |
| `R_AVM_PCREL8` | Signed relative control-flow displacement |
| `R_AVM_BANK16` | Same-bank absolute low-16-bit address |
| `R_AVM_FAR24` | Packed far-control target |
| `R_AVM_RELAX` | Linker relaxation marker |

A far-control relocation must preserve any non-address control bit embedded in the encoded low byte.

---

## 45. Linker responsibilities

The linker must:

1. Keep each function within one 64 KiB bank.
2. Prevent instruction and fallthrough crossing at bank boundaries.
3. Align address-taken and far-entry functions as required.
4. Cluster related functions for locality.
5. Insert veneers when required.
6. Relax calls, jumps, and conditional transfers after layout.
7. Lay out initialized writable data as one contiguous prefix.
8. Lay out zero-initialized writable data immediately after it in SRAM.
9. Synthesize the runtime header and tail.
10. Validate all image and bank invariants.
11. Fill unused runtime bytes with the required values.

The exact instruction forms selected by relaxation are defined in `docs/avm_isa.md`.

---

## 46. Final linked-image layout

The executable image is a flat little-endian binary:

```text
0x000000–0x0000FF                           fixed header
0x000100–0x000100+dataSize-1                .data initializer
...–programStart-1                          0xFF padding
programStart–...                            program-space contents
...–fileSize-9                              0xFF final padding
fileSize-8–fileSize-1                       mandatory tail
```

Definitions:

```text
programStart = align_up(0x000100 + dataSize, 0x100)
fileSize     = align_up(endOfPayload + 8, 0x100)
file offset  = logical program-space address
fileSize mod 0x100 = 0
```

`.bss` occupies no bytes in the image.

After `programStart`, code and immutable data may be interleaved.

---

# Part VIII — Interpreter Integration

## 47. Primary dispatch

The interpreter uses 256 fixed-stride primary slots, one for each primary opcode.

The stride is an implementation parameter, not part of the ISA or binary compatibility contract.

Requirements:

- Every primary slot uses the same stride.
- Native AVR `r7` contains the stride in AVR instruction words.
- Dispatch calculation and table placement agree.
- The handler entry point is computable directly from the primary opcode.
- A handler that does not fit may jump to shared out-of-line code.

The slot size, table placement, alignment, and dispatch latency may change between interpreter builds.

---

## 48. Handler-entry invariants

At primary handler entry:

```text
r2       = 0
r7       = primary dispatch stride in AVR words
r24:r25  = current primary opcode address
Y        = AVM SP
GPIOR1   = CB
GPIOR2   = PB
r3       = AVM CC storage
SPDR     = transferring the byte following the primary opcode
```

Native `r0:r1`, `r4:r6`, `X`, and `Z` are scratch unless a dispatch path states otherwise.

Compact primary handlers directly name the mapped AVR registers. Generic handlers may index the native register file through the regular mapping in Section 8.

---

## 49. Sequential fetch pipeline

For each additional sequential instruction byte:

1. Complete the current SPI transfer.
2. Read `SPDR`.
3. Write zero from native `r2` to `SPDR`.
4. Begin transferring the following byte.
5. Decode or execute while the transfer proceeds.

The final speculative transfer is the next primary opcode on fallthrough.

A taken transfer discards any speculative sequential byte.

Instruction length and operand sequencing are defined in `docs/avm_isa.md`.

---

## 50. Stream restart

A taken control transfer:

1. Computes the logical target.
2. Updates `CB` and/or `PC`.
3. Adds `imageBase`.
4. Starts a new SPI read command.
5. Primes target-byte fetch.
6. Dispatches the target primary opcode.

A program-space data load similarly interrupts the sequential stream, performs the data read, and restarts instruction fetch at the following logical instruction address.

The architecture exposes no exact cycle cost.

---

## 51. Native ABI bridges

Before calling ordinary AVR compiler-generated code, the interpreter must:

- Clear native `r1`.
- Save AVM values occupying native call-clobbered registers.
- Save interpreter special state.
- Ensure sufficient native stack space.

After return, it must:

- Restore AVM registers.
- Restore `r2 = 0`.
- Restore native `r7` to the dispatch stride.
- Restore `CC`, bank state, PC state, and SPI-stream state.
- Resume bytecode execution.

Frequently used services should remain handwritten assembly where practical.

---

## 52. Interrupt handling

An interrupt handler must save every native register it modifies, including interpreter-fixed registers.

Interrupt handlers should:

- Minimize native stack use.
- Avoid deep native calls.
- Preserve `GPIOR1` and `GPIOR2`.
- Preserve native `r2`, `r3`, `r7`, AVM register storage, and logical PC.
- Preserve or restore SPI state if the handler touches the SPI peripheral.

---

# Part IX — Startup and Image Format

## 53. Image discovery

The interpreter supports two discovery paths:

1. Arduboy FX flashcart launch using keyed interrupt-vector words.
2. Development or emulator launch using the mandatory image tail.

### 53.1 Flashcart launch

| Internal-flash address | Size | Meaning |
|---:|---:|---|
| `0x0014` | 2 | Data-vector key, little-endian `0x9518` |
| `0x0016` | 2 | Image base page, stored high byte then low byte |
| `0x0018` | 2 | Save-vector key, little-endian `0x9518` |
| `0x001A` | 2 | Save base page, stored high byte then low byte |

A page value `P` represents physical address:

```text
P << 8
```

The image key and save key are checked independently.

A missing save page is permitted only when `saveSize == 0`.

### 53.2 Development and emulator launch

When the flashcart image key is absent, the interpreter checks:

```text
0xFFFFF8  image ends at the end of 16 MiB flash
0xFFEFF8  image ends before a final 4 KiB save sector
```

For a tail in physical page `tailPage`:

```text
imageBasePage = tailPage + 1 - imagePageCount
imageBase     = imageBasePage << 8
```

When the tail is at `0xFFEFF8`, the save sector begins at physical page `0xFFF0`.

---

## 54. Minimal startup validation

The normal interpreter validates:

```text
header magic is 41 56 4D 01
runtimeVersion is supported
dataSize <= staticSize
staticSize <= 1024
saveSize <= 1024
saveSize == 0 or a save page exists
```

The interpreter then:

1. Installs image and save-page state.
2. Initializes the native AVR stack.
3. Sets AVM `SP = 0x0A00`.
4. Clears `PB` and `CC`.
5. Clears `staticSize` bytes at SRAM `0x0100`.
6. Copies `dataSize` bytes from logical address `0x000100` to SRAM `0x0100`.
7. Retains save configuration for system services.
8. Installs `CB:PC = entryPoint`.
9. Starts an SPI read at the translated entry point.
10. Primes the first instruction and enters dispatch.

General-purpose AVM registers are unspecified at raw image entry unless the runtime ABI states otherwise.

---

## 55. Header layout

The header is exactly 256 bytes.

All multi-byte fields are little-endian. `entryPoint` is packed 24-bit.

| Offset | Size | Field | Description |
|---:|---:|---|---|
| `0x00` | 4 | `magic` | `41 56 4D 01` |
| `0x04` | 1 | `runtimeVersion` | Combined interpreter compatibility version |
| `0x05` | 3 | `entryPoint` | Logical address of runtime entry |
| `0x08` | 2 | `dataSize` | Initialized static bytes |
| `0x0A` | 2 | `staticSize` | Total `.data + .bss` bytes |
| `0x0C` | 2 | `saveSize` | Requested persistent bytes |
| `0x0E` | 238 | reserved | Must be zero |
| `0xFC` | 4 | `headerCrc32` | CRC of bytes `0x00–0xFB` |

Serialization description:

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

This is a byte-serialization contract, not a native host-structure ABI.

---

## 56. Header checksum

`headerCrc32` uses CRC-32/ISO-HDLC over:

```text
header[0x00 .. 0xFB]
```

The stored value is little-endian at `0xFC–0xFF`.

Host tools MUST generate it.

Diagnostic tools SHOULD verify it.

The normal device interpreter MAY omit CRC verification.

---

## 57. Static initialization

```text
.data source       = logical program address 0x000100
.data destination  = SRAM 0x0100
.data length       = dataSize
.bss destination   = SRAM 0x0100 + dataSize
.bss length        = staticSize - dataSize
```

Required:

```text
0 <= dataSize <= staticSize <= 1024
```

The current startup strategy clears the full `staticSize` region and copies the `.data` prefix over it.

---

## 58. Save storage

`saveSize` is an exact byte count from zero through 1,024.

The outer FX packer reserves a complete 4 KiB erase sector when persistent storage exists.

The system ABI must enforce `saveSize` even though the physical sector is larger.

For development placement with save storage:

```text
image end   = 0xFFF000
save sector = 0xFFF000–0xFFFFFF
```

---

## 59. Tail locator

The final eight bytes are:

| Tail offset | Size | Field | Description |
|---:|---:|---|---|
| `+0x00` | 4 | `magic` | `41 56 54 01` |
| `+0x04` | 2 | `imagePageCount` | Total file length in 256-byte pages |
| `+0x06` | 2 | reserved | Must be zero |

```c
struct AvmImageTail {
    uint8_t  magic[4];
    uint16_t imagePageCount;
    uint16_t reserved;
};
```

Required:

```text
imagePageCount = fileSize / 256
imagePageCount != 0
```

The header page is recovered as:

```text
imageBasePage = tailPage + 1 - imagePageCount
```

---

## 60. Development placement

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

The linked image bytes are identical in both modes. Only physical placement differs.

---

## 61. Image validation

The linker or image writer MUST validate:

```text
header magic
supported runtimeVersion
entryPoint fits in 24 bits
entryPoint is a valid aligned instruction boundary
programStart <= entryPoint < tailOffset
dataSize <= staticSize <= 1024
saveSize <= 1024
reserved header bytes are zero
headerCrc32 is correct
programStart = align_up(0x000100 + dataSize, 0x100)
tail magic
imagePageCount == fileSize / 256
imagePageCount != 0
tail reserved bytes are zero
alignment and final padding are 0xFF
fileSize is a multiple of 256 bytes
all bank-layout rules are satisfied
```

The physical packer additionally validates:

```text
imageBase mod 256 = 0
imageBase + fileSize fits in flash
image and save allocations do not overlap
development placement reaches the required physical end address
```

Debug metadata remains outside the runtime header and tail.

---

# Part X — Diagnostics and Compatibility

## 62. Diagnostic interpreter

A diagnostic build should detect:

- VM stack overflow and underflow.
- Invalid or reserved instruction encodings.
- Malformed operand bytes.
- Instruction or fallthrough crossing a bank boundary.
- Invalid or misaligned control-flow target.
- Illegal operand overlap.
- Program access outside the packed image.
- Program-pointer overflow.
- Invalid image magic or unsupported `runtimeVersion`.
- Invalid static or save sizes.
- Nonzero reserved header or tail bytes.
- Header checksum failure.
- Missing or inconsistent tail information.
- Invalid entry point or padding.
- Misaligned physical placement.
- Unsupported system-service identifier.

Instruction-specific diagnostics belong to `docs/avm_isa.md`.

---

## 63. Optimized execution

Optimized execution may define the following as unrestricted undefined behavior:

- Access to unsupported data-space addresses.
- Invalid program-space access.
- Stack overflow or underflow.
- Illegal or reserved instruction.
- Malformed operand encoding.
- Jump into the middle of an instruction.
- Violation of an operand restriction.
- Execution past a bank boundary.
- Execution of unvalidated bytecode.
- Corruption of interpreter-reserved SRAM.

The distribution toolchain should validate bytecode before packaging it.

---

## 64. Versioning

The linked image carries:

```text
header magic[3]  header and basic file-layout revision
tail magic[3]    tail-locator revision
runtimeVersion   complete execution-contract revision
```

`runtimeVersion` covers:

- The instruction set defined by `docs/avm_isa.md`.
- Architectural register, pair, accumulator, and `CC` behavior.
- Pointer representation and memory layout.
- Calling convention and return-address format.
- Startup contract.
- System-service identifiers and signatures.
- Program-visible save behavior.

There are no separate ISA-version, ABI-version, image-feature, or capability fields in the runtime header.

Because Version 1 remains a design draft and no stable Version 1 binary contract has been published, the revised accumulator/pair/CC ISA remains:

```text
runtimeVersion = 1
```

After Version 1 binaries are published, any incompatible change to the execution contract requires a new `runtimeVersion`.

A compatible implementation may accept one version or an explicit set of versions.

---

# Part XI — Consolidated Summary

```text
Instruction specification:
    docs/avm_isa.md is the sole source for encodings and instruction semantics

Architectural registers:
    r0-r7, each 16 bits

Compact aliases:
    c0 = r4
    c1 = r5
    c2 = r6
    c3 = r7

Accumulator:
    A = c0 = r4

Aligned 32-bit pairs:
    q0 = r0:r1
    q1 = r2:r3
    q2 = r4:r5
    q3 = r6:r7

Condition state:
    CC contains architectural C, Z, and S only
    Compare/test and compact ADD/SUB replace CC
    Other instructions preserve CC unless docs/avm_isa.md says otherwise

Native AVM register mapping:
    r0 -> AVR r8:r9
    r1 -> AVR r10:r11
    r2 -> AVR r12:r13
    r3 -> AVR r14:r15
    r4 -> AVR r16:r17
    r5 -> AVR r18:r19
    r6 -> AVR r20:r21
    r7 -> AVR r22:r23

Special state:
    PC    AVR r24:r25
    SP    AVR Y
    CB    GPIOR1
    PB    GPIOR2
    CC    AVR r3

Data-space conventions:
    0x0000-0x00FF native registers and I/O
    0x0100-0x04FF globals
    0x0500-0x08FF framebuffer
    0x0900-0x09FF VM stack
    0x0A00-0x0AFF interpreter-reserved

Pointers:
    Data pointer      16 bits
    Program pointer   24 bits
    Function pointer  24 bits
    Null pointers     all zero

Execution address:
    CB:PC

Program-data address:
    PB:rN

Indirect code-pointer operand:
    canonical 24-bit pointer in qN
    low register = bits 15:0
    low byte of high register = bits 23:16
    high byte of high register = 0
    PB is preserved

Code banks:
    256 banks
    64 KiB each
    No instruction, function, or fallthrough crosses a bank

Calling convention:
    A/c0-c3 caller-saved arguments and results
    r0-r3 callee-saved
    r3 optional frame pointer
    Three-byte return addresses

Allocation model:
    Static SRAM only
    No general-purpose heap

LLVM:
    Triple avm-unknown-arduboyfx
    EM_AVM = 0x4156
    AS0 data space with 16-bit pointers
    AS1 program space with 24-bit pointers

Linked image:
    256-byte AVM header at logical address zero
    .data initializer begins at logical address 0x000100
    programStart is the next 256-byte boundary after .data
    file offsets equal logical program addresses
    mandatory 8-byte AVT tail stores imagePageCount
    header CRC at 0xFC covers bytes 0x00-0xFB
    saveSize is limited to 1024 bytes
    image base and file size are 256-byte aligned

System ABI:
    service 0 = debug_putc(low8(A))
    service 1 = debug_break
```

This document, together with `docs/avm_isa.md`, defines the Version 1 AVM execution contract.

[1]: https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7766-8-bit-AVR-ATmega16U4-32U4_Datasheet.pdf "ATmega16U4/32U4 Datasheet"
[2]: https://ww1.microchip.com/downloads/en/DeviceDoc/AVR-InstructionSet-Manual-DS40002198.pdf "AVR Instruction Set Manual"
[3]: https://llvm.org/docs/WritingAnLLVMBackend.html "Writing an LLVM Backend"
