#include <avm.h>

int avm_test_main()
{
    avm_debug_break();
    
    avm_set_text_font(AVM_FONT_5X7);
    avm_draw_textf_P(0, 8, F("Running: %u seconds"), avm_millis() / 1000);
    avm_draw_text_P(0, 17, F("the quick brown fox\njumps over the lazy\ndog"));
    avm_draw_text_P(0, 44, F("THE QUICK BROWN FOX\nJUMPS OVER THE LAZY\nDOG"));

    avm_debug_break();

    return 0;
}
