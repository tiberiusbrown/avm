#include <stdlib.h>
#include <avm.h>
struct external {
    external() { avm_debug_putc('T'); }
    ~external() { avm_debug_putc('t'); }
};
static external object __attribute__((init_priority(200)));
static void callback() { avm_debug_putc('X'); }
void activate_external() { avm_debug_putc('x'); atexit(callback); }
