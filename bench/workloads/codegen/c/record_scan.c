#include <stdint.h>

typedef struct {
    int8_t dx;
    int8_t dy;
    uint8_t flags;
    uint8_t intensity;
    uint16_t timer;
} record;

static record records[48];
static volatile uint16_t record_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 48; ++i) {
        records[i].dx = (int8_t)((int16_t)(i % 13u) - 6);
        records[i].dy = (int8_t)((int16_t)(i % 11u) - 5);
        records[i].flags = (uint8_t)(i ^ 0x5au);
        records[i].intensity = (uint8_t)(i * 7u + 3u);
        records[i].timer = (uint16_t)(1000u + i * 29u);
    }

    __avm_debug_break();

    int16_t x = 0;
    int16_t y = 0;
    uint16_t total = 0;
    for (uint8_t repeat = 0; repeat < 32; ++repeat) {
        record *p = records;
        for (uint8_t i = 0; i < 48; ++i, ++p) {
            x = (int16_t)(x + p->dx);
            y = (int16_t)(y + p->dy);
            if ((p->flags & 1u) != 0)
                total = (uint16_t)(total + p->intensity);
            p->timer = (uint16_t)(p->timer - 1u);
            total ^= p->timer;
        }
    }
    record_result = (uint16_t)(total ^ (uint16_t)x ^ (uint16_t)y);

    __avm_debug_break();
    return 0;
}
