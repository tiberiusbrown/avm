# C++23 Conformance Gaps

This is the **live list of missing ISO C++23 features** in the AVM compiler/machine integration, C++ ABI, startup environment, target headers, and runtime. The target is ISO/IEC 14882:2024 (C++23), as represented by the C++23 working draft N4950. Include earlier C++ requirements that are still missing, but **do not list language features already supplied by Clang** unless AVM-specific target lowering, ABI, linking, execution, or integration is missing.

**Maintenance rule:** When a change closes or partly closes a gap, update this file **in the same change**: remove completed entries, narrow partially completed entries, and add newly discovered gaps. Preserve `- [ ]` checkboxes, remove empty headings, and never retain resolved entries as checked boxes, completion summaries, or historical notes. Headers, declarations, or successful compilation alone do not close a gap without required linking, execution, and semantics. Do not prescribe a particular implementation technique.

Part I contains requirements for **freestanding C++23 conformance**. Part II contains **additional hosted C++23 requirements**; a hosted implementation must satisfy both. For headers that are only partly freestanding, Part I concerns **only the entities designated freestanding** in the C++23 header synopses, not their entire hosted interfaces. C++23's C-library references use **C17 (ISO/IEC 9899:2018), not C23**: C23-only library facilities are tracked in [`c23-compliance-gaps.md`](c23-compliance-gaps.md) and are not automatically C++23 requirements. Shared ABI or numeric gaps may appear in both trackers and must be kept consistent. Do not mistake the *recommended*, non-conformance-determining quantities in C++23 Annex B for mandatory minimum object or string sizes. Implementation-defined freestanding startup and single-threaded execution do not, by themselves, constitute gaps.

## I. Freestanding C++23 conformance gaps

### Language mode and target integration

- [ ] **Exception-capable C++ language mode:** Support catch clauses that convert the thrown type through pointer-to-member conversions, exception specifications, and nested exceptions. The default AVM C++ configuration still specifies `-fno-exceptions`.
- [ ] **Runtime type identification:** The AVM C++ configuration still specifies `-fno-rtti`, so `dynamic_cast` requires `-frtti`.
- [ ] **C++20 modules:** Support compilation, dependency ordering, interface/implementation units, imports, linking, and cross-translation-unit semantics for language modules in the AVM SDK, including relevant AVM target and toolchain integration. This concerns the core language, not the hosted library modules `std` and `std.compat`.
- [ ] **Coroutines:** Validate and provide AVM lowering and execution for C++20/C++23 coroutine creation, suspension, resumption, destruction, frame allocation, cleanup, and cross-translation-unit references.
- [ ] **Thread storage duration:** Provide correct `thread_local` initialization, access, and destruction for the freestanding execution model AVM advertises, including compiler-generated TLS references and destructors.
- [ ] **Floating-point type minimums:** Provide conforming `double` and `long double` representations and operations. AVM currently implements both as binary32, below the required minimum precision; keep this item aligned with the shared C23 language/data-model gaps.
- [ ] **Required 65,536-character string-literal capacity:** C++23 requires a string literal of 65,536 characters after concatenation. Immutable literals reside in the AS0 flash window, which holds at most 62,720 bytes, and writable literals reside in the 1 KiB static region, so neither can hold this literal.

### C++ ABI, object lifetime, and exception runtime

- [ ] **Exception ABI:** Provide pointer-to-member conversion matching for catch clauses, including containing-class and member-pointer qualification conversions and `std::nullptr_t` conversions to pointer-to-member types.
- [ ] **Overlapping catches of one exception:** Support a rethrow that a nested handler inside the still-active abandoned catch catches, and any other catch of one exception that begins while another catch of that exception is active. This needs handler-depth tracking and simultaneous catch objects, including their converted-pointer buffers.
- [ ] **Pointer conversions in program memory:** Match a derived class pointer into 24-bit program memory to a base class pointer. The runtime walks the bases of ordinary 16-bit class pointers only, so a 24-bit derived pointer matches no base catch.
- [ ] **Base-class match depth:** Match catch clauses and `dynamic_cast` operations against class hierarchies deeper than eight descriptor levels, against more than 512 base edges for one clause or one cast, or against pointer qualification chains deeper than eight levels. A throw or cast past any of these limits fails instead of matching.
- [ ] **Stack cleanup and termination:** Ensure destructors execute for the fully constructed elements of an array whose construction fails; invoke `std::terminate` for the required failure cases, including violations of `noexcept`.
- [ ] **Mixed RTTI with dynamic typeid:** When dynamic `typeid` or a `dynamic_cast` to a class is linked, the linker rejects every retained ordinary vtable that is emitted without RTTI, even a class that no such operation reaches. Retain such vtables when no operation can reach them.
- [ ] **Dynamic initialization and destruction:** Complete initialization guards, recursive-initialization handling, and destructor registration/order semantics for namespace-scope, function-local static, and thread-local objects in the supported execution model, including early termination and exception paths.

### Dynamic allocation — `<new>`

- [ ] **Array-length errors:** Throw `std::bad_array_new_length` for a new-expression whose element count is negative or whose total size overflows. The compiler does not check the count, and `new int[-1]` throws `std::bad_alloc` from `operator new[]`.

### Exceptions and runtime type headers

- [ ] **`<coroutine>`:** Provide the required `std::coroutine_traits`, `std::coroutine_handle` forms, `std::noop_coroutine`, `std::suspend_always`, `std::suspend_never`, and related operations, connected to the AVM coroutine implementation.

### Core generic library headers

- [ ] **`<type_traits>` relationships and feature-test macros:** Provide `std::is_layout_compatible`, `std::is_pointer_interconvertible_base_of`, `std::is_corresponding_member`, and `std::is_pointer_interconvertible_with_class` with their required constant-expression behavior, and define their required feature-test macros, including `__cpp_lib_reference_from_temporary`.
- [ ] **`<memory>` explicit lifetime management:** Provide the freestanding `std::start_lifetime_as` and `std::start_lifetime_as_array` interfaces, mandate checks, and compiler-supported object creation with stored-representation preservation; define `__cpp_lib_start_lifetime_as` only when those semantics are supported.

## II. Additional hosted C++23 conformance gaps

### Hosted execution environment and library availability

- [ ] **Hosted mode:** Provide a truthful hosted C++23 compilation/runtime configuration (`__STDC_HOSTED__ == 1`) with the complete hosted language and library contract; AVM currently defaults to freestanding compilation.
- [ ] **Hosted program entry and termination:** Support the standard `main` forms with required `argc`/`argv` guarantees and observable normal/abnormal termination status, including the requirements shared with the hosted C runtime.
- [ ] **Hosted concurrency:** Provide a conforming threading execution model and runtime needed by hosted C++ concurrency and memory-model guarantees, rather than assuming the freestanding single-threaded AVM model suffices.
- [ ] **Standard library distribution:** Complete and validate the hosted C++23 header set, with declarations, overloads, namespaces, feature-test macros, ABI, linkage, and behavior; the AVM SDK currently ships only a configured freestanding libc++ subset.

### Hosted library fundamentals and C compatibility

- [ ] **C-library compatibility headers:** Provide the required C++ wrappers/interfaces for the C17-derived library facilities, including `<cassert>`, `<cctype>`, `<cerrno>`, `<cfenv>`, `<cmath>`, `<ccomplex>`, `<csetjmp>`, `<csignal>`, `<cstdio>`, `<cstdlib>`, `<cstring>`, `<ctime>`, `<cuchar>` (except `std::mbrtoc8` and `std::c8rtomb`, which the vendored libc++ enables only for GNU libc 2.36 or newer), `<cwchar>`, `<cwctype>`, `<cinttypes>`, and related C++23-standard headers, with correct `std`-namespace forms and overloads.
- [ ] **C++ `<cstdlib>` hosted facilities:** Complete the non-freestanding `std::` functions/types, including C allocation, numeric conversions, environment, random-number utilities, sorting/searching, and specified overloads, with correct interaction with the AVM C runtime.
- [ ] **Hosted exception and RTTI integration:** Ensure all hosted library facilities interoperate with standard exception types, allocation failure, dynamic casts, exception propagation, and ABI-compatible error reporting.

### Containers, strings, and memory management

- [ ] **Sequence and associative containers:** Provide `<vector>`, `<deque>`, `<list>`, `<forward_list>`, `<map>`, `<set>`, `<unordered_map>`, `<unordered_set>`, `<array>`, and the container adaptor interfaces, with required iterators, allocators, lifetime, and exception guarantees.
- [ ] **Strings and views:** Provide `<string>`, `<string_view>`, `<span>`, `<bitset>`, and the required character traits, conversions, iterators, and overloads, including correct handling of ordinary C++ object address space.
- [ ] **Vocabulary and type-erasure types:** Provide `<optional>`, `<variant>`, `<any>`, `<expected>`, `<memory_resource>`, and hosted portions of `<memory>`, `<functional>`, `<tuple>`, and `<utility>`.

### Algorithms, ranges, numerics, and random facilities

- [ ] **Algorithms and iterators:** Complete `<algorithm>`, `<iterator>`, `<ranges>`, `<numeric>`, and the corresponding hosted-only interfaces, adaptors, and execution-policy overloads.
- [ ] **Numerical utilities:** Provide `<numbers>`, `<complex>`, `<valarray>`, `<random>`, and `<bit>`/`<cmath>` hosted interfaces, including required special functions and distributions.
- [ ] **C++23 multi-dimensional and other numerical facilities:** Provide `<mdspan>` and other C++23 hosted numerical library additions with correct layout and accessor semantics.

### I/O, formatting, locale, and filesystems

- [ ] **Streams:** Provide `<ios>`, `<iosfwd>`, `<iostream>`, `<istream>`, `<ostream>`, `<streambuf>`, `<sstream>`, `<fstream>`, `<iomanip>`, and `<syncstream>`, including standard stream objects and error/locale semantics.
- [ ] **Formatting and printing:** Provide `<format>` and C++23 `<print>`, with required formatters, compile-time format checking, character encoding, stream/terminal behavior, and exception semantics.
- [ ] **Locale and text processing:** Provide `<locale>`, `<codecvt>` where still required, `<regex>`, and the associated localized conversion and classification interfaces.
- [ ] **Filesystem:** Provide `<filesystem>` and its required file/directory/path/status operations and error handling, with a functioning execution-environment backend.

### Time, threads, synchronization, and other facilities

- [ ] **Chrono:** Provide the remaining `<chrono>` system clock, calendar, time-zone, and formatting facilities, and the `<ctime>`-related C++ interfaces that need the environment. `<chrono>` does not compile on targets with 16-bit `int`, because its calendar types require 32-bit `int`.
- [ ] **Threads and synchronization:** Provide `<thread>`, `<stop_token>`, `<mutex>`, `<shared_mutex>`, `<condition_variable>`, `<semaphore>`, `<latch>`, `<barrier>`, and hosted synchronization and lifetime semantics.
- [ ] **Futures and execution policies:** Provide `<future>`, `<execution>`, and the required asynchronous operation, task, and parallel-algorithm interfaces.
- [ ] **Diagnostics and utility headers:** Provide hosted `<system_error>`, `<stdexcept>`, `<stacktrace>`, `<charconv>`, and other hosted error, stack inspection, and character conversion facilities.

### Standard library modules

- [ ] **C++23 `std` and `std.compat` modules:** Provide and package the standard library named modules with the required exported declarations, interoperability with headers/header units, and AVM compiler/build integration.

---

C++23 reference: [WG21 N4950, C++23 working draft](https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2023/n4950.pdf), especially [freestanding implementations](https://timsong-cpp.github.io/cppwp/std23/compliance), [freestanding items](https://timsong-cpp.github.io/cppwp/std23/freestanding.item), [implementation compliance](https://timsong-cpp.github.io/cppwp/std23/intro.compliance), and [Annex B implementation quantities](https://timsong-cpp.github.io/cppwp/std23/implimits). The C++23 normative C-language reference is ISO/IEC 9899:2018 ([normative references](https://timsong-cpp.github.io/cppwp/std23/intro.refs)).
