#include <avm.h>

int x = 10;

void loop()
{
    if(!avm_next_frame())
        return;

    avm_draw_filled_rect_white(x++, 10, 20, 20);

    avm_display(AVM_CLEAR_BUFFER);
}

extern "C" int main()
{
    avm_set_frame_rate(20);
    while(true)
        loop();
    return 0;
}
