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

enum { SAVED_BYTES = 1024 };

static SAVED uint8_t saved_state[SAVED_BYTES];

static void test_line16_chars(char first, char second, uint16_t value)
{
    test_putc(first);
    test_putc(second);
    test_putc('=');
    test_hex16(value);
    test_putc('\n');
}

static uint8_t pattern_byte(uint8_t version, uint16_t index)
{
    return (uint8_t)((uint16_t)version * 43u + index * 13u + (index >> 3));
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
    const bool exists_initial = call_save_exists();

    /* A 1024-byte payload uses a 1026-byte record. Only three records fit;
       the fourth save must erase the sector and write a fresh record. */
    for(uint8_t version = 1; version <= 4; ++version) {
        fill_saved(version);
        call_save();
    }

    const bool exists_after_saves = call_save_exists();
    fill_saved(0xee);
    const bool load_first = call_load();
    const bool restored_first = check_saved(4);

    fill_saved(0xdd);
    const bool load_second = call_load();
    const bool restored_second = check_saved(4);

    test_line16_chars('E', '0', exists_initial);
    test_line16_chars('E', '1', exists_after_saves);
    test_line16_chars('L', '1', load_first);
    test_line16_chars('C', '1', restored_first);
    test_line16_chars('L', '2', load_second);
    test_line16_chars('C', '2', restored_second);

    return exists_initial || !exists_after_saves || !load_first ||
           !restored_first || !load_second || !restored_second;
}
