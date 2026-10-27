#include <stdlib.h>
#include <avm/runtime.h>

void _Exit(int status) {
    (void)status;
    avm_halt();
}

__attribute__((weak)) void abort(void) {
    avm_halt();
}
