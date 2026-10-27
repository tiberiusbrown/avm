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

Before machine code generation, LLVM's called-value propagation and AVM's
field-sensitive memory analysis prove function-pointer sets through selects,
PHIs, internal function arguments and returns, scalar/aggregate globals, object
fields, aliases, and constant-size memory copies. Full LTO makes this analysis
operate on the combined program. Memory analysis tracks an allocation or global
and a byte offset; writes to another field do not contaminate a pointer field.
Variable offsets, partial pointer writes, volatile/atomic accesses, unsupported
pointer representations, and unknown writers remain conservative. Escaping
objects can be modified by unmodeled calls; their affected loads become unknown.

Memory analysis defaults to 32 functions or locations per proven value and 256
fixed-point iterations. `-mllvm -avm-stack-target-limit=N` and
`-mllvm -avm-stack-analysis-iterations=N` configure native Clang compilation;
use `-Wl,-mllvm=-avm-stack-target-limit=N` and
`-Wl,-mllvm=-avm-stack-analysis-iterations=N` for LTO links. Exhausting either
limit leaves the continuation unknown; candidate lists are never truncated
into a proof, and a partial fixed point is never used as a complete set.
Gap diagnostics distinguish unsupported/unknown flow, target limits, and
iteration limits. Existing LLVM proofs (including virtual-call metadata and
called-value propagation's small sets) remain valid independently of these
additional analysis limits. These settings do not limit diagnostic path output.

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
use full LTO for that analysis.

## Constructor and destructor dispatch

The runtime uses `__builtin_avm_stack_dispatch(fn, kind)` to preserve its
dispatch contracts through inlining, LTO, and machine tail-call rewrites.
`__builtin_avm_termination_context()` reserves and zero-initializes a two-byte
phase word in the raw `_start` frame. The backend exports its finalized absolute
address as `__avm_crt_termination_phase`; the linker aliases the optional
termination registry's phase to it. No pointer to this word or extra phase word
is stored in static RAM. This reservation participates in finalized frames and
normal stack bounds, including when no termination registry is linked.

Kinds 0 and 1 dispatch the standard init/fini arrays; kind 2 dispatches only
callbacks registered through `__avm_register_local_dtor` or `atexit`; kind 3
performs a null-guarded weak-hook call. The builtin emits the ordinary call and metadata,
with a runtime null check for kind 3. It is a runtime contract, not a way to
assert an arbitrary pointer has known targets.

For the default AVM layout, LLD connects each array dispatch to every live
relocated entry, including priority subsections and COMDAT/GC selection.
Callbacks execute sequentially, so analysis takes their maximum with the actual
caller's frame, outgoing arguments, and return record. Empty arrays add no
edges. Raw/unresolved entries, explicitly overridden array bounds, and custom
SECTIONS layouts retain an unknown continuation. Custom layout support needs
a later analysis of the actual output ranges.

Each local destructor or `atexit` registration emits link-order target metadata.
Registration boundaries remain uninlined through full LTO. Local-static slots
remain five bytes; plain C callback slots remain three bytes. LLD unions the
candidates from live registering code and checks all of them at registry
dispatches. Unknown or unannotated
registrations keep dispatch incomplete. Registration phases are conservatively
merged; recursive destructors remain incomplete. This contract assumes the
standard shared termination registry and exclusive writes through registration.
A runtime pointer passed to `atexit` remains unknown unless compiler pointer analysis proves its
entire target set. Dead registering sections and their analysis records disappear
together under GC. Shared dispatch includes callback frames, outgoing arguments
and actual return records in the 256-byte overflow check. Registration from a
callback may create conservative recursive analysis paths without implying
recursive execution of callbacks by the runtime LIFO.

An absent undefined weak hook is skipped only when metadata proves a non-null
guard (either kind 3 or a dominating IR control-flow edge). An unguarded weak
call continues to be reported as unavailable.

## Inline assembly

Inline assembly is automatically certified for stack analysis when its parsed
AVM instructions neither modify SP nor introduce an untracked control transfer.
The check runs after operand substitution and uses the target assembler and
instruction descriptors, including implicit register definitions. Empty assembly,
arithmetic, reads of SP, stack-relative memory accesses, and defined system
services can pass. Branches and loops pass only when every destination is an
exact label within the same assembly block.

Push/pop, stack adjustment, writes to SP, calls, returns, indirect jumps, and
external or unresolved branch destinations retain the incomplete marker. Even
balanced push/pop pairs need additional peak accounting and remain unsupported.
Raw bytes, assembler directives, and macro invocations also remain opaque;
macros defined earlier cannot disguise a stack operation as an ordinary mnemonic.
Certification uses an isolated assembler context and does not change emitted code.

Every block in a function must pass. Compiler-generated spills and saved registers
are already included in its finalized frame; dynamic allocation independently
keeps the function incomplete. Stack certification does not relax assembly's
declared memory effects or the separate function-pointer flow analysis.

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
invoking calls are connected only when compiler pointer analysis or a runtime
dispatch contract proves the target set. The linker does not infer a callback's
caller from an arbitrary stored function pointer.
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
| 3 | Direct callee ELF text address, three bytes, or an indirect gap reason code |
| 6 | Outgoing argument bytes, two bytes, little endian |
| 8 | Flags: 1 = indirect, 2 = true tail transfer, 4 = incomplete, 8 = function marker, 16 = init array, 32 = fini array, 64 = local registry, 128 = guarded weak hook |

Indirect gap codes are 0 (unspecified/legacy), 1 (unsupported or unknown pointer
flow), 2 (target limit), and 3 (iteration limit). Dispatch flags are exclusive;
array/registry flags require an indirect call, while a guarded weak hook can be
direct or indirect. A separate `.avm.stackdtors` section contains seven-byte
records: relocated caller (3), relocated registered target or zero (3), and
kind (1). Each registration starts with kind 2, followed by candidate records
of kind 0 or an unknown record of kind 1. These sections follow the registering
text through GC and relocatable links and are consumed by final executable links.

Every generated function has a function marker, including leaves, certifying
that its machine calls were recorded. A marker has zero callee and argument
fields and represents no call; adding flag 4 marks it incomplete. This avoids
claiming completeness for legacy objects with only `.stack_sizes`.
`.3byte` emits raw three-byte ELF addresses for analysis and debug
metadata; `.progptr` continues to emit packed interpreter program pointers.

All metadata sections use `SHF_LINK_ORDER` and the defining text section's
COMDAT group, following LLVM's existing `.stack_sizes` convention. Relocations
are resolved by section and offset before relaxation, so local functions,
aliases and multiple functions in one text section are supported. Metadata
does not keep dead text alive. Relocatable (`-r`) links retain the records for
a later executable link. Executable links consume these sections, including
their relocation sections, so the final ELF/image has no metadata or runtime
cost. The report flag prints a diagnostic; it does not retain metadata.

The shared ABI constants and metadata flags are defined in
`llvm/include/llvm/BinaryFormat/AVM.h` in the LLVM fork.
