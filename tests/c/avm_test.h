#ifndef AVM_TEST_H
#define AVM_TEST_H

__attribute__((always_inline)) static inline void
avm_test_putc(unsigned char value) {
  register unsigned char output __asm__("r4") = value;
  __asm__ volatile("sys 0" : : "r"(output));
}

__attribute__((noinline)) static void avm_test_pass(void) {
  avm_test_putc('P');
  avm_test_putc('A');
  avm_test_putc('S');
  avm_test_putc('S');
  avm_test_putc('\n');
}

__attribute__((noinline)) static void avm_test_fail(void) {
  avm_test_putc('F');
  avm_test_putc('A');
  avm_test_putc('I');
  avm_test_putc('L');
  avm_test_putc('\n');
}

__attribute__((noreturn, noinline)) static void avm_test_finish(unsigned ok) {
  if (ok)
    avm_test_pass();
  else
    avm_test_fail();
  for (;;)
    ;
}

#define AVM_TEST_ENTRY(expression)                                             \
  void _start(void) { avm_test_finish((expression) != 0); }

#endif
