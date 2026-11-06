"""Generate a linked AVM listing without startup and diagnostic infrastructure."""

import argparse
from pathlib import Path
import re
import subprocess


# Match archive members, rather than symbol names: private trap helpers may
# share a name with functions in the benchmark or test itself. Other libavm
# members (and all compiler builtins) remain visible.
INFRASTRUCTURE = re.compile(
    r"(?:^|/)libavm\.a\((?:runtime|termination|trap_entry|trap_report|trap_lookup)\.o\)$"
)
MAP_ROW = re.compile(r"^\s*([0-9a-fA-F]+)\s+[0-9a-fA-F]+\s+([0-9a-fA-F]+)\s+\d+ (.*)$")
SECTION = re.compile(r"^Disassembly of section (.+):$")
SYMBOL = re.compile(r"^([0-9a-fA-F]+) <(.+)>:$")
INSTRUCTION = re.compile(r"^\s*([0-9a-fA-F]+): ((?:[0-9a-fA-F]{2} )+)(\s*)(.*)$")


def excluded_ranges(link_map, startup):
    """Read LLD's output-section/input-section hierarchy after relaxation."""
    if not link_map.splitlines() or "VMA" not in link_map.splitlines()[0]:
        raise ValueError("expected an LLD link map with VMA columns")
    startup = startup.replace("\\", "/")
    section = None
    ranges = {}
    for line in link_map.splitlines()[1:]:
        row = MAP_ROW.match(line)
        if not row:
            continue
        address, size, entry = row.groups()
        if not entry.startswith(" "):
            section = entry
            continue
        # Input sections are indented eight columns; symbols sixteen.
        if not entry.startswith(" " * 8) or entry.startswith(" " * 16):
            continue
        origin, separator, _ = entry.strip().rpartition(":(")
        if not separator:
            continue
        origin = origin.replace("\\", "/")
        if (startup and origin == startup) or INFRASTRUCTURE.search(origin):
            start, length = int(address, 16), int(size, 16)
            if length:
                ranges.setdefault(section, []).append((start, start + length))
    return ranges


def focused_listing(disassembly, ranges):
    """Filter by section/address, preserving source, labels and call operands."""
    result = []
    body = []
    heading = None
    section = None
    hidden = False

    def excluded(address):
        return any(start <= address < end for start, end in ranges.get(section, ()))

    def flush():
        if body:
            if heading is not None:
                result.extend((heading, "\n"))
            result.extend(body)
        body.clear()

    for line in disassembly.splitlines(keepends=True):
        text = line.rstrip("\r\n")
        match = SECTION.match(text)
        if match:
            flush()
            heading = line
            section = match[1]
            hidden = False
            continue
        match = SYMBOL.match(text)
        if match:
            hidden = excluded(int(match[1], 16))
            if not hidden:
                body.append(f"<{match[2]}>:\n")
            continue
        match = INSTRUCTION.match(text)
        if match:
            hidden = excluded(int(match[1], 16))
            if not hidden:
                # Match llvm-objdump --no-addresses, including FPOLY's inline
                # coefficients that extend beyond the usual mnemonic column.
                raw = " " + match[2]
                padding = 23 - len(raw) if len(raw) < 23 else 7 - len(raw) % 8
                body.append(raw + " " * padding + match[4] + "\n")
            continue
        if not hidden and (heading is None or text):
            body.append(line)
        elif not hidden and body:
            body.append(line)
    flush()
    return "".join(result).rstrip() + "\n"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--objdump", required=True)
    parser.add_argument("--input", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--link-map", type=Path, required=True)
    parser.add_argument("--startup", default="")
    args = parser.parse_args()
    ranges = excluded_ranges(args.link_map.read_text(encoding="utf-8"), args.startup)
    # Keep addresses internally so identically named local functions can be
    # distinguished. The final listing removes addresses and the symbol table.
    process = subprocess.run(
        [args.objdump, "--disassemble", "--source", "--symbolize-operands",
         "--demangle", "--print-imm-hex", str(args.input)],
        text=True, encoding="utf-8", capture_output=True,
    )
    if process.returncode:
        raise RuntimeError(
            f"llvm-objdump failed for {args.input} with exit code "
            f"{process.returncode}:\n{process.stderr}"
        )
    listing = focused_listing(process.stdout, ranges)
    listing = listing.replace(str(args.input), args.input.name)
    args.output.write_text(listing, encoding="utf-8")


if __name__ == "__main__":
    main()
