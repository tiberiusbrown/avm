# AVM validation

The authoritative fixture declarations live under `fixtures/`, grouped by subsystem. Each declaration specifies its source, language, optimization variants, additional translation units, options, linker layout and expected result. CMake uses the same declarations to build images and generate `build/tests/fixtures.tsv`; the emulator runner reads that manifest instead of independently classifying source filenames.

Ordinary C and C++ fixtures retain O0/O1/O2/O3/Os/Oz coverage. EH and RTTI fixtures retain their declared O0/O2, full-matrix and LTO cases. High-address cases preserve their original explicit placement and AVM's three-byte program pointers. `EXPECT_PASS` means exactly `P\n`; other serial output has an explicit reference file, and `VERIFY_ONLY` identifies images consumed by independent verifiers. C++ wrappers around shared C fixtures are generated where the declaration specifies `CXX_INCLUDE`, preserving the declared C linkage.

```sh
cmake --build build --config RelWithDebInfo --parallel --target avm_validation_full
cmake --build build --config RelWithDebInfo --parallel --target avm_validation_fast
```

`avm_validation_build` builds prerequisites without executing checks. CTest then selects `fast`, `full`, or `extended` checks; `avm_validation_all` builds and runs every registered check. Explicit membership
is listed in `cmake/Profiles.cmake`, and newly registered executable checks
default to full validation. Full validation includes compiler lit suites, serial fixtures, EH/RTTI and corruption checks, interpreter hardware, header diagnostics, final-link inspections, Python tools and debugger/profiler integration when configured. Long replay, throughput measurements, exhaustive high-precision studies and optional complex host comparisons have the `extended` label.

```sh
cmake --build build --config RelWithDebInfo --parallel --target avm_validation_build
ctest --test-dir build -C RelWithDebInfo -L '^full$' --output-on-failure
ctest --test-dir build -C RelWithDebInfo --rerun-failed --output-on-failure
build/avm_tests --filter '^math_' --opt O0,O2 --list
```

Direct `avm_*_run` build-and-run targets remain available for focused work. `avm_tests_run` covers the core matrix and its established dependencies; use `avm_validation_full` for the complete supported inventory. The manifest restricts selected optimization levels to variants actually built for each fixture. `--jobs N` controls emulator concurrency; results remain deterministically ordered. Source-directory overrides remain available for isolated runner tests. Failures write their actual output beside the built image under `build/tests/`.

Sources are grouped in `codegen/`, `runtime/`, `interp/`, `debug/`, `audio/`, and `tools/`. Shared translation units and headers are in `support/`. Backend code-generation/assembler/linker tests stay in the LLVM fork and run through lit. Interpreter preset builds share `AvmFirmware.cmake`; audio integration compiles its fixture directly through the public driver without installing the SDK or rewriting the demo's package or assets.

All configurations use RelWithDebInfo. C and C++ test disassemblies are neither generated nor versioned. Numerical regression vectors and independent host references remain in the suite; the precision baseline remains avr-libc. See the [math runtime guide](../runtime/lib/math/README.md), [stack analysis](../docs/stack-analysis.md), [C23 gaps](../docs/c23-compliance-gaps.md), and [C++23 gaps](../docs/cpp23-compliance-gaps.md).

Install `.[test]` from the root project into a Python environment under `build/` for complete host validation. Configure `Python3_EXECUTABLE` and `AVM_MATH_PYTHON_EXECUTABLE` to that environment. The music compiler itself remains standard-library-only. Candidate exploration and report-generation programs are separated under `tools/research/math/`.
