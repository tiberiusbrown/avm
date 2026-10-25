# AVM benchmarks

`avm_bench_run` builds and runs the test suite, the instruction-cycle image,
and every source in `bench/c` and `bench/cpp`. Each compiled source is a
freestanding program. It does any input setup before the first
`__avm_debug_break()`, measures the work between that break and the second one,
and stores a result in a volatile sink so the optimizer retains the work. The
runner subtracts the adjacent-break baseline and writes cycle counts to
`cycles_c.txt` and `cycles_cpp.txt`. Generated disassembly lives beside each
source in its `asm` directory.

Build with `cmake --build build --target avm_bench_run`. To time one language
without rerunning the tests or instruction image, build `avm_bench` and run
`build/avm_bench --c-only` or `build/avm_bench --cpp-only`. The `--instruction-only`
mode is available for the assembly image.

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
| Integer lowering | `bit_count`, `count_leading_zeros`, `count_trailing_zeros`, `div_pow2`, `narrow_arithmetic`, `popcount`, `progmem_record_index`, `rotate32`, `wide_add_sub`, `wide_compare` |
| Floating point lowering | `float_comparisons`, `float_conversions` |
| Runtime float math | `math_sqrt`, `math_sin`, `math_cos`, `math_atan2`, `math_tan`, `math_exp`, `math_log`, `math_log2`, `math_log10`, `math_pow`, `math_hypot`, `math_fmod` |
| C++ lowering | `aggregate_byte_dispatch`, `aggregate_byte_packing`, `aggregate_byte_packing_hoisted`, `lambda_capture`, `member_pointers`, `scoped_lifetime`, `template_specialization`, `virtual_dispatch` |

Each `math_*` benchmark measures 32 calls. `math_sin`, `math_cos`, and `math_tan`
use the same 16 magnitudes with both signs, from 0.25 through the largest finite
binary32 value. Half the calls exercise large-angle reduction; the remaining
inputs cover the direct, special-case, and medium-angle paths. The volatile
input tables are initialized before timing; the timed loop loads each input,
calls the function, and accumulates its result. Other math benchmarks use inputs
from 0.25 to 1.21875.
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

`shifts`, `rotate32`, and `wide_shifts` measure the runtime 32-bit variable-shift
helpers. `register_cleanup` exercises an inline widening shift of a word by a
variable count in 0..7 under register pressure.

Keep setup outside the measured interval and make the result depend on
runtime data. New sources are discovered by CMake and the runner automatically;
each source should contain exactly one pair of debug breaks.
