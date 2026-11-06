#include <string.h>

extern "C" int avm_test_main(void);

// Reuse every C case with the explicit flash interfaces, including function pointers.
#include "../c/string_progmem_search.c"
