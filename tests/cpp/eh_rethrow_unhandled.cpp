// A rethrow with no enclosing handler. Phase one finds no handler, so the unwinder
// terminates before any cleanup. The thrown object's destructor prints D, so the output
// must be the U marker and the halt report alone. A D would mean the rethrow destroyed
// or freed the exception before the search failed.
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

struct Noisy {
    ~Noisy() { avm_debug_putc('D'); }
};

__attribute__((noinline)) void rethrow_unhandled() {
    try {
        throw Noisy{};
    } catch (const Noisy &) {
        throw;
    }
}

} // namespace

extern "C" int avm_test_main(void) {
    avm_debug_putc('U');
    rethrow_unhandled();
    avm_debug_putc('X');
    return 0;
}
