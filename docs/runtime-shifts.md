# 32-bit runtime shifts

The three 32-bit shift helpers in `runtime/builtins/integer.c` use the two
16-bit words of the value instead of dispatching a single-bit shift and loop
control once per bit. The helpers keep the value in `q2` and the count in
`q3`, using only the four caller-clobbered compact registers. They have no
spills, callee-save pushes, or fixed stack frame.

For counts 1 through 15, two word shifts and one cross-word shift produce the
result. The count register is reused for `16 - count` after both shifts by
the original count. Counts 16 through 31 need one variable word shift by
`count - 16`; exactly 16 uses the ISA's defined zero-count word shift.
Zero returns the input unchanged. Counts at or above 32 return zero for left
and logical-right shifts and sign fill for arithmetic-right shifts. Both
words of the count are checked before reusing the high word as scratch, so
large counts cannot truncate into a valid small shift.

The existing SelectionDAG constant-shift lowering handles every defined
constant count directly, including native single-bit pair operations and
16-bit immediate shifts and word transfers. No compiler implementation
change or peephole pass is needed for this runtime improvement.

## Measurements

Measured with the same RelWithDebInfo toolchain and interpreter, the normal
`-O2` benchmark compilation, and the adjacent-break baseline subtracted:

| Benchmark | Before cycles | After cycles | Reduction |
| --- | ---: | ---: | ---: |
| `shifts.c` | 518,677 | 395,573 | 23.73% |
| `rotate32.c` | 4,473,141 | 1,536,045 | 65.66% |
| `register_cleanup.c` | 4,056,017 | 3,148,973 | 22.36% |
| `wide_shifts.c` | 542,283 | 220,811 | 59.28% |

The other 85 C benchmarks and all eight C++ benchmarks have identical cycle
counts. Updated disassemblies and C cycle results are retained under `bench/`.

## Correctness and stack analysis

`tests/c/shift32_helpers.c` compares all three helpers, compiler-generated
variable shifts, and literal-count source shifts against an independent
single-bit word reference at all six standard optimization levels. Inputs
include zero, both signs, word-boundary patterns, every walking bit and its
complement, all counts 0 through 33, and large counts with nonzero upper
words. Source expressions only use counts 0 through 31.

`llvm/test/CodeGen/AVM/i32-constant-shifts.ll` in the LLVM submodule checks
every constant count 0 through 31 for each operation at `-O0` and `-O2`, with
machine-instruction verification, and rejects helper calls.

Every branch in each runtime assembly block targets a label within that same
block. The existing assembler-based stack certification therefore retains a
complete function marker. Linking each helper as the entry reports a complete
bound of zero bytes and zero stack-analysis gaps. Linking the complete C
fixture at `-O2` reports a complete bound of 65 bytes and zero gaps.

The LLVM and LLD `stack-inline-asm.ll` tests also cover the variable word
shift instructions. LLD verifies complete bounds through safe assembly,
retains incomplete diagnostics for opaque assembly, and rejects a caller
path above 256 bytes through an assembly-using callee in both native-object
and full-LTO links.

Validation passed: `avm_tests_run` (525 guest fixtures plus its native stack,
audio, display, timer, and asset checks) and all 16 selected stack-analysis
and constant-shift LLVM/LLD tests.
