// The fixture evaluates side-effecting operands of polymorphic typeid on purpose, and
// Clang warns about exactly that. The warning is silenced for this file only.
#pragma clang diagnostic ignored "-Wpotentially-evaluated-expression"

#include <stdint.h>
#include <string.h>
#include <exception>
#include <type_traits>
#include <typeinfo>

#include "../c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

// This fixture is built with -frtti and -fexceptions. A null operand of a polymorphic
// typeid must throw std::bad_typeid, which the handlers below catch by their types.
// Each case is its own function, so the static stack bound is the largest case.
static_assert(std::is_base_of<std::exception, std::bad_typeid>::value);

namespace {

struct Base {
    virtual ~Base() = default;
};

struct Derived : Base {};

Derived derived_object;

// The operand is evaluated once, and the call is not inlined, so the null pointer
// reaches the null check at run time.
__attribute__((noinline)) Base *null_base(int *count) {
    ++*count;
    return nullptr;
}

__attribute__((noinline)) Base *derived_base(int *count) {
    ++*count;
    return &derived_object;
}

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

// The automatic object must be destroyed while the exception unwinds through this
// frame, which happens before the handler in the caller runs.
__attribute__((noinline)) void dereference_with_trace(Base *value) {
    Trace trace{7};
    (void)typeid(*value);
}

// A. A null polymorphic pointer throws, and the handler runs.
__attribute__((noinline)) int check_null_pointer() {
    bool caught = false;
    try {
        Base *p = nullptr;
        (void)typeid(*p);
    } catch (const std::bad_typeid &) {
        caught = true;
    }
    CHECK(caught);
    return 0;
}

// B. The operand is evaluated once, and the null result throws.
// C. A nonnull operand is also evaluated once, and it names its dynamic type.
__attribute__((noinline)) int check_evaluation() {
    int calls = 0;
    bool caught = false;
    try {
        (void)typeid(*null_base(&calls));
    } catch (const std::bad_typeid &) {
        caught = true;
    }
    CHECK(calls == 1);
    CHECK(caught);

    calls = 0;
    const std::type_info &dynamic = typeid(*derived_base(&calls));
    CHECK(calls == 1);
    CHECK(&dynamic == &typeid(Derived));
    return 0;
}

// D. The exception is caught through its public base, std::exception.
__attribute__((noinline)) int check_public_base() {
    int calls = 0;
    bool caught_as_exception = false;
    try {
        (void)typeid(*null_base(&calls));
    } catch (const std::exception &) {
        caught_as_exception = true;
    }
    CHECK(caught_as_exception);
    return 0;
}

// E. what() returns a nonempty string, and it is stable across calls. The virtual
// call through std::exception& returns the same string.
__attribute__((noinline)) int check_what() {
    int calls = 0;
    bool text_ok = false;
    bool text_stable = false;
    bool text_virtual = false;
    try {
        (void)typeid(*null_base(&calls));
    } catch (const std::bad_typeid &e) {
        const char *first = e.what();
        text_ok = first != nullptr && strlen(first) > 0;
        text_stable = strcmp(first, e.what()) == 0;
        const std::exception &base = e;
        text_virtual = strcmp(base.what(), "std::bad_typeid") == 0 &&
                       strcmp(first, base.what()) == 0;
    }
    CHECK(text_ok);
    CHECK(text_stable);
    CHECK(text_virtual);
    return 0;
}

// F. Inside the handler, the caught object's dynamic type is std::bad_typeid. The
// handler throws nothing further.
__attribute__((noinline)) int check_identity() {
    int calls = 0;
    bool identity = false;
    try {
        (void)typeid(*null_base(&calls));
    } catch (const std::bad_typeid &e) {
        identity = &typeid(e) == &typeid(std::bad_typeid) &&
                   typeid(e) == typeid(std::bad_typeid);
    }
    CHECK(identity);
    return 0;
}

// G. An automatic object in a frame that the exception unwinds through is destroyed
// before the outer handler runs.
__attribute__((noinline)) int check_cleanup_order() {
    log_count = 0;
    bool caught = false;
    try {
        dereference_with_trace(nullptr);
    } catch (const std::bad_typeid &) {
        log_append(9);
        caught = true;
    }
    CHECK(caught);
    CHECK(log_count == 2);
    CHECK(log_entries[0] == 7);
    CHECK(log_entries[1] == 9);
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    if (check_null_pointer() != 0)
        return 1;
    if (check_evaluation() != 0)
        return 1;
    if (check_public_base() != 0)
        return 1;
    if (check_what() != 0)
        return 1;
    if (check_identity() != 0)
        return 1;
    if (check_cleanup_order() != 0)
        return 1;

    test_puts("rtti-bad-typeid=ok\n");
    return 0;
}
