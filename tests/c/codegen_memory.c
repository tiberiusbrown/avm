#include <stdint.h>
#include <string.h>

#include "test_hex_output.h"

#if defined(__clang__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

struct __attribute__((packed)) record {
    uint8_t tag;
    uint16_t first;
    uint8_t flags;
    uint16_t second;
    uint8_t tail;
};

static uint16_t rotate_left(uint16_t value, uint8_t count)
{
    return (uint16_t)((uint16_t)(value << count) |
                      (uint16_t)(value >> (uint8_t)(16 - count)));
}

static NOINLINE uint16_t hash_bytes(const uint8_t *bytes, uint16_t size)
{
    uint16_t hash = 0x1d0f;

    for(uint16_t i = 0; i < size; ++i) {
        hash = rotate_left(hash, 5);
        hash ^= bytes[i];
        hash = (uint16_t)(hash + (uint16_t)(i * 257u));
    }

    return hash;
}

static NOINLINE uint16_t update_record(struct record *value, uint16_t bias)
{
    value->first = (uint16_t)(value->first + bias);
    value->second ^= value->first;
    value->flags = (uint8_t)((uint8_t)(value->flags << 1) |
                             (uint8_t)(value->flags >> 7));

    return (uint16_t)(value->tag + value->first + value->flags +
                      value->second + value->tail);
}

static NOINLINE uint16_t read_neighbors(const uint8_t *center)
{
    return (uint16_t)(center[-3] | (uint16_t)(center[-1] << 8));
}

static NOINLINE uint16_t walk_both_directions(const uint8_t *bytes, uint16_t size)
{
    uint16_t forward = 0;
    uint16_t reverse = 0;
    const uint8_t *p = bytes;
    const uint8_t *q = bytes + size;

    for(uint16_t i = 0; i < size; ++i)
        forward = (uint16_t)(forward + *p++);

    for(uint16_t i = 0; i < size; ++i)
        reverse = (uint16_t)(reverse + *--q);

    return (uint16_t)(forward ^ rotate_left(reverse, 3));
}

int avm_test_main(void)
{
    uint8_t source[24];
    uint8_t work[24];

    memset(source, 0xa5, sizeof(source));
    for(uint8_t i = 0; i < sizeof(source); ++i)
        source[i] = (uint8_t)((uint8_t)(i * 29u + 7u) ^ (uint8_t)(i >> 1));

    memcpy(work, source, sizeof(work));
    memmove(work + 3, work, 15);
    memmove(work, work + 5, 12);
    memset(work + 18, 0x5c, 6);

    struct record value = {0x3a, 0x1234, 0x55, 0xabcd, 0xe7};

    const uint16_t m0 = hash_bytes(source, sizeof(source));
    const uint16_t m1 = hash_bytes(work, sizeof(work));
    const uint16_t m2 = update_record(&value, 0x0221);
    const uint16_t m3 = read_neighbors(work + 7);
    const uint16_t m4 = walk_both_directions(source, sizeof(source));

    test_line16("M0", m0);
    test_line16("M1", m1);
    test_line16("M2", m2);
    test_line16("M3", m3);
    test_line16("M4", m4);

    return m0 != 0xd5fa || m1 != 0xd3cb || m2 != 0xd5b8 ||
           m3 != 0xebb6 || m4 != 0x5d1c;
}
