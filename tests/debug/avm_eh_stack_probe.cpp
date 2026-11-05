// Host-side stack probe for AVM guest images. It steps the Ardens interpreter
// one cycle at a time and samples the guest state at every AVM dispatch
// boundary, so each sample is the state after one complete guest instruction.
// The probe never writes guest memory or registers, so guest code and guest
// stack usage are unchanged.
//
// The report gives the initial and lowest guest SP, the guest PC that was
// executing at the lowest SP, and the peak usage. Snapshots record the guest
// state when a named ELF symbol is reached, which is how the exception tests
// read the landing-pad SP and the throw-site return record. Two opt-in options
// add to each snapshot: the bytes that follow the return record (stack
// arguments), and a bounded range of guest RAM. Neither changes the run.
//
// A guest instruction boundary is a primary slot arrival whose first native AVR
// instruction executes. The probe decides this after each step. An interrupt that
// preempts the slot is taken before the instruction runs, so that arrival is
// discarded, and the return to the same slot is sampled when its instruction
// executes. Repeated guest state is not evidence of a repeated arrival: a
// self-branching guest instruction keeps its state and still executes. The trace
// options print every arrival in a cycle window, marked executed or preempted.

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

// The emulated data space. The probe reads guest RAM only below its end, which is where the flash
// window begins in AS0, so no snapshot read leaves the emulator's array.
constexpr uint32_t kDataSpaceSize = absim::atmega32u4_t::DATA_SIZE_BYTES;
// The stack-argument snapshot is bounded, so one output line stays short.
constexpr unsigned kMaxSnapshotStackArgs = 16;

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
    // The header's object follows the 59-byte exception header, so the probe reads the pointer
    // value there, and prints this many bytes at it. A pointer value of zero prints no bytes.
    unsigned target_bytes = 0;
    // Stack-argument bytes to print for each snapshot. They follow the three-byte return record,
    // so they start at SP + 3. Zero, the default, prints nothing.
    unsigned snapshot_stack_args = 0;
    // Guest RAM bytes to print, from ram_start, for each snapshot. The default prints nothing.
    bool have_ram_range = false;
    uint32_t ram_start = 0;
    uint32_t ram_length = 0;
    // Diagnostic dispatch trace: one line for each primary dispatch whose CPU cycle lies in
    // the inclusive range. Without these options the output is unchanged.
    bool trace_cycles = false;
    bool trace_native = false;
    bool have_trace_start = false;
    bool have_trace_end = false;
    uint64_t trace_cycle_start = 0;
    uint64_t trace_cycle_end = 0;
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

// Writes the dispatch line for a primary slot arrival in the trace window. It is written before
// the arrival's first native instruction runs, so it shows the state that instruction starts
// from. The caller appends the outcome, because an interrupt may preempt the instruction. The
// exception runtime's active_exception pointer is read only when the ELF names it. Its header
// byte at +23 is read only when the pointer is nonzero and the whole header lies in 16-bit RAM.
void print_dispatch(std::ostream& out, absim::atmega32u4_t const& cpu,
                    std::vector<symbol_t> const& symbols, uint32_t native, uint32_t table,
                    std::optional<uint32_t> active_address)
{
    uint32_t const pc = guest_pc(cpu);
    uint32_t const sp = guest_sp(cpu);
    uint32_t const record = uint32_t(cpu.data[sp & 0xffff]) |
                            uint32_t(cpu.data[(sp + 1) & 0xffff]) << 8 |
                            uint32_t(cpu.data[(sp + 2) & 0xffff]) << 16;
    out << "dispatch cycle=" << std::dec << cpu.cycle_count << std::hex
        << std::setfill('0') << " native=0x" << std::setw(4) << native
        << " slot=0x" << std::setw(2) << (native - table) / 4
        << " vm_pc=0x" << std::setw(6) << pc << " sp=0x" << std::setw(4) << sp
        << " at=" << describe(symbols, pc) << " record=0x" << std::setw(6) << record;
    for(unsigned r = 0; r < 8; ++r)
        out << " r" << r << "=0x" << std::setw(4) << guest_register(cpu, r);
    out << " active=";
    if(!active_address) {
        out << "unknown byte23=unknown";
    } else {
        uint32_t const pointer = guest_word(cpu, *active_address);
        out << "0x" << std::setw(4) << pointer << " byte23=";
        if(pointer != 0 && pointer + 23 <= 0xffff)
            out << "0x" << std::setw(2) << unsigned(cpu.data[pointer + 23]);
        else
            out << "unknown";
    }
    out << std::setfill(' ') << std::dec;
}

bool in_trace_window(options_t const& options, uint64_t cycle)
{
    return options.trace_cycles && cycle >= options.trace_cycle_start &&
           cycle <= options.trace_cycle_end;
}

// A primary slot arrival, read before its first native instruction runs. The instruction may
// change the guest state, so the sample, trace line, and snapshot lines are all taken here, and
// they are printed only once the instruction is known to have executed.
struct boundary_t {
    uint32_t native;
    sample_t sample;
    std::string trace;
    std::string snapshots;
};

// Formats the snapshot lines for a boundary whose guest PC names a snapshot. The bytes are
// read from the boundary's pre-execution state.
std::string snapshot_lines(absim::atmega32u4_t const& cpu, sample_t const& sample,
                           std::vector<std::pair<std::string, uint32_t>> const& points,
                           options_t const& options)
{
    std::ostringstream out;
    uint32_t const pc = sample.pc;
    uint32_t const sp = sample.sp;
    for(auto const& [name, address] : points) {
        if(pc != address)
            continue;
        out << "snapshot " << name << " pc=0x" << std::hex
            << std::setw(6) << std::setfill('0') << pc
            << std::setfill(' ') << " sp=0x" << std::setw(4)
            << std::setfill('0') << sp << std::setfill(' ')
            << std::dec << " cycle=" << sample.cycle
            << " regs=";
        for(unsigned r = 0; r < 8; ++r)
            out << std::hex << std::setw(4) << std::setfill('0')
                << sample.regs[r] << std::setfill(' ')
                << (r == 7 ? "" : ",");
        // The three bytes at SP hold a return PC when the snapshot
        // is a callee entry.
        uint32_t const record = uint32_t(cpu.data[sp & 0xffff]) |
                                uint32_t(cpu.data[(sp + 1) & 0xffff]) << 8 |
                                uint32_t(cpu.data[(sp + 2) & 0xffff]) << 16;
        out << " record=0x" << std::setw(6) << std::setfill('0')
            << record << std::setfill(' ') << std::dec;
        // The bytes are printed in address order, two hex digits each.
        if(options.snapshot_bytes) {
            out << " bytes=" << std::hex << std::setfill('0');
            uint32_t const base = sample.regs[4];
            for(unsigned i = 0; i < options.snapshot_bytes; ++i)
                out << std::setw(2) << unsigned(cpu.data[(base + i) & 0xffff]);
            out << std::setfill(' ') << std::dec;
        }
        // The stack arguments follow the return record, so they begin at SP + 3. The SP must lie
        // in the guest stack, and every byte read must lie in the data space. A violation ends the
        // run, because the state cannot be described without reading outside the emulator.
        if(options.snapshot_stack_args) {
            if(sp < kStackLimit || sp > kStackTop)
                throw std::runtime_error("snapshot stack arguments: SP 0x" + std::to_string(sp) +
                                         " at pc 0x" + std::to_string(pc) +
                                         " lies outside the guest stack");
            uint32_t const first = sp + 3;
            if(first + options.snapshot_stack_args > kDataSpaceSize)
                throw std::runtime_error("snapshot stack arguments: SP 0x" + std::to_string(sp) +
                                         " leaves no room for the requested bytes");
            out << " stackargs=" << std::hex << std::setfill('0');
            for(unsigned i = 0; i < options.snapshot_stack_args; ++i)
                out << std::setw(2) << unsigned(cpu.data[first + i]);
            out << std::setfill(' ') << std::dec;
        }
        // The requested guest RAM range is printed in address order, two hex digits each. The
        // range was validated when it was parsed, so every read lies in the data space.
        if(options.have_ram_range) {
            out << " ram_start=" << std::hex << std::setfill('0') << std::setw(4)
                << options.ram_start << " ram=";
            for(uint32_t i = 0; i < options.ram_length; ++i)
                out << std::setw(2) << unsigned(cpu.data[options.ram_start + i]);
            out << std::setfill(' ') << std::dec;
        }
        // The thrown object's pointer value names the target, which is read at the
        // same snapshot. A null value, or one outside 16-bit RAM, prints no bytes.
        if(options.target_bytes) {
            // The thrown object lies just above the 59-byte exception header.
            uint32_t const object = (sample.regs[4] + 59) & 0xffff;
            uint32_t const target = uint32_t(cpu.data[object]) |
                                    uint32_t(cpu.data[(object + 1) & 0xffff]) << 8;
            out << " target=" << std::hex << std::setw(4) << std::setfill('0')
                << target << std::setfill(' ') << std::dec;
            if(target != 0 && target + options.target_bytes <= 0x10000) {
                out << " targetbytes=" << std::hex << std::setfill('0');
                for(unsigned i = 0; i < options.target_bytes; ++i)
                    out << std::setw(2) << unsigned(cpu.data[target + i]);
                out << std::setfill(' ') << std::dec;
            }
        }
        out << '\n';
    }
    return out.str();
}

boundary_t capture_boundary(absim::atmega32u4_t const& cpu, std::vector<symbol_t> const& symbols,
                            uint32_t native, uint32_t table, options_t const& options,
                            std::vector<std::pair<std::string, uint32_t>> const& snapshot_points,
                            std::optional<uint32_t> active_address)
{
    boundary_t boundary{native, {guest_pc(cpu), guest_sp(cpu), cpu.cycle_count, {}}, {}, {}};
    for(unsigned r = 0; r < 8; ++r)
        boundary.sample.regs[r] = guest_register(cpu, r);
    if(in_trace_window(options, cpu.cycle_count)) {
        std::ostringstream out;
        print_dispatch(out, cpu, symbols, native, table, active_address);
        boundary.trace = out.str();
    }
    bool const named = std::any_of(
        snapshot_points.begin(), snapshot_points.end(),
        [&](auto const& point) { return point.second == boundary.sample.pc; });
    if(named)
        boundary.snapshots = snapshot_lines(cpu, boundary.sample, snapshot_points, options);
    return boundary;
}

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

    std::optional<uint32_t> active_address;
    if(auto found = find_symbol(symbols, "active_exception"))
        active_address = (*found)->address;

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
    bool saw_entry = false;
    bool finished = false;
    uint64_t cycles = 0;

    while(cycles < options.cycle_limit) {
        uint32_t const native = cpu.pc;
        if(options.trace_native && in_trace_window(options, cpu.cycle_count))
            std::cout << "native cycle=" << std::dec << cpu.cycle_count << " pc=0x"
                      << std::hex << std::setw(4) << std::setfill('0') << native
                      << std::setfill(' ') << std::dec << '\n';
        // A primary slot arrival is a candidate boundary. It is read before the step, since the
        // step may change the state it names, and it counts only if the step executes the slot's
        // first native instruction.
        std::optional<boundary_t> candidate;
        if(native >= table && native < table + 256u * 4u && (native - table) % 4u == 0)
            candidate = capture_boundary(cpu, symbols, native, table, options,
                                         snapshot_points, active_address);
        bool const was_active = cpu.active;

        emulator->cycle();
        cpu.update_all();
        ++cycles;
        bool const faulted = cpu.autobreaks.test(absim::AB_UNKNOWN_INSTR) ||
                             cpu.autobreaks.test(absim::AB_OOB_PC);
        // An interrupt that preempts the slot is taken before the instruction runs. Such a step
        // leaves just_interrupted set, and the return to the slot is then a new candidate. With
        // no_merged set, an active step that is not preempted runs exactly one native instruction,
        // at the address it started from.
        bool const executed = candidate && was_active && !cpu.just_interrupted && !faulted;
        if(executed && cpu.executing_instr_pc != native)
            throw std::runtime_error("the executed instruction is not the boundary's first one");
        if(candidate && !executed && !candidate->trace.empty())
            std::cout << candidate->trace << " executed=0 preempted="
                      << (cpu.just_interrupted ? 1 : 0) << '\n';
        if(executed) {
            sample_t const& sample = candidate->sample;
            uint32_t const pc = sample.pc;
            uint32_t const sp = sample.sp;
            if(!candidate->trace.empty())
                std::cout << candidate->trace << " executed=1 preempted=0\n";
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
                // The stop is taken after the boundary's first instruction has executed, so
                // the run ends one native instruction later than the arrival. The state
                // printed here is the state before that instruction, which is the boundary.
                if(stop_address && pc == *stop_address) {
                    std::cout << "stopped at " << options.stop_at << " sp=0x"
                              << std::hex << sp << std::dec << " cycle="
                              << sample.cycle << '\n';
                    finished = false;
                    stop_address.reset();
                    // Print the trace leading to the stop, then end the run.
                    tail.push_back(sample);
                    break;
                }
                std::cout << candidate->snapshots;
            }
        }
        if(faulted) {
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

// Parses a hexadecimal value of one to eight digits, with an optional 0x prefix. Any other text is
// rejected, so a number too wide for the range cannot be read as a smaller one.
std::optional<uint32_t> parse_hex(std::string text)
{
    if(text.size() >= 2 && text[0] == '0' && (text[1] == 'x' || text[1] == 'X'))
        text.erase(0, 2);
    if(text.empty() || text.size() > 8)
        return std::nullopt;
    uint32_t value = 0;
    for(char const c : text) {
        uint32_t digit = 0;
        if(c >= '0' && c <= '9')
            digit = uint32_t(c - '0');
        else if(c >= 'a' && c <= 'f')
            digit = uint32_t(c - 'a' + 10);
        else if(c >= 'A' && c <= 'F')
            digit = uint32_t(c - 'A' + 10);
        else
            return std::nullopt;
        value = value * 16 + digit;
    }
    return value;
}

// Parses the decimal count of stack-argument bytes, which must be from 1 to the maximum.
unsigned parse_count(std::string const& text, std::string const& option)
{
    std::string const range = "needs a decimal count from 1 to " +
                              std::to_string(kMaxSnapshotStackArgs) + ": " + text;
    if(text.empty() || text.size() > 2 || text.find_first_not_of("0123456789") != std::string::npos)
        throw std::runtime_error(option + " " + range);
    unsigned const count = unsigned(std::stoul(text));
    if(count < 1 || count > kMaxSnapshotStackArgs)
        throw std::runtime_error(option + " " + range);
    return count;
}

// Parses START:LENGTH in hexadecimal. The range must be nonempty, and its end must lie within the
// data space, so the read cannot wrap past 0xFFFF or leave the emulator's array.
void parse_ram_range(std::string const& text, options_t& options)
{
    std::string const option = "--snapshot-ram-range";
    std::optional<uint32_t> start;
    std::optional<uint32_t> length;
    auto const colon = text.find(':');
    if(colon != std::string::npos) {
        start = parse_hex(text.substr(0, colon));
        length = parse_hex(text.substr(colon + 1));
    }
    if(!start || !length)
        throw std::runtime_error(option + " needs START:LENGTH in hexadecimal: " + text);
    if(*length == 0)
        throw std::runtime_error(option + " has a zero length: " + text);
    if(uint64_t(*start) + uint64_t(*length) > kDataSpaceSize)
        throw std::runtime_error(option + " leaves the emulated guest RAM (0x0000-0x0AFF): " + text);
    options.have_ram_range = true;
    options.ram_start = *start;
    options.ram_length = *length;
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
        else if(arg == "--snapshot-stack-args")
            options.snapshot_stack_args = parse_count(value(), arg);
        else if(arg == "--snapshot-ram-range")
            parse_ram_range(value(), options);
        else if(arg == "--trace-tail") options.trace_tail = unsigned(std::stoul(value()));
        else if(arg == "--trace-native") options.trace_native = true;
        else if(arg == "--trace-cycle-start") {
            options.trace_cycle_start = std::stoull(value());
            options.have_trace_start = true;
        } else if(arg == "--trace-cycle-end") {
            options.trace_cycle_end = std::stoull(value());
            options.have_trace_end = true;
        }
        else if(arg == "--stop-at") options.stop_at = value();
        else if(arg == "--measure-from") options.measure_from = value();
        else throw std::runtime_error("unknown option: " + arg);
    }
    if(options.have_trace_start || options.have_trace_end) {
        if(!options.have_trace_start || !options.have_trace_end)
            throw std::runtime_error("--trace-cycle-start and --trace-cycle-end go together");
        if(options.trace_cycle_end < options.trace_cycle_start)
            throw std::runtime_error("--trace-cycle-end precedes --trace-cycle-start");
        options.trace_cycles = true;
    }
    if(options.interpreter.empty() || options.boundary.empty() ||
       options.image.empty() || options.elf.empty())
        throw std::runtime_error(
            "usage: avm_eh_stack_probe --interpreter HEX --boundary JSON "
            "--image BIN --elf ELF [--snapshot SYMBOL]... [--trace-tail N] "
            "[--cycle-limit N] [--snapshot-bytes N] [--target-bytes N] "
            "[--snapshot-stack-args N] [--snapshot-ram-range START:LENGTH] "
            "[--trace-cycle-start N --trace-cycle-end M [--trace-native]]");
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
