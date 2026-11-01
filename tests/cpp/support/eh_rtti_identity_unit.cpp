// The second translation unit. It throws Shared through a local object, so the
// unwinder runs this unit's cleanup and the catch lies in the main unit.
#include "eh_rtti_identity.h"

void eh_identity_throw_shared(int tag) {
    Shared value(tag);
    throw value;
}
