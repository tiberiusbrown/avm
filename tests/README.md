# AVM end-to-end tests

`cmake --build build --target avm_tests_run` builds and runs every assembly,
C, and C++ fixture. Each C and C++ source is compiled separately at `-O0`,
`-O1`, `-O2`, `-O3`, `-Os`, and `-Oz`; assembly fixtures run once.

Each fixture has a default limit of 60 emulated seconds. The CMake cache setting
`AVM_TEST_ADVANCE_LIMIT` and the runner's `--advance-limit` option use picoseconds
(`60000000000000` by default). The `draw_text_clipping` reference renderer needs
about 25 emulated seconds at `-O0`, exceeding the former 20-second limit.

The linked test images remain under `build/tests/`. C and C++ test disassemblies
are not generated or checked into the repository.

The `math_*f` fixtures check 2,702 numeric vectors at all six optimization
levels, including signed zero, NaNs, infinities, subnormals, rounding boundaries,
and large trig arguments across every binary32 exponent. Exact operations use
bit comparisons; transcendental tolerances are explicit in each vector.
`math_builtins` also checks compatibility builtins against ordinary C ABI calls.
`avm_math_reference_tests_run` checks the production sqrt kernel on every
normalized binary32 mantissa/exponent-parity combination, plus random finite
patterns and a subnormal sweep, against double sqrt rounded to float. These
checks run within `avm_tests_run`. The same target checks all 8,388,608 normalized
binary32 mantissas of the large-angle reducer's full 280-bit integer product
against an independent reference using 32-bit limbs and 64-bit arithmetic. See the
[math study](../docs/math-runtime-tradeoff.md) for scope and measured results.

`cmake --build build --config RelWithDebInfo --target avm_audio_tests_run`
checks native sequencing, sample synthesis, register preservation, SPI reads
interrupted by Timer1, cycle costs, atomic chords, and the animated demo with
simulated A/B presses. It also runs the standard-library Python asset tests and
assembles Mini/FX-C firmware presets. These checks and the C audio fixture run
within `avm_tests_run`. See [audio measurements](../docs/audio-benchmarks.md).

Audio checks also cover the global tonal low-pass defaults, lifetime, all byte
coefficients and both rates, byte mixing, noise bypass, decay to silence,
register/flag preservation and interrupt timing. Optional renderer validation
(`python tests/audio/validate_stage2_renderer.py`) compares bypass and three presets
against actual AVR synthesis; it requires NumPy and SciPy.

`cmake --build build --config RelWithDebInfo --target avm_push16_tests_run`
runs focused native-emulator tests independently. They execute all `B0-B7`
push and `B8-BF` pop encodings with every C/Z/S combination, assert exact
19/18-cycle cadences, and check PUSH's valid lower boundary and fatal
post-write overflows. These checks also run as part of `avm_tests_run`.

`cmake --build build --config RelWithDebInfo --target avm_stack_bounds_tests_run`
runs 1,133 focused native-emulator cases for CALL8/CALL16/CALLF, all four CALLP
encodings, signed ADJSP, and SETSP r0-r7. Every C/Z/S combination is covered.
Calls check their three-byte return record, exact floor, post-write overflows,
callee/RET behavior, and 8/16/24-bit return-PC carries. ADJSP and SETSP check
the inclusive `0x0900..0x0A00` interval without guest-memory writes, including
positive ADJSP over-top failures. Fatal cases assert that the shared loop stays
stable and executes no further guest instruction. Valid-path timings are
asserted for every specialized form. The target also runs within `avm_tests_run`;
its assembly symbol listing is generated only under `build/tests/interp/`.

Scratch-stack fixtures use `0x0980`, or `0x0920` when their stack-relative
address probes need room above SP. Their register snapshots and output helpers
therefore remain within the valid stack during checked pushes. The relocated
address probes retain their original offsets and canaries; `LEASP` and `STSP8`
expected output accounts for the new addresses. Stackless upper-register
fixtures also use `0x0980` so SETSP establishes a valid SP, with their original
address offsets and canaries retained. ADJSP fixtures exercise signed
adjustments within the valid interval and both inclusive endpoints. LEASP's
explicit upper-address probe computes `0x0AFF` from valid SP `0x0A00` without
changing SP; invalid assignments and adjustments belong to the focused fatal
tests above.

Multi-file C++ fixtures keep helper translation units in `tests/cpp/support/`.
The top-level `.cpp` file supplies `avm_test_main()` and its adjacent
`_output.txt` file supplies the expected serial output.

`loop_record_stride` checks 18-byte record traversal with empty and nonempty
bounds, conditional fields, reverse traversal and nested stable insertion of
record slots. It also checks multiplication with indices below and above 255.
The fixture runs at every standard optimization level.

`shift32_helpers` checks all three 32-bit shift helpers and compiler-generated
variable and constant shifts against an independent single-bit reference. It
covers every count from 0 through 33, word-boundary patterns, every walking bit
and its complement, and large 32-bit counts that must not truncate to a valid count.
The fixture runs at every standard optimization level.

`bounded_shift32` checks widening left shifts of words, masked words and bytes
with bounded variable counts. An independent single-bit reference covers zero,
every count through 15, walking bits and their complements, all byte inputs,
nonzero ranges and wide counts with high bits set before masking. The fixture
runs at every standard optimization level.

`widening_byte_multiply` checks signed, unsigned and mixed byte products against
an independent shift/add reference at every standard optimization level. It
covers every left byte with signed/unsigned boundary values on the right,
program-memory loads, a shared signed full-word use, and hoisted coefficients
that exceed the register file and require spills.

`mul_i32_narrow` checks unsigned and signed narrow products at all six optimization
levels. Every signed byte is tested with constants 6, 257, 511, 513 and -257,
positive variable factors, zero factors and signed byte boundary factors against
an independent addition reference. Signed-word boundaries ensure wider products
retain their high words; program-record indexing checks 24-bit pointer layouts.

`shared_data_bases` checks byte and word windows with runtime indices, displaced
reads and writes, negative offsets and signed arithmetic. Separate reference
accesses check every result at all six optimization levels, including a
sixteen-tap FIR with hoisted coefficients that require spills.

`aggregate_byte_packing` checks construction, register arguments and returns for
two-, three-, and four-byte records, plus three-byte stack arguments. It covers
every byte value and truncation of word inputs with nonzero high bytes, and
checks general 32-bit bitwise operations against independent word results.

Timer1 arbitration is checked with simultaneous Timer0/Timer1 pending flags.
Startup tests cover inherited timer power gates, enables and Timer3 speaker ownership.

`cmake --build build --config RelWithDebInfo --target avm_timer0_tests_run`
executes the real Timer0 ISR on FX, Mini, FX-C, and two custom button wirings.
It checks millisecond carries, register/SREG preservation, 4 ms audio cadence
and saturation, all 64 button combinations, 32 ms polling, hold cancellation,
the 48-sample threshold, timed watchdog writes, and watchdog reset to the boot
fuse entry. A guest that only loops verifies the shortcut while Timer1 runs,
without guest SYS calls. These checks also run within `avm_tests_run`.
