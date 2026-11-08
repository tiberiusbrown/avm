#include <stdbool.h>
#include <stdint.h>

#include "test_hex_output.h"

#if defined(__clang__) || defined(__GNUC__)
#define NOINLINE __attribute__((noinline))
#define SAVED __attribute__((section(".saved")))
#else
#define NOINLINE
#define SAVED
#endif

extern void __avm_save(void);
extern bool __avm_load(void);
extern bool __avm_save_exists(void);

enum { SAVED_BYTES = 64 };

static SAVED uint8_t saved_state[SAVED_BYTES];
static uint16_t ordinary_data = 0x1357;

static uint8_t pattern_byte(uint8_t version, uint16_t index)
{
    return (uint8_t)((uint16_t)version * 29u + index * 17u + (index >> 1));
}

static void fill_saved(uint8_t version)
{
    for(uint16_t i = 0; i < SAVED_BYTES; ++i)
        saved_state[i] = pattern_byte(version, i);
}

static bool check_saved(uint8_t version)
{
    for(uint16_t i = 0; i < SAVED_BYTES; ++i)
        if(saved_state[i] != pattern_byte(version, i))
            return false;
    return true;
}

static NOINLINE void call_save(void)
{
    __avm_save();
}

static NOINLINE bool call_load(void)
{
    return __avm_load();
}

static NOINLINE bool call_save_exists(void)
{
    return __avm_save_exists();
}

int avm_test_main(void)
{
    fill_saved(0x11);
    ordinary_data = 0x2468;

    const bool exists_initial = call_save_exists();
    const bool load_initial = call_load();
    const bool initial_unchanged = check_saved(0x11);

    call_save();
    const bool exists_after_first_save = call_save_exists();

    fill_saved(0x22);
    ordinary_data = 0x369c;
    const bool load_first = call_load();
    const bool first_restored = check_saved(0x11);
    const bool ordinary_first_unchanged = ordinary_data == 0x369c;

    /* A 64-byte payload uses 66 bytes per record. Seventy additional saves
       cross the 4 KiB sector limit and exercise erase/restart behavior. */
    for(uint16_t version = 1; version <= 70; ++version) {
        fill_saved((uint8_t)version);
        ordinary_data = (uint16_t)(0x4000u + version);
        call_save();
    }

    fill_saved(0xee);
    ordinary_data = 0xbeef;
    const bool exists_after_rollover = call_save_exists();
    const bool load_latest = call_load();
    const bool latest_restored = check_saved(70);
    const bool ordinary_latest_unchanged = ordinary_data == 0xbeef;

    test_line16("E0", exists_initial);
    test_line16("L0", load_initial);
    test_line16("U0", initial_unchanged);
    test_line16("E1", exists_after_first_save);
    test_line16("L1", load_first);
    test_line16("S1", first_restored);
    test_line16("D1", ordinary_first_unchanged);
    test_line16("ER", exists_after_rollover);
    test_line16("LR", load_latest);
    test_line16("SR", latest_restored);
    test_line16("DR", ordinary_latest_unchanged);

    return exists_initial || load_initial || !initial_unchanged ||
           !exists_after_first_save || !load_first || !first_restored ||
           !ordinary_first_unchanged || !exists_after_rollover || !load_latest ||
           !latest_restored || !ordinary_latest_unchanged;
}
