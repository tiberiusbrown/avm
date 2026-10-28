#include <stdlib.h>
#include <avm/runtime.h>

extern void __avm_signal_abort(void) __attribute__((weak));

void _Exit(int status) {
    (void)status;
    avm_halt();
}

__attribute__((weak, noreturn)) void abort(void) {
    if (__avm_signal_abort != 0)
        __avm_signal_abort();

    avm_halt();
}
