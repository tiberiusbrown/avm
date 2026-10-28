#include <absim.hpp>
#include <absim_regs.hpp>
#include "avm_spi_observer.hpp"

#include <algorithm>
#include <array>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <map>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>

using namespace absim;
namespace {
constexpr unsigned millis = 0xa05, pending = 0xa15, hold = 0xa16;
void require(bool ok, char const* message)
{
    if(!ok) throw std::runtime_error(message);
}
struct harness {
    std::unique_ptr<arduboy_t> e = std::make_unique<arduboy_t>();
    std::map<std::string, unsigned> symbols;
    // Canonical test bits: UP, DOWN, LEFT, RIGHT, A, B.
    std::array<unsigned, 6> ports{reg::addr::PINF, reg::addr::PINF,
        reg::addr::PINF, reg::addr::PINF, reg::addr::PINE, reg::addr::PINB};
    std::array<unsigned, 6> bits{7, 4, 5, 6, 6, 4};
    atmega32u4_t& c() { return e->core_state.cpu; }
    unsigned sym(char const* name) { return symbols.at(name) / 2; }
    uint32_t clock()
    {
        uint32_t result = 0;
        for(unsigned i = 0; i < 4; ++i) result |= uint32_t(c().data[millis+i]) << (8*i);
        return result;
    }
    void clock(uint32_t value)
    {
        for(unsigned i = 0; i < 4; ++i) c().data[millis+i] = uint8_t(value >> (8*i));
    }
    void buttons(unsigned pressed)
    {
        for(auto port : ports) c().data[port] = 255;
        for(unsigned i = 0; i < 6; ++i)
            if(pressed & (1u << i)) c().data[ports[i]] &= uint8_t(~(1u << bits[i]));
    }
    void tick()
    {
        e->cycle(); c().update_all();
        require(!c().should_autobreak(), "native emulator fault");
    }
    template<class F> uint64_t until(F done, uint64_t limit = 1000000)
    {
        auto start = c().cycle_count;
        while(!done() && c().cycle_count-start < limit) tick();
        if(!done()) throw std::runtime_error("native execution exceeded cycle limit at word PC " +
            std::to_string(c().pc) + ", WDTCSR=" + std::to_string(c().data[reg::addr::WDTCSR]));
        return c().cycle_count-start;
    }
    harness(char** args, bool live = false)
    {
        std::ifstream listing(args[2]); require(bool(listing), "listing unavailable");
        for(std::string line; std::getline(listing, line);) {
            std::istringstream fields(line);
            unsigned address; std::string token, name;
            if(!(fields >> std::hex >> address)) continue;
            while(fields >> token) name = token;
            symbols[name] = address;
        }
        std::string wiring = args[4];
        if(wiring == "split") {
            std::swap(ports[0], ports[5]); std::swap(bits[0], bits[5]);
        } else if(wiring == "shared") {
            std::swap(bits[0], bits[3]);
            std::swap(ports[4], ports[5]); std::swap(bits[4], bits[5]);
        }
        if(wiring == "MINI" || wiring == "FXC") {
            e->program_state.cfg.fxport_reg = reg::addr::PORTE;
            e->program_state.cfg.fxport_mask = 1u << 2;
        }
        e->reset();
        for(auto input : {std::make_pair(args[1], "interpreter.hex"),
                          std::make_pair(args[3], "fxdata.bin")}) {
            std::ifstream stream(input.first, std::ios::binary);
            require(bool(stream), "firmware/guest unavailable");
            auto error = e->load_file(input.second, stream);
            if(!error.empty()) throw std::runtime_error(error);
        }
        c().no_merged = true; c().autobreaks.reset();
        avm_test::observe_spi_writes(c());
        c().data[hold] = 0xa5; // Startup must clear inherited RAM.
        buttons(0); c().pc = 0;
        until([&] { return c().pc == sym("primary_D4_jmp8_rel8"); }, 2000000);
        require(c().data[hold] == 0, "startup did not clear boot hold");
        require(c().data[reg::addr::TCCR0A] == 2 && c().data[reg::addr::TCCR0B] == 3 &&
                c().data[reg::addr::OCR0A] == 249 && c().data[reg::addr::TIMSK0] == 2,
                "Timer0 configuration changed");
        if(!live) {
            c().st(reg::addr::TIMSK0, 0); c().st(reg::addr::TCCR0B, 0);
            c().st(reg::addr::TIMSK1, 0); c().st(reg::addr::TCCR1B, 0);
        }
    }
    uint64_t interrupt()
    {
        auto dest = sym("primary_table");
        c().push(uint8_t(dest)); c().push(uint8_t(dest >> 8));
        c().pc = uint16_t(sym("timer0_compa_isr"));
        c().data[reg::addr::SREG] &= 127; c().prev_sreg &= 127;
        return until([&] { return c().pc == dest; }) + 7; // acceptance + vector JMP
    }
    void arm_reset()
    {
        c().data[hold] = 47; c().data[pending] = 255;
        clock(31); buttons(3);
        c().pc = uint16_t(sym("timer0_compa_isr"));
        c().data[reg::addr::SREG] &= 127; c().prev_sreg &= 127;
        uint64_t unlock = 0, armed = 0;
        until([&] {
            auto csr = c().data[reg::addr::WDTCSR];
            if(csr == (reg::bit::WDTCSR::WDCE | reg::bit::WDTCSR::WDE) && !unlock)
                unlock = c().cycle_count;
            if(csr == reg::bit::WDTCSR::WDE && unlock && !armed) armed = c().cycle_count;
            return c().pc == sym("bootloader_reset_wait");
        });
        // Ardens does not enforce WDCE's timed window, so check the actual
        // instruction execution and both values explicitly as well.
        require(unlock && armed-unlock == 3, "watchdog timed-write sequence failed");
    }
};

void isolated(char** args)
{
    harness h(args);
    for(uint32_t before : {0u, 2u, 3u, 31u, 0xfeu, 0xffu, 0xffffu,
                           0xffffffu, 0xffffffffu}) {
        for(unsigned flags = 0; flags < 128; ++flags) {
            h.clock(before); h.buttons(0); h.c().data[hold] = 17; h.c().data[pending] = 0;
            for(unsigned i = 0; i < 32; ++i) h.c().data[i] = uint8_t(7*i + flags);
            h.c().data[reg::addr::SREG] = uint8_t(flags);
            auto saved = h.c().data; auto sp = h.c().sp();
            h.interrupt();
            require(h.clock() == uint32_t(before+1), "millisecond carry failed");
            require(h.c().data[pending] == ((uint32_t(before+1)&3) == 0), "4 ms tick phase failed");
            require(h.c().data[hold] == ((uint32_t(before+1)&31) == 0 ? 0 : 17),
                    "button polling escaped 32 ms boundary");
            for(unsigned i = 0; i < 32; ++i)
                require(h.c().data[i] == saved[i], "ISR corrupted interrupted register");
            require(h.c().data[reg::addr::SREG] == (flags|128), "ISR corrupted SREG");
            require(h.c().sp() == sp && h.c().data[reg::addr::GPIOR0] == saved[reg::addr::GPIOR0],
                    "ISR corrupted stack/guest flags");
        }
    }
    for(unsigned p = 0; p < 256; ++p) {
        h.clock(31); h.buttons(3); h.c().data[hold] = 0; h.c().data[pending] = uint8_t(p);
        h.interrupt();
        require(h.c().data[pending] == std::min(p+1, 255u), "pending saturation failed");
        require(h.c().data[hold] == 1, "saturated audio skipped button polling");
    }
    for(unsigned combo = 0; combo < 64; ++combo) {
        h.buttons(combo); h.clock(31); h.c().data[hold] = 23;
        h.interrupt();
        require(h.c().data[hold] == (combo == 3 ? 24 : 0), "exclusive UP+DOWN test failed");
    }
    h.clock(0); h.buttons(3); h.c().data[hold] = 0; h.c().data[pending] = 0;
    for(unsigned ms = 1; ms <= 1504; ++ms) {
        h.interrupt();
        require(h.clock() == ms && h.c().data[hold] == ms/32, "hold duration/phase failed");
        require(h.c().data[reg::addr::WDTCSR] == 0, "short hold enabled watchdog");
        require(h.c().data[pending] == std::min(ms/4, 255u), "audio cadence failed");
    }
    for(unsigned combo : {1u, 2u, 7u, 11u, 19u, 35u}) {
        h.clock(31); h.buttons(combo); h.c().data[hold] = 47; h.interrupt();
        require(h.c().data[hold] == 0, "release/extra button did not cancel hold");
        h.buttons(3);
        for(unsigned i = 0; i < 32; ++i) h.interrupt();
        require(h.c().data[hold] == 1, "hold resumed without restarting duration");
    }
    // Measure each normal path and the longest returning path (full carry + match).
    unsigned index = 0;
    std::array<unsigned, 4> expected{33, 42, 60, 76};
    if(std::string(args[4]) == "split") { expected[2] += 4; expected[3] += 4; }
    for(unsigned next : {1u, 4u, 32u, 0u}) {
        h.clock(next-1); h.buttons(next == 32 || next == 0 ? 3 : 0);
        h.c().data[hold] = 0; h.c().data[pending] = 0;
        auto cycles = h.interrupt();
        require(cycles == expected[index++], "Timer0 path cycle count changed");
        std::cout << "Timer0 next millis " << next << ": " << cycles << " cycles\n";
    }
    // Raw HEX loading defaults to the application reset vector in Ardens.
    // Model the programmed BOOTRST fuse used by a Cathy3K device.
    h.c().fuse_hi &= uint8_t(~1u);
    h.arm_reset();
    require(h.c().data[hold] == 48 && h.c().data[reg::addr::WDTCSR] == reg::bit::WDTCSR::WDE,
            "threshold did not arm shortest reset-only watchdog");
    require(!(h.c().data[reg::addr::SREG]&128), "reset loop enabled interrupts");
    // Ardens services watchdog reset and executes the first boot instruction
    // in one cycle() call, so observe its executing PC and cleared WDTCSR.
    auto reset_delay = h.until([&] { return h.c().data[reg::addr::WDTCSR] == 0; }, 300000);
    require(h.c().executing_instr_pc == h.c().bootloader_address(), "watchdog missed boot fuse entry");
    require(reset_delay >= 255990 && reset_delay <= 256010, "watchdog timeout was not 16 ms");
    std::cout << "Watchdog reset reached boot fuse entry after " << reset_delay << " cycles\n";
    // Direct foreground entry must disable interrupts too, without relying on ZERO.
    h.c().pc = uint16_t(h.sym("bootloader_reset"));
    h.c().data[2] = 0xa5; h.c().data[reg::addr::SREG] = 255;
    h.until([&] { return h.c().pc == h.sym("bootloader_reset_wait"); });
    require(h.c().data[reg::addr::WDTCSR] == reg::bit::WDTCSR::WDE &&
            !(h.c().data[reg::addr::SREG]&128), "foreground reset entry failed");
}

void live(char** args)
{
    harness h(args, true);
    // Startup leaves silent output stopped. Run synthesis interrupts while
    // the service-free guest spins, without adding a guest audio/button call.
    h.c().st(reg::addr::TCCR1B, 10); // CTC, prescaler 8, startup OCR1A=255
    h.c().st(reg::addr::TIMSK1, 2);
    auto begin = h.c().cycle_count;
    h.buttons(3);
    unsigned polls = 0, samples = 0;
    h.until([&] {
        if(h.c().pc == h.sym("timer0_boot_poll")) ++polls;
        if(h.c().pc == h.sym("timer1_compa_isr")) ++samples;
        return h.c().pc == h.sym("bootloader_reset_wait");
    }, 25000000);
    auto elapsed = h.c().cycle_count-begin;
    require(elapsed >= 1504u*16000 && elapsed <= 1536u*16000+100,
            "live hold did not trigger within sampling uncertainty");
    std::cout << "Busy guest: watchdog armed after " << elapsed/16000. << " ms, "
              << polls << " polls, " << samples << " Timer1 interrupts\n";
    require(polls == 48 && samples > 11000,
            "live shortcut depended on guest service or interfered with audio");
}
void live_smoke(char** args)
{
    harness h(args, true);
    h.c().st(reg::addr::TCCR1B, 10);
    h.c().st(reg::addr::TIMSK1, 2);
    h.buttons(3);
    auto begin = h.c().cycle_count;
    auto initial_clock = h.clock();
    unsigned polls = 0, samples = 0;
    while(h.c().cycle_count - begin < 64u * 16000) {
        if(h.c().pc == h.sym("timer0_boot_poll")) ++polls;
        if(h.c().pc == h.sym("timer1_compa_isr")) ++samples;
        h.tick();
    }
    auto elapsed_ms = uint32_t(h.clock() - initial_clock);
    require(polls > 0 && samples > 500, "live smoke missed button polls or Timer1 interrupts");
    require(elapsed_ms >= 63 && elapsed_ms <= 65, "live smoke Timer0 clock drifted");
    require(h.c().data[hold] > 0 && h.c().data[hold] == polls,
            "live smoke did not interpret physical UP+DOWN wiring");
    require(h.c().data[reg::addr::WDTCSR] == 0, "live smoke armed watchdog prematurely");
    std::cout << "Busy guest smoke: " << elapsed_ms << " ms, " << polls
              << " polls, " << samples << " Timer1 interrupts\n";
}
}
int main(int argc, char** argv)
{
    try {
        require(argc == 5, "usage: timer0_tests interpreter.hex interpreter.lst guest.bin wiring");
        isolated(argv);
        if(std::string(argv[4]) == "FX") live(argv);
        else live_smoke(argv);
        std::cout << "Timer0 clock/audio/buttons/watchdog checks passed (" << argv[4] << ")\n";
        return 0;
    } catch(std::exception const& error) { std::cerr << error.what() << '\n'; return 1; }
}
