#!/usr/bin/env python3
"""Inspects the AVD1 crash metadata of an AVM flat image.

This is an independent decoder for the AVD1 layout described in docs/arch.md,
Section 69.2. It validates every field it reads, decodes the whole source
transition stream, checks each checkpoint against that sequential decode, and
evaluates lookups the same bounded way the guest does.

Usage:
  dump-crash.py [--stats] image.bin               summary of the block
  dump-crash.py --records image.bin               FN and LN records
  dump-crash.py --lookup 0x1000 [--lookup ...] image.bin
  dump-crash.py --boundaries image.bin            lookups at every interval edge
  dump-crash.py --transitions image.bin           each transition's emitted bytes
  dump-crash.py --strings image.bin               each string-pool record
  dump-crash.py --checkpoints image.bin           each checkpoint's state
"""

import argparse
import collections
import sys

HEADER_SIZE = 12
SECTION_COUNT = 5
DIRECTORY_ENTRY_SIZE = 7
PAYLOAD_START = HEADER_SIZE + SECTION_COUNT * DIRECTORY_ENTRY_SIZE
FUNCTION_SIZE = 9
FILE_SIZE = 3
CHECKPOINT_SIZE = 12
CHECKPOINT_INTERVAL = 64
MAX_FILE_BYTES = 48
MAX_PC = 0xFFFFFF
MAX_LINE = 0xFFFFFF
MAX_ULEB_BYTES = 4
MAX_RECORDS = 0xFFFF
SECTION_NAMES = ["function index", "filename index", "checkpoints",
                 "source stream", "strings"]


class CrashError(Exception):
    pass


def check(condition, message):
    if not condition:
        raise CrashError(message)


def u16(data, offset):
    return data[offset] | data[offset + 1] << 8


def u24(data, offset):
    return data[offset] | data[offset + 1] << 8 | data[offset + 2] << 16


def new_stats():
    return {"combined": 0, "set": 0, "large": 0, "unmapped": 0,
            "short_large": 0, "short_unmapped": 0,
            "uleb": collections.Counter(), "bytes": collections.Counter(),
            "resume": 0, "resume_same_file": 0, "resume_same_line": 0,
            "resume_cross_file": 0, "resume_one_byte": 0,
            "resume_short_large": 0, "resume_extended": 0}


def opcode_category(opcode):
    if opcode < 0x80:
        return "combined"
    if opcode == 0x80:
        return "set"
    if opcode == 0x81:
        return "large"
    if opcode == 0x82:
        return "unmapped"
    if opcode <= 0x92:
        return "short_large"
    return "short_unmapped"


def count_resumption(stats, opcode, state, next_state):
    """Counts a mapped transition that follows a gap: its file and line are the
    ones the gap retained."""
    if not next_state.mapped or state.mapped:
        return
    stats["resume"] += 1
    if next_state.file == state.file:
        stats["resume_same_file"] += 1
    else:
        stats["resume_cross_file"] += 1
    if next_state.line == state.line:
        stats["resume_same_line"] += 1
    if opcode < 0x80:
        stats["resume_one_byte"] += 1
    elif 0x83 <= opcode <= 0x92:
        stats["resume_short_large"] += 1
    else:
        stats["resume_extended"] += 1


class State:
    """A source state from PC until the next transition."""
    __slots__ = ("pc", "mapped", "file", "line")

    def __init__(self, pc, mapped, file, line):
        self.pc = pc
        self.mapped = mapped
        self.file = file
        self.line = line

    def key(self):
        # Unmapped states keep their file and line for the next mapping, but a
        # lookup never reads them, so all unmapped states are one state.
        return (self.mapped, self.file, self.line) if self.mapped else (False,)


def read_uleb(stream, offset, stats):
    """Reads one canonical ULEB128 operand and returns (value, next offset)."""
    value = 0
    shift = 0
    for count in range(1, MAX_ULEB_BYTES + 1):
        check(offset < len(stream), "ULEB128 operand is unterminated")
        byte = stream[offset]
        offset += 1
        value |= (byte & 0x7F) << shift
        shift += 7
        if not byte & 0x80:
            check(count == 1 or byte != 0, "ULEB128 operand is overlong")
            stats["uleb"][count] += 1
            return value, offset
    raise CrashError("ULEB128 operand exceeds four bytes")


def read_string_length(pool, offset):
    """Reads the canonical ULEB128 length prefix of a string-pool record.

    Returns (length, offset of the first character). The prefix uses at most
    four bytes, so a record never needs a longer one.
    """
    value = 0
    for count in range(1, MAX_ULEB_BYTES + 1):
        check(offset + count - 1 < len(pool), "string length prefix is unterminated")
        byte = pool[offset + count - 1]
        value |= (byte & 0x7F) << (7 * (count - 1))
        if not byte & 0x80:
            check(count == 1 or byte != 0, "string length prefix is overlong")
            return value, offset + count
    raise CrashError("string length prefix exceeds four bytes")


def step(stream, offset, state, file_count, stats):
    """Applies the transition whose opcode is at offset.

    Returns the next State and the offset of the opcode after it.
    """
    check(offset < len(stream), "transition stream ends inside a transition")
    opcode = stream[offset]
    offset += 1
    pc, mapped, file, line = state.pc, state.mapped, state.file, state.line
    if opcode < 0x80:
        # Same-file deltas resume from the retained line, mapped or not.
        check(line != 0, "combined transition before any source line")
        stats["combined"] += 1
        pc_delta = (opcode & 0x0F) + 1
        line = line + ((opcode >> 4) & 7) - 4
        mapped = True
    elif opcode == 0x80:
        stats["set"] += 1
        pc_delta, offset = read_uleb(stream, offset, stats)
        file, offset = read_uleb(stream, offset, stats)
        check(file < file_count, f"file index {file} is outside the filename index")
        line, offset = read_uleb(stream, offset, stats)
        mapped = True
    elif opcode == 0x81:
        stats["large"] += 1
        check(line != 0, "large transition before any source line")
        pc_delta, offset = read_uleb(stream, offset, stats)
        zigzag, offset = read_uleb(stream, offset, stats)
        line = line + ((zigzag >> 1) ^ -(zigzag & 1))
        mapped = True
    elif opcode == 0x82:
        stats["unmapped"] += 1
        pc_delta, offset = read_uleb(stream, offset, stats)
        mapped = False
    elif opcode <= 0x92:
        stats["short_large"] += 1
        check(line != 0, "short large transition before any source line")
        pc_delta = opcode - 0x82
        zigzag, offset = read_uleb(stream, offset, stats)
        line = line + ((zigzag >> 1) ^ -(zigzag & 1))
        mapped = True
    else:
        stats["short_unmapped"] += 1
        pc_delta = opcode - 0x92
        mapped = False
    check(pc_delta >= 1, "zero PC delta")
    check(pc + pc_delta <= MAX_PC, "PC overflows the 24-bit address space")
    if mapped:
        check(1 <= line <= MAX_LINE, f"line {line} is outside 1..0xFFFFFF")
    return State(pc + pc_delta, mapped, file, line), offset


class Metadata:
    pass


def parse(image):
    """Returns the decoded block, or None when the image has no crash metadata."""
    check(len(image) >= 256, "image shorter than its header")
    tail = len(image) - 8
    if image[tail:tail + 4] != b"AVT\x01":
        tail = len(image) - 4096 - 8
    check(image[tail:tail + 4] == b"AVT\x01", "missing AVM tail")
    base = u24(image, 0x0F)
    if base == 0:
        return None

    check(base % 4 == 0, "AVD1 block is not 4-byte aligned")
    check(base + PAYLOAD_START <= tail, "AVD1 header overlaps the tail")
    check(image[base:base + 4] == b"AVD1", "crashInfo does not name an AVD1 block")
    size = u24(image, base + 4)
    check(PAYLOAD_START <= size and base + size <= tail, "AVD1 size is out of range")
    check(image[base + 7] == SECTION_COUNT, "AVD1 section count is not five")
    check(image[base + 8] == 0, "nonzero AVD1 flags")
    check(image[base + 9:base + 12] == b"\0\0\0", "nonzero AVD1 reserved bytes")
    # Everything between the block and the tail is erased flash.
    check(image[base + size:tail] == b"\xff" * (tail - base - size),
          "bytes after AVD1 are not erased")
    block = image[base:base + size]

    sections = []
    expected = PAYLOAD_START
    for index in range(SECTION_COUNT):
        entry = HEADER_SIZE + index * DIRECTORY_ENTRY_SIZE
        check(block[entry] == index + 1, f"section {index + 1} has the wrong type")
        offset = u24(block, entry + 1)
        length = u24(block, entry + 4)
        check(offset == expected, f"{SECTION_NAMES[index]} is not consecutive")
        check(offset + length <= size, f"{SECTION_NAMES[index]} runs past the block")
        sections.append((offset, length))
        expected += length
    check(expected == size, "sections do not exactly fill the AVD1 block")

    # The string pool comes first, because every name is an offset into it.
    pool_offset, pool_size = sections[4]
    pool = block[pool_offset:pool_offset + pool_size]
    pooled = {}
    prefix_bytes = {}
    cursor = 0
    while cursor < pool_size:
        length, body = read_string_length(pool, cursor)
        prefix_bytes[cursor] = list(pool[cursor:body])
        check(length > 0, "empty string in the string pool")
        end = body + length
        check(end < pool_size, "string runs past the string pool")
        check(pool[end] == 0, "string is not NUL terminated")
        text = bytes(pool[body:end])
        check(all(0x20 <= c < 0x7F for c in text), "nonprintable string in the string pool")
        pooled[cursor] = text.decode("ascii")
        cursor = end + 1
    check(len(set(pooled.values())) == len(pooled), "string pool holds a duplicate string")
    referenced = set()

    def string(offset):
        check(offset in pooled, "string offset is not a string in the pool")
        referenced.add(offset)
        return pooled[offset]

    # Type 1: function index.
    fo, fl = sections[0]
    check(fl >= 2, "function index is shorter than its count")
    function_count = u16(block, fo)
    check(fl == 2 + FUNCTION_SIZE * function_count,
          "function index size does not match its count")
    functions = []
    for i in range(function_count):
        record = fo + 2 + FUNCTION_SIZE * i
        start = u24(block, record)
        end = u24(block, record + 3)
        check(start < end <= MAX_PC, "empty or out-of-range function record")
        check(not functions or start >= functions[-1][1],
              "function ranges overlap or are unsorted")
        functions.append((start, end, string(u24(block, record + 6))))

    # Type 2: filename index.
    fi, fil = sections[1]
    check(fil >= 2, "filename index is shorter than its count")
    file_count = u16(block, fi)
    check(fil == 2 + FILE_SIZE * file_count,
          "filename index size does not match its count")
    files = []
    for i in range(file_count):
        name = string(u24(block, fi + 2 + FILE_SIZE * i))
        check(len(name) <= MAX_FILE_BYTES, f"filename exceeds {MAX_FILE_BYTES} bytes")
        check("/" not in name, "filename is not a basename")
        files.append(name)
    check(len(set(files)) == len(files), "duplicate filename in the index")

    # Type 3 is validated after the stream, which it must match.
    co, cl = sections[2]
    check(cl >= 2, "checkpoint section is shorter than its count")
    checkpoint_count = u16(block, co)
    check(cl == 2 + CHECKPOINT_SIZE * checkpoint_count,
          "checkpoint section size does not match its count")

    # Type 4: source transition stream.
    so, sl = sections[3]
    check(sl >= 3, "source stream is shorter than its count")
    transition_count = u24(block, so)
    stream = block[so + 3:so + sl]
    check(checkpoint_count == transition_count // CHECKPOINT_INTERVAL + 1,
          "checkpoint count does not match the transition count")

    stats = new_stats()
    transitions = []
    stream_starts = []
    stream_ends = []
    state = State(0, False, 0, 0)
    offset = 0
    for _ in range(transition_count):
        stream_starts.append(offset)
        opcode = stream[offset]
        next_state, offset = step(stream, offset, state, file_count, stats)
        stats["bytes"][opcode_category(opcode)] += offset - stream_starts[-1]
        count_resumption(stats, opcode, state, next_state)
        check(next_state.pc > state.pc, "transition PCs do not strictly increase")
        check(next_state.key() != state.key(),
              "source stream repeats a state without changing it")
        transitions.append(next_state)
        stream_ends.append(offset)
        state = next_state
    check(offset == len(stream), "source stream has trailing bytes")

    # The initial checkpoint, then the state after every 64th transition with the
    # offset of the opcode that follows it.
    expected_checkpoints = [(0, 0, 0, 0, False)]
    for count in range(CHECKPOINT_INTERVAL, transition_count + 1, CHECKPOINT_INTERVAL):
        t = transitions[count - 1]
        expected_checkpoints.append((t.pc, stream_ends[count - 1], t.file, t.line, t.mapped))
    checkpoints = []
    for i in range(checkpoint_count):
        record = co + 2 + CHECKPOINT_SIZE * i
        check(block[record + 11] in (0, 1), "checkpoint mapped flag is not 0 or 1")
        checkpoints.append((u24(block, record), u24(block, record + 3),
                            u16(block, record + 6), u24(block, record + 8),
                            block[record + 11] == 1))
    check(checkpoints == expected_checkpoints,
          "checkpoints disagree with the sequential source decode")

    # Every pooled string is referenced, and every reference is pooled.
    check(referenced == set(pooled), "string pool entries and references differ")

    intervals = []
    for index, t in enumerate(transitions):
        if t.mapped:
            end = transitions[index + 1].pc if index + 1 < len(transitions) else MAX_PC + 1
            intervals.append((t.pc, end, files[t.file], t.line))

    meta = Metadata()
    meta.address = base
    meta.size = size
    meta.section_bytes = dict(zip(SECTION_NAMES, (length for _, length in sections)))
    meta.functions = functions
    meta.files = files
    meta.checkpoints = checkpoints
    meta.transitions = transitions
    meta.stream = stream
    meta.stream_starts = stream_starts
    meta.stream_ends = stream_ends
    meta.pool = pooled
    meta.prefix_bytes = prefix_bytes
    meta.intervals = intervals
    meta.stats = stats
    meta.file_count = file_count
    return meta


def lookup(meta, pc):
    """Evaluates a lookup as the guest does: a checkpoint, then a bounded decode."""
    function = None
    for start, end, name in meta.functions:
        if start > pc:
            break
        if pc < end:
            function = name
        else:
            function = None

    checkpoint = None
    for cp in meta.checkpoints:
        if cp[0] > pc:
            break
        checkpoint = cp
    state = State(checkpoint[0], checkpoint[4], checkpoint[2], checkpoint[3])
    offset = checkpoint[1]
    scratch = new_stats()
    decoded = 0
    while offset < len(meta.stream):
        check(decoded < CHECKPOINT_INTERVAL, "lookup needed more than 64 transitions")
        decoded += 1
        next_state, next_offset = step(meta.stream, offset, state, meta.file_count, scratch)
        if next_state.pc > pc:
            break
        state, offset = next_state, next_offset
    source = (meta.files[state.file], state.line) if state.mapped else None
    return function, source


def report_transitions(meta, out):
    """Prints each transition's emitted bytes, its PC, and the state it sets."""
    for index, t in enumerate(meta.transitions):
        raw = meta.stream[meta.stream_starts[index]:meta.stream_ends[index]]
        hexed = " ".join(f"{byte:02X}" for byte in raw)
        state = f"mapped {meta.files[t.file]}:{t.line}" if t.mapped else "unmapped"
        out.write(f"transition {index} pc=0x{t.pc:06x} bytes={hexed} {state}\n")


def report_checkpoints(meta, out):
    """Prints each checkpoint: its PC, the stream offset of its next opcode, and
    the state it restores."""
    for index, (pc, offset, file, line, mapped) in enumerate(meta.checkpoints):
        state = f"mapped {meta.files[file]}:{line}" if mapped else f"unmapped file={file} line={line}"
        out.write(f"checkpoint {index} pc=0x{pc:06x} offset={offset} {state}\n")


def report_strings(meta, out):
    """Prints each pool record with its length-prefix bytes and its text."""
    for offset, text in sorted(meta.pool.items()):
        prefix = meta.prefix_bytes[offset]
        hexed = " ".join(f"{byte:02X}" for byte in prefix)
        out.write(f"string 0x{offset:04x} prefix={hexed} {text}\n")


def report_records(meta, out):
    out.write(f"crash: 0x{meta.address:x} size {meta.size} functions "
              f"{len(meta.functions)} lines {len(meta.intervals)}\n")
    for start, end, name in meta.functions:
        out.write(f"FN 0x{start:06x}-0x{end:06x} {name}\n")
    for start, end, filename, line in meta.intervals:
        out.write(f"LN 0x{start:06x}-0x{end:06x} {filename}:{line}\n")


def name_lengths(meta):
    return sorted(len(name) for _, _, name in meta.functions)


def report_summary(meta, out, with_stats):
    sizes = meta.section_bytes
    transitions = len(meta.transitions)
    out.write("Format: AVD1\n")
    out.write(f"Functions: {len(meta.functions)}\n")
    out.write(f"Source transitions: {transitions}\n")
    out.write(f"Checkpoints: {len(meta.checkpoints)}\n")
    out.write(f"Function index: {sizes['function index']} bytes\n")
    out.write(f"Filename index: {sizes['filename index']} bytes\n")
    out.write(f"Checkpoints: {sizes['checkpoints']} bytes\n")
    out.write(f"Source stream: {sizes['source stream']} bytes\n")
    out.write(f"Strings: {sizes['strings']} bytes\n")
    out.write(f"Total metadata: {meta.size} bytes\n")
    if not with_stats:
        return
    stats = meta.stats
    out.write(f"Source intervals: {len(meta.intervals)}\n")
    categories = [("combined", "0x00-0x7F"), ("set", "0x80"), ("large", "0x81"),
                  ("unmapped", "0x82"), ("short_large", "0x83-0x92"),
                  ("short_unmapped", "0x93-0xFF")]
    for key, label in categories:
        out.write(f"Transitions {label} ({key}): {stats[key]}, "
                  f"{stats['bytes'][key]} stream bytes\n")
    out.write(f"Resumptions after a gap: {stats['resume']}\n")
    out.write(f"  same file: {stats['resume_same_file']}, cross-file: {stats['resume_cross_file']}\n")
    out.write(f"  same line: {stats['resume_same_line']}\n")
    out.write(f"  encoded in one byte: {stats['resume_one_byte']}, "
              f"short large: {stats['resume_short_large']}, "
              f"extended: {stats['resume_extended']}\n")
    operands = ", ".join(f"{n}-byte {count}" for n, count in sorted(stats['uleb'].items()))
    out.write(f"ULEB128 operands: {operands}\n")
    if transitions:
        per = (sizes['source stream'] - 3) / transitions
        out.write(f"Source stream bytes per transition: {per:.3f}\n")
    names = name_lengths(meta)
    prefixes = sum(len(p) for p in meta.prefix_bytes.values())
    out.write(f"String count: {len(meta.prefix_bytes)}\n")
    out.write(f"Length-prefix bytes: {prefixes}\n")
    out.write(f"Function-name characters: {sum(names)}, "
              f"with NUL terminators: {sum(names) + len(names)}\n")
    if names:
        median = names[len(names) // 2] if len(names) % 2 else \
            (names[len(names) // 2 - 1] + names[len(names) // 2]) / 2
        out.write(f"Function-name length: max {names[-1]}, median {median:g}\n")
    out.write(f"String pool: {sizes['strings']} bytes\n")
    out.write(f"Checkpoints: {sizes['checkpoints']} bytes\n")
    out.write(f"AVD1 total: {meta.size} bytes\n")


def main(argv):
    parser = argparse.ArgumentParser(description="Inspect AVD1 crash metadata.")
    parser.add_argument("--stats", action="store_true",
                        help="add transition and operand statistics")
    parser.add_argument("--records", action="store_true",
                        help="print FN and LN records")
    parser.add_argument("--lookup", metavar="PC", action="append", default=[],
                        help="evaluate a lookup at PC (repeatable)")
    parser.add_argument("--boundaries", action="store_true",
                        help="evaluate lookups just before, at, and after each interval")
    parser.add_argument("--transitions", action="store_true",
                        help="print each transition's emitted bytes")
    parser.add_argument("--checkpoints", action="store_true",
                        help="print each checkpoint's state and stream offset")
    parser.add_argument("--strings", action="store_true",
                        help="print each string-pool record and its length prefix")
    parser.add_argument("image")
    args = parser.parse_args(argv)

    with open(args.image, "rb") as handle:
        image = handle.read()
    out = sys.stdout
    try:
        meta = parse(image)
    except CrashError as error:
        sys.stderr.write(f"dump-crash: {error}\n")
        return 1
    if meta is None:
        out.write("crash: none\n" if args.records else "Format: none\n")
        return 0
    probes = [int(text, 0) for text in args.lookup]
    if args.boundaries:
        edges = set()
        for start, end, _, _ in meta.intervals:
            edges.update(pc for pc in (start - 1, start, end - 1, end) if 0 <= pc <= MAX_PC)
        probes.extend(sorted(edges))
    if args.checkpoints:
        report_checkpoints(meta, out)
    elif args.transitions:
        report_transitions(meta, out)
    elif args.strings:
        report_strings(meta, out)
    elif probes:
        for pc in probes:
            function, source = lookup(meta, pc)
            location = f"{source[0]}:{source[1]}" if source else "?:0"
            out.write(f"LOOKUP 0x{pc:06x} function={function or '?'} source={location}\n")
    elif args.records:
        report_records(meta, out)
    else:
        report_summary(meta, out, args.stats)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
