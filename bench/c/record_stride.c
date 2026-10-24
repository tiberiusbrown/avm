#include <stdint.h>

struct record {
    uint16_t x;
    uint16_t y;
    uint8_t padding[6];
    uint8_t id;
    uint8_t tail[7];
};

_Static_assert(sizeof(struct record) == 18, "record stride");

static struct record records[8];
static volatile uint8_t length = 8;
static volatile uint16_t record_stride_result;

int avm_test_main(void)
{
    for(uint8_t i = 0; i < 8; ++i) {
        records[i].x = (uint16_t)(i * 71u + 129u);
        records[i].y = (uint16_t)((7u - i) * 257u);
        records[i].id = (uint8_t)(i * 127u);
    }

    __avm_debug_break();

    uint16_t sum = 0;
    for(uint8_t repeat = 0; repeat < 32; ++repeat) {
        uint8_t count = length;
        for(uint8_t i = 0; i < count; ++i) {
            if(records[i].id == 0)
                continue;
            sum = (uint16_t)(sum + records[i].x + records[i].y + i);
        }
    }
    record_stride_result = sum;

    __avm_debug_break();
    return 0;
}
