// A failed dynamic_cast to a reference type throws std::bad_cast through __cxa_bad_cast.
// The fixture is built with -frtti and -fexceptions. Each case is a noinline function, so the
// static stack bound is the largest case. The probe counts the throw lifecycle; this file
// checks the observable behavior of each catch.
#include <stdint.h>
#include <string.h>
#include <exception>
#include <typeinfo>

#include "../c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

namespace {

struct Base {
    virtual ~Base() = default;
};

struct Derived : Base {};

struct Unrelated : Base {};

struct Left {
    virtual ~Left() = default;
    int left_value = 0;
};

struct Right {
    virtual ~Right() = default;
    int right_value = 0;
};

struct Both : Left, Right {};

Derived derived_object;
Unrelated unrelated_object;
Both both_object;

// The log records the order of destructors and handlers.
int log_entries[4];
int log_count = 0;

void log_append(int tag) {
    log_entries[log_count++] = tag;
}

struct Trace {
    int tag;
    ~Trace() { log_append(tag); }
};

// Each reference cast is in a noinline function, so the static stack bound is per case.
__attribute__((noinline)) Derived &derived_of(Base &value) {
    return dynamic_cast<Derived &>(value);
}

__attribute__((noinline)) Right &right_of(Left &value) {
    return dynamic_cast<Right &>(value);
}

// The reference is cast in a frame that holds a destructor, so the trace runs during
// unwinding, before the handler in the caller.
__attribute__((noinline)) void failing_cast_with_trace(Base &value) {
    Trace trace{7};
    (void)dynamic_cast<Derived &>(value);
}

// A. A successful derived-reference cast returns the object.
__attribute__((noinline)) int check_derived_reference() {
    Base &base = derived_object;
    CHECK(&derived_of(base) == &derived_object);
    return 0;
}

// B. A successful cross-reference cast returns the adjusted subobject.
__attribute__((noinline)) int check_cross_reference() {
    Left &left = both_object;
    CHECK(&right_of(left) == static_cast<Right *>(&both_object));
    return 0;
}

// C. A failed reference cast throws std::bad_cast, which the handler catches by its type.
__attribute__((noinline)) int check_failed_reference_by_type() {
    bool caught = false;
    Base &base = unrelated_object;
    try {
        (void)derived_of(base);
    } catch (const std::bad_cast &) {
        caught = true;
    }
    CHECK(caught);
    return 0;
}

// D. The same exception is caught through its public base, std::exception.
__attribute__((noinline)) int check_failed_reference_as_exception() {
    bool caught = false;
    Base &base = unrelated_object;
    try {
        (void)derived_of(base);
    } catch (const std::exception &) {
        caught = true;
    }
    CHECK(caught);
    return 0;
}

// E. what() dispatches virtually through std::exception&, and it names the class.
__attribute__((noinline)) int check_what_virtual() {
    bool text_ok = false;
    Base &base = unrelated_object;
    try {
        (void)derived_of(base);
    } catch (const std::exception &e) {
        text_ok = strcmp(e.what(), "std::bad_cast") == 0;
    }
    CHECK(text_ok);
    return 0;
}

// F. what() returns a stable, nonempty string for the same object, and the string is
// the same on each call.
__attribute__((noinline)) int check_what_stable() {
    bool stable = false;
    Base &base = unrelated_object;
    try {
        (void)derived_of(base);
    } catch (const std::bad_cast &e) {
        const char *first = e.what();
        const char *second = e.what();
        stable = first != nullptr && strlen(first) > 0 && first == second;
    }
    CHECK(stable);
    return 0;
}

// G. An automatic object in the failing frame is destroyed before the handler runs.
__attribute__((noinline)) int check_cleanup_order() {
    log_count = 0;
    bool caught = false;
    Base &base = unrelated_object;
    try {
        failing_cast_with_trace(base);
    } catch (const std::bad_cast &) {
        log_append(9);
        caught = true;
    }
    CHECK(caught);
    CHECK(log_count == 2);
    CHECK(log_entries[0] == 7);
    CHECK(log_entries[1] == 9);
    return 0;
}

// H. The caught object's dynamic type is std::bad_cast.
__attribute__((noinline)) int check_identity() {
    bool identity = false;
    Base &base = unrelated_object;
    try {
        (void)derived_of(base);
    } catch (const std::bad_cast &e) {
        identity = typeid(e) == typeid(std::bad_cast);
    }
    CHECK(identity);
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    if (check_derived_reference() != 0)
        return 1;
    if (check_cross_reference() != 0)
        return 1;
    if (check_failed_reference_by_type() != 0)
        return 1;
    if (check_failed_reference_as_exception() != 0)
        return 1;
    if (check_what_virtual() != 0)
        return 1;
    if (check_what_stable() != 0)
        return 1;
    if (check_cleanup_order() != 0)
        return 1;
    if (check_identity() != 0)
        return 1;

    test_puts("rtti-dynamic-cast-bad-cast=ok\n");
    return 0;
}
