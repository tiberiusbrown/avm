# AVM Boolean-to-condition-code reuse

The late peephole pass now folds `CSET -> TST8/TST16 -> CMOV/branch` into a
consumer of the original comparison flags. It handles all six AVM conditions,
including inversion for Boolean-equals-zero consumers, multiple flag readers,
and another `CSET` consuming the tested flags. Ordinary arithmetic, including
zeroing with `XOR`, can remain between the comparison and its consumer.

The combine verifies that neither the Boolean nor the flags changed between
`CSET` and the test, translates every flags reader up to the next flags
definition, and rejects unsupported readers or flags escaping into successor
blocks. Calls and inline assembly are treated conservatively. Register-pair
clobbers invalidate their scalar aliases. Machine dead-code elimination removes
the original `CSET` only when its Boolean has no remaining data uses. Condition
code kill flags are cleared across the extended flags lifetime.

This runs after register allocation and pseudo expansion. It removes redundant
instructions without changing register allocation or the ISA.

## RPG results

All six reported sites are removed: two each in `refresh_tile_cache`,
`update_visible_world`, and `npc_request`. For example, `refresh_tile_cache` now
contains:

```asm
mov      r4, r5
addi.s8  r4, -0x80
cmp      r5, r4
xor      r6, r6
cmov.ult r4, r6
```

Each eliminated pair saves four bytes and **79 interpreter cycles** when
executed: `CSET` costs 41 cycles and `TST8` costs 38. The conditional move costs
the same for the corresponding taken or untaken outcome.

Total RPG `.text` decreases from **10,595 to 10,571 bytes** (24 bytes, 0.227%).
Static RAM remains 268 bytes, and the complete maximum stack bound remains
166 bytes. These changes are incremental over the preceding address-reuse fix.

| RPG workload | Before cycles/frame | After cycles/frame | Reduction |
| --- | ---: | ---: | ---: |
| Idle grove | 243,894 | 243,496 | 0.163% |
| Pixel scrolling | 225,124 | 224,666 | 0.203% |
| Dense collision | 201,434 | 200,994 | 0.218% |

Each workload measures 30 frames, including simulation, rendering, display, and
interrupt work, excluding pacing waits. Both FX and FX-C full-device scenarios
pass and produce identical cycle results. The game retains its 30 FPS cap.

The **eight-second exploration replay** decreases from **99,077,746 to
99,056,687 native active cycles**, a **0.0213% reduction**. The replay includes
pacing code and other interpreter work, so its percentage differs from the
per-frame work intervals. Both recordings use the same interpreter and replay
events, cover complete windows with zero partial cycles, and end with the same
framebuffer hash.

## Benchmark coverage

All **86 pre-existing compiled benchmarks** are unchanged: the measured cycle
sum remains **148,147,747**, and combined `.text` remains **49,828 bytes**.
Instruction-cycle measurements are also unchanged. The previous suite did not
exercise this redundancy, so these results do not imply a suite-wide speedup.

The new `bench/c/boolean_select.c` benchmark exercises two wrapped-coordinate
clamps, using the same subtraction, unsigned comparison, and zero-selection
shape as the RPG. It measures 32 passes over 32 mutable coordinates, including
values around the wrapping boundaries. A volatile checksum keeps the results
observable, and the two debug breaks delimit the measured work. Its generated
disassembly is retained in `bench/c/asm/boolean_select.asm`.

| Focused benchmark | Before | After | Reduction |
| --- | ---: | ---: | ---: |
| `boolean_select.c` cycles | 932,765 | 770,973 | 17.35% |
| `.text` bytes | 485 | 477 | 1.65% |

The benchmark's diagnostic confirms two `CSET_ULT -> TST8 -> CMOV_NE`
sequences before the late peephole pass. The combine replaces the tests and
consumers with `CMOV_ULT`, and subsequent machine DCE removes both `CSET`s.
The measured cycle reduction is exactly **161,792 = 79 × 2 × 1,024**.

For this new benchmark, the A/B measurement resumes the same captured MIR with
the late peephole pass bypassed or enabled. The before/after pass dumps differ
only in these two combines, so bypassing the pass isolates this change. The
enabled A/B `.text` is byte-for-byte identical to the normal benchmark build.
Both images, disassemblies, the captured MIR, and the CMake harness are retained
locally under `build/boolean-cc/ab-build/` and `build/boolean-cc/ab-source/`.

Including this measured A/B case, the expanded **87-benchmark suite** has one
improvement and 86 unchanged results, with no regressions. Its cycle sum changes
from **149,080,512 to 148,918,720** (**0.1085% lower**). This expanded comparison
includes the newly added benchmark; the 86-program pre-existing suite remains
unchanged.

## Validation and reproduction

All **84 AVM backend regression tests** and **483 assembly/C/C++ execution
tests** pass, as do both RPG full-device scenarios. The new MIR regression
covers every original condition with both Boolean polarities, conditional moves
and branches, byte and word tests, multiple readers, Boolean data and pair-alias
uses, scalar/pair and CC clobbers, escaping flags, repeated tests, and calls.
The new LLVM IR regression checks the RPG clamp shape through the complete
pipeline at normal and size-optimized settings.

With the repository's matching MSVC developer environment:

```powershell
cmake --build build --config RelWithDebInfo --target avm_tests_run avm_bench avm_sdk_install llc --parallel 8
python build/llvm-build/bin/llvm-lit.py -v deps/llvm-project/llvm/test/CodeGen/AVM
build/avm_bench.exe
cmake --build projects/avm_rpg/build --config RelWithDebInfo --target artifacts/rpg.elf rpg_device_tests --parallel 8
build/avm-sdk-install/bin/avm-prof.exe record projects/avm_rpg/build/artifacts/rpg.elf --warmup 1s --for 8s --native --replay projects/avm_rpg/tests/replays/exploration.json -o run.avmp
```

Before/after RPG profiles, disassemblies, frame measurements, benchmark sizes,
and logs are retained locally under `build/boolean-cc/`. The benchmark MIR
diagnostic is generated under `build/bench/c/mir/boolean_select.mir`.
