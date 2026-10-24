#include <avm/pgmspace.h>
#include <stdint.h>

struct program_record {
    const uint8_t AVM_PROGMEM *data;
    const char AVM_PROGMEM *title;
};

static const uint8_t AVM_PROGMEM data[] = {11, 37, 83, 149};
static const char AVM_PROGMEM title[] = "Tracks";
static const struct program_record AVM_PROGMEM records[256] = {
    [0] = {data, title},
    [127] = {data + 1, title + 1},
    [128] = {data + 2, title + 2},
    [255] = {data + 3, title + 3},
};

_Static_assert(sizeof(struct program_record) == 6, "two 24-bit pointers");

static volatile uint8_t selections[64];
static volatile uint16_t progmem_record_index_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 64; ++i) {
        static const uint8_t indices[] = {0, 127, 128, 255};
        selections[i] = indices[i & 3u];
    }

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 16; ++repeat) {
        for (uint8_t i = 0; i < 64; ++i) {
            uint8_t index = selections[i];
            const uint8_t AVM_PROGMEM *value = records[index].data;
            const char AVM_PROGMEM *name = records[index].title;
            checksum = (uint16_t)(checksum + *value + (uint8_t)*name);
        }
    }
    progmem_record_index_result = checksum;

    __avm_debug_break();
    return 0;
}
