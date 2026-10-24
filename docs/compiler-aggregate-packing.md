# AVM small aggregate packing

Small register aggregates keep the existing ABI: two bytes per native 16-bit
word, with a three-byte record passed as an `i24`. Packing is now lowered into
independent native words instead of materializing several zero-extended pairs
and combining both halves repeatedly. No peephole pass was added or changed.

## Lowering

- Split OR when a word of an operand is zero, and AND when its result fits in
  one native word. Keep ordinary full-width OR/XOR operations in their native
  pair form. Preserve the native pair carrier for opaque full-width shifts.
- Build the final pair directly from its words. The semantic pair-construction
  instruction permits independent input registers until allocation, then emits
  parallel copies, handling overlapping inputs and swaps. A generic
  `REG_SEQUENCE` unnecessarily constrained the inputs and caused allocation
  failure in the new runtime fixture at `-O1`.
- Simplify word projections through pair construction, extensions and masks.
  Leave opaque truncations available to LLVM's existing demanded-bits and
  memory combines.
- Describe known bits of native high-word construction and word shifts. LLVM
  already records live-out known bits; its SelectionDAG import now preserves
  trailing zero bits with `AssertAlign`, alongside its existing high-bit and
  sign assertions. This eliminates the redundant low-word OR when a shifted
  field is computed in an outer block and used in an inner loop.

The rules apply to integer values generally and do not identify particular
structs, functions, projects or benchmarks. Pointer storage and ABI layouts
remain unchanged.

## Coverage and measurements

The existing `wide_compare`, `packed_fields`, `struct_copy`, `shifts`, and
`progmem_walk` cases already exercise the wide arithmetic controls. New
`aggregate_byte_packing` and `aggregate_byte_packing_hoisted` benchmarks cover
two- to four-byte construction and the RPG's nested traversal shape. Every
field contributes to the result; setup is outside the measured interval.

| Compiled benchmark | Before cycles | After cycles | Reduction |
| --- | ---: | ---: | ---: |
| `aggregate_byte_dispatch` (existing) | 1,553,292 | 1,240,204 | 20.2% |
| `aggregate_byte_packing` | 2,028,423 | 1,597,084 | 21.3% |
| `aggregate_byte_packing_hoisted` | 3,440,461 | 2,293,325 | 33.3% |

The new benchmarks were also compiled with the original `llc`, using the same
optimized LLVM inputs and interpreter. Across the 92 existing compiled cases,
13 improve and 79 are unchanged; none regress. Their cycle-count sum falls from
160,436,056 to 158,413,326 (1.26%). This sum is a suite comparison, not a weighted
application workload. Generated benchmark disassemblies and cycle files are
retained in the normal suite locations.

The rebuilt RPG calls Stage0 at `0x0872` and Stage2 at `0x10A2`. Their coordinate
packing uses one native shift and one OR. The former Stage0 sequence has 20
instructions before the call; the corresponding sequence now has 10, including
the surrounding loop bookkeeping. `update_visible_world` shrinks from 2,709 to
2,640 bytes. Total text falls from 10,400 to 10,323 bytes; static RAM remains 268
bytes and the complete stack bound remains 164 bytes. Both playable packages
are rebuilt with full LTO and the existing global-game/layout checks.

The LLVM tests check packing before allocation and late passes, including a
field exported across blocks, untruncated word inputs, different OR groupings,
full-width arithmetic controls, and overlapping pair construction. The runtime
fixture checks every byte value, word inputs with nonzero high bytes, register
arguments/returns, and three-byte stack arguments at all six optimization
levels.

Final RelWithDebInfo validation passed all 99 AVM backend and 31 Clang AVM
code-generation tests, all 507 runtime cases, the instruction benchmarks, and
all 94 compiled benchmarks. RPG integration passes the normal and FX-C device
scenarios, including world traversal, menus, save/restart, scrolling and music.
The RPG's native/content/audio CTest run passes 9 of its 10 checks.

Validation logs and matched baseline artifacts are under
`build/small-aggregate-packing`. The RPG's `imported_music` CTest still references
missing `assets/music/boss.avms`; its other native/content checks, audio timing,
and normal/FX-C gameplay integration are checked separately.
