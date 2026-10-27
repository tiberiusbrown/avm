#include <stdlib.h>
#include <avm.h>
#ifndef EXPECTED_CAPACITY
#define EXPECTED_CAPACITY 32
#endif
static unsigned calls;
static void again(void) { avm_debug_putc('N'); }
static void counted(void) { ++calls; }
static void first(void) {
    avm_debug_putc(calls == EXPECTED_CAPACITY - 1 ? 'R' : 'F');
    if (atexit(again)) avm_debug_putc('F');
}
int avm_test_main(void) {
    if (atexit(first)) return 1;
    for (unsigned i = 1; i < EXPECTED_CAPACITY; ++i)
        if (atexit(counted)) return 2;
    if (atexit(counted) == 0) return 3;
    avm_debug_putc('C');
    return 0;
}
