# AVM end-to-end tests

`cmake --build build --target avm_tests_run` builds and runs every assembly,
C, and C++ fixture. Each C and C++ source is compiled separately at `-O0`,
`-O1`, `-O2`, `-O3`, `-Os`, and `-Oz`; assembly fixtures run once.

The linked test images remain under `build/tests/`. C and C++ test disassemblies
are not generated or checked into the repository.

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
