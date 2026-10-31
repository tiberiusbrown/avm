#include <avm.h>
#include <avm/framebuffer.h>
#include <avm/trap.h>
#include <string.h>

/* Minimal skeleton: draw a white diagnostic rectangle and halt. The context
 * is ignored until source lookup and unwinding are implemented. */
__attribute__((noreturn))
void __avm_trap_report(avm_trap_context_t const *context) {
    (void)context;

    memset(__avm_framebuffer, 0, sizeof(__avm_framebuffer));
    avm_draw_filled_rect_white(8, 8, 16, 8);
    avm_display(false);

    for (;;)
        __asm__ volatile("" ::: "memory");
}
