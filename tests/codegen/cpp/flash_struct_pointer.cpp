#include <avm/pgmspace.h>
#include <stdint.h>

#include "../c/test_hex_output.h"

#define CHECK(c) do { if (!(c)) { test_line16("line", __LINE__); return 1; } } while (0)

// A struct whose only member is a flash pointer is coerced to an integer when it is passed or
// returned by value. Flash pointers are 24 bits, so that coercion must keep every bit. The string
// lies past the 16-bit flash window, where a pointer truncated to 16 bits reads other bytes.
namespace {

// The padding and the string share one object, so the string starts exactly 0x10000 bytes into it.
// Its address is above 0xFFFF whatever order the linker chooses for separate objects.
struct Blob {
    uint8_t padding[0x10000];
    char text[13];
};

const Blob AVM_PROGMEM blob = {{1}, "flash-struct"};
char ram_text[] = "ram-struct";

struct FlashHolder {
    char const AVM_PROGMEM *text;
};

struct RamHolder {
    char const *text;
};

const FlashHolder constant_holder{blob.text};

__attribute__((noinline)) char first_flash_by_value(FlashHolder holder, uint8_t index) {
    return holder.text[index];
}

__attribute__((noinline)) FlashHolder flash_holder(char const AVM_PROGMEM *source) {
    return FlashHolder{source};
}

__attribute__((noinline)) char first_ram_by_value(RamHolder holder, uint8_t index) {
    return holder.text[index];
}

} // namespace

extern "C" int avm_test_main() {
    char const AVM_PROGMEM *text = blob.text;
    CHECK(blob.padding[0] == 1);
    CHECK((uint8_t const AVM_PROGMEM *)text >= blob.padding + 0x10000);

    CHECK(first_flash_by_value(FlashHolder{text}, 0) == 'f');
    CHECK(first_flash_by_value(FlashHolder{text}, 6) == 's');
    CHECK(first_flash_by_value(flash_holder(text), 11) == 't');
    CHECK(first_flash_by_value(constant_holder, 5) == '-');

    FlashHolder held = flash_holder(text);
    for (uint8_t i = 0; i < 12; ++i)
        CHECK(first_flash_by_value(held, i) == text[i]);

    CHECK(first_ram_by_value(RamHolder{ram_text}, 3) == '-');
    return 0;
}
