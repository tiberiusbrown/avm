#include <absim.hpp>
#include <absim_regs.hpp>

#include <algorithm>
#include <array>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <iterator>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace {
void require(bool condition, char const* message)
{
    if(!condition)
        throw std::runtime_error(message);
}

uint32_t symbol(char const* listing, std::string const& name, bool native)
{
    std::ifstream input(listing);
    require(bool(input), "cannot read symbol listing");
    for(std::string line; std::getline(input, line);) {
        if((line.size() > name.size() &&
            line.compare(line.size() - name.size(), name.size(), name) == 0 &&
            line[line.size() - name.size() - 1] == ' ') ||
           line.find("<" + name + ">:") != std::string::npos) {
            std::istringstream fields(line);
            uint32_t address;
            if(fields >> std::hex >> address)
                return native ? address / 2 : address;
        }
    }
    throw std::runtime_error("missing symbol: " + name);
}

void load(absim::arduboy_t& emulator, char const* path, char const* name)
{
    std::ifstream input(path, std::ios::binary);
    require(bool(input), "cannot load test input");
    auto error = emulator.load_file(name, input);
    if(!error.empty())
        throw std::runtime_error(error);
}

uint16_t word(absim::atmega32u4_t const& cpu, unsigned address)
{
    return uint16_t(cpu.data[address]) | uint16_t(cpu.data[address + 1]) << 8;
}

void write_word(absim::atmega32u4_t& cpu, unsigned address, uint16_t value)
{
    cpu.data[address] = uint8_t(value);
    cpu.data[address + 1] = uint8_t(value >> 8);
}

uint32_t guest_pc(absim::atmega32u4_t const& cpu)
{
    return uint32_t(word(cpu, 4)) | uint32_t(cpu.data[6]) << 16;
}

void write_pc(absim::atmega32u4_t& cpu, uint32_t value)
{
    write_word(cpu, 4, uint16_t(value));
    cpu.data[6] = uint8_t(value >> 16);
}

struct harness_t {
    std::unique_ptr<absim::arduboy_t> emulator = std::make_unique<absim::arduboy_t>();
    uint32_t table, trap, seek;
    bool checked;
    unsigned cases = 0;

    harness_t(char** args, bool checked_mode) : checked(checked_mode)
    {
        table = symbol(args[2], "primary_table", true);
        trap = symbol(args[2], "stack_overflow_func", true);
        seek = symbol(args[2], "seek_and_dispatch_func", true);
        emulator->reset();
        load(*emulator, args[1], "interpreter.hex");
        load(*emulator, args[3], "fxdata.bin");
        cpu().no_merged = true;
        cpu().autobreaks.reset();
    }
    absim::atmega32u4_t& cpu() { return emulator->core_state.cpu; }
    bool boundary()
    {
        auto pc = cpu().pc;
        return pc >= table && pc < table + 1024 && (pc - table) % 4 == 0;
    }
    void tick()
    {
        emulator->cycle();
        cpu().update_all();
        require(!cpu().should_autobreak(), "native emulator fault");
    }
    absim::arduboy_t::tt_state_t at(uint32_t pc)
    {
        for(unsigned i = 0; (!boundary() || guest_pc(cpu()) != pc) && i < 20000000; ++i)
            tick();
        require(boundary() && guest_pc(cpu()) == pc, "test site was not reached");
        absim::arduboy_t::tt_state_t state;
        emulator->save_state_to_vector(state);
        require(!state.state.empty(), "could not save instruction boundary");
        return state;
    }
    void seed(uint16_t sp, unsigned flags)
    {
        for(unsigned i = 0; i < 8; ++i)
            write_word(cpu(), 8 + i * 2, uint16_t(0x1234 + i * 0x1123));
        write_word(cpu(), 28, sp);
        // C/Z/S live in bits 0/1/4; seed other GPIOR0 bits as well.
        cpu().data[absim::reg::addr::GPIOR0] = uint8_t(0xac | (flags & 3) | ((flags & 4) << 2));
    }
    std::array<uint16_t, 8> registers()
    {
        std::array<uint16_t, 8> values;
        for(unsigned i = 0; i < 8; ++i)
            values[i] = word(cpu(), 8 + i * 2);
        return values;
    }
    std::vector<uint8_t> memory()
    {
        return {cpu().data.begin() + 0x100, cpu().data.begin() + 0xa00};
    }
    uint64_t instruction()
    {
        uint64_t start = cpu().cycle_count;
        do { tick(); }
        while(cpu().pc != trap && !boundary() && cpu().cycle_count < start + 1000);
        require(cpu().pc == trap || boundary(), "instruction did not finish or trap");
        return cpu().cycle_count - start;
    }
    void fatal()
    {
        require(cpu().pc == trap, "did not reach the shared fatal stack trap");
        auto pc = guest_pc(cpu());
        auto sp = word(cpu(), 28);
        auto regs = registers();
        auto ram = memory();
        auto native_sp = word(cpu(), absim::reg::addr::SPL);
        auto flags = cpu().data[absim::reg::addr::GPIOR0];
        for(unsigned i = 0; i < 64; ++i) {
            tick();
            require(cpu().pc == trap && guest_pc(cpu()) == pc, "fatal trap resumed guest execution");
        }
        require(word(cpu(), 28) == sp && registers() == regs && memory() == ram,
                "fatal trap changed guest state");
        require(word(cpu(), absim::reg::addr::SPL) == native_sp, "fatal trap used the native stack");
        require(cpu().data[absim::reg::addr::GPIOR0] == flags, "fatal trap changed VM flags");
    }
    template<class F> void test(absim::arduboy_t::tt_state_t const& state,
                                std::string const& label, F run)
    {
        emulator->load_state_from_vector(state);
        try { run(); }
        catch(std::exception const& error) { throw std::runtime_error(label + ": " + error.what()); }
        ++cases;
    }
    void resume(absim::arduboy_t::tt_state_t const& state)
    {
        emulator->load_state_from_vector(state);
        tick();
    }
};

void assignment_or_adjustment(harness_t& h, uint32_t pc, uint16_t sp,
                              uint16_t value, int reg, unsigned flags)
{
    h.seed(sp, flags);
    if(reg >= 0)
        write_word(h.cpu(), 8 + unsigned(reg) * 2, value);
    auto regs = h.registers();
    auto ram = h.memory();
    auto vm_flags = h.cpu().data[absim::reg::addr::GPIOR0];
    auto cycles = h.instruction();
    require(word(h.cpu(), 28) == value, "incorrect resulting SP");
    require(h.registers() == regs, "source/guest registers changed");
    require(h.memory() == ram, "stack assignment/adjustment accessed guest memory");
    require(h.cpu().data[absim::reg::addr::GPIOR0] == vm_flags, "VM flags changed");
    if(h.checked && (value < 0x0900 || value > 0x0a00))
        h.fatal();
    else {
        require(h.boundary() && guest_pc(h.cpu()) == pc + 2, "next instruction was not reached");
        require(cycles == (reg >= 0 ? (h.checked ? 40 : 37) : 35), "incorrect SETSP/ADJSP timing");
        h.instruction();
        require(word(h.cpu(), 8) == regs[7], "following guest instruction did not execute");
    }
}

struct call_t { char const* name; char const* target; unsigned bytes, opcode, before, after; };
constexpr call_t calls[] = {
    {"call8_site", "call8_target", 2, 0xd5, 128, 127},
    {"call16_site", "call16_target", 3, 0xe1, 135, 136},
    {"callf_site", "callf_target", 4, 0xe3, 150, 150},
    {"callp_site_0", "callp_target", 1, 0xe8, 117, 119},
    {"callp_site_1", "callp_target", 1, 0xe9, 117, 119},
    {"callp_site_2", "callp_target", 1, 0xea, 117, 119},
    {"callp_site_3", "callp_target", 1, 0xeb, 117, 119},
};

void call(harness_t& h, call_t const& form, uint32_t pc, uint32_t target,
          uint16_t sp, unsigned flags, bool carry_probe, uint32_t expected_target)
{
    h.seed(sp, flags);
    if(form.opcode >= 0xe8) {
        unsigned base = 8 + (form.opcode - 0xe8) * 4;
        write_word(h.cpu(), base, uint16_t(target));
        write_word(h.cpu(), base + 2, uint16_t(0xbe00 | (target >> 16)));
    }
    auto regs = h.registers();
    auto vm_flags = h.cpu().data[absim::reg::addr::GPIOR0];
    uint32_t next = (pc + form.bytes) & 0xffffff;
    uint16_t result_sp = uint16_t(sp - 3);
    std::fill(h.cpu().data.begin() + result_sp - 1, h.cpu().data.begin() + sp + 1, 0xcc);
    write_pc(h.cpu(), pc);
    uint64_t cycles;
    if(carry_probe) {
        auto start = h.cpu().cycle_count;
        do { h.tick(); }
        while(h.cpu().pc != h.seek && h.cpu().pc != h.trap && h.cpu().cycle_count < start + 1000);
        require(h.cpu().pc == h.seek, "carry probe did not reach seek continuation");
        cycles = h.cpu().cycle_count - start;
        require(guest_pc(h.cpu()) == expected_target, "24-bit call target arithmetic changed");
    } else
        cycles = h.instruction();
    require(word(h.cpu(), 28) == result_sp, "call did not push exactly three bytes");
    require(h.cpu().data[result_sp] == uint8_t(next) &&
            h.cpu().data[result_sp + 1] == uint8_t(next >> 8) &&
            h.cpu().data[result_sp + 2] == uint8_t(next >> 16), "incorrect return-PC byte order/carry");
    require(h.cpu().data[result_sp - 1] == 0xcc && h.cpu().data[sp] == 0xcc,
            "call wrote outside its three-byte return record");
    require(h.registers() == regs, "callee/next instruction executed before validation");
    require(h.cpu().data[absim::reg::addr::GPIOR0] == vm_flags, "call changed VM flags");
    if(carry_probe)
        return; // Test arithmetic before seeking an injected logical PC's target.
    if(h.checked && result_sp < 0x0900) {
        h.fatal();
        return;
    }
    require(h.boundary() && guest_pc(h.cpu()) == target, "callee was not reached");
    require(cycles == (h.checked ? form.after : form.before), "incorrect CALL timing");
    h.instruction();
    require(word(h.cpu(), 20) == regs[7], "callee marker did not execute");
    require(h.instruction() == 110, "RET timing changed");
    require(guest_pc(h.cpu()) == next && word(h.cpu(), 28) == sp, "RET did not return to nextPC");
    require(h.cpu().data[absim::reg::addr::GPIOR0] == vm_flags, "callee/RET changed VM flags");
    h.instruction();
    require(word(h.cpu(), 8) == regs[7], "return-site marker did not execute");
}
}

int main(int argc, char** argv)
{
    try {
        require(argc == 5 || (argc == 6 && std::string(argv[5]) == "--baseline"),
                "usage: avm_stack_bounds_tests interp.hex interp.lst fixture.bin fixture.asm [--baseline]");
        harness_t h(argv, argc == 5);
        std::ifstream input(argv[3], std::ios::binary);
        std::vector<uint8_t> image{std::istreambuf_iterator<char>(input), {}};
        for(auto const& form : calls) {
            auto pc = symbol(argv[4], form.name, false);
            auto target = symbol(argv[4], form.target, false);
            auto state = h.at(pc);
            for(unsigned flags = 0; flags < 8; ++flags)
                for(uint16_t sp : {0x09f0, 0x0903, 0x0902, 0x0901, 0x0900})
                    h.test(state, form.name, [&] { call(h, form, pc, target, sp, flags, false, target); });
            // Inject VM_PC at a real call boundary to test carry arithmetic
            // without allocating a 16-MiB image. Stop before seeking: ordinary
            // cases above independently verify the callee and actual RET.
            for(uint32_t boundary : {0x100u, 0x10000u, 0x1000000u}) {
                uint32_t injected = boundary - form.bytes;
                uint32_t expected = target;
                uint32_t next = boundary & 0xffffff;
                if(form.opcode == 0xd5)
                    expected = (next + int8_t(image.at(pc + 1))) & 0xffffff;
                else if(form.opcode == 0xe1)
                    expected = (next + int16_t(uint16_t(image.at(pc + 1)) |
                                               uint16_t(image.at(pc + 2)) << 8)) & 0xffffff;
                h.test(state, std::string(form.name) + " carry", [&] {
                    call(h, form, injected, target, 0x09f0, 7, true, expected);
                });
            }
            h.resume(state);
        }
        struct adjust_t { char const* name; int delta; std::vector<uint16_t> initial; };
        for(auto const& form : std::vector<adjust_t>{
                {"neg128", -128, {0x0980, 0x097f}}, {"neg16", -16, {0x0910, 0x090f}},
                {"neg1", -1, {0x0901, 0x0900}}, {"zero", 0, {0x0900, 0x0a00}},
                {"pos1", 1, {0x09ff, 0x0a00}}, {"pos16", 16, {0x0990, 0x09f0, 0x09f1}},
                {"pos127", 127, {0x0981, 0x0982, 0x0a00}}}) {
            auto pc = symbol(argv[4], std::string("adjsp_site_") + form.name, false);
            auto state = h.at(pc);
            for(unsigned flags = 0; flags < 8; ++flags)
                for(auto sp : form.initial)
                    h.test(state, form.name, [&] {
                        assignment_or_adjustment(h, pc, sp, uint16_t(sp + form.delta), -1, flags);
                    });
            h.resume(state);
        }
        for(unsigned reg = 0; reg < 8; ++reg) {
            auto pc = symbol(argv[4], "setsp_site_" + std::to_string(reg), false);
            auto state = h.at(pc);
            for(unsigned flags = 0; flags < 8; ++flags)
                for(uint16_t value : {0x0900, 0x0901, 0x0980, 0x09ff, 0x0a00,
                                      0x0000, 0x08ff, 0x0800, 0x0a01, 0x0aff, 0xffff})
                    h.test(state, "SETSP r" + std::to_string(reg), [&] {
                        assignment_or_adjustment(h, pc, 0x09f0, value, int(reg), flags);
                    });
            h.resume(state);
        }
        std::cout << "Passed " << h.cases << (h.checked ? " checked" : " baseline")
                  << " stack-bound cases: all calls/RET/carries, signed ADJSP, SETSP r0-r7, C/Z/S, memory and fatal paths.\n"
                  << "Measured ADJSP=35, CALL8=" << (h.checked ? 127 : 128)
                  << ", CALL16=" << (h.checked ? 136 : 135)
                  << ", CALLF=150, all CALLP=" << (h.checked ? 119 : 117)
                  << ", all SETSP=" << (h.checked ? 40 : 37) << ", RET=110 cycles.\n";
        return 0;
    } catch(std::exception const& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
