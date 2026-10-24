# AVM displaced-address base reuse

The backend now tracks equivalent 16-bit data addresses after register allocation
and pseudo expansion. It can replace reconstructed pointers with loads and stores
relative to a base register that is already live. The following dead-instruction
cleanup removes the redundant pointer calculations.

Addresses are represented as an opaque value, an optional data symbol, and a
constant modulo 65,536. The pass follows copies, constant materialization,
addition, and constant subtraction. It carries facts through forward control flow
only when all predecessors agree, and discards uncertain loop-entry facts,
clobbered registers, calls, and inline assembly. Register-pair clobbers invalidate
their scalar components. Program-memory operations and 24-bit pointer layouts
are unchanged.

A replacement must fit AVM's displacement range of -32 through 223, preserve
memory operands and ordering, and reuse an unchanged register that is live after
the access. The pass does not hoist pointers or extend their live intervals. Its
cost check counts locally removable address instructions and uses the measured
interpreter costs. It rejects a replacement that would increase either cycles or
bytes, including a direct load preceded by a single cheap immediate add.

## Results

These are incremental improvements over the preceding multiplication narrowing,
comparison narrowing, and stack-slot placement fixes. Both builds use the existing
RelWithDebInfo configuration, matching MSVC/Ninja toolchain, interpreter, assets,
and benchmark inputs. The RPG uses full LTO.

Across all **86 compiled benchmarks** (80 C and six C++), **one improves, 85 are
unchanged, and none regress**.

| Measurement | Before | After | Reduction |
| --- | ---: | ---: | ---: |
| Sum of suite cycles | 148,239,587 | 148,147,747 | 0.062% |
| `aggregate_args.c` cycles | 2,460,529 | 2,368,689 | 3.73% |
| Combined benchmark `.text` bytes | 49,844 | 49,828 | 0.032% |

The geometric mean cycle reduction is **0.044%**. The cycle sum weights programs
by their benchmark duration; the geometric mean weights programs equally. All
instruction-cycle measurements and all six C++ timings are unchanged.

## RPG exploration

The reported NPC traversal now uses all four proposed addressing modes:

```asm
ld8u r4, [r7+84]
ld8u r2, [r7+89]
st8  [r7+91], r5
ld16 r1, [r7+76]
```

`update_visible_world` shrinks from **2,830 to 2,750 bytes**, an 80-byte reduction
(2.83%). Total RPG `.text` shrinks from **10,675 to 10,595 bytes** (0.75%).
`npc_player_clear` remains 1,071 bytes. Static RAM remains 268 bytes, and the
complete maximum stack bound remains 166 bytes.

Each workload below measures 30 frames. Work intervals include simulation,
rendering, display, and interrupt costs, excluding frame-pacing waits. FX and FX-C
produce identical cycle results and pass their full-device scenarios.

| RPG workload | Before cycles/frame | After cycles/frame | Reduction |
| --- | ---: | ---: | ---: |
| Idle grove | 247,442 | 243,894 | 1.43% |
| Pixel scrolling | 227,563 | 225,124 | 1.07% |
| Dense collision | 203,376 | 201,434 | 0.95% |

The **eight-second exploration replay** decreases from **99,253,440 to 99,077,746
native active cycles**, a **0.177% reduction**. Both traces use the same interpreter
and replay-event hash, cover complete windows with zero partial cycles, and finish
with the same framebuffer hash. This fixed-duration measurement includes pacing
code and other interpreter activity, so its percentage differs from the frame
work intervals above. The game remains capped at 30 FPS.

## Validation and reproduction

All **82 AVM backend regression tests** pass. The new MIR test covers global
address addends, byte and word accesses, stores, volatile memory operands,
successor blocks, existing displacements, cold base registers, modular wraparound,
both displacement limits and adjacent rejected values, differing symbols and
predecessor states, dead bases, scalar and pair clobbers, calls, and unprofitable
replacements. The pipeline test checks insertion at optimized levels and omission
at O0.

All **483 assembly/C/C++ execution tests** and the RPG FX/FX-C device scenarios
pass. The device scenarios exercise menus, the complete music rotation, movement,
collision, actor drawing, and save/restart.

From the repository root, with the matching MSVC developer environment:

```powershell
cmake --build build --config RelWithDebInfo --target avm_tests_run avm_bench avm_sdk_install llc --parallel 8
python build/llvm-build/bin/llvm-lit.py -v deps/llvm-project/llvm/test/CodeGen/AVM
build/avm_bench.exe
cmake --build projects/avm_rpg/build --config RelWithDebInfo --target artifacts/rpg.elf rpg_device_tests --parallel 8
build/avm-sdk-install/bin/avm-prof.exe record projects/avm_rpg/build/artifacts/rpg.elf --warmup 1s --for 8s --native --replay projects/avm_rpg/tests/replays/exploration.json -o run.avmp
```

Cycle results are recorded in `bench/cycles_c.txt`, `bench/cycles_cpp.txt`, and
`bench/cycles_instruction.txt`. Updated benchmark disassemblies are retained under
`bench/c/asm` and `bench/cpp/asm`. Before/after RPG profiles, disassemblies, logs,
measurements, and the machine-readable comparison are retained locally in
`build/address-reuse/`.
