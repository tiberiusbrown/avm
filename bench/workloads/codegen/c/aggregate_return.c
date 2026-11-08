#include <stdint.h>

typedef struct {
    uint32_t position;
    uint16_t velocity;
    uint16_t flags;
    uint8_t tag;
} sample;

static volatile uint16_t aggregate_seed = 0x1357u;
static volatile uint32_t aggregate_return_result;

__attribute__((noinline))
static sample advance(sample input, uint16_t step)
{
    input.position += (uint32_t)input.velocity * step;
    input.velocity = (uint16_t)(input.velocity + step + input.tag);
    input.flags ^= (uint16_t)(input.position >> 9);
    input.tag = (uint8_t)(input.tag + (uint8_t)step);
    return input;
}

int avm_test_main(void)
{
    __avm_debug_break();

    sample current = {0x12345678u, aggregate_seed, 0x55aau, 7};
    uint32_t checksum = 0;
    for (uint16_t i = 0; i < 256; ++i) {
        current = advance(current, (uint16_t)(i + 3u));
        checksum ^= current.position + current.velocity +
                    current.flags + current.tag;
    }
    aggregate_return_result = checksum ^ current.position;

    __avm_debug_break();
    return 0;
}
