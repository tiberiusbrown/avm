#include <signal.h>
#include <stdlib.h>
#include <avm.h>
#include <avm/runtime.h>
__attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('P'); avm_debug_putc('\n'); __avm_debug_break();
    for (;;) {}
}
static void forbidden(void) { avm_debug_putc('F'); }
int avm_test_main(void) {
    if (atexit(forbidden)) return 1;
    avm_debug_putc('D');
    raise(SIGTERM);
    avm_debug_putc('F');
    return 1;
}
