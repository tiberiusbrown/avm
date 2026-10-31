/* Minimal high-address fatal-trap handler. It records a marker in static RAM
 * and never returns, so the emulator test can observe it after dispatch. */
__attribute__((noinline, noreturn, section(".high_trap_text")))
void __avm_trap_entry(void)
{
    *(volatile unsigned char *)0x0220 = 0xa5;
    for (;;)
        ;
}
