#include <stdbool.h>
#include <stdint.h>

#include "test_hex_output.h"

#if defined(__clang__) || defined(__GNUC__)
#define NOINLINE __attribute__((noinline))
#else
#define NOINLINE
#endif

extern void __avm_save(void);
extern bool __avm_load(void);
extern bool __avm_save_exists(void);

static uint16_t ordinary_data = 0x1357;

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
    ordinary_data = 0x2468;
    const bool exists_before = call_save_exists();
    const bool load_before = call_load();

    call_save();
    call_save();

    const bool exists_after = call_save_exists();
    const bool load_after = call_load();
    const bool data_unchanged = ordinary_data == 0x2468;

    test_line16("E0", exists_before);
    test_line16("L0", load_before);
    test_line16("E1", exists_after);
    test_line16("L1", load_after);
    test_line16("D0", data_unchanged);

    return exists_before || load_before || exists_after || load_after ||
           !data_unchanged;
}
