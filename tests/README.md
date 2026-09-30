# AVM end-to-end tests

`cmake --build build --target avm_tests_run` builds and runs every assembly,
C, and C++ fixture. Each C and C++ source is compiled separately at `-O0`,
`-O1`, `-O2`, `-O3`, `-Os`, and `-Oz`; assembly fixtures run once.

The linked test images remain under `build/tests/`. Test disassemblies are not
generated or checked into the repository.

Multi-file C++ fixtures keep helper translation units in `tests/cpp/support/`.
The top-level `.cpp` file supplies `avm_test_main()` and its adjacent
`_output.txt` file supplies the expected serial output.
