// Host-side stack probe for AVM guest images. It steps the Ardens interpreter
// one cycle at a time and samples the guest state at every AVM dispatch
// boundary, so each sample is the state after one complete guest instruction.
// The probe never writes guest memory or registers, so guest code and guest
// stack usage are unchanged.
//
// The report gives the initial and lowest guest SP, the guest PC that was
// executing at the lowest SP, and the peak usage. Snapshots record the guest
// state when a named ELF symbol is reached, which is how the exception tests
// read the landing-pad SP and the throw-site return record.

#include <absim.hpp>
#include <absim_regs.hpp>

#include <algorithm>
#include <array>
#include <cstdint>
#include <cstdlib>
#include <deque>
#include <filesystem>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <memory>
#include <optional>
#include <regex>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace {

namespace fs = std::filesystem;

// The guest stack is StackLimit (256) bytes below StackTop, as defined in
// llvm/BinaryFormat/AVM.h. The checked interpreter traps on any SP outside this
// window, and the bytes below it are static RAM.
constexpr uint32_t kStackTop = 0xa00;
constexpr uint32_t kStackLimit = kStackTop - 256;

struct symbol_t {
    std::string name;
    uint32_t address;
    uint32_t size;
};

struct options_t {
    fs::path interpreter;
    fs::path boundary;
    fs::path image;
    fs::path elf;
    uint64_t cycle_limit = 400000000ull;
    std::vector<std::string> snapshots;
    std::string stop_at;
    std::string measure_from;
    unsigned trace_tail = 0;
    // Bytes of guest RAM to print at the address in r4 for each snapshot. The
    // exception runtime passes the header in r4, so this reads the captured fields.
    unsigned snapshot_bytes = 0;
    // Bytes of guest RAM to print at the address that a thrown pointer holds, for each snapshot.
    // The header's object follows the 55-byte exception header, so the probe reads the pointer
    // value there, and prints this many bytes at it. A pointer value of zero prints no bytes.
    unsigned target_bytes = 0;
};

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

uint32_t le(std::vector<uint8_t> const& bytes, size_t offset, size_t width)
{
    if(offset + width > bytes.size())
        throw std::runtime_error("truncated ELF file");
    uint32_t value = 0;
    for(size_t i = 0; i < width; ++i)
        value |= uint32_t(bytes[offset + i]) << (8 * i);
    return value;
}

// Reads the function and object symbols of an AVM ELF32 executable.
std::vector<symbol_t> read_symbols(fs::path const& path, uint32_t& entry)
{
    std::ifstream in(path, std::ios::binary);
    if(!in)
        throw std::runtime_error("cannot open " + path.string());
    std::vector<uint8_t> file((std::istreambuf_iterator<char>(in)), {});
    if(file.size() < 52 || file[0] != 0x7f || file[1] != 'E' || file[2] != 'L' ||
       file[3] != 'F' || file[4] != 1 || file[5] != 1)
        throw std::runtime_error("expected an ELF32LE file: " + path.string());
    entry = le(file, 24, 4);
    uint32_t const shoff = le(file, 32, 4);
    uint32_t const shentsize = le(file, 46, 2);
    uint32_t const shnum = le(file, 48, 2);

    std::vector<symbol_t> symbols;
    for(uint32_t i = 0; i < shnum; ++i) {
        size_t const sh = shoff + size_t(i) * shentsize;
        if(le(file, sh + 4, 4) != 2) // SHT_SYMTAB
            continue;
        size_t const sym_offset = le(file, sh + 16, 4);
        size_t const sym_size = le(file, sh + 20, 4);
        uint32_t const link = le(file, sh + 24, 4);
        size_t const str_sh = shoff + size_t(link) * shentsize;
        size_t const str_offset = le(file, str_sh + 16, 4);
        for(size_t s = sym_offset; s + 16 <= sym_offset + sym_size; s += 16) {
            uint8_t const type = file.at(s + 12) & 0xf;
            if(type != 1 && type != 2) // STT_OBJECT or STT_FUNC
                continue;
            size_t const name = str_offset + le(file, s, 4);
            std::string text(reinterpret_cast<char const*>(file.data() + name));
            symbols.push_back({text, le(file, s + 4, 4), le(file, s + 8, 4)});
        }
    }
    return symbols;
}

std::optional<symbol_t const*> find_symbol(std::vector<symbol_t> const& symbols,
                                           std::string const& name)
{
    for(auto const& sym : symbols)
        if(sym.name == name)
            return &sym;
    return std::nullopt;
}

// The function covering pc, or the nearest symbol below it.
std::string describe(std::vector<symbol_t> const& symbols, uint32_t pc)
{
    symbol_t const* best = nullptr;
    for(auto const& sym : symbols) {
        if(sym.address > pc)
            continue;
        if(sym.size != 0 && pc >= sym.address + sym.size)
            continue;
        if(!best || sym.address > best->address)
            best = &sym;
    }
    std::ostringstream text;
    if(!best)
        return "?";
    text << best->name << "+0x" << std::hex << (pc - best->address);
    return text.str();
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
    return uint32_t(cpu.data[4]) | uint32_t(cpu.data[5]) << 8 |
           uint32_t(cpu.data[6]) << 16;
}

uint16_t guest_word(absim::atmega32u4_t const& cpu, unsigned address)
{
    return uint16_t(cpu.data[address]) | uint16_t(cpu.data[address + 1]) << 8;
}

uint32_t guest_sp(absim::atmega32u4_t const& cpu)
{
    return guest_word(cpu, 28);
}

uint16_t guest_register(absim::atmega32u4_t const& cpu, unsigned r)
{
    return guest_word(cpu, 8 + r * 2);
}

struct sample_t {
    uint32_t pc;
    uint32_t sp;
    uint64_t cycle;
    std::array<uint16_t, 8> regs;
};

struct stats_t {
    uint64_t samples = 0;
    uint32_t initial_sp = 0;
    uint32_t min_sp = UINT32_MAX;
    uint32_t min_sp_pc = 0;
    uint32_t max_sp = 0;
    uint32_t prev_sp = 0;
    bool range_violation = false;
    uint32_t violation_pc = 0;
    uint32_t violation_sp = 0;
    bool wrap_suspect = false;
};

int run(options_t const& options)
{
    std::string const metadata = read_text(options.boundary);
    if(metadata_number(metadata, "schema") != 1 ||
       metadata_number(metadata, "primary_slot_words") != 4 ||
       metadata_number(metadata, "primary_slot_count") != 256)
        throw std::runtime_error("unsupported interpreter boundary metadata");
    uint32_t const table = metadata_number(metadata, "primary_table_avr_word");

    uint32_t entry = 0;
    std::vector<symbol_t> symbols = read_symbols(options.elf, entry);

    // Resolve snapshot symbols now, so a misspelled name fails before running.
    // A snapshot names a symbol, or a 0x-prefixed program address for labels
    // that are not in the symbol table.
    std::vector<std::pair<std::string, uint32_t>> snapshot_points;
    for(auto const& name : options.snapshots) {
        if(name.rfind("0x", 0) == 0) {
            snapshot_points.emplace_back(name, uint32_t(std::stoul(name, nullptr, 16)));
            continue;
        }
        auto found = find_symbol(symbols, name);
        if(!found)
            throw std::runtime_error("snapshot symbol not found: " + name);
        snapshot_points.emplace_back(name, (*found)->address);
    }

    auto emulator = std::make_unique<absim::arduboy_t>();
    emulator->reset();
    load(*emulator, options.interpreter, "interpreter.hex");
    load(*emulator, options.image, "fxdata.bin");
    auto& cpu = emulator->core_state.cpu;
    cpu.no_merged = true;
    cpu.autobreaks.reset();
    cpu.enabled_autobreaks.reset();
    cpu.enabled_autobreaks.set(absim::AB_BREAK);
    cpu.serial_bytes.clear();
    emulator->debugger_state.allow_nonstep_breakpoints = true;
    emulator->debugger_state.paused = false;

    std::optional<uint32_t> stop_address;
    if(!options.stop_at.empty()) {
        auto found = find_symbol(symbols, options.stop_at);
        if(!found)
            throw std::runtime_error("stop symbol not found: " + options.stop_at);
        stop_address = (*found)->address;
    }

    std::optional<uint32_t> measure_address;
    if(!options.measure_from.empty()) {
        auto found = find_symbol(symbols, options.measure_from);
        if(!found)
            throw std::runtime_error("measure symbol not found: " + options.measure_from);
        measure_address = (*found)->address;
    }
    // Lowest SP after the first arrival at measure_from, which separates the
    // runtime's own stack use from the stack that the program already held.
    bool measuring = false;
    uint32_t measure_entry_sp = 0;
    uint32_t measure_min_sp = UINT32_MAX;
    uint32_t measure_min_pc = 0;

    stats_t stats;
    std::deque<sample_t> tail;
    uint16_t last_native = UINT16_MAX;
    bool saw_entry = false;
    bool finished = false;
    uint64_t cycles = 0;

    while(cycles < options.cycle_limit) {
        uint32_t const native = cpu.pc;
        if(native >= table && native < table + 256u * 4u &&
           (native - table) % 4u == 0 && native != last_native) {
            uint32_t const pc = guest_pc(cpu);
            uint32_t const sp = guest_sp(cpu);
            if(!saw_entry && pc == entry) {
                saw_entry = true;
                stats.initial_sp = sp;
                stats.prev_sp = sp;
            }
            if(saw_entry) {
                ++stats.samples;
                if(sp < kStackLimit || sp > kStackTop) {
                    if(!stats.range_violation) {
                        stats.range_violation = true;
                        stats.violation_pc = pc;
                        stats.violation_sp = sp;
                    }
                }
                // A wrapped SP jumps far from its last value, so flag large moves.
                if((sp > stats.prev_sp ? sp - stats.prev_sp : stats.prev_sp - sp) > 0x400)
                    stats.wrap_suspect = true;
                stats.prev_sp = sp;
                if(sp < stats.min_sp && sp >= kStackLimit && sp <= kStackTop) {
                    stats.min_sp = sp;
                    stats.min_sp_pc = pc;
                }
                stats.max_sp = std::max(stats.max_sp, sp);

                sample_t sample{pc, sp, cpu.cycle_count, {}};
                for(unsigned r = 0; r < 8; ++r)
                    sample.regs[r] = guest_register(cpu, r);
                if(options.trace_tail) {
                    tail.push_back(sample);
                    if(tail.size() > options.trace_tail)
                        tail.pop_front();
                }
                if(measure_address && !measuring && pc == *measure_address) {
                    measuring = true;
                    measure_entry_sp = sp;
                    measure_min_sp = sp;
                    measure_min_pc = pc;
                }
                if(measuring && sp >= kStackLimit && sp <= kStackTop &&
                   sp < measure_min_sp) {
                    measure_min_sp = sp;
                    measure_min_pc = pc;
                }
                if(stop_address && pc == *stop_address) {
                    std::cout << "stopped at " << options.stop_at << " sp=0x"
                              << std::hex << sp << std::dec << " cycle="
                              << cpu.cycle_count << '\n';
                    finished = false;
                    stop_address.reset();
                    // Print the trace leading to the stop, then end the run.
                    tail.push_back(sample);
                    break;
                }
                for(auto const& [name, address] : snapshot_points) {
                    if(pc != address)
                        continue;
                    std::cout << "snapshot " << name << " pc=0x" << std::hex
                              << std::setw(6) << std::setfill('0') << pc
                              << std::setfill(' ') << " sp=0x" << std::setw(4)
                              << std::setfill('0') << sp << std::setfill(' ')
                              << std::dec << " cycle=" << cpu.cycle_count
                              << " regs=";
                    for(unsigned r = 0; r < 8; ++r)
                        std::cout << std::hex << std::setw(4) << std::setfill('0')
                                  << sample.regs[r] << std::setfill(' ')
                                  << (r == 7 ? "" : ",");
                    // The three bytes at SP hold a return PC when the snapshot
                    // is a callee entry.
                    uint32_t record = uint32_t(cpu.data[sp & 0xffff]) |
                                      uint32_t(cpu.data[(sp + 1) & 0xffff]) << 8 |
                                      uint32_t(cpu.data[(sp + 2) & 0xffff]) << 16;
                    std::cout << " record=0x" << std::setw(6) << std::setfill('0')
                              << record << std::setfill(' ') << std::dec;
                    // The bytes are printed in address order, two hex digits each.
                    if(options.snapshot_bytes) {
                        std::cout << " bytes=" << std::hex << std::setfill('0');
                        uint32_t const base = sample.regs[4];
                        for(unsigned i = 0; i < options.snapshot_bytes; ++i)
                            std::cout << std::setw(2)
                                      << unsigned(cpu.data[(base + i) & 0xffff]);
                        std::cout << std::setfill(' ') << std::dec;
                    }
                    // The thrown object's pointer value names the target, which is read at the
                    // same snapshot. A null value, or one outside 16-bit RAM, prints no bytes.
                    if(options.target_bytes) {
                        uint32_t const object = (sample.regs[4] + 55) & 0xffff;
                        uint32_t const target = uint32_t(cpu.data[object]) |
                                                uint32_t(cpu.data[(object + 1) & 0xffff]) << 8;
                        std::cout << " target=" << std::hex << std::setw(4) << std::setfill('0')
                                  << target << std::setfill(' ') << std::dec;
                        if(target != 0 && target + options.target_bytes <= 0x10000) {
                            std::cout << " targetbytes=" << std::hex << std::setfill('0');
                            for(unsigned i = 0; i < options.target_bytes; ++i)
                                std::cout << std::setw(2) << unsigned(cpu.data[target + i]);
                            std::cout << std::setfill(' ') << std::dec;
                        }
                    }
                    std::cout << '\n';
                }
            }
        }
        last_native = static_cast<uint16_t>(native);

        emulator->cycle();
        cpu.update_all();
        ++cycles;
        if(cpu.autobreaks.test(absim::AB_UNKNOWN_INSTR) ||
           cpu.autobreaks.test(absim::AB_OOB_PC)) {
            std::cout << "native fault: unknown instruction or out-of-range PC\n";
            break;
        }
        if(cpu.autobreaks.test(absim::AB_BREAK)) {
            finished = true;
            break;
        }
    }

    std::cout << "status: " << (finished ? "debug_break" : "did not finish")
              << " cycles=" << cycles << " serial=\"";
    for(uint8_t byte : cpu.serial_bytes) {
        if(byte == '\n')
            std::cout << "\\n";
        else if(byte >= 0x20 && byte < 0x7f)
            std::cout << char(byte);
        else
            std::cout << "\\x" << std::hex << unsigned(byte) << std::dec;
    }
    std::cout << "\"\n";
    if(!saw_entry)
        std::cout << "entry: not reached\n";
    std::cout << std::hex << std::setfill('0');
    std::cout << "samples: " << std::dec << stats.samples << '\n';
    std::cout << std::hex << "initial_sp: 0x" << std::setw(4) << stats.initial_sp << '\n';
    if(stats.min_sp != UINT32_MAX) {
        std::cout << "min_sp: 0x" << std::setw(4) << stats.min_sp << " at 0x"
                  << std::setw(6) << stats.min_sp_pc << " ("
                  << describe(symbols, stats.min_sp_pc) << ")\n";
        std::cout << "peak_bytes: " << std::dec << (stats.initial_sp - stats.min_sp) << '\n';
    }
    if(measuring)
        std::cout << std::hex << std::setfill('0') << "measured_from " << options.measure_from
                  << ": entry_sp=0x" << std::setw(4) << measure_entry_sp
                  << " min_sp=0x" << std::setw(4) << measure_min_sp << " at 0x"
                  << std::setw(6) << measure_min_pc << " ("
                  << describe(symbols, measure_min_pc) << ") peak_after_bytes="
                  << std::dec << (measure_entry_sp - measure_min_sp) << '\n';
    std::cout << std::setfill(' ') << std::dec;
    if(stats.range_violation)
        std::cout << "stack range violation at pc 0x" << std::hex << stats.violation_pc
                  << " sp 0x" << stats.violation_sp << std::dec << '\n';
    if(stats.wrap_suspect)
        std::cout << "stack pointer moved by more than 0x400 between instructions\n";
    if(!finished && options.trace_tail) {
        std::cout << "trace tail:\n";
        for(auto const& s : tail) {
            std::cout << "  cycle " << std::dec << s.cycle << " pc=0x" << std::hex
                      << std::setw(6) << std::setfill('0') << s.pc << std::setfill(' ')
                      << " sp=0x" << std::setw(4) << std::setfill('0') << s.sp
                      << std::setfill(' ') << " " << describe(symbols, s.pc) << '\n';
        }
    }
    return finished ? 0 : 1;
}

options_t parse(int argc, char** argv)
{
    options_t options;
    for(int i = 1; i < argc; ++i) {
        std::string const arg = argv[i];
        auto value = [&]() -> std::string {
            if(i + 1 >= argc)
                throw std::runtime_error(arg + " needs a value");
            return argv[++i];
        };
        if(arg == "--interpreter") options.interpreter = value();
        else if(arg == "--boundary") options.boundary = value();
        else if(arg == "--image") options.image = value();
        else if(arg == "--elf") options.elf = value();
        else if(arg == "--cycle-limit") options.cycle_limit = std::stoull(value());
        else if(arg == "--snapshot") options.snapshots.push_back(value());
        else if(arg == "--snapshot-bytes")
            options.snapshot_bytes = unsigned(std::stoul(value()));
        else if(arg == "--target-bytes")
            options.target_bytes = unsigned(std::stoul(value()));
        else if(arg == "--trace-tail") options.trace_tail = unsigned(std::stoul(value()));
        else if(arg == "--stop-at") options.stop_at = value();
        else if(arg == "--measure-from") options.measure_from = value();
        else throw std::runtime_error("unknown option: " + arg);
    }
    if(options.interpreter.empty() || options.boundary.empty() ||
       options.image.empty() || options.elf.empty())
        throw std::runtime_error(
            "usage: avm_eh_stack_probe --interpreter HEX --boundary JSON "
            "--image BIN --elf ELF [--snapshot SYMBOL]... [--trace-tail N] "
            "[--cycle-limit N] [--snapshot-bytes N] [--target-bytes N]");
    return options;
}

} // namespace

int main(int argc, char** argv)
{
    try {
        return run(parse(argc, argv));
    } catch(std::exception const& error) {
        std::cerr << error.what() << '\n';
        return 2;
    }
}
