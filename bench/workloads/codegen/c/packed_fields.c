#include <stdint.h>

typedef struct __attribute__((packed)) {
    uint8_t tag;
    uint32_t value;
    int16_t adjustment;
    uint8_t flags;
} packet;

static packet packets[24];
static volatile uint32_t packed_fields_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 24; ++i) {
        packets[i].tag = i;
        packets[i].value = UINT32_C(0x12345678) + (uint32_t)i * 173u;
        packets[i].adjustment = (int16_t)((int16_t)i * 23 - 200);
        packets[i].flags = (uint8_t)(i ^ 0xa5u);
    }

    __avm_debug_break();

    uint32_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 24; ++repeat) {
        for (uint8_t i = 0; i < 24; ++i) {
            packet *p = &packets[i];
            uint32_t value = p->value + (uint32_t)(int32_t)p->adjustment;
            p->value = value ^ (uint32_t)p->flags;
            p->adjustment = (int16_t)(p->adjustment + (int16_t)p->tag);
            checksum += p->value ^ (uint16_t)p->adjustment;
        }
    }
    packed_fields_result = checksum;

    __avm_debug_break();
    return 0;
}
