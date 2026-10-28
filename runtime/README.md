# AVM runtime and sysroot

This directory owns target-side startup objects, public runtime headers,
addressable library wrappers, and compiler helper routines. Compiler target
semantics and `__avm_*` builtins remain in the LLVM submodule.

## Build targets

From the main AVM build:

```text
avm_runtime         Build CRT objects and target libraries.
avm_runtime_asm     Regenerate checked-in runtime/asm disassemblies.
avm_runtime_checks  Compile C and C++ header smoke tests.
avm_sysroot         Stage headers, CRT objects, and libraries.
avm_sdk             Build the AVM toolchain and complete staged sysroot.
```

`runtime/asm/` contains per-source disassemblies of the production CRT, library,
and compiler-helper objects, including every function before unused sections
are removed. Paths mirror the sources, for example
`lib/math/ef_sqrt.c` produces `asm/lib/math/ef_sqrt.asm`. These files are intended
to be versioned. The default build, `avm_runtime`, and `avm_sdk` refresh them;
`avm_runtime_asm` regenerates them without building diagnostic MIR dumps.

Disassemblies include instruction bytes, symbols, and relocation records.
Relocations identify unresolved call targets and data references; the final
link may shorten calls and branches. File headers omit machine-specific build
paths. Generated MIR diagnostics remain under the ignored build directory.

Build and install the SDK with:

```sh
cmake --build build --config RelWithDebInfo --target avm_sdk
cmake --install build --config RelWithDebInfo --component avm-sdk --prefix <sdk>
```

The build-tree driver is `build/llvm-build/bin/avm-clang` (`.exe` on Windows).
The installed SDK is relocatable, with native tools in `<sdk>/bin` and the
runtime in `<sdk>/sysroot`; its C/C++ tools need no Python installation. The
optional `avm_music.py` asset compiler in `<sdk>/bin` requires Python 3. The SDK also
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
`<avm/audio.h>` (also included by `<avm.h>`) supplies autonomous four-channel
music, SFX, and direct-tone controls through `SYS 0x38`. See
[the audio documentation](../docs/audio.md) for APIs and asset generation.
`<avm.h>` also supplies `avm_get_system_width()`, `avm_get_system_height()`,
and `avm_get_system_display_type()` for immutable display configuration.
`avm_send_display_command(cmd, n)` synchronously sends a RAM byte stream as raw
controller commands without modifying RAM. Callers own controller-state
compatibility with subsequent `avm_display()` calls. See the
[command and query contracts](../docs/arch.md#4930-send_display_command).
`<new>` provides placement `new` and `new[]` for caller-owned storage, with
their matching placement `delete` overloads. Ordinary C++ allocation operators
are not included. `<stdlib.h>` provides `malloc`, `calloc`, `realloc`, and `free`.
The first-fit implicit-block allocator uses the unused static RAM after the
final `.saved` and `.data` storage through `0x04ff`, starting at the linker's
`__avm_heap_start`. It requires exactly two persistent bytes and two header bytes
per block, with no alignment padding or reserved heap array. Adjacent free
blocks coalesce immediately, free tail space is reclaimed, and `realloc` resizes
in place when possible. `malloc(0)` returns NULL and `realloc(p, 0)` frees `p`.
Allocation failure preserves existing allocations and does not set `errno`.
The allocator is non-reentrant; interrupt handlers must not interrupt allocator
operations with another allocator call. `malloc.o` is extracted from `libavm.a`
only when required, adding no code or RAM to programs that do not use allocation.
Custom linker scripts must define the equivalent heap-start symbol.
`libavm.a` contains weak traps for compiler-generated pure or deleted virtual
calls and deleting destructors. Applications can replace the delete traps if
they provide their own fixed-capacity allocator.

`<time.h>` provides `clock_t`, `CLOCKS_PER_SEC` (1000), and `clock()`. The
32-bit unsigned counter returns elapsed milliseconds since runtime startup,
with one-millisecond resolution. It wraps modulo 2^32 after about 49.7 days;
unsigned subtraction measures intervals across one wrap when they are shorter
than a full counter period. This is an elapsed-time approximation, not precise
CPU-consumption measurement.

The C99 calendar interface uses signed 64-bit `time_t`, representing integral
seconds since 1970-01-01 00:00:00 UTC, including negative timestamps. Gregorian
conversions use the proleptic calendar, fixed UTC, no DST adjustment, and no
leap-second accounting. `time()` returns `(time_t)-1` (also stored through a
non-null argument), because current calendar time is unavailable. `difftime()`
computes differences before converting to the target's floating-point precision.
`mktime()` normalizes all date and time fields; unrepresentable normalized years
fail without changing the input. The supported `tm_year` range is -32768..32767.

`gmtime()` and `localtime()` share an 18-byte static `struct tm`; `asctime()` and
`ctime()` share a 26-byte output buffer. Subsequent calls overwrite these shared
results. `asctime()` rejects abnormal fields and years outside 1000..9999.
`strftime()` supports every C99 conversion and applicable E/O modifier in the
fixed `"C"` locale, including ISO week-years and UTC zone formatting. It writes
directly into caller storage. No calendar function needs an allocator. Calendar
names reside in program memory; only the two shared buffers consume permanent
RAM (44 bytes together), and each is linked only when used. `mktime()` and
`strftime()` alone require no permanent calendar RAM.

`<locale.h>` provides the C99 locale interface with a permanently fixed `"C"`
locale. The native locale selected by `setlocale(category, "")` is also `"C"`;
no dynamic locale state is required. `localeconv()` uses shared static RAM data:
all empty strings point to the terminator of the shared `"C"` array, alongside
the decimal-point string and the `struct lconv` object. Unused locale functions
consume zero linked RAM. Programs using `localeconv()` retain approximately 38
bytes of locale data.

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

`assert.h` keeps diagnostic text, expression, filename, and function name in
program memory. A failed assertion emits an AVM debug diagnostic and calls
`abort()`. This debug channel is not a compliant standard `stderr` stream.
Defining `NDEBUG` suppresses expression evaluation; reincluding `assert.h`
updates the macro after changing `NDEBUG`.

`math.h` declares ordinary C ABI functions. Direct calls, parenthesized calls,
and function pointers all use the same implementations in `libavm.a`. The
compiler also lowers standard math intrinsics and compatibility `__avm_*f`
builtins to these functions. No math SYS services are required.

The math kernels use only binary32 arithmetic. Polynomial coefficients and
range-reduction digits are embedded as instruction immediates; functions are
linked on demand with `--gc-sections`. They do not provide errno or fenv state. See
[code size and performance measurements](../docs/math-runtime-tradeoff.md).

`string.h` retains its function-like call macros; define
`AVM_STRING_NO_BUILTIN_MACROS` before including it to request ordinary calls.
`strcpy` and `strcpy_P` are ordinary callable functions that copy through the
terminating NUL. `strncpy` and `strncpy_P` retain their bounded, zero-padding
semantics.

`libavm-builtins.a` contains the compiler's 32-bit and 64-bit integer
multiplication, division, remainder, and shift helpers. Keep this archive after
application objects and `libavm.a` in the link command so references from both
are resolved.

The 64-bit division helpers use the same zero-divisor convention as their
32-bit counterparts: unsigned quotient is `UINT64_MAX`, signed quotient is
`-1`, and remainder is the numerator. Direct shift-helper calls with counts at
or above the value width (32 or 64) return zero for left and logical-right
shifts and the sign fill for arithmetic-right shifts. The 32-bit helpers
decompose values into two 16-bit words and use variable 16-bit shift
instructions, without a loop over the count. Source-language division by zero
and out-of-range shift counts remain undefined behavior.

`<signal.h>` supports all six C99 signals with synchronous software delivery
through `raise()` or `abort()`. Default dispositions halt execution without normal
termination callbacks. Installed handlers are one-shot: their disposition resets
to `SIG_DFL` before the call, and handlers may install a replacement. Hardware
and interpreter exceptions are not automatically converted to C signals.
The six packed three-byte function pointers occupy 18 bytes of static RAM only
when signal support is linked; `abort()` alone does not pull in this table.
