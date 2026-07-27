extern "C" int main()
{
    int x = 10;
    while(true)
    {
        __avm_draw_filled_rect_white(x++, 10, 20, 20);

        __avm_display(1);
    }
    return 0;
}
