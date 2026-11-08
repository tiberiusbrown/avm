#include <stdlib.h>
#include <avm.h>
static void one(void) { avm_debug_putc('1'); }
static void two(void) { avm_debug_putc('2'); }
static void late(void) { avm_debug_putc('4'); }
static void three(void) { avm_debug_putc('3'); if (atexit(late)) avm_debug_putc('F'); }
__attribute__((constructor)) static void initialize(void) { if (atexit(one)) avm_debug_putc('F'); }
int avm_test_main(void) {
    if (atexit(two) || atexit(two) || atexit(three)) return 1;
    return 0;
}
