# Benchmarks awaiting backend support

These are complete, two-break benchmark sources, but `bench/unsupported` is
excluded from CMake's benchmark source globs and from the timing runner. They
currently fail during AVM code generation at `-O2`. Keep them here as
reproducers and move each source into `bench/c` once its backend path is
implemented. Then build `avm_bench` and run it with `--c-only` to capture a
cycle count and generated disassembly.

To reproduce a failure with an in-tree toolchain, compile a source directly:

```text
build/llvm-build/bin/clang --target=avm-unknown-arduboyfx -ffreestanding -O2 -std=c11 -I build/avm-sysroot/include -c bench/unsupported/dynamic_stack.c -o build/dynamic_stack.o
```

Replace `dynamic_stack.c` with one of the other source names to reproduce its
failure.

| Source | Code generation path | Current diagnostic |
| --- | --- | --- |
| `dynamic_stack.c` | Variable length local array, requiring dynamic stack allocation and restoration across a call | `dynamic AVM stack allocation is unsupported` |
| `popcount.c` | `__builtin_popcount` on a runtime 16-bit value, lowered to LLVM `ctpop i16` | `Cannot select: ... i16 = ctpop` |
| `count_leading_zeros.c` | `__builtin_clz` on a nonzero runtime 16-bit value, lowered to LLVM `ctlz i16` | `Cannot select: ... i16 = ctlz` |
| `count_trailing_zeros.c` | `__builtin_ctz` on a nonzero runtime 16-bit value, lowered to LLVM `cttz i16` | `Cannot select: ... i16 = cttz` |

The supported `bench/c/stack_frames.c` and `bench/c/bit_count.c` cover fixed
stack frames and loop based bit counting in the meantime.

For dynamic allocation, `AVMISelLowering.cpp` currently reports the diagnostic
when lowering `DYNAMIC_STACKALLOC`, and `AVMFrameLowering.cpp` also rejects
variable sized frames. Both paths need to be revisited before promoting the
VLA benchmark. For the three bit intrinsics, add lowering for nonconstant
`ctpop`, `ctlz`, and `cttz` inputs and verify the generated code with target
codegen tests before moving these benchmarks into `bench/c`.
