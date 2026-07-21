#include <stdint.h>

inline void debug_break() { __avm_debug_break(); }

int16_t A[64];

int avm_test_main(void)
{
    for(uint8_t i = 0; i < 64; i = i + 1)
        A[i] = 64 - i;

    debug_break();
    
    uint8_t n = 64;
    while(n > 1)
    {
        uint8_t n2 = 0;
        for(uint8_t i = 1; i < n; i = i + 1)
        {
            int16_t a = A[i - 1];
            int16_t b = A[i];
            if(a > b)
            {
                int16_t t = a;
                A[i - 1] = b;
                A[i] = t;
                n2 = i;
            }
        }
        n = n2;
    }

    debug_break();

    return 0;
}
