#include "avm_test.h"

static unsigned char pointer_value = 7;
static volatile unsigned recursion_guard;

__attribute__((noinline)) static unsigned f0(void) { return 1; }
__attribute__((noinline)) static unsigned f1(unsigned a) { return a + 1; }
__attribute__((noinline)) static unsigned f2(unsigned a, unsigned b) {
  return a + b;
}
__attribute__((noinline)) static unsigned f3(unsigned a, unsigned b,
                                              unsigned c) {
  return a + b + c;
}
__attribute__((noinline)) static unsigned f4(unsigned a, unsigned b,
                                              unsigned c, unsigned d) {
  return a + b + c + d;
}
__attribute__((noinline)) static unsigned add6(unsigned a, unsigned b,
                                                unsigned c, unsigned d,
                                                unsigned e, unsigned f) {
  return a + b + c + d + e + f;
}
__attribute__((noinline)) static unsigned mixed(unsigned char a, unsigned b,
                                                 unsigned char *p, unsigned d,
                                                 unsigned e) {
  return a + b + *p + d + e;
}
__attribute__((noinline)) static unsigned recurse(unsigned n) {
  return n && recursion_guard == 0 ? n + recurse(n - 1) : 0;
}
__attribute__((noinline)) static void set_byte(unsigned char *p,
                                                unsigned char v) {
  *p = v;
}
__attribute__((noinline)) static unsigned char byte_result(void) { return 9; }
__attribute__((noinline)) static unsigned *pointer_result(void) {
  static unsigned value = 11;
  return &value;
}

static unsigned calls_test(void) {
  unsigned sum = f0() + f1(1) + f2(1, 2) + f3(1, 2, 3) + f4(1, 2, 3, 4);
  sum += add6(1, 2, 3, 4, 5, 6);
  sum += mixed(1, 2, &pointer_value, 4, 5);
  sum += recurse(4);
  set_byte(&pointer_value, 8);
  sum += byte_result() + *pointer_result() + pointer_value;
  return sum == 100;
}

AVM_TEST_ENTRY(calls_test())
