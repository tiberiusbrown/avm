// A rethrow caught by a nested handler inside the still-active original catch. The
// abandoned catch has not been released when the nested handler is reached, because its
// own cleanup is not on the path. The nested catch must not begin, and the program
// terminates with the C marker, then the halt report. The Y after the call never runs.
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

__attribute__((noinline)) void nested_catch_of_rethrow() {
    try {
        throw;
    } catch (int) {
        avm_debug_putc('X');
    }
}

} // namespace

extern "C" int avm_test_main(void) {
    try {
        throw 3;
    } catch (int) {
        avm_debug_putc('C');
        nested_catch_of_rethrow();
        avm_debug_putc('Y');
    }
    return 0;
}
