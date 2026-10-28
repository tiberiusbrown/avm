# C99 Compliance Gaps

This is the **live list of missing ISO C99 features** in the AVM compiler, machine, startup environment, and target runtime. It tracks C99 as amended through Technical Corrigendum 3 (WG14 N1256), **not** C11/C17/C23, POSIX, or C++ requirements.

**Maintenance rule:** When an implementation change closes or partly closes a gap, update this file **in the same change**: remove completed entries, narrow partially completed entries, and add newly discovered gaps. Do not retain completed items as checked boxes or as historical notes. A declaration or macro alone does not close a gap if required linking, execution, or semantics are still missing. Entries below describe unsupported behavior; C99 does not require the implementation to use a particular implementation technique.

Part I lists gaps that affect **freestanding C99 compliance**. Part II lists the **additional** requirements for **hosted C99 compliance**; both parts must be empty for a fully conforming hosted implementation. Complex types and all headers outside the seven freestanding headers belong in Part II, even if AVM already offers some of their functionality as freestanding extensions.

## I. Freestanding C99 compliance gaps

### Language and data model

- [ ] **Minimum `double` precision:** `double` currently uses IEEE-754 binary32 (`DBL_DIG == 6`); C99 requires `DBL_DIG >= 10`, together with the corresponding `DBL_EPSILON` bound.
- [ ] **Minimum `long double` precision:** `long double` likewise uses binary32 (`LDBL_DIG == 6`); C99 requires `LDBL_DIG >= 10` and the corresponding `LDBL_EPSILON` bound. The two types need not have different representations, but each must meet its own minimum limits.

### Minimum translation/execution capacities

- [ ] **Required 4,095-character string-literal capacity:** C99's minimum translation limit includes a character or wide-string literal of 4,095 characters after concatenation. Ordinary AVM literals currently reside in the 1 KiB data-address-space static region, so an observable literal of this size cannot be represented by the ordinary runtime layout. Support the required minimum without exceeding available guest memory.

## II. Additional hosted C99 compliance gaps

### Hosted execution environment and implementation limits

- [ ] **Hosted program startup:** Support both `int main(void)` and `int main(int argc, char *argv[])`, including the required `argc`/`argv` guarantees, rather than only the current no-argument startup convention.
- [ ] **Hosted termination status:** Provide the C99 success/failure status semantics for return from `main`, `exit`, and `_Exit`; AVM currently discards the supplied exit status.
- [ ] **Hosted environment selection:** Supply a truthful hosted C99 compilation/runtime mode (`__STDC_HOSTED__ == 1`) with the complete hosted contract. The current SDK defaults to freestanding compilation.
- [ ] **Minimum 65,535-byte object:** C99's hosted-only minimum translation/execution limit requires a single object of 65,535 bytes. The ordinary AVM data layout provides at most 1,024 bytes of writable static storage plus a 256-byte VM stack.

### `<complex.h>` — complex arithmetic

- [ ] Provide the required complex macros/constants (`complex`, `_Complex_I`, `I`) and a functioning C99 complex library for all three real precisions; C99 imaginary types and `_Imaginary_I` are optional.
- [ ] Provide the `float`, `double`, and `long double` complex variants of `cacos`, `casin`, `catan`, `ccos`, `csin`, `ctan`, `cacosh`, `casinh`, `catanh`, `ccosh`, `csinh`, `ctanh`, `cexp`, `clog`, `cabs`, `cpow`, `csqrt`, `carg`, `cimag`, `conj`, `cproj`, and `creal` (the corresponding `f`/`l` spellings where applicable).

### `<fenv.h>` — floating-point environment

- [ ] Provide `fenv_t`, `fexcept_t`, `FE_DFL_ENV`, `FE_ALL_EXCEPT`, and the applicable floating-point exception and rounding-mode macros, with consistent exception and rounding-state semantics. C99 does not require every possible rounding mode or exception to be supported.
- [ ] Provide `feclearexcept`, `fegetexceptflag`, `feraiseexcept`, `fesetexceptflag`, `fetestexcept`, `fegetround`, `fesetround`, `fegetenv`, `feholdexcept`, `fesetenv`, and `feupdateenv`.

### `<math.h>` — remaining math interfaces

- [ ] Provide the required `float_t` and `double_t` types.
- [ ] Provide C99's standard `double` and `long double` forms of the existing `*f` functions. This includes all corresponding unsuffixed and `*l` functions in the trigonometric, hyperbolic, exponential/logarithmic, power, rounding, remainder, classification-support, and floating-point manipulation families; aliases are sufficient only if their semantics and types are correct.
- [ ] Provide the missing `float` forms `erff`, `erfcf`, `lgammaf`, `tgammaf`, `scalblnf`, and `nexttowardf`, together with the corresponding unsuffixed/`*l` forms of these families.
- [ ] Implement standard domain, pole, overflow, and underflow reporting behavior and provide a truthful `math_errhandling` value. AVM's math runtime maintains neither `errno`-based math errors nor floating-point exception state.

### `<stdio.h>` — narrow streams, formatted I/O, files

- [ ] Provide `FILE`, `fpos_t`, `stdin`, `stdout`, `stderr`, `EOF`, `BUFSIZ`, `FOPEN_MAX`, `FILENAME_MAX`, `L_tmpnam`, `TMP_MAX`, `_IOFBF`, `_IOLBF`, `_IONBF`, and `SEEK_SET`/`SEEK_CUR`/`SEEK_END`.
- [ ] Provide standard stream/file lifecycle, buffering, and filesystem operations: `fopen`, `freopen`, `fclose`, `fflush`, `setbuf`, `setvbuf`, `remove`, `rename`, `tmpfile`, and `tmpnam`.
- [ ] Provide the remaining formatted-output interfaces: `printf`, `fprintf`, `sprintf`, `vprintf`, `vfprintf`, and `vsprintf`. Expose the existing `snprintf` interface with standard external-function semantics, in addition to direct-call conveniences.
- [ ] Provide formatted-input interfaces: `scanf`, `fscanf`, `sscanf`, `vscanf`, `vfscanf`, and `vsscanf`, including C99 conversion syntax and assignment semantics.
- [ ] Complete `printf`-family support for standard wide-character and wide-string conversions (`%lc`, `%ls`) in addition to the already-supported narrow formatting conversions.
- [ ] Provide character/line/string I/O: `fgetc`, `fgets`, `fputc`, `fputs`, `getc`, `getchar`, `gets` (deprecated in C99, but still required by that edition), `putc`, `putchar`, `puts`, and `ungetc`.
- [ ] Provide binary-stream I/O: `fread` and `fwrite`.
- [ ] Provide stream positioning: `fgetpos`, `fseek`, `fsetpos`, `ftell`, and `rewind`.
- [ ] Provide stream status and error reporting: `clearerr`, `feof`, `ferror`, and `perror`.
- [ ] Supply the C99 text/binary stream, buffering, stream-orientation, end-of-file, and standard-file semantics underlying these interfaces, not just linkable stubs.

### `<stdlib.h>` — utilities beyond AVM's existing subset

- [ ] Provide environment interfaces `getenv` and `system` with their specified return/failure behavior.
- [ ] Ensure every configuration claiming hosted conformance supports at least 32 `atexit` registrations; `--avm-atexit-capacity` currently permits a smaller capacity.

### `<tgmath.h>` — type-generic math

- [ ] Make the C99 type-generic macros work for the required real and complex argument types with correct selection among `float`, `double`, and `long double` functions. Clang's header depends on missing complex and non-`f` math entry points.

### `<wchar.h>` — wide and multibyte functionality

- [ ] Provide `wint_t`, `mbstate_t`, `WEOF`, and the standard wide-character header declarations.
- [ ] Provide wide formatted I/O: `fwprintf`, `fwscanf`, `swprintf`, `swscanf`, `vfwprintf`, `vfwscanf`, `vswprintf`, `vswscanf`, `vwprintf`, `vwscanf`, `wprintf`, and `wscanf`.
- [ ] Provide wide stream/character operations: `fgetwc`, `fgetws`, `fputwc`, `fputws`, `fwide`, `getwc`, `getwchar`, `putwc`, `putwchar`, and `ungetwc`.
- [ ] Provide wide numeric conversions: `wcstof`, `wcstod`, `wcstold`, `wcstol`, `wcstoll`, `wcstoul`, and `wcstoull`.
- [ ] Provide wide string and memory operations: `wcscpy`, `wcsncpy`, `wmemcpy`, `wmemmove`, `wcscat`, `wcsncat`, `wcscmp`, `wcscoll`, `wcsncmp`, `wcsxfrm`, `wmemcmp`, `wcschr`, `wcscspn`, `wcspbrk`, `wcsrchr`, `wcsspn`, `wcsstr`, `wcstok`, `wmemchr`, `wcslen`, and `wmemset`.
- [ ] Provide wide time formatting `wcsftime`.
- [ ] Provide multibyte conversion/state APIs: `btowc`, `wctob`, `mbsinit`, `mbrlen`, `mbrtowc`, `wcrtomb`, `mbsrtowcs`, and `wcsrtombs`.
- [ ] Provide the C99 wide-stream orientation and multibyte conversion semantics for supported locales.

### `<wctype.h>` — wide-character classification and mapping

- [ ] Provide `wctrans_t`, `wctype_t`, and `WEOF` as required by the header.
- [ ] Provide `iswalnum`, `iswalpha`, `iswblank`, `iswcntrl`, `iswdigit`, `iswgraph`, `iswlower`, `iswprint`, `iswpunct`, `iswspace`, `iswupper`, `iswxdigit`, `iswctype`, and `wctype`.
- [ ] Provide `towlower`, `towupper`, `towctrans`, and `wctrans`.

---

C99 reference: [WG14 N1256, ISO/IEC 9899:1999 with Technical Corrigenda](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf), especially clauses 4, 5.1.2, 5.2.4, and 7.
