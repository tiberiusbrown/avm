#include <assert.h>
#include <stdlib.h>
#include <avm.h>

void abort(void) {
    avm_debug_putc('A');
    avm_debug_putc('\n');
    avm_debug_break();
    for(;;) {}
}

int avm_test_main(void) {
#line 70000 "assert_failure.c"
    assert(0 && "sentinel");
    return 1;
}
