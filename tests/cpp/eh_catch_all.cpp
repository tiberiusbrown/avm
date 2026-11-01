// Stage 1 catch-all exception fixture. The eh_ prefix keeps it out of the
// ordinary C++ matrix, which is built with -fno-exceptions. avm_eh_catch_all_run
// builds it with -fexceptions and selects it by name.

extern "C" int avm_test_main(void);

namespace {

int failures = 0;

void expect(bool ok) {
    if (!ok)
        ++failures;
}

// Milestone chain: inner -> middle -> outer -> the handler in demo_main.
__attribute__((noinline)) void inner() {
    throw 42;
}

__attribute__((noinline)) void middle() {
    inner();
}

__attribute__((noinline)) void outer() {
    middle();
}

__attribute__((noinline)) int demo_main() {
    try {
        outer();
    } catch (...) {
        return 0;
    }
    return 1;
}

// A: direct catch from the immediate callee.
__attribute__((noinline)) void throw_value(int value) {
    throw value;
}

__attribute__((noinline)) int direct_catch() {
    try {
        throw_value(7);
    } catch (...) {
        return 1;
    }
    return 0;
}

// C: the nearest enclosing handler is selected. An inner handler in the same
// frame wins over the outer one, and a frame without a handler is passed.
__attribute__((noinline)) void raise() {
    throw 1;
}

__attribute__((noinline)) void pass_through() {
    raise();
}

__attribute__((noinline)) int nearest_handler() {
    try {
        try {
            raise();
        } catch (...) {
            return 10;
        }
    } catch (...) {
        return 20;
    }
    return 0;
}

__attribute__((noinline)) int outer_handler() {
    try {
        pass_through();
    } catch (...) {
        return 20;
    }
    return 0;
}

// D: a try region that does not throw runs its ordinary control flow.
__attribute__((noinline)) int nonthrowing() {
    int sum = 0;
    try {
        sum = 5;
    } catch (...) {
        sum = -1;
    }
    return sum + 1;
}

// E: one branch throws and the other returns normally.
__attribute__((noinline)) void maybe_throw(bool should_throw) {
    if (should_throw)
        throw 9;
}

__attribute__((noinline)) int conditional(bool should_throw) {
    try {
        maybe_throw(should_throw);
        return 0;
    } catch (...) {
        return 1;
    }
}

// F: the call from relaxed_frame to raise_nearby sits next to its callee, so
// LLD can shorten it. The throw crosses that shortened call.
__attribute__((noinline)) void raise_nearby() {
    throw 2;
}

volatile int after_relaxed_call = 0;

__attribute__((noinline)) void relaxed_frame() {
    raise_nearby();
    after_relaxed_call = 1;
}

__attribute__((noinline)) int relaxed_call() {
    try {
        relaxed_frame();
    } catch (...) {
        return 2;
    }
    return 0;
}

// G: the throwing frame and the handler frame both use outgoing stack
// arguments. The handler must resume with its own local intact.
__attribute__((noinline)) void throw_with_arguments(int a, int b, int c, int d,
                                                     int e, int f, int g, int h) {
    if (a + b + c + d + e + f + g + h == 36)
        throw h;
}

__attribute__((noinline)) int stack_arguments(int seed) {
    volatile int marker = seed * 3;
    try {
        throw_with_arguments(1, 2, 3, 4, 5, 6, 7, 8);
    } catch (...) {
        return marker == seed * 3 ? 0 : 1;
    }
    return 1;
}

// H: an intervening frame has a variable-sized object, so its CFA is r3-based.
__attribute__((noinline)) void dynamic_frame(int count) {
    volatile char *buffer =
        static_cast<volatile char *>(__builtin_alloca(count));
    buffer[0] = static_cast<char>(count);
    throw_value(count);
}

__attribute__((noinline)) int dynamic_stack(int count) {
    volatile int marker = count + 1;
    try {
        dynamic_frame(count);
    } catch (...) {
        return marker == count + 1 ? 0 : 1;
    }
    return 1;
}

} // namespace

// Not referenced by the test, so --gc-sections discards it. Its call-site records
// must be discarded with it, or the packer would reject them.
extern "C" int unreferenced_handler(void) {
    try {
        throw_value(3);
    } catch (...) {
        return 3;
    }
    return 0;
}

extern "C" int avm_test_main(void) {
    expect(demo_main() == 0);
    expect(direct_catch() == 1);
    expect(nearest_handler() == 10);
    expect(outer_handler() == 20);
    expect(relaxed_call() == 2);
    expect(nonthrowing() == 6);
    expect(conditional(true) == 1);
    expect(conditional(false) == 0);
    expect(stack_arguments(5) == 0);
    expect(dynamic_stack(4) == 0);
    return failures == 0 ? 0 : 1;
}
