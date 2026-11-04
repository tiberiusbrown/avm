#include <stdlib.h>
#include <stdint.h>
#include "test_hex_output.h"

#define CHECK(expr) do { if(!(expr)) { test_line16("LINE", __LINE__); return 1; } } while(0)

static void *(*volatile aligned_call)(size_t, size_t) = aligned_alloc;
static void (*volatile free_sized_call)(void *, size_t) = free_sized;
static void (*volatile free_aligned_call)(void *, size_t, size_t) = free_aligned_sized;

int avm_test_main(void) {
    unsigned char *p, *q;
    unsigned int i;

    /* Every AVM type has byte alignment, so no other alignment is supported. */
    CHECK(aligned_call(0, 4) == NULL);
    CHECK(aligned_call(2, 4) == NULL);
    CHECK(aligned_call(3, 3) == NULL);
    CHECK(aligned_call(1024, 16) == NULL);

    /* Byte-aligned allocations behave as malloc does, including the size limit. */
    p = aligned_call(1, 5);
    CHECK(p != NULL);
    for (i = 0; i < 5; ++i) p[i] = (unsigned char)(i + 1);
    CHECK(p[4] == 5);
    free_sized_call(p, 5);
    p = aligned_call(1, 200);
    CHECK(p != NULL);
    free_sized_call(p, 200);
    /* Requests above malloc's 1022-byte limit fail regardless of heap state. */
    CHECK(aligned_call(1, 1023) == NULL);
    /* A zero-size request returns NULL, as AVM's malloc does. */
    CHECK(aligned_call(1, 0) == NULL);
    CHECK(aligned_call(1, 2000) == NULL);

    /* Both deallocators accept a null pointer as a no-op. */
    free_sized_call(NULL, 0);
    free_aligned_call(NULL, 1, 0);

    /* A byte-aligned block is released by the sized deallocator. */
    q = aligned_call(1, 16);
    CHECK(q != NULL);
    free_aligned_call(q, 1, 16);
    q = aligned_call(1, 16);
    CHECK(q != NULL);
    free_sized_call(q, 16);
    return 0;
}
