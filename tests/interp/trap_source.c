/* Source-aware fatal-trap fixture. main asks __avm_trap_lookup about two known
 * code addresses before trapping, and the emulator test reads those results
 * from RAM. trap_site executes an invalid secondary encoding and reaches the
 * reporter. */
#include <avm.h>
#include <avm/trap.h>

/* The probes are only addresses for the lookup, so their bodies are empty. */
__attribute__((noinline)) void probe_site(void) {
}

__attribute__((noinline, section(".high_text"))) void high_probe_site(void) {
}

__attribute__((noinline)) void trap_site(void) {
    __asm__ volatile(".byte 0xd7, 0x04");
}

int main(void) {
    __avm_trap_lookup((uint32_t)probe_site, (avm_trap_location_t *)0x0300);
    __avm_trap_lookup((uint32_t)high_probe_site, (avm_trap_location_t *)0x0380);
    trap_site();
    return 0;
}
