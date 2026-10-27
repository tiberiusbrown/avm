#include "rint_kernel.h"

float nearbyintf(float x)
{
    /* AVM has no floating-point exception flags, so both functions agree. */
    return avm_rint(x);
}
