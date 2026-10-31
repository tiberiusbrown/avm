// Times __avm_trap_lookup in the emulator. The host chooses probes from the
// AVD1 function index and checkpoint table of the packaged benchmark image, then
// lets the guest look each one up. Each call is timed from one entry of
// __avm_trap_lookup to the next, so the figure includes the driver loop.
#include <absim.hpp>
#include <absim_regs.hpp>
#include "avm_spi_observer.hpp"

#include <algorithm>
#include <cstdint>
#include <fstream>
#include <iostream>
#include <iterator>
#include <memory>
#include <utility>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

namespace {
void require(bool condition, std::string const& message)
{
    if(!condition)
        throw std::runtime_error(message);
}

// Reads a symbol from a listing. Native listings hold word addresses, which are
// halved, while disassembly listings hold byte addresses.
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

std::vector<uint8_t> read_file(char const* path)
{
    std::ifstream input(path, std::ios::binary);
    require(bool(input), std::string("cannot read ") + path);
    return {std::istreambuf_iterator<char>(input), {}};
}

uint32_t image_u24(std::vector<uint8_t> const& image, size_t offset)
{
    return uint32_t(image.at(offset)) | uint32_t(image.at(offset + 1)) << 8 |
           uint32_t(image.at(offset + 2)) << 16;
}

uint16_t word(absim::atmega32u4_t const& cpu, unsigned address)
{
    return uint16_t(cpu.data[address]) | uint16_t(cpu.data[address + 1]) << 8;
}

uint32_t guest_pc(absim::atmega32u4_t const& cpu)
{
    return uint32_t(word(cpu, 4)) | uint32_t(cpu.data[6]) << 16;
}

// Benchmark RAM, matching tests/interp/trap_lookup_bench.c.
constexpr unsigned kReady = 0x0300;
constexpr unsigned kGo = 0x0301;
constexpr unsigned kDone = 0x0302;
constexpr unsigned kCount = 0x0303;
constexpr unsigned kProbes = 0x0400;
constexpr unsigned kMaxProbes = 32;

struct machine_t {
    std::unique_ptr<absim::arduboy_t> emulator = std::make_unique<absim::arduboy_t>();
    uint32_t boundary_table;

    machine_t(char const* hex, char const* lst, char const* image, char const* listing)
    {
        boundary_table = symbol(lst, "primary_table", true);
        emulator->reset();
        load(hex, "interpreter.hex");
        load(image, "fxdata.bin");
        cpu().no_merged = true;
        cpu().autobreaks.reset();
        avm_test::observe_spi_writes(cpu());
    }

    void load(char const* path, char const* name)
    {
        auto bytes = read_file(path);
        std::istringstream stream(std::string(bytes.begin(), bytes.end()));
        auto error = emulator->load_file(name, stream);
        if(!error.empty())
            throw std::runtime_error(error);
    }

    absim::atmega32u4_t& cpu() { return emulator->core_state.cpu; }

    bool boundary()
    {
        auto pc = cpu().pc;
        return pc >= boundary_table && pc < boundary_table + 1024 && (pc - boundary_table) % 4 == 0;
    }

    void tick()
    {
        emulator->cycle();
        cpu().update_all();
        require(!cpu().should_autobreak(), "native emulator fault");
    }

    template<class P> void until(P pred, uint64_t bound, std::string const& what)
    {
        uint64_t start = cpu().cycle_count;
        while(!pred()) {
            require(cpu().cycle_count < start + bound, "timed out waiting for " + what);
            tick();
        }
    }
};

// A function record with its name, read from the AVD1 string pool.
struct function_t {
    uint32_t start;
    uint32_t end;
    std::string name;
};

std::string pool_text(std::vector<uint8_t> const& image, size_t pool, size_t size, uint32_t offset)
{
    require(offset < size, "name offset outside the string pool");
    size_t cursor = pool + offset;
    uint32_t length = 0;
    unsigned bytes = 0;
    for(unsigned shift = 0;; shift += 7) {
        uint8_t byte = image.at(cursor + bytes++);
        length |= uint32_t(byte & 0x7f) << shift;
        if(!(byte & 0x80))
            break;
    }
    return std::string(image.begin() + cursor + bytes, image.begin() + cursor + bytes + length);
}

std::vector<function_t> functions_of(std::vector<uint8_t> const& image, size_t crash)
{
    size_t const entry = crash + 12 + 7 * 4;
    size_t const pool = crash + image_u24(image, entry + 1);
    size_t const pool_size = image_u24(image, entry + 4);
    size_t const index = crash + 12 + 7 * 0;
    size_t const section = crash + image_u24(image, index + 1);
    uint32_t const count = image.at(section) | uint32_t(image.at(section + 1)) << 8;
    std::vector<function_t> out;
    for(uint32_t i = 0; i < count; ++i) {
        size_t const record = section + 2 + 9 * size_t(i);
        out.push_back({image_u24(image, record), image_u24(image, record + 3),
                       pool_text(image, pool, pool_size, image_u24(image, record + 6))});
    }
    return out;
}

// Each measured call is timed from one entry of __avm_trap_lookup to the next.
// The last call runs from its entry to the guest's done flag.
std::vector<uint64_t> time_probes(machine_t& m, uint32_t lookup, unsigned count)
{
    auto& cpu = m.cpu();
    std::vector<uint64_t> entries;
    uint64_t done = 0;
    bool at_entry = false;
    m.until([&] {
        bool now = m.boundary() && guest_pc(cpu) == lookup;
        if(now && !at_entry)
            entries.push_back(cpu.cycle_count);
        at_entry = now;
        if(cpu.data[kDone] == 1)
            done = cpu.cycle_count;
        return cpu.data[kDone] == 1;
    }, 200000000, "lookup benchmark");
    require(entries.size() == count, "lookup count differs from the probe count");
    std::vector<uint64_t> cycles;
    for(size_t i = 0; i + 1 < entries.size(); ++i)
        cycles.push_back(entries[i + 1] - entries[i]);
    cycles.push_back(done - entries.back());
    return cycles;
}

void report(char const* name, std::vector<uint64_t> const& cycles)
{
    require(!cycles.empty(), std::string("no samples for ") + name);
    uint64_t sum = 0;
    for(uint64_t c : cycles)
        sum += c;
    std::cout << name << ": " << cycles.size() << " lookups, average "
              << sum / cycles.size() << " cycles, min "
              << *std::min_element(cycles.begin(), cycles.end()) << ", max "
              << *std::max_element(cycles.begin(), cycles.end()) << "\n";
}

void run_bench(char const* hex, char const* lst, char const* image_path, char const* listing)
{
    auto image = read_file(image_path);
    size_t const crash = image_u24(image, 0x0f);
    require(crash != 0, "benchmark image has no crash metadata");
    auto functions = functions_of(image, crash);
    require(!functions.empty(), "benchmark image has no function records");

    // Probe classes. The unmapped probe is the end of the last function, past
    // which no function or source line applies.
    std::vector<std::pair<std::string, std::vector<uint32_t>>> classes = {
        {"mapped", {}}, {"long name", {}}, {"high address", {}},
        {"unmapped", {functions.back().end}}, {"checkpoint", {}}};
    for(auto const& f : functions) {
        if(f.name.rfind("bench_probe_with_a_deliberately_long", 0) == 0)
            classes[1].second.push_back(f.start);
        else if(f.name.rfind("bench_probe_", 0) == 0)
            classes[0].second.push_back(f.start + 1);
        else if(f.name.rfind("bench_high_", 0) == 0)
            classes[2].second.push_back(f.start);
    }
    // Checkpoint boundaries: the state recorded at each 64th transition.
    size_t const section = crash + image_u24(image, crash + 12 + 7 * 2 + 1);
    uint32_t const count = image.at(section) | uint32_t(image.at(section + 1)) << 8;
    for(uint32_t i = 1; i < count; ++i)
        classes[4].second.push_back(image_u24(image, section + 2 + 12 * size_t(i)));

    machine_t m(hex, lst, image_path, listing);
    auto& cpu = m.cpu();
    uint32_t const lookup = symbol(listing, "__avm_trap_lookup", false);
    for(auto const& [name, pcs] : classes) {
        std::vector<uint64_t> cycles;
        for(size_t first = 0; first < pcs.size(); first += kMaxProbes) {
            size_t const last = std::min(pcs.size(), first + kMaxProbes);
            m.until([&] { return cpu.data[kReady] == 1; }, 50000000, "benchmark ready flag");
            for(size_t i = first; i < last; ++i)
                for(unsigned byte = 0; byte < 4; ++byte)
                    cpu.data[kProbes + 4 * (i - first) + byte] = uint8_t(pcs[i] >> (8 * byte));
            cpu.data[kCount] = uint8_t(last - first);
            cpu.data[kGo] = 1;
            auto batch = time_probes(m, lookup, unsigned(last - first));
            cycles.insert(cycles.end(), batch.begin(), batch.end());
            cpu.data[kGo] = 0;
        }
        if(!cycles.empty())
            report(name.c_str(), cycles);
    }
}
} // namespace

int main(int argc, char** argv)
{
    try {
        require(argc == 5, "usage: avm_trap_lookup_bench interp.hex interp.lst bench.bin bench.asm");
        run_bench(argv[1], argv[2], argv[3], argv[4]);
        return 0;
    } catch(std::exception const& error) {
        std::cerr << error.what() << '\n';
        return 1;
    }
}
