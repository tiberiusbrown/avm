#include <absim.hpp>
#include <absim_regs.hpp>

#include <array>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <string>

namespace {
void require(bool condition, char const* message)
{
    if(!condition)
        throw std::runtime_error(message);
}

uint32_t symbol(char const* listing, std::string const& name)
{
    std::ifstream input(listing);
    require(bool(input), "cannot read interpreter listing");
    for(std::string line; std::getline(input, line);) {
        if(line.size() > name.size() &&
           line.compare(line.size() - name.size(), name.size(), name) == 0 &&
           line[line.size() - name.size() - 1] == ' ') {
            std::istringstream fields(line);
            uint32_t address;
            if(fields >> std::hex >> address)
                return address / 2;
        }
    }
    throw std::runtime_error("missing interpreter symbol: " + name);
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

bool boundary(absim::atmega32u4_t const& cpu, uint32_t table)
{
    return cpu.pc >= table && cpu.pc < table + 1024 &&
           (cpu.pc - table) % 4 == 0;
}

void tick(absim::arduboy_t& emulator)
{
    emulator.cycle();
    emulator.core_state.cpu.update_all();
    require(!emulator.core_state.cpu.should_autobreak(), "native emulator fault");
}

void run_case(absim::arduboy_t& emulator, uint32_t table,
              uint32_t trap, unsigned opcode, uint16_t sp, unsigned flags)
{
    auto& cpu = emulator.core_state.cpu;

    std::array<uint16_t, 8> registers;
    for(unsigned i = 0; i < 8; ++i) {
        registers[i] = uint16_t(0x1234 + i * 0x1123);
        write_word(cpu, 8 + i * 2, registers[i]);
    }
    write_word(cpu, 28, sp);
    // C/Z/S occupy native SREG bits 0/1/4 in GPIOR0. Seed the other bits too
    // so even an unintended whole-register flags commit is detected.
    uint8_t const vm_flags = uint8_t(0xac | (flags & 3) | ((flags & 4) << 2));
    cpu.data[absim::reg::addr::GPIOR0] = vm_flags;
    bool const push = opcode < 0xb8;
    bool const overflow = push && sp < 0x0902;
    unsigned const reg = opcode & 7;
    uint16_t const value = push ? registers[reg] : 0x5aa5;
    uint16_t const result_sp = uint16_t(sp + (push ? -2 : 2));
    if(!push)
        write_word(cpu, sp, value);
    else {
        cpu.data[result_sp] = 0xcc;
        cpu.data[result_sp + 1] = 0xcc;
    }
    uint32_t const pc = guest_pc(cpu);
    uint64_t const begin = cpu.cycle_count;
    do {
        tick(emulator);
    } while(cpu.pc != trap && !boundary(cpu, table) && cpu.cycle_count < begin + 100);

    require(word(cpu, 28) == result_sp, "incorrect post-operation VM SP");
    require(cpu.data[absim::reg::addr::GPIOR0] == vm_flags, "VM flags changed");
    if(push) {
        require(word(cpu, result_sp) == value, "incorrect little-endian post-write value");
        for(unsigned i = 0; i < 8; ++i)
            require(word(cpu, 8 + i * 2) == registers[i], "PUSH changed a guest register");
    } else
        require(word(cpu, 8 + reg * 2) == value, "incorrect POP value");

    if(overflow) {
        require(cpu.pc == trap, "overflow did not enter the dedicated fatal trap");
        require(guest_pc(cpu) == pc, "overflow dispatched the next guest instruction");
        uint16_t const native_sp = word(cpu, absim::reg::addr::SPL);
        for(unsigned i = 0; i < 64; ++i) {
            tick(emulator);
            require(cpu.pc == trap, "fatal trap resumed execution");
            require(guest_pc(cpu) == pc, "fatal trap advanced the guest PC");
            require(word(cpu, 28) == result_sp, "fatal trap used the guest stack");
            require(word(cpu, absim::reg::addr::SPL) == native_sp, "fatal trap used the native stack");
        }
    } else {
        require(boundary(cpu, table), "valid operation did not continue");
        require(guest_pc(cpu) == pc + 1, "incorrect following guest PC");
        require(cpu.cycle_count - begin == (push ? 19 : 18), "incorrect PUSH/POP cadence");
        uint16_t const sentinel = word(cpu, 22);
        do {
            tick(emulator);
        } while(!boundary(cpu, table) && cpu.cycle_count < begin + 100);
        require(boundary(cpu, table) && word(cpu, 8) == sentinel,
                "following guest instruction did not execute");
    }
}
}

int main(int argc, char** argv)
{
    try {
        require(argc == 4, "usage: avm_push16_tests interp.hex interp.lst push16.bin");
        uint32_t const table = symbol(argv[2], "primary_table");
        uint32_t const trap = symbol(argv[2], "stack_overflow_func");
        auto emulator = std::make_unique<absim::arduboy_t>();
        emulator->reset();
        load(*emulator, argv[1], "interpreter.hex");
        load(*emulator, argv[3], "fxdata.bin");
        auto& cpu = emulator->core_state.cpu;
        cpu.no_merged = true;
        cpu.autobreaks.reset();
        unsigned cases = 0;
        for(unsigned opcode = 0xb0; opcode <= 0xbf; ++opcode) {
            for(unsigned i = 0; cpu.pc != table + opcode * 4 && i < 20000000; ++i)
                tick(*emulator);
            require(cpu.pc == table + opcode * 4, "test primary slot was not reached");
            // Save the real instruction boundary, including the active SPI
            // transfer, so cases are independent without repeating startup.
            absim::arduboy_t::tt_state_t state;
            emulator->save_state_to_vector(state);
            require(!state.state.empty(), "could not save instruction boundary");
            auto run = [&](uint16_t sp, unsigned flags) {
                emulator->load_state_from_vector(state);
                run_case(*emulator, table, trap, opcode, sp, flags);
                ++cases;
            };
            for(unsigned flags = 0; flags < 8; ++flags) {
                run(0x09f0, flags);
            }
            if(opcode < 0xb8) {
                for(uint16_t sp : {0x0902, 0x0901, 0x0900}) {
                    run(sp, 7);
                }
            }
            emulator->load_state_from_vector(state);
            tick(*emulator);
        }
        std::cout << "Passed " << cases << " PUSH16/POP16 cases; all B0-B7 pushes = 19 cycles, "
                     "all B8-BF pops = 18 cycles; C/Z/S preserved; post-write boundary/trap verified.\n";
        return 0;
    } catch(std::exception const& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
