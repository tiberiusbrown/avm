# AVM Clang code generation

Configure the repository normally, then build the Debug toolchain and smoke
test through the top-level convenience targets:

```text
cmake --build build --config Debug --target avm_toolchain --parallel
cmake --build build --config Debug --target avm_codegen_smoke --parallel
```

The compiler can be invoked without a C runtime or standard library:

```text
build/llvm-build/bin/clang --target=avm-unknown-arduboyfx \
  -ffreestanding -fno-builtin -S test.c -o test.s
build/llvm-build/bin/clang --target=avm-unknown-arduboyfx \
  -ffreestanding -fno-builtin -c test.c -o test.o
build/llvm-build/bin/llvm-readobj -h -r test.o
build/llvm-build/bin/llvm-objdump -d test.o
```

The initial code generator accepts non-variadic leaf functions using up to four
16-bit scalar or data-pointer arguments in `r4` through `r7`, with a result in
`r4`. It uses GlobalISel for 16-bit constants, integer and pointer addition,
subtraction, logical operations, comparisons, conditional control flow,
8/16-bit loads and stores, fixed stack frames, and returns. Clang defines
`AVM`, `__AVM`, `__AVM__`, `__ARDUBOY__`, and `__ARDUBOY_FX__`; `int` and data
pointers are 16 bits, `long` is 32 bits, and `double` is the 32-bit IEEE format.

This is intentionally a leaf-function milestone. Calls, dynamic stack
allocation, 32/64-bit arithmetic, floating point code generation, variadic
lowering, global-address materialization, and code-pointer/address-space-one
operations are rejected during lowering. The source-level `__flash` spelling
and its mapping to address space 1 are also deferred; no provisional spelling
is accepted silently.
