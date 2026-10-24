# AVM end-to-end tests

`cmake --build build --target avm_tests_run` builds and runs every assembly,
C, and C++ fixture. Each C and C++ source is compiled separately at `-O0`,
`-O1`, `-O2`, `-O3`, `-Os`, and `-Oz`; assembly fixtures run once.

The linked test images remain under `build/tests/`. C and C++ test disassemblies
are not generated or checked into the repository.

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

`widening_byte_multiply` checks signed, unsigned and mixed byte products against
an independent shift/add reference at every standard optimization level. It
covers every left byte with signed/unsigned boundary values on the right,
program-memory loads, a shared signed full-word use, and hoisted coefficients
that exceed the register file and require spills.

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
See [shortcut measurements and emulator limits](../docs/bootloader-shortcut.md).
