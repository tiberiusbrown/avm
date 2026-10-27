#include <string.h>

extern "C" int avm_test_main(void);

// Reuse every C case with unsuffixed overloads, including function pointers.
#define strchr_P strchr
#define strrchr_P strrchr
#define memchr_P memchr
#define strnlen_P strnlen
#define strncmp_P strncmp
#define strstr_P strstr
#define strspn_P strspn
#define strcspn_P strcspn
#define strpbrk_P strpbrk
#define strtok_P strtok
#define strtok_rP strtok_r
#include "../c/string_progmem_search.c"
