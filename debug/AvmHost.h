#pragma once

#include "AvmEmulator.h"

#include <filesystem>
#include <string>
#include <vector>

namespace avm_debug {

struct RuntimePaths {
  std::filesystem::path image_tool;
  std::filesystem::path firmware;
  std::filesystem::path boundary;
  std::filesystem::path interpreter_elf;
};

RuntimePaths runtime_paths(char const* program_name);
std::filesystem::path temporary_image_path(char const* prefix);
void package_image(std::filesystem::path const& tool,
                   std::filesystem::path const& elf,
                   std::filesystem::path const& image);
uint64_t duration_cycles(std::string text);
std::string hash_bytes(std::string const& bytes);
std::string hash_file(std::filesystem::path const& path);

struct ReplaySchedule {
  std::vector<TimedButtons> events;
  std::string event_hash;
  std::string provenance;
};

// The identity block of an exported replay is strict. An identity-free v1
// schedule can be used across builds; provenance is deliberately nonbinding.
ReplaySchedule read_replay(std::filesystem::path const& path,
                           ReplayIdentity const& actual, uint64_t start_cycle);
void write_portable_replay(std::filesystem::path const& input,
                           std::filesystem::path const& output);

} // namespace avm_debug
