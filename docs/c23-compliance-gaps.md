# C23 Conformance Gaps

This is the **live list of missing ISO C23 features** in the AVM compiler/machine integration, startup environment, target headers, and runtime. The target is ISO/IEC 9899:2024 (C23), as represented by WG14 N3220. The list includes still-missing C99 and C11 requirements, but **does not duplicate features already supplied by Clang** unless AVM-specific ABI, lowering, linking, execution, or header integration is missing.

**Maintenance rule:** When a change closes or partly closes a gap, update this file **in the same change**: remove completed entries, narrow partially completed entries, and add newly discovered gaps. Preserve `- [ ]` checkboxes, remove empty headings, and never retain resolved entries as checked boxes, completion summaries, or historical notes. Headers or declarations alone do not close a gap without required linking, execution, and semantics. Do not require a particular implementation technique.

Part I contains the requirements for **freestanding C23 compliance**. Part II contains **additional hosted C23 requirements**; a hosted implementation must satisfy both. Optional features and facilities conditional on feature-test macros that AVM does not advertise are excluded. WG14's C23 freestanding wording omits `<stdckdint.h>` (issue 1040), so it is tracked under hosted requirements rather than incorrectly asserted to be mandatory for freestanding C23. If AVM claims IEC 60559 conformance, reassess the conditional freestanding `<fenv.h>`, `<math.h>`, and floating-conversion requirements.

## I. Freestanding C23 compliance gaps

### Language and data model

- [ ] **Minimum `double` precision:** `double` currently uses IEEE-754 binary32 (`DBL_DIG == 6`); C23 requires `DBL_DIG >= 10` and the corresponding epsilon bound.
- [ ] **Minimum `long double` precision:** `long double` also uses binary32 (`LDBL_DIG == 6`); C23 requires `LDBL_DIG >= 10` and the corresponding epsilon bound. `double` and `long double` may share a representation if it meets these requirements.
- [ ] **64-bit integer-to-floating conversion:** Conversion of `long long` to real floating types fails instruction selection because the necessary conversion helper is unavailable.

### Minimum translation/execution capacities

- [ ] **Required 4,095-character string-literal capacity:** C23 requires a string literal of 4,095 characters after concatenation. Ordinary AVM literals reside in the 1 KiB data-address-space static region, preventing this capacity for ordinary string literals.

### Freestanding C23 library facilities

- [ ] **`<stdbit.h>`:** Provide the C23 endian constants and the complete set of type-specific and type-generic bit-operation macros with correct semantics and single evaluation of arguments.
- [ ] **`<string.h>` C23 functions:** Provide `memccpy` and `memset_explicit`, including the requirement that explicit memory clearing not be eliminated by optimization.
- [ ] **`<string.h>` qualifier-generic search interfaces:** Make `memchr`, `strchr`, `strrchr`, `strpbrk`, and `strstr` preserve the source pointer's `const` qualification in C23 while retaining callable, addressable functions.
- [ ] **`<stdlib.h>` alignment query:** Provide `memalignment(const void *)`, including the required null-pointer result and alignment semantics.

## II. Additional hosted C23 compliance gaps

### Hosted execution environment and implementation limits

- [ ] **Filesystem access:** Provide standard file opening, reopening (including C11 exclusive `"x"` modes), removal, renaming, temporary files, and stream positioning. AVM currently has no filesystem backend.
- [ ] **Hosted program startup:** Support both `int main(void)` and `int main(int argc, char *argv[])`, with the required `argc`/`argv` guarantees, rather than only no-argument startup.
- [ ] **Hosted termination status:** Preserve the success/failure status semantics of returning from `main`, `exit`, `_Exit`, and C11 `quick_exit`; AVM currently discards termination status.
- [ ] **Hosted environment selection:** Supply a truthful hosted compilation/runtime mode (`__STDC_HOSTED__ == 1`) with the full hosted contract. The SDK defaults to freestanding mode.
- [ ] **Minimum 32,767-byte object:** C23's hosted-only minimum execution limit requires an ordinary object of 32,767 bytes. AVM has up to 1,024 bytes of writable static storage and a 256-byte VM stack.

### C11 and C23 library headers and utilities

- [ ] **`<stdckdint.h>` (C23):** Provide `ckd_add`, `ckd_sub`, and `ckd_mul` with the specified checked-arithmetic semantics, including mixed integer types and overflow reporting.
- [ ] **`<assert.h>` (C23):** Implement variadic `assert(...)` and the required header-version macro with correct `NDEBUG` and failed-assertion behavior.
- [ ] **`<stdlib.h>` allocation (C11/C23):** Provide `aligned_alloc`, `free_sized`, and `free_aligned_sized` with the specified alignment, size, and deallocation contracts.
- [ ] **`<stdlib.h>` quick termination (C11):** Provide `at_quick_exit` and `quick_exit`, including registration capacity, callback ordering, and separation from ordinary `atexit` callbacks.
- [ ] **`<stdlib.h>` float-to-string conversion (C23):** Provide `strfromf`, `strfromd`, and `strfroml` with the required formatting and return-value semantics.
- [ ] **`<stdlib.h>` qualifier-generic binary search (C23):** Make `bsearch` preserve the searched array's `const` qualification in C23 while retaining an addressable function.
- [ ] **`<string.h>` duplication (C23):** Provide `strdup` and `strndup` with allocation, termination, and failure semantics.
- [ ] **`<uchar.h>` (C11/C23):** Provide the `char16_t`/`char32_t`/`char8_t` API integration and conversions `mbrtoc16`, `c16rtomb`, `mbrtoc32`, `c32rtomb`, `mbrtoc8`, and `c8rtomb`, including `mbstate_t` state and invalid-sequence behavior in AVM's supported locale.
- [ ] **`<complex.h>` construction (C11):** Provide `CMPLX`, `CMPLXF`, and `CMPLXL`, with correct complex construction independent of intermediate arithmetic.
- [ ] **Header revision interfaces (C23):** Define the required `__STDC_VERSION_*_H__` macros in AVM-owned library headers and reconcile other C23 header contracts, without duplicating compiler-provided headers.

### Formatted input/output and integer conversion

- [ ] **Binary formatted output (C23):** Implement mandatory `%b` conversion in all narrow and wide `printf`-family entry points, including flags, width, precision, and length modifiers.
- [ ] **Binary formatted input (C23):** Implement `%b` conversion and C23 binary-prefix acceptance where applicable in the narrow and wide `scanf`-family entry points, preserving matching, conversion, and assignment rules.
- [ ] **Exact/fast-width format modifiers (C23):** Support `wN` and `wfN` length modifiers in all narrow and wide formatted-input/output interfaces for the supported exact-, minimum-, and fast-width integer types.
- [ ] **`<inttypes.h>` binary formats (C23):** Add the mandatory `PRIb*` and `SCNb*` macros for supported integer types and ensure compatibility with C23 format parsing. `PRIB*` and `%B` are optional and need not be supported.
- [ ] **Binary-prefixed integer strings (C23):** Recognize `0b`/`0B` where required in `strtol`, `strtoul`, `strtoll`, `strtoull`, `strtoimax`, `strtoumax`, and their wide-character equivalents, with correct base detection, end pointers, and range handling.

### Time and character handling

- [ ] **`<time.h>` time specifications (C11/C23):** Provide `struct timespec`, `TIME_UTC`, `timespec_get`, and `timespec_getres` with permitted failure behavior when calendar time is unavailable.
- [ ] **`<time.h>` reentrant/UTC conversions (C23):** Provide `gmtime_r`, `localtime_r`, and `timegm`, using the existing fixed-UTC calendar model where applicable.
- [ ] **C23 calendar formatting:** Extend `strftime` and `wcsftime` to handle the C23 additions to format conversion syntax and required semantics.
- [ ] **`<wchar.h>` qualifier-generic search interfaces (C23):** Make `wcschr`, `wcsrchr`, `wcspbrk`, `wcsstr`, and `wmemchr` preserve source-pointer `const` qualification in C23 while retaining addressable functions.

### Floating-point library extensions

- [ ] **`<fenv.h>` C23 interfaces:** Provide `fesetexcept`, `fetestexceptflag`, `fegetmode`, `fesetmode`, and the associated mode type and macros, consistently with AVM's supported floating-point environment.
- [ ] **`<math.h>` π-scaled trigonometry (C23):** Provide `sinpi`, `cospi`, `tanpi`, `asinpi`, `acospi`, `atanpi`, and `atan2pi` families.
- [ ] **`<math.h>` exponentials and logarithms (C23):** Provide `exp10`, `exp10m1`, `exp2m1`, `logp1`, `log2p1`, and `log10p1` families.
- [ ] **`<math.h>` power/root operations (C23):** Provide `pown`, `powr`, `rootn`, `compoundn`, and `rsqrt` families.
- [ ] **`<math.h>` rounding and integer-result conversions (C23):** Provide `roundeven`, `fromfp`, `ufromfp`, `fromfpx`, and `ufromfpx` families.
- [ ] **`<math.h>` ordering and classification (C23):** Provide the newly required classification and comparison interfaces (including `issignaling`, `issubnormal`, `iszero`, and `iseqsig`) and other C23-specified operations for AVM's supported real floating types.
- [ ] **`<math.h>` successor and minimum/maximum operations (C23):** Provide `nextup`, `nextdown`, and the `fmaximum`/`fminimum` numeric and magnitude families.
- [ ] **`<math.h>` narrow-result arithmetic (C23):** Provide the applicable `fadd`, `fsub`, `fmul`, `fdiv`, `ffma`, and related narrow-result families.
- [ ] **`<tgmath.h>` C23 generic interfaces:** Extend type-generic math dispatch to cover the new required real/complex mathematical interfaces for supported types.

---

C23 reference: [WG14 N3220, ISO/IEC 9899:2024 working draft](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3220.pdf), especially clauses 4, 5.2.5.2, and 7.  
Freestanding wording clarification: [WG14 issue 1040](https://open-std.org/jtc1/sc22/wg14/issues/c23/issue1040.html).
