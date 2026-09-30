# AVM runtime and sysroot

This directory owns target-side startup objects, public runtime headers,
addressable library wrappers, and compiler helper routines. Compiler target
semantics and `__avm_*` builtins remain in the LLVM submodule.

## Build targets

From the main AVM build:

```text
avm_runtime         Build CRT objects and target libraries.
avm_runtime_checks  Compile C and C++ header smoke tests.
avm_sysroot         Stage headers, CRT objects, and libraries.
avm_sdk             Build the AVM toolchain and complete staged sysroot.
```

The staged tree is:

```text
<build>/avm-sysroot/
  include/
    cstddef
    math.h
    new
    string.h
    avm/runtime.h
  lib/
    crt0.o
    crt0_test.o
    crt0_sketch.o
    libavm.a
    libavm-builtins.a
```

Clang's AVM resource headers continue to provide `<avm/pgmspace.h>`.
`libavm.a` supplies the addressable `memcpy_P` wrapper declared there.
`<new>` provides placement `new` and `new[]` for caller-owned storage, with
their matching placement `delete` overloads. The runtime provides no heap
allocator or ordinary `new` operator.
`libavm.a` contains weak traps for compiler-generated pure or deleted virtual
calls and deleting destructors. Applications can replace the delete traps if
they provide their own fixed-capacity allocator.

## Startup variants

- `crt0.o` runs `.init_array`, calls `int main(void)`, runs `.fini_array` in
  reverse order, and halts if `main` returns.
- `crt0_test.o` runs the same constructor and destructor sequence around
  `avm_test_main`, writes `P\n` for zero or `F\n` otherwise, requests
  `debug_break`, and halts.
- `crt0_sketch.o` runs `.init_array`, calls `setup()` once, and calls `loop()`
  forever. Its loop has no normal shutdown path.

Clang emits nonlocal C++ global object destructors into `.fini_array` at
compile time, with no RAM callback table. Function-local statics with
destructors get one five-byte slot in a linker-sized RAM table; a two-byte
next-slot pointer, a two-byte global construction counter, and their runtime
code are linked only when such an object exists. On normal return, the CRT
interleaves local and nonlocal destructors in reverse construction order,
including locals constructed inside global constructors. Use
`[[clang::no_destroy]]` when teardown is unnecessary.

The loader, not `_start`, initializes `.saved` and `.data`, sets
`SP = 0x0A00`, clears `CC`, and selects the linked entry point. AVM has no
runtime `.bss` clear pass. `_start` must not return because raw image entry has
no caller return address.

## Compile, link, and package

```sh
<build>/llvm-build/bin/clang \
  --target=avm-unknown-arduboyfx \
  -ffreestanding \
  -fno-stack-protector \
  -isystem <build>/avm-sysroot/include \
  -c main.c \
  -o main.o

<build>/llvm-build/bin/ld.lld \
  -flavor gnu \
  --entry=_start \
  <build>/avm-sysroot/lib/crt0.o \
  main.o \
  -L<build>/avm-sysroot/lib \
  -lavm \
  -lavm-builtins \
  -o app.elf

<build>/llvm-build/bin/llvm-avm-image app.elf -o app.bin
```

Keep application objects before the archives. Static archive resolution uses
references from objects already seen by the linker.

## Fast calls and addressable functions

`math.h` and `string.h` declare real public symbols and then use function-like
macros for ordinary call syntax. For example:

```c
float y = sinf(x);          // Direct __avm_sinf builtin / SYS path.
float (*p)(float) = &sinf;  // Addressable wrapper from libavm.a.
float z = (sinf)(x);        // Explicit ordinary function call.
```

Define `AVM_MATH_NO_BUILTIN_MACROS` or
`AVM_STRING_NO_BUILTIN_MACROS` before the corresponding include to disable the
call macros for a translation unit.

`libavm-builtins.a` contains the compiler's 32-bit and 64-bit integer
multiplication, division, remainder, and shift helpers. Keep this archive after
application objects and `libavm.a` in the link command so references from both
are resolved.

The 64-bit division helpers use the same zero-divisor convention as their
32-bit counterparts: unsigned quotient is `UINT64_MAX`, signed quotient is
`-1`, and remainder is the numerator. Direct shift-helper calls with counts of
64 or more return zero for left and logical-right shifts and the sign fill for
arithmetic-right shifts. Source-language division by zero and out-of-range
shift counts remain undefined behavior.
