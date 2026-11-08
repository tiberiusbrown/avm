#include <stdint.h>

typedef uint8_t u8;
typedef uint16_t u16;

u16 fib(u8 n)
{
    if(n <= 1) return n;
    return fib(n - 1) + fib(n - 2);
}

volatile u16 f;

int avm_test_main()
{
    __avm_debug_break();
    f = fib(12);
    __avm_debug_break();
    
    return 0;
}
