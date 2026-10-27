#include <avm.h>
struct global { ~global() { avm_debug_putc('F'); } } object;
extern "C" {
#include "../c/termination_immediate.c"
}
