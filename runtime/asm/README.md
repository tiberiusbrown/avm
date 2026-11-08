# Runtime disassembly

These generated files belong in version control. They show the production
runtime objects, including functions that an individual program may not use.
Paths mirror the runtime sources: `lib/math/sf_cos.asm` shows compiled `cosf`,
and `lib/math/ef_sqrt.asm` shows compiled `sqrtf`.

Regenerate with the configured toolchain environment initialized:

```sh
cmake --build build --config RelWithDebInfo --target avm_runtime_asm_update --parallel
```

Ordinary SDK/runtime builds leave these references untouched.
`avm_runtime_asm` generates listings under `build/runtime/disassembly/`;
`avm_runtime_asm_update` explicitly copies them here. Upstream libc++ object
listings live under `libcxx/src/`.
Listings include bytes, symbol tables, and relocations. They precede final-link
relaxation, so calls and branches may shorten when linked into a program.
Relocation records identify unresolved call targets and data references beside
their instructions. Object names in file headers do not include local paths.
