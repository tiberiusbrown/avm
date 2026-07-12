# AVM LLVM open issues

1. `EM_AVM = 0x4156` and all relocation numbers are private development values;
   standard allocation remains unresolved.
2. DWARF register numbers have not been standardized.
3. The architectural choice of `r3` as a future frame register is modeled only
   as a placeholder; frame lowering is explicitly deferred.
4. Full Version 1 TableGen instruction descriptions, integrated assembly
   parsing, encoding, printing, and disassembly remain required. The initial MC
   scaffold can emit generic assembler data directives only and must not be
   described as a complete AVM assembler.
5. The early image tool rejects every relocation. It therefore accepts only
   objects whose assembler-resolvable expressions left no relocation records.
   Production symbol resolution and relocation application belong to later LLD
   work.
6. The early image layout concatenates `.text` then `.rodata`; it intentionally
   supports only bank 0 and one instance of each allowed section.
7. Simulator execution was not performed unless the final verification report
   explicitly records a simulator command and result.
