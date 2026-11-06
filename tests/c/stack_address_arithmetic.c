#include <stdint.h>

/* Compare folded local-address arithmetic with arithmetic on a volatile
 * integer holding the same address, including wraparound and range checks. */
#define CHECK_ADDRESS(local) do { \
    uintptr_t address = (uintptr_t)&(local); \
    volatile uintptr_t observed = address; \
    if ((uintptr_t)(address - 1u) != (uintptr_t)(observed - 1u) || \
        (uintptr_t)(address - 128u) != (uintptr_t)(observed - 128u) || \
        (uintptr_t)(address - 2561u) != (uintptr_t)(observed - 2561u) || \
        (uintptr_t)(address + 32768u) != (uintptr_t)(observed + 32768u) || \
        (uintptr_t)(0x0a00u - address) != (uintptr_t)(0x0a00u - observed)) \
        return 1; \
    if (((uintptr_t)(address - 0x0a01u) < (uintptr_t)-254) != \
        (observed < 0x0903u || observed > 0x0a00u)) \
        return 2; \
} while (0)

__attribute__((noinline)) static int fixed_frame(void) {
    volatile uint8_t local[6] = {0};
    CHECK_ADDRESS(local);
    return local[0];
}

__attribute__((noinline)) static int dynamic_frame(uint16_t size) {
    volatile uint8_t local[6] = {0};
    volatile uint8_t *dynamic = (volatile uint8_t *)__builtin_alloca(size);
    dynamic[0] = 0x57;
    CHECK_ADDRESS(local);
    return local[0] || dynamic[0] != 0x57;
}

#ifdef __cplusplus
extern "C"
#endif
int avm_test_main(void) {
    return fixed_frame() || dynamic_frame(9) || dynamic_frame(17);
}
