// A rethrow from a destructor that runs while another exception is propagating. Nothing
// is being handled at that point, so throw; has no exception to rethrow. The rethrow
// getter must terminate before any handler runs. The output is D from the destructor,
// then the halt report.
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

struct Rethrower {
    ~Rethrower() noexcept(false) {
        avm_debug_putc('D');
        throw;
    }
};

__attribute__((noinline)) void propagate() {
    Rethrower guard;
    throw 4;
}

} // namespace

extern "C" int avm_test_main(void) {
    try {
        propagate();
    } catch (int) {
        avm_debug_putc('X');
    }
    return 0;
}
