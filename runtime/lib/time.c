#include <time.h>
#include <avm.h>

clock_t clock(void)
{
    return (clock_t)avm_millis32();
}
