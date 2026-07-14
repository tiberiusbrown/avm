# AVM LLD-to-Image Migration Prompts

## Purpose

Use these prompts, in order, in one GPT-5.6 Sol Medium coding session. The end state is:

```text
C/C++/assembly sources
        ↓
AVM ELF32 relocatable objects, with fine-grained .text.* and .rodata.* sections
        ↓
ld.lld: symbol resolution, garbage collection, locality ordering, 64 KiB bank placement,
        relocation, relaxation, and ET_EXEC emission
        ↓
linked AVM ELF: authoritative addresses, symbols, and debug information
        ├── llvm-objdump / debugger
        └── llvm-avm-image: lightweight header/data/tail packer and validator
                ↓
             AVM .bin
```

The four prompts are intentionally implementation-oriented. There is no separate planning prompt. Later prompts assume the same conversation and working tree.

## Session rules

Include the following rules with Prompt 1; later prompts may rely on them:

- Work directly in the existing repository and inspect current code before editing.
- Treat the current architecture specification—especially its program-space, banking, ELF/linker, image-layout, and validation sections—and `docs/avm_isa.md` as authoritative.
- Preserve unrelated work and existing behavior unless the prompt explicitly replaces it.
- Prefer small AVM-specific hooks over broad changes to generic LLVM/LLD behavior.
- Add or adjust focused tests with each change. Run the narrow tests first, then the relevant build targets.
- Keep the tree buildable at the end of every prompt.
- Do not begin the next prompt. End with changed files, tests run, and any remaining limitation.

---

## Prompt 1 — Make linked AVM ELF the authoritative link product

```text
Implement the first stage of replacing llvm-avm-image's internal single-object linker with ld.lld.

Read the current AVM architecture spec, especially program space/banks and ELF/linker/image layout, plus docs/avm_isa.md. Inspect the existing AVM LLD target and llvm-avm-image before editing.

Make ld.lld produce a usable AVM ELF32 ET_EXEC from one or more AVM ET_REL objects, with a target-default layout when no linker script is supplied:

- Entry point is _start and e_entry is its final 24-bit logical program address.
- Writable .data has data-space VMA 0x0100; .bss immediately follows it; .data + .bss must not exceed 1024 bytes.
- The future image's .data initializer remains a special load payload beginning at logical/file offset 0x000100.
- programStart = align_up(0x000100 + SIZEOF(.data), 0x100).
- Program-resident allocatable sections start at programStart. Their linked addresses are logical AVM program addresses and therefore eventual image offsets.
- Support ordinary and separately sectioned inputs: .text, .text.*, .rodata, .rodata.*, constructor/destructor tables, and existing AVM metadata sections. Preserve executable versus read-only-data section flags in the linked ELF.
- Resolve symbols across multiple objects and apply all currently defined AVM relocations. Leave no dynamic relocations or unresolved allocatable references.
- Keep explicit user linker scripts working; apply the AVM default layout only when no script overrides it, while still diagnosing architecture violations.
- Ensure --gc-sections, COMDAT/group semantics, map files, and debug sections continue to work.

This step may initially lay program sections in deterministic input order and may restrict the complete program payload to bank 0. Do not implement locality ordering, multibank packing, or image generation yet.

Add focused LLD tests covering multi-object symbol resolution, .data/.bss VMAs, programStart, .text.* and .rodata.* handling, entry point, and overflow diagnostics. If the Clang driver cannot yet link AVM directly, use ld.lld in tests rather than expanding scope.

Follow the session rules. Stop after this stage.
```

---

## Prompt 2 — Add fine-grained locality ordering and complete 64 KiB bank support

```text
Continue from Prompt 1. Implement AVM-specific program-section layout in LLD so fine-grained code and read-only data can be rearranged for locality while satisfying the architecture's 64 KiB bank rules.

Treat each allocatable program-space input section as a placement atom. In normal compiler output this means .text.<function> and .rodata.<object>; unsplit .text or .rodata remains one indivisible atom. Preserve COMDAT/group membership, SHF_LINK_ORDER relationships, KEEP/script ordering, section alignment, symbol values, debug mappings, and garbage collection.

Implement a deterministic, target-specific ordering and packing policy:

- Prefer existing LLD call-graph/profile weights when present.
- Otherwise derive inexpensive affinity from resolved relocations: direct code-to-code edges are strongest, code-to-rodata edges next, and other program-space references weaker.
- Keep strongly related atoms close and preferably in the same bank; use stable object/input order as the tie-breaker.
- Preserve executable and non-executable section identity in the final ELF so llvm-objdump does not disassemble rodata as code.
- Pack atoms into logical 64 KiB banks. No executable atom/function, instruction, or possible fallthrough may cross a bank boundary. Diagnose an indivisible executable atom larger than one bank.
- Align address-taken functions, far targets, and veneers as required by docs/avm_isa.md.
- Fill unused program-address gaps with 0xFF in the eventual image contract and expose gaps correctly in the ELF layout.
- Validate R_AVM_BANK16 source/target bank equality after final placement instead of silently truncating to 16 bits.
- Implement the currently documented R_AVM_RELAX transformations and required cross-bank veneers after final layout. Use docs/avm_isa.md as the sole authority for near/far encodings and control bits; if a needed transformation is not specified, diagnose it rather than inventing an encoding.
- Reject layouts beyond the 24-bit logical program space and provide diagnostics naming the offending section/function and bank constraint.

Keep the implementation isolated to AVM where practical. A user linker script may constrain placement, but final AVM bank invariants must still be validated.

Add focused LLD tests for deterministic locality ordering, code with nearby referenced rodata, automatic movement of a function to the next bank, oversized-function failure, same-bank relocation failure, cross-bank calls/jumps and veneers, relaxation, section GC, and reproducible addresses. Use generated padding in tests rather than huge checked-in binaries.

Follow the session rules. Stop after this stage.
```

---

## Prompt 3 — Convert llvm-avm-image into a lightweight ET_EXEC packer

```text
Continue from Prompt 2. Refactor llvm-avm-image so ld.lld's AVM ELF32 ET_EXEC is the only authoritative linked input for image creation.

For `create`:

- Accept an AVM little-endian ELF32 ET_EXEC and reject ET_REL, wrong machine/type, unresolved relocations, or unsupported dynamic linking state.
- Do not resolve symbols, apply relocations, order sections, choose banks, or perform linker relaxation.
- Read e_entry as entryPoint.
- Derive dataSize from .data and staticSize from .data + .bss; require the linked VMAs to start at 0x0100 and be contiguous, with staticSize <= 1024.
- Synthesize the 256-byte AVM header and place .data contents at image offset 0x000100.
- Recompute programStart and require every allocatable program-space section to have a linked address at or above it. Copy each section to its sh_addr/image offset, preserving arbitrary LLD gaps and interleaving of executable and read-only sections.
- Initialize all uncopied bytes to 0xFF, append the mandatory tail, align file size to 256 bytes, and generate the header CRC and page count.
- Reject overlaps, conflicting section bytes, out-of-range addresses, writable program sections, allocatable sections with unsupported semantics, entry points outside executable contents, and violations of all image/bank invariants required by the architecture spec.
- Retain and update `validate` and `inspect` so they remain useful for final .bin files.

Delete the old ET_REL-only section layout, symbol resolution, and relocation code rather than leaving two competing linkers. Keep the existing executable/tool name unless a rename is already underway; the important change is responsibility, not branding.

Add focused llvm-avm-image tests using small linked ELF fixtures, including multiple code/rodata sections, a bank gap, .data/.bss, malformed overlaps, bad entry point, wrong ELF type, and a valid image round trip through create/validate/inspect.

Follow the session rules. Stop after this stage.
```

---

## Prompt 4 — Integrate, test, document, and remove the legacy path

```text
Continue from Prompt 3. Switch the repository's actual AVM build and test workflows to the new pipeline and finish the migration.

Update the top-level build and test runner so:

- The AVM toolchain target builds ld.lld/lld along with clang, llvm-mc, llvm-objdump, llvm-readobj, and llvm-avm-image.
- C tests compile with `-ffunction-sections -fdata-sections`, producing ET_REL objects for O0 and O2.
- Assembly tests also produce ET_REL objects.
- Each test configuration invokes ld.lld to create a linked .elf, invokes llvm-objdump on that linked ELF, writes C disassembly beside the source as <stem>_comp_O0.asm or <stem>_comp_O2.asm, then invokes llvm-avm-image create on the ELF and runs the resulting .bin.
- Temporary objects, linked ELF files, maps, images, and actual output remain in the build work directory; only the requested disassembly files are written into tests/c.
- Commands remain cross-platform and use explicit tool paths supplied by CMake.

Add one compact end-to-end multi-object test that proves cross-object calls/data references, section GC, linked-symbol disassembly, packing, and execution. Add a generated multibank linker/image test if the LLVM tests from Prompts 2-3 do not already cover the integrated path.

Update the architecture/toolchain documentation to state clearly:

- LLD alone performs symbol resolution, section GC, locality ordering, bank placement, veneers, relaxation, and final address assignment.
- The linked ET_EXEC ELF is the authoritative debug/disassembly artifact.
- llvm-avm-image only packages and validates the flat image.
- Fine-grained .text.* and .rodata.* are the normal compiler contract.
- File offsets equal logical program addresses for program-resident contents; .data is the documented special initializer prefix.

Remove stale comments/tests/documentation describing llvm-avm-image as a restricted single-object linker. Do not retain the old ET_REL image-creation path.

Run the relevant LLVM/LLD lit suites, build the repository AVM toolchain/test targets, and run the complete AVM test suite. Fix regressions within this migration's scope. End with the final pipeline commands, changed files, tests run, and any genuinely unimplemented architecture feature.

Follow the session rules. Stop when the migration is complete.
```

---

## Expected completion criteria

After Prompt 4, the following should be true:

1. Several AVM `.o` files can be linked by LLD into one deterministic ET_EXEC ELF.
2. Fine-grained code and rodata are garbage-collected, reordered for locality, and placed across 64 KiB banks without violating execution rules.
3. All final relocations, relaxations, and veneers are represented in the linked ELF and visible to `llvm-objdump` and debuggers.
4. `llvm-avm-image create` performs no linking and produces the runtime `.bin` solely from final ELF addresses and contents.
5. The normal tests exercise the same ELF-first pipeline intended for real applications.
