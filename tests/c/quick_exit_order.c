#include <stdlib.h>
#include <avm.h>
#include <avm/runtime.h>

/* quick_exit reaches _Exit, which halts without the CRT report. */
__attribute__((noreturn)) void avm_halt(void) {
    avm_debug_putc('P');
    avm_debug_putc('\n');
    __avm_debug_break();
    for (;;) {}
}

static const char LABELS[] = "0123456789ABCDEFGHIJKLMNOPQRSTUVW";
static void forbidden_atexit(void) { avm_debug_putc('X'); }

#define CALLBACK_LIST(X) \
    X(0) X(1) X(2) X(3) X(4) X(5) X(6) X(7) X(8) X(9) X(10) X(11) X(12) \
    X(13) X(14) X(15) X(16) X(17) X(18) X(19) X(20) X(21) X(22) X(23) \
    X(24) X(25) X(26) X(27) X(28) X(29) X(30)
#define DEFINE_CALLBACK(n) \
    static void callback_##n(void) { avm_debug_putc(LABELS[n]); }
#define CALLBACK_ENTRY(n) callback_##n,
CALLBACK_LIST(DEFINE_CALLBACK)
static void (*const callbacks[])(void) = { CALLBACK_LIST(CALLBACK_ENTRY) };

/* A child registration made while quick_exit runs. */
static void nested_child(void) { avm_debug_putc('W'); }

/* This is the thirty-second registration. It runs first during quick_exit,
 * freeing a slot before it registers nested_child. The child then runs before
 * the earlier pending callbacks 30 through 0. */
static void nested_parent(void) {
    avm_debug_putc('[');
    if (at_quick_exit(nested_child)) avm_debug_putc('F');
    avm_debug_putc(']');
}

int avm_test_main(void) {
    if (atexit(forbidden_atexit)) return 1;
    if (at_quick_exit(NULL) == 0) return 2;
    for (unsigned int i = 0; i < sizeof callbacks / sizeof callbacks[0]; ++i) {
        if (at_quick_exit(callbacks[i])) return 3;
    }
    if (at_quick_exit(nested_parent)) return 4;
    /* Thirty-two registrations fill the capacity, so this one must fail. */
    if (at_quick_exit(nested_child) == 0) return 5;
    quick_exit(0);
}
