#include <absim.hpp>
#include <absim_regs.hpp>
#include "avm_spi_observer.hpp"
#include "../../runtime/lib/math/fpoly.h"
#include "../../runtime/lib/math/native_math.h"
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
    std::array<uint64_t,8> accelerator_min={UINT64_MAX,UINT64_MAX,UINT64_MAX,UINT64_MAX,
                                          UINT64_MAX,UINT64_MAX,UINT64_MAX,UINT64_MAX};
    std::array<uint64_t,8> accelerator_max{};
    inline static harness *observed = nullptr;
    bool sign_pending = false, sign_read = false;
    unsigned sign_op = 0;
    uint64_t ff_out_cycle = 0;
    uint64_t early_sign_in = UINT64_MAX;
    std::array<uint64_t, 8> min_sign_in{}, min_sign_out{};
    std::array<unsigned, 8> sign_reads{};
    absim::atmega32u4_t& cpu() { return e->core_state.cpu; }
    unsigned sym(const char *s) { return symbols.at(s) / 2; }
    unsigned word(unsigned a) { return cpu().data[a] | unsigned(cpu().data[a+1]) << 8; }
    void word(unsigned a, unsigned v) { cpu().data[a] = uint8_t(v); cpu().data[a+1] = uint8_t(v>>8); }
    uint32_t pc() { return word(4) | uint32_t(cpu().data[6]) << 16; }
    bool boundary() { auto p = cpu().pc - sym("primary_table"); return p < 1024 && p % 4 == 0; }
    static void checked_write(absim::atmega32u4_t& c, uint16_t ptr, uint8_t byte) {
        auto& h = *observed;
        if (c.executing_instr_pc == h.sym("ff_next_byte_out")) {
            h.ff_out_cycle = c.cycle_count;
            h.sign_pending = false;
        } else if (h.sign_pending && c.executing_instr_pc == h.sym("cluster_tail_18") + 2) {
            auto delta = c.cycle_count - h.ff_out_cycle;
            require(h.sign_read && delta >= 18, "early FF sign SPI write");
            h.min_sign_out[h.sign_op] = std::min(h.min_sign_out[h.sign_op], delta);
            h.sign_pending = false;
        }
        avm_test::checked_spi_write(c, ptr, byte);
    }
    static uint8_t checked_read(absim::atmega32u4_t& c, uint16_t ptr) {
        auto& h = *observed;
        if (h.sign_pending && c.executing_instr_pc == h.sym("cluster_tail_18") + 1) {
            auto delta = c.cycle_count - h.ff_out_cycle;
            if (delta < 17) h.early_sign_in = delta;
            require(delta >= 17, "early FF sign SPI read");
            h.min_sign_in[h.sign_op] = std::min(h.min_sign_in[h.sign_op], delta);
            ++h.sign_reads[h.sign_op];
            h.sign_read = true;
        }
        auto byte = absim::atmega32u4_t::spi_handle_ld_spdr(c, ptr);
        if (c.executing_instr_pc == h.sym("ff_next_byte_out") + 1) {
            h.sign_pending = byte >= 4 && byte < 12;
            h.sign_read = false;
            if (h.sign_pending) h.sign_op = byte - 4;
        }
        return byte;
    }
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
    harness(char **args, bool fxc = false) {
        std::ifstream listing(args[2]); require(bool(listing), "no listing");
        for (std::string line; std::getline(listing, line);) {
            std::istringstream in(line); unsigned a; std::string name, token;
            if (!(in >> std::hex >> a)) continue;
            while (in >> token) name = token;
            symbols[name] = a;
        }
        require(symbols.at("ff_table_end") - symbols.at("ff_table") == 124,
                "FF jump table is not exactly 31 two-word entries");
        if (fxc) {
            e->program_state.cfg.fxport_reg = absim::reg::addr::PORTE;
            e->program_state.cfg.fxport_mask = 1u << 2;
        }
        e->reset();
        for (auto p : {std::make_pair(args[1], "interpreter.hex"), std::make_pair(args[3], "fxdata.bin")}) {
            std::ifstream in(p.first, std::ios::binary);
            auto error = e->load_file(p.second, in);
            if (!error.empty()) throw std::runtime_error(error);
        }
        cpu().no_merged = true; cpu().autobreaks.reset();
        avm_test::observe_spi_writes(cpu());
        min_sign_in.fill(UINT64_MAX); min_sign_out.fill(UINT64_MAX);
        observed = this;
        cpu().st_handlers[absim::reg::addr::SPDR] = checked_write;
        cpu().ld_handlers[absim::reg::addr::SPDR] = checked_read;
        cpu().pc = 0;
        until([&]{ return boundary(); });
        cpu().st(absim::reg::addr::TIMSK0, 0);
        cpu().st(absim::reg::addr::TCCR0B, 0);
    }
    ~harness() { if (observed == this) observed = nullptr; }
    void verify_sign_timing() {
        std::cout << "FF sign SPI minimum IN/OUT cycles after handoff OUT:";
        for (unsigned i = 0; i < 8; ++i) {
            require(sign_reads[i] > 0, "missing FF sign timing coverage");
            require(min_sign_in[i] == (i < 6 ? 20u : 17u) &&
                    min_sign_out[i] == (i < 6 ? 21u : 18u),
                    "FF sign timing no longer matches the documented schedule");
            std::cout << " " << i + 4 << "=" << min_sign_in[i] << "/" << min_sign_out[i];
        }
        std::cout << '\n';
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
    void accelerator(unsigned op, uint32_t a, uint32_t b, uint32_t c,
                     uint32_t expected, int quadrant = 0, uint32_t address = 0x200,
                     bool audio = false, unsigned phase = 0) {
        cpu().st(absim::reg::addr::TIMSK1, 0);
        cpu().st(absim::reg::addr::TCCR1B, 0);
        auto resume = cpu().pc;
        cpu().push(uint8_t(resume)); cpu().push(uint8_t(resume >> 8));
        cpu().pc = uint16_t(sym("interp_delay_17"));
        tick(); until([&]{ return cpu().pc == resume; });
        asset(address, {0xff, uint8_t(op), 0xff, 0x04, 0});
        word(4, address); cpu().data[6] = uint8_t(address >> 16);
        cpu().pc = uint16_t(sym("seek_and_dispatch_func")); tick();
        until([&]{ return boundary(); });
        for (unsigned r = 8; r < 24; ++r) cpu().data[r] = uint8_t(r*13+7);
        auto put = [&](unsigned r, uint32_t u) {
            for (unsigned k=0;k<4;++k) cpu().data[r+k]=uint8_t(u>>(8*k));
        };
        put(8,c); put(16,a); put(20,b);
        word(28,0x980);
        cpu().data[absim::reg::addr::GPIOR0] = 0xbd;
        auto before=cpu().data;
        auto sp=cpu().sp();
        if (audio) {
            word(0xa18,0x1234); cpu().data[0xa1a]=96; cpu().data[0xa24]=128;
            cpu().st(absim::reg::addr::TCNT1H,0);
            cpu().st(absim::reg::addr::TCNT1L,uint8_t(phase));
            cpu().st(absim::reg::addr::TCCR1B,10);
            cpu().st(absim::reg::addr::TIMSK1,2);
        }
        auto begin_cycles=cpu().cycle_count;
        tick(); until([&]{return boundary() && pc()!=address;});
        if(!audio) {
            auto cycles=cpu().cycle_count-begin_cycles;
            accelerator_min[op-0x17]=std::min(accelerator_min[op-0x17],cycles);
            accelerator_max[op-0x17]=std::max(accelerator_max[op-0x17],cycles);
        }
        require(pc()==((address+2)&0xffffff),"accelerator PC advancement");
        require(cpu().sp()==sp && word(28)==0x980,"accelerator stack preservation");
        require(cpu().data[absim::reg::addr::GPIOR0]==0xbd,"accelerator CC preservation");
        for(unsigned r: {2u,3u,7u,8u,9u,10u,11u,12u,13u,14u,15u,22u,23u})
            require(cpu().data[r]==before[r],"accelerator register preservation");
        if(op!=0x1d) require(word(20)==(b&0xffff),"accelerator q3 preservation");
        else require(word(20)==unsigned(quadrant),"FREMPIO2 quadrant");
        require(std::equal(before.begin()+0x100,before.begin()+0xa00,cpu().data.begin()+0x100),
                "accelerator guest memory preservation");
        uint32_t actual=word(16)|(uint32_t(word(18))<<16);
        if(actual!=expected && !(std::isnan(value(actual)) && std::isnan(value(expected)))) {
            std::ostringstream msg;
            msg << "accelerator " << std::hex << op << " inputs " << a << "," << b << "," << c
                << " actual " << actual << " expected " << expected;
            throw std::runtime_error(msg.str());
        }
        // Mixed FF continuation checks the still-active SPI stream too.
        auto previous=pc(); tick(); until([&]{return boundary()&&pc()!=previous;});
        require(cpu().data[11]==(before[11]^0x80),"accelerator mixed FF continuation");
        require(pc()==((address+4)&0xffffff),"accelerator continuation PC");
        ++cases;
    }
    void reject_old_image() {
        cpu().st(absim::reg::addr::TIMSK1, 0);
        cpu().st(absim::reg::addr::TCCR1B, 0);
        auto resume = cpu().pc;
        cpu().push(uint8_t(resume)); cpu().push(uint8_t(resume >> 8));
        cpu().pc = uint16_t(sym("interp_delay_17"));
        tick(); until([&]{return cpu().pc == resume;});
        // Drain the completed sequential transfer before entering startup's
        // blocking SPI reader, as the real reset path does during SPI setup.
        (void)cpu().ld(absim::reg::addr::SPSR);
        (void)cpu().ld(absim::reg::addr::SPDR);
        asset(0, {0x41, 0x56, 0x4d, 1, 1});
        cpu().pc = uint16_t(sym("startup_read_header"));
        tick(); until([&]{return cpu().pc == sym("startup_invalid_image");});
    }
    // Direct execution of every short FF entry, including register aliases,
    // mixed/consecutive fetches, carry boundaries, and interrupt phases.
    void short_ff(unsigned op, uint32_t address, unsigned flags,
                  bool audio = false, unsigned phase = 0) {
        cpu().st(absim::reg::addr::TIMSK1, 0);
        cpu().st(absim::reg::addr::TCCR1B, 0);
        auto resume = cpu().pc;
        cpu().push(uint8_t(resume)); cpu().push(uint8_t(resume >> 8));
        cpu().pc = uint16_t(sym("interp_delay_17"));
        tick(); until([&]{ return cpu().pc == resume; });
        asset(address, {0xff, uint8_t(op), 0xff, 0x04, 0, 0xff, 0x09, 0});
        word(4, address); cpu().data[6] = uint8_t(address >> 16);
        cpu().pc = uint16_t(sym("seek_and_dispatch_func")); tick();
        until([&]{ return boundary(); });
        std::array<uint32_t, 4> q = {0xff812345u, 0x80000001u, bits(6.0f), bits(2.0f)};
        if (op == 12) q[2] = 0x12348011;
        if (op == 13) q[2] = 0x1234fff1;
        if (op == 16) q[2] = uint32_t(-1234567);
        if (op == 17) q[2] = 3456789012u;
        for (unsigned i = 0; i < 4; ++i)
            for (unsigned b = 0; b < 4; ++b) cpu().data[8+4*i+b] = uint8_t(q[i] >> (8*b));
        word(28, 0x980);
        cpu().data[absim::reg::addr::GPIOR0] = uint8_t(flags);
        auto expected = cpu().data;
        auto store = [&](unsigned r, uint32_t v, unsigned n) {
            for (unsigned b=0; b<n; ++b) expected[r+b] = uint8_t(v >> (8*b));
        };
        if (op < 4) {
            float result[] = {8.0f, 4.0f, 12.0f, 3.0f};
            store(16, bits(result[op]), 4);
        } else if (op < 8) store(8+4*(op&3), q[op&3]^0x80000000u, 4);
        else if (op < 12) store(8+4*(op&3), q[op&3]&0x7fffffffu, 4);
        else if (op == 12) store(16, bits(float(int16_t(q[2]))), 4);
        else if (op == 13) store(16, bits(float(uint16_t(q[2]))), 4);
        else if (op == 14 || op == 15) store(16, 6, 2);
        else if (op == 16) store(16, bits(float(int32_t(q[2]))), 4);
        else if (op == 17) store(16, bits(float(q[2])), 4);
        else if (op == 18 || op == 19) store(16, 6, 4);
        else if (op == 20) store(20, 1, 2);
        else if (op == 21) store(20, 0x100, 2);
        auto sp = cpu().sp();
        if (audio) {
            word(0xa18, 0x1234); cpu().data[0xa1a] = 96; cpu().data[0xa24] = 128;
            cpu().st(absim::reg::addr::TCNT1H, 0);
            cpu().st(absim::reg::addr::TCNT1L, uint8_t(phase));
            cpu().st(absim::reg::addr::TCCR1B, 10);
            cpu().st(absim::reg::addr::TIMSK1, 2);
        }
        tick(); until([&]{return (boundary() && pc() != address) || cpu().pc == sym("invalid_secondary_instruction_func");});
        if (op >= 31) {
            require(cpu().pc == sym("invalid_secondary_instruction_func"), "reserved FF did not trap");
            return;
        }
        require(boundary(), "valid short FF trapped");
        auto check = [&] {
            for (unsigned r=8; r<24; ++r) if (expected[r] != cpu().data[r]) {
                std::ostringstream msg;
                msg << "short FF op=" << std::hex << op << " address=" << address
                    << " PC=" << pc() << " phase=" << phase << " native r" << std::dec << r
                    << " expected=" << std::hex << unsigned(expected[r]) << " actual=" << unsigned(cpu().data[r]);
                throw std::runtime_error(msg.str());
            }
            require(cpu().data[2] == 0 && cpu().data[3] == 1 && cpu().data[7] == 4, "native constants corrupted");
            require(cpu().data[absim::reg::addr::GPIOR0] == flags, "short FF flags corrupted");
            require(cpu().sp() == sp && word(28) == 0x980, "short FF stack corruption");
        };
        check();
        require(pc() == ((address+2)&0xffffff), "short FF PC carry");
        // Next FF toggles q0, then NOP, then FF clears q1 sign.
        expected[11] ^= 0x80;
        tick(); until([&]{return boundary() && pc() != ((address+2)&0xffffff);}); check();
        require(pc() == ((address+4)&0xffffff), "FF after FF fetch");
        tick(); until([&]{return boundary() && pc() != ((address+4)&0xffffff);}); check();
        require(pc() == ((address+5)&0xffffff), "NOP after FF fetch");
        expected[15] &= 0x7f;
        tick(); until([&]{return boundary() && pc() != ((address+5)&0xffffff);}); check();
        require(pc() == ((address+7)&0xffffff), "FF after NOP fetch");
        ++cases;
    }
    void run(float x, const std::vector<float>& c, uint32_t address = 0x200,
                 unsigned flags = 0xac, bool audio = false, unsigned phase = 0, bool next_ff = false) {
        cpu().st(absim::reg::addr::TIMSK1, 0);
        cpu().st(absim::reg::addr::TCCR1B, 0);
        // Finish any speculative transfer before seeking to the new test.
        auto resume = cpu().pc;
        cpu().push(uint8_t(resume)); cpu().push(uint8_t(resume >> 8));
        cpu().pc = uint16_t(sym("interp_delay_17"));
        tick(); until([&]{ return cpu().pc == resume; });
        std::vector<uint8_t> data = {0xff, 0x16, uint8_t(c.size())};
        for (float f : c) {
            auto u = bits(f);
            for (unsigned b = 0; b < 4; ++b) data.push_back(uint8_t(u >> (8*b)));
        }
        if (next_ff) { data.push_back(0xff); data.push_back(0x04); }
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
        tick(); until([&]{ return (boundary() && pc() != address) || cpu().pc == sym("invalid_secondary_instruction_func"); });
        if (c.empty()) {
            require(cpu().pc == sym("invalid_secondary_instruction_func"), "zero count did not trap");
            return;
        }
        require(boundary(), "valid fpoly trapped");
        if (pc() != ((address + 3 + c.size()*4) & 0xffffff)) {
            std::ostringstream msg;
            msg << "incorrect coefficient PC carry: address=" << std::hex << address << " pc=" << pc() << " cases=" << std::dec << cases;
            throw std::runtime_error(msg.str());
        }
        require(cpu().pc == sym("primary_table") + (next_ff ? 4*0xff : 0), "wrong opcode after coefficients");
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
        if (next_ff) {
            auto previous = pc();
            tick(); until([&]{return boundary() && pc() != previous;});
            require(cpu().data[11] == (before[11] ^ 0x80), "FPOLY followed by FF");
            require(pc() == ((address + 5 + c.size()*4) & 0xffffff), "FPOLY/FF continuation PC");
            ++cases;
            return;
        }
        // Execute NOP too: confirms the prefetched byte and following handoff.
        auto previous_pc = pc();
        tick(); until([&]{ return boundary() && pc() != previous_pc; });
        require(pc() == ((address + 4 + c.size()*4) & 0xffffff), "fetch did not resume");
        ++cases;
    }
};
uint32_t random(uint32_t& s) { s ^= s << 13; s ^= s >> 17; s ^= s << 5; return s; }
}
void validate_native_reduction() {
    double maximum=0;
    uint32_t worst=0;
    const double pio2=1.57079632679489661923132169163975144;
    for(uint32_t u=0x3f490fdb;u<=0x43000000;++u) {
        float x=value(u);
        int q;
        float r=avm_native_rempio2(x,&q);
        unsigned n=unsigned(std::floor(double(x)/pio2+0.5));
        double reference=double(x)-n*pio2;
        double error=std::abs(double(r)-reference);
        require(q==int(n&3),"native reduction range: quadrant mismatch");
        require(error<=3.473e-8,"native reduction range: absolute error");
        require(std::signbit(r)==std::signbit(reference),"native reduction range: zero side");
        if(std::abs(r)>=0x1p-12f)
            require(error/std::abs(reference)<2.04e-5,"native reduction range: tangent error");
        if(error>maximum) {maximum=error;worst=u;}
    }
    std::cout << "Native pi/2 range: every binary32 in [pi/4,128], quadrants and zero sides exact; max error "
              << maximum << " at " << std::hex << worst << std::dec << '\n';
}
int main(int argc, char **argv) {
    try {
        require(argc == 4 || (argc == 5 && std::string(argv[4]) == "FXC"),
                "usage: fpoly interpreter.hex interpreter.lst fxdata.bin [FXC]");
        if(argc==4) validate_native_reduction();
        harness h(argv, argc == 5);
        for (unsigned op = 0; op < 22; ++op) {
            for (unsigned flags = 0; flags < 8; ++flags)
                for (uint32_t address : {0x200u, 0xffffu, 0xffffffu})
                    h.short_ff(op, address, 0xac | (flags & 3) | ((flags & 4) << 2));
            for (unsigned phase=0; phase<128; ++phase)
                h.short_ff(op, 0x200, 0xbd, true, phase);
        }
        for (unsigned op = 31; op < 256; ++op) h.short_ff(op, 0x200, 0xbd);
        auto check_accel = [&](unsigned op, uint32_t a, uint32_t b, uint32_t c,
                                uint32_t address=0x200, bool audio=false, unsigned phase=0) {
            float x=value(a), y=value(b), z=value(c), result=0;
            int q=0;
            switch(op) {
            case 0x17: result=float(std::sqrt(double(x))); break;
            case 0x18: result=float(std::trunc(double(x))); break;
            case 0x19: result=float(std::floor(double(x))); break;
            case 0x1a: result=float(std::ceil(double(x))); break;
            case 0x1b: result=float(std::round(double(x))); break;
            case 0x1c: result=float(std::fmod(double(x),double(y))); break;
            case 0x1d: result=avm_native_rempio2(x,&q); break;
            case 0x1e: result=avm_native_fma(x,y,z); break;
            }
            h.accelerator(op,a,b,c,bits(result),q,address,audio,phase);
        };
        std::vector<uint32_t> edge={0,0x80000000u,1,0x80000001u,0x7fffff,0x800000,
            0x3effffff,0x3f000000,0x3f000001,0x3f490fda,0x3f490fdb,
            0x3f800000,0x3fc00000,0x40200000,0x40c80000,0x4affffff,0x4b000000,
            0x7f7fffff,0x7f800000,0xff800000,0x7fc12345,0xff812345};
        for(unsigned e=0;e<256;++e) for(uint32_t m: {0u,1u,0x3fffffu,0x400000u,0x7fffffu})
            for(unsigned sign=0;sign<2;++sign) edge.push_back((e<<23)|m|(sign<<31));
        for(unsigned op=0x17;op<=0x1e;++op) {
            for(auto a:edge) check_accel(op,a,0x40000000,0xbf800000);
            for(auto a:edge) if(op==0x1c || op==0x1e)
                check_accel(op,0x3f800001,a,0xbf800000);
            for(uint32_t address: {0xffffu,0xffffffu})
                check_accel(op,0x40c80000,0x40000000,0xbf800000,address);
            for(unsigned phase=0;phase<128;++phase)
                check_accel(op,0x40c80000,0x40000000,0xbf800000,0x200,true,phase);
        }
        for(unsigned n=0;n<=82;++n) for(double offset: {0.0,0.5}) {
            uint32_t center=bits(float((n+offset)*1.57079632679489661923));
            for(int delta=-2;delta<=2;++delta) for(unsigned sign=0;sign<2;++sign)
                if(center>2) check_accel(0x1d,(center+delta)|(sign<<31),0x12345678,0xbf800000);
        }
        for(uint32_t u: {0x42ffffffu,0x43000000u,0x43000001u})
            for(unsigned sign=0;sign<2;++sign) check_accel(0x1d,u|(sign<<31),0x12345678,0xbf800000);
        for(unsigned signs=0;signs<8;++signs)
            check_accel(0x1e,(signs&1)<<31,((signs>>1)&1)<<31,((signs>>2)&1)<<31);
        for(auto v: {std::array<uint32_t,3>{0,0x7f800000,0x3f800000},
                      {0x7f800000,0,0x3f800000},
                      {0x7f800000,0x40000000,0xff800000},
                      {0x7f7fffff,0x40000000,0xff7fffff},
                      {0x00800000,0x33800000,1},
                      {1,0x3f000000,1}, {0x3f800001,0x50400000,0xbf800000}})
            check_accel(0x1e,v[0],v[1],v[2]);
        uint32_t math_state=0x4653464d;
        for(unsigned i=0;i<10000;++i) {
            uint32_t a=random(math_state),b=random(math_state),c=random(math_state);
            for(unsigned op=0x17;op<=0x1e;++op) check_accel(op,a,b,c);
        }
        // A single final rounding retains this residual, whereas FMUL+FADD loses it.
        h.accelerator(0x1e,0x3f800001,0x40400000,0xc0400000,0x34c00000);
        // Deliberate avr-libc precision limit: exact fused result is -2^-46.
        h.accelerator(0x1e,0x3f800001,0x3f7ffffe,0xbf800000,0xafff0000);
        h.run(value(0xbe59ccc4), {value(0x3e59060f),value(0x3d871723),value(0xbf05e4d2),value(0x3c6e2ebd),value(0x3e867041),value(0x3d4ddec6)});
        for (unsigned n : {1u,2u,3u,5u,9u,13u,255u}) {
            std::vector<float> c(n, 0.25f);
            h.run(0.5f, c);
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
        h.run(0.5f, {1.0f, 2.0f}, 0xfffffc, 0xbd, true, 12, true);
        h.run(0.5f, {});
        h.reject_old_image();
        h.verify_sign_timing();
        {
            // Negative control: bypass the shared two-cycle tail jump. The
            // unchanged image's FABS q2 then reads at cycle 15, which must be
            // rejected by the timing observer even if a stale byte looks valid.
            harness early(argv, argc == 5);
            unsigned address = early.symbols.at("ff_table") + 10 * 4 + 2;
            int displacement = int(early.sym("cluster_tail_18")) - int(address / 2) - 1;
            require(displacement >= -2048 && displacement <= 2047, "timing negative control RJMP range");
            unsigned instruction = 0xc000 | (unsigned(displacement) & 0xfff);
            early.cpu().prog[address] = uint8_t(instruction);
            early.cpu().prog[address + 1] = uint8_t(instruction >> 8);
            early.cpu().decode();
            bool rejected = false;
            try { early.short_ff(10, 0x200, 0xbd); }
            catch (const std::runtime_error& e) {
                rejected = std::string(e.what()) == "early FF sign SPI read";
            }
            require(rejected && early.early_sign_in == 15,
                    "FF timing observer did not reject the cycle-15 SPI read");
        }
        for(unsigned i=0;i<8;++i)
            std::cout << "FF " << std::hex << i+0x17 << std::dec << " observed cycles "
                      << h.accelerator_min[i] << ".." << h.accelerator_max[i] << '\n';
        std::cout << h.cases << " FF/FPOLY cases passed; " << h.interrupted << " audio interrupts; SPI continuation, flags, registers and PC carries verified\n";
        return 0;
    } catch (const std::exception& e) { std::cerr << e.what() << '\n'; return 1; }
}
