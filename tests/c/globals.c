#include "avm_test.h"

unsigned initialized = 3;
unsigned zeroed;
unsigned char bytes[4] = {1, 2, 3, 4};

__attribute__((noinline)) static unsigned *global_pointer(void) {
  return &initialized;
}
__attribute__((noinline)) static unsigned char *global_addend(void) {
  return &bytes[2];
}
__attribute__((noinline)) static unsigned mutate(unsigned add) {
  static unsigned local_static = 5;
  initialized += add;
  zeroed += initialized;
  local_static += 1;
  return initialized + zeroed + local_static;
}

static unsigned globals_test(void) {
  unsigned a = mutate(2);
  unsigned b = mutate(1);
  *global_pointer() += *global_addend();
  return a == 16 && b == 24 && initialized == 9 && zeroed == 11;
}

AVM_TEST_ENTRY(globals_test())
