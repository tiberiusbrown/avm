## Git changes

Never create Git commits or push changes in this repository or its submodules. Leave all code and test changes uncommitted. A request to update CI, run CI, or fix tests does not authorize committing or pushing. If remote CI requires a push, report that limitation to the user instead of pushing.

## Documentation

Documentation exists in the `docs/` directory. Do not create new documents or directories inside `docs/` unless explicitly directed. All documentation files should be in Markdown (`.md`) format. Keep existing documentation up to date with new changes as needed.

Keep `docs/c23-compliance-gaps.md` and `docs/cpp23-compliance-gap.md` current whenever compiler, ABI, runtime, or header changes affect relevant support. Update them in the same change using these rules:

- Preserve the existing section structure and `- [ ]` checklist format. Keep freestanding requirements separate from additional hosted requirements.
- List only support that is still missing. Do not describe implemented features, add completion summaries or historical notes, or retain resolved items as checked boxes.
- Remove fully resolved gaps and any section headings left empty. Narrow partially resolved entries to the remaining missing requirements without describing the completed portion.
- Add newly identified gaps. Preserve outstanding requirements even when related interfaces have been implemented.
- Verify required linking, execution, and semantics before removing a gap; declarations or macros alone are not sufficient evidence.
- If the tracker is absent, report that rather than recreating it from memory.

## Development

AVM `math.h` functions are never required to exceed avr-libc's precision.
Use it as the precision baseline; choose faster algorithms when available and
reuse existing native floating-point helpers.
Confirm before adding wider native arithmetic solely for extra precision.

When developing code generation functionality in the LLVM AVM backend, refer to
`bench/cycles_instruction.txt` to help select the fastest instruction.

AVM code pointers are 24 bits and all types have byte alignment. Preserve
24-bit code addresses in stored values and ABI layouts whenever possible;
do not widen them to 32 bits merely for code generation convenience. If
24-bit operations are difficult to lower, address that limitation in the AVM
machine backend/ISA instead of changing the pointer representation. Document
any unavoidable wider representation and track the backend limitation.

## Building

Build inside `build/` only.

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

## Display captures

When exporting routine `avm-lldb` display captures for visual inspection or
review, explicitly use `avm display save <path.pgm> --mode logical` (or the
`capture` alias). This preserves the game framebuffer orientation. With
normal OLED initialization, `--mode controller` exports horizontally mirrored
pixels because Ardens applies segment remapping to its controller RAM. See
[docs/lldb.md](../docs/lldb.md) for capture modes and timing differences.
