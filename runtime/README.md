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

Build and install the SDK with:

```sh
cmake --build build --config RelWithDebInfo --target avm_sdk
cmake --install build --config RelWithDebInfo --component avm-sdk --prefix <sdk>
```

The build-tree driver is `build/llvm-build/bin/avm-clang` (`.exe` on Windows).
The installed SDK is relocatable, with native tools in `<sdk>/bin` and the
runtime in `<sdk>/sysroot`; no Python installation is needed. The SDK also
provides `avm-ld`, `avm-ar`, `avm-mc`, `avm-objdump`, `avm-readobj`, and
`avm-image` beside the LLVM-named tools. `avm-mc` defaults to the AVM triple;
an explicit `-triple` takes precedence.

The staged tree is:

```text
<build>/avm-sysroot/
  include/
    cstddef
    math.h
    new
    string.h
    avm/pgmspace.h
    avm/runtime.h
  lib/
    crt0.o
    crt0_test.o
    crt0_sketch.o
    libavm.a
    libavm-builtins.a
```

The runtime sysroot provides `<avm/pgmspace.h>` and the text API in `<avm.h>`.
`AVM_FONT_5X7` selects the fixed-width 5×7 ASCII font.
`AVM_FONT_BR4` selects a variable-width four-pixel-high font with a five-pixel
line height. It has no glyph for `#`, `$`, `&`, `*`, `@`, `{`, `|`, `}`, or `~`;
these characters have zero advance.
`AVM_FONT_BR5` and `AVM_FONT_BR5N` select variable-width five-pixel-high fonts
with a six-pixel line height.
`AVM_FONT_BR5D` selects the variable-width printable-ASCII font with five pixels
above the baseline, one-pixel descenders, and a seven-pixel line height. Pass
any font pointer to `avm_set_text_font`.
`libavm.a` supplies addressable RAM and program-memory string wrappers,
including `memcpy` and `memcpy_P`.
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

Executable links automatically analyze finalized VM frames, per-call outgoing
arguments, and three-byte return records. A provable path above the 256-byte
stack limit is a linker error; unknown recursion or indirect calls alone do
not fail the link. Add `-Wl,--avm-print-stack-usage` to print the proven peak
and whether the bound is complete. See [stack analysis](../docs/stack-analysis.md)
for the accounting, metadata, and runtime boundaries.

For an ordinary C or C++ program, one command produces both the linked ELF
and a development image:

```sh
<sdk>/bin/avm-clang hello.c -o hello.elf
# writes hello.elf and hello.bin
```

The native driver defaults to `avm-unknown-arduboyfx`, discovers the build or
installed sysroot relative to its executable, and uses freestanding AVM
compile defaults. For C++, exceptions, RTTI, thread-safe statics, and
`__cxa_atexit` are disabled by default. A link adds `crt0.o`, `libavm.a`,
`libavm-builtins.a`, and `--gc-sections`, then runs `llvm-avm-image
--development`. Explicit Clang options can override compile defaults.
`--sysroot=PATH` selects another AVM sysroot. Standard `-c`, `-S`, `-E`,
`-fsyntax-only`, `-M`, and `-MM` actions produce no image.

The same driver also supports a separate compile and link:

```sh
<sdk>/bin/avm-clang -c hello.cpp -o hello.o
<sdk>/bin/avm-clang hello.o -o hello.elf
<sdk>/bin/avm-objdump -d hello.elf
```

For full link-time optimization across translation units, compile each source
with `-flto=full` and link the resulting bitcode objects with `avm-clang`:

```sh
<sdk>/bin/avm-clang -O2 -flto=full -c main.c -o main.o
<sdk>/bin/avm-clang -O2 -flto=full -c helper.c -o helper.o
<sdk>/bin/avm-clang -flto=full main.o helper.o -o app.elf
```

`avm-ar` can package bitcode objects into static libraries. The linker also
accepts a mix of bitcode and native AVM objects; only the bitcode objects
participate in LTO.

Use `-L`, `-l`, `-Wl,`, and `-Xlinker` for linking. Use
`--avm-startup=crt0_sketch.o` for `setup()`/`loop()` programs,
`--avm-entry=SYMBOL` for a custom entry, `--avm-image=PATH` to choose the
image path, or `--avm-no-image` to keep only the ELF. `-nostartfiles` and
`-nodefaultlibs` disable the respective defaults; `-nostdlib` disables both.
C++ entry functions such as
`main`, `setup`, and `loop` must use `extern "C"` linkage.

The equivalent manual commands are:

```sh
<build>/llvm-build/bin/clang \
  --target=avm-unknown-arduboyfx \
  -ffreestanding \
  -fno-stack-protector \
  -isystem <build>/avm-sysroot/include \
  -c main.c \
  -o main.o

<build>/llvm-build/bin/avm-ld \
  --entry=_start \
  <build>/avm-sysroot/lib/crt0.o \
  main.o \
  -L<build>/avm-sysroot/lib \
  -lavm \
  -lavm-builtins \
  -o app.elf

<build>/llvm-build/bin/avm-image --development app.elf -o app.bin
```

To create an Arduboy FX package, use `avm-image app.elf -o app.arduboy`.
It includes the SDK's `bin/avm/interp.hex`, `fxdata.bin`, and an erased
`fxsave.bin` when the program has saved bytes. Optional `--title`,
`--description`, `--author`, `--genre`, and
`--game-version` flags set the package metadata; `--interpreter` overrides the
bundled HEX.

Keep application objects before the archives. Static archive resolution uses
references from objects already seen by the linker.

## Fast calls and addressable functions

AVM program memory is Clang address space 1. C uses explicit names:

~~~c
memcpy(dst, ram, n);
memcpy_P(dst, flash, n);
~~~

C++ normally uses one name. Overload resolution selects from the source
pointer type:

~~~cpp
memcpy(dst, ram, n);
memcpy(dst, flash, n);
avm_draw_text(0, 10, ram_text);
avm_draw_text(0, 10, F("flash text"));
~~~

The source overloads retain distinct C ABI symbols such as memcpy and
memcpy_P; no runtime pointer inspection is involved. Explicit _P names
remain supported in C++ for compatibility. The compiler owns only internal
__avm_* and __builtin_avm_* spellings. Public _P names are ordinary functions
that the runtime may define directly.

Direct string calls use header dispatch to the AVM system services.
Parenthesized calls and address-taking select real ABI functions, including
the program-memory overload. The C++ true-variadic snprintf and
avm_draw_textf overloads expand typed argument packs into the existing
compiler builtins. Program-memory-only debug formatting keeps its explicit
_P name.

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
