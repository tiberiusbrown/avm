#!/usr/bin/env python3
"""Check DWARF code ranges against the relaxed layout of the relaxation fixture.

The relaxed and non-relaxed links must both verify cleanly. The fixture is only
meaningful when inlining and relaxation both happened, so this script refuses to
pass unless the relaxed code contains shortened transfers, the non-relaxed code
contains the maximal forms they came from, and the DWARF contains inlined
subroutines and a multi-range list. Every code address in the relaxed DWARF must
then fall on an instruction boundary of the relaxed code, and the subprogram of
relax_debug_outer must start at that function's symbol.

Location lists are decoded from the raw .debug_loc bytes, not from llvm-dwarfdump.
Each list starts from its compile unit's base address, and a base address
selection entry (an all-ones begin) replaces the base for the rest of that list
only. A list in a unit with a nonzero base must therefore select a zero base
first. Every endpoint of the relaxed link must map to the matching endpoint of
the non-relaxed link, through an alignment of the two instruction streams, and
the expression bytes must match. Decoding that ignores base address selections
must fail that comparison, which the script verifies.
"""

import argparse
import bisect
import collections
import re
import subprocess
import sys

SHORT_TRANSFERS = {
    "call8", "call16", "jmp8", "jmp16",
    "breq8", "brne8", "brult8", "bruge8", "brslt8", "brsge8",
    "breq16", "brne16", "brult16", "bruge16", "brslt16", "brsge16",
}
MAXIMAL_TRANSFERS = {"callf", "jmpf"}
INSTRUCTION = re.compile(r"^\s+([0-9a-f]+):\s+((?:[0-9a-f]{2} )+)\s*\t?(.*)$")
# AVM code addresses are three bytes, so the base selection marker is 0xffffff.
BASE_SELECTION = 0xFFFFFF
ZERO_BASE_SELECTION = bytes([0xFF, 0xFF, 0xFF, 0, 0, 0])
INVERSE_CONDITIONS = {
    "eq": "ne", "ne": "eq", "ult": "uge", "uge": "ult", "slt": "sge", "sge": "slt",
}
Instruction = collections.namedtuple("Instruction", "address size mnemonic target")


def run(tool, *args, check=True):
    result = subprocess.run([tool, *args], capture_output=True, text=True)
    if check and result.returncode != 0:
        sys.exit(f"{tool} {' '.join(args)} failed:\n{result.stderr}")
    return result.stdout


def verify(dwarfdump, elf, label):
    out = run(dwarfdump, "--verify", elf, check=False)
    if "No errors." not in out:
        sys.exit(f"{label}: llvm-dwarfdump --verify reported errors:\n{out}")


def parse_displacement(text):
    negative = text.startswith("-")
    digits = text.lstrip("-")
    value = int(digits[2:], 16) if digits.startswith("0x") else int(digits)
    return -value if negative else value


def branch_target(mnemonic, operands, address, size):
    """Return the absolute target of a direct transfer, or None."""
    if mnemonic in ("callf", "jmpf"):
        return int(operands.split()[0], 16)
    if re.fullmatch(r"(call|jmp)(8|16)|br\w+(8|16)", mnemonic):
        # Short and medium displacements are relative to the next instruction.
        return address + size + parse_displacement(operands.split()[0])
    return None


def instructions(objdump, elf):
    """Return the disassembled instructions of an ELF in address order."""
    result = []
    for line in run(objdump, "-d", elf).splitlines():
        match = INSTRUCTION.match(line)
        if not match:
            continue
        address = int(match.group(1), 16)
        size = len(match.group(2).split())
        text = match.group(3).strip()
        mnemonic = text.split()[0] if text else ""
        operands = text[len(mnemonic):].strip()
        result.append(Instruction(address, size, mnemonic,
                                  branch_target(mnemonic, operands, address, size)))
    return result


def disassemble(objdump, elf):
    """Return (instruction starts, instruction ends, mnemonics) for .text."""
    code = instructions(objdump, elf)
    starts = {item.address for item in code}
    ends = {item.address + item.size for item in code}
    return starts, ends, collections.Counter(item.mnemonic for item in code)


def text_size(objdump, elf):
    for line in run(objdump, "-h", elf).splitlines():
        fields = line.split()
        if len(fields) >= 3 and fields[1] == ".text":
            return int(fields[2], 16)
    sys.exit(f"{elf}: no .text section")


def symbol_address(nm, elf, fragment):
    for line in run(nm, "-n", elf).splitlines():
        fields = line.split()
        if len(fields) == 3 and fragment in fields[2]:
            return int(fields[0], 16)
    sys.exit(f"{elf}: no symbol containing {fragment!r}")


def dies(debug_info):
    """Yield (tag line, attribute lines) for each DIE in llvm-dwarfdump output."""
    current = None
    for line in debug_info.splitlines():
        if re.match(r"^0x[0-9a-f]+:", line):
            if current:
                yield current
            current = (line, []) if "DW_TAG_" in line else None
        elif current is not None and line.startswith(" "):
            current[1].append(line)
    if current:
        yield current


def compile_units(debug_info):
    """Return each unit's DW_AT_low_pc (or None) and the .debug_loc lists it uses."""
    units, unit, expect_unit_die, in_unit_die = [], None, False, False
    for line in debug_info.splitlines():
        if "Compile Unit:" in line:
            unit = {"low_pc": None, "lists": set()}
            units.append(unit)
            expect_unit_die, in_unit_die = True, False
            continue
        if unit is None:
            continue
        if re.match(r"^\s*0x[0-9a-f]+:\s+DW_TAG_", line):
            in_unit_die, expect_unit_die = expect_unit_die, False
            continue
        if in_unit_die:
            match = re.match(r"^\s+DW_AT_low_pc\s+\(0x([0-9a-f]+)\)", line)
            if match:
                unit["low_pc"] = int(match.group(1), 16)
        match = re.search(r"DW_AT_location\s+\(0x([0-9a-f]+):", line)
        if match:
            unit["lists"].add(int(match.group(1), 16))
    return units


def section_bytes(objdump, elf, name):
    """Return the raw bytes of one section, read from llvm-objdump's hex dump."""
    data = bytearray()
    for line in run(objdump, "-s", "-j", name, elf).splitlines():
        match = re.match(r"^ [0-9a-f]+ (.*?)  ", line)
        if match:
            data.extend(bytes.fromhex("".join(match.group(1).split())))
    return bytes(data)


def llvm_lists(dwarfdump, elf):
    """Return llvm-dwarfdump's decoded (begin, end) pairs for each list offset."""
    lists, offset = {}, None
    for line in run(dwarfdump, "--debug-loc", elf).splitlines():
        header = re.match(r"^0x([0-9a-f]+):", line)
        if header:
            offset = int(header.group(1), 16)
            lists[offset] = []
            continue
        match = re.search(r"[\[(]0x([0-9a-f]+), 0x([0-9a-f]+)[\])]", line)
        if match and offset is not None:
            lists[offset].append((int(match.group(1), 16), int(match.group(2), 16)))
    return lists


def decode_list(data, offset, base, honor_selections=True):
    """Decode one DWARF 4 location list with AVM's three-byte addresses.

    Returns (entries, selections). Each entry is (begin, end, expression) with
    effective addresses, and selections counts the base address selection entries.
    With honor_selections false, the unit's base is never replaced.
    """
    entries, selections = [], 0
    while True:
        if offset + 6 > len(data):
            sys.exit(f"location list at {offset:#x} runs past .debug_loc")
        begin = int.from_bytes(data[offset:offset + 3], "little")
        end = int.from_bytes(data[offset + 3:offset + 6], "little")
        offset += 6
        if begin == BASE_SELECTION:
            selections += 1
            if honor_selections:
                base = end
            continue
        if begin == 0 and end == 0:
            return entries, selections
        length = int.from_bytes(data[offset:offset + 2], "little")
        expression = bytes(data[offset + 2:offset + 2 + length])
        if len(expression) != length:
            sys.exit(f"location list entry at {offset:#x} is truncated")
        offset += 2 + length
        entries.append((base + begin, base + end, expression))


def family(instruction):
    """Group the forms that relaxation changes into one kind of instruction."""
    mnemonic = instruction.mnemonic
    if mnemonic == "callp":
        return mnemonic
    if mnemonic.startswith("call"):
        return "call"
    if mnemonic.startswith("jmp"):
        return "jmp"
    condition = re.fullmatch(r"br(\w+?)(?:8|16)", mnemonic)
    return "br" + condition.group(1) if condition else mnemonic


class InstructionMap:
    """Aligns the relaxed instruction stream with the non-relaxed one.

    Relaxation shortens transfers, deletes jumps to the next instruction and
    padding nops, and fuses a short conditional branch over a long jump into one
    long conditional branch. Every other instruction pairs one-to-one. Each
    direct transfer must also target the place its unrelaxed target maps to.
    """

    def __init__(self, relaxed, unrelaxed):
        self.pairs, self.deleted, self.fused_second = {}, set(), set()
        overrides = {}
        i = j = 0
        while i < len(relaxed) and j < len(unrelaxed):
            r, n = relaxed[i], unrelaxed[j]
            following = unrelaxed[j + 1] if j + 1 < len(unrelaxed) else None
            if family(r) == family(n):
                self.pairs[r.address] = n.address
                i, j = i + 1, j + 1
            elif self._deletable(n):
                self.deleted.add(n.address)
                j += 1
            elif (following is not None and following.mnemonic == "jmpf"
                  and n.mnemonic.endswith("8") and family(n).startswith("br")
                  and family(r) == "br" + INVERSE_CONDITIONS.get(family(n)[2:], "")):
                self.pairs[r.address] = n.address
                self.fused_second.add(following.address)
                overrides[r.address] = following.target
                i, j = i + 1, j + 2
            else:
                sys.exit(f"relaxed {r.address:#x} {r.mnemonic} has no unrelaxed "
                         f"counterpart at {n.address:#x} {n.mnemonic}")
        if i != len(relaxed):
            sys.exit("relaxed code has instructions with no unrelaxed counterpart")
        for n in unrelaxed[j:]:
            if not self._deletable(n):
                sys.exit(f"unrelaxed {n.address:#x} {n.mnemonic} was not relaxed")
            self.deleted.add(n.address)

        self.survivors = sorted(
            item.address for item in unrelaxed
            if item.address not in self.deleted and item.address not in self.fused_second)
        self.relaxed_end = max(item.address + item.size for item in relaxed)
        unrelaxed_by_address = {item.address: item for item in unrelaxed}
        self.transfers = 0
        for r in relaxed:
            if r.address not in self.pairs:
                continue
            n = unrelaxed_by_address[self.pairs[r.address]]
            target = overrides.get(r.address, n.target)
            if (r.target is None) != (target is None):
                sys.exit(f"transfer at {r.address:#x} changed kind during relaxation")
            if target is None:
                continue
            self.transfers += 1
            if target not in unrelaxed_by_address:
                # An unresolved symbol, such as a weak undefined function at 0, is
                # not an instruction, so relaxation leaves its target unchanged.
                if r.target != target:
                    sys.exit(f"transfer at {r.address:#x} changed an unresolved target")
                continue
            if r.target not in self.pairs or self.pairs[r.target] != self.survivor(target):
                sys.exit(f"transfer at {r.address:#x} targets {r.target:#x}, which "
                         f"does not map to the unrelaxed target {target:#x}")

    @staticmethod
    def _deletable(instruction):
        return instruction.mnemonic == "nop" or (
            instruction.mnemonic == "jmpf"
            and instruction.target == instruction.address + instruction.size)

    def survivor(self, unrelaxed_address):
        """Return the first unrelaxed instruction that remains at or after an address."""
        index = bisect.bisect_left(self.survivors, unrelaxed_address)
        return self.survivors[index] if index < len(self.survivors) else None

    def matches(self, relaxed_address, unrelaxed_address):
        """Return whether a relaxed endpoint is where the unrelaxed endpoint moved."""
        if relaxed_address == self.relaxed_end:
            return self.survivor(unrelaxed_address) is None
        return (relaxed_address in self.pairs
                and self.pairs[relaxed_address] == self.survivor(unrelaxed_address))


def check_location_lists(args, mapping):
    """Check every location list of the relaxed link against the unrelaxed link."""
    relaxed_units = compile_units(run(args.llvm_dwarfdump, "--debug-info", args.relaxed))
    norelax_units = compile_units(run(args.llvm_dwarfdump, "--debug-info", args.norelax))
    if len(relaxed_units) != len(norelax_units):
        sys.exit("relaxed and non-relaxed links have different compile unit counts")
    relaxed_loc = section_bytes(args.llvm_objdump, args.relaxed, ".debug_loc")
    norelax_loc = section_bytes(args.llvm_objdump, args.norelax, ".debug_loc")
    llvm = llvm_lists(args.llvm_dwarfdump, args.relaxed)

    stats = collections.Counter()
    for index, (relaxed_unit, norelax_unit) in enumerate(zip(relaxed_units, norelax_units)):
        if relaxed_unit["lists"] != norelax_unit["lists"]:
            sys.exit(f"compile unit {index}: location list offsets differ between links")
        relaxed_base = relaxed_unit["low_pc"] or 0
        norelax_base = norelax_unit["low_pc"] or 0
        if relaxed_base:
            stats["nonzero base units"] += 1
        for offset in sorted(relaxed_unit["lists"]):
            stats["lists"] += 1
            if relaxed_base and relaxed_loc[offset:offset + 6] != ZERO_BASE_SELECTION:
                sys.exit(f"location list {offset:#x} of unit {index} has a nonzero base "
                         "but does not select a zero base first")
            relaxed_entries, relaxed_selections = decode_list(
                relaxed_loc, offset, relaxed_base)
            norelax_entries, norelax_selections = decode_list(
                norelax_loc, offset, norelax_base)
            if relaxed_selections != norelax_selections:
                sys.exit(f"location list {offset:#x} has different base selections")
            if len(relaxed_entries) != len(norelax_entries):
                sys.exit(f"location list {offset:#x} has a different number of entries")
            if ([entry[2] for entry in relaxed_entries]
                    != [entry[2] for entry in norelax_entries]):
                sys.exit(f"location list {offset:#x} changed its expression bytes")
            if [entry[:2] for entry in relaxed_entries] != llvm.get(offset):
                sys.exit(f"location list {offset:#x} disagrees with llvm-dwarfdump")
            stats["base selections"] += relaxed_selections
            for (rb, re_, _), (nb, ne, _) in zip(relaxed_entries, norelax_entries):
                stats["entries"] += 1
                if not rb < re_ or not nb < ne:
                    sys.exit(f"location list {offset:#x} has an empty or inverted range")
                for relaxed_end, norelax_end in ((rb, nb), (re_, ne)):
                    if not mapping.matches(relaxed_end, norelax_end):
                        sys.exit(f"location list {offset:#x}: relaxed {relaxed_end:#x} is "
                                 f"not where unrelaxed {norelax_end:#x} moved")

    # Negative control: a decoder that ignores base address selections must fail
    # the same comparison for the lists whose unit has a nonzero base.
    detected = 0
    for relaxed_unit, norelax_unit in zip(relaxed_units, norelax_units):
        relaxed_base = relaxed_unit["low_pc"] or 0
        if not relaxed_base:
            continue
        for offset in relaxed_unit["lists"]:
            ignored, _ = decode_list(relaxed_loc, offset, relaxed_base,
                                     honor_selections=False)
            expected, _ = decode_list(norelax_loc, offset, norelax_unit["low_pc"] or 0)
            for (rb, re_, _), (nb, ne, _) in zip(ignored, expected):
                detected += not mapping.matches(rb, nb)
                detected += not mapping.matches(re_, ne)
    if stats["nonzero base units"] and not detected:
        sys.exit("decoding without base selections was not detected")
    print(f"location lists {stats['lists']}, entries {stats['entries']}, "
          f"base selections {stats['base selections']}, "
          f"nonzero base units {stats['nonzero base units']}, invalid endpoints 0")
    print(f"decoding without base selections fails {detected} endpoints")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--llvm-dwarfdump", required=True)
    parser.add_argument("--llvm-objdump", required=True)
    parser.add_argument("--llvm-nm", required=True)
    parser.add_argument("--relaxed", required=True)
    parser.add_argument("--norelax", required=True)
    args = parser.parse_args()

    verify(args.llvm_dwarfdump, args.relaxed, "relaxed")
    verify(args.llvm_dwarfdump, args.norelax, "non-relaxed")

    relaxed_text = text_size(args.llvm_objdump, args.relaxed)
    norelax_text = text_size(args.llvm_objdump, args.norelax)
    if relaxed_text >= norelax_text:
        sys.exit("relaxation did not shorten .text: fixture is not valid")

    starts, ends, relaxed_mnemonics = disassemble(args.llvm_objdump, args.relaxed)
    _, _, norelax_mnemonics = disassemble(args.llvm_objdump, args.norelax)
    short = sum(relaxed_mnemonics[m] for m in SHORT_TRANSFERS)
    maximal = sum(norelax_mnemonics[m] for m in MAXIMAL_TRANSFERS)
    if short == 0 or maximal == 0:
        sys.exit("no relaxed transfers found: fixture is not valid")

    info = run(args.llvm_dwarfdump, "--debug-info", args.relaxed)
    norelax_info = run(args.llvm_dwarfdump, "--debug-info", args.norelax)
    tags = collections.Counter(
        re.search(r"(DW_TAG_\w+)", header).group(1) for header, _ in dies(info))
    norelax_tags = collections.Counter(
        re.search(r"(DW_TAG_\w+)", header).group(1)
        for header, _ in dies(norelax_info))
    if tags != norelax_tags:
        sys.exit("relaxation changed the DIE tree: " + str(tags - norelax_tags))
    if tags["DW_TAG_inlined_subroutine"] < 2:
        sys.exit("fewer than two inlined subroutines: inlining was removed")
    multi_range = any(
        len(re.findall(r"\[0x[0-9a-f]+, 0x[0-9a-f]+\)", "\n".join(lines))) >= 2
        for header, lines in dies(info) if "DW_AT_ranges" in "\n".join(lines))
    if not multi_range:
        sys.exit("no multi-range DW_AT_ranges list in the relaxed DWARF")

    checked = 0
    for address_text in re.findall(r"DW_AT_(?:low|high)_pc\s+\(0x([0-9a-f]+)\)", info):
        address = int(address_text, 16)
        # Units without code carry a zero low_pc and high_pc; they are not code.
        if address == 0:
            continue
        checked += 1
        if address not in starts and address not in ends:
            sys.exit(f"DW_AT_*_pc 0x{address:x} is not an instruction boundary")
    for low, high in re.findall(r"\[0x([0-9a-f]+), 0x([0-9a-f]+)\)", info):
        for address in (int(low, 16), int(high, 16)):
            checked += 1
            if address not in starts and address not in ends:
                sys.exit(f"range endpoint 0x{address:x} is not an instruction boundary")

    outer = symbol_address(args.llvm_nm, args.relaxed, "relax_debug_outer")
    named = None
    for header, lines in dies(info):
        if any('DW_AT_name' in line and '"relax_debug_outer"' in line for line in lines):
            named = int(re.match(r"^0x([0-9a-f]+):", header).group(1), 16)
    if named is None:
        sys.exit("no DIE is named relax_debug_outer")
    outer_low = None
    for header, lines in dies(info):
        text = "\n".join(lines)
        offset = int(re.match(r"^0x([0-9a-f]+):", header).group(1), 16)
        if offset != named and not re.search(
                rf"DW_AT_abstract_origin\s+\(0x0*{named:x}\b", text):
            continue
        match = re.search(r"DW_AT_low_pc\s+\(0x([0-9a-f]+)\)", text)
        if match:
            outer_low = int(match.group(1), 16)
    if outer_low is None:
        sys.exit("relax_debug_outer has no concrete DW_AT_low_pc")
    if outer_low != outer:
        sys.exit(f"relax_debug_outer DWARF starts at 0x{outer_low:x}, symbol at 0x{outer:x}")

    mapping = InstructionMap(instructions(args.llvm_objdump, args.relaxed),
                             instructions(args.llvm_objdump, args.norelax))
    check_location_lists(args, mapping)

    print(f"relaxed .text {relaxed_text} bytes, non-relaxed {norelax_text} bytes")
    print(f"relaxed transfers {short}, maximal transfers {maximal}")
    print(f"inlined subroutines {tags['DW_TAG_inlined_subroutine']}")
    print(f"code addresses checked {checked}; all on instruction boundaries")
    print(f"instructions aligned {len(mapping.pairs)}, transfers agreeing {mapping.transfers}")
    print("relax_debug_info verification passed")


if __name__ == "__main__":
    main()
