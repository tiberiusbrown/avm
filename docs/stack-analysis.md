# AVM link-time stack analysis

Normal `avm-clang` and `avm-ld` executable links check the 256-byte VM stack
inside LLD, after LTO and section garbage collection. There is no extra build
step. Exactly 256 bytes succeeds; a concrete path over 256 bytes fails with
the functions, finalized frames, outgoing arguments and return records shown.
The backend also retains its early check for an individual oversized frame.

Use `-Wl,--avm-print-stack-usage` with `avm-clang`, or
`--avm-print-stack-usage` with `avm-ld`, to print the largest proven path on a
successful link. `complete bound: no` means the number is a lower bound, not
a guarantee that execution fits. Recursive calls, unresolved indirect calls,
dynamic allocas, opaque inline assembly and objects without frame metadata
can make a bound incomplete. These do not themselves fail linking. Their
known fixed costs and independent direct paths still participate in overflow
checking. Rebuild old objects to get automatic metadata.

For an ordinary call, the peak is the caller's fixed frame plus that
callsite's outgoing argument area, a three-byte return record and the callee's
peak. Fixed frames include finalized register and callee-save spills and
scavenger slots; outgoing areas are dynamically allocated and counted once.
The ELF entry is entered by the loader without a return record. The linker
also checks callback lower bounds for function addresses in live allocated
data, including constructors and destructors in init/fini arrays. Their
invoking indirect calls remain incomplete: the linker does not infer a
callback's caller or a target set from an arbitrary stored function pointer.
Only functions reachable from these roots are checked, even without GC.

SCC detection and longest-path evaluation use iterative traversals and linear
graph storage. Acyclic direct graphs have exact bounds. In a recursive graph,
DFS back edges terminate at the target's known fixed frame and mark the bound
incomplete; other edges retain concrete finite paths. This proves finite
prefixes and independent overflow paths without choosing a recursion depth or
claiming a maximum within recursive components. Unknown targets still include
the known caller, argument and ordinary-call return-record costs.

`SYS` instructions cross into the native interpreter and do not push an AVM
return record. Interpreter AVR hardware-stack pushes and pops are excluded.
SelectionDAG call lowering disables tail calls, including calls in IR tail
position. Final machine control-flow cleanup can nevertheless turn a
frameless call followed by a return into a genuine jump. Metadata describes
these actual transfers as tail edges: LLD compares the caller peak with the
callee peak after releasing the caller frame, without adding an ordinary-call
return record. A tail-position call that still has a live frame or outgoing
argument area remains an ordinary call.

## ELF metadata

LLVM automatically emits `.stack_sizes` using the finalized machine frame.
AVM supplements the generic emitter for dynamic allocas with the known fixed
frame and an incomplete marker. Each function's `.avm.stackcalls` records are
emitted after its body. Each nine-byte record contains:

| Offset | Field |
| --- | --- |
| 0 | Caller ELF text address, three bytes, `R_AVM_DEBUG24` relocation |
| 3 | Direct callee ELF text address, three bytes, or zero for indirect calls |
| 6 | Outgoing argument bytes, two bytes, little endian |
| 8 | Flags: 1 = indirect, 2 = true tail transfer, 4 = incomplete, 8 = function marker |

Every generated function has a function marker, including leaves, certifying
that its machine calls were recorded. A marker has zero callee and argument
fields and represents no call; adding flag 4 marks it incomplete. This avoids
claiming completeness for legacy objects with only `.stack_sizes`.
`.3byte` emits raw three-byte ELF addresses for analysis and debug
metadata; `.progptr` continues to emit packed interpreter program pointers.

Both metadata sections use `SHF_LINK_ORDER` and the defining text section's
COMDAT group, following LLVM's existing `.stack_sizes` convention. Relocations
are resolved by section and offset before relaxation, so local functions,
aliases and multiple functions in one text section are supported. Metadata
does not keep dead text alive. Relocatable (`-r`) links retain the records for
a later executable link. Executable links consume both sections, including
their relocation sections, so the final ELF/image has no metadata or runtime
cost. The report flag prints a diagnostic; it does not retain metadata.

The shared ABI constants and metadata flags are defined in
`llvm/include/llvm/BinaryFormat/AVM.h` in the LLVM fork.
