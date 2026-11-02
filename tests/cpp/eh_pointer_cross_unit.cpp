// A pointer to a derived class is thrown by one translation unit and caught as a base pointer
// by another. The descriptors of PDerived and PRight are linkonce_odr in both units, so the link
// must keep one descriptor for each type. The catch converts the pointer to PRight, which lies at
// offset two of PDerived, so the converted value is the unit's object address plus two. A void
// catch keeps the thrown value, and a catch of the exact pointer by reference binds to it. Each
// function names its handler first, because the first matching clause takes the exception.
#include "support/eh_pointer_conversion.h"

extern "C" int avm_test_main(void);

// Several handlers below name a base before its derived class, or a pointer before a
// conversion of it. The order is the point of the test, so the warning is disabled.
#pragma clang diagnostic ignored "-Wexceptions"

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

// The converted pointer names PRight inside the unit's object.
__attribute__((noinline)) int catch_right() {
    const PDerived *expected = static_cast<const PDerived *>(eh_pointer_object_address());
    try {
        eh_pointer_throw_derived();
    } catch (const PRight *r) {
        return r == static_cast<const PRight *>(expected) ? 1 : 2;
    } catch (const PBase *) {
        return 3;
    }
    return 0;
}

// The same thrown pointer, caught as void with its exact value.
__attribute__((noinline)) int catch_void() {
    const void *expected = eh_pointer_object_address();
    try {
        eh_pointer_throw_derived();
    } catch (const void *v) {
        return v == expected ? 1 : 2;
    } catch (const PRight *) {
        return 3;
    }
    return 0;
}

// A non-const pointer caught by reference names the exact PDerived pointer type that the unit
// threw. The reference binds to the caught pointer object, so it compares the thrown value.
__attribute__((noinline)) int catch_exact_reference() {
    PDerived *expected = static_cast<PDerived *>(eh_pointer_object_address());
    try {
        eh_pointer_throw_derived();
    } catch (PDerived *&r) {
        return r == expected ? 1 : 2;
    } catch (const PRight *) {
        return 3;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(catch_right() == 1);
    expect(catch_void() == 1);
    expect(catch_exact_reference() == 1);
    return failures == 0 ? 0 : 1;
}
