#include <absim.hpp>
#include <absim_regs.hpp>
#include "avm_spi_observer.hpp"
#include "../../runtime/lib/math/fpoly.h"
#include <algorithm>
#include <array>
#include <cmath>
#include <cstring>
#include <fstream>
#include <iostream>
#include <map>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <vector>

namespace {
void require(bool c, const char *s) { if (!c) throw std::runtime_error(s); }
uint32_t bits(float x) { uint32_t u; std::memcpy(&u, &x, 4); return u; }
float value(uint32_t u) { float x; std::memcpy(&x, &u, 4); return x; }
struct harness {
    std::unique_ptr<absim::arduboy_t> e = std::make_unique<absim::arduboy_t>();
    std::map<std::string, unsigned> symbols;
    unsigned cases = 0, interrupted = 0;
    absim::atmega32u4_t& cpu() { return e->core_state.cpu; }
    unsigned sym(const char *s) { return symbols.at(s) / 2; }
    unsigned word(unsigned a) { return cpu().data[a] | unsigned(cpu().data[a+1]) << 8; }
    void word(unsigned a, unsigned v) { cpu().data[a] = uint8_t(v); cpu().data[a+1] = uint8_t(v>>8); }
    uint32_t pc() { return word(4) | uint32_t(cpu().data[6]) << 16; }
    bool boundary() { auto p = cpu().pc - sym("primary_table"); return p < 1024 && p % 4 == 0; }
    void tick() {
        if (cpu().pc == sym("timer1_compa_isr")) ++interrupted;
        e->cycle(); cpu().update_all();
        require(!cpu().should_autobreak(), "native emulator fault");
    }
    template<class F> void until(F f, unsigned limit = 2000000) {
        auto start = cpu().cycle_count;
        while (!f() && cpu().cycle_count - start < limit) tick();
        if (!f()) {
            std::ostringstream msg;
            msg << "fpoly did not finish: native PC=" << std::hex << cpu().pc*2
                << " guest PC=" << pc() << " after " << std::dec << cpu().cycle_count-start << " cycles";
            throw std::runtime_error(msg.str());
        }
    }
    harness(char **args) {
        std::ifstream listing(args[2]); require(bool(listing), "no listing");
        for (std::string line; std::getline(listing, line);) {
            std::istringstream in(line); unsigned a; std::string name, token;
            if (!(in >> std::hex >> a)) continue;
            while (in >> token) name = token;
            symbols[name] = a;
        }
        e->reset();
        for (auto p : {std::make_pair(args[1], "interpreter.hex"), std::make_pair(args[3], "fxdata.bin")}) {
            std::ifstream in(p.first, std::ios::binary);
            auto error = e->load_file(p.second, in);
            if (!error.empty()) throw std::runtime_error(error);
        }
        cpu().no_merged = true; cpu().autobreaks.reset();
        avm_test::observe_spi_writes(cpu());
        cpu().pc = 0;
        until([&]{ return boundary(); });
        cpu().st(absim::reg::addr::TIMSK0, 0);
        cpu().st(absim::reg::addr::TCCR0B, 0);
    }
    void asset(uint32_t a, const std::vector<uint8_t>& data) {
        uint32_t base = uint32_t(word(0xa00)) << 8;
        auto& fx = e->peripherals.fx;
        for (unsigned i = 0; i < data.size(); ++i) {
            auto addr = (base + a + i) & 0xffffff;
            auto& sector = fx.sectors[addr / 4096];
            if (!sector) { sector = std::make_unique<absim::w25q128_t::sector_t>(); sector->fill(255); }
            (*sector)[addr % 4096] = data[i];
        }
    }
    uint64_t run(float x, const std::vector<float>& c, uint32_t address = 0x200,
                 unsigned flags = 0xac, bool audio = false, unsigned phase = 0) {
        cpu().st(absim::reg::addr::TIMSK1, 0);
        cpu().st(absim::reg::addr::TCCR1B, 0);
        // Finish any speculative transfer before seeking to the new test.
        auto resume = cpu().pc;
        cpu().push(uint8_t(resume)); cpu().push(uint8_t(resume >> 8));
        cpu().pc = uint16_t(sym("interp_delay_17"));
        tick(); until([&]{ return cpu().pc == resume; });
        std::vector<uint8_t> data = {0xff, 0xca, uint8_t(c.size())};
        for (float f : c) {
            auto u = bits(f);
            for (unsigned b = 0; b < 4; ++b) data.push_back(uint8_t(u >> (8*b)));
        }
        data.push_back(0); // NOP after the complete variable-length instruction.
        data.push_back(0);
        asset(address, data);
        word(4, address); cpu().data[6] = uint8_t(address >> 16);
        cpu().pc = uint16_t(sym("seek_and_dispatch_func")); tick();
        until([&]{ return boundary(); });
        require(cpu().pc == sym("primary_table") + 4 * 0xff, "did not fetch fpoly");
        for (unsigned r = 8; r < 24; ++r) cpu().data[r] = uint8_t(r * 13 + 7);
        auto u = bits(x);
        for (unsigned b = 0; b < 4; ++b) cpu().data[16+b] = uint8_t(u >> (8*b));
        word(28, 0x0980);
        cpu().data[absim::reg::addr::GPIOR0] = uint8_t(flags);
        auto before = cpu().data;
        auto sp = cpu().sp();
        if (audio) {
            word(0xa18, 0x1234); // Active pulse voice, rather than silent ISR only.
            cpu().data[0xa1a] = 96;
            cpu().data[0xa24] = 128;
            cpu().st(absim::reg::addr::TCNT1H, 0);
            cpu().st(absim::reg::addr::TCNT1L, uint8_t(phase));
            cpu().st(absim::reg::addr::TCCR1B, 10);
            cpu().st(absim::reg::addr::TIMSK1, 2);
        }
        auto start = cpu().cycle_count;
        tick(); until([&]{ return (boundary() && cpu().pc != sym("primary_table")+4*0xff) || cpu().pc == sym("invalid_secondary_instruction_func"); });
        if (c.empty()) {
            require(cpu().pc == sym("invalid_secondary_instruction_func"), "zero count did not trap");
            return 0;
        }
        require(boundary(), "valid fpoly trapped");
        auto elapsed = cpu().cycle_count - start;
        if (pc() != ((address + 3 + c.size()*4) & 0xffffff)) {
            std::ostringstream msg;
            msg << "incorrect coefficient PC carry: address=" << std::hex << address << " pc=" << pc() << " cases=" << std::dec << cases;
            throw std::runtime_error(msg.str());
        }
        require(cpu().pc == sym("primary_table"), "wrong opcode after coefficients");
        for (unsigned r : {2u,3u,7u,8u,9u,10u,11u,12u,13u,14u,15u,20u,21u,22u,23u,28u,29u})
            require(cpu().data[r] == before[r], "architectural register corrupted");
        require(cpu().sp() == sp, "native stack leaked");
        require(cpu().data[absim::reg::addr::GPIOR0] == flags, "VM flags corrupted");
        require(std::equal(before.begin()+0x100, before.begin()+0xa00, cpu().data.begin()+0x100), "guest SRAM changed");
        uint32_t actual = word(16) | uint32_t(word(18)) << 16;
        uint32_t expected = bits(avm_poly_host(x, c.data(), unsigned(c.size())));
        if (actual != expected && !(std::isnan(value(actual)) && std::isnan(value(expected)))) {
            std::ostringstream msg;
            msg << "fpoly x=" << std::hex << bits(x) << " actual=" << actual << " expected=" << expected << " count=" << std::dec << c.size();
            for (float coefficient : c) msg << " " << std::hex << bits(coefficient);
            throw std::runtime_error(msg.str());
        }
        // Execute NOP too: confirms the prefetched byte and following handoff.
        auto previous_pc = pc();
        tick(); until([&]{ return boundary() && pc() != previous_pc; });
        require(pc() == ((address + 4 + c.size()*4) & 0xffffff), "fetch did not resume");
        ++cases;
        return elapsed;
    }
};
uint32_t random(uint32_t& s) { s ^= s << 13; s ^= s >> 17; s ^= s << 5; return s; }
}
int main(int argc, char **argv) {
    try {
        require(argc == 4, "usage: fpoly interpreter.hex interpreter.lst fxdata.bin");
        harness h(argv);
        h.run(value(0xbe59ccc4), {value(0x3e59060f),value(0x3d871723),value(0xbf05e4d2),value(0x3c6e2ebd),value(0x3e867041),value(0x3d4ddec6)});
        for (unsigned n : {1u,2u,3u,5u,9u,13u,255u}) {
            std::vector<float> c(n, 0.25f);
            auto cycles = h.run(0.5f, c);
            std::cout << "degree " << n-1 << ": " << cycles << " cycles\n";
        }
        for (uint32_t address : {0xfffcu,0xfffffcu})
            for (unsigned flags = 0; flags < 8; ++flags)
                h.run(-0.75f, {0.25f,-0.5f,0.75f,-1.0f,1.25f}, address, 0xac | (flags & 3) | ((flags & 4) << 2));
        for (uint32_t u : {0u,0x80000000u,1u,0x007fffffu,0x00800000u,0x7f7fffffu,0x7f800000u,0xff800000u,0x7fc12345u}) {
            h.run(value(u), {1.0f});
            h.run(value(u), {0.25f,0.5f,0.75f});
        }
        h.run(0.75f, {value(1), 0.0f, 0.0f});
        h.run(0.75f, {value(1), value(1), 0.0f});
        h.run(0.75f, {-value(1), -value(1), 0.0f});
        uint32_t state = 0x53504931;
        for (unsigned i = 0; i < 3000; ++i) {
            float x = value(0x3e000000 | (random(state) & 0x81ffffff));
            std::vector<float> c;
            unsigned n = 2 + random(state)%12;
            for (unsigned j = 0; j < n; ++j) c.push_back(value(0x3c000000 | (random(state) & 0x83ffffff)));
            h.run(x, c);
        }
        for (unsigned i = 0; i < 200; ++i) {
            float x = value(random(state));
            std::vector<float> c = {value(random(state)), value(random(state)), value(random(state))};
            h.run(x, c);
        }
        for (unsigned phase = 0; phase < 128; ++phase)
            h.run(0.75f, {0.25f,-0.5f,0.75f,-1.0f,1.25f}, 0x200, 0xbd, true, phase);
        require(h.interrupted > 0, "did not exercise audio interrupts");
        h.run(0.5f, {});
        std::cout << h.cases << " fpoly cases passed; " << h.interrupted << " audio interrupts; SPI continuation, flags, registers and PC carries verified\n";
        return 0;
    } catch (const std::exception& e) { std::cerr << e.what() << '\n'; return 1; }
}
