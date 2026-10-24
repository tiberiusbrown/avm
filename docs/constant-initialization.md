# Constant initialization pooling

AVM now replaces profitable contiguous constant stores with a copy from a private
program-memory constant pool. Uniform byte values use `memset` instead. This
handles general store sequences, rather than matching a benchmark or a particular
array initializer.

The pass runs after IR instruction combining at optimized codegen levels. It
accepts constant scalars, floating-point values, densely stored aggregates, and
symbolic pointers. It sorts stores by offset, partitions contiguous regions, and
requires both estimated interpreter-cycle savings and total program-byte savings
including the pool. Identical pools are shared within a module. Small regions
and cheap repeated values remain inline when the estimate favors them.

Memory reads, calls, side effects, distinct base pointers, overlapping stores,
and basic-block boundaries end a candidate sequence. Volatile and atomic stores,
undefined values, partial-byte integers, aggregate padding, and holes are not
copied. Typed pool entries retain relocations and AVM's three-byte program-pointer
layout. RAM destinations may be local, global, or computed pointers.

## Inline service expansion

The IR contains an ordinary `llvm.memcpy.p0.p1.i16`, with no helper function.
Instruction selection represents copies from the generated pools with
`CONST_COPY_P_PSEUDO`, carrying the destination, immediate pool address, immediate
length, precise source/destination memory operands, and a register clobber mask.
The pseudo is a memory operation; it is not marked as a call and does not make a
function acquire call-frame metadata.

The destination is placed in r4. The mask keeps live values out of r4-r7 across
the operation, preserving r0-r3 and SP. Source and length setup stays hidden from
allocation, preventing their service-register preferences from influencing later
hot loops. After allocation, expansion emits the pool address into r6:r7, length
into r5, and `sys memcpy_p` directly. There is no wrapper or extra call/return,
including in `packed_fields` and `boolean_select`.

## Benchmark results

RelWithDebInfo toolchain, optimized C/C++ benchmark suite; lower cycles are better.
The comparison includes the new benchmark on both sides.

| Benchmark | Before | After | Fewer cycles |
| --- | ---: | ---: | ---: |
| `constant_init` | 595,338 | 303,498 | 49.02% |
| `packed_fields` | 963,413 | 916,324 | 4.89% |
| `sys_memcmp_p` | 5,285 | 5,133 | 2.88% |
| `boolean_select` | 770,973 | 770,973 | 0% |

The new `constant_init` benchmark repeatedly populates a 64-byte array within the
measured interval. `boolean_select` initializes before its timing interval, so its
cycle count does not measure this optimization.

Across all 88 C/C++ benchmarks, summed cycles fall from 149,514,058 to 149,175,088
(0.227%); the geometric-mean cycle reduction is 0.831%. Three improve, 83 are
unchanged, and two regress slightly: `aggregate_args` by 71 cycles (0.003%) and
`sys_strncpy` by 40 cycles (1.93%). These are net results for the complete change.

| Program bytes (`.text` + `.rodata`) | Before | After | Saved |
| --- | ---: | ---: | ---: |
| `constant_init` | 456 | 341 | 115 |
| `boolean_select` | 477 | 362 | 115 |
| `packed_fields` | 895 | 535 | 360 |
| All 88 benchmarks | 57,460 | 55,149 | 2,311 |

Aggregate benchmark `.text` falls from 50,761 to 47,056 bytes; `.rodata` grows from
6,699 to 8,093 bytes. Static RAM remains 10,070 bytes. Benchmark disassemblies are
retained under `bench/c/asm`.

## Validation

Backend regressions cover pooling, cost decisions, memory barriers, layout,
program-pointer relocations, the allocation-stage pseudo and clobber mask, and
inline expansion with both byte-sized and larger lengths. The execution fixture
checks all initialized words, guard bytes, gaps, mixed scalar records, and stored
24-bit pointer equality and dereferencing at O0, O1, O2, O3, Os, and Oz.
