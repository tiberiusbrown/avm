# AVM `-O2` stabilization report

Date: 2026-07-23

## Outcome

The selected production policy is:

- R0-R3 `CostPerUse = [1]`.
- TTI scalar-register count remains 12.
- Register-sensitive TTI costs use the original upper-register costs; averaged
  upper/full costs were removed.
- Memory intrinsic thresholds use the original policy: 8 stores for
  `memcpy`, `memmove`, and `memset`, and 4 stores for all three under
  `optsize`.
- The conservative late AVM tail-duplication pass is enabled by default.
- The pass still rejects candidates containing loads or stores.
- Normal loop rotation and header duplication remain enabled.

No new optimization feature was added during stabilization.

Against the reconstructed original LLVM `-O2` baseline, the final 43-benchmark
geometric-mean runtime is **0.95038959x** (4.96% faster). The required
17-benchmark subset is **0.90034121x** (9.97% faster). Aggregate `.text` over
the 43 benchmark ELFs changes from 9,291 to 9,274 bytes (-17); aggregate
`.data` remains 7,054 bytes.

Two benchmarks remain more than 2% slower than original `-O2`:

| Benchmark | Original | Final | Change |
|---|---:|---:|---:|
| `record_scan` | 1,564,880 | 1,793,903 | +14.635180% |
| `shifts` | 491,985 | 520,129 | +5.720500% |

These are explicit Pareto exceptions. Removing `CostPerUse=1` eliminates them,
but also gives up the larger suite-wide gains described below.

## Revisions and preservation

- Original AVM repository HEAD: `110dedbc0e7e49a261e9a0d7c4d9adffe675a9ec`
- Original LLVM HEAD used for the baseline:
  `86f91f0901f08bcad2f699f22bb3727a8375c80d`
- Initial LLVM checkpoint branch:
  `codex/avm-o2-experimental-checkpoint`
- Initial complete LLVM checkpoint:
  `bfb537da7b0898514c500f193b67bbeaec224903`
- Additional preservation commit on that branch:
  `310528a7e617`
- Parent AVM checkpoint branch:
  `codex/avm-o2-experiment-checkpoint`
- Parent AVM checkpoint:
  `c70587ecbe1f113825ed8fef629cfe06048825c2`
- Final LLVM branch: `codex/avm-o2-final`
- Final LLVM HEAD: `a4130983bb1bbeeb95e9ae0971284bd415dfa3a2`

The complete files that were untracked before the checkpoint were:

```text
deps/llvm-project/clang/test/CodeGen/avm-memory-intrinsic-thresholds.c
deps/llvm-project/llvm/lib/Target/AVM/AVMTailDuplication.cpp
deps/llvm-project/llvm/test/CodeGen/AVM/register-cost-per-use.mir
deps/llvm-project/llvm/test/CodeGen/AVM/tail-duplication-limits.mir
deps/llvm-project/llvm/test/CodeGen/AVM/tail-duplication-pipeline.ll
deps/llvm-project/llvm/test/CodeGen/AVM/tail-duplication-profitability.mir
deps/llvm-project/llvm/test/CodeGen/AVM/tail-duplication-reject.mir
deps/llvm-project/llvm/test/CodeGen/AVM/tail-duplication.mir
deps/llvm-project/llvm/test/CodeGen/AVM/tail-placement.mir
deps/llvm-project/llvm/test/MC/AVM/Inputs/f7-post-memory-invalid-alias.txt
deps/llvm-project/llvm/test/MC/AVM/f7-post-memory-invalid-alias.s
.clang-format-ignore
tests/c/asm/constant_arith_result.asm
tests/c/constant_arith_result.c
tests/c/constant_arith_result_output.txt
```

The memory-threshold test was preserved in the checkpoint but is not retained
in the final LLVM branch because measurement selected the original threshold
policy. The constant-arithmetic correctness test remains in the parent AVM
repository.

## Original `-O2` baseline

The baseline was built from the original LLVM HEAD in a separate worktree at
`C:\tmp\avm-original-o2-root`, using the same AVM sources, interpreter,
benchmark inputs, Ninja generator, RelWithDebInfo host build, and MSVC
environment.

All supplied check values matched exactly:

| Benchmark | Reconstructed cycles |
|---|---:|
| `bubble1` | 1,408,254 |
| `bubble2` | 1,257,054 |
| `bubble4` | 1,836,730 |
| `constant_arith` | 7,849,378 |
| `crc16` | 762,440 |
| `float` | 881,658 |
| `multiply` | 911,005 |
| `progmem_widen_ldp32_bytes` | 737,024 |
| `record_scan` | 1,564,880 |
| `shifts` | 491,985 |
| `small_memops` | 835,079 |
| `struct_copy` | 606,888 |

Permanent baseline artifacts:

- `cycles_c_original_o2.txt`
- `assembly_original_o2/`
- `text_sizes_original_o2.csv`
- `original_o2_mir/`

## 2x2x2 register/TTI ablation

Tail duplication was disabled and the then-current reduced memory thresholds
were held constant for all eight configurations. Every configuration ran all
43 C benchmarks, not only the required 17.

| Cost/use | Scalar regs | Averaged costs | All-43 geomean | Required-17 geomean | >2% regressions | Worst regression | CRC table | CRC cycles | Float | Struct copy |
|---:|---:|:---:|---:|---:|---:|---:|:---:|---:|---:|---:|
| 0 | 8 | false | 0.99949690 | 0.99872794 | 0 | 0% | yes | 762,440 | 881,658 | 606,888 |
| 0 | 12 | false | 0.99949690 | 0.99872794 | 0 | 0% | yes | 762,440 | 881,658 | 606,888 |
| 0 | 8 | true | 1.05031911 | 1.14400708 | 9 | +147.703688% | no | 1,888,592 | 1,202,241 | 812,792 |
| 0 | 12 | true | 1.05031911 | 1.14400708 | 9 | +147.703688% | no | 1,888,592 | 1,202,241 | 812,792 |
| 1 | 8 | false | 0.95396572 | 0.90893505 | 2 | +14.635180% | yes | 568,040 | 878,698 | 593,528 |
| 1 | 12 | false | 0.95396572 | 0.90893505 | 2 | +14.635180% | yes | 568,040 | 878,698 | 593,528 |
| 1 | 8 | true | 1.00194255 | 1.03157203 | 7 | +105.397408% | no | 1,566,032 | 1,308,865 | 819,224 |
| 1 | 12 | true | 1.00194255 | 1.03157203 | 7 | +105.397408% | no | 1,566,032 | 1,308,865 | 819,224 |

The full 344-row result, including cycles, ELF sizes, function size, stack
frame, static stack accesses, compact/full instruction counts, branches, and
CRC table state, is in `ablation_table.csv`. The exact per-variable,
per-benchmark paired effects are in `ablation_variable_effects.csv`.

### Variable conclusions

- Scalar register count 8 versus 12 had exactly zero effect on every benchmark
  in every paired comparison. The final value is 12 because it is the original
  policy and therefore the smaller retained source diff.
- Averaged register-sensitive costs were consistently harmful. They removed
  the CRC table and created the large pre-RA and RA regressions. The original
  upper-register cost model was restored.
- `CostPerUse=1` had a measurable benefit. With upper costs it improved the
  all-43 geomean by about 4.55 percentage points versus `CostPerUse=0`, and the
  required-17 geomean by about 8.98 points. It reduced `crc16` from 762,440 to
  568,040, `multiply` from 911,005 to 764,053, and `struct_copy` from 606,888
  to 593,528. It also changed `constant_arith`: 7,849,378 to 7,755,150
  (-1.20%), so `CostPerUse=0` is not identical.
- For `constant_arith`, cost 0 used compact/full ADD-SUB 1/14, XOR 3/5,
  MOV 10/8. Cost 1 used ADD-SUB 7/7, XOR 6/3, MOV 6/12.

## CRC forensic result

The averaged register-sensitive TTI cost variable suppresses the table.
The scalar-register count and `CostPerUse` do not.

The upper-cost configurations contain a 512-byte `@.crctable` and a lookup
loop. The averaged-cost configurations retain eight branchy bit-update steps.
The input IR immediately before the second relevant `SimplifyCFGPass` is byte
identical between the configurations (SHA-256
`550128...`). That `SimplifyCFGPass` is the first divergence: upper costs
permit branch-to-select conversion, while averaged target costs reject it.
`LoopIdiomRecognizePass` subsequently recognizes the upper-cost select form
and creates the CRC table. The averaged form is later fully unrolled by
`LoopUnrollPass`.

The restricted `avm_test_main` diagnostics, targeted pass prints, before/after
IR, hashes, and assembly are in `crc_diagnostics/`.

Selected no-tail CRC result: 98 bytes `.text`, 656 bytes `.data`, 75-byte
function, 512-byte table, 568,040 cycles. The averaged counterpart is 161
bytes `.text`, 130 bytes `.data`, 137-byte function, no table, and 1,566,032
cycles.

## Register-allocation analysis

The pre-greedy, post-greedy, and post-virtregrewriter MIR is retained for the
original baseline and each configuration. `ra_comparison.csv` contains
physical-register assignment counts and spill data.

| Benchmark/configuration | Pre-greedy vs original | Loads/stores/slots | Frame | Static LDSP/STSP | Function bytes | Cycles |
|---|:---:|---:|---:|---:|---:|---:|
| `bubble4`, original | baseline | 2/2/2 | 4 | 4 | 107 | 1,836,730 |
| `bubble4`, selected | identical | 3/4/3 | 6 | 7 | 108 | 1,839,565 |
| `bubble4`, averaged | diverged | 4/5/4 | 8 | 9 | 110 | 1,978,354 |
| `float`, original | baseline | 5/4/4 | 8 | 16 | 226 | 881,658 |
| `float`, selected | identical | 5/4/4 | 8 | 16 | 218 | 878,698 |
| `float`, averaged | diverged | 17/16/11 | 24 | 47 | 329 | 1,308,865 |
| `struct_copy`, original | baseline | 5/5/5 | 8 | 14 | 198 | 606,888 |
| `struct_copy`, selected | identical | 8/6/6 | 12 | 18 | 195 | 593,528 |
| `struct_copy`, averaged | diverged | 10/8/7 | 14 | 28 | 225 | 819,224 |

`float`'s averaged-cost regression already exists before greedy allocation and
is amplified into 33 stack operations. Upper costs restore the original
pre-RA shape and spill behavior. `struct_copy` also first diverges pre-RA under
averaging; selected cost 1 creates some additional spills but compact-register
allocation and smaller code make it faster overall. `bubble4`'s selected
pre-greedy MIR and loop CFG match original; its small no-tail regression is
introduced by the greedy allocation response to `CostPerUse=1`.

The tail pass was not broadened to memory operations. Its memory-bearing
`bubble4` candidate remains illegal; the enabled pass can still profit from a
separate legal tail in the function.

## Memory-threshold A/B

Under the selected register/TTI policy with tail duplication disabled, all 42
benchmarks other than `small_memops` were bit-for-bit identical in measured
cycles between the two policies.

| Policy | `small_memops` cycles | `.text` |
|---|---:|---:|
| Reduced 4/4/8 thresholds | 785,139 | 220 |
| Original 8/8/8 thresholds | 779,527 | 244 |

The original policy is 5,612 cycles (0.72%) faster over 64 repetitions because
the constant 5-byte `memcpy` and 7-byte `memmove` remain inline instead of
using the system service. This is approximately 87.7 cycles per benchmark
iteration. No string, program-memory, `memory_services`, or `struct_copy`
workload lost. The original threshold policy was therefore retained, and the
temporary threshold test was removed from the final branch.

Exact results are in `memory_threshold_comparison.csv` and both
`memory-*-thresholds-cost1-regs12-avgfalse/` directories.

## Tail-duplication A/B

This A/B used the selected register/TTI policy and original memory thresholds.
No benchmark regressed; 36 of 43 were cycle-identical. Changed benchmarks:

| Benchmark | Disabled | Enabled | Change | `.text` off/on |
|---|---:|---:|---:|---:|
| `bubble1` | 1,287,837 | 1,225,341 | -4.852788% | 115/125 |
| `bubble2` | 1,217,277 | 1,154,781 | -5.134087% | 110/120 |
| `bubble4` | 1,839,565 | 1,777,069 | -3.397325% | 131/141 |
| `progmem_widen_ldp32_bytes` | 737,024 | 735,306 | -0.233099% | 232/230 |
| `sieve` | 372,894 | 372,418 | -0.127650% | 88/97 |
| `state_machine` | 7,292,256 | 7,193,047 | -1.360470% | 210/223 |
| `sys_strcmp` | 2,715 | 2,715 | 0% | 212/220 |

The full 43-row A/B is `taildup_comparison.csv`.

## Final benchmark and size artifacts

- Final `-O2`: `cycles_c_final_o2.txt`
- Final `-Os`: `cycles_c_final_os.txt`
- Final instruction suite at `-O2`: `cycles_instruction_final_o2.txt`
- Final instruction suite at `-Os`: `cycles_instruction_final_os.txt`
- Original/final/`-Os` per-benchmark comparison:
  `final_comparison.csv`
- Original/final ELF section comparison: `final_size_comparison.csv`
- Final benchmark assembly: the regenerated `bench/c/asm/` files
- Exhaustive parent, LLVM, and artifact file list:
  `changed_files_manifest.txt`

The final `-O2` run is exactly equal to the tail-enabled A/B result for all 43
benchmarks. The final `-Os` run also completed all 43 benchmarks; its exact
values are recorded in the files above.

## Disassembler and independently justified diagnostic change

The formatting-only disassembler churn was removed. Relative to original
LLVM, `AVMDisassembler.cpp` has a one-line semantic change that computes the
F7 pointer index within the load/store subspace. The expanded valid and
invalid alias MC coverage remains and passes.

`frame-invalid.ll` is retained independently. The backend source reports an
ordinary `DiagnosticInfoResourceLimit`, not a fatal `LLVM ERROR`, so the test
now expects the actual `error: ... stack frame size (259) exceeds limit (256)`
diagnostic without `--crash`.

`clang/test/CodeGen/avm-pgmspace-header.c` is unchanged in the final LLVM
branch because the selected memory policy is the original one.

## Final LLVM commits

1. `1f8c0b8ccabd` — F7 post-increment disassembler correction and MC tests
2. `3e2ee2c23c36` — conservative tail duplication and tests
3. `903c0f9c25d9` — selected compact-register `CostPerUse` policy and test
4. `a4130983bb1b` — independently justified oversized-frame diagnostic test

There is no memory-threshold commit because that experiment selected the
original source policy. The final branch tree is byte-identical to the fully
tested `codex/avm-o2-stable` tree.

## Validation

Host configuration was verified as Ninja, MSVC, and
`CMAKE_BUILD_TYPE=RelWithDebInfo`. All CMake builds were run after initializing
the matching VS 18 Community `vcvars64.bat` environment recorded by the
configured compiler.

- Clean build: all 6,684 prior outputs removed, then the complete default
  LLVM/Clang/LLD/AVM/Ardens build completed. Two transient Windows host
  process-launch exits at high concurrency were resumed at lower concurrency;
  neither reproduced as a source or test failure.
- LLVM AVM suites: 263/263 passed.
- Clang AVM tests: 35/35 passed.
- LLD AVM tests: 17/17 passed.
- Targeted F7, frame, register-cost, and tail tests: 6/6 passed.
- AVM ASM/C/C++ runtime suite at `-O2`: 171/171 passed.
- AVM ASM/C/C++ runtime suite at `-Os`: 171/171 passed.
- Instruction benchmark suite at both levels: 795/795 measurements completed.
- C benchmark suite at both levels: 43/43 completed.
- Tail enabled and disabled full C suites: 43/43 completed.
- `constant_arith` produced `CA=3DA0` and the correctness test passed.
- F7 valid disassembly and invalid-alias rejection tests passed.
- Final cache is restored to `AVM_OPT_LEVEL=-O2`.
- Final `cmake --build build --parallel` reports `ninja: no work to do.`

## Commands

The experiment driver containing the exact configuration, compile,
disassembly, ELF inspection, and MIR commands is
`run_ablation_config.ps1`. The principal command transcript was:

```powershell
git status --short
git diff --binary
git ls-files --others --exclude-standard
git rev-parse HEAD
git switch -c codex/avm-o2-experimental-checkpoint
git add -A
git commit -m "AVM experimental O2 optimization checkpoint"

git worktree add C:\tmp\avm-original-o2-root 86f91f0901f08bcad2f699f22bb3727a8375c80d

cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo
cmake --build build --parallel

.\bench\results\o2-stabilization\run_ablation_config.ps1 `
  -CostPerUse <0|1> -ScalarRegisters <8|12> `
  -AverageRegisterCosts <false|true> -TailDuplication false

.\bench\results\o2-stabilization\run_ablation_config.ps1 `
  -CostPerUse 1 -ScalarRegisters 12 -AverageRegisterCosts false `
  -TailDuplication false -OutputName <memory-policy-name>

.\bench\results\o2-stabilization\run_ablation_config.ps1 `
  -CostPerUse 1 -ScalarRegisters 12 -AverageRegisterCosts false `
  -TailDuplication true `
  -OutputName taildup-enabled-original-memory-cost1-regs12-avgfalse

cmake --build build --target clean --parallel 1 --verbose
cmake --build build --parallel
cmake --build build --parallel 8
cmake --build build --parallel 4
cmake --build build --target `
  clang llc opt llvm-mc llvm-objdump llvm-readobj lld FileCheck not `
  count split-file llvm-as llvm-dis llvm-config llvm-mca --parallel 4

build\llvm-build\bin\llvm-lit.cmd -sv `
  deps\llvm-project\llvm\test\CodeGen\AVM `
  deps\llvm-project\llvm\test\MC\AVM `
  deps\llvm-project\llvm\test\Transforms\GlobalOpt\AVM `
  deps\llvm-project\llvm\test\Transforms\LoopStrengthReduce\AVM

build\llvm-build\bin\llvm-lit.cmd -sv <35 clang avm*.c/avm*.cpp files>
build\llvm-build\bin\llvm-lit.cmd -sv <17 lld AVM files>

cmake --build build --target avm_tests_run avm_bench_run --parallel 1
cmake -S . -B build -DAVM_OPT_LEVEL=-Os `
  -DCMAKE_BUILD_TYPE=RelWithDebInfo -G Ninja
cmake --build build --target avm_tests_run avm_bench_run --parallel 1
cmake -S . -B build -DAVM_OPT_LEVEL=-O2 `
  -DCMAKE_BUILD_TYPE=RelWithDebInfo -G Ninja
cmake --build build --target avm_tests_run avm_bench_run --parallel 1
cmake --build build --parallel

git switch -c codex/avm-o2-final 86f91f0901f08bcad2f699f22bb3727a8375c80d
git cherry-pick 48f25b982db7 73ff0f2f9b1b 4e7058466af5 3e5cb7721be6
```

Additional read-only `git diff/show/status`, `llvm-objdump`,
`llvm-readobj`, `FileCheck`, targeted `clang -mllvm -stop-*`, and
`opt -print-before/-print-after` invocations were used to produce the saved
CSV, MIR, assembly, and CRC diagnostic artifacts.
