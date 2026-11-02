// The second translation unit of eh_typed. It throws a class that the main unit
// catches by exact type, so the descriptor is matched across the link.
#include "eh_typed.h"

void eh_typed_throw_remote(int value) {
    throw Remote{value};
}
