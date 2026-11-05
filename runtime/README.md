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
their matching placement `delete` overloads, and the replaceable allocation
functions described in [C++ allocation](#c-allocation). `<stdlib.h>` provides
`malloc`, `calloc`, `realloc`, and `free`.
The first-fit implicit-block allocator uses the unused static RAM after the
final `.saved` and `.data` storage through `0x04ff`, starting at the linker's
`__avm_heap_start`. It requires exactly two persistent bytes and two header bytes
per block, with no alignment padding or reserved heap array. Adjacent free
blocks coalesce immediately, free tail space is reclaimed, and `realloc` resizes
in place when possible. `malloc(0)` returns NULL and `realloc(p, 0)` frees `p`.
Allocation failure preserves existing allocations and does not set `errno`.
`aligned_alloc` supports only alignment 1, the fundamental alignment of every
AVM type, and returns NULL for any other alignment. `free_sized` and
`free_aligned_sized` free their block and ignore the size and alignment
arguments. `strdup` and `strndup` allocate through `malloc`, so they fail when
that allocation fails.
The allocator is non-reentrant; interrupt handlers must not interrupt allocator
operations with another allocator call. `malloc.o` is extracted from `libavm.a`
only when required, adding no code or RAM to programs that do not use allocation.
Custom linker scripts must define the equivalent heap-start symbol.
`libavm.a` contains weak traps for compiler-generated pure and deleted virtual calls.
Deleting destructors reach the `operator delete` functions of `<new>`.

`<time.h>` provides `clock_t`, `CLOCKS_PER_SEC` (1000), and `clock()`. The
32-bit unsigned counter returns elapsed milliseconds since runtime startup,
with one-millisecond resolution. It wraps modulo 2^32 after about 49.7 days;
unsigned subtraction measures intervals across one wrap when they are shorter
than a full counter period. This is an elapsed-time approximation, not precise
CPU-consumption measurement. The C++ `std::chrono::steady_clock` reads the same counter
in milliseconds, and `high_resolution_clock` names it.

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
`strftime()` and `wcsftime()` support C23 conversions and applicable E/O
modifiers in the fixed `"C"` locale, including ISO week-years and UTC zone
formatting. Both write directly into caller storage. No calendar function needs an allocator. Calendar
names reside in program memory; only the two shared buffers consume permanent
RAM (44 bytes together), and each is linked only when used. `mktime()` and
`strftime()` alone require no permanent calendar RAM.

`gmtime_r()` and `localtime_r()` write into the caller's `struct tm` and use no
shared buffer. Both return NULL and leave that object unchanged when the time is
unrepresentable. The local time zone is UTC, so `localtime_r()` shares the
fixed-UTC conversion. `timegm()` shares `mktime()`'s conversion, which normalizes
the fields and fails without changing them.

`struct timespec` holds a 64-bit `tv_sec` and a 32-bit `tv_nsec`. `TIME_UTC` is
1. Calendar time is unavailable, so `timespec_get()` and `timespec_getres()` fail
for every base, returning zero and leaving the caller's object unchanged.

`<locale.h>` provides the C99 locale interface with a permanently fixed `"C"`
locale. The native locale selected by `setlocale(category, "")` is also `"C"`;
no dynamic locale state is required. `localeconv()` uses shared static RAM data:
all empty strings point to the terminator of the shared `"C"` array, alongside
the decimal-point string and the `struct lconv` object. Unused locale functions
consume zero linked RAM. Programs using `localeconv()` retain approximately 38
bytes of locale data.

`<wctype.h>` provides all C99 wide classification and case-mapping interfaces in
the fixed C locale. `wint_t` is signed 16-bit and `WEOF` is -1; all 256 byte
values are preserved by case conversion except mapped ASCII letters. Named
descriptors support the twelve standard classes and `tolower`/`toupper`.

In C23 mode, `memchr`, `strchr`, `strrchr`, `strpbrk`, and `strstr` from
`<string.h>`, and `wmemchr`, `wcschr`, `wcsrchr`, `wcspbrk`, and `wcsstr` from
`<wchar.h>`, are qualifier-generic macros: each result keeps the qualification of
the searched pointer. A parenthesized name, or a use that is not a call, still
denotes the addressable function.

`<uchar.h>` converts between UTF-8, UTF-16, or UTF-32 and the fixed C locale.
Each byte with value `v` denotes the code point `v`, so every byte converts, and
code points above 255 fail with `EILSEQ`. `mbstate_t` is one byte and holds only
a pending unit of a partial sequence: the second UTF-8 unit of U+0080 through
U+00FF, the lead byte of `c8rtomb`, or a pending high surrogate for `c16rtomb`.

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
`__cxa_atexit` are disabled by default. An explicit `-fexceptions` enables the
catch-all runtime in [C++ exceptions](#c-exceptions), and the default language
mode is `-std=c++23`. The SDK supplies Clang's target-independent builtin headers and
AVM's freestanding headers; it does not include a hosted C++ standard library.
A link adds `crt0.o`, `libavm.a`,
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

Immutable address-space-zero objects and string literals need no program-memory
name. The compiler places them in the AS0 flash window automatically, and an
ordinary AS0 pointer reads them through the same SYS services as RAM. Writable
objects, including a writable pointer that refers to a literal, stay in RAM. An
object that needs runtime initialization, or that has a writable `mutable`
member, also stays in RAM. The window holds at most 62,720 bytes of retained
objects. The `_P` names remain the way to read address-space-one data.

~~~c
static const char message[] = "Hello";   /* flash window */
static const char *current = message;     /* RAM pointer to a flash object */
memcpy(dst, message, sizeof message);     /* AS0 pointer, no _P name */
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
compiler builtins. Program-memory debug formatting keeps its explicit
_P name.

`assert.h` keeps diagnostic text, expression, filename, and function name in
program memory. A failed assertion emits an AVM debug diagnostic and calls
`abort()`. This debug channel is not a compliant standard `stderr` stream.
Defining `NDEBUG` suppresses expression evaluation; reincluding `assert.h`
updates the macro after changing `NDEBUG`. As C23 specifies, `assert` takes an
ellipsis, but an enabled assertion accepts exactly one expression: `assert(a, b)`
and `assert()` are preprocessing errors. A parenthesized comma expression counts
as one expression.

`math.h` declares ordinary C ABI functions. Direct calls, parenthesized calls,
and function pointers all use the same implementations in `libavm.a`. The
compiler also lowers standard math intrinsics and compatibility `__avm_*f`
builtins to these functions. No math SYS services are required.

The math kernels use only binary32 arithmetic. Polynomial coefficients and
range-reduction digits are embedded as instruction immediates; functions are
linked on demand with `--gc-sections`. They report math errors through `errno` (`math_errhandling == MATH_ERRNO`);
floating-point exception state is not provided. See
[code size and performance measurements](../docs/math-runtime-tradeoff.md).

`string.h` retains its function-like call macros; define
`AVM_STRING_NO_BUILTIN_MACROS` before including it to request ordinary calls.
`strcpy` and `strcpy_P` are ordinary callable functions that copy through the
terminating NUL. `strncpy` and `strncpy_P` retain their bounded, zero-padding
semantics.

`libavm-builtins.a` contains the compiler's 32-bit and 64-bit integer
multiplication, division, remainder, and shift helpers, and the 64-bit
integer-to-float conversion helpers `__floatdisf` and `__floatundisf`. Keep this
archive after application objects and `libavm.a` in the link command so
references from both are resolved.

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

`at_quick_exit` and `quick_exit` keep their own table of 32 callbacks, the C11
minimum. Registration returns zero on success and nonzero when the table is full
or the function is NULL. `quick_exit` runs the registered callbacks in reverse
order, removing each one before its call, then calls `_Exit`. It runs no `atexit`
callbacks and no C++ destructors. The table and its count occupy 97 bytes of
static RAM only when a program references either function.

## Fatal trap reporting

`avm/trap.h` declares the 32-byte `avm_trap_context_t` and the trap reason
constants. The default handler is `__avm_trap_entry`, an assembly entry in
`libavm.a`. On a fatal interpreter trap, the interpreter jumps to it directly
without pushing a return record. The entry copies the complete 256-byte original
stack from `0x0900-0x09FF` to `0x0100-0x01FF`, sets SP to `0x0A00`, and tail
jumps to `__avm_trap_report(avm_trap_context_t const *)`.

The fixed trap memory layout is:

| Address | Use |
|---|---|
| `0x0100-0x01FF` | Full 256-byte stack snapshot |
| `0x0200-0x021F` | Trap context, 32 bytes |
| `0x0220-0x04FF` | Disposable RAM available to the reporter |
| `0x0500-0x08FF` | Normal OLED framebuffer |
| `0x0900-0x09FF` | Original stack, reused as the fresh reporter stack |
| `0x0A00` | Reset guest SP |

No ordinary guest RAM is reserved for this during normal execution. All static
RAM is disposable after a fatal trap, so the reporter must not rely on
application globals.

`__avm_trap_report` clears the framebuffer, draws a crash screen with
`AVM_FONT_BR5N`, updates the OLED once, and loops forever. The six-pixel rows
are:

| Row | Content |
|---|---|
| 1 | Trap reason: `STACK OVERFLOW`, `INVALID PRIMARY`, `INVALID SECONDARY`, or `UNKNOWN TRAP` |
| 2 | `PC:xxxxxx SP:xxxx`, the raw 24-bit interpreter PC and the original guest SP |
| 3 | `FN:<function>`, from crash metadata, showing the first 30 characters |
| 4 | `<filename>:<line>`, from crash metadata, showing the first 22 characters of the filename |
| 5-8 | `R0:xxxx R1:xxxx`, `R2:xxxx R3:xxxx`, `R4:xxxx R5:xxxx`, and `R6:xxxx R7:xxxx` |
| 9 | `CC:xx`, the guest condition flags |

The reporter formats with `avm_draw_textf_P` and `avm_draw_text_P`, so it has no
numeric formatter of its own. Its format strings are in program memory.

Without crash metadata the function row reads `FN:?` and the source row reads
`?:?`. The register, PC, SP, and flag rows are shown either way. A second fatal
trap halts natively without rerunning the reporter.

### Crash metadata

Every image carries a compact `AVD1` block by default. The block is part of the
normal AVM image format, so a program needs no setting to get function names in
the crash screen. The block holds function names from the final linked symbols
and, when the program was compiled with `-g`, source lines from DWARF. It needs
no guest RAM. Its internal layout is a 12-byte header and a five-section
directory: a function index, a filename index, source checkpoints, a delta-encoded
source transition stream, and a string pool. `docs/arch.md` Section 69.2 gives
the full layout, and `tools/dump-crash.py` inspects it.

Two size-saving opt-outs are available. `avm_add_project()` and
`avm_add_image()` take `NO_CRASH_INFO`, which passes `--no-crash-info` to
`llvm-avm-image`. The packer then writes `crashInfo` zero and no block:

```cmake
avm_add_project(my_game
    SOURCES main.cpp
    COMPILE_OPTIONS -O2
    GC_SECTIONS
    NO_CRASH_INFO)
```

Source lines require `-g`. Function names do not, so a build without `-g` still
names its functions on the crash screen. Function names come from final linked `STT_FUNC` symbols. C++ names are
demangled in full, with their namespaces, template arguments, and parameter
lists, and they are stored without truncation. Source filenames are reduced to
their basenames and cut to 48 bytes with their extensions kept.
Source lines come from the final DWARF line table, so they follow linker
relaxation.

The packer never fails an image over metadata. If a part cannot be built, such
as unusable DWARF or a limit that is exceeded, it warns and leaves that part out.
If the complete block does not fit the payload limit, the source lines are
dropped first and the function names are kept when they fit alone. The image
packs either way.

`__avm_trap_lookup` maps a program address to its function and source location
directly from flash:

```c
typedef struct __attribute__((packed)) {
    char const AVM_PROGMEM *function;
    char const AVM_PROGMEM *file;
    uint32_t line;
} avm_trap_location_t;

void __avm_trap_lookup(uint32_t pc, avm_trap_location_t *out);
```

On AVM the result is ten bytes: the function pointer at offset 0, the filename
pointer at offset 3, and the line at offset 6. The pointers are 24-bit program
addresses. They point at the first character of a NUL-terminated string in the
image's string pool, so the reporter reads them with `%S` and nothing is copied
into RAM. The header asserts this layout on AVM.

The lookup always initializes `out`. A null function pointer means no matching
function, a null file pointer means no matching source location, and line zero
means no line. Malformed metadata yields the same null results, and it never
traps. The lookup allocates nothing, reads only bounded flash ranges, and does not
copy the tables into RAM. A function lookup is a binary search over the function
records. A source lookup restores the last checkpoint at or before the PC and
decodes at most 64 transitions, so no step scans the whole stream. The reporter
stores its result at `0x0220`, the disposable area in the trap layout above.

AVD1 does not yet contain unwind information. A lookup describes one program
address and returns no caller frames, so the crash screen cannot show a call
stack.

Compiler-generated call-frame information is kept in the linked ELF's
`.debug_frame` section for host debugging and for future compact unwind
extraction. The image packer does not copy it into the AVM flat image, so it
uses no guest flash or RAM. Unwind tables are on by default, so this information
is present without `-g`.

The trap context holds the raw interpreter `VM_PC`, which need not be the start
of the faulting instruction. The lookup uses that PC unchanged and does not
correct it. For an invalid secondary `SYS` encoding, the PC points at the operand
byte inside that two-byte instruction, and the row containing it gives the line.
Source locations are best-effort for any trap where the interpreter PC has
already advanced.
Stack unwinding and caller frames are not provided.

Links that use `libavm.a` through `avm_add_image()` retain the handler
automatically through `--undefined=__avm_trap_entry`. Manual `ld.lld` links must
pass `--undefined=__avm_trap_entry` to get the default handler. Images without
it have a zero header `trapEntry` and keep the fail-stop behavior.

## C++ allocation

`operator new` and `operator new[]` are replaceable. Each form is a weak definition in `new.o`:
plain, nothrow, sized deletes, and aligned, in both array and scalar forms. A program that defines
a function with the same signature replaces it at link time. Allocation calls the installed
`std::new_handler` and retries after each failure, and only a missing handler turns the failure
into `std::bad_alloc`. The throwing forms throw that exception through the exception runtime, and
the nothrow forms catch it and return null. A zero-byte request still returns a distinct non-null
block, because `malloc(0)` returns NULL on AVM.

An alignment up to the default new alignment, which is one byte on AVM, uses the heap block
directly. A larger alignment allocates room for the alignment and a stored block address, and it
returns the aligned address. Deallocation applies the same alignment test, so it releases the
stored block. The `operator delete` forms return blocks to the heap.

Because the throwing forms need the exception runtime, a program that calls `operator new` links
it. The throw path also places the unwinder's match frames, about 136 bytes at `-O2`, below each
call to `operator new` in the static stack bound. An allocation made deep in a call tree can
therefore exceed the 256-byte guest stack and fail to link.

## C++ exceptions

Build with `-fexceptions`, which overrides the SDK's `-fno-exceptions` default. A
`throw` runs the destructors of the automatic objects between it and its
`catch (...)` handler, and then the handler runs. The compiler emits LLVM's DWARF
landing pads. A cleanup pad destroys its objects and calls `_Unwind_Resume`. Each
call site is an entry in `.avm.eh_sites`, and each call in a function with landing
pads is an entry in `.avm.eh_calls`. The packer turns those records, the action lists
in `.avm.eh_sites`, and the `.debug_frame` rows into the `AVEH5` block described in
[arch.md](arch.md) Section 69.3. The unwinder's `eh_unwind.c` is built without
unwind tables, because the unwinder never unwinds through its own frames.

The runtime objects are `eh_cxa.c`, `eh_unwind.c`, `eh_context.asm`, `eh_cxa_throw.asm`,
`eh_cxa_rethrow.asm`, and `eh_cxa_rethrow_primary.asm`. They are archive members of `libavm.a`, so a program links
them only when it references one of their symbols. The C++ ABI subset provides
`__cxa_allocate_exception`, `__cxa_free_exception`, `__cxa_init_primary_exception`,
`__cxa_throw`, `__cxa_rethrow`, `__cxa_begin_catch`, `__cxa_get_exception_ptr`,
`__cxa_end_catch`, `__cxa_current_primary_exception`, `__cxa_increment_exception_refcount`,
`__cxa_decrement_exception_refcount`, `__cxa_uncaught_exceptions`, `_Unwind_Resume`,
`__gxx_personality_v0`, `__cxa_bad_typeid`, and `std::terminate`. The `std::exception_ptr`
operations use the reference-counting entries, and `__avm_rethrow_primary_exception` is the
shim that `std::rethrow_exception` calls. The runtime defines the Itanium support vtables that the
descriptors name, in program space: `__class_type_info`, `__fundamental_type_info`,
`__si_class_type_info`, `__vmi_class_type_info`, `__pointer_type_info`,
`__enum_type_info`, `__function_type_info`, `__pointer_to_member_type_info`, and
`__array_type_info`. Each is a nine-byte object whose address point lies six bytes in.
`__avm_eh_exact_pointer_ref_type_info` is the marker vtable. A reference marker names the
pointer type that a catch of a non-const pointer by reference must match exactly, and the
runtime classifies it by this vtable alone.
The descriptors themselves are emitted by the compiler into program flash; see
[arch.md](arch.md) Section 60.1.

Propagation has two phases. Phase one searches the frames from the throw for the
first catch that matches the thrown type. The search looks up each frame's function by
binary search over the `AVEH5` index, so its cost grows with the logarithm of the
function count, not with the program size. A typed catch matches when its descriptor
address equals the thrown one, or when it names a base subobject of the thrown class,
virtual or nonvirtual, that occurs exactly once and is reached by a public path. A
catch-all matches everything. The base subobject's byte offset is the handler adjustment,
which phase one records with the selector. Phase one runs no destructor. A pointer catch
matches a thrown pointer by the C++ pointer conversions: qualification, a public base of a
derived pointee, a pointer to void, a function pointer that drops `noexcept`, and a null
pointer from `std::nullptr_t`. The matched value is formed in the exception header's buffer,
and the thrown pointer is never changed. When no frame before the handler has a cleanup,
the handler's landing state is installed directly, and phase two does not run. If no
frame has a matching catch, the program halts before any cleanup runs. The search
records the matched selector in the header. Phase two enters each
cleanup pad in turn with selector 0. A cleanup pad runs its destructors and calls
`_Unwind_Resume`, which continues from the caller that the pad saved. A pad that
has both a cleanup and typed clauses is entered as a handler when a clause matches,
and as a cleanup when none does. The handler is entered last with the recorded
selector, and it calls `__cxa_begin_catch`. `__cxa_end_catch` releases the handler's
reference, and the last release destroys the object and frees it. A cleanup pad never
ends the exception.

`throw;` calls `__cxa_rethrow`. The shim in `eh_cxa_rethrow.asm` takes the innermost caught
exception from `__avm_eh_rethrow_header`, which terminates unless one is caught, and it
records the rethrow site in the header's landing context. The object, its type
descriptor, its destructor, and its size keep their addresses and values, and no memory
is allocated. `__avm_eh_rethrow` sets the state to `THROWN` with the rethrow-pending bit,
`0x80`, and it runs both phases from the rethrow site. The pending bit is cleared only by
the release of the abandoned catch: the `__cxa_end_catch` in the rethrow site's landing
pad, which Clang places ahead of the dispatch to an enclosing handler. That release keeps
the base state, so the pad either resumes or dispatches. `__cxa_begin_catch` accepts only
a state without the bit, so a handler that is reached before the release terminates. An
unhandled rethrow terminates without releasing or freeing the exception.

`__cxa_throw` is a frameless shim. It takes the object in r4, the type-descriptor
program address in r6:r7, and the destructor program address as a three-byte stack
argument. It stores the throw site into the exception header, which lies 59 bytes
below the object, and then tail-transfers to `__avm_eh_throw`. The header holds the
landing context, the 24-bit type-descriptor address, the 24-bit destructor address,
the size, the lifecycle state, the resume cursor, the handler's selector, and the
handler adjustment, the conversion of a pointer handler, the link to the next caught
exception, and the reference count. `__cxa_begin_catch` and
`__cxa_get_exception_ptr` return the object plus the adjustment, or the converted buffer of a
pointer handler, and `__cxa_end_catch` destroys the complete object. The
landing SP
of each pad is the caller SP at the call plus the call's outgoing argument bytes.
A frame that uses r3 as its CFA base keeps its dynamic allocations, because the SP
never comes from r3. Call records match the exact return PC.

At most one exception is in flight at a time. A throw while one is in flight, including a
throw from a destructor that runs during unwinding, halts the program. A throw from a catch
body is allowed; see [Nested exceptions and exception pointers](#nested-exceptions-and-exception-pointers). Base matching
reads the class descriptors in program flash, and the vptrs of the thrown object in RAM.
It walks at most eight descriptor levels and 512 base edges for one clause, and a walk
past either limit fails the throw. A virtual base's offset is read through the vptr of
the subobject that holds the virtual edge. The RTTI names the vtable slot that holds the
base's signed displacement, relative to the vtable address point, and the runtime reads
that three-byte slot in program flash. A zero vptr, a slot outside the 24-bit address
range, or a base outside the object fails the throw. The runtime does not know the
extent of the packed image, so a slot inside the address range is read, and only its
effect on the object is checked. Exception filters are not provided, and the
backend rejects a filter at compile time. When no handler exists, when metadata is
malformed, or when the header's bookkeeping is inconsistent, the runtime calls `abort()`,
which halts the guest.

### Nested exceptions and exception pointers

A throw from a catch body is allowed. The caught exception stays on the caught stack, and the
new exception nests inside it. In the inner handler, `std::current_exception` returns the inner
exception, and after that handler ends it returns the outer one. `__cxa_end_catch` ends the
innermost catch. That catch can be one whose cleanup runs while a newer exception unwinds
through it, so the exception in flight need not be the one that ends.

Each exception header counts its references. The throw holds one, which the handler's
`__cxa_end_catch` releases, and each `std::exception_ptr` holds one more. The last release
destroys the object with its destructor and frees the header. `std::current_exception` adds a
reference to the innermost handled exception. It returns null outside every handler, and during
a rethrow that has not yet left its abandoned catch.

`std::rethrow_exception` of the innermost handled exception, called from that handler, transfers
the handler's reference to the rethrow, as `throw;` does, and a catch outside the handler
receives it. A rethrow that a catch nested in the same handler receives is not provided, and
neither is a rethrow of an exception whose catch is still active further out. In both cases a
catch begins while another catch of the same exception is active, which the runtime rejects.

`std::make_exception_ptr` throws and catches a copy when RTTI is disabled. With `-frtti`, libc++
calls `__cxa_init_primary_exception`, which records the descriptor address that the typeid alias
of the copy names.

`std::terminate` calls the handler that `std::set_terminate` installed, or `abort()` when none is
installed. A handler that returns leads to `abort()`. A handler that throws reaches the landing pad
that terminate's `noexcept` contract adds, which calls terminate again, and that nested call
aborts. `std::uncaught_exceptions` returns one while an exception is in flight, including during
a destructor that runs for unwinding.

Every frame between a throw and its handler needs an unwind entry. A function
without `.debug_frame` CFI stops the search at that frame, which halts the
program. The unwinder reads the metadata through the flash anchor
`__avm_eh_metadata_ptr`. It does not copy the table into RAM. Each throw checks
the records it consumes, and `avm_eh_validate_block` checks the whole block.

The guest stack holds 256 bytes, so the exception runtime's own stack use
matters. Measured peaks, the header size, and the metadata and image costs are in
[arch.md](arch.md) Section 69.3.

Tests use the `avm_eh_catch_all_run` target. It builds `tests/cpp/eh_*.cpp` and
`tests/asm/eh_*.asm` at O0 and O2, and it runs them through `avm_tests`. The
`avm_eh_inheritance_run` target runs the base-matching fixtures at O0, O2, and LTO/O2.
It checks each handler's selector and adjustment against the emulator and the packed
RTTI, and it checks that each malformed RTTI field fails the throw. The
`avm_eh_typed_run` target runs the exact-matching fixtures at O0, O2, and LTO/O2,
checks each handler against the emulator and the packed block, and runs the malformed
block cases. It also
runs `avm_eh_cleanup_run`, which executes the cleanup fixtures at O0, O2, and
LTO/O2, and checks each cleanup chain and landing SP against the emulator and the
packed block. It also runs the corrupted-metadata cases for cleanup, and the
termination fixtures. `avm_eh_hardening_run` checks the landing-pad SP, the throw
context, the corrupted-metadata behavior, and the stack measurements against the
emulator. The ordinary C++ and assembly matrices exclude the `eh_` prefix.

## Run-time type information

`-frtti` enables `typeid`. Clang places each descriptor and type name in the
`.avm.rtti` output section, which lies in the AS0 flash window directly after `.flash`.
A `typeid` expression returns the window alias of its descriptor, which is the program
address plus `0x0600`, so the runtime needs no table or copy. `lib/cxxabi.cpp` defines
the out-of-line destructor of `std::type_info`. The equality, ordering, hash, and name
members are inline in the AVM branch of libc++'s `<typeinfo>`, where `name()` returns
the flash alias of the mangled name. Static `typeid` never calls through the support
vtables above, so they need no RAM or destructor entries.

A polymorphic `typeid` calls `__avm_typeid_from_object`, which `lib/rtti_dynamic.c`
defines. It reads the object's 24-bit vptr from RAM, reads the RTTI slot three bytes
below it, and returns the flash alias of that descriptor, or calls `abort()` for a
malformed object or slot. `lib/exception_base.cpp` defines the out-of-line members of
`std::exception`, and `lib/eh_bad_typeid.cpp` defines the members of `std::bad_typeid`
and `__cxa_bad_typeid`, which a null polymorphic operand calls. The last two are archive
members that a program links only when it refers to them, and they are built with
`-frtti` and, for `eh_bad_typeid.cpp`, `-fexceptions`.

`__dynamic_cast` is defined in `lib/dynamic_cast.c`. It reads the source vptr, the offset to
top, and the dynamic descriptor from the packed image, then walks the dynamic class hierarchy
with a nonrecursive iterator whose state lives in the caller's frame. `__avm_dynamic_cast_to_void`
is defined in `lib/dynamic_cast_void.c`. It implements `dynamic_cast<void *>` from the offset to
top alone. The two are separate archive members, `dynamic_cast.o` and `dynamic_cast_void.o`, so a
program that uses only `dynamic_cast<void *>` never extracts `dynamic_cast.o`, with or without
garbage collection. The void member references only `abort`, and it has no data or bss. `lib/eh_bad_cast.cpp`
defines `std::bad_cast` and `__cxa_bad_cast`, which a failed reference cast calls. Both are archive
members, and they are built with `-frtti` and, for `eh_bad_cast.cpp`, `-fexceptions`. The walk is
bounded at eight levels and 512 edges, and a larger hierarchy ends the program. The walk has one
root, the complete object that the offset to top names. A hierarchy that does not contain the source
at its actual address also ends the program. The lookup, the
linker checks, and the remaining limitations are described in
[docs/arch.md](../docs/arch.md), Section 60.1.

## Narrow stdio streams

`stdio.h` supplies the C99 narrow-stream interface, including the six `scanf`
functions. Every supported standard function has a callable C ABI symbol;
parenthesized calls and function pointers work alongside the existing native
`snprintf`/`vsnprintf` direct-call paths and `_P` extensions.

`stdin`, `stdout`, and `stderr` are distinct, statically initialized two-byte
objects. Each lives in its own `libavm.a` archive member. Unused streams cost
zero guest RAM, including programs that only include the header or format
into buffers. Referencing one stream retains two bytes; two retain four;
three retain six. Generic functions inspect the supplied object's flags and
never reference the three named streams. Startup and termination add no
stdio initialization, registry, buffer, or flushing hook.

Output is unbuffered and goes directly to the debug endpoint. `printf` and
`fprintf` use native RAM-format `SYS 0x3D`; `_P` debug formatting retains
`SYS 0x37`. These services share the interpreter formatter and workspace,
including `%n`, count overflow, integer/floating conversions, and AS1 `%S`.
The C-locale `%lc`/`%ls` conversions use AVM's unsigned-byte `wchar_t`.
No output-sized guest buffer is needed, even when output exceeds guest RAM.
`fwrite` preserves every byte, including NUL and newline.

Input has no backend and reaches EOF immediately, after any single-byte
`ungetc` pushback. EOF and errors have separate indicators. Closing a stream
removes its read/write permissions without freeing its static object.
`_IONBF` is accepted by `setvbuf`; full and line buffering fail with `EINVAL`
without allocating memory. `fflush(NULL)` succeeds without retaining stream
objects because there is no buffered output.

There is no filesystem: `fopen`, `freopen`, `remove`, `rename`, and `tmpfile`
fail with `ENOSYS`; this includes exclusive `fopen` modes. `tmpnam` generates
distinct dummy names until its counter is exhausted; opening them also fails.
`freopen` first closes its old association and clears its indicators; no
mode changes via a null filename are supported.
Positioning operations fail with `ESPIPE`; `rewind` also clears EOF/error
indicators. Invalid stream state fails with `EBADF`; formatter/transfer
failures use `EIO`. `perror` writes the current error message to stderr and
retains no other standard stream. `FOPEN_MAX` is an interface constant and
does not promise working file storage.

This API coverage does not establish hosted C99 conformance. Compilation
remains freestanding (`__STDC_HOSTED__ == 0`); filesystem guarantees, buffered
streams, wide stream orientation/I/O, and the hosted execution requirements
remain tracked in `docs/c23-compliance-gaps.md`.

`fenv.h` exposes a fixed floating-point environment: round-to-nearest is the
only rounding mode, no exception flags are supported, and saving or restoring
the environment or C23 control modes has no effect on arithmetic.
