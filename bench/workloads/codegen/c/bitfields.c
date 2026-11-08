#include <stdint.h>

typedef struct {
    unsigned mode : 3;
    signed delta : 5;
    unsigned count : 9;
    unsigned active : 1;
} entry;

static entry entries[40];
static volatile uint16_t bitfields_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 40; ++i) {
        entries[i].mode = i & 7u;
        entries[i].delta = (int8_t)(i % 29u) - 14;
        entries[i].count = (unsigned)(i * 11u);
        entries[i].active = i & 1u;
    }

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 20; ++repeat) {
        for (uint8_t i = 0; i < 40; ++i) {
            entry *p = &entries[i];
            p->count = (p->count + p->mode + 1u) & 511u;
            p->delta = (int8_t)((p->delta + 16) % 31) - 15;
            p->active ^= (unsigned)(p->count & 1u);
            checksum = (uint16_t)(checksum + p->count +
                                  (uint16_t)(int16_t)p->delta + p->active);
        }
    }
    bitfields_result = checksum;

    __avm_debug_break();
    return 0;
}
