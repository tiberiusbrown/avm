#include <assert.h>

int checked(int a) {
    assert(a > 0);
    assert((a += 1, a > 1));
    return a;
}
