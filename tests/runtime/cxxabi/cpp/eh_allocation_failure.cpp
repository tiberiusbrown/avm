// Exhausts the AVM heap before throwing. __cxa_allocate_exception cannot obtain
// memory for the exception object, so the runtime terminates before any catch
// block runs. The catch block makes no calls, so it needs no cleanup pad.
#include <avm.h>
#include <avm/runtime.h>
#include <stdlib.h>

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

void exhaust_heap() {
    while (malloc(1) != nullptr) {
    }
}

} // namespace

extern "C" int avm_test_main(void) {
    avm_debug_putc('A');
    exhaust_heap();
    try {
        fail();
    } catch (...) {
        return 0;
    }
    return 1;
}
