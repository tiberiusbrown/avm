#include "instruction_mix.h"

#include <absim.hpp>
#include <llvm/ADT/ArrayRef.h>
#include <llvm/MC/MCAsmInfo.h>
#include <llvm/MC/MCContext.h>
#include <llvm/MC/MCDisassembler/MCDisassembler.h>
#include <llvm/MC/MCInst.h>
#include <llvm/MC/MCInstrInfo.h>
#include <llvm/MC/MCRegisterInfo.h>
#include <llvm/MC/MCSubtargetInfo.h>
#include <llvm/MC/TargetRegistry.h>
#include <llvm/Support/SHA256.h>
#include <llvm/ADT/StringExtras.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/TargetParser/Triple.h>

#include <algorithm>
#include <array>
#include <fstream>
#include <iomanip>
#include <iterator>
#include <locale>
#include <regex>
#include <sstream>
#include <stdexcept>
#include <unordered_map>

extern "C" void LLVMInitializeAVMTargetInfo();
extern "C" void LLVMInitializeAVMTargetMC();
extern "C" void LLVMInitializeAVMDisassembler();

namespace avm_mix {
namespace {
// Explicit operation membership deliberately fails when a new decoded operation
// needs a taxonomy decision. Width and encoding restrictions stay in the labels.
std::string family(std::string const& name) {
    static const std::pair<char const*, char const*> groups[] = {
        {"MOV", "MOV MOV_RR MOV32_F2 LDI8 LDI16 COLDLDI8 COLDLDI16"},
        {"LOAD", "LD8U LD16 LD32 F5LD8U F5LD16 F7LD8U_POST F7LD16_POST GPLD8U_POST GPLD16_POST DPLD8U DPLD16 LDM8U LDM16 LDSP8U LDSP8S LDSP16 LDSP8U_COMPACT LDSP16_COMPACT LDP8U LDP8S LDP16 LDP24 LDP32 LDP8U_POST LDP16_POST LDP24_POST LDP32_POST"},
        {"STORE", "ST8 ST16 ST32 F3ST8 F5ST16 F6ST8_POST F7ST16_POST GPST8_POST GPST16_POST DPST8 DPST16 STM8 STM16 STSP8 STSP16 STSP8_COMPACT STSP16_COMPACT"},
        {"ADD", "ADD ADD_RR ADD32 ADDIS8 COLDADDIS8 INC16 LEASP"},
        {"SUB", "SUB SUB_RR SUB32 DEC16 NEG16"},
        {"CMP", "CMP CMP_RR CMP32 CMPIS8 COLDCMPIS8 TST8 TST16"},
        {"AND", "AND AND_RR"}, {"OR", "OR OR_RR"}, {"XOR", "XOR XOR_RR"},
        {"NOT", "NOT16"},
        {"SHIFT", "ASR16_1 ASR16I ASR16V ASR32_1 LSL16_1 LSL16I LSR16_1 LSR16I LSR16V LSR32_1 SHL16V"},
        {"EXTEND", "SEXT8 ZEXT8"}, {"SWAP", "SWAP8 BSWAP16"},
        {"MUL", "MUL8 MUL16 MULS8W MULSU8W MULU8W"},
        {"DIV", "SDIV16 UDIV16"}, {"REM", "SREM16 UREM16"},
        {"BRANCH", "BREQ8 BREQ16 BRNE8 BRNE16 BRSGE8 BRSGE16 BRSLT8 BRSLT16 BRUGE8 BRUGE16 BRULT8 BRULT16 JMP8 JMP16 JMPF JMPP"},
        {"CALL/RET", "CALL8 CALL16 CALLF CALLP RET"},
        {"STACK", "PUSH16 POP16 ADJSP GETSP SETSP"},
        {"SELECT", "BOOL CSET_EQ CSET_NE CSET_SGE CSET_SLT CSET_UGE CSET_ULT CMOV_EQ CMOV_NE CMOV_SGE CMOV_SLT CMOV_UGE CMOV_ULT"},
        {"FADD", "FADD_MC"}, {"FSUB", "FSUB_MC"}, {"FMUL", "FMUL_MC"},
        {"FDIV", "FDIV_MC"}, {"FCMP", "FCMP_MC"}, {"FCLASS", "FCLASS_MC"},
        {"FNEG", "FNEG"}, {"FABS", "FABS"}, {"FPOLY", "FPOLY"},
        {"FSQRT", "FSQRT_MC"}, {"FTRUNC", "FTRUNC_MC"},
        {"FFLOOR", "FFLOOR_MC"}, {"FCEIL", "FCEIL_MC"},
        {"FROUND", "FROUND_MC"}, {"FMOD", "FMOD_MC"},
        {"FREMPIO2", "FREMPIO2_MC"}, {"FMA", "FMA_MC"},
        {"FCONVERT", "S16TOF_MC S32TOF_MC U16TOF_MC U32TOF_MC FTOS16_MC FTOS32_MC FTOU16_MC FTOU32_MC"},
        {"SYS", "SYS"}
    };
    static const auto taxonomy = [] {
        std::map<std::string, std::string> result;
        for(auto const& group : groups) {
            std::istringstream names(group.second);
            for(std::string word; names >> word;)
                if(!result.emplace(word, group.first).second)
                    throw std::runtime_error("Duplicate instruction-mix taxonomy entry: " + word);
        }
        return result;
    }();
    auto found = taxonomy.find(name);
    if(found == taxonomy.end())
        throw std::runtime_error("Unclassified AVM operation " + name +
            "; add its family to bench/instruction_mix.cpp");
    return found->second;
}
std::string service_name(uint8_t id) {
    switch(id) {
#define AVM_SYS_DEF(ID, AsmName, PseudoKind, Pseudo, IntrinsicKind, Intrinsic, CostKind, Cost) \
    case ID: return #AsmName;
#include "../deps/llvm-project/llvm/lib/Target/AVM/AVMSystemCalls.inc"
#undef AVM_SYS_DEF
    default: throw std::runtime_error("Unclassified AVM SYS selector " + std::to_string(id));
    }
}
std::string read_file(std::filesystem::path const& path) {
    std::ifstream input(path, std::ios::binary);
    if(!input) throw std::runtime_error("Cannot read " + path.string());
    return {std::istreambuf_iterator<char>(input), {}};
}
std::string hash(std::string const& bytes) {
    auto digest = llvm::SHA256::hash(llvm::ArrayRef<uint8_t>(
        reinterpret_cast<uint8_t const*>(bytes.data()), bytes.size()));
    return llvm::toHex(llvm::ArrayRef<uint8_t>(digest), true);
}
uint32_t number(std::string const& text, char const* key) {
    std::smatch match;
    if(!std::regex_search(text, match, std::regex(std::string("\"") + key + "\"\\s*:\\s*([0-9]+)")))
        throw std::runtime_error(std::string("Boundary metadata lacks ") + key);
    return static_cast<uint32_t>(std::stoul(match[1]));
}
}
void initialize_decoder() {
    LLVMInitializeAVMTargetInfo();
    LLVMInitializeAVMTargetMC();
    LLVMInitializeAVMDisassembler();
}
struct Decoder::Impl {
    llvm::Triple triple{"avm-unknown-none"};
    llvm::Target const* target;
    std::unique_ptr<llvm::MCRegisterInfo> registers;
    std::unique_ptr<llvm::MCInstrInfo> instructions;
    std::unique_ptr<llvm::MCSubtargetInfo> subtarget;
    std::unique_ptr<llvm::MCAsmInfo> assembly;
    std::unique_ptr<llvm::MCContext> context;
    std::unique_ptr<llvm::MCDisassembler> decoder;
    Impl() {
        std::string error;
        target = llvm::TargetRegistry::lookupTarget(triple, error);
        if(!target) throw std::runtime_error(error);
        registers.reset(target->createMCRegInfo(triple));
        instructions.reset(target->createMCInstrInfo());
        subtarget.reset(target->createMCSubtargetInfo(triple, "", ""));
        assembly.reset(target->createMCAsmInfo(*registers, triple, llvm::MCTargetOptions()));
        context = std::make_unique<llvm::MCContext>(triple, assembly.get(), registers.get(), subtarget.get());
        decoder.reset(target->createMCDisassembler(*subtarget, *context));
        if(!decoder) throw std::runtime_error("Cannot create AVM MC decoder");
    }
    Instruction decode(llvm::ArrayRef<uint8_t> bytes, uint32_t pc) const {
        llvm::MCInst inst;
        uint64_t size = 0;
        if(decoder->getInstruction(inst, size, bytes, pc, llvm::nulls()) !=
                llvm::MCDisassembler::Success || !size || size > bytes.size()) {
            std::ostringstream error;
            error << "Cannot classify AVM encoding at PC 0x" << std::hex << pc
                  << ":";
            for(auto byte : bytes.take_front(4)) error << ' ' << unsigned(byte);
            error << "; check the image and production AVM decoder";
            throw std::runtime_error(error.str());
        }
        std::string name = instructions->getName(inst.getOpcode()).str();
        Encoding form;
        form.mnemonic = name;
        form.family = family(name);
        form.bytes = name == "FPOLY" ? 0 : unsigned(size);
        // MC opcodes retain encoding variants (MOV vs MOV_RR, MOV32_F2,
        // COLDADDIS8, etc.). Include the actual prefix as an additional guard
        // against canonicalization of aliases in a future decoder.
        std::string label = name;
        if(label == "MOV" || label == "ADD" || label == "SUB" || label == "CMP" ||
           label == "AND" || label == "OR" || label == "XOR") label += "16.upper";
        else if(label.size() > 3 && label.substr(label.size()-3) == "_RR")
            label = label.substr(0, label.size()-3) + "16.general";
        else if(label == "ADDIS8") label = "ADDI16.s8.upper";
        else if(label == "COLDADDIS8") label = "ADDI16.s8.lower";
        else if(label == "MOV32_F2") label = "MOV32.general";
        else if(label == "SYS") label += "." + service_name(bytes[1]);
        else if(label.size() > 3 && label.substr(label.size()-3) == "_MC") label.resize(label.size()-3);
        if(bytes[0] >= 0xf0) {
            std::ostringstream prefix;
            prefix << "/" << std::uppercase << std::hex << unsigned(bytes[0]);
            label += prefix.str();
        }
        form.label = label;
        return {form, {bytes.begin(), bytes.begin() + size}};
    }
};
Decoder::Decoder() : impl(std::make_unique<Impl>()) {}
Decoder::~Decoder() = default;
Instruction Decoder::decode(std::vector<uint8_t> const& image, uint32_t pc) const {
    if(pc > 0xffffff || pc >= image.size())
        throw std::runtime_error("Instruction-mix PC outside AVM image: " + std::to_string(pc));
    return impl->decode(llvm::ArrayRef<uint8_t>(image).drop_front(pc), pc);
}
std::map<std::string, Encoding> Decoder::catalogue() const {
    std::map<std::string, Encoding> result;
    // Exhaust all three selector/descriptor bytes instead of maintaining a
    // second list of opcode ranges. Deduplicate by MC operation + prefix before
    // doing any string work. Register/immediate choices do not define forms;
    // all valid FPOLY coefficient counts belong to its one variable-size form.
    std::array<uint8_t, 1023> bytes{};
    std::vector<bool> seen(impl->instructions->getNumOpcodes() * 257);
    for(unsigned primary = 0; primary < 256; ++primary) {
        bytes[0] = uint8_t(primary);
        for(unsigned secondary = 0; secondary < 256; ++secondary) {
            bytes[1] = uint8_t(secondary);
            for(unsigned operand = 0; operand < 256; ++operand) {
                bytes[2] = uint8_t(operand);
                llvm::MCInst inst;
                uint64_t size = 0;
                if(impl->decoder->getInstruction(inst, size, bytes, 0, llvm::nulls()) !=
                   llvm::MCDisassembler::Success) continue; // reserved / invalid
                // SYS's immediate byte selects an operation, not a data value.
                // It must remain distinct even though MC represents all SYS
                // services with one instruction ID.
                auto key = inst.getOpcode() * 257 + (primary >= 0xf0 ? primary+1 : 0);
                bool system_service = impl->instructions->getName(inst.getOpcode()) == "SYS";
                if(seen[key] && !system_service) continue;
                seen[key] = true;
                auto encoding = impl->decode(bytes, 0).encoding;
                result.emplace(encoding.label, encoding);
            }
        }
    }
    return result;
}

Profile collect(absim::arduboy_t& emulator, Decoder const& decoder, uint32_t table) {
    auto& cpu = emulator.core_state.cpu;
    cpu.no_merged = true;
    cpu.autobreaks.reset();
    cpu.enabled_autobreaks.set(absim::AB_BREAK);
    uint64_t const begin = cpu.cycle_count;
    Profile result;
    // Packaged program bytes are immutable in these benchmarks. Classify only
    // on the first visit to a PC; no strings/disassembly in the stepping loop.
    std::unordered_map<uint32_t, PcCounter*> cache;
    PcCounter* active = nullptr;
    uint64_t anchor = begin, last_boundary = begin;
    bool first = true, marker = false;
    do {
        uint32_t native = cpu.pc;
        if(native >= table && native < table + 1024 && (native-table)%4 == 0) {
            uint32_t pc = uint32_t(cpu.data[4]) | uint32_t(cpu.data[5])<<8 | uint32_t(cpu.data[6])<<16;
            if(marker) throw std::runtime_error("Unexpected AVM boundary after final marker");
            if(first) { result.leading = cpu.cycle_count-begin; first = false; }
            if(active) {
                uint64_t delta = cpu.cycle_count-anchor;
                active->cost.cycles += delta;
                ++active->cost.executions;
                result.cycles += delta;
                ++result.executions;
            }
            last_boundary = anchor = cpu.cycle_count;
            auto const& image = emulator.program_state.fxdata;
            if(pc+1 < image.size() && image[pc] == 0xd7 && image[pc+1] == 1) {
                marker = true;
                active = nullptr;
            } else {
                auto found = cache.find(pc);
                if(found == cache.end()) {
                    auto& counter = result.pcs[pc];
                    counter.instruction = decoder.decode(image, pc);
                    found = cache.emplace(pc, &counter).first;
                }
                active = found->second;
            }
        }
        emulator.cycle();
        cpu.update_all();
        if(cpu.cycle_count-begin > 160'000'000)
            throw std::runtime_error("Instruction-mix interval did not reach DEBUG_BREAK within 160M cycles");
    } while(!cpu.should_autobreak());
    if(!cpu.autobreaks.test(absim::AB_BREAK) || !marker)
        throw std::runtime_error("Instruction-mix native fault or missing final DEBUG_BREAK boundary");
    result.raw = cpu.cycle_count-begin;
    result.trailing = cpu.cycle_count-last_boundary;
    if(result.raw != result.leading + result.cycles + result.trailing)
        throw std::runtime_error("Instruction-mix raw boundary accounting failed");
    return result;
}
void reconcile(Profile const& p, Profile const& baseline, uint64_t normal_raw) {
    if(baseline.cycles || baseline.executions || baseline.raw != baseline.leading+baseline.trailing)
        throw std::runtime_error("Instruction-mix baseline contains guest work; adjacent DEBUG_BREAKs required");
    if(p.raw != normal_raw)
        throw std::runtime_error(p.name + ": stepped/normal raw cycle mismatch (" +
            std::to_string(p.raw) + " vs " + std::to_string(normal_raw) + ")");
    if(p.leading != baseline.leading || p.trailing != baseline.trailing ||
       p.raw < baseline.raw || p.cycles != p.raw-baseline.raw)
        throw std::runtime_error(p.name + ": baseline/boundary cycle mismatch; inspect leading/trailing marker costs");
    uint64_t cycles = 0, executions = 0;
    for(auto const& item : p.pcs) { cycles += item.second.cost.cycles; executions += item.second.cost.executions; }
    if(cycles != p.cycles || executions != p.executions)
        throw std::runtime_error(p.name + ": per-PC counters do not reconcile");
}

std::vector<Row> aggregate(std::vector<Profile> const& profiles, bool families) {
    if(profiles.empty()) throw std::runtime_error("Instruction-mix suite is empty");
    std::map<std::string, Row> rows;
    uint64_t total = 0;
    for(auto const& p : profiles) {
        if(!p.cycles) throw std::runtime_error(p.name + ": empty instruction-mix workload");
        total += p.cycles;
        std::map<std::string, Counter> local;
        for(auto const& pc : p.pcs) {
            auto const& e = pc.second.instruction.encoding;
            std::string const& key = families ? e.family : e.label;
            auto& row = rows[key];
            row.label = key; row.family = e.family; row.bytes = e.bytes;
            auto& cost = local[key];
            cost.cycles += pc.second.cost.cycles;
            cost.executions += pc.second.cost.executions;
        }
        for(auto const& item : local) {
            auto& row = rows[item.first];
            row.cost.cycles += item.second.cycles;
            row.cost.executions += item.second.executions;
            row.balanced += 100.0 * double(item.second.cycles)/double(p.cycles)/double(profiles.size());
            ++row.benchmarks;
        }
    }
    std::vector<Row> result;
    uint64_t check = 0;
    for(auto& item : rows) {
        item.second.pooled = 100.0 * double(item.second.cost.cycles)/double(total);
        check += item.second.cost.cycles;
        result.push_back(item.second);
    }
    if(check != total) throw std::runtime_error("Instruction-mix aggregate cycles do not reconcile");
    std::sort(result.begin(), result.end(), [](Row const& a, Row const& b) {
        if(a.balanced != b.balanced) return a.balanced > b.balanced;
        return a.label < b.label;
    });
    return result;
}
void report(std::ostream& out, std::vector<Profile> const& profiles, Profile const& baseline,
            std::map<std::string, Encoding> const& catalogue,
            std::string const& identity, std::string const& optimization) {
    out.imbue(std::locale::classic());
    out << std::fixed << std::setprecision(3);
    auto families = aggregate(profiles, true), encodings = aggregate(profiles, false);
    uint64_t cycles = 0, executions = 0;
    for(auto const& p : profiles) { cycles += p.cycles; executions += p.executions; }
    for(auto const& row : encodings)
        if(!catalogue.count(row.label)) throw std::runtime_error("Executed form absent from decoder catalogue: " + row.label);
    out << "AVM instruction mix profiling report\n"
        << "Optimization: " << optimization << "; benchmarks: " << profiles.size() << "; AVM ABI v2\n"
        << identity << "\n"
        << "Metric: elapsed emulated AVR cycles between consecutive AVM primary-dispatch\n"
        << "boundaries, including dispatch and operand-dependent work. Interrupts suppressed.\n"
        << "Setup and both DEBUG_BREAK markers excluded; no estimated/rescaled costs.\n"
        << "Balanced %: mean of each workload's cycle share (equal workload weights).\n"
        << "Pooled %: share of all workload cycles summed together.\n"
        << "Encoding: MC operation + actual prefix; register/immediate values are operands,\n"
        << "not separate forms. Aliases use decoded operations, before assembly printing.\n"
        << "SYS service selectors are distinct operations, named by AVMSystemCalls.inc.\n"
        << "FPOLY Bytes=var (3+4*n). Cycles/op is pooled cycles / executions.\n"
        << "DEBUG_BREAK baseline: " << baseline.raw << " = leading " << baseline.leading
        << " + trailing " << baseline.trailing << " cycles.\n"
        << "Every workload: raw = leading + guest cycles + trailing; guest = raw - baseline.\n"
        << "Stepped profiling (merged AVR instructions disabled) equals normal measurement\n"
        << "for every workload and baseline. Per-PC, encoding and family totals reconcile exactly.\n"
        << "Rounded percentages may differ from 100% by the last printed decimal.\n\n";
    auto table = [&](std::vector<Row> const& rows, bool encoding) {
        out << std::left << std::setw(30) << (encoding ? "Encoding" : "Family");
        if(encoding) out << std::setw(12) << "Family" << std::right << std::setw(6) << "Bytes";
        out << std::right << std::setw(12) << "Balanced %" << std::setw(11) << "Pooled %"
            << std::setw(16) << "Total cycles" << std::setw(14) << "Executions" << std::setw(12) << "Cycles/op" << '\n';
        for(auto const& row : rows) {
            out << std::left << std::setw(30) << row.label;
            if(encoding) out << std::setw(12) << row.family << std::right << std::setw(6)
                            << (row.bytes ? std::to_string(row.bytes) : "var");
            out << std::right << std::setw(12) << row.balanced << std::setw(11) << row.pooled
                << std::setw(16) << row.cost.cycles << std::setw(14) << row.cost.executions
                << std::setw(12) << double(row.cost.cycles)/double(row.cost.executions) << '\n';
        }
        out << "TOTAL: balanced 100.000%; pooled 100.000%; " << cycles << " cycles; "
            << executions << " executions; " << double(cycles)/double(executions) << " cycles/op\n\n";
    };
    out << "Instruction families (descending balanced cycle share)\n";
    table(families, false);
    out << "Instruction encodings (descending balanced cycle share)\n";
    table(encodings, true);
    out << "Per-benchmark breakdown\n";
    for(auto const& p : profiles) {
        out << p.name << ": " << p.cycles << " cycles; " << p.executions << " executions; "
            << double(p.cycles)/double(p.executions) << " cycles/op\n"
            << "  raw " << p.raw << " - baseline " << baseline.raw << " = " << p.cycles
            << "; leading " << p.leading << "; trailing " << p.trailing << "; normal delta 0\n"
            << "  image SHA256 " << p.image_hash << "\n  Families:";
        auto local = aggregate({p}, true);
        for(size_t i = 0; i < std::min<size_t>(6, local.size()); ++i)
            out << ' ' << local[i].label << ' ' << local[i].pooled << '%';
        out << '\n';
    }
    out << "\nEncoding coverage\nDefined executable forms: " << catalogue.size()
        << "; observed: " << encodings.size() << "; never executed: " << catalogue.size()-encodings.size()
        << "\nReserved/invalid opcode slots and assembly pseudos excluded by the MC decoder.\n"
        << "Observed forms / workloads exercising them:\n";
    std::map<std::string, unsigned> observed;
    for(auto const& row : encodings) observed[row.label] = row.benchmarks;
    for(auto const& item : observed) out << "  " << std::left << std::setw(32) << item.first << std::right << item.second << '\n';
    out << "Unobserved executable forms:\n";
    for(auto const& item : catalogue) if(!observed.count(item.first)) out << "  " << item.first << '\n';
    out << "\nQuantitative summary\nHighest-cost families by balanced share:\n";
    for(size_t i = 0; i < std::min<size_t>(5, families.size()); ++i)
        out << "  " << families[i].label << ": " << families[i].balanced << "% balanced; " << families[i].pooled << "% pooled\n";
    out << "Top 10 encodings by balanced share (cumulative):\n";
    double cumulative = 0;
    for(size_t i = 0; i < std::min<size_t>(10, encodings.size()); ++i) {
        cumulative += encodings[i].balanced;
        out << "  " << std::left << std::setw(30) << encodings[i].label << std::right
            << std::setw(9) << encodings[i].balanced << "%  cumulative " << cumulative << "%\n";
    }
}
std::string file_hash(std::filesystem::path const& path) { return hash(read_file(path)); }
uint32_t boundary_table(std::filesystem::path const& metadata, std::filesystem::path const& interpreter) {
    auto text = read_file(metadata);
    if(number(text, "schema") != 1 || number(text, "primary_slot_words") != 4 || number(text, "primary_slot_count") != 256)
        throw std::runtime_error("Unsupported instruction-mix boundary metadata");
    if(text.find(file_hash(interpreter)) == std::string::npos)
        throw std::runtime_error("Interpreter SHA256 does not match boundary metadata; rebuild avm_interpreter_boundary");
    return number(text, "primary_table_avr_word");
}
} // namespace avm_mix
