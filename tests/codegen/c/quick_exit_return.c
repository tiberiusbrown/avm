#include <stdlib.h>
#include <avm.h>

static void quick_callback(void) { avm_debug_putc('Q'); }

/* Returning from main runs the normal termination path and no quick callbacks. */
int avm_test_main(void) {
    return at_quick_exit(quick_callback);
}
