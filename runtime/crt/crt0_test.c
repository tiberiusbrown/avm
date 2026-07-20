#include <avm/runtime.h>
#include <stdint.h>

extern int avm_test_main(void);

static void test_putc(uint8_t value) {
    __avm_debug_putc(value);
}

__attribute__((noreturn, used, section(".text._start")))
void _start(void) {
    const int result = avm_test_main();

    test_putc(result == 0 ? (uint8_t)'P' : (uint8_t)'F');
    test_putc((uint8_t)'\n');
    __avm_debug_break();
    avm_halt();
}
