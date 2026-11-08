#include <signal.h>
#include <stdlib.h>
#include <avm.h>
#include <avm/runtime.h>
__attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('P'); avm_debug_putc('\n'); __avm_debug_break();
    for (;;) {}
}
int avm_test_main(void) {
    if (signal(SIGABRT, SIG_IGN) != SIG_DFL) return 1;
    avm_debug_putc('I');
    abort();
    avm_debug_putc('F');
    return 1;
}
