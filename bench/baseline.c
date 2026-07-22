extern void __avm_debug_break(void);

int avm_test_main(void)
{
    __avm_debug_break();
    __avm_debug_break();
    return 0;
}
