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

## Proven indirect-call targets

AVM executable LTO links use closed-world visibility: no dynamically linked
derived classes can appear later. With full LTO (`-flto` or `-flto=full`),
Clang enables whole-program vtable metadata by default. LLVM's whole-program
devirtualization analysis preserves a complete `!callees` set when a virtual
call has several possible implementations and must remain indirect. The
explicit `-fno-whole-program-vtables` option disables this default.
Compile all C++ translation units with full LTO and vtable metadata for this
proof. If native objects define vtables, or a combined IR module contains
unannotated vtable definitions, automatic analysis conservatively leaves the
virtual calls unknown.

Before machine code generation, LLVM's called-value propagation also proves
small function-pointer sets through selects, PHIs, internal function arguments
and returns, and supported scalar globals. Full LTO makes this analysis operate
on the combined program. Its existing limit is four functions per propagated
value; larger or unsupported values remain unknown rather than being truncated.
The virtual-call target sets are not subject to this propagation limit.

For a proven set, the backend emits one alternative stack edge per candidate
using the ordinary nine-byte records. LLD follows all candidates and takes the
maximum, including finalized frames, outgoing arguments and actual tail-call
behavior. Any overflowing candidate fails the link. A recursive candidate or
one with missing metadata still makes the bound incomplete. The target-set
operands exist only in compiler metadata; stored code addresses remain 24 bits
and the final image contains no target-set tables or extra dispatch operations.

Closed-world visibility does not itself prove arbitrary pointer flow. Unknown
memory loads, integer-derived pointers and opaque assembly remain gaps. ThinLTO
does not yet export multi-target virtual-call sets between its partitions;
use full LTO for that analysis. Constructor/destructor table dispatch and the
local destructor registry still need dedicated table/registry analysis; their
callbacks continue to be checked independently as described below.

## Optional gap diagnostics

Use `--avm-print-stack-gaps` with `avm-ld` to report why reachable paths are
incomplete. It is independent of `--avm-print-stack-usage` and off by default:

```sh
avm-ld --avm-print-stack-usage --avm-print-stack-gaps --avm-stack-gap-limit=5 ...
avm-clang -Wl,--avm-print-stack-gaps,--avm-stack-gap-limit=5 ...
```

`--avm-stack-gap-limit=N` caps the number of witness paths printed. Its default
is 10; zero prints only the summary count. The limit alone does not enable the
report. The summary always gives the total gap count, paths shown, and omitted
count, so truncation cannot be mistaken for complete coverage. Negative or
invalid limits are rejected. Relocatable (`-r`) links retain metadata for final
analysis and do not print gap diagnostics.

Each report names a function and a local cause: missing frame/call metadata,
an unresolved indirect or unavailable direct call target, a recursive
continuation, or a compiler-marked incomplete function. The current compiler
marker combines dynamic allocation and opaque inline assembly, so the report
does not claim to distinguish those two causes. Unknown call targets have no
callee frame cost to report.

One shortest route from an entry or callback root accompanies each gap, showing
fixed frames, outgoing arguments, return records, and tail-frame releases.
The known stack at the gap is a lower bound for that witness, not the largest
possible caller stack or a bound on the unknown continuation. It is not a
measurement of spare stack space. Metadata currently identifies call edges by
caller and callee, not source line or instruction address.

Shared gaps are reported once per function cause or call edge rather than once
per caller route. A recursive back edge represents the unresolved continuation
of its cycle; the analyzer does not enumerate arbitrary recursion depths.
Independent reachable gaps remain visible even when they are not on the largest
known stack path. Unreachable functions are excluded with or without section
GC. The traversal is iterative, and limiting output does not suppress counting
or existing overflow checks. Reports have no AVM image or runtime cost.

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
