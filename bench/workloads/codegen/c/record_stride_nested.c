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
static volatile uint16_t record_stride_nested_result;

int avm_test_main(void)
{
    for(uint8_t i = 0; i < 8; ++i) {
        records[i].y = (uint16_t)((7u - i) * 257u);
        records[i].id = (uint8_t)(i * 127u);
    }

    __avm_debug_break();

    uint16_t sum = 0;
    for(uint8_t repeat = 0; repeat < 16; ++repeat) {
        uint8_t order[8];
        uint8_t count = 0;
        for(uint8_t slot = 0; slot < 8; ++slot) {
            if(records[slot].id == 0)
                continue;
            uint8_t index = count;
            while(index != 0 && records[order[index - 1]].y > records[slot].y) {
                order[index] = order[index - 1];
                --index;
            }
            order[index] = slot;
            ++count;
        }
        for(uint8_t i = 0; i < count; ++i)
            sum = (uint16_t)(sum * 3u + order[i]);
    }
    record_stride_nested_result = sum;

    __avm_debug_break();
    return 0;
}
