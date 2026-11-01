// Cleanup-bearing frames with no enclosing handler. Phase one searches every frame,
// finds no catch-all, and terminates before any destructor runs. The Noisy
// destructors print D, so the output must be the halt report alone. A D would mean
// that cleanup ran before the handler search had succeeded.
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

__attribute__((noinline)) void leaf() {
    Noisy inner;
    throw 4;
}

__attribute__((noinline)) void middle() {
    Noisy outer;
    leaf();
}

} // namespace

extern "C" int avm_test_main(void) {
    middle();
    return 0;
}
