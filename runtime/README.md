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
    math.h
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

## Startup variants

- `crt0.o` calls `int main(void)` and halts if it returns.
- `crt0_test.o` calls `main`, writes `P\n` for zero or `F\n` otherwise,
  requests `debug_break`, and halts.
- `crt0_sketch.o` calls `setup()` once and `loop()` forever.

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

`libavm-builtins.a` initially contains only an empty placeholder object. Add
wide integer, atomic, or other LLVM-emitted helper implementations there rather
than mixing them into the public runtime library.
