#include <avm.h>

static uint8_t commands[300];

#ifdef __cplusplus
extern "C"
#endif
int avm_test_main(void)
{
    if(avm_get_system_width() != 128 || avm_get_system_height() != 64 ||
       avm_get_system_display_type() != AVM_DISPLAY_SSD1306)
        return 1;
    if(AVM_DISPLAY_UNKNOWN != 0 || AVM_DISPLAY_SSD1306 != 1 ||
       AVM_DISPLAY_SSD1309 != 2 || AVM_DISPLAY_SH1106 != 3)
        return 2;

    avm_send_display_command((uint8_t const*)0, 0);
    for(size_t i = 0; i < sizeof(commands); ++i)
        commands[i] = 0xE3; // Controller NOP.
    commands[298] = 0x81; // Contrast, with parameter beyond the 8-bit boundary.
    commands[299] = 0x5A;
    __avm_framebuffer[0] = 0xA5;
    void (*volatile send)(uint8_t const*, size_t) = &avm_send_display_command;
    send(commands, sizeof(commands));
    for(size_t i = 0; i < sizeof(commands); ++i)
        if(commands[i] != (i == 298 ? 0x81 : i == 299 ? 0x5A : 0xE3))
            return 3;
    if(__avm_framebuffer[0] != 0xA5)
        return 4;
    avm_display(false);
    uint8_t normal[] = {0xA6};
    avm_send_display_command(normal, sizeof(normal));
    avm_display(true);
    return __avm_framebuffer[0] != 0;
}
