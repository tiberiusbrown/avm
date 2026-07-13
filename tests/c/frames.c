#include "avm_test.h"

__attribute__((noinline)) static unsigned bump(unsigned x) { return x + 1; }

__attribute__((noinline)) static unsigned frame_and_stack(
    unsigned a, unsigned b, unsigned c, unsigned d, unsigned first_stack) {
  volatile unsigned char local[130];
  unsigned x = a + b;
  unsigned y = c + d;
  local[0] = (unsigned char)first_stack;
  local[129] = (unsigned char)bump(x + y);
  return local[0] + local[129] + bump(first_stack);
}

static unsigned frames_test(void) {
  return frame_and_stack(1, 2, 3, 4, 19) == 50;
}

AVM_TEST_ENTRY(frames_test())
