#include <absim.hpp>
#include <absim_regs.hpp>
#include "avm_spi_observer.hpp"

#include <algorithm>
#include <array>
#include <fstream>
#include <iostream>
#include <map>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace {
void require(bool condition, char const* message)
{
    if(!condition) throw std::runtime_error(message);
}

struct harness {
    std::unique_ptr<absim::arduboy_t> e = std::make_unique<absim::arduboy_t>();
    std::map<std::string, unsigned> native, guest;
    std::vector<uint8_t> commands, pixels;
    bool observe = false;
    unsigned cases = 0;

    static void symbols(char const* path, std::map<std::string, unsigned>& out)
    {
        std::ifstream input(path);
        require(bool(input), "cannot read listing");
        for(std::string line; std::getline(input, line);) {
            std::istringstream fields(line);
            unsigned address;
            std::string token, name;
            if(!(fields >> std::hex >> address)) continue;
            while(fields >> token) name = token;
            out[name] = address;
        }
    }
    absim::atmega32u4_t& c() { return e->core_state.cpu; }
    uint16_t word(unsigned a) { return uint16_t(c().data[a] | c().data[a+1] << 8); }
    void word(unsigned a, uint16_t v) { c().data[a] = uint8_t(v); c().data[a+1] = uint8_t(v >> 8); }
    unsigned pc() { return word(4) | unsigned(c().data[6]) << 16; }
    bool boundary()
    {
        unsigned base = native.at("primary_table") / 2;
        return c().pc >= base && c().pc < base + 1024 && (c().pc - base) % 4 == 0;
    }
    void tick()
    {
        auto deadline = c().spi_transmit_zero_cycle;
        auto port = c().data[absim::reg::addr::PORTD];
        if(observe && c().pc * 2 == native.at("sys_display_impl")) {
            // SPIF can remain set from a previous timed transfer while the
            // speculative next-opcode transfer is still active. Exercise this
            // legal status state even if the fixture just acknowledged it.
            c().data[absim::reg::addr::SPSR] |= absim::reg::bit::SPSR::SPIF;
        }
        if(c().pc * 2 == native.at("display_acknowledge") ||
           c().pc * 2 == native.at("sys_display_acknowledge")) {
            require(!c().spi_busy || deadline <= c().cycle_count,
                    "OLED acknowledged final byte before completion");
            if(c().spi_clock_cycles == 2 &&
               (deadline == UINT64_MAX || c().cycle_count <= deadline))
                throw std::runtime_error("OLED status read before cycle-18 SPIF: cycle=" +
                                         std::to_string(c().cycle_count) + " boundary=" +
                                         std::to_string(deadline));
        }
        e->cycle();
        c().update_all();
        require(!c().should_autobreak(), "native emulator fault");
        auto next_port = c().data[absim::reg::addr::PORTD];
        if(!observe) return;
        if((port & 0x40) == 0 && (next_port & 0x40) != 0)
            require(!c().spi_busy || deadline <= c().cycle_count,
                    "OLED deselected before final byte completed");
        if((port & 0x02) == 0 && (next_port & 0x02) != 0)
            require(!c().spi_busy || deadline <= c().cycle_count,
                    "FX deselected before speculative byte completed");
        if(c().spi_transmit_zero_cycle != deadline && c().spi_busy) {
            require((next_port & 0x42) != 0, "OLED and FX selected simultaneously");
            if((next_port & 0x40) == 0) {
                auto& bytes = (next_port & 0x10) ? pixels : commands;
                bytes.push_back(c().spi_data_byte);
            }
        }
    }
    template<class F> void until(F done)
    {
        auto limit = c().cycle_count + 3000000;
        while(!done() && c().cycle_count < limit) tick();
        require(done(), "instruction boundary not reached");
    }
    harness(char** args, unsigned type)
    {
        symbols(args[2], native);
        symbols(args[4], guest);
        e->program_state.cfg.display_type = static_cast<absim::display_t::type_t>(type - 1);
        e->reset();
        for(auto file : {std::make_pair(args[1], "interpreter.hex"),
                         std::make_pair(args[3], "fxdata.bin")}) {
            std::ifstream input(file.first, std::ios::binary);
            require(bool(input), "cannot read firmware/image");
            auto error = e->load_file(file.second, input);
            if(!error.empty()) throw std::runtime_error(error);
        }
        c().no_merged = true;
        c().autobreaks.reset();
        avm_test::observe_spi_writes(c());
        c().pc = 0;
        until([&] { return boundary(); });
        // Isolate register and memory effects from autonomous timer activity.
        c().st(absim::reg::addr::TIMSK0, 0);
        c().st(absim::reg::addr::TIMSK3, 0);
    }
    absim::arduboy_t::tt_state_t at(char const* site)
    {
        auto address = guest.at(site);
        until([&] { return boundary() && pc() == address; });
        absim::arduboy_t::tt_state_t state;
        e->save_state_to_vector(state);
        return state;
    }
    void restore(absim::arduboy_t::tt_state_t const& state, unsigned flags)
    {
        e->load_state_from_vector(state);
        avm_test::observe_spi_writes(c());
        for(unsigned r = 0; r < 8; ++r)
            word(8 + r * 2, uint16_t(0x1234 + r * 0x1123));
        c().data[absim::reg::addr::GPIOR0] = uint8_t(0xAC | (flags & 3) | ((flags & 4) << 2));
        commands.clear(); pixels.clear(); observe = true;
    }
    std::array<uint16_t, 8> registers()
    {
        std::array<uint16_t, 8> result;
        for(unsigned r = 0; r < 8; ++r) result[r] = word(8 + r * 2);
        return result;
    }
    std::vector<uint8_t> ram() { return {c().data.begin() + 0x100, c().data.begin() + 0xA00}; }
    void instruction()
    {
        tick();
        until([&] { return boundary(); });
    }
    void check_preserved(std::array<uint16_t, 8> const& regs,
                         std::vector<uint8_t> const& memory, unsigned flags,
                         unsigned sp, unsigned native_sp, unsigned next)
    {
        require(registers() == regs, "guest registers changed");
        require(ram() == memory, "guest RAM changed");
        require(c().data[absim::reg::addr::GPIOR0] == flags, "VM flags changed");
        require(word(28) == sp && word(absim::reg::addr::SPL) == native_sp, "stack pointer changed");
        require(pc() == next, "wrong following instruction fetched");
        instruction();
        require(word(8) == regs[7], "following instruction did not execute");
        ++cases;
    }
};

void run(char** args, unsigned type)
{
    harness h(args, type);
    auto command_state = h.at("command_site");
    auto width_state = h.at("width_site");
    auto height_state = h.at("height_site");
    auto type_state = h.at("type_site");
    auto display_state = h.at("display_site");
    for(unsigned flags = 0; flags < 8; ++flags) {
        for(auto query : {std::make_pair(&width_state, 128u),
                          std::make_pair(&height_state, 64u),
                          std::make_pair(&type_state, type)}) {
            h.restore(*query.first, flags);
            auto regs = h.registers(); regs[4] = uint16_t(query.second);
            auto memory = h.ram();
            auto cc = h.c().data[absim::reg::addr::GPIOR0];
            auto sp = h.word(28), native_sp = h.word(absim::reg::addr::SPL);
            auto next = h.pc() + 2;
            h.instruction();
            require(h.commands.empty() && h.pixels.empty(), "query sent OLED bytes");
            h.check_preserved(regs, memory, cc, sp, native_sp, next);
        }
        for(unsigned n : {0u, 1u, 2u, 255u, 256u, 257u, 300u, 1024u}) {
            h.restore(command_state, flags);
            std::vector<uint8_t> bytes(n, 0xE3);
            if(n == 1) bytes[0] = 0xA7;
            if(n >= 2) { bytes[n - 2] = 0x81; bytes[n - 1] = uint8_t(n); }
            std::copy(bytes.begin(), bytes.end(), h.c().data.begin() + 0x100);
            h.word(16, n ? 0x100 : 0xFFFF);
            h.word(18, uint16_t(n));
            auto regs = h.registers();
            auto memory = h.ram();
            auto cc = h.c().data[absim::reg::addr::GPIOR0];
            auto sp = h.word(28), native_sp = h.word(absim::reg::addr::SPL);
            auto display_ram = h.e->peripherals.display.ram;
            h.instruction();
            require(h.commands == bytes && h.pixels.empty(), "command byte count/order or D/C mode wrong");
            require(h.e->peripherals.display.ram == display_ram, "commands wrote display pixel RAM");
            if(n == 1) require(h.e->peripherals.display.inverse_display, "single command not applied");
            if(n >= 2) require(h.e->peripherals.display.contrast == uint8_t(n), "final parameter not applied before return");
            h.check_preserved(regs, memory, cc, sp, native_sp, h.guest.at("command_site") + 2);
        }
    }
    // Alternate commands and framebuffer updates without restoring controller
    // state. Invert is intentionally retained through avm_display().
    h.restore(command_state, 0);
    h.c().data[0x100] = 0xA7;
    h.word(16, 0x100); h.word(18, 1);
    h.instruction();
    auto inverted_display = h.e->peripherals.display;
    h.restore(display_state, 0);
    h.e->peripherals.display = inverted_display;
    for(unsigned i = 0; i < 1024; ++i) h.c().data[0x500+i] = uint8_t(i * 37);
    h.word(16, 0);
    h.instruction();
    require(h.pixels.size() == 1024, "display update after commands lost bytes");
    require(h.e->peripherals.display.inverse_display, "display update reset caller's controller state");
    for(unsigned i = 0; i < 1024; ++i) {
        require(h.pixels[i] == uint8_t(i * 37), "framebuffer SPI payload corrupted after command stream");
        // Ardens currently masks its page-mode column counter to seven bits,
        // including for the 132-column SH1106. Its last two visible columns
        // are therefore checked by the exact SPI payload assertion above.
        if(type == 3 && (i & 127) >= 126) continue;
        // Startup's A1 segment remap mirrors columns within each page in
        // Ardens's physical display RAM; AVM's framebuffer remains linear.
        unsigned physical = (i & ~127u) | (127 - (i & 127));
        require(h.e->peripherals.display.ram[physical] == uint8_t(i * 37),
                "display image corrupted after command stream");
    }
    h.c().data[0x100] = 0xA6;
    // Run through the fixture loop to send another command after the update.
    h.observe = false;
    h.at("command_site");
    h.commands.clear(); h.pixels.clear(); h.observe = true;
    h.word(16, 0x100); h.word(18, 1);
    h.instruction();
    require(h.commands == std::vector<uint8_t>{0xA6} && !h.e->peripherals.display.inverse_display,
            "command after display update failed");
    std::cout << "Display type " << type << ": " << h.cases << " preservation cases and command/display sequencing passed\n";
}
}

int main(int argc, char** argv)
{
    try {
        require(argc == 6, "usage: display_system interpreter.hex interpreter.lst guest.bin guest.asm type");
        run(argv, unsigned(std::stoul(argv[5])));
        return 0;
    } catch(std::exception const& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
