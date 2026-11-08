# AVM

AVM is an Arduboy virtual machine, LLVM/Clang toolchain, target runtime, emulator integration, and relocatable SDK.

## Build and validate

Initialize `deps/llvm-project` and, for emulator validation or debugging, `deps/Ardens`. The game submodules under `projects/` are independent SDK consumers.

```sh
cmake --preset dev
cmake --build build --config RelWithDebInfo --parallel --target avm_sdk
cmake --build build --config RelWithDebInfo --parallel --target avm_validation_full
```

The default build produces the SDK. Validation, benchmarks, diagnostic dumps
and reference updates are explicit targets. The presets retain an existing build directory's generator and compiler. All configurations use RelWithDebInfo. `core` configures the SDK without Ardens under `build/core`; `headless` enables emulator validation and benchmarks without LLDB or the GUI under `build/headless`.

`avm_validation_fast` selects focused hardware and runner checks. `avm_validation_full` covers the ordinary six-optimization matrix, EH/RTTI verifiers, debugger/profiler integration when enabled, host reference tests, Python tools, and AVM LLVM/Clang/LLD lit suites. `extended` CTest checks include lengthy high-precision studies, replay and throughput measurements. `avm_validation_all` builds and runs every registered check, `fast`, `full` and `extended` together, and takes the longest. Test prerequisites are available separately:

```sh
cmake --build build --config RelWithDebInfo --parallel --target avm_validation_build
ctest --test-dir build -C RelWithDebInfo -L '^full$' --output-on-failure
ctest --test-dir build -C RelWithDebInfo --rerun-failed --output-on-failure
```

The host music compiler needs only Python's standard library. MIDI import, DSP tooling and validation have explicit extras in [pyproject.toml](pyproject.toml). For complete Python validation, install `.[test]` into an environment under `build/`, then set `Python3_EXECUTABLE` and `AVM_MATH_PYTHON_EXECUTABLE` when configuring CMake. `.[research]` adds the optional analysis dependencies.

## Repository ownership

| Directory | Contents |
| --- | --- |
| `cmake/` | Bootstrap primitives, SDK integration, fixture and validation registration |
| `interp/` | AVR interpreter and native arithmetic |
| `runtime/` | Public headers, CRT, C/C++ libraries, compiler helpers and runtime references |
| `debug/` | Emulator adapter, debugger integration and profiler |
| `tests/fixtures/` | Authoritative fixture declarations and optimization/linkage variants |
| `tests/codegen/` | Executed compiler and ABI regressions |
| `tests/runtime/` | Library, math, termination, EH/RTTI and libc++ fixtures |
| `tests/interp/` | ISA, hardware and guest API validation |
| `tests/debug/`, `tests/tools/`, `tests/support/` | Integration checks, host tool tests and shared fixture support |
| `bench/workloads/` | Code generation, library and math workloads |
| `bench/reference/` | Committed cycle measurements and disassemblies |
| `tools/` | Maintained music and development tools; optional audio analysis library |
| `tools/research/` | Candidate searches and report-generation experiments |
| `projects/`, `examples/` | Optional SDK applications and music examples |
| `archive/` | Historical implementations and exact recovery evidence |
| `deps/` | Pinned LLVM and Ardens forks; backend lit tests stay with the backend |

## Artifacts and SDK consumers

Build products, generated wrappers, firmware variants, test failures, MIR dumps and benchmark measurements stay under the selected `build/` directory. Normal SDK builds and validation do not update source snapshots.

```sh
cmake --build build --config RelWithDebInfo --parallel --target avm_bench_run
cmake --build build --config RelWithDebInfo --target avm_bench_update
cmake --build build --config RelWithDebInfo --target avm_runtime_asm_update
cmake --install build --config RelWithDebInfo --component avm-sdk --prefix build/sdk
```

`avm_bench_run` measures workloads without running validation or generating MIR. Reference updates are explicit; benchmark disassemblies remain versioned. `avm_runtime_mir` and `avm_bench_mir` are optional diagnostic targets.
`avm_interpreter_update` refreshes the firmware snapshots in `interp/reference/`;
`avm_audio_demo_update` refreshes the demo package explicitly.

Installed SDK consumers can use `find_package(AVM CONFIG REQUIRED)` and `avm_add_program(...)`. Set `AVM_DIR` to `<sdk>/share/avm/cmake`, or add the SDK prefix to `CMAKE_PREFIX_PATH`. The audio demo uses this same interface; enable `AVM_BUILD_EXAMPLES` to build it in-tree. Its tracked music headers are regenerated only by the explicit `audio_demo_assets` target.
The runtime header integration checks live beside the runtime fixtures; the LLVM
fork keeps compiler-only lit tests.

The architecture and ABI are specified in [docs/arch.md](docs/arch.md). See the [runtime guide](runtime/README.md), [test guide](tests/README.md), [benchmark guide](bench/README.md), [debugger guide](docs/lldb.md), [audio guide](docs/audio.md), and [archived audio recovery material](archive/mixed-codex-audio/README.md).
