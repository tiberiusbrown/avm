#include <stdlib.h>
#include <avm.h>
#include <avm/runtime.h>

/* exit uses normal termination, which runs atexit callbacks only. */
__attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('P');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {}
}

static void quick_callback(void) { avm_debug_putc('Q'); }
static void normal_callback(void) { avm_debug_putc('A'); }

int avm_test_main(void) {
    if (at_quick_exit(quick_callback) || atexit(normal_callback)) return 1;
    exit(3);
}
