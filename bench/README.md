# AVM benchmarks

The [fast trig report](../docs/math-runtime/trig-fast/report.md) records the
current single-float reducer, identical-input before/after measurements, and
fast/full reproduction commands. Use `avm_trig_bench_run` for the focused set.

The [phase 3–4 math report](../docs/math-runtime/phase34/report.md) compares the
current pow/hypot/trig replacements with the working-tree baseline. Additional
workloads cover near-one powers, extreme powers, integer-loop crossover,
shared sine/cosine, and exact hypot overflow classification. The latter two
experimental coverage workloads (`math_pow_crossover`, `math_hypot_boundary`)
were added after the baseline capture and have no before-cycle row.

The current math study has [generated cycle/resource comparisons](../docs/math-runtime/report.md)
and [generated accuracy measurements](../docs/math-runtime/accuracy.md). Use
`avm_math_bench_images` for focused iteration. New `math_exp_primary` and
`math_log{,2,10}_scaled` workloads isolate reduction-free exp evaluation and
logarithm exponent/subnormal boundaries. `avm_bench --stack-output FILE` adds a
separate instruction-stepped stack pass without changing cycle measurements.

`avm_bench_run` builds and runs the test suite, the instruction-cycle image,
and every source in `bench/c` and `bench/cpp`. Each compiled source is a
freestanding program. It does any input setup before the first
`__avm_debug_break()`, measures the work between that break and the second one,
and stores a result in a volatile sink so the optimizer retains the work. The
runner subtracts the adjacent-break baseline and writes cycle counts to
`cycles_c.txt` and `cycles_cpp.txt`. Generated disassembly lives beside each
source in its `asm` directory.

Build with `cmake --build build --config RelWithDebInfo --target avm_bench_run`.
`avm_bench` builds only the runner; `avm_bench_images` builds all images and
disassemblies, and `avm_bench_mir` builds optional diagnostic dumps. To time one language
without rerunning the tests or instruction image, build `avm_bench avm_bench_images` and run
`build/avm_bench --c-only` or `build/avm_bench --cpp-only`. The `--instruction-only`
mode is available for the assembly image.

```sh
cmake --build build --config RelWithDebInfo --target avm_bench avm_trig_bench_images --parallel 8
build/avm_bench --c-only --filter 'math_(sin|cos|tan|sincos)' --list
build/avm_bench --c-only --filter '^math_trig_' --c-output build/trig-cycles.txt
```

Filters are ECMAScript regex searches on source stems or instruction names;
an empty match fails. `--list` needs no built images or interpreter. Filtering
happens before validating images. Filtered runs default to
`cycles_c.selected.txt`, `cycles_cpp.selected.txt`, or
`cycles_instruction.selected.txt`; an explicit output path takes precedence.
No filter retains the complete sweep and historical output paths. Compiled
benchmarks use the configured `AVM_OPT_LEVEL` (normally O2). Instruction filters
consume preceding intervals from their one shared image, then stop after the
last selected interval. Normal sweeps measure cycles only; stack stepping runs
only with `--stack-output`. Compiled images run in parallel by default, using one
worker per logical processor (up to the number of selected images). Each worker owns a reset emulator session
and reuses its decoded interpreter. Use `--jobs N` to override the worker count,
or `--jobs 1` for sequential execution. Instruction intervals remain sequential
within their shared image. Cycle, stack, trace, and console results retain their
sorted order; regression tests compare parallel cycles with sequential and isolated
one-image runs.

The dedicated `avm_audio_tests_run` target measures native audio ISR, seek,
countdown, chord-commit, and FX burst costs without adding interrupts to the
instruction benchmark. [Audio results](../docs/audio-benchmarks.md) include
the before/after instruction comparison and autonomous demo service latency.

The newer compiled benchmarks fill these code generation gaps:

| Area | Benchmarks |
| --- | --- |
| Aggregate layout and ABI | `aggregate_args`, `aggregate_return`, `bitfields`, `packed_fields` |
| Memory and stack | `aliasing`, `dynamic_stack`, `pointer_table`, `stack_frames`, `volatile_rmw` |
| Branches and loop shapes | `byte_comparisons`, `loop_shapes`, `short_circuit`, `saturating_math` |
| Integer lowering | `bit_count`, `bounded_shifts`, `count_leading_zeros`, `count_trailing_zeros`, `div_pow2`, `narrow_arithmetic`, `popcount`, `progmem_record_index`, `rotate32`, `wide_add_sub`, `wide_compare` |
| Floating point lowering | `float_comparisons`, `float_conversions` |
| Runtime float math | `math_sqrt`, `math_sin`, `math_cos`, `math_atan`, `math_atan2`, `math_tan`, `math_exp`, `math_log`, `math_log2`, `math_log10`, `math_pow`, `math_hypot`, `math_fmod`, `math_floor`, `math_ceil`, `math_round`, `math_trunc`, plus the focused workloads below |
| C++ lowering | `aggregate_byte_dispatch`, `aggregate_byte_packing`, `aggregate_byte_packing_hoisted`, `lambda_capture`, `member_pointers`, `scoped_lifetime`, `template_specialization`, `virtual_dispatch` |

Each `math_*` benchmark measures 32 calls, except `math_sqrt_random` (256).
`math_sqrt` covers positive subnormals, both exponent parities, powers of two
and adjacent floats, and magnitudes across binary32. `math_sqrt_mantissas`
samples mantissas throughout [1,4), including lookup boundaries;
`math_sqrt_random` uses a reproducible random mantissa at every finite exponent
and the largest finite input. `math_sqrt_special` covers both signs of zero,
subnormals, ordinary values, infinities and quiet/signaling NaNs, storing each
result separately. Input generation takes place before timing.
`math_sin`, `math_cos`, and `math_tan`
use the same 16 magnitudes with both signs, from 0.25 through the largest finite
binary32 value. Half the calls exercise large-angle reduction; the remaining
inputs cover the direct, special-case, and medium-angle paths. `math_floor`,
`math_ceil`, `math_round`, and `math_trunc` share 16 magnitudes with both signs,
including zeros, subnormals, ties, the exponent-7 word boundary, carries into
the exponent, and integral values. The volatile
input tables are initialized before timing; the timed loop loads each input,
calls the function, and accumulates its result. Other math benchmarks use inputs
from 0.25 to 1.21875. `math_pow` uses exponent 1.25, crossing the bounded
positive-base shortcut's lower endpoint at 0.5.

Focused 32-call workloads exercise the math shortcuts and their fallbacks:

| Benchmark | Coverage |
| --- | --- |
| `math_hypot_scaled` | Ordinary pairs, both scaling directions, subnormals, zeros, exponent gaps |
| `math_atan2_ratios` | All quadrants, ratios above/below one, subnormals, extreme exponent gaps |
| `math_atan` | Both signs and adjacent floats at all argument-reduction boundaries |
| `math_tan_reduced` | Direct polynomial, pi/4 transform, reciprocal, neighbors of the first pole |
| `math_log_near_one`, `math_log2_near_one`, `math_log10_near_one` | Near-one polynomial endpoints and adjacent floats, powers of two, scaled near-one mantissas |
| `math_pow_integer` | Signed bases and exponents 3..8, accepted multiplication paths, range fallbacks, special values |
| `math_pow_bounded` | Bounded log/exp endpoints and adjacent fallbacks, multiplication-path bounds for both base signs |
| `math_fmod_subnormal` | Both operand normalization paths, native-word boundaries, signed zeros, large exponent gaps |
| `math_exp_scaled` | Negative exponent packing, gradual underflow, reduction endpoints, large positive exponents |
The [runtime math study](../docs/math-runtime-tradeoff.md) compares the native
interpreter implementation, initial runtime port, and optimized runtime.

`progmem_record_index` indexes six-byte program-memory records containing two
24-bit pointers, like the RPG music catalog. Runtime byte indices include 0,
127, 128, and 255, and both fields contribute to the measured checksum.

`aggregate_byte_dispatch` passes three-byte coordinate records by value and
switches on their byte area field, like the RPG chunk dispatch. Inputs include
area 1 and nonmatching values up to 255, with varying neighboring fields.

`aggregate_byte_packing` constructs two-, three-, and four-byte records from
runtime word loads and passes them by value. Every byte contributes to the
checksum, including both bytes of the high register in the four-byte case.

`aggregate_byte_packing_hoisted` constructs coordinates in nested traversal
loops. The packed `y` field is invariant in the inner loop and crosses a basic
block boundary, as in the RPG. This covers preservation of its zero low word
alongside ordinary full-width operations in `wide_compare`, `packed_fields`,
`struct_copy`, `shifts`, and `progmem_walk`.

`byte_load_liveout` keeps RAM and program-memory byte loads live across a
runtime branch before passing them to byte-argument calls. It exercises known
upper bits between basic blocks, together with call spills and register copies.

`byte_phi_stream` classifies bytes from RAM and program memory with the previous
load carried through a loop PHI. It covers unsigned promotion around a cycle,
including values on both sides of 127 and 128.

`record_stride` scans 18-byte records with a runtime bound, conditional byte
tests, word fields and a live scalar index. `record_stride_nested` surrounds
an indirect insertion search with the same affine scan, like the RPG actor
draw order. The existing `record_scan` uses an explicit pointer and does not
cover this missed outer-loop strength reduction.

`bounded_multiply` keeps an index in 0..7 live across an inner loop and computes
`18 * index`. It exercises range proofs and allocation of the byte-multiply
candidate when upper registers are busy.

`fir8` exercises signed byte products with hoisted, spilled coefficients.
Its unrolled sample loads also exercise shared displaced-address bases.

`shifts` measures unbounded 32-bit variable-shift helpers, `rotate32` measures
32-bit rotations, and `wide_shifts` measures 64-bit shifts. `bounded_shifts`
measures native lowering of full-width left, logical-right, and arithmetic-right
shifts with counts in 0..15, 16..31, and 0..31. `register_cleanup` exercises an
inline widening shift of a word by a variable count in 0..7 under register pressure.

The split-word rounding kernels and bounded-shift lowering were measured on
2026-10-25 with the same sources before and after the changes, using
RelWithDebInfo, `-O2` callers, and `-O3` runtime math. Counts include the timed
loop and result accumulation, with the adjacent-break baseline subtracted.

| Benchmark | Before cycles | After cycles | Cycles saved |
| --- | ---: | ---: | ---: |
| `math_floor` | 136,578 | 79,335 | 41.9% |
| `math_ceil` | 134,440 | 74,723 | 44.4% |
| `math_round` | 121,903 | 74,663 | 38.8% |
| `math_trunc` | 81,109 | 58,827 | 27.5% |
| `bounded_shifts` | 103,789 | 54,961 | 47.1% |

All four rounding kernels have zero references to 32-bit shift helpers
(previously 3, 3, 3, and 1 respectively). `avm_rounding_tests_run` checks their
compiled symbols and compares all four production kernels with host double
results for over 51 million inputs. Interpreter fixtures additionally exercise
every fractional exponent and all 32 bounded shift counts at O0/O1/O2/O3/Os/Oz.

The math shortcuts were measured on 2026-10-25 with identical benchmark sources
before and after, RelWithDebInfo, `-O2` callers, `-O3` runtime math and the same
interpreter. The original runtime archive was preserved before editing and
linked with the new focused workloads; its counts for every existing workload
matched the initial measurement exactly. Each row measures 32 calls and includes
loop/accumulation costs, with the adjacent-break baseline subtracted.

| Benchmark | Before cycles | After cycles | Cycles saved |
| --- | ---: | ---: | ---: |
| `math_atan` | 369,577 | 259,463 | 29.8% |
| `math_atan2` | 674,401 | 536,247 | 20.5% |
| `math_atan2_ratios` | 528,206 | 420,244 | 20.4% |
| `math_exp` | 390,086 | 390,086 | 0.0% |
| `math_exp_scaled` | 354,886 | 354,886 | 0.0% |
| `math_fmod` | 147,071 | 142,305 | 3.2% |
| `math_fmod_subnormal` | 987,126 | 698,414 | 29.2% |
| `math_hypot` | 643,250 | 547,893 | 14.8% |
| `math_hypot_scaled` | 571,573 | 488,153 | 14.6% |
| `math_log` | 461,247 | 397,609 | 13.8% |
| `math_log10` | 523,028 | 424,880 | 18.8% |
| `math_log10_near_one` | 426,844 | 298,734 | 30.0% |
| `math_log2` | 497,999 | 374,524 | 24.8% |
| `math_log2_near_one` | 403,180 | 250,806 | 37.8% |
| `math_log_near_one` | 364,609 | 270,862 | 25.7% |
| `math_pow` | 1,494,206 | 1,057,962 | 29.2% |
| `math_pow_bounded` | 1,504,373 | 808,415 | 46.3% |
| `math_pow_integer` | 1,361,451 | 918,318 | 32.5% |
| `math_tan` | 1,729,698 | 1,580,198 | 8.6% |
| `math_tan_reduced` | 570,124 | 427,542 | 25.0% |

The remaining math workloads were unchanged. The exponent-shift fixes in exp
also preserve its cycle counts. Production hypot has five static `fmul`
instructions rather than ten, and atan2 has 157 static stack loads/stores rather
than 191. The smaller atan/tan polynomials reduce their static multiply counts
from 16 to 9 and from 40 to 24 respectively (the latter includes reduction).
`avm_shortcuts_tests_run` enforces the four-ULP policy against host double libm;
interpreter fixtures exercise the same paths at all six optimization levels.
The power shortcuts trade code space for cycles: the `powf` function grows
from 2,404 to 3,025 bytes and now links `expf`. The packaged `math_pow` image
grows from 7,936 to 9,216 bytes; all measured cycle counts still improve or
remain unchanged.

Keep setup outside the measured interval and make the result depend on
runtime data. New sources are discovered by CMake and the runner automatically;
each source should contain exactly one pair of debug breaks.

## Square-root table experiments

Measured on 2026-10-25 with RelWithDebInfo, callers at `-O2`, and kernels at
`-O3 -ffp-contract=off`. Each comparison uses identical inputs, interpreter,
library member order and benchmark sources, subtracting the 35-cycle baseline.
The initial comparison below uses a **2 KiB** quadratic interpolation table
and the unchanged exact midpoint correction. It has no floating-point
divisions. A 16 KiB linear interpolation table is faster, but the 2 KiB
choice saves 14 KiB and takes 5.3% more cycles on the 256-input workload.
The subsequent contiguous-read optimization described below reduces the
retained table to **1.5 KiB**.

The percentages below are cycle reductions relative to the original
three-Newton-step implementation. Except for the randomized workload, each
row measures 32 calls. The small-input row repeats the former benchmark's
`0.25 + i*0.03125` inputs; it is included for historical comparison and is
not the broader `math_sqrt` workload now recorded in `cycles_c.txt`.

| Workload | Original cycles | 2 KiB cycles (saved) | 16 KiB cycles (saved) |
| --- | ---: | ---: | ---: |
| `math_sqrt` | 380,249 | 361,712 (4.9%) | 346,170 (9.0%) |
| `math_sqrt_mantissas` | 398,768 | 370,776 (7.0%) | 352,132 (11.7%) |
| `math_sqrt_random` (256 calls) | 3,236,019 | 2,936,877 (9.2%) | 2,789,283 (13.8%) |
| Original small-input workload | 430,649 | 385,172 (10.6%) | 369,492 (14.2%) |
| `math_sqrt_special` | 167,031 | 164,004 (1.8%) | 157,839 (5.5%) |
| `math_hypot` | 547,893 | 506,616 (7.5%) | 486,609 (11.2%) |
| `math_hypot_scaled` | 488,153 | 447,031 (8.4%) | 432,467 (11.4%) |

The experiments started with lookup seeds and two ordinary Newton steps.
A 128-byte seed table passed exhaustive checks and saved 6.2% on the
256-input workload; larger seed tables did not improve this substantially.
A 16 KiB seed table allowed one Newton step and saved 12.2%. Interpolation
was faster: linear interpolation won within 16 KiB, and quadratic
interpolation won within 2 KiB. The latter pads three coefficients to a
16-byte record: compacting the table to 1.5 KiB raised the randomized timing
from 2,936,877 to 3,359,218 cycles because record indexing became more costly.

Two uncorrected reciprocal-square-root Newton steps failed exact rounding
at input `0x3f8439e4`. A 2 KiB reciprocal table with one Newton step and a
residual refinement passed, but took 3,360,119 randomized-workload cycles,
3.8% more than the original implementation. Two steps plus refinement were
also slower. Coarse one-step lookup, linear and quadratic candidates were
rejected when exhaustive testing found errors. Their failing inputs are
included in the generated target fixtures.

The retained kernel and both table-size finalists matched the saved original
kernel and host double sqrt on all 16,777,216 normalized mantissa/parity
inputs, all 8,388,607 positive subnormals, exponent boundaries, and one million
random bit patterns (NaNs by classification). The generator
`tests/math/generate_sqrt_table.py` reproduces the 2 KiB table and the AVM
fixtures at every interval's edges and midpoint; `--check` detects stale files.
All 723 AVM fixtures passed, including the original sqrt vectors and 771
generated boundary vectors at `-O0`, `-O1`, `-O2`, `-O3`, `-Os` and `-Oz`.

### Contiguous coefficient reads

Copying each record into three local floats initially produced identical
code: scalar replacement converted the copy back into three `ldp32` loads.
An empty register dependency on the 12-byte count retains one `sys memcpy_p`
operation and one uninterrupted program-space read. With the padded 2 KiB
table, the bulk read was essentially tied (2,937,076 randomized cycles versus
2,936,877 for direct loads).

The retained version also removes the unused fourth float from each record
and calculates the byte offset explicitly in a native 16-bit word. This
avoids the costly wide indexing of the earlier compact-table experiment.
The table now occupies 1,536 bytes, saving 512 bytes, and the kernel's local
stack frame grows from 12 to 24 bytes to hold the three copied coefficients.
The interpolation arithmetic and exact midpoint correction are unchanged.

| Workload | Three direct loads | One 12-byte copy | Cycles saved |
| --- | ---: | ---: | ---: |
| `math_sqrt` | 361,712 | 359,542 | 0.60% |
| `math_sqrt_mantissas` | 370,776 | 368,516 | 0.61% |
| `math_sqrt_random` (256 calls) | 2,936,877 | 2,918,856 | 0.61% |
| Original small-input workload | 385,172 | 382,836 | 0.61% |
| `math_sqrt_special` | 164,004 | 163,209 | 0.48% |
| `math_hypot` | 506,616 | 504,356 | 0.45% |
| `math_hypot_scaled` | 447,031 | 444,987 | 0.46% |

## Native polynomial workloads

`math_sin_small`, `math_cos_small`, and `math_tan_small` measure 32 calls with
paired signs at magnitudes 0.125 through 128, avoiding large-angle reduction.
The existing broad-range trig benchmarks remain. `poly{1,2,4,8,12}_guest` and
`poly{1,2,4,8,12}_native` compare identical 32-input workloads using ordinary
compiler-generated Horner arithmetic and inline native `fpoly` respectively.
All setup precedes timing, and each result contributes to a volatile sink.

See [fpoly measurements](../docs/fpoly-performance.md) for interpreter flash,
cycles, guest text sizes, numerical accuracy, and full validation results.
