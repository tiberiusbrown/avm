#include "fdlibm.h"
float nanf(const char *tag)
{
    /* Payload interpretation is implementation-defined. Keep a canonical
       quiet NaN for every tag, including nonconstant strings. */
    (void)tag;
    float x;
    SET_FLOAT_WORD(x, 0x7fc00000UL);
    return x;
}
