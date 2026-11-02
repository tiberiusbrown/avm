// Pointer conversions whose values and descriptors lie above program address 0xFFFF. The
// image places .rodata and .high_far_text above the 16-bit range, so the program-space table
// and the function here have 24-bit addresses, and so do their pointer descriptors. A
// conversion must keep all three bytes of a program pointer or a function pointer, and a
// qualification or noexcept conversion must match with the upper byte intact. The distractor
// clauses come first, so only the converting clause can take the exception.
#include <avm/pgmspace.h>

extern "C" int avm_test_main(void);

// Several handlers below name a pointer before a conversion of it. The order is the point of
// the test, so the warning is disabled.
#pragma clang diagnostic ignored "-Wexceptions"

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

const int AVM_PROGMEM high_table[3] = {10, 20, 30};

int high_calls;

__attribute__((noinline, section(".high_far_text"))) void high_handler() noexcept {
    high_calls = high_calls + 1;
}

struct Base {
    int b;
};

struct Derived : Base {
    int d;
};

// A program pointer that lies above 0xFFFF is caught by its exact type, and by a const-qualified
// void pointer, which keeps all three bytes.
__attribute__((noinline)) int exact_program_pointer() {
    try {
        throw &high_table[1];
    } catch (int AVM_PROGMEM *) {
        return 3;
    } catch (const int AVM_PROGMEM *p) {
        return *p == 20 ? 1 : 2;
    }
    return 0;
}

__attribute__((noinline)) int program_pointer_to_void() {
    try {
        throw &high_table[2];
    } catch (int AVM_PROGMEM *) {
        return 3;
    } catch (const void AVM_PROGMEM *v) {
        return v == static_cast<const void AVM_PROGMEM *>(&high_table[2]) ? 1 : 2;
    }
    return 0;
}

// Removing the const of a program pointer does not match, so the catch-all takes it.
__attribute__((noinline)) int program_pointer_removes_const() {
    try {
        throw &high_table[0];
    } catch (int AVM_PROGMEM *) {
        return 1;
    } catch (...) {
        return 2;
    }
    return 0;
}

// A reference to a program pointer binds to the exception object, with its 24-bit value.
__attribute__((noinline)) int program_pointer_reference() {
    const int AVM_PROGMEM *value = &high_table[1];
    try {
        throw value;
    } catch (const int AVM_PROGMEM *&r) {
        return r == &high_table[1] ? 1 : 2;
    }
    return 0;
}

// A function pointer above 0xFFFF drops noexcept with its full 24-bit value.
__attribute__((noinline)) int high_function_noexcept_removed() {
    void (*fp)() noexcept = &high_handler;
    high_calls = 0;
    try {
        throw fp;
    } catch (int *) {
        return 3;
    } catch (void (*f)()) {
        f();
        return high_calls == 1 && f == &high_handler ? 1 : 2;
    }
    return 0;
}

// A derived pointer to a base pointer uses ordinary RAM, and the pointer descriptors of both
// types lie above 0xFFFF in .rodata. The base is first, so the adjustment is zero.
__attribute__((noinline)) int high_descriptor_base() {
    Derived object{{5}, 6};
    try {
        throw &object;
    } catch (int *) {
        return 3;
    } catch (const Base *b) {
        return b == static_cast<const Base *>(&object) && b->b == 5 ? 1 : 2;
    }
    return 0;
}

// A null function pointer from std::nullptr_t keeps all three bytes zero.
__attribute__((noinline)) int nullptr_high_function() {
    try {
        throw nullptr;
    } catch (void (*f)()) {
        return f == nullptr ? 1 : 2;
    } catch (int *) {
        return 3;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(exact_program_pointer() == 1);
    expect(program_pointer_to_void() == 1);
    expect(program_pointer_removes_const() == 2);
    expect(program_pointer_reference() == 1);
    expect(high_function_noexcept_removed() == 1);
    expect(high_descriptor_base() == 1);
    expect(nullptr_high_function() == 1);
    return failures == 0 ? 0 : 1;
}
