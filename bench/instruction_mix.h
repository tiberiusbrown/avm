#pragma once

#include <cstdint>
#include <filesystem>
#include <iosfwd>
#include <map>
#include <memory>
#include <string>
#include <vector>

namespace absim { struct arduboy_t; }

namespace avm_mix {
struct Encoding {
    std::string label, mnemonic, family;
    unsigned bytes = 0; // zero denotes the variable-length FPOLY form
};
struct Instruction {
    Encoding encoding;
    std::vector<uint8_t> bytes;
};

// Uses the production MC decoder, before aliases in the assembly printer.
// Construct one per worker; registration is done once, before launching workers.
void initialize_decoder();
class Decoder {
    struct Impl;
    std::unique_ptr<Impl> impl;
public:
    Decoder();
    ~Decoder();
    Instruction decode(std::vector<uint8_t> const& image, uint32_t pc) const;
    std::map<std::string, Encoding> catalogue() const;
};
struct Counter { uint64_t cycles = 0, executions = 0; };
struct PcCounter {
    Instruction instruction;
    Counter cost;
};
struct Profile {
    std::string name, image_hash;
    uint64_t raw = 0, leading = 0, trailing = 0;
    uint64_t cycles = 0, executions = 0;
    std::map<uint32_t, PcCounter> pcs;
};
// Enter stopped at the first native DEBUG_BREAK, just like avm_bench.
Profile collect(absim::arduboy_t&, Decoder const&, uint32_t table_word);
void reconcile(Profile const&, Profile const& baseline, uint64_t normal_raw);
struct Row {
    std::string label, family;
    unsigned bytes = 0, benchmarks = 0;
    Counter cost;
    double balanced = 0, pooled = 0;
};
std::vector<Row> aggregate(std::vector<Profile> const&, bool families);
void report(std::ostream&, std::vector<Profile> const&, Profile const& baseline,
            std::map<std::string, Encoding> const& catalogue,
            std::string const& identity, std::string const& optimization);
std::string file_hash(std::filesystem::path const&);
uint32_t boundary_table(std::filesystem::path const& metadata,
                        std::filesystem::path const& interpreter);
} // namespace avm_mix
