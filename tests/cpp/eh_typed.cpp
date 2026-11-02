// Exact typed catches. Each catch matches only the descriptor whose address equals
// the thrown object's, so these cases test the first matching clause, the catch-all
// fallback, cleanups around nonmatching catches, and combined cleanup-and-catch pads.
// Inheritance, reference and pointer conversions, and rethrow are not exercised here.
#include "support/eh_typed.h"

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

volatile int log_entries[16];
volatile int log_count;

__attribute__((always_inline)) inline void log_append(int tag) {
    log_entries[log_count] = tag;
    log_count = log_count + 1;
}

// A local that logs its tag when it is destroyed.
struct Logger {
    int tag;
    Logger(int t) : tag(t) {}
    ~Logger() { log_append(tag); }
};

struct Value {
    int x;
};

// Same representation as Value, and a distinct type.
struct Twin {
    int x;
};

struct Member {
    int m;
};

enum Color { Red, Green };

int live_objects;

// Counts the live copies, so a by-value catch can be checked for leaks.
struct Tracked {
    int tag;
    Tracked(int t) : tag(t) { ++live_objects; }
    Tracked(const Tracked &other) : tag(other.tag) { ++live_objects; }
    ~Tracked() { --live_objects; }
};

char pointee_char = 'x';
int pointee_int = 5;

__attribute__((noinline)) void unit_handler(int) {}

__attribute__((noinline)) void throw_int_from_callee() {
    throw 5;
}

// A: the first matching clause wins, and it is the one that names int.
__attribute__((noinline)) int basic_int() {
    try {
        throw 42;
    } catch (float) {
        return 1;
    } catch (int) {
        return 2;
    } catch (...) {
        return 3;
    }
    return 0;
}

// B: a type no typed clause names reaches the catch-all.
__attribute__((noinline)) int catch_all_fallback() {
    try {
        throw 'c';
    } catch (float) {
        return 1;
    } catch (int) {
        return 2;
    } catch (...) {
        return 3;
    }
    return 0;
}

// C: exact class by const reference.
__attribute__((noinline)) int catch_reference() {
    try {
        throw Value{17};
    } catch (const Value &v) {
        return v.x == 17 ? 1 : 0;
    }
    return 0;
}

// D: exact class by value. The local is destroyed during unwinding, and the
// exception object and the catch parameter are alive in the handler.
__attribute__((noinline)) int catch_by_value() {
    try {
        Tracked t(9);
        throw t;
    } catch (Tracked copy) {
        return copy.tag == 9 && live_objects == 2 ? 1 : 0;
    }
    return 0;
}

// E: an inner handler that does not match lets the outer typed handler run.
__attribute__((noinline)) int nested_nonmatching() {
    try {
        try {
            throw 42;
        } catch (float) {
            return 1;
        }
    } catch (int) {
        return 2;
    }
    return 0;
}

// F: a frame whose only handler does not match runs its destructor, and then the
// outer handler takes the exception. The order is the destructor, then the catch.
__attribute__((noinline)) void middle_frame() {
    Logger local(7);
    try {
        throw_int_from_callee();
    } catch (float) {
        log_append(1);
    }
}

__attribute__((noinline)) int cleanup_across_nonmatch() {
    try {
        middle_frame();
    } catch (int) {
        log_append(9);
        return 1;
    }
    return 0;
}

// G: a landing pad with a cleanup and a matching typed catch. The local is
// destroyed before the handler body runs.
__attribute__((noinline)) int cleanup_then_matching_catch() {
    try {
        Logger local(3);
        throw_int_from_callee();
    } catch (int v) {
        log_append(v + 10);
    }
    return 1;
}

// H: the nearest matching handler wins, and the outer handler is skipped.
__attribute__((noinline)) int nearest_handler() {
    try {
        try {
            throw_int_from_callee();
        } catch (int) {
            return 1;
        }
    } catch (int) {
        return 2;
    }
    return 0;
}

// I: fundamental types, each caught by its exact type with a distractor first.
__attribute__((noinline)) int fundamental_int() {
    try {
        throw -5;
    } catch (unsigned int) {
        return 1;
    } catch (int v) {
        return v == -5 ? 2 : 3;
    }
    return 0;
}

__attribute__((noinline)) int fundamental_unsigned() {
    try {
        throw 7u;
    } catch (int) {
        return 1;
    } catch (unsigned int v) {
        return v == 7u ? 2 : 3;
    }
    return 0;
}

__attribute__((noinline)) int fundamental_long_long() {
    try {
        throw 0x123456789LL;
    } catch (int) {
        return 1;
    } catch (long long v) {
        return v == 0x123456789LL ? 2 : 3;
    }
    return 0;
}

__attribute__((noinline)) int fundamental_float() {
    try {
        throw 1.5f;
    } catch (double) {
        return 1;
    } catch (float v) {
        return v == 1.5f ? 2 : 3;
    }
    return 0;
}

__attribute__((noinline)) int fundamental_bool() {
    try {
        throw true;
    } catch (int) {
        return 1;
    } catch (bool b) {
        return b ? 2 : 3;
    }
    return 0;
}

// J: an enumeration, caught by its exact type after a distractor.
__attribute__((noinline)) int enum_exact() {
    try {
        throw Green;
    } catch (int) {
        return 1;
    } catch (Color c) {
        return c == Green ? 2 : 3;
    }
    return 0;
}

// K: pointers. int* is caught by its exact pointer type, and const char* by its
// exact const-qualified type. A function pointer is caught by its exact type.
__attribute__((noinline)) int pointer_int() {
    try {
        throw &pointee_int;
    } catch (char *) {
        return 1;
    } catch (int *p) {
        return *p == 5 ? 2 : 3;
    }
    return 0;
}

__attribute__((noinline)) int pointer_const_char() {
    try {
        throw static_cast<const char *>(&pointee_char);
    } catch (int *) {
        return 1;
    } catch (const char *s) {
        return *s == 'x' ? 2 : 3;
    }
    return 0;
}

__attribute__((noinline)) int pointer_function() {
    try {
        throw &unit_handler;
    } catch (int *) {
        return 1;
    } catch (void (*fp)(int)) {
        return fp == &unit_handler ? 2 : 3;
    }
    return 0;
}

// L: a pointer to a data member, caught by its exact type.
__attribute__((noinline)) int pointer_to_member() {
    int Member::*pm = &Member::m;
    try {
        throw pm;
    } catch (int *) {
        return 1;
    } catch (int Member::*q) {
        return q == &Member::m ? 2 : 3;
    }
    return 0;
}

// M: the descriptor thrown by the support unit matches the one this unit names.
// Twin has the same layout as Remote and must not match.
__attribute__((noinline)) int cross_unit_exact() {
    try {
        eh_typed_throw_remote(23);
    } catch (const Twin &) {
        return 1;
    } catch (const Remote &r) {
        return r.x == 23 ? 2 : 3;
    }
    return 0;
}

// N: two unrelated classes with identical fields. Only the exact class matches.
__attribute__((noinline)) int distinct_same_layout() {
    try {
        throw Value{5};
    } catch (Twin &) {
        return 1;
    } catch (const Value &v) {
        return v.x == 5 ? 2 : 3;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(basic_int() == 2);
    expect(catch_all_fallback() == 3);
    expect(catch_reference() == 1);
    expect(catch_by_value() == 1);
    expect(live_objects == 0);
    expect(nested_nonmatching() == 2);

    log_count = 0;
    expect(cleanup_across_nonmatch() == 1);
    expect(log_count == 2 && log_entries[0] == 7 && log_entries[1] == 9);

    log_count = 0;
    expect(cleanup_then_matching_catch() == 1);
    expect(log_count == 2 && log_entries[0] == 3 && log_entries[1] == 15);

    expect(nearest_handler() == 1);
    expect(fundamental_int() == 2);
    expect(fundamental_unsigned() == 2);
    expect(fundamental_long_long() == 2);
    expect(fundamental_float() == 2);
    expect(fundamental_bool() == 2);
    expect(enum_exact() == 2);
    expect(pointer_int() == 2);
    expect(pointer_const_char() == 2);
    expect(pointer_function() == 2);
    expect(pointer_to_member() == 2);
    expect(cross_unit_exact() == 2);
    expect(distinct_same_layout() == 2);
    return failures == 0 ? 0 : 1;
}
