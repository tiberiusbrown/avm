# C23 Conformance Gaps

This is the **live list of missing ISO C23 features** in the AVM compiler/machine integration, startup environment, target headers, and runtime. The target is ISO/IEC 9899:2024 (C23), as represented by WG14 N3220. The list includes still-missing C99 and C11 requirements, but **does not duplicate features already supplied by Clang** unless AVM-specific ABI, lowering, linking, execution, or header integration is missing.

**Maintenance rule:** When a change closes or partly closes a gap, update this file **in the same change**: remove completed entries, narrow partially completed entries, and add newly discovered gaps. Preserve `- [ ]` checkboxes, remove empty headings, and never retain resolved entries as checked boxes, completion summaries, or historical notes. Headers or declarations alone do not close a gap without required linking, execution, and semantics. Do not require a particular implementation technique.

Part I contains the requirements for **freestanding C23 compliance**. Part II contains **additional hosted C23 requirements**; a hosted implementation must satisfy both. Optional features and facilities conditional on feature-test macros that AVM does not advertise are excluded. WG14's C23 freestanding wording omits `<stdckdint.h>` (issue 1040), so it is tracked under hosted requirements rather than incorrectly asserted to be mandatory for freestanding C23. If AVM claims IEC 60559 conformance, reassess the conditional freestanding `<fenv.h>`, `<math.h>`, and floating-conversion requirements.

## I. Freestanding C23 compliance gaps

### Language and data model

- [ ] **Minimum `double` precision:** `double` currently uses IEEE-754 binary32 (`DBL_DIG == 6`); C23 requires `DBL_DIG >= 10` and the corresponding epsilon bound.
- [ ] **Minimum `long double` precision:** `long double` also uses binary32 (`LDBL_DIG == 6`); C23 requires `LDBL_DIG >= 10` and the corresponding epsilon bound. `double` and `long double` may share a representation if it meets these requirements.

## II. Additional hosted C23 compliance gaps

### Hosted execution environment and implementation limits

- [ ] **Filesystem access:** Provide standard file opening, reopening (including C11 exclusive `"x"` modes), removal, renaming, temporary files, and stream positioning. AVM currently has no filesystem backend.
- [ ] **Hosted program startup:** Support both `int main(void)` and `int main(int argc, char *argv[])`, with the required `argc`/`argv` guarantees, rather than only no-argument startup.
- [ ] **Hosted termination status:** Preserve the success/failure status semantics of returning from `main`, `exit`, `_Exit`, and C11 `quick_exit`; AVM currently discards termination status.
- [ ] **Hosted environment selection:** Supply a truthful hosted compilation/runtime mode (`__STDC_HOSTED__ == 1`) with the full hosted contract. The SDK defaults to freestanding mode.

### Time and character handling

- [ ] **C23 calendar formatting:** Extend `strftime` and `wcsftime` to handle the C23 additions to format conversion syntax and required semantics.

### Floating-point library extensions

- [ ] **`<fenv.h>` C23 interfaces:** Provide `fesetexcept`, `fetestexceptflag`, `fegetmode`, `fesetmode`, and the associated mode type and macros, consistently with AVM's supported floating-point environment.
- [ ] **`<math.h>` π-scaled trigonometry (C23):** Provide `sinpi`, `cospi`, `tanpi`, `asinpi`, `acospi`, `atanpi`, and `atan2pi` families.
- [ ] **`<math.h>` exponentials and logarithms (C23):** Provide `exp10`, `exp10m1`, `exp2m1`, `logp1`, `log2p1`, and `log10p1` families.
- [ ] **`<math.h>` power/root operations (C23):** Provide `pown`, `powr`, `rootn`, `compoundn`, and `rsqrt` families.
- [ ] **`<math.h>` inexact reporting for `fromfpx` and `ufromfpx` (C23):** Raise the "inexact" floating-point exception when a rounded result within the width's range differs in value from the argument. AVM does not yet provide floating-point exception flags.
- [ ] **`<tgmath.h>` C23 generic interfaces:** Extend type-generic math dispatch to cover the new required real/complex mathematical interfaces for supported types.

---

C23 reference: [WG14 N3220, ISO/IEC 9899:2024 working draft](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3220.pdf), especially clauses 4, 5.2.5.2, and 7.  
Freestanding wording clarification: [WG14 issue 1040](https://open-std.org/jtc1/sc22/wg14/issues/c23/issue1040.html).
