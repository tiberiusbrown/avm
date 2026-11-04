// A rethrow with no active exception must terminate deterministically. The function
// that contains throw; runs with nothing being handled, so the rethrow getter aborts
// before any exception header is touched. The output is the N marker, then the halt
// report.
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

__attribute__((noinline)) void rethrow_without_handler() {
    throw;
}

} // namespace

extern "C" int avm_test_main(void) {
    avm_debug_putc('N');
    rethrow_without_handler();
    avm_debug_putc('X');
    return 0;
}
