#include <avm.h>
#include <avm/framebuffer.h>
#include <avm/pgmspace.h>
#include <avm/trap.h>
#include <string.h>

extern unsigned char __avm_static_ram_start[];

static char const AVM_PROGMEM *trap_reason_label(uint8_t reason) {
    switch (reason) {
    case AVM_TRAP_REASON_STACK_OVERFLOW:
        return AVM_PSTR("STACK OVERFLOW");
    case AVM_TRAP_REASON_INVALID_PRIMARY:
        return AVM_PSTR("INVALID PRIMARY");
    case AVM_TRAP_REASON_INVALID_SECONDARY:
        return AVM_PSTR("INVALID SECONDARY");
    default:
        return AVM_PSTR("UNKNOWN TRAP");
    }
}

/* Shows the trapped state on the 128x64 OLED with BR5N, whose six-pixel line
 * height gives nine rows. Formatting uses the native formatted-text services
 * directly on the fresh reporter stack. */
__attribute__((noreturn))
void __avm_trap_report(avm_trap_context_t const *context) {
    uint32_t pc = (uint32_t)context->pc[0] |
                  ((uint32_t)context->pc[1] << 8) |
                  ((uint32_t)context->pc[2] << 16);
    /* Scratch follows the snapshot and 32-byte context in static RAM. The reporter
     * owns this disposable RAM after a fatal trap. Normal programs reuse it,
     * so the result is not a permanent reservation. */
    avm_trap_location_t *location =
        (avm_trap_location_t *)((uintptr_t)__avm_static_ram_start + 0x0120);

    __avm_trap_lookup(pc, location);
    memset(__avm_framebuffer, 0, sizeof(__avm_framebuffer));
    avm_set_text_font(AVM_FONT_BR5N);
    avm_set_text_mode(AVM_TEXT_OVERWRITE);

    avm_draw_text_P(0, 5, trap_reason_label(context->reason));
    avm_draw_textf_P(0, 11, AVM_PSTR("PC:%06lX SP:%04X"),
                     (unsigned long)pc, (unsigned)context->sp);
    if (location->function) {
        avm_draw_textf_P(0, 17, AVM_PSTR("FN:%.30S"), location->function);
    } else {
        avm_draw_text_P(0, 17, AVM_PSTR("FN:?"));
    }
    if (location->file) {
        avm_draw_textf_P(0, 23, AVM_PSTR("%.22S:%lu"),
                         location->file, (unsigned long)location->line);
    } else {
        avm_draw_text_P(0, 23, AVM_PSTR("?:?"));
    }
    avm_draw_textf_P(0, 29, AVM_PSTR("R0:%04X R1:%04X"),
                     (unsigned)context->regs[0], (unsigned)context->regs[1]);
    avm_draw_textf_P(0, 35, AVM_PSTR("R2:%04X R3:%04X"),
                     (unsigned)context->regs[2], (unsigned)context->regs[3]);
    avm_draw_textf_P(0, 41, AVM_PSTR("R4:%04X R5:%04X"),
                     (unsigned)context->regs[4], (unsigned)context->regs[5]);
    avm_draw_textf_P(0, 47, AVM_PSTR("R6:%04X R7:%04X"),
                     (unsigned)context->regs[6], (unsigned)context->regs[7]);
    avm_draw_textf_P(0, 53, AVM_PSTR("CC:%02X"), (unsigned)context->flags);
    avm_display(false);

    for (;;)
        __asm__ volatile("" ::: "memory");
}
