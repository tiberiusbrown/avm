#include <avm.h>

int avm_test_main()
{
    avm_debug_break();
    
    avm_set_text_font(AVM_FONT_5X7);
    avm_draw_text(0, 17, "the quick brown fox\njumps over the lazy\ndog");

    avm_debug_break();

    return 0;
}
