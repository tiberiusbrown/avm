# AVM end-to-end tests

`cmake --build build --target avm_tests_run` builds and runs every assembly,
C, and C++ fixture. Each C and C++ source is compiled separately at `-O0`,
`-O1`, `-O2`, `-O3`, `-Os`, and `-Oz`; assembly fixtures run once.

The linked test images remain under `build/tests/`. Test disassemblies are not
generated or checked into the repository.

`cmake --build build --config RelWithDebInfo --target avm_push16_tests_run`
runs focused native-emulator tests independently. They execute all `B0-B7`
push and `B8-BF` pop encodings with every C/Z/S combination, assert exact
19/18-cycle cadences, and check PUSH's valid lower boundary and fatal
post-write overflows. These checks also run as part of `avm_tests_run`.

Scratch-stack fixtures use `0x0980`, or `0x0920` when their stack-relative
address probes need room above SP. Their register snapshots and output helpers
therefore remain within the valid stack during checked pushes. The relocated
address probes retain their original offsets and canaries; `LEASP` and `STSP8`
expected output accounts for the new addresses. Stackless fixtures and explicit
`SETSP`/`ADJSP` arithmetic tests retain their original addresses.

Multi-file C++ fixtures keep helper translation units in `tests/cpp/support/`.
The top-level `.cpp` file supplies `avm_test_main()` and its adjacent
`_output.txt` file supplies the expected serial output.
