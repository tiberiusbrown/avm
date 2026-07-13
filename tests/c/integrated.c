#include "avm_test.h"

int counter = 3;
int total;

__attribute__((noinline)) static int add5(int a, int b, int c, int d, int e) {
  return a + b + c + d + e;
}

__attribute__((noinline)) static int update(void) {
  total = add5(counter, 2, 3, 4, 5);
  return total;
}

AVM_TEST_ENTRY(update() == 17 && total == 17)
