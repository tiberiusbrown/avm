#include <stdint.h>

typedef uint8_t u8;
typedef uint16_t u16;

#define SQRT_N 30
#define N (SQRT_N * SQRT_N)

u8 A[N];

int avm_test_main()
{
    __avm_debug_break();
    
    for(u8 i = 2; i < SQRT_N; ++i)
    {
        if(!A[i])
            for(u16 j = i * i; j < N; j += i)
                A[j] = 1;
    }

    __avm_debug_break();
    
    return 0;
}