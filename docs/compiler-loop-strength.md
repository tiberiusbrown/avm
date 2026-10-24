# Affine record traversal and bounded multiplication

The RPG actor scan indexes eight 18-byte NPC records while retaining the slot
number for its draw-order array. Its inner insertion search makes this an
outer loop. LLVM's generic loop strength reduction skips outer loops, leaving
an index multiply and a base add on every iteration. In an innermost loop,
generic LSR can also retain a separate scaled offset and base register.

AVM now reduces these addresses in LLVM IR, using ScalarEvolution's affine
pointer recurrences and SCEVExpander. It runs after CodeGenPrepare, before
instruction selection. A shared pointer advances once at the loop latch;
constant-offset fields use AVM's displaced loads and stores. Conditional
accesses and unrelated indirect accesses in a nested search do not prevent
reducing the affine stream. No machine peephole pass recognizes or rewrites
the multiplication sequence.

The policy adds at most one stream per loop and declines loops with more than
four words of loop-carried PHIs, reserving space in AVM's eight word registers
for invariants, temporaries and nested loops. Existing pointer recurrences are
left alone. Candidates require a simplified loop, a unique latch, a known
maximum trip count of at least two, and a constant stride in -128..127 other
than -2..2. The pass handles ordinary RAM byte and word accesses. Program
memory and its 24-bit pointer representation are unaffected. Loops with wider
or mixed-space varying accesses are declined: converting just their narrow
fields can leave both old and new address recurrences live, increasing spills.

For multiplications that remain, ScalarEvolution's unsigned range proofs are
recorded on the original word values. Instruction selection recovers those
facts when importing their virtual registers, so bounded word PHIs can
qualify for an unsigned byte multiply without truncation instructions. A
small trip count alone is insufficient: indices 254..258 still require a
word multiply.

Newly recovered word ranges admit both multiply encodings, so a flexible
multiply pseudo preserves the full register
class. Its ordinary expansion uses `mulu8.w` if both allocated registers are
in r4..r7 and `mul16` otherwise. This prevents an eight-cycle instruction
saving from forcing induction values into spills. Byte truncations whose
high bits are unknown retain the existing constrained byte operation.

Measured with the RelWithDebInfo toolchain, `-O2` guest compilation and the
AVM interpreter's adjacent-debug-break baseline subtraction:

| Benchmark | Before cycles | After cycles | Change |
| --- | ---: | ---: | ---: |
| `record_stride` | 144,721 | 144,721 | unchanged |
| `record_stride_nested` | 412,329 | 393,095 | -4.66% |
| `bounded_multiply` | 286,067 | 286,067 | unchanged |

All eight existing C++ timings and 85 of the 86 existing C timings are
unchanged. `string_scan` changes from 25,921,489 to 25,938,058 cycles (+0.064%);
its updated disassembly is retained alongside the new benchmark disassemblies.

Forcing the bounded multiply into upper registers initially took 298,076
cycles and introduced induction-variable spills. The flexible form preserves
the baseline allocation in that case while retaining the narrow encoding in
the existing low-pressure widening-byte-multiply tests.

Backend tests cover shared fields, nested and descending recurrences, the
pressure guard, bounded and wide indices, and both physical-register
expansions of the flexible multiply. The end-to-end `loop_record_stride`
fixture checks traversal and sorted slots at `-O0`, `-O1`, `-O2`, `-O3`, `-Os`
and `-Oz`. The three benchmark sources and generated disassemblies are
retained in their usual suite locations.
