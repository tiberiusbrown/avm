# Integer floating-point classification validation

Changes are uncommitted. Baseline and replacement use the existing Ninja/MSVC 14.51.36231 RelWithDebInfo configuration, O2 benchmark callers, O3 math kernels, and identical inputs.

Baseline repository: `442a66cac851b40ea4f7517c39ae59e7e2326ea0`; LLVM: `569ddd9edd7632cce317b9d6fa836883f10a5d74`.

The baseline was built and measured before compiler/interpreter changes. The twelve new focused cases were replayed with the saved original compiler and interpreter after adding an opaque noinline predicate function to prevent constant folding. Only the ten deleted instruction benchmarks are excluded.

C/C++ code bytes are complete linked `.text` sizes, including startup and reachable library code, rather than page-padded image sizes. Original existing sizes come from the original revision’s checked-in disassemblies; new focused baseline sizes come from their original-compiler ELF files. Instruction sizes are assembled benchmark blocks including setup/cleanup; both versions were assembled with zero-byte boundary labels. The final block also includes unchanged shared fixtures.

[Every individual benchmark, including unchanged results](integer-classification.csv).

| Suite | Cases | Baseline cycles | New cycles | Cycle delta | Code-byte delta | Cycle regressions | Size regressions |
|---|---:|---:|---:|---:|---:|---:|---:|
| instruction | 866 | 786541 | 786541 | +0 | +0 | 0 | 0 |
| C | 376 | 540618264 | 540426124 | -192140 | -661 | 3 | 15 |
| C++ | 8 | 9798534 | 9798534 | +0 | +0 | 0 | 0 |

## Remaining regressions

The strict zero-regression requirement is **not met**. All remaining individual regressions are listed below; aggregate improvements do not waive them.

| Benchmark | Baseline cycles | New cycles | Cycle delta | Baseline code bytes | New code bytes | Byte delta |
|---|---:|---:|---:|---:|---:|---:|
| math_classify_isnan_exceptional.c | 39996 | 39664 | -332 | 266 | 268 | +2 |
| math_classify_isnan_normal.c | 40156 | 39664 | -492 | 266 | 268 | +2 |
| math_classify_isnormal_exceptional.c | 43140 | 42352 | -788 | 271 | 273 | +2 |
| math_classify_isnormal_normal.c | 43412 | 42352 | -1060 | 271 | 273 | +2 |
| math_cosh.c | 180812 | 181068 | +256 | 675 | 683 | +8 |
| math_exp.c | 211808 | 209856 | -1952 | 578 | 582 | +4 |
| math_exp2.c | 164404 | 153540 | -10864 | 464 | 469 | +5 |
| math_exp_primary.c | 179718 | 177766 | -1952 | 578 | 582 | +4 |
| math_exp_scaled.c | 184450 | 182498 | -1952 | 538 | 542 | +4 |
| math_expm1.c | 153102 | 150910 | -2192 | 900 | 909 | +9 |
| math_expm1_general.c | 150148 | 147956 | -2192 | 900 | 909 | +9 |
| math_fdim.c | 68531 | 72587 | +4056 | 428 | 434 | +6 |
| math_lrint.c | 96172 | 90060 | -6112 | 371 | 372 | +1 |
| math_sinh.c | 192800 | 192720 | -80 | 712 | 713 | +1 |
| math_sqrt_special.c | 48789 | 48973 | +184 | 359 | 358 | -1 |
| math_tanh.c | 207504 | 206528 | -976 | 652 | 660 | +8 |

## Focused classification

Each workload performs 32 predicate calls. Timings include identical input-loop/call overhead.

| Predicate/input | Baseline cycles | New cycles | Delta | Delta per call | Code-byte delta |
|---|---:|---:|---:|---:|---:|
| math_classify_fpclassify_exceptional.c | 57444 | 52432 | -5012 | -156.625 | -7 |
| math_classify_fpclassify_normal.c | 74526 | 65756 | -8770 | -274.062 | -7 |
| math_classify_isfinite_exceptional.c | 43140 | 39568 | -3572 | -111.625 | -3 |
| math_classify_isfinite_normal.c | 43412 | 39568 | -3844 | -120.125 | -3 |
| math_classify_isinf_exceptional.c | 43140 | 41328 | -1812 | -56.625 | +0 |
| math_classify_isinf_normal.c | 43412 | 41328 | -2084 | -65.125 | +0 |
| math_classify_isnan_exceptional.c | 39996 | 39664 | -332 | -10.375 | +2 |
| math_classify_isnan_normal.c | 40156 | 39664 | -492 | -15.375 | +2 |
| math_classify_isnormal_exceptional.c | 43140 | 42352 | -788 | -24.625 | +2 |
| math_classify_isnormal_normal.c | 43412 | 42352 | -1060 | -33.125 | +2 |
| math_classify_signbit_exceptional.c | 36880 | 36880 | +0 | +0.000 | +0 |
| math_classify_signbit_normal.c | 36880 | 36880 | +0 | +0.000 | +0 |

## Implementation and verification

- Removed the instruction, interpreter handler, assembler/MC/backend paths, scheduling/cost entry, ten instruction cases, and dedicated assembly tests.
- Renumbered FPOLY through FMA to FF 15–1D. FF 1E–FF are invalid. The table has 30 contiguous entries: 22 direct jumps and eight nearby entries, totaling 120 bytes.
- Interpreter flash: 27,400 → 27,312 bytes (88 bytes saved). Assembly size assertions pass; SPI transfer cadence and remaining instruction timings are preserved.
- Classification uses native 16-bit integer operations, including high-word-only finite/normal/quiet-NaN tests, sign-specific ranges, shared magnitude reductions, inverted masks, and the existing native integer BOOL instruction. Optimizer-generated zero/infinity/NaN comparisons use integer classification too.
- Removed the inline-assembly barrier in avm_math_high_word. sinf uses a word compare; its redundant copy and wide comparison are absent.
- Added runtime coverage of all 1,024 masks, all ten classes, both signs, boundary values, and low-word-only signaling-NaN payloads across all six optimization levels. Extended C/C++ macro single-evaluation and host wider-type coverage.
- No public classification macro was replaced and no C99 support gap was introduced. The existing compliance tracker remains unchanged.

## Test results

- Complete toolchain, interpreter, runtime, validation, and benchmark CMake targets passed in RelWithDebInfo. LLVM AVM MC/CodeGen/scheduling/cost-model tests: **355/355 passed**.
- Full AVM validation: **1,443/1,443 passed**, including C/C++ at O0, O1, O2, O3, Os, and Oz, host wider-type checks, instruction-mix tests, and runner regressions.
- Exhaustive class-mask test: all 1,024 masks against 34 signed binary32 patterns at each of the six optimization levels (208,896 mask/value checks). Includes both NaN kinds with low-word-only payloads.
- FF/FPOLY interpreter harness: **12,980 cases per FX/FX-C preset passed**, including raw FF 15 polynomial execution, FF 1E invalid-instruction trapping, all remaining accelerators, register/CC/stack/PC preservation, SPI cadence, and the deliberately early SPI-read negative control.
- Full 100-digit mpmath accuracy suite: **27 functions, 1,269,131 cases, zero failures and zero exceptional-value changes**. Existing accuracy policies were retained.
- Complete benchmark workflow ran: **866 instruction + 376 C + 8 C++ cases**. Only the ten deleted instruction cases were excluded from before/after comparisons.
- Audited 69 backend source files and 484 regenerated benchmark/runtime disassemblies; all 4,470 named FF instructions use the new encodings. The removed assembler mnemonic is rejected. Deliberately invalid test encodings and archived baseline artifacts are retained for validation.
- All generated benchmark disassemblies are retained. Public math classification/comparison definitions and the C99 compliance tracker are unchanged.

## Remaining performance work

The three cycle regressions are `math_cosh.c` (+256), `math_fdim.c` (+4,056), and `math_sqrt_special.c` (+184). Fifteen workloads grow by 1–9 linked code bytes; every one is listed above. These remain unresolved. The aggregate reduction of 192,140 cycles and 661 code bytes does not satisfy the required zero-regression result.

All six focused predicate families are faster or unchanged on both input populations. Standalone `isnan` and `isnormal` each add two code bytes while reducing cycles. `signbit` is unchanged. The focused table gives the full before/after figures.

Word-comparison narrowing applies to binary32 representations. Finite/normal predicates and masked, aligned-boundary, and sign guards use native high-word operations. `sinf`'s former barrier, redundant high-word copy, and unnecessary `cmp32` are gone; its benchmark improves by 544 cycles and one linked code byte.

