# Assembly-to-image testing

All commands use the repository's Debug build. On Windows, first enter the
matching Visual Studio developer environment recorded in `build/CMakeCache.txt`.

```powershell
cmake -S . -B build -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=AVM
cmake --build build --config Debug --target llvm-mc llvm-readobj llvm-objdump llvm-avm-image

build/llvm-build/bin/llvm-mc.exe -triple=avm-unknown-arduboyfx -filetype=obj smoke.s -o smoke.o
build/llvm-build/bin/llvm-readobj.exe -h -S -s smoke.o
build/llvm-build/bin/llvm-objdump.exe -d smoke.o
build/llvm-build/bin/llvm-avm-image.exe create smoke.o -o smoke.bin
build/llvm-build/bin/llvm-avm-image.exe validate smoke.bin
build/llvm-build/bin/llvm-avm-image.exe inspect smoke.bin
```

Until the integrated instruction parser is complete, `smoke.s` must use
architecturally valid `.byte` directives, for example an aligned `_start`
containing `0xF4, 0xF3` (`NOP`) and `0xFF` (`RET`). This limitation is tracked
as an open issue and prevents claiming completion of the full Step 10 syntax.

An Arduboy simulator may be given the resulting `smoke.bin` only if it supports
the AVM Version 1 header and tail defined by `docs/arch.md`. Record the exact
simulator command and result; image validation alone is not simulator execution.
