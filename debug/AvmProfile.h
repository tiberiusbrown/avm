#pragma once

#include "AvmEmulator.h"

#include <cstdint>
#include <filesystem>
#include <iosfwd>
#include <map>
#include <string>
#include <utility>
#include <vector>

namespace avm_debug {

struct InlineLocation {
  std::string name;
  std::string file;
  uint32_t line = 0;
  uint32_t column = 0;
};

struct ProfilePC {
  uint32_t pc = 0;
  ProfileCounter cost;
  std::string bytes;
  std::string assembly;
  std::string function;
  std::string linkage;
  std::string compilation_unit;
  std::string file;
  uint32_t line = 0;
  uint32_t column = 0;
  std::string source_hash;
  std::string source_text;
  std::vector<InlineLocation> inline_chain;
};

struct NativePC {
  uint32_t address = 0;
  uint64_t cycles = 0;
  std::string symbol;
};

struct ProfileDocument {
  ProfileSnapshot window;
  uint64_t requested_end_cycle = 0; // 0 for an interactive open-ended window
  ReplayIdentity identity;
  std::string replay_event_hash;
  std::string replay_provenance;
  std::string end_display_hash;
  std::string interpreter_elf_sha256;
  std::vector<ProfilePC> pcs;
  std::vector<NativePC> native_pcs;
};

using SourceMaps = std::vector<std::pair<std::string, std::string>>;

ProfileDocument make_profile(ProfileSnapshot const& snapshot,
                             ReplayIdentity const& identity,
                             uint64_t requested_end_cycle,
                             std::string replay_event_hash,
                             std::string end_display_hash,
                             std::string replay_provenance = {});
void symbolize_profile(ProfileDocument& profile,
                       std::filesystem::path const& elf,
                       SourceMaps const& source_maps = {});
void refresh_profile_sources(ProfileDocument& profile,
                             SourceMaps const& source_maps);
void symbolize_native(ProfileDocument& profile,
                      std::filesystem::path const& interpreter_elf,
                      std::filesystem::path const& interpreter_hex);
void write_profile(std::filesystem::path const& path,
                   ProfileDocument const& profile);
ProfileDocument read_profile(std::filesystem::path const& path);
void print_profile(std::ostream& out, ProfileDocument const& profile,
                   size_t top = 20);
void write_report_html(std::filesystem::path const& path,
                       ProfileDocument const& profile);
void print_diff(std::ostream& out, ProfileDocument const& before,
                ProfileDocument const& after, size_t top = 20);
void write_diff_html(std::filesystem::path const& path,
                     ProfileDocument const& before,
                     ProfileDocument const& after);

} // namespace avm_debug
