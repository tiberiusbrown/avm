// An uncaught exception has no handler on any frame. The unwinder must
// terminate before running any catch code. The output is the U marker, then
// the halt report.
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

__attribute__((noinline)) void fail() {
    throw 3;
}

} // namespace

extern "C" int avm_test_main(void) {
    avm_debug_putc('U');
    fail();
    avm_debug_putc('X');
    return 0;
}
