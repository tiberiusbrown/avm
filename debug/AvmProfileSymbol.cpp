#include "AvmProfile.h"
#include "AvmHost.h"

#include <lldb/API/SBAddress.h>
#include <lldb/API/SBBlock.h>
#include <lldb/API/SBCompileUnit.h>
#include <lldb/API/SBData.h>
#include <lldb/API/SBDebugger.h>
#include <lldb/API/SBError.h>
#include <lldb/API/SBFileSpec.h>
#include <lldb/API/SBFunction.h>
#include <lldb/API/SBInstruction.h>
#include <lldb/API/SBInstructionList.h>
#include <lldb/API/SBLineEntry.h>
#include <lldb/API/SBSymbol.h>
#include <lldb/API/SBSymbolContext.h>
#include <lldb/API/SBTarget.h>

#include <algorithm>
#include <fstream>
#include <iomanip>
#include <iterator>
#include <map>
#include <sstream>
#include <stdexcept>

namespace avm_debug {
namespace {
namespace fs = std::filesystem;

std::string value_or_empty(char const* value) {
  return value ? value : "";
}

std::string file_path(lldb::SBFileSpec const& file) {
  if (!file.IsValid()) return {};
  std::vector<char> buffer(4096);
  auto size = file.GetPath(buffer.data(), buffer.size());
  if (size >= buffer.size()) {
    buffer.resize(size + 1);
    file.GetPath(buffer.data(), buffer.size());
  }
  return buffer.data();
}

std::string remap(std::string path, SourceMaps const& maps) {
  for (auto const& [old_prefix, new_prefix] : maps) {
    if (path.size() >= old_prefix.size() &&
        path.compare(0, old_prefix.size(), old_prefix) == 0) {
      path = new_prefix + path.substr(old_prefix.size());
      break;
    }
  }
  return path;
}

struct SourceFile {
  std::string hash;
  std::vector<std::string> lines;
};

SourceFile load_source(std::string const& path) {
  std::ifstream input(path, std::ios::binary);
  if (!input) return {};
  std::string bytes{std::istreambuf_iterator<char>(input), {}};
  SourceFile source;
  source.hash = hash_bytes(bytes);
  std::istringstream stream(bytes);
  std::string line;
  while (std::getline(stream, line)) {
    if (!line.empty() && line.back() == '\r') line.pop_back();
    source.lines.push_back(std::move(line));
  }
  return source;
}

std::string hex_bytes(lldb::SBInstruction instruction, lldb::SBTarget target) {
  lldb::SBData data = instruction.GetData(target);
  std::ostringstream output;
  for (size_t i = 0; i < std::min<size_t>(data.GetByteSize(), 16); ++i) {
    lldb::SBError error;
    unsigned byte = data.GetUnsignedInt8(error, i);
    if (error.Fail()) break;
    if (i) output << ' ';
    output << std::hex << std::setfill('0') << std::setw(2) << byte;
  }
  return output.str();
}

std::string read_file(fs::path const& path) {
  std::ifstream input(path, std::ios::binary);
  if (!input) throw std::runtime_error("cannot open " + path.string());
  return {std::istreambuf_iterator<char>(input), {}};
}

uint16_t u16(std::string const& bytes, size_t at) {
  if (at + 2 > bytes.size()) throw std::invalid_argument("truncated interpreter ELF");
  return uint16_t(uint8_t(bytes[at])) | uint16_t(uint8_t(bytes[at+1])) << 8;
}
uint32_t u32(std::string const& bytes, size_t at) {
  if (at + 4 > bytes.size()) throw std::invalid_argument("truncated interpreter ELF");
  return uint32_t(uint8_t(bytes[at])) | uint32_t(uint8_t(bytes[at+1])) << 8 |
         uint32_t(uint8_t(bytes[at+2])) << 16 |
         uint32_t(uint8_t(bytes[at+3])) << 24;
}

unsigned hex_digit(char c) {
  if (c >= '0' && c <= '9') return c - '0';
  if (c >= 'a' && c <= 'f') return c - 'a' + 10;
  if (c >= 'A' && c <= 'F') return c - 'A' + 10;
  throw std::invalid_argument("invalid interpreter Intel HEX digit");
}
uint8_t hex_byte(std::string const& line, size_t offset) {
  if (offset + 2 > line.size())
    throw std::invalid_argument("truncated interpreter Intel HEX record");
  return uint8_t((hex_digit(line[offset]) << 4) | hex_digit(line[offset+1]));
}

std::map<uint32_t, uint8_t> parse_hex(std::string const& bytes) {
  std::istringstream input(bytes);
  std::map<uint32_t, uint8_t> result;
  std::string line;
  uint32_t base = 0;
  while (std::getline(input, line)) {
    if (!line.empty() && line.back() == '\r') line.pop_back();
    if (line.empty()) continue;
    if (line[0] != ':' || line.size() < 11)
      throw std::invalid_argument("invalid interpreter Intel HEX record");
    uint8_t count = hex_byte(line, 1);
    if (line.size() != 11u + 2u * count)
      throw std::invalid_argument("invalid interpreter Intel HEX length");
    uint16_t address = uint16_t(hex_byte(line, 3) << 8 | hex_byte(line, 5));
    uint8_t type = hex_byte(line, 7);
    unsigned checksum = count + (address >> 8) + (address & 255) + type;
    for (size_t i = 0; i < count; ++i) checksum += hex_byte(line, 9 + i * 2);
    checksum += hex_byte(line, 9 + count * 2);
    if ((checksum & 255) != 0)
      throw std::invalid_argument("invalid interpreter Intel HEX checksum");
    if (type == 0) {
      for (uint32_t i = 0; i < count; ++i)
        result[base + address + i] = hex_byte(line, 9 + i * 2);
    } else if (type == 4 && count == 2) {
      base = uint32_t(hex_byte(line, 9) << 8 | hex_byte(line, 11)) << 16;
    } else if (type == 2 && count == 2) {
      base = uint32_t(hex_byte(line, 9) << 8 | hex_byte(line, 11)) << 4;
    } else if (type != 1 && type != 3 && type != 5) {
      throw std::invalid_argument("unsupported interpreter Intel HEX record");
    }
  }
  return result;
}

struct Section { uint32_t name, type, address, offset, size, link, entry_size; };
std::string section_string(std::string const& bytes, Section const& strings,
                           uint32_t offset) {
  if (offset >= strings.size || uint64_t(strings.offset) + strings.size > bytes.size())
    return {};
  size_t start = size_t(strings.offset) + offset;
  size_t end = bytes.find('\0', start);
  if (end == std::string::npos || end >= size_t(strings.offset) + strings.size)
    return {};
  return bytes.substr(start, end - start);
}
} // namespace

void symbolize_profile(ProfileDocument& profile, fs::path const& elf,
                       SourceMaps const& source_maps) {
  lldb::SBDebugger debugger = lldb::SBDebugger::Create(false);
  if (!debugger.IsValid()) throw std::runtime_error("cannot create LLDB symbolizer");
  struct Cleanup {
    lldb::SBDebugger& debugger;
    ~Cleanup() { lldb::SBDebugger::Destroy(debugger); }
  } cleanup{debugger};
  lldb::SBError error;
  std::string elf_name = elf.string();
  lldb::SBTarget target = debugger.CreateTarget(elf_name.c_str(), nullptr,
                                                 nullptr, false, error);
  if (!target.IsValid())
    throw std::runtime_error("LLDB cannot open AVM ELF: " +
                             std::string(error.GetCString() ? error.GetCString() : "unknown error"));
  std::map<std::string, SourceFile> sources;
  for (auto& row : profile.pcs) {
    lldb::SBAddress address = target.ResolveFileAddress(row.pc);
    if (!address.IsValid()) {
      row.function = row.linkage = "<unmapped>";
      continue;
    }
    lldb::SBSymbolContext context = address.GetSymbolContext(
        lldb::eSymbolContextCompUnit | lldb::eSymbolContextFunction |
        lldb::eSymbolContextBlock | lldb::eSymbolContextLineEntry |
        lldb::eSymbolContextSymbol);
    lldb::SBFunction function = context.GetFunction();
    lldb::SBSymbol symbol = context.GetSymbol();
    row.function = value_or_empty(function.IsValid() ? function.GetName()
                                                     : symbol.GetName());
    row.linkage = value_or_empty(function.IsValid() ? function.GetMangledName()
                                                    : symbol.GetMangledName());
    if (row.linkage.empty()) row.linkage = row.function;
    if (row.function.empty()) row.function = "<unmapped>";
    if (row.linkage.empty()) row.linkage = "<unmapped>";
    row.compilation_unit = file_path(context.GetCompileUnit().GetFileSpec());
    lldb::SBLineEntry line = context.GetLineEntry();
    if (line.IsValid()) {
      row.file = file_path(line.GetFileSpec());
      row.line = line.GetLine();
      row.column = line.GetColumn();
      std::string local = remap(row.file, source_maps);
      auto [source, inserted] = sources.try_emplace(local);
      if (inserted) source->second = load_source(local);
      row.source_hash = source->second.hash;
      if (row.line && row.line <= source->second.lines.size())
        row.source_text = source->second.lines[row.line - 1];
    }
    for (lldb::SBBlock block = context.GetBlock(); block.IsValid();
         block = block.GetParent()) {
      if (!block.IsInlined()) continue;
      row.inline_chain.push_back({value_or_empty(block.GetInlinedName()),
                                  file_path(block.GetInlinedCallSiteFile()),
                                  block.GetInlinedCallSiteLine(),
                                  block.GetInlinedCallSiteColumn()});
    }
    lldb::SBInstructionList instructions = target.ReadInstructions(address, 1);
    if (instructions.GetSize()) {
      lldb::SBInstruction instruction = instructions.GetInstructionAtIndex(0);
      row.bytes = hex_bytes(instruction, target);
      row.assembly = value_or_empty(instruction.GetMnemonic(target));
      std::string operands = value_or_empty(instruction.GetOperands(target));
      if (!operands.empty()) row.assembly += " " + operands;
    }
  }
}

void refresh_profile_sources(ProfileDocument& profile,
                             SourceMaps const& source_maps) {
  std::map<std::string, SourceFile> sources;
  for (auto& row : profile.pcs) {
    if (row.file.empty()) continue;
    std::string local = remap(row.file, source_maps);
    auto [found, inserted] = sources.try_emplace(local);
    if (inserted) found->second = load_source(local);
    if (found->second.hash.empty()) continue;
    // The recorded hash identifies the baseline even when a later checkout
    // has replaced that path. Only display text from the matching revision.
    if (row.source_hash.empty()) row.source_hash = found->second.hash;
    if (row.source_hash == found->second.hash && row.line &&
        row.line <= found->second.lines.size())
      row.source_text = found->second.lines[row.line - 1];
  }
}

void symbolize_native(ProfileDocument& profile, fs::path const& interpreter_elf,
                      fs::path const& interpreter_hex) {
  if (!profile.window.native) return;
  std::string elf = read_file(interpreter_elf);
  if (elf.size() < 52 || elf.substr(0, 4) != "\x7f" "ELF" ||
      uint8_t(elf[4]) != 1 || uint8_t(elf[5]) != 1 || u16(elf, 18) != 83)
    throw std::invalid_argument("expected an AVR ELF32LE interpreter");
  uint32_t table_offset = u32(elf, 32);
  uint16_t section_size = u16(elf, 46);
  uint16_t section_count = u16(elf, 48);
  uint16_t names_index = u16(elf, 50);
  if (section_size < 40 || !section_count || names_index >= section_count ||
      uint64_t(table_offset) + uint64_t(section_size) * section_count > elf.size())
    throw std::invalid_argument("invalid interpreter ELF sections");
  std::vector<Section> sections;
  for (uint32_t i = 0; i < section_count; ++i) {
    size_t at = size_t(table_offset) + i * section_size;
    sections.push_back({u32(elf, at), u32(elf, at+4), u32(elf, at+12),
                        u32(elf, at+16), u32(elf, at+20), u32(elf, at+24),
                        u32(elf, at+36)});
  }
  std::map<uint32_t, uint8_t> hex = parse_hex(read_file(interpreter_hex));
  bool checked_text = false;
  uint16_t text_index = 0;
  for (uint16_t i = 0; i < sections.size(); ++i) {
    auto const& section = sections[i];
    if (section_string(elf, sections[names_index], section.name) != ".text")
      continue;
    if (uint64_t(section.offset) + section.size > elf.size())
      throw std::invalid_argument("truncated interpreter ELF .text");
    for (uint32_t j = 0; j < section.size; ++j) {
      auto found = hex.find(section.address + j);
      if (found == hex.end() || found->second != uint8_t(elf[section.offset+j]))
        throw std::invalid_argument("interpreter ELF does not match interp.hex");
    }
    checked_text = true;
    text_index = i;
    break;
  }
  if (!checked_text) throw std::invalid_argument("interpreter ELF lacks .text");
  std::map<uint32_t, std::string> symbols;
  for (auto const& section : sections) {
    if (section.type != 2 || section.entry_size < 16 ||
        section.link >= sections.size() ||
        uint64_t(section.offset) + section.size > elf.size())
      continue;
    auto const& strings = sections[section.link];
    for (uint32_t j = 0; j + 16 <= section.size; j += section.entry_size) {
      size_t at = size_t(section.offset) + j;
      uint8_t info = uint8_t(elf[at+12]);
      uint16_t belonging = u16(elf, at+14);
      if (belonging != text_index || (info >> 4) == 0) continue;
      uint32_t address = u32(elf, at+4);
      std::string name = section_string(elf, strings, u32(elf, at));
      if (!name.empty()) symbols.emplace(address, std::move(name));
    }
  }
  for (auto& row : profile.native_pcs) {
    auto next = symbols.upper_bound(row.address);
    if (next != symbols.begin()) {
      --next;
      row.symbol = next->second;
    }
  }
  profile.interpreter_elf_sha256 = hash_bytes(elf);
}

} // namespace avm_debug
