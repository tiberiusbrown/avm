# AVM end-to-end tests

`cmake --build build --target avm_tests_run` builds and runs every assembly,
C, and C++ fixture. Each C and C++ source is compiled separately at `-O0`,
`-O1`, `-O2`, `-O3`, `-Os`, and `-Oz`; assembly fixtures run once.

The build writes one disassembly per compiled fixture and optimization level to
`tests/c/asm/<level>/` or `tests/cpp/asm/<level>/`. These generated files are
checked into the repository. Regenerate them with the build command above when
changing a fixture or the compiler. The linked images remain under `build/tests/`.

Multi-file C++ fixtures keep helper translation units in `tests/cpp/support/`.
The top-level `.cpp` file supplies `avm_test_main()` and its adjacent
`_output.txt` file supplies the expected serial output.
