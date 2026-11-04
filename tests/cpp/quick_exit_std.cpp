extern "C" int avm_test_main(void);
#include <cstdlib>
#include <avm.h>
#include <avm/runtime.h>

/* quick_exit reaches _Exit, which halts without the CRT report. */
extern "C" __attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('P');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {}
}

static void quick_callback() { avm_debug_putc('Q'); }
static void atexit_callback() { avm_debug_putc('A'); }

int avm_test_main(void) {
    if (std::atexit(atexit_callback) || std::at_quick_exit(quick_callback)) return 1;
    std::quick_exit(0);
}
