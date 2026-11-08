#define NDEBUG
#include <assert.h>

int checked(int a, int b) {
    (void)b;
    assert(a, b);
    return a;
}
