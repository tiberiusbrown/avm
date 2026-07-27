extern "C" int main()
{
    while(true)
    {
        __avm_draw_filled_rect_white(10, 10, 20, 20);

        __avm_display(1);
    }
    return 0;
}
