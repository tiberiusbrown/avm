#include <string.h>

void test(char *dst) {
  const char *ram = nullptr;
  const char AVM_PROGMEM *flash = nullptr;
  (void)strlen(ram);
  (void)strlen(flash); // expected-error {{no matching function for call to '__avm_cpp_strlen'}}
  (void)memcpy(dst, ram, 1);
  (void)memcpy(dst, flash, 1); // expected-error {{no matching function for call to '__avm_cpp_memcpy'}}
  (void)strlen_P(flash);
  (void)memcpy_P(dst, flash, 1);
  static_assert(sizeof(flash) == 3, "program pointers retain all 24 bits");
  (void)strlen(nullptr);
  (void)memcpy(dst, nullptr, 1);
}
