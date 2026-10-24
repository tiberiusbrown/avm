# AVM byte values, copies, and spills

The compiler now describes unsigned byte-load results before instruction
selection and preserves their zero upper bits through branches and load-fed PHI
graphs. The changes use value representation, liveness and target cost hooks;
no peephole pass was added or extended.

## General code-generation changes

- Refine byte `EXTLOAD` nodes to `ZEXTLOAD`, matching AVM's actual RAM and program
  load semantics. Indexed loads retain their address updates, chains and memory
  operands. Signed extensions remain necessary and unchanged.
- Represent byte PHIs as native 16-bit words when every incoming value is a
  byte load, constant, or another eligible PHI. Extend loads once and preserve
  the representation around cycles. Unsigned comparisons, switches and explicit
  extensions consume the word; signed users, memory and ABI operands retain
  their original byte semantics. Arithmetic inputs invalidate dependent PHIs,
  so wrapping arithmetic is not promoted. This runs before SelectionDAG, whose
  incoming-register facts are unavailable at unvisited loop backedges.
- Describe complete, unordered 16/32-bit frame transfers through LLVM's stack
  slot hooks. LLVM's existing spiller and loop-invariant code motion can then
  coalesce transfers and hoist invariant reloads. Partial, extending, displaced
  and ordered accesses are not described as complete spill reloads.
- Track the two words of register pairs independently. A consumed low word no
  longer remains live merely because its high word is still needed. Splitting
  pair stores preserves implicit pair uses, undefined lanes and the final kill.
- Charge pair spills for their two word transfers using spill size / 2. Give
  fixed ABI carrier classes priority over flexible classes; this also prevents
  a newly exposed allocation failure in `constant_init` at `-Os`.
- Weight compact stack-slot placement by execution frequency for speed. Size
  optimization continues to count each static access once.

These rules apply to all functions. There are no benchmark names, function-name
checks, benchmark-specific thresholds or experimental controls in the backend.
Broad arithmetic type promotion was tested and rejected because it caused
unrelated regressions; the final PHI transformation only uses free inputs.

## Benchmarks

Cycle counts use the unchanged native interpreter and DEBUG_BREAK baseline:

| Existing case | Before | After | Change |
| --- | ---: | ---: | ---: |
| `fir8` | 5,841,419 | 5,723,737 | -2.01% |
| `progmem_widen_ldp32_bytes` | 737,487 | 721,763 | -2.13% |
| `wide_divmod` | 2,869,389 | 2,822,868 | -1.62% |

Spill recognition alone improved the first two but regressed `wide_divmod` by
3.13%. Independent pair-word liveness and the two-transfer spill cost remove
that regression. Copy recognition did not cause those improvements and its
experimental overrides were removed.

Across the 90 pre-existing compiled cases, 23 improve, 59 are unchanged and
8 regress. Their cycle-count sum falls from 153,420,342 to 149,235,687 (-2.73%).
The remaining regressions are recorded explicitly:

| Case | Before | After | Change |
| --- | ---: | ---: | ---: |
| `float` | 899,232 | 940,529 | +4.59% |
| `normalized_loads` | 1,363,919 | 1,383,499 | +1.44% |
| `progmem_record_index` | 2,047,376 | 2,050,121 | +0.13% |
| `small_memops` | 322,354 | 323,653 | +0.40% |
| `sys_memcmp` | 2,876 | 2,991 | +4.00% |
| `sys_strcmp` | 2,524 | 2,677 | +6.06% |
| `sys_strncat_p` | 3,480 | 3,500 | +0.57% |
| `memory_services` | 18,299 | 18,300 | +0.01% |

Two new standard-suite cases cover previously missing patterns:

- `byte_load_liveout`: branch-crossing RAM/program loads followed by byte
  arguments and calls. It falls from 742,666 on the original compiler to
  723,722 cycles (-2.55%).
- `byte_phi_stream`: RAM/program bytes carried around a loop and classified
  as unsigned values, including values above 127. The PHI representation change
  alone reduces it from 11,092,327 to 10,476,647 cycles (-5.55%), with the other
  fixes held constant.

Both new sources and their generated disassemblies are retained. The standard
suite now contains 86 C and 6 C++ cases.

## RPG code generation and exploration

The comparison freezes all 14 RPG LTO inputs and recompiles the runtime and
builtins for the original compiler configuration. Those inputs are byte-for-byte
identical to the final RPG build. The final SDK then rebuilds both playable
packages and runs the normal and FX-C integration scenarios.

| Measurement | Before | After |
| --- | ---: | ---: |
| Text bytes | 10,521 | 10,400 |
| Read-only data bytes | 36,204 | 36,204 |
| Static RAM bytes | 268 | 268 |
| Complete stack bound | 166 | 164 |
| `zext8` instructions | 65 | 58 |
| Exploration active interpreter cycles | 94,033,832 | 93,811,323 |

The exploration measurement uses the existing replay, a one-second warmup and
an eight-second native window. Active interpreter work falls by 222,509 cycles
(-0.24%); elapsed time is fixed by the recording window. Both runs have matching
replay-event and final-display hashes, complete windows, and no discontinuities.
The byte-load-only stage measured 94,017,708 active cycles; the final result
includes the liveness, spill, layout and PHI changes.

The reported load extensions are gone. In the final disassembly, `terrain_clear`
has `ld8u r4,[r4]` at `0x4E7` followed directly by the call at `0x4E8`; its other
loads also feed calls without another extension. The program-memory case now
has `ldp8u r4,[q1]` at `0x1D14` followed by `cmpi.s8` at `0x1D17`, with no `zext8`.

The apparent transfer round trips still have necessary alternate entries:

| Function | Transfers | Other entry |
| --- | --- | --- |
| `menu_screen` | `mov32 q1,q2` at `0x2189`; `mov32 q2,q1` at `0x218B` | Backedges enter at `+0xC` (`0x218B`). |
| `menu_screen` | `ldsp16 r6,[sp+0]` at `0x219D`; `stsp16 [sp+0],r6` at `0x219F` | Selection-changing paths enter at `+0x20` (`0x219F`). |
| `update_visible_world` | `stsp16 [sp+2],r4` at `0xE2D`; `ldsp16 r4,[sp+2]` at `0xE2F` | The branch at `0xE0D` enters at `0xE2F` (`+0x791`). |

Removing the second transfer based on linear disassembly would break those
paths. The control-flow regression retains them; existing `redundant-values.mir`
already checks genuine same-block copies, spills and extension facts across
intervening instructions.

## Validation

RelWithDebInfo validation passed:

- All 95 AVM backend tests, including new pre-allocation load/PHI checks,
  cyclic-PHI and wrapping/signed controls, pair liveness, undefined-lane spills,
  invariant reloads, frequency-aware stack placement and alternate-entry tests.
- All 501 AVM runtime cases across the six optimization settings. The byte
  fixture checks every RAM byte value, both branch paths, program-memory sign
  boundaries, and byte PHIs in RAM/program loops.
- Machine verification of all 112 benchmark/runtime translation units.
- All instruction benchmarks and all 92 compiled benchmarks.
- RPG integration, including normal and FX-C device scenarios, menus,
  save/restart, scrolling and music rotation. Both packages were rebuilt.

Full local measurements, pass dumps and matched baseline artifacts are retained
under `build/codegen-tuning`; final disassembly is `final-rpg-disasm.txt`, the
replay is `final-word-phi-exploration.avmp`, and complete test output is
`validated-final.log`. All changes remain uncommitted.
