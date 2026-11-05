// std::exception_ptr, std::current_exception, std::rethrow_exception, nested throws from
// catch bodies, and std::uncaught_exceptions, without RTTI. A pointer can rethrow the innermost
// handled exception from its handler when a catch outside that handler receives it. A rethrow
// that a catch inside the same handler receives is the overlapping-catch case, which the runtime
// still rejects, so the fixture avoids it.
//
// The guest stack is 256 bytes across the whole call tree, and an O0 frame keeps every local.
// The exception pointers therefore live at file scope, and each check is a small function that
// avm_test_main calls in turn.
#include <exception>

extern "C" int avm_test_main(void);

namespace {

int live_tracked;

struct Tracked {
    Tracked() { ++live_tracked; }
    Tracked(const Tracked &) { ++live_tracked; }
    ~Tracked() { --live_tracked; }
};

struct Outer {
    int value;
};

struct Inner {
    int value;
};

std::exception_ptr kept;
std::exception_ptr outer_ptr;
std::exception_ptr saved;
std::exception_ptr held;

int uncaught_seen = -1;

struct Observer {
    ~Observer() { uncaught_seen = std::uncaught_exceptions(); }
};

// A throw from a catch body is caught by a handler that the catch body contains.
int check_nested_throw() {
    try {
        try {
            throw Outer{1};
        } catch (Outer &o) {
            try {
                throw Inner{o.value + 1};
            } catch (Inner &i) {
                return i.value == 2 ? 0 : 1;
            }
        }
    } catch (...) {
        return 2;
    }
    return 3;
}

// A throw that leaves a catch body ends that catch first, so the outer handler sees the inner
// exception.
int check_throw_leaving_handler() {
    try {
        try {
            throw Outer{3};
        } catch (Outer &) {
            throw Inner{4};
        }
    } catch (Inner &i) {
        return i.value == 4 ? 0 : 1;
    }
    return 2;
}

// An exception_ptr copy keeps the object alive after its handler ends.
int check_copy_keeps_object() {
    live_tracked = 0;
    try {
        throw Tracked();
    } catch (Tracked &) {
        kept = std::current_exception();
    }
    if (live_tracked != 1)
        return 1;
    try {
        std::rethrow_exception(kept);
    } catch (Tracked &) {
    }
    if (live_tracked != 1)
        return 2;
    std::exception_ptr copy = kept;
    if (copy != kept || !copy)
        return 3;
    kept = std::exception_ptr();
    copy = std::exception_ptr();
    return live_tracked == 0 ? 0 : 4;
}

// The current exception is the innermost handled one. Once the inner handler ends, the outer
// exception is current again.
int check_current_is_innermost() {
    try {
        throw 42;
    } catch (int) {
        outer_ptr = std::current_exception();
        try {
            throw 7;
        } catch (int) {
            if (!std::current_exception() || std::current_exception() == outer_ptr)
                return 1;
        }
        if (std::current_exception() != outer_ptr)
            return 2;
    }
    return std::current_exception() ? 3 : 0;
}

int check_rethrow_outer_after_handler() {
    try {
        std::rethrow_exception(outer_ptr);
    } catch (int v) {
        return v == 42 ? 0 : 1;
    }
    return 2;
}

// A handler rethrows the exception it handles, and a catch outside the handler receives it.
int check_rethrow_from_handler() {
    try {
        try {
            throw 9;
        } catch (int) {
            std::rethrow_exception(std::current_exception());
        }
    } catch (int v) {
        return v == 9 ? 0 : 1;
    }
    return 2;
}

// An exception_ptr built by make_exception_ptr rethrows the object it holds, any number of times.
int check_make_exception_ptr() {
    saved = std::make_exception_ptr(Inner{12});
    if (!saved)
        return 1;
    for (int round = 0; round < 2; ++round) {
        try {
            std::rethrow_exception(saved);
        } catch (Inner &i) {
            if (i.value != 12)
                return 2;
        }
    }
    std::exception_ptr empty;
    if (empty || empty == saved)
        return 3;
    saved = std::exception_ptr();
    return 0;
}

// Releasing a pointer inside a handler does not free the object the handler still uses.
int check_release_inside_handler() {
    try {
        throw Inner{15};
    } catch (Inner &i) {
        held = std::current_exception();
        held = std::exception_ptr();
        if (i.value != 15)
            return 1;
    }
    return 0;
}

// uncaught_exceptions reports the exception during unwinding, and none afterwards.
int check_uncaught_exceptions() {
    uncaught_seen = -1;
    try {
        Observer observer;
        throw 5;
    } catch (int) {
    }
    if (uncaught_seen != 1)
        return 1;
    return std::uncaught_exceptions() == 0 ? 0 : 2;
}

// bad_exception is an exception with its own description.
int check_bad_exception() {
    try {
        throw std::bad_exception();
    } catch (const std::exception &failure) {
        return failure.what() && failure.what()[0] == 's' ? 0 : 1;
    }
    return 2;
}

} // namespace

extern "C" int avm_test_main(void) {
    if (int status = check_nested_throw())
        return 10 + status;
    if (int status = check_throw_leaving_handler())
        return 20 + status;
    if (std::current_exception())
        return 30;
    if (int status = check_copy_keeps_object())
        return 40 + status;
    if (int status = check_current_is_innermost())
        return 50 + status;
    if (int status = check_rethrow_outer_after_handler())
        return 60 + status;
    if (int status = check_rethrow_from_handler())
        return 70 + status;
    if (int status = check_make_exception_ptr())
        return 80 + status;
    if (int status = check_release_inside_handler())
        return 90 + status;
    if (int status = check_uncaught_exceptions())
        return 100 + status;
    if (int status = check_bad_exception())
        return 110 + status;
    return 0;
}
