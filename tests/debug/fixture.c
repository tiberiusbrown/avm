#include <avm.h>
#include <stdint.h>

volatile uint16_t debug_counter = 0x1234u;
static uint8_t const AVM_PROGMEM debug_pattern[] = {0xa5u, 0x5au, 0};

__attribute__((noinline))
static uint16_t debug_leaf(uint16_t argument,
                           uint8_t const AVM_PROGMEM *program_pointer)
{
    volatile uint16_t local = (uint16_t)(argument + program_pointer[0]);
    debug_counter = (uint16_t)(debug_counter + local);
    return (uint16_t)(local ^ debug_counter);
}

__attribute__((noinline))
static uint16_t debug_middle(uint16_t argument)
{
    uint16_t local = (uint16_t)(argument + 3u);
    return debug_leaf(local, debug_pattern);
}

int main(void)
{
    uint16_t local = 7u;
    uint16_t result = debug_middle(local);
    __avm_framebuffer[0] = (uint8_t)result;
    /* Exercise writes performed by a system service, not just AVM stores. */
    avm_draw_filled_rect_white(0, 0, 1, 1);
    avm_display(false);

    for(;;) {
        if(avm_pressed(AVM_BUTTON_D)) {
            debug_counter = (uint16_t)(debug_counter + 1u);
            __avm_framebuffer[1] = (uint8_t)debug_counter;
            avm_display(false);
        }
        avm_idle();
    }
}
