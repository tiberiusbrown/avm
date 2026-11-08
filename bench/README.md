# AVM benchmarks

Workloads are grouped under `workloads/codegen`, `workloads/library`, and `workloads/math`, with C/C++ subdirectories. Names remain stable across directory moves. Each compiled workload places two debug breaks around the measured interval; the adjacent-break baseline removes measurement overhead. Runtime and library workloads retain volatile calls, inputs and sinks where required to avoid builtin replacement or dead-code elimination.

```sh
cmake --build build --config RelWithDebInfo --parallel --target avm_bench avm_bench_images
build/avm_bench --c-only --filter '^math_(sin|cos)' --c-output build/bench/selected-cycles.txt
cmake --build build --config RelWithDebInfo --parallel --target avm_bench_run
```

All measurements default to `build/bench/results/`, and listings to `build/bench/disassembly/`. `avm_bench_run` runs instruction timing, compiled workloads and representative instruction-mix measurement. It does not run the test suite or diagnostic compilations. `avm_bench_mir` generates diagnostic dumps separately.

The serial and parallel runners produce ordered results and reuse isolated emulator sessions. Use `--jobs N` to control concurrency and `--list` to inspect a filtered selection without building its images. The shared instruction-mix selection lives in `instruction_mix_benchmarks.txt`.

Committed reference measurements and listings live under `reference/`. Refresh them explicitly after validating a compiler or interpreter change:

```sh
cmake --build build --config RelWithDebInfo --target avm_bench_update
```

This retains per-workload disassemblies and updates the cycle and instruction-mix reports. Review these changes alongside the implementation; ordinary benchmark execution leaves references untouched. The ISA cycle baseline is [reference/cycles_instruction.txt](reference/cycles_instruction.txt).

Numerical semantics and precision policy are described in the [math runtime guide](../runtime/lib/math/README.md). Candidate-generation and research report scripts live under `tools/research/math/`; their working results belong under `build/research/`.
