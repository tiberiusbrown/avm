# AVM LLVM bring-up

## Baseline audit

The audited LLVM revision is `2e44caf7f250bafddfb88b9c7465a6711c319df1`.
Both the top-level repository and `deps/llvm-project` were clean at the start.
The existing patch already contained `Triple::avm`, private `EM_AVM = 0x4156`,
ELF/ObjectYAML recognition, the nine relocation names, minimal LLD dispatch, and
skeletal `TargetInfo` and `MCTargetDesc` libraries. The MC emitter emitted no
bytes, the printer was null, and no parser, disassembler, CodeGen component, or
image tool existed.

The existing build is Debug, Ninja, MSVC `cl.exe` from Visual Studio 18
Community toolset 14.51.36231, with LLD enabled and Clang disabled. AVM was
initially disabled. After adding coherent `LLVMAVMInfo`, `LLVMAVMDesc`, and
`LLVMAVMCodeGen` component structure, the same build directory was reconfigured
with `-DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=AVM`.

## Bring-up boundary

The target machine uses data layout
`e-m:e-p:16:8:8:16-p1:24:8:8:24-P1-G0-A0-i8:8:8-i16:8:8-i32:8:8-i64:8:8-f32:8:8-n8:16-S8`,
static relocation, and the large code model. Instruction selection deliberately
fails with a diagnostic: GlobalISel, SelectionDAG lowering, calling-convention
lowering, and frame lowering are outside this bring-up.

See `avm-llvm-open-issues.md` for incomplete integration work and verification
status.
