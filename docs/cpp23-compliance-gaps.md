# C++23 Conformance Gaps

This is the **live list of missing ISO C++23 features** in the AVM compiler/machine integration, C++ ABI, startup environment, target headers, and runtime. The target is ISO/IEC 14882:2024 (C++23), as represented by the C++23 working draft N4950. Include earlier C++ requirements that are still missing, but **do not list language features already supplied by Clang** unless AVM-specific target lowering, ABI, linking, execution, or integration is missing.

**Maintenance rule:** When a change closes or partly closes a gap, update this file **in the same change**: remove completed entries, narrow partially completed entries, and add newly discovered gaps. Preserve `- [ ]` checkboxes, remove empty headings, and never retain resolved entries as checked boxes, completion summaries, or historical notes. Headers, declarations, or successful compilation alone do not close a gap without required linking, execution, and semantics. Do not prescribe a particular implementation technique.

Part I contains requirements for **freestanding C++23 conformance**. Part II contains **additional hosted C++23 requirements**; a hosted implementation must satisfy both. For headers that are only partly freestanding, Part I concerns **only the entities designated freestanding** in the C++23 header synopses, not their entire hosted interfaces. C++23's C-library references use **C17 (ISO/IEC 9899:2018), not C23**: C23-only library facilities are tracked in [`c23-compliance-gaps.md`](c23-compliance-gaps.md) and are not automatically C++23 requirements. Shared ABI or numeric gaps may appear in both trackers and must be kept consistent. Do not mistake the *recommended*, non-conformance-determining quantities in C++23 Annex B for mandatory minimum object or string sizes. Implementation-defined freestanding startup and single-threaded execution do not, by themselves, constitute gaps.

## I. Freestanding C++23 conformance gaps

### Language mode and target integration

- [ ] **Exception-capable C++ language mode:** Support `throw`, `try`/`catch`, exception specifications, propagation, stack unwinding, and destructor cleanup. The AVM C++ configuration currently specifies `-fno-exceptions` and disables unwind-table generation.
- [ ] **Runtime type identification:** Support `typeid` and `dynamic_cast` in the cases required by C++, including polymorphic types, multiple/virtual inheritance, and runtime failure cases. The AVM C++ configuration currently specifies `-fno-rtti`.
- [ ] **C++20 modules:** Support compilation, dependency ordering, interface/implementation units, imports, linking, and cross-translation-unit semantics for language modules in the AVM SDK, including relevant AVM target and toolchain integration. This concerns the core language, not the hosted library modules `std` and `std.compat`.
- [ ] **Coroutines:** Validate and provide AVM lowering and execution for C++20/C++23 coroutine creation, suspension, resumption, destruction, frame allocation, cleanup, and cross-translation-unit references.
- [ ] **Thread storage duration:** Provide correct `thread_local` initialization, access, and destruction for the freestanding execution model AVM advertises, including compiler-generated TLS references and destructors.
- [ ] **64-bit integer-to-floating conversions:** Supply the AVM lowering/runtime helpers needed for conversion of `long long` values to floating-point types; the corresponding target gap is also tracked for C23.
- [ ] **Floating-point type minimums:** Provide conforming `double` and `long double` representations and operations. AVM currently implements both as binary32, below the required minimum precision; keep this item aligned with the shared C23 language/data-model gaps.

### C++ ABI, object lifetime, and exception runtime

- [ ] **Exception ABI:** Provide the target-specific throw/catch ABI, exception-object lifetime and allocation, catch matching, active-exception state, nested/rethrown exceptions, and stack-unwind support, including exceptions thrown from constructors and allocation functions.
- [ ] **Stack cleanup and termination:** Ensure destructors execute for fully constructed automatic subobjects during exception propagation, partial construction, and failed array construction; invoke `std::terminate` for the required failure cases, including violations of `noexcept`.
- [ ] **RTTI ABI:** Emit, retain, and interpret class type descriptors, base-class relationships, vtable RTTI fields, and type names consistently with AVM's packed pointers and PROGMEM representation; support the runtime operations needed by `dynamic_cast`, `typeid`, and catch matching.
- [ ] **Dynamic initialization and destruction:** Complete initialization guards, recursive-initialization handling, and destructor registration/order semantics for namespace-scope, function-local static, and thread-local objects in the supported execution model, including early termination and exception paths.
- [ ] **Required termination callback capacity:** Guarantee registration of at least 32 functions through C++ `std::atexit` and separately through `std::at_quick_exit`, with the specified callback ordering and failure semantics in a conforming C++23 mode. AVM's `atexit` storage is currently linker-capacity-dependent and quick-termination support is missing.

### Fundamental freestanding library headers

- [ ] **`<limits>`:** Validate all `std::numeric_limits` specializations and compile-time properties against AVM fundamental types, including integer, floating-point, character, and pointer-related implementation properties.

### Dynamic allocation — `<new>`

- [ ] **Allocation and deallocation functions:** Provide executable implementations of the replaceable ordinary `operator new`/`operator new[]` and `operator delete`/`operator delete[]` families, including sized, aligned, and nonthrowing overloads, correct zero-size/alignment behavior, and interoperability with the AVM heap. The libc++ header declares the overloads, but the AVM runtime does not yet implement their required allocation and deallocation behavior.
- [ ] **Allocation failure and handlers:** Provide `std::bad_alloc`, `std::bad_array_new_length`, `std::nothrow_t`, `std::nothrow`, `std::new_handler`, `std::get_new_handler`, and `std::set_new_handler`, with the required failure, exception, and retry semantics.

### Exceptions and runtime type headers

- [ ] **`<exception>`:** Provide `std::exception`, `std::bad_exception`, `std::exception_ptr`, `std::current_exception`, `std::make_exception_ptr`, `std::rethrow_exception`, `std::nested_exception`, `std::throw_with_nested`, `std::rethrow_if_nested`, `std::terminate`, `std::get_terminate`, `std::set_terminate`, and other required C++23 exception interfaces with correct behavior.
- [ ] **`<typeinfo>`:** Provide `std::type_info`, `std::bad_cast`, and `std::bad_typeid`, with required equality, ordering, hash/name access, and exceptions on invalid RTTI operations.
- [ ] **`<coroutine>`:** Provide the required `std::coroutine_traits`, `std::coroutine_handle` forms, `std::noop_coroutine`, `std::suspend_always`, `std::suspend_never`, and related operations, connected to the AVM coroutine implementation.

### Core generic library headers

- [ ] **`<type_traits>`:** Validate the complete freestanding C++23 set of type properties, transformations, queries, and variable templates against AVM types, including substitution and constant-expression behavior.
- [ ] **`<concepts>`:** Validate all required C++20/C++23 language, comparison, construction, conversion, and callable concepts.
- [ ] **`<memory>`:** Provide the remaining freestanding-designated pointer, lifetime, allocator-related, and memory utility interfaces, without incorrectly requiring the entire hosted memory-management library.

### Atomics — `<atomic>`

- [ ] **Atomic types and operations:** Provide required `std::atomic<T>`, `std::atomic_ref<T>`, pointer/integral specializations, `atomic_flag`, free-function operations, aliases, memory-order constants, and lock-free property macros, including correct behavior on AVM's distinct pointer representations.
- [ ] **Atomic synchronization:** Implement or correctly lower loads/stores, read-modify-write operations, compare/exchange, fences, and memory-order semantics through the compiler, VM, and required helper routines. Test operations that are not natively lock-free and effects of interpreter interrupts.
- [ ] **Atomic wait/notify:** Provide the required waiting and notification interfaces with correct observable semantics under AVM's documented single-threaded execution model (or a future supported multithreaded model).

### Freestanding termination — `<cstdlib>`

- [ ] **C++ termination interfaces:** Supply the required `std`-namespace declarations/overloads for `abort`, `atexit`, `at_quick_exit`, `exit`, `_Exit`, and `quick_exit`, including their `noexcept`, linkage, and termination contracts. Implement missing quick-exit registration/execution and preserve the distinction from normal termination.

## II. Additional hosted C++23 conformance gaps

### Hosted execution environment and library availability

- [ ] **Hosted mode:** Provide a truthful hosted C++23 compilation/runtime configuration (`__STDC_HOSTED__ == 1`) with the complete hosted language and library contract; AVM currently defaults to freestanding compilation.
- [ ] **Hosted program entry and termination:** Support the standard `main` forms with required `argc`/`argv` guarantees and observable normal/abnormal termination status, including the requirements shared with the hosted C runtime.
- [ ] **Hosted concurrency:** Provide a conforming threading execution model and runtime needed by hosted C++ concurrency and memory-model guarantees, rather than assuming the freestanding single-threaded AVM model suffices.
- [ ] **Standard library distribution:** Complete and validate the hosted C++23 header set, with declarations, overloads, namespaces, feature-test macros, ABI, linkage, and behavior; the AVM SDK currently ships only a configured freestanding libc++ subset.

### Hosted library fundamentals and C compatibility

- [ ] **C-library compatibility headers:** Provide the required C++ wrappers/interfaces for the C17-derived library facilities, including `<cassert>`, `<cctype>`, `<cerrno>`, `<cfenv>`, `<cmath>`, `<ccomplex>`, `<csetjmp>`, `<csignal>`, `<cstdio>`, `<cstdlib>`, `<cstring>`, `<ctime>`, `<cuchar>`, `<cwchar>`, `<cwctype>`, `<cinttypes>`, and related C++23-standard headers, with correct `std`-namespace forms and overloads.
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

- [ ] **Chrono:** Provide `<chrono>` and `<ctime>`-related C++ calendar, clock, duration, time-zone, and formatting facilities, including any required environment services.
- [ ] **Threads and synchronization:** Provide `<thread>`, `<stop_token>`, `<mutex>`, `<shared_mutex>`, `<condition_variable>`, `<semaphore>`, `<latch>`, `<barrier>`, and hosted synchronization and lifetime semantics.
- [ ] **Futures and execution policies:** Provide `<future>`, `<execution>`, and the required asynchronous operation, task, and parallel-algorithm interfaces.
- [ ] **Diagnostics and utility headers:** Provide hosted `<system_error>`, `<stdexcept>`, `<stacktrace>`, `<charconv>`, and other hosted error, stack inspection, and character conversion facilities.

### Standard library modules

- [ ] **C++23 `std` and `std.compat` modules:** Provide and package the standard library named modules with the required exported declarations, interoperability with headers/header units, and AVM compiler/build integration.

---

C++23 reference: [WG21 N4950, C++23 working draft](https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2023/n4950.pdf), especially [freestanding implementations](https://timsong-cpp.github.io/cppwp/std23/compliance), [freestanding items](https://timsong-cpp.github.io/cppwp/std23/freestanding.item), [implementation compliance](https://timsong-cpp.github.io/cppwp/std23/intro.compliance), and [Annex B implementation quantities](https://timsong-cpp.github.io/cppwp/std23/implimits). The C++23 normative C-language reference is ISO/IEC 9899:2018 ([normative references](https://timsong-cpp.github.io/cppwp/std23/intro.refs)).
