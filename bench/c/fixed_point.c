#include <stdint.h>

typedef struct {
    int16_t position;
    int16_t velocity;
    int16_t acceleration;
    int16_t scale;
} fixed_body;

static fixed_body bodies[32];
static volatile uint16_t fixed_point_result;

static int16_t clamp_i16(int32_t value)
{
    if (value > 32767)
        return 32767;
    if (value < -32768)
        return -32768;
    return (int16_t)value;
}

int avm_test_main(void)
{
    for (uint8_t i = 0; i < 32; ++i) {
        bodies[i].position = (int16_t)((int16_t)i * 256 - 4096);
        bodies[i].velocity = (int16_t)((int16_t)i * 17 - 200);
        bodies[i].acceleration = (int16_t)((int16_t)(i % 7u) - 3);
        bodies[i].scale = (int16_t)(128 + i * 5);
    }

    __avm_debug_break();

    uint16_t checksum = 0;
    for (uint8_t repeat = 0; repeat < 64; ++repeat) {
        fixed_body *body = bodies;
        for (uint8_t i = 0; i < 32; ++i, ++body) {
            body->velocity =
                (int16_t)(body->velocity + body->acceleration);
            body->position =
                (int16_t)(body->position + body->velocity);

            int32_t product =
                (int32_t)body->position * (int32_t)body->scale;
            int16_t scaled = clamp_i16((product + 128) >> 8);
            checksum = (uint16_t)(checksum + (uint16_t)scaled);
            checksum ^= (uint16_t)body->velocity;
        }
    }
    fixed_point_result = checksum;

    __avm_debug_break();
    return 0;
}
