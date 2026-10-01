#include "AvmProfile.h"

#include <algorithm>
#include <fstream>
#include <iomanip>
#include <map>
#include <ostream>
#include <set>
#include <sstream>
#include <stdexcept>
#include <tuple>

namespace avm_debug {
namespace {
namespace fs = std::filesystem;

struct Cost { uint64_t cycles = 0, count = 0; };
using FunctionKey = std::pair<std::string, std::string>;
using LineKey = std::tuple<std::string, std::string, uint32_t>;
using InlineKey = std::tuple<std::string, std::string, uint32_t, uint32_t>;

void add(uint64_t& target, uint64_t value) {
  if (value > UINT64_MAX - target)
    throw std::overflow_error("profile aggregation overflows 64 bits");
  target += value;
}

std::map<FunctionKey, Cost> functions(ProfileDocument const& profile) {
  std::map<FunctionKey, Cost> result;
  for (auto const& row : profile.pcs) {
    auto& cost = result[{row.linkage.empty() ? "<unmapped>" : row.linkage,
                         row.compilation_unit}];
    add(cost.cycles, row.cost.cycles);
    add(cost.count, row.cost.count);
  }
  return result;
}

std::map<LineKey, Cost> lines(ProfileDocument const& profile) {
  std::map<LineKey, Cost> result;
  for (auto const& row : profile.pcs) {
    auto& cost = result[{row.file.empty() ? "<unmapped>" : row.file,
                         row.source_hash, row.line}];
    add(cost.cycles, row.cost.cycles);
    add(cost.count, row.cost.count);
  }
  return result;
}

std::map<InlineKey, Cost> inline_sites(ProfileDocument const& profile) {
  std::map<InlineKey, Cost> result;
  for (auto const& row : profile.pcs) {
    std::set<InlineKey> visited;
    for (auto const& frame : row.inline_chain) {
      InlineKey key{frame.name, frame.file, frame.line, frame.column};
      if (!visited.insert(key).second) continue;
      auto& cost = result[key];
      add(cost.cycles, row.cost.cycles);
      add(cost.count, row.cost.count);
    }
  }
  return result;
}

template <typename Key>
std::vector<std::pair<Key, Cost>> hottest(std::map<Key, Cost> const& costs) {
  std::vector<std::pair<Key, Cost>> result(costs.begin(), costs.end());
  std::sort(result.begin(), result.end(), [](auto const& a, auto const& b) {
    return a.second.cycles != b.second.cycles
        ? a.second.cycles > b.second.cycles : a.first < b.first;
  });
  return result;
}

std::string escape(std::string const& value) {
  std::string result;
  for (char c : value) {
    switch (c) {
    case '&': result += "&amp;"; break;
    case '<': result += "&lt;"; break;
    case '>': result += "&gt;"; break;
    case '"': result += "&quot;"; break;
    case '\'': result += "&#39;"; break;
    default: result += c; break;
    }
  }
  return result;
}

std::string signed_change(uint64_t before, uint64_t after) {
  if (after >= before) return "+" + std::to_string(after - before);
  return "-" + std::to_string(before - after);
}

std::string percentage(uint64_t before, uint64_t after) {
  if (!before) return after ? "new" : "0.0%";
  long double change = after >= before
      ? static_cast<long double>(after - before)
      : -static_cast<long double>(before - after);
  std::ostringstream output;
  output << std::fixed << std::setprecision(1)
         << (100.0L * change / static_cast<long double>(before)) << '%';
  return output.str();
}

std::string window_line(ProfileDocument const& profile) {
  auto const& w = profile.window;
  std::ostringstream result;
  result << "Elapsed emulated cycles: " << w.end_cycle - w.start_cycle
         << " (" << w.start_cycle << " to " << w.end_cycle << ")"
         << "; completed intervals " << w.completed_cycles
         << "; partial/unattributed " << w.partial_cycles
         << "; " << (w.complete ? "complete" : "INCOMPLETE")
         << "; stop " << w.stop_reason;
  if (profile.requested_end_cycle)
    result << "; requested end " << profile.requested_end_cycle;
  if (w.discontinuities)
    result << "; PC writes " << w.discontinuities;
  return result.str();
}

uint64_t unmapped(ProfileDocument const& profile) {
  uint64_t result = profile.window.partial_cycles;
  for (auto const& row : profile.pcs)
    if (row.file.empty() || !row.line) add(result, row.cost.cycles);
  return result;
}

void html_open(std::ostream& out, char const* title) {
  out << "<!doctype html><html lang=\"en\"><meta charset=\"utf-8\">"
         "<title>" << title << "</title><style>"
         "body{font:15px system-ui,sans-serif;max-width:1250px;margin:2rem auto;"
         "padding:0 1rem;color:#18202b;background:#fbfcfe}h1,h2{color:#17365b}"
         "table{border-collapse:collapse;width:100%;margin:1rem 0 2rem}"
         "th,td{padding:.5rem .6rem;border-bottom:1px solid #d9e1e8;text-align:left;"
         "vertical-align:top}th{cursor:pointer;background:#eaf0f7;position:sticky;top:0}"
         "td.num{font-variant-numeric:tabular-nums;text-align:right}"
         "code,pre{font:13px ui-monospace,Consolas,monospace;white-space:pre-wrap}"
         "details{margin:.4rem 0}summary{cursor:pointer}"
         ".muted{color:#5d6876}.warn{background:#fff1dc;border-left:4px solid #a65700;"
         "padding:.6rem}.hot{display:inline-block;min-width:4px;height:1rem;"
         "background:#c34238;vertical-align:middle;margin-right:.4rem}"
         "</style><main><h1>" << title << "</h1>";
}

void html_close(std::ostream& out) {
  out << "</main><script>document.querySelectorAll('th[data-col]').forEach(h=>"
         "h.onclick=()=>{let t=h.closest('table'),b=t.tBodies[0],i=Number(h.dataset.col),"
         "num=h.dataset.num==='1',desc=h.dataset.desc!=='1';"
         "[...b.rows].sort((a,z)=>{let x=a.cells[i].dataset.sort??a.cells[i].textContent,"
         "y=z.cells[i].dataset.sort??z.cells[i].textContent;"
         "let q=num?(BigInt(x)<BigInt(y)?-1:BigInt(x)>BigInt(y)?1:0):"
         "x.localeCompare(y);return desc?-q:q}).forEach(r=>b.appendChild(r));"
         "h.dataset.desc=desc?'1':'0'})</script></html>\n";
}

std::vector<std::string> warnings(ProfileDocument const& before,
                                  ProfileDocument const& after) {
  std::vector<std::string> result;
  auto compare = [&](std::string const& a, std::string const& b,
                     char const* name) {
    if (a != b) result.emplace_back(std::string(name) + " differs");
  };
  compare(before.identity.elf_sha256, after.identity.elf_sha256, "AVM ELF");
  compare(before.identity.image_sha256, after.identity.image_sha256, "packaged image");
  compare(before.identity.interpreter_sha256,
          after.identity.interpreter_sha256, "interpreter firmware");
  compare(before.replay_event_hash, after.replay_event_hash, "replay schedule");
  uint64_t before_requested = before.requested_end_cycle
      ? before.requested_end_cycle - before.window.start_cycle : 0;
  uint64_t after_requested = after.requested_end_cycle
      ? after.requested_end_cycle - after.window.start_cycle : 0;
  if (before.window.end_cycle - before.window.start_cycle !=
      after.window.end_cycle - after.window.start_cycle ||
      before_requested != after_requested)
    result.emplace_back("measurement window length differs");
  compare(before.identity.eeprom_sha256, after.identity.eeprom_sha256,
          "initial EEPROM");
  compare(before.identity.fxsave_sha256, after.identity.fxsave_sha256,
          "initial FX save");
  if (before.identity.adc_seed != after.identity.adc_seed ||
      before.identity.adc_nondeterminism != after.identity.adc_nondeterminism ||
      before.identity.usb_bus_state != after.identity.usb_bus_state)
    result.emplace_back("initial ADC or USB peripheral state differs");
  if (before.window.end_pc != after.window.end_pc)
    result.emplace_back("end AVM PC differs");
  compare(before.end_display_hash, after.end_display_hash, "end display hash");
  std::map<std::string, std::set<std::string>> source_hashes;
  for (auto const& row : before.pcs)
    if (!row.file.empty() && !row.source_hash.empty())
      source_hashes[row.file].insert(row.source_hash);
  for (auto const& row : after.pcs) {
    auto found = source_hashes.find(row.file);
    if (found != source_hashes.end() && !row.source_hash.empty() &&
        !found->second.count(row.source_hash)) {
      result.emplace_back("source revision differs: " + row.file);
      source_hashes.erase(found);
    }
  }
  if (!before.window.complete || !after.window.complete)
    result.emplace_back("one or both profiles are incomplete");
  return result;
}

template <typename Key>
std::vector<std::tuple<Key, Cost, Cost>> paired(std::map<Key, Cost> const& a,
                                                std::map<Key, Cost> const& b) {
  std::set<Key> keys;
  for (auto const& item : a) keys.insert(item.first);
  for (auto const& item : b) keys.insert(item.first);
  std::vector<std::tuple<Key, Cost, Cost>> result;
  for (auto const& key : keys) {
    auto old = a.find(key), now = b.find(key);
    result.emplace_back(key, old == a.end() ? Cost{} : old->second,
                        now == b.end() ? Cost{} : now->second);
  }
  std::sort(result.begin(), result.end(), [](auto const& x, auto const& y) {
    auto const& a = std::get<1>(x);
    auto const& b = std::get<2>(x);
    auto const& c = std::get<1>(y);
    auto const& d = std::get<2>(y);
    uint64_t xmag = a.cycles >= b.cycles ? a.cycles-b.cycles : b.cycles-a.cycles;
    uint64_t ymag = c.cycles >= d.cycles ? c.cycles-d.cycles : d.cycles-c.cycles;
    return xmag > ymag;
  });
  return result;
}

struct LineSample {
  std::string file;
  std::string hash;
  uint32_t line = 0;
  Cost cost;
};

std::vector<LineSample> line_samples(ProfileDocument const& profile) {
  std::map<std::pair<std::string, uint32_t>, LineSample> gathered;
  for (auto const& row : profile.pcs) {
    auto file = row.file.empty() ? "<unmapped>" : row.file;
    auto& sample = gathered[{file, row.line}];
    sample.file = file;
    sample.line = row.line;
    if (sample.hash.empty()) sample.hash = row.source_hash;
    else if (sample.hash != row.source_hash) sample.hash.clear();
    add(sample.cost.cycles, row.cost.cycles);
    add(sample.cost.count, row.cost.count);
  }
  std::vector<LineSample> result;
  for (auto& [key, value] : gathered) result.push_back(std::move(value));
  return result;
}

std::vector<std::pair<LineSample, LineSample>> paired_lines(
    ProfileDocument const& before, ProfileDocument const& after) {
  auto older = line_samples(before), newer = line_samples(after);
  std::vector<bool> used(newer.size());
  std::vector<std::pair<LineSample, LineSample>> result;
  for (auto const& old : older) {
    size_t match = newer.size();
    for (size_t i = 0; i < newer.size(); ++i)
      if (!used[i] && old.file == newer[i].file &&
          old.line == newer[i].line) { match = i; break; }
    if (match == newer.size() && !old.hash.empty())
      for (size_t i = 0; i < newer.size(); ++i)
        if (!used[i] && old.hash == newer[i].hash &&
            old.line == newer[i].line) { match = i; break; }
    if (match == newer.size()) result.emplace_back(old, LineSample{});
    else { used[match] = true; result.emplace_back(old, newer[match]); }
  }
  for (size_t i = 0; i < newer.size(); ++i)
    if (!used[i]) result.emplace_back(LineSample{}, newer[i]);
  std::sort(result.begin(), result.end(), [](auto const& a, auto const& b) {
    auto magnitude = [](auto const& pair) {
      uint64_t x = pair.first.cost.cycles, y = pair.second.cost.cycles;
      return x >= y ? x - y : y - x;
    };
    return magnitude(a) > magnitude(b);
  });
  return result;
}

bool tentative(LineSample const& old, LineSample const& now) {
  return old.hash.empty() || now.hash.empty() || old.hash != now.hash;
}

void warning_html(std::ostream& out, std::vector<std::string> const& issues) {
  if (issues.empty()) { out << "<p>No workload identity differences detected.</p>"; return; }
  out << "<div class=\"warn\"><strong>Workload drift checks</strong><ul>";
  for (auto const& issue : issues) out << "<li>" << escape(issue) << "</li>";
  out << "</ul><small>Matching identities cannot prove equivalent program behavior."
         "</small></div>";
}
} // namespace

void print_profile(std::ostream& out, ProfileDocument const& profile, size_t top) {
  out << window_line(profile) << '\n';
  out << "Unmapped or partial cycles: " << unmapped(profile) << '\n';
  out << "Hottest functions (elapsed emulated cycles, AVM executions):\n";
  auto sorted_functions = hottest(functions(profile));
  for (size_t i = 0; i < std::min(top, sorted_functions.size()); ++i)
    out << "  " << sorted_functions[i].second.cycles << "  "
        << sorted_functions[i].second.count << "  "
        << sorted_functions[i].first.first << "  "
        << sorted_functions[i].first.second << '\n';
  out << "Hottest source lines:\n";
  auto sorted_lines = hottest(lines(profile));
  for (size_t i = 0; i < std::min(top, sorted_lines.size()); ++i)
    out << "  " << sorted_lines[i].second.cycles << "  "
        << sorted_lines[i].second.count << "  "
        << std::get<0>(sorted_lines[i].first) << ':'
        << std::get<2>(sorted_lines[i].first) << '\n';
  auto sorted_inlines = hottest(inline_sites(profile));
  if (!sorted_inlines.empty()) {
    out << "Inclusive inline call sites (each PC counted once per site):\n";
    for (size_t i = 0; i < std::min(top, sorted_inlines.size()); ++i)
      out << "  " << sorted_inlines[i].second.cycles << "  "
          << sorted_inlines[i].second.count << "  "
          << std::get<0>(sorted_inlines[i].first) << " at "
          << std::get<1>(sorted_inlines[i].first) << ':'
          << std::get<2>(sorted_inlines[i].first) << '\n';
  }
  if (profile.window.native) {
    uint64_t classified = 0;
    for (auto const& row : profile.native_pcs) add(classified, row.cycles);
    out << "Native interpreter: active " << profile.window.native_active_cycles
        << ", elapsed " << profile.window.native_elapsed_cycles
        << ", waiting/idle " << profile.window.native_elapsed_cycles -
                                    profile.window.native_active_cycles
        << ", unclassified active " << profile.window.native_active_cycles -
                                       classified << '\n';
    auto native = profile.native_pcs;
    std::sort(native.begin(), native.end(), [](auto const& a, auto const& b) {
      return a.cycles > b.cycles;
    });
    for (size_t i = 0; i < std::min(top, native.size()); ++i)
      out << "  " << native[i].cycles << "  AVR 0x" << std::hex
          << native[i].address << std::dec << "  " << native[i].symbol << '\n';
  }
}

void write_report_html(fs::path const& path, ProfileDocument const& profile) {
  if (fs::exists(path)) throw std::invalid_argument("HTML output already exists");
  std::ofstream out(path, std::ios::binary);
  if (!out) throw std::runtime_error("cannot create HTML report");
  html_open(out, "AVM source profile");
  out << "<p>" << escape(window_line(profile)) << "</p><p>Unmapped or partial "
      << "cycles: " << unmapped(profile) << ". The primary metric includes "
      << "native interpreter work and interrupt or wait time between AVM "
      << "instruction boundaries.</p>";
  out << "<h2>Functions</h2><table><thead><tr><th data-col=\"0\">Function"
         "</th><th data-col=\"1\">Compilation unit</th><th data-col=\"2\" "
         "data-num=\"1\">Cycles</th><th data-col=\"3\" data-num=\"1\">"
         "Executions</th></tr></thead><tbody>";
  for (auto const& [key, cost] : hottest(functions(profile)))
    out << "<tr><td><code>" << escape(key.first) << "</code></td><td>"
        << escape(key.second) << "</td><td class=\"num\">" << cost.cycles
        << "</td><td class=\"num\">" << cost.count << "</td></tr>";
  out << "</tbody></table><h2>Source heat map and AVM instructions</h2>";
  auto sorted_lines = hottest(lines(profile));
  uint64_t hottest_line = sorted_lines.empty() ? 0 : sorted_lines.front().second.cycles;
  out << "<table><thead><tr><th data-col=\"0\">Location</th>"
         "<th data-col=\"1\" data-num=\"1\">Cycles</th>"
         "<th data-col=\"2\" data-num=\"1\">Executions</th>"
         "<th data-col=\"3\">Source and drill-down</th></tr></thead><tbody>";
  for (auto const& [key, cost] : sorted_lines) {
    auto const& file = std::get<0>(key);
    auto line = std::get<2>(key);
    unsigned heat = hottest_line ? unsigned(100.0L * cost.cycles / hottest_line) : 0;
    out << "<tr><td>" << escape(file) << ':' << line << "</td><td class=\"num\">"
        << cost.cycles << "</td><td class=\"num\">" << cost.count
        << "</td><td><span class=\"hot\" style=\"width:" << heat
        << "px\"></span>";
    std::string source;
    for (auto const& row : profile.pcs)
      if (row.file == file && row.source_hash == std::get<1>(key) &&
          row.line == line && !row.source_text.empty()) {
        source = row.source_text; break;
      }
    if (!source.empty()) out << "<code>" << escape(source) << "</code>";
    else out << "<span class=\"muted\">source unavailable</span>";
    out << "<details><summary>AVM instruction costs</summary><table><tr>"
           "<th>PC</th><th>Cycles</th><th>Executions</th><th>Bytes</th>"
           "<th>Disassembly</th><th>Inline chain</th></tr>";
    for (auto const& row : profile.pcs) {
      if (row.file != file || row.source_hash != std::get<1>(key) ||
          row.line != line) continue;
      out << "<tr><td><code>0x" << std::hex << row.pc << std::dec
          << "</code></td><td>" << row.cost.cycles << "</td><td>"
          << row.cost.count << "</td><td><code>" << escape(row.bytes)
          << "</code></td><td><code>" << escape(row.assembly)
          << "</code></td><td>";
      for (auto const& frame : row.inline_chain)
        out << escape(frame.name) << " at " << escape(frame.file) << ':'
            << frame.line << " &larr; ";
      out << "</td></tr>";
    }
    out << "</table></details></td></tr>";
  }
  out << "</tbody></table>";
  auto sorted_inlines = hottest(inline_sites(profile));
  if (!sorted_inlines.empty()) {
    out << "<h2>Inclusive inline call sites</h2><p>Each AVM PC contributes "
           "once to each containing inline call site.</p><table><tr>"
           "<th>Inline function</th><th>Call site</th><th>Cycles</th>"
           "<th>Executions</th></tr>";
    for (auto const& [key, cost] : sorted_inlines)
      out << "<tr><td><code>" << escape(std::get<0>(key))
          << "</code></td><td>" << escape(std::get<1>(key)) << ':'
          << std::get<2>(key) << ':' << std::get<3>(key)
          << "</td><td>" << cost.cycles << "</td><td>"
          << cost.count << "</td></tr>";
    out << "</table>";
  }
  if (profile.window.native) {
    uint64_t classified = 0;
    for (auto const& row : profile.native_pcs) add(classified, row.cycles);
    out << "<h2>Native AVR interpreter hotspots</h2><p>Active cycles: "
        << profile.window.native_active_cycles << "; waiting/idle: "
        << profile.window.native_elapsed_cycles - profile.window.native_active_cycles
        << "; unclassified active cycles: "
        << profile.window.native_active_cycles - classified
        << ". These are AVR addresses, separate from AVM source costs.</p>"
           "<table><tr><th>AVR byte address</th><th>Routine</th><th>Cycles</th></tr>";
    auto native = profile.native_pcs;
    std::sort(native.begin(), native.end(), [](auto const& a, auto const& b) {
      return a.cycles > b.cycles;
    });
    for (auto const& row : native)
      out << "<tr><td>0x" << std::hex << row.address << std::dec
          << "</td><td>" << escape(row.symbol) << "</td><td>" << row.cycles
          << "</td></tr>";
    out << "</table>";
  }
  html_close(out);
  out.close();
  if (!out) throw std::runtime_error("HTML report write failed");
}

void print_diff(std::ostream& out, ProfileDocument const& before,
                ProfileDocument const& after, size_t top) {
  for (auto const& issue : warnings(before, after))
    out << "WARNING: " << issue << '\n';
  uint64_t old_total = before.window.end_cycle - before.window.start_cycle;
  uint64_t new_total = after.window.end_cycle - after.window.start_cycle;
  uint64_t old_executions = 0, new_executions = 0;
  for (auto const& row : before.pcs) add(old_executions, row.cost.count);
  for (auto const& row : after.pcs) add(new_executions, row.cost.count);
  out << "Total elapsed emulated cycles: " << old_total << " -> " << new_total
      << " (" << signed_change(old_total, new_total) << ", "
      << percentage(old_total, new_total) << ")\n";
  out << "Total AVM executions: " << old_executions << " -> "
      << new_executions << " ("
      << signed_change(old_executions, new_executions) << ", "
      << percentage(old_executions, new_executions) << ")\n";
  out << "Functions: before -> after cycles (delta, percent), executions delta\n";
  auto rows = paired(functions(before), functions(after));
  for (size_t i = 0; i < std::min(top, rows.size()); ++i) {
    auto const& [key, old, now] = rows[i];
    out << "  " << key.first << " [" << key.second << "]: "
        << old.cycles << " -> " << now.cycles << " ("
        << signed_change(old.cycles, now.cycles) << ", "
        << percentage(old.cycles, now.cycles) << "), executions "
        << signed_change(old.count, now.count) << '\n';
  }
  out << "Source lines (different hashes are tentative):\n";
  auto line_rows = paired_lines(before, after);
  for (size_t i = 0; i < std::min(top, line_rows.size()); ++i) {
    auto const& [old, now] = line_rows[i];
    auto const& shown = old.file.empty() ? now : old;
    out << "  " << shown.file << ':' << shown.line
        << " [" << (tentative(old, now) ? "tentative" : "matching source")
        << "]: " << old.cost.cycles << " -> " << now.cost.cycles << " ("
        << signed_change(old.cost.cycles, now.cost.cycles) << ", "
        << percentage(old.cost.cycles, now.cost.cycles) << "), executions "
        << signed_change(old.cost.count, now.cost.count) << '\n';
  }
}

void write_diff_html(fs::path const& path, ProfileDocument const& before,
                     ProfileDocument const& after) {
  if (fs::exists(path)) throw std::invalid_argument("HTML output already exists");
  std::ofstream out(path, std::ios::binary);
  if (!out) throw std::runtime_error("cannot create diff HTML");
  html_open(out, "AVM profile comparison");
  warning_html(out, warnings(before, after));
  uint64_t old_total = before.window.end_cycle - before.window.start_cycle;
  uint64_t new_total = after.window.end_cycle - after.window.start_cycle;
  uint64_t old_executions = 0, new_executions = 0;
  for (auto const& row : before.pcs) add(old_executions, row.cost.count);
  for (auto const& row : after.pcs) add(new_executions, row.cost.count);
  out << "<p>Total elapsed emulated cycles: " << old_total << " &rarr; "
      << new_total << " (" << signed_change(old_total, new_total) << ", "
      << percentage(old_total, new_total) << "). Total AVM executions: "
      << old_executions << " &rarr; " << new_executions << " ("
      << signed_change(old_executions, new_executions) << ", "
      << percentage(old_executions, new_executions) << ").</p>";
  out << "<h2>Functions</h2><table><tr><th>Linkage name</th>"
         "<th>Compilation unit</th><th>Before cycles</th><th>After cycles</th>"
         "<th>Cycle change</th><th>Percent</th><th>Before executions</th>"
         "<th>After executions</th><th>Execution change</th></tr>";
  for (auto const& [key, old, now] : paired(functions(before), functions(after)))
    out << "<tr><td><code>" << escape(key.first) << "</code></td><td>"
        << escape(key.second) << "</td><td>" << old.cycles << "</td><td>"
        << now.cycles << "</td><td>" << signed_change(old.cycles, now.cycles)
        << "</td><td>" << percentage(old.cycles, now.cycles) << "</td><td>"
        << old.count << "</td><td>" << now.count << "</td><td>"
        << signed_change(old.count, now.count) << "</td></tr>";
  out << "</table><h2>Source lines</h2><p>Only matching file hashes give "
         "confident line comparisons. Unmatched revisions are tentative.</p>"
         "<table><tr><th>File</th><th>Line</th><th>Source hash</th>"
         "<th>Before cycles</th><th>After cycles</th><th>Change</th>"
         "<th>Percent</th><th>Before executions</th><th>After executions</th>"
         "</tr>";
  for (auto const& [old, now] : paired_lines(before, after)) {
    auto const& shown = old.file.empty() ? now : old;
    out << "<tr><td>" << escape(shown.file) << "</td><td>"
        << shown.line << "</td><td>"
        << (tentative(old, now) ? "tentative" :
                                   escape(shown.hash.substr(0, 12)))
        << "</td><td>" << old.cost.cycles << "</td><td>" << now.cost.cycles
        << "</td><td>" << signed_change(old.cost.cycles, now.cost.cycles)
        << "</td><td>" << percentage(old.cost.cycles, now.cost.cycles)
        << "</td><td>" << old.cost.count << "</td><td>" << now.cost.count
        << "</td></tr>";
  }
  out << "</table>";
  html_close(out);
  out.close();
  if (!out) throw std::runtime_error("diff HTML write failed");
}

} // namespace avm_debug
