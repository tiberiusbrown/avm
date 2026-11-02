// Exact matching does not convert a thrown class to one of its bases. A Derived
// object thrown past catch(Base &) matches no clause, so no frame has a handler, and
// the unwinder terminates before any catch runs. Inheritance matching is not
// implemented, so this fixture documents that limit rather than a supported case.
// The output is the U marker, then the halt report.
#include <avm.h>
#include <avm/runtime.h>

extern "C" int avm_test_main(void);

// The runtime's halt spins, so the harness would wait for its time limit. Report
// the termination, then break, as the termination fixtures do.
extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('H');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {
    }
}

namespace {

struct Base {
    int b;
};

struct Derived : Base {
    int d;
};

__attribute__((noinline)) void throw_derived() {
    throw Derived{{1}, 2};
}

__attribute__((noinline)) int catch_base() {
    try {
        throw_derived();
    } catch (Base &) {
        return 1;
    }
    return 0;
}

} // namespace

extern "C" int avm_test_main(void) {
    avm_debug_putc('U');
    catch_base();
    avm_debug_putc('X');
    return 0;
}
