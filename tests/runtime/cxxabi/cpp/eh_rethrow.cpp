// Linear rethrow. A catch body executes throw;, and the exception then goes to the next
// handler, which must see the original exception object. Each case checks the handler's
// result, and the counting class checks that rethrow makes no copy and that the object is
// destroyed once. Cleanup frames between handlers and inheritance are in their own
// fixtures, and the no-active-exception termination is in eh_rethrow_no_active.cpp.
#include <stdint.h>

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

// Counts the lifetime events of the thrown object. Rethrow must not construct or copy it.
int constructions = 0;
int copies = 0;
int destructions = 0;

struct Counted {
    int value;
    explicit Counted(int v) : value(v) { ++constructions; }
    Counted(const Counted &other) : value(other.value) { ++copies; }
    ~Counted() { ++destructions; }
};

void reset_counts() {
    constructions = 0;
    copies = 0;
    destructions = 0;
}

// Base and derived classes for the derived-type case. The base is polymorphic, so the
// derived object is the dynamic type that the rethrow keeps.
struct CBase {
    virtual ~CBase() {}
    int tag;
};

struct CDerived : CBase {
    int extra;
};

// The address of the object that the first handler saw, so that the second handler can
// compare it.
const void *first_seen = nullptr;

// A: a basic rethrow of an int. The second handler matches the original value.
__attribute__((noinline)) int basic_rethrow() {
    try {
        try {
            throw 42;
        } catch (int value) {
            if (value != 42)
                return 0;
            throw;
        }
    } catch (int value) {
        return value == 42 ? 1 : 0;
    }
    return 0;
}

// B: a catch-all handler rethrows, and the outer typed handler still matches the value.
__attribute__((noinline)) int catch_all_rethrow() {
    try {
        try {
            throw 23;
        } catch (...) {
            throw;
        }
    } catch (int value) {
        return value == 23 ? 1 : 0;
    }
    return 0;
}

// C: the first handler catches a base reference, and the rethrow matches the derived
// handler, because the matcher uses the original thrown type.
__attribute__((noinline)) int derived_type_rethrow() {
    try {
        try {
            CDerived thrown;
            thrown.tag = 5;
            thrown.extra = 9;
            throw thrown;
        } catch (const CBase &base) {
            if (base.tag != 5)
                return 0;
            throw;
        }
    } catch (const CDerived &derived) {
        return derived.tag == 5 && derived.extra == 9 ? 1 : 0;
    }
    return 0;
}

// D: the second handler sees the object at the address that the first handler saw.
__attribute__((noinline)) int object_identity_rethrow() {
    try {
        try {
            throw Counted(11);
        } catch (const Counted &first) {
            first_seen = &first;
            throw;
        }
    } catch (const Counted &second) {
        return &second == first_seen && second.value == 11 ? 1 : 0;
    }
    return 0;
}

// E: three enclosing handlers. The first two rethrow, and the third ends normally. The
// exception is constructed once, is never copied, and its destructor runs once.
__attribute__((noinline)) int sequential_rethrows() {
    try {
        try {
            try {
                throw Counted(7);
            } catch (const Counted &c) {
                if (c.value != 7)
                    return 0;
                throw;
            }
        } catch (const Counted &c) {
            if (c.value != 7)
                return 0;
            throw;
        }
    } catch (const Counted &c) {
        return c.value == 7 ? 1 : 0;
    }
    return 0;
}

// F: a helper rethrows the exception that its caller's handler is holding. The helper
// has no handler, so the unwinder starts at the helper's rethrow site and continues
// through the caller's landing pad.
__attribute__((noinline)) void rethrow_helper() {
    throw;
}

__attribute__((noinline)) int helper_rethrow() {
    try {
        try {
            throw 31;
        } catch (int) {
            rethrow_helper();
        }
    } catch (int value) {
        return value == 31 ? 1 : 0;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    expect(basic_rethrow() == 1);
    expect(catch_all_rethrow() == 1);
    expect(derived_type_rethrow() == 1);

    reset_counts();
    expect(object_identity_rethrow() == 1);
    expect(constructions == 1 && copies == 0 && destructions == 1);

    reset_counts();
    expect(sequential_rethrows() == 1);
    expect(constructions == 1 && copies == 0 && destructions == 1);

    expect(helper_rethrow() == 1);
    return failures == 0 ? 0 : 1;
}
