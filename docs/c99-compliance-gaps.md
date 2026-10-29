# C99 Compliance Gaps

This is the **live list of missing ISO C99 features** in the AVM compiler, machine, startup environment, and target runtime. It tracks C99 as amended through Technical Corrigendum 3 (WG14 N1256), **not** C11/C17/C23, POSIX, or C++ requirements.

**Maintenance rule:** When an implementation change closes or partly closes a gap, update this file **in the same change**: remove completed entries, narrow partially completed entries, and add newly discovered gaps. Do not retain completed items as checked boxes or as historical notes. A declaration or macro alone does not close a gap if required linking, execution, or semantics are still missing. Entries below describe unsupported behavior; C99 does not require the implementation to use a particular implementation technique.

Part I lists gaps that affect **freestanding C99 compliance**. Part II lists the **additional** requirements for **hosted C99 compliance**; both parts must be empty for a fully conforming hosted implementation. Complex types and all headers outside the seven freestanding headers belong in Part II, even if AVM already offers some of their functionality as freestanding extensions.

## I. Freestanding C99 compliance gaps

### Language and data model

- [ ] **Minimum `double` precision:** `double` currently uses IEEE-754 binary32 (`DBL_DIG == 6`); C99 requires `DBL_DIG >= 10`, together with the corresponding `DBL_EPSILON` bound.
- [ ] **Minimum `long double` precision:** `long double` likewise uses binary32 (`LDBL_DIG == 6`); C99 requires `LDBL_DIG >= 10` and the corresponding `LDBL_EPSILON` bound. The two types need not have different representations, but each must meet its own minimum limits.
- [ ] **64-bit integer to floating conversion:** Converting a `long long` value to a real floating type fails during instruction selection because the required conversion helper is not available.

### Minimum translation/execution capacities

- [ ] **Required 4,095-character string-literal capacity:** C99's minimum translation limit includes a character or wide-string literal of 4,095 characters after concatenation. Ordinary AVM literals currently reside in the 1 KiB data-address-space static region, so an observable literal of this size cannot be represented by the ordinary runtime layout. Support the required minimum without exceeding available guest memory.

## II. Additional hosted C99 compliance gaps

### Hosted execution environment and implementation limits

- [ ] **Filesystem access:** Provide C99 file opening, reopening, removal, renaming, temporary files, and positioning for file streams; these operations currently lack a filesystem backend.
- [ ] **Hosted program startup:** Support both `int main(void)` and `int main(int argc, char *argv[])`, including the required `argc`/`argv` guarantees, rather than only the current no-argument startup convention.
- [ ] **Hosted termination status:** Provide the C99 success/failure status semantics for return from `main`, `exit`, and `_Exit`; AVM currently discards the supplied exit status.
- [ ] **Hosted environment selection:** Supply a truthful hosted C99 compilation/runtime mode (`__STDC_HOSTED__ == 1`) with the complete hosted contract. The current SDK defaults to freestanding compilation.
- [ ] **Minimum 65,535-byte object:** C99's hosted-only minimum translation/execution limit requires a single object of 65,535 bytes. The ordinary AVM data layout provides at most 1,024 bytes of writable static storage plus a 256-byte VM stack.

---

C99 reference: [WG14 N1256, ISO/IEC 9899:1999 with Technical Corrigenda](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf), especially clauses 4, 5.1.2, 5.2.4, and 7.
