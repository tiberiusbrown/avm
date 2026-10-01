#include <absim.hpp>
#include <absim_regs.hpp>

#include <array>
#include <cstdint>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <memory>
#include <regex>
#include <stdexcept>
#include <string>

namespace {
namespace fs = std::filesystem;

std::string read_text(fs::path const& path)
{
    std::ifstream in(path);
    if(!in)
        throw std::runtime_error("cannot open " + path.string());
    return std::string(std::istreambuf_iterator<char>(in), {});
}

uint32_t metadata_number(std::string const& json, char const* name)
{
    std::smatch match;
    if(!std::regex_search(json, match,
          std::regex(std::string("\"") + name + "\"\\s*:\\s*([0-9]+)")))
        throw std::runtime_error(std::string("boundary metadata lacks ") + name);
    return static_cast<uint32_t>(std::stoul(match[1]));
}

uint32_t elf_entry(fs::path const& path)
{
    std::ifstream in(path, std::ios::binary);
    std::array<uint8_t, 52> header{};
    if(!in.read(reinterpret_cast<char*>(header.data()), header.size()) ||
       header[0] != 0x7f || header[1] != 'E' || header[2] != 'L' ||
       header[3] != 'F' || header[4] != 1 || header[5] != 1 ||
       header[18] != 0x56 || header[19] != 0x41 || header[36] != 1)
        throw std::runtime_error("expected an AVM ABI-v1 ELF32LE executable");
    return uint32_t(header[24]) | uint32_t(header[25]) << 8 |
           uint32_t(header[26]) << 16 | uint32_t(header[27]) << 24;
}

void load(absim::arduboy_t& emulator, fs::path const& path,
          char const* synthetic_name)
{
    std::ifstream in(path, std::ios::binary);
    if(!in)
        throw std::runtime_error("cannot open " + path.string());
    std::string error = emulator.load_file(synthetic_name, in);
    if(!error.empty())
        throw std::runtime_error(path.string() + ": " + error);
}

uint32_t guest_pc(absim::atmega32u4_t const& cpu)
{
    uint32_t next = uint32_t(cpu.data[4]) | uint32_t(cpu.data[5]) << 8 |
                    uint32_t(cpu.data[6]) << 16;
    return next;
}
}

int main(int argc, char** argv)
{
    try {
        if(argc != 5)
            throw std::runtime_error(
                "usage: avm_boundary_probe interp.hex boundary.json image.bin image.elf");
        std::string metadata = read_text(argv[2]);
        if(metadata_number(metadata, "schema") != 1 ||
           metadata_number(metadata, "primary_slot_words") != 4 ||
           metadata_number(metadata, "primary_slot_count") != 256)
            throw std::runtime_error("unsupported interpreter boundary metadata");
        uint32_t const table = metadata_number(metadata, "primary_table_avr_word");
        uint32_t const entry = elf_entry(argv[4]);

        auto emulator = std::make_unique<absim::arduboy_t>();
        emulator->reset();
        load(*emulator, argv[1], "interpreter.hex");
        load(*emulator, argv[3], "fxdata.bin");
        auto& cpu = emulator->core_state.cpu;
        cpu.no_merged = true;
        cpu.autobreaks.reset();
        bool saw_entry = false;
        uint32_t observations = 0;
        uint16_t last_native = UINT16_MAX;
        for(uint64_t advances = 0; advances < 20000000 && observations < 64;
            ++advances) {
            uint32_t native = cpu.pc;
            if(native >= table && native < table + 256u * 4u &&
               (native - table) % 4u == 0 && native != last_native) {
                uint32_t pc = guest_pc(cpu);
                if(!saw_entry && pc == entry)
                    saw_entry = true;
                if(saw_entry) {
                    std::cout << std::hex << std::setfill('0')
                          << std::setw(6) << pc << ' ' << std::dec
                          << cpu.cycle_count << ' ';
                    for(unsigned reg = 0; reg < 8; ++reg) {
                        uint32_t r = uint32_t(cpu.data[8 + reg * 2]) |
                                 uint32_t(cpu.data[9 + reg * 2]) << 8;
                        std::cout << std::hex << std::setw(4) << r
                              << (reg == 7 ? ' ' : ',');
                    }
                    uint32_t sp = uint32_t(cpu.data[28]) |
                              uint32_t(cpu.data[29]) << 8;
                    std::cout << std::hex << std::setw(4) << sp << ' '
                          << std::setw(2) << unsigned(cpu.data[absim::reg::addr::GPIOR0])
                          << '\n';
                    ++observations;
                }
            }
            last_native = static_cast<uint16_t>(native);
            emulator->cycle();
            cpu.update_all();
            if(cpu.autobreaks.test(absim::AB_UNKNOWN_INSTR) ||
               cpu.autobreaks.test(absim::AB_OOB_PC))
                throw std::runtime_error("interpreter fault before probe completed");
        }
        if(!saw_entry || observations < 64)
            throw std::runtime_error("not enough AVM boundaries were observed");
        return 0;
    } catch(std::exception const& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
