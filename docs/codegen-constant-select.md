# Selecting constants with a shared word

AVM now selects only the differing 16-bit word when the two constant operands of a 32-bit select share their other word. The lowering applies to both `i32` and `f32`, to either shared half, and to both select lowering paths. It uses the exact floating representation, including signed zeros and NaN payloads. Other selects retain their existing lowering. There are no reducer constants, source-function names, ABI changes, or new instructions in the optimization.

Previously, selection materialized two complete register pairs and emitted two conditional moves. The new lowering shares the identical word and emits one conditional move. The simple integer regression cases also avoid the register saves required by the old sequence.

## Validation

The comparison starts from root revision `9f3cdb3167c1aade3576613e57001668ca50a9e3`. Both builds use the existing Ninja/MSVC configuration, RelWithDebInfo, benchmark callers at `-O2`, and the runtime's existing optimization flags. The complete benchmark images and runtime were rebuilt after changing the backend. All cycle comparisons are per workload, with zero tolerance for an increase; aggregate improvement cannot hide a regression.

| Suite | Measurements | Improved | Unchanged | Regressed |
|---|---:|---:|---:|---:|
| C benchmarks | 174 | 12 | 162 | 0 |
| C++ benchmarks | 8 | 0 | 8 | 0 |
| Instruction benchmarks | 857 | 0 | 857 | 0 |

The 12 improved C workloads save 29,986 cycles in total. Full before/after cycle files and the comparison are retained alongside this report. Updated benchmark disassemblies remain in `bench/c/asm`; updated runtime disassemblies remain in `runtime/asm/lib/math`.

All 129 AVM LLVM code-generation tests passed. The new `select-constant-words.ll` checks integer and float constants with either word shared, signed zeros, NaN payloads, and unchanged full-width selection when neither word matches. Its one-conditional-move checks fail with the original compiler and pass with the change; object emission also runs with machine-instruction verification.

All 862 guest correctness cases passed across O0/O1/O2/O3/Os/Oz. These include six builds of the new `select_constant_words.c` fixture, checking both choices, signed and unsigned comparisons, live input operands, exact signed-zero and NaN representations, and unordered floating comparisons.

## Reducer experiment

The production reducer is unchanged. Rebuilding the isolated integer-magnitude/sign experiment with the new backend reduces the added `sinf` spill slots from 14 to 12. The gameplay workloads contain 32 calls:

| Wrapper | Before fix | After fix |
|---|---:|---:|
| sine | 293,855 | 289,995 |
| cosine | 300,219 | 296,359 |
| tangent | 312,839 | 309,759 |
| sincos | 336,963 | 336,963 |

The float/integer bitcast remains free. Magnitude masking, correction control flow, and other live values still affect allocation; this optimization does not guarantee that replacing the production floating comparisons will improve every wrapper. In particular, the original sine/game workload remains faster at 283,919 cycles.

## Reproduction

Initialize the MSVC environment matching `build/CMakeCache.txt`, then build through CMake:

```text
cmake --build build --config RelWithDebInfo --target clang llc avm_bench avm_bench_images avm_bench_mir avm_test_images avm_tests avm_runtime_asm -j 8
python build/llvm-build/bin/llvm-lit.py -q deps/llvm-project/llvm/test/CodeGen/AVM
build/avm_tests.exe
build/avm_bench.exe --instruction-output after-instruction.txt --c-output after-c.txt --cpp-output after-cpp.txt
```

Run the benchmark command before rebuilding the compiler as well, with `before-*.txt` output paths, to establish a local baseline. The tracked cycle files in `docs/codegen-constant-select/` preserve the measurements for this change.
