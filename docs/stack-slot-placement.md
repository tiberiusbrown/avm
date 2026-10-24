# AVM stack object placement

The AVM backend now prioritizes movable frame objects by their number of compact-eligible upper-register accesses per byte. The most valuable objects end up nearest the final SP. The generic prologue/epilogue inserter retains control of alignment, fixed incoming objects, callee saves, protected objects, and emergency spill slots. Frames using a frame pointer and local allocations of at most 16 bytes keep their existing order.

The comparison uses the existing RelWithDebInfo MSVC/Ninja build, full LTO for the RPG, the same interpreter and assets, and identical benchmark inputs. Baseline measurements already include the preceding multiplication and comparison-narrowing fixes.

Across **86 compiled benchmarks**: 14 faster, 72 unchanged, 0 slower. The sum of measured benchmark cycles changes from **149,285,185 to 148,239,587 (0.70% lower)**. The geometric mean cycle reduction is **0.45%**. The aggregate weights each program by its measured benchmark duration; the geometric mean weights each benchmark equally.

Combined benchmark `.text`: **50,061 to 49,844 bytes**.

| Changed benchmark | Before cycles | After cycles | Reduction |
| --- | ---: | ---: | ---: |
| wide_compare.c | 1,193,470 | 1,132,734 | 5.09% |
| wide_divmod.c | 3,224,862 | 3,062,488 | 5.04% |
| stack_array.c | 266,996 | 254,100 | 4.83% |
| float_comparisons.c | 1,078,218 | 1,028,298 | 4.63% |
| mixed_width.c | 3,217,796 | 3,111,274 | 3.31% |
| aggregate_return.c | 1,955,202 | 1,908,506 | 2.39% |
| fixed_point.c | 11,802,380 | 11,536,140 | 2.26% |
| wide_mul.c | 881,118 | 861,462 | 2.23% |
| saturating_math.c | 3,888,329 | 3,805,129 | 2.14% |
| rotate32.c | 4,932,237 | 4,843,005 | 1.81% |
| fir8.c | 5,948,825 | 5,841,419 | 1.81% |
| aggregate_args.c | 2,496,049 | 2,460,529 | 1.42% |
| wide_shifts.c | 550,407 | 547,287 | 0.57% |
| divmod.c | 1,065,446 | 1,063,366 | 0.20% |

Each RPG workload measures 30 frames, excluding pacing waits and including simulation, rendering, display, and interrupt costs. Both FX and FX-C full-device checks pass.

| RPG workload | Before cycles/frame | After cycles/frame | Reduction |
| --- | ---: | ---: | ---: |
| idle_grove | 250,971 | 247,442 | 1.41% |
| pixel_scroll | 230,428 | 227,563 | 1.24% |
| dense_collision | 205,908 | 203,376 | 1.23% |

The eight-second exploration replay changes from **99,463,990 to 99,253,440 native active cycles (0.21% lower)**. Both traces are complete, have zero partial cycles, and finish with the same framebuffer hash. This fixed-duration measurement includes pacing code and other interpreter work, unlike the per-frame work intervals above.

| RPG function | Compact word accesses before | After | Function bytes before | After |
| --- | ---: | ---: | ---: | ---: |
| update_visible_world(unsigned char, bool) | 25 | 165 | 2,971 | 2,830 |
| npc_player_clear(unsigned int, unsigned int, DIRECTION) | 16 | 56 | 1,111 | 1,071 |

RPG `.text`: **10,856 to 10,675 bytes**. Static RAM and the proven 166-byte maximum stack bound remain the same.

All instruction-cycle benchmark results are unchanged. The compiled suite consists of 80 C and six C++ programs; the six C++ timings are unchanged.

Validation: all 81 AVM backend regression tests and all 483 assembly/C/C++ execution tests pass. The new MIR regression covers access-frequency priority, upper versus cold registers, 32-bit register pairs, alignment, fixed incoming arguments, signed byte loads, small frames, and O0 behavior.

Reproduction from the AVM repository root (with the matching MSVC developer environment):

```powershell
cmake --build build --config RelWithDebInfo --target avm_tests_run avm_bench avm_sdk_install --parallel 8
build/avm_bench.exe
cmake --build projects/avm_rpg/build --config RelWithDebInfo --target artifacts/rpg.elf rpg_device_tests --parallel 8
build/avm-sdk-install/bin/avm-prof.exe record projects/avm_rpg/build/artifacts/rpg.elf --warmup 1s --for 8s --native --replay projects/avm_rpg/tests/replays/exploration.json -o run.avmp
```

Detailed cycle counts are recorded in `bench/cycles_c.txt`, `bench/cycles_cpp.txt`, and `bench/cycles_instruction.txt`. Generated benchmark disassemblies are retained under `bench/c/asm` and `bench/cpp/asm`.
