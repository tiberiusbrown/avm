#include <avm.h>

int x = 10, y = 10;

void loop()
{
    if(!avm_next_frame())
        return;

    uint8_t b = avm_buttons();

    if(b & AVM_BUTTON_U) --y;
    if(b & AVM_BUTTON_D) ++y;
    if(b & AVM_BUTTON_L) --x;
    if(b & AVM_BUTTON_R) ++x;

    avm_draw_filled_rect_white(x, y, 20, 20);

    avm_draw_textf_P(10, 50, F("millis: %u"), avm_millis());
    avm_draw_textf(10, 60, "millis: %u", avm_millis());

    avm_display(AVM_CLEAR_BUFFER);
}

extern "C" int main()
{
    avm_set_frame_rate(50);
    avm_set_text_font(AVM_FONT_5X7);
    while(true)
        loop();
    return 0;
}
