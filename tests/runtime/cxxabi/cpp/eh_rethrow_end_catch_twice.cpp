// A second __cxa_end_catch with no active exception. The first call ends the catch that
// the program began, and the second has nothing to end, so the runtime terminates. The
// output is E from before the first call, then the halt report.
#include <avm.h>
#include <avm/runtime.h>

extern "C" int avm_test_main(void);
extern "C" void __cxa_end_catch(void);

// The runtime's halt spins, so the harness would wait for its time limit. Report
// the termination, then break, as the termination fixtures do.
extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('H');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {
    }
}

extern "C" int avm_test_main(void) {
    try {
        throw 6;
    } catch (int) {
        avm_debug_putc('E');
        __cxa_end_catch();
        __cxa_end_catch();
        avm_debug_putc('X');
    }
    return 0;
}
