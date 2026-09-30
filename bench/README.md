# AVM benchmarks

`avm_bench_run` builds and runs the test suite, the instruction-cycle image,
and every source in `bench/c` and `bench/cpp`. Each compiled source is a
freestanding program. It does any input setup before the first
`__avm_debug_break()`, measures the work between that break and the second one,
and stores a result in a volatile sink so the optimizer retains the work. The
runner subtracts the adjacent-break baseline and writes cycle counts to
`cycles_c.txt` and `cycles_cpp.txt`. Generated disassembly lives beside each
source in its `asm` directory.

Build with `cmake --build build --target avm_bench_run`. To time one language
without rerunning the tests or instruction image, build `avm_bench` and run
`build/avm_bench --c-only` or `build/avm_bench --cpp-only`. The `--instruction-only`
mode is available for the assembly image.

The newer compiled benchmarks fill these code generation gaps:

| Area | Benchmarks |
| --- | --- |
| Aggregate layout and ABI | `aggregate_args`, `aggregate_return`, `bitfields`, `packed_fields` |
| Memory and stack | `aliasing`, `dynamic_stack`, `pointer_table`, `stack_frames`, `volatile_rmw` |
| Branches and loop shapes | `byte_comparisons`, `loop_shapes`, `short_circuit`, `saturating_math` |
| Integer lowering | `bit_count`, `count_leading_zeros`, `count_trailing_zeros`, `div_pow2`, `narrow_arithmetic`, `popcount`, `rotate32`, `wide_add_sub`, `wide_compare` |
| Floating point lowering | `float_comparisons`, `float_conversions` |
| C++ lowering | `lambda_capture`, `member_pointers`, `scoped_lifetime`, `template_specialization`, `virtual_dispatch` |

Keep setup outside the measured interval and make the result depend on
runtime data. New sources are discovered by CMake and the runner automatically;
each source should contain exactly one pair of debug breaks.

Sources in [`unsupported`](unsupported/README.md), if any, record benchmark
cases that fail in AVM code generation and are excluded from normal builds.
