#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

/* AVM has no concurrent guest observer. Keep the accesses visible to the
 * compiler, while implementing the libatomic ABI without recursive atomics. */
static void avm_atomic_copy(void volatile *dst, void const volatile *src,
                            size_t size)
{
    volatile uint8_t *d = (volatile uint8_t *)dst;
    volatile uint8_t const *s = (volatile uint8_t const *)src;
    for (size_t i = 0; i < size; ++i)
        d[i] = s[i];
}

static bool avm_atomic_equal(void const volatile *lhs,
                             void const volatile *rhs, size_t size)
{
    volatile uint8_t const *a = (volatile uint8_t const *)lhs;
    volatile uint8_t const *b = (volatile uint8_t const *)rhs;
    for (size_t i = 0; i < size; ++i)
        if (a[i] != b[i])
            return false;
    return true;
}

bool avm_atomic_is_lock_free(size_t size, void const volatile *ptr)
    __asm__("__atomic_is_lock_free");
bool avm_atomic_is_lock_free(size_t size, void const volatile *ptr)
{
    (void)ptr;
    return size == 1 || size == 2 || size == 4;
}

void avm_atomic_load(size_t size, void const volatile *src, void *dst, int model)
    __asm__("__atomic_load");
void avm_atomic_load(size_t size, void const volatile *src, void *dst, int model)
{
    (void)model;
    avm_atomic_copy(dst, src, size);
}

void avm_atomic_store(size_t size, void volatile *dst, void const *src, int model)
    __asm__("__atomic_store");
void avm_atomic_store(size_t size, void volatile *dst, void const *src, int model)
{
    (void)model;
    avm_atomic_copy(dst, src, size);
}

void avm_atomic_exchange(size_t size, void volatile *ptr, void const *desired,
                         void *old, int model)
    __asm__("__atomic_exchange");
void avm_atomic_exchange(size_t size, void volatile *ptr, void const *desired,
                         void *old, int model)
{
    (void)model;
    avm_atomic_copy(old, ptr, size);
    avm_atomic_copy(ptr, desired, size);
}

int avm_atomic_compare_exchange(size_t size, void volatile *ptr, void *expected,
                                void const *desired, int success, int failure)
    __asm__("__atomic_compare_exchange");
int avm_atomic_compare_exchange(size_t size, void volatile *ptr, void *expected,
                                void const *desired, int success, int failure)
{
    (void)success;
    (void)failure;
    if (avm_atomic_equal(ptr, expected, size)) {
        avm_atomic_copy(ptr, desired, size);
        return true;
    }
    avm_atomic_copy(expected, ptr, size);
    return false;
}

uint64_t avm_atomic_load_8(void const volatile *src, int model)
    __asm__("__atomic_load_8");
uint64_t avm_atomic_load_8(void const volatile *src, int model)
{
    uint64_t value;
    (void)model;
    avm_atomic_copy(&value, src, 8);
    return value;
}

void avm_atomic_store_8(void volatile *dst, uint64_t value, int model)
    __asm__("__atomic_store_8");
void avm_atomic_store_8(void volatile *dst, uint64_t value, int model)
{
    (void)model;
    avm_atomic_copy(dst, &value, 8);
}

uint64_t avm_atomic_exchange_8(void volatile *ptr, uint64_t value, int model)
    __asm__("__atomic_exchange_8");
uint64_t avm_atomic_exchange_8(void volatile *ptr, uint64_t value, int model)
{
    uint64_t old;
    (void)model;
    avm_atomic_copy(&old, ptr, 8);
    avm_atomic_copy(ptr, &value, 8);
    return old;
}

bool avm_atomic_compare_exchange_8(void volatile *ptr, void *expected,
                                   uint64_t desired, int success, int failure)
    __asm__("__atomic_compare_exchange_8");
bool avm_atomic_compare_exchange_8(void volatile *ptr, void *expected,
                                   uint64_t desired, int success, int failure)
{
    return avm_atomic_compare_exchange(8, ptr, expected, &desired,
                                       success, failure);
}

#define AVM_ATOMIC_FETCH_8(name, expression)                                  \
    uint64_t avm_atomic_fetch_##name##_8(void volatile *ptr, uint64_t value,  \
                                         int model)                            \
        __asm__("__atomic_fetch_" #name "_8");                               \
    uint64_t avm_atomic_fetch_##name##_8(void volatile *ptr, uint64_t value,  \
                                         int model)                            \
    {                                                                         \
        uint64_t old;                                                         \
        uint64_t updated;                                                     \
        (void)model;                                                          \
        avm_atomic_copy(&old, ptr, 8);                                        \
        updated = (expression);                                               \
        avm_atomic_copy(ptr, &updated, 8);                                    \
        return old;                                                           \
    }

AVM_ATOMIC_FETCH_8(add, old + value)
AVM_ATOMIC_FETCH_8(sub, old - value)
AVM_ATOMIC_FETCH_8(and, old & value)
AVM_ATOMIC_FETCH_8(or, old | value)
AVM_ATOMIC_FETCH_8(xor, old ^ value)
AVM_ATOMIC_FETCH_8(nand, ~(old & value))

#undef AVM_ATOMIC_FETCH_8
