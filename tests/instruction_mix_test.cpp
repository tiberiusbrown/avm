#include "../bench/instruction_mix.h"
#include <absim.hpp>

#include <algorithm>
#include <cmath>
#include <fstream>
#include <iostream>
#include <memory>
#include <sstream>
#include <stdexcept>

namespace {
void check(bool condition, char const* message) {
    if(!condition) throw std::runtime_error(message);
}
template<class F> void fails(F&& function, char const* message) {
    try { function(); }
    catch(std::exception const& e) {
        check(std::string(e.what()).find(message) != std::string::npos, "Failure lacks actionable diagnostic");
        return;
    }
    throw std::runtime_error("Expected failure did not occur");
}
void load(absim::arduboy_t& emulator, char const* path, char const* name) {
    std::ifstream in(path, std::ios::binary);
    check(bool(in), "Cannot open fixture");
    auto error = emulator.load_file(name, in);
    if(!error.empty()) throw std::runtime_error(error);
}
void suppress(absim::arduboy_t& emulator) {
    auto& data = emulator.core_state.cpu.data;
    data[0x5f] &= ~0x80;
    data[0x6e] = data[0x6f] = data[0x71] = data[0x72] = 0;
}
void stop(absim::arduboy_t& emulator) {
    suppress(emulator);
    emulator.debugger_state.allow_nonstep_breakpoints = true;
    emulator.core_state.cpu.enabled_autobreaks.set(absim::AB_BREAK);
    emulator.debugger_state.paused = false;
    emulator.advance(10'000'000'000'000ull);
    check(emulator.debugger_state.paused, "Fixture did not reach DEBUG_BREAK");
}
avm_mix::Profile run(char const* interpreter, char const* image, uint32_t table,
                    avm_mix::Decoder const& decoder, uint64_t& normal) {
    auto e = std::make_unique<absim::arduboy_t>();
    e->reset(); load(*e, interpreter, "interpreter.hex"); load(*e, image, "fxdata.bin");
    stop(*e);
    auto start = e->core_state.cpu.cycle_count;
    stop(*e);
    normal = e->core_state.cpu.cycle_count-start;
    e->reset(); load(*e, image, "fxdata.bin"); stop(*e); suppress(*e);
    auto profile = avm_mix::collect(*e, decoder, table);
    // Independent, uninstrumented stepping with merged instructions disabled.
    e->reset(); load(*e, image, "fxdata.bin"); stop(*e); suppress(*e);
    auto& cpu = e->core_state.cpu;
    start = cpu.cycle_count; cpu.no_merged = true; cpu.autobreaks.reset();
    do { e->cycle(); cpu.update_all(); } while(!cpu.should_autobreak() && cpu.cycle_count-start < 160000000);
    check(cpu.autobreaks.test(absim::AB_BREAK), "Uninstrumented stepping failed");
    check(cpu.cycle_count-start == normal && profile.raw == normal,
          "Merged, unmerged and profiled cycle totals differ");
    return profile;
}
avm_mix::Profile synthetic(avm_mix::Decoder const& d, uint64_t a, uint64_t b) {
    avm_mix::Profile p;
    p.name = "synthetic";
    p.pcs[0] = {d.decode({0x01}, 0), {a, 1}};
    p.pcs[1] = {d.decode({0x11}, 0), {b, 1}};
    p.cycles = a+b; p.executions = 2;
    return p;
}
}
int main(int argc, char** argv) {
    try {
        check(argc == 5, "Expected interpreter, boundary metadata, baseline and fixture images");
        avm_mix::initialize_decoder();
        avm_mix::Decoder d;
        auto table = avm_mix::boundary_table(argv[2], argv[1]);
        auto upper = d.decode({0x01}, 0), general = d.decode({0xf1, 0x01}, 0);
        check(upper.encoding.label != general.encoding.label && upper.encoding.bytes == 1 &&
              general.encoding.bytes == 2, "MOV encoding forms collapsed");
        check(upper.encoding.family == "MOV" && general.encoding.family == "MOV", "MOV family rollup incorrect");
        check(d.decode({0x00},0).encoding.label == upper.encoding.label, "NOP must classify as actual MOV encoding");
        check(d.decode({0xa5},0).encoding.family == "XOR", "CLR must classify as actual XOR encoding");
        check(d.decode({0x10},0).encoding.label != d.decode({0xf2,0x00},0).encoding.label, "ADD forms collapsed");
        check(d.decode({0xc8,1},0).encoding.label != d.decode({0xf0,8,1},0).encoding.label, "ADDI forms collapsed");
        check(d.decode({0xf2,0x61},0).encoding.family == "MOV", "MOV32 family incorrect");
        check(d.decode({0xd7,0},0).encoding.label != d.decode({0xd7,1},0).encoding.label,
              "Distinct SYS selectors collapsed");
        fails([&] { d.decode({0xff,0xff},0); }, "Cannot classify AVM encoding at PC");
        fails([&] { d.decode({0xf0},0); }, "Cannot classify AVM encoding at PC");
        auto catalogue = d.catalogue();
        check(catalogue.count("FPOLY/FF") && catalogue.at("FPOLY/FF").bytes == 0, "Variable-size form missing");

        uint64_t normal_base = 0, normal = 0;
        auto baseline = run(argv[1], argv[3], table, d, normal_base);
        auto fixture = run(argv[1], argv[4], table, d, normal);
        fixture.name = "fixture";
        avm_mix::reconcile(baseline, baseline, normal_base);
        avm_mix::reconcile(fixture, baseline, normal);
        check(baseline.executions == 0 && baseline.cycles == 0, "Baseline includes marker instructions");
        check(fixture.executions == 24, "Wrong dynamic instruction count / first or final boundary lost");
        std::vector<uint64_t> divisions;
        unsigned loop_counts = 0, loads = 0;
        for(auto const& pc : fixture.pcs) {
            auto const& name = pc.second.instruction.encoding.mnemonic;
            if(name == "UDIV16") divisions.push_back(pc.second.cost.cycles);
            if(name == "DEC16" || name == "CMP" || name == "BRNE8") {
                check(pc.second.cost.executions == 3, "Loop PC execution counts incorrect");
                ++loop_counts;
            }
            if(name == "LDI16") loads += unsigned(pc.second.cost.executions);
        }
        check(loads == 6 && loop_counts == 3, "Setup/trailing instructions leaked into interval");
        check(divisions.size() == 2 && divisions[0] != divisions[1], "Operand-dependent divider costs lost");
        check(std::min(divisions[0],divisions[1]) == 59 && std::max(divisions[0],divisions[1]) == 251,
              "Divider cycle attribution differs from independently measured instruction timings");
        auto broken = fixture; ++broken.cycles;
        fails([&] { avm_mix::reconcile(broken,baseline,normal); }, "baseline/boundary");
        fails([&] { avm_mix::reconcile(fixture,baseline,normal+1); }, "stepped/normal");
        auto wrong_baseline = baseline; ++wrong_baseline.raw;
        fails([&] { avm_mix::reconcile(fixture,wrong_baseline,normal); }, "baseline contains guest work");

        auto a = synthetic(d,100,900), b = synthetic(d,100,0);
        b.pcs.erase(1); b.executions = 1;
        auto rows = avm_mix::aggregate({a,b}, true);
        check(rows.size() == 2 && rows[0].label == "MOV", "Balanced sort incorrect");
        check(std::abs(rows[0].balanced-55) < 1e-9 && std::abs(rows[0].pooled-20000.0/1100) < 1e-9,
              "Balanced and pooled calculations incorrect");
        check(rows[0].cost.cycles == 200 && rows[0].cost.executions == 2 && rows[0].benchmarks == 2,
              "Aggregation totals incorrect");
        auto tie = avm_mix::aggregate({synthetic(d,50,50)},true);
        check(tie[0].label == "ADD", "Equal-share ordering must be lexical");
        auto encoding_rows = avm_mix::aggregate({fixture},false);
        auto family_rows = avm_mix::aggregate({fixture},true);
        std::map<std::string, avm_mix::Counter> family_totals;
        uint64_t cycles = 0, counts = 0;
        for(auto const& row : encoding_rows) {
            cycles += row.cost.cycles; counts += row.cost.executions;
            family_totals[row.family].cycles += row.cost.cycles;
            family_totals[row.family].executions += row.cost.executions;
        }
        check(cycles == fixture.cycles && counts == fixture.executions, "Encoding totals do not reconcile");
        for(auto const& row : family_rows)
            check(row.cost.cycles == family_totals.at(row.label).cycles &&
                  row.cost.executions == family_totals.at(row.label).executions,
                  "Family aggregation omitted or double-counted an encoding");
        auto const& mov = family_totals.at("MOV");
        check(mov.executions == 8, "MOV family must combine upper, general and immediate forms");
        auto incomplete_catalogue = catalogue;
        incomplete_catalogue.erase(upper.encoding.label);
        fails([&] {
            std::ostringstream output;
            avm_mix::report(output,{fixture},baseline,incomplete_catalogue,"test","O2");
        }, "Executed form absent from decoder catalogue");
        std::ostringstream first, second;
        avm_mix::report(first,{fixture},baseline,catalogue,"test identity","O2");
        avm_mix::report(second,{fixture},baseline,catalogue,"test identity","O2");
        check(first.str() == second.str(), "Report formatting is nondeterministic");
        check(first.str().find("Unobserved executable forms:\n") != std::string::npos &&
              first.str().find("  FDIV/FF\n") != std::string::npos, "Unexecuted encoding coverage missing");
        check(first.str().find("Balanced %") != std::string::npos && first.str().find("Pooled %") != std::string::npos,
              "Report columns missing");
        std::cout << "Instruction-mix tests passed: classification, aliases, counts, variable latency,\n"
                     "boundaries, baseline, merge parity, aggregates, coverage and deterministic output.\n";
        return 0;
    } catch(std::exception const& e) {
        std::cerr << "Instruction-mix test: " << e.what() << '\n'; return 1;
    }
}
