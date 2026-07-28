#include <avm.h>

static uint8_t frame_duration_ms;
static uint8_t frame_start;
static bool just_rendered;

static uint8_t buttons_state_curr;
static uint8_t buttons_state_prev;

static uint16_t random_seed;

void avm_set_frame_rate(uint8_t rate_hz)
{
    avm_set_frame_duration((uint8_t)(1000u / rate_hz));
}

void avm_set_frame_duration(uint8_t duration_ms)
{
    frame_duration_ms = duration_ms;
    just_rendered = true;
    frame_start = (uint8_t)avm_millis();
}

bool avm_next_frame()
{
    if(just_rendered)
    {
        just_rendered = false;
        return false;
    }

    uint8_t now = (uint8_t)avm_millis();
    uint8_t dur_ms = now - frame_start;

    if(dur_ms < frame_duration_ms)
    {
        if(++dur_ms < frame_duration_ms)
            avm_idle();
        return false;
    }

    just_rendered = true;
    frame_start = now;
    return true;
}

void avm_poll_buttons(void)
{
    buttons_state_prev = buttons_state_curr;
    buttons_state_curr = avm_buttons();
}

bool avm_just_pressed(uint8_t button)
{
    return !(buttons_state_prev & button) && (buttons_state_curr & button);
}

bool avm_just_released(uint8_t button)
{
    return (buttons_state_prev & button) && !(buttons_state_curr & button);
}

void avm_init_random_seed(void)
{
    uint16_t t = avm_generate_random_seed();
    if(t == 0)
        t = 0xbabe;
    random_seed = t;
}

uint16_t avm_random(void)
{
    uint16_t x = random_seed;
    x ^= x << 7;
    x ^= x >> 9;
    x ^= x << 8;
    random_seed = x;
    return x;
}
