#include <stdint.h>

typedef struct {
    uint32_t position;
    uint16_t velocity;
    uint8_t flags;
    int8_t delta;
} particle;

static particle input_particles[24];
static particle output_particles[24];
static volatile uint32_t struct_result;

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 24; ++i) {
        input_particles[i].position = 0x10000u + (uint32_t)i * 0x10203u;
        input_particles[i].velocity = (uint16_t)(i * 73u + 5u);
        input_particles[i].flags = (uint8_t)(i ^ 0x5au);
        input_particles[i].delta = (int8_t)((int16_t)i - 12);
    }

    __avm_debug_break();

    uint32_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 16; ++repeat) {
        for (uint8_t i = 0; i < 24; ++i) {
            particle value = input_particles[i];
            value.position += value.velocity;
            value.velocity =
                (uint16_t)(value.velocity + (int16_t)value.delta);
            value.flags ^= (uint8_t)value.position;
            output_particles[i] = value;

            checksum += value.position;
            checksum ^= value.velocity;
            checksum += value.flags;
        }
    }
    struct_result = checksum;

    __avm_debug_break();
    return 0;
}
