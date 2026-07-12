# AVM ELF policy

AVM relocatable objects are little-endian ELF32 `ET_REL` files using private
development machine value `EM_AVM = 0x4156`. The canonical triple is
`avm-unknown-arduboyfx`. Address-space-zero pointers are 16 bits; program and
function pointers in address space one are packed 24-bit values.

`llvm/include/llvm/BinaryFormat/ELFRelocs/AVM.def` is authoritative. It assigns
0 through 8 to `R_AVM_NONE`, `R_AVM_DATA16`, `R_AVM_PROG24`,
`R_AVM_PROG_LO16`, `R_AVM_PROG_HI8`, `R_AVM_PCREL8`, `R_AVM_BANK16`,
`R_AVM_FAR24`, and `R_AVM_RELAX`, respectively. Packed far relocations preserve
bit zero of the encoded field as the call/link bit and require even targets.

BinaryFormat, Object, ObjectYAML, and LLD recognize the machine. The early LLD
hook diagnoses unknown relocation types. Bank placement, relaxation, veneers,
and production linked-image generation are deferred.
