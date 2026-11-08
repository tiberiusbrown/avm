// A destructor that throws while another exception is unwinding. The throw in
// the destructor is a second active exception, which the Stage 2 runtime does not
// nest. It must terminate at once, so the catch in avm_test_main never runs. The
// output is D from the destructor, then the halt report.
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

struct Thrower {
    ~Thrower() noexcept(false) {
        avm_debug_putc('D');
        throw 5;
    }
};

__attribute__((noinline)) void leaf() {
    throw 4;
}

__attribute__((noinline)) void middle() {
    Thrower guard;
    leaf();
}

} // namespace

extern "C" int avm_test_main(void) {
    try {
        middle();
    } catch (...) {
        avm_debug_putc('C');
    }
    return 0;
}
