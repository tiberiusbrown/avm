#include <stdlib.h>
#include <stdint.h>

/* The C standard requires at least 32 registrations. AVM keeps exactly that
 * many, and each entry is a three-byte code pointer. The table is linked only
 * when a program references at_quick_exit or quick_exit. */
#define AVM_QUICK_EXIT_CAPACITY 32u

static void (*quick_exit_callbacks[AVM_QUICK_EXIT_CAPACITY])(void);
static uint8_t quick_exit_count;

int at_quick_exit(void (*func)(void)) {
    if (!func || quick_exit_count == AVM_QUICK_EXIT_CAPACITY) return -1;
    quick_exit_callbacks[quick_exit_count++] = func;
    return 0;
}

/* Quick termination runs only at_quick_exit registrations, in reverse order.
 * Like exit, each entry is removed before it runs, so a registration made
 * during the sequence runs before the earlier pending entries. atexit callbacks
 * and C++ destructors do not run. */
__attribute__((noreturn)) void quick_exit(int status) {
    while (quick_exit_count) {
        void (*func)(void) = quick_exit_callbacks[--quick_exit_count];
        func();
    }
    _Exit(status);
}
