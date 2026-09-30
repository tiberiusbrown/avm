## Git changes

Never create Git commits or push changes in this repository or its submodules. Leave all code and test changes uncommitted. A request to update CI, run CI, or fix tests does not authorize committing or pushing. If remote CI requires a push, report that limitation to the user instead of pushing.

## Development

When developing code generation functionality in the LLVM AVM backend, refer to
`bench/cycles_instruction.txt` to help select the fastest instruction.

AVM code pointers are 24 bits and all types have byte alignment. Preserve
24-bit code addresses in stored values and ABI layouts whenever possible;
do not widen them to 32 bits merely for code generation convenience. If
24-bit operations are difficult to lower, address that limitation in the AVM
machine backend/ISA instead of changing the pointer representation. Document
any unavoidable wider representation and track the backend limitation.

## Building

When building or running any target, always use RelWithDebInfo configuration.

Build through CMake rather than invoking Ninja, MSBuild, or another backend directly:

```sh
cmake --build build --parallel
```

Preserve the existing CMake generator and compiler unless explicitly asked to change them.

On Windows, if the configured generator is Ninja or Ninja Multi-Config and the compiler is MSVC (`cl.exe`), ensure the matching MSVC developer environment is initialized before building. Match the Visual Studio/MSVC installation recorded in `build/CMakeCache.txt`; using a different MSVC version can cause ABI/linker errors. Missing setup commonly causes errors for headers such as `vector`, `stdio.h`, `stdint.h`, or `windows.h`.

When needed, locate Visual Studio with `vswhere.exe`, call `vcvars64.bat` or `VsDevCmd.bat`, and run `cmake --build` from that same shell. Do not hard-code Visual Studio, MSVC, or Windows SDK versions, and do not add toolchain header paths to `CMakeLists.txt`.

Do not perform MSVC environment setup on non-Windows systems, for non-MSVC compilers, or for Visual Studio/MSBuild generator builds unless required.

## Tests

Run the tests while developing.
If any modifications were made to code generation, run the benchmarks after everything is finished.
Retain benchmark disassemblies -- they are intended to be committed as well.
C and C++ test disassemblies are not generated or checked into the repository.
