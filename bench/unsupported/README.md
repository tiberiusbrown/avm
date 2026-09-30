# Benchmarks awaiting backend support

There are currently no unsupported benchmark sources. Sources placed here are
excluded from the CMake benchmark build and timing runner. Once a backend path
is implemented and tested, move the source into `bench/c`, build `avm_bench`,
and run it with `--c-only` to capture a cycle count and disassembly.

The former `dynamic_stack`, `popcount`, `count_leading_zeros`, and
`count_trailing_zeros` benchmarks now live in `bench/c`.
