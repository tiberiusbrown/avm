"""Batch-mode acceptance checks for the built or installed AVM LLDB SDK."""

import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def lldb(executable, image, *commands, on_crash=()):
    argv = [str(executable), "--batch"]
    for command in commands:
        argv.extend(("-o", command))
    for command in on_crash:
        argv.extend(("-k", command))
    argv.append(str(image))
    # LLDB waits for input at exit after an on-crash stop when stdin is open.
    completed = subprocess.run(argv, text=True, stdin=subprocess.DEVNULL,
                               stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                               timeout=90)
    require(completed.returncode == 0,
            f"LLDB failed ({completed.returncode}):\n{completed.stdout}")
    records = []
    for line in completed.stdout.splitlines():
        line = line.strip()
        if line.startswith("{") and line.endswith("}"):
            records.append(json.loads(line))
    return completed.stdout, records


def capture_matches(record):
    path = Path(record["path"])
    contents = path.read_bytes()
    header = b"P5\n128 64\n255\n"
    require(contents.startswith(header), "capture is not a 128x64 PGM")
    pixels = contents[len(header):]
    require(len(pixels) == 128 * 64, "capture has wrong pixel count")
    require(hashlib.sha256(pixels).hexdigest() == record["sha256"],
            "capture metadata hash differs from pixel bytes")


def launch_route(executable, image, log, *commands):
    """Runs LLDB with its launch log and returns the output, records, and log."""
    output, records = lldb(
        executable, image,
        f'log enable -f "{log}" lldb target platform process', *commands)
    return output, records, log.read_text(encoding="utf-8")


def launch_route_checks(executable, c_image, work):
    """Checks that AVM images use ProcessAVM and native images use the host."""
    failure_text = re.compile(r"execve failed|Exec format error")
    with tempfile.TemporaryDirectory(prefix="lldb-launch-", dir=work) as raw:
        directory = Path(raw)

        # Automatic selection: plain run must pick the AVM process plugin.
        output, records, trace = launch_route(
            executable, c_image, directory / "run.log",
            "breakpoint set --name main", "run", "avm stop")
        require(not failure_text.search(output),
                f"AVM run reached the host launcher: {output}")
        require(records[-1]["reason"] == "breakpoint" and
                records[-1]["cycles"] > 0,
                "automatic AVM launch did not stop at main")
        require("getting a process plugin" in trace and
                "(plugin = avm, " in trace and
                "asking the platform to debug the process" not in trace,
                "automatic AVM launch did not select the avm process plugin")

        # Explicit selection: process launch -P avm must select the same plugin.
        output, records, trace = launch_route(
            executable, c_image, directory / "explicit.log",
            "breakpoint set --name main", "process launch -P avm", "avm stop")
        require(not failure_text.search(output),
                f"process launch -P avm reached the host launcher: {output}")
        require(records[-1]["reason"] == "breakpoint",
                "explicit AVM launch did not stop at main")
        require("getting a process plugin" in trace and
                "(plugin = avm, " in trace and
                "asking the platform to debug the process" not in trace,
                "explicit AVM launch did not select the avm process plugin")

        # Native regression: a host executable keeps the platform launch path.
        host_program = shutil.which("true")
        if host_program is None:
            print("Native launch regression skipped: no host 'true' executable")
            return
        output, _, trace = launch_route(
            executable, Path(host_program), directory / "native.log",
            "run", "process status")
        require("exited with status = 0" in output,
                f"native host launch did not run to completion: {output}")
        require("asking the platform to debug the process" in trace and
                "(plugin = avm, " not in trace,
                "native host launch did not stay on the platform path")


# The deterministic chain in unwind_cfi_fixture.c, innermost frame first. The
# leaf is frameless, unwind_chain_args takes stack arguments, unwind_chain_dynamic
# moves SP at run time with r3 as its frame pointer, and unwind_chain_top is
# frameless. _start is the crt0 entry that calls main.
UNWIND_CHAIN = ("unwind_chain_leaf", "unwind_chain_args",
                "unwind_chain_dynamic", "unwind_chain_top", "main", "_start")
DISASSEMBLY_LINE = re.compile(
    r"^\s*(?:->)?\s*(?:[^\s\[]*\[)?0x([0-9a-fA-F]+)\]?(?: <\+\d+>)?:"
    r"\s+(\S+)\s*(.*?)\s*$")
FRAME_LINE = re.compile(r"frame #(\d+): 0x([0-9a-fA-F]+) [^\s`]*`([A-Za-z_]\w*)")
REGISTER_LINE = re.compile(r"^\s*\w+ = 0x([0-9a-fA-F]+)\s*$", re.MULTILINE)


def command_texts(output, command):
    """Return the text LLDB printed after each echo of one batch command."""
    marker = f"(lldb) {command}\n"
    texts = []
    start = output.find(marker)
    while start != -1:
        start += len(marker)
        end = output.find("\n(lldb) ", start)
        texts.append(output[start:] if end == -1 else output[start:end])
        start = output.find(marker, start)
    return texts


def disassembly(executable, image, function):
    """Return (address, mnemonic, operands) for each instruction of function."""
    command = f"disassemble --name {function}"
    output, _ = lldb(executable, image, command)
    instructions = []
    for line in command_texts(output, command)[0].splitlines():
        match = DISASSEMBLY_LINE.match(line)
        if match:
            instructions.append((int(match.group(1), 16), match.group(2),
                                 match.group(3)))
    require(instructions, f"no disassembly for {function}")
    return instructions


def frame_offsets(code, pc):
    """Return (sp, r3) offsets from the entry SP at pc, None when unknown.

    The entry SP is CFA0 - 3. A PUSH16 moves SP by two bytes, ADJSP by its
    immediate, GETSP r3 records the current offset in r3, and SETSP r3
    restores it. Any other SETSP makes SP unknown."""
    sp = 0
    r3 = None
    for address, mnemonic, operands in code:
        if address >= pc:
            break
        if mnemonic == "push16" and sp is not None:
            sp -= 2
        elif mnemonic == "pop16" and sp is not None:
            sp += 2
        elif mnemonic == "adjsp" and sp is not None:
            sp += int(operands, 0)
        elif mnemonic == "getsp" and operands == "r3":
            r3 = sp
        elif mnemonic == "setsp":
            sp = r3 if operands == "r3" else None
    return sp, r3


def caller_stack(code, pc, sp, r3):
    """Return (CFA0, sp_known) for the frame at pc, from its own rule.

    An SP-based frame uses the SP value. Once SP is unknown, the frame must
    be recovered through r3, which is the frame-pointer rule."""
    sp_offset, r3_offset = frame_offsets(code, pc)
    if sp_offset is not None:
        return sp + 3 - sp_offset, True
    require(r3 is not None and r3_offset is not None,
            f"frame at {pc:#x} has neither a known SP nor a known r3")
    return r3 + 3 - r3_offset, False


def return_addresses(caller, callee_start):
    """Return the instruction after each call that enters callee_start."""
    returns = []
    for index, (_, mnemonic, operands) in enumerate(caller[:-1]):
        if not mnemonic.startswith("call"):
            continue
        try:
            displacement = int(operands.split()[0], 0)
        except ValueError:
            continue
        next_address = caller[index + 1][0]
        if next_address + displacement == callee_start:
            returns.append(next_address)
    return returns


def stop_frames(executable, image, stop_commands):
    """Return (pc, name, sp, r3) for each frame at a stop.

    A SYS debug_break stop aborts the batch commands, so the same inspection
    commands also run as on-crash commands. A breakpoint stop runs them as
    ordinary commands and never reaches the on-crash list."""
    inspect = ["thread backtrace"]
    output, _ = lldb(executable, image, *stop_commands, *inspect,
                     on_crash=inspect)
    listing = command_texts(output, "thread backtrace")[0]
    frames = [(int(match.group(2), 16), match.group(3))
              for match in FRAME_LINE.finditer(listing)]
    require(frames, f"no frames at stop: {output}")
    inspect = []
    for index in range(len(frames)):
        inspect += [f"frame select {index}", "register read sp",
                    "register read r3"]
    output, _ = lldb(executable, image, *stop_commands, *inspect,
                     on_crash=inspect)
    values = []
    for name in ("register read sp", "register read r3"):
        texts = command_texts(output, name)
        require(len(texts) == len(frames), f"missing registers: {output}")
        values.append([int(REGISTER_LINE.search(text).group(1), 16)
                       for text in texts])
    return [(pc, name, values[0][index], values[1][index])
            for index, (pc, name) in enumerate(frames)]


def check_stop(executable, image, label, stop_commands, expected_names,
               expected_pc=None, dynamic=(), entered_by=None):
    """Check one stop's frames against the ELF.

    A caller's PC must be the return address of a call to its callee, and
    each caller SP must equal the CFA that the callee's SP or r3 rule gives.
    Frames named in dynamic must have an unknown SP, so their caller comes
    from r3. entered_by maps a frame reached by a tail jump to the function
    whose call returns to its caller."""
    frames = stop_frames(executable, image, stop_commands)
    names = tuple(name for _, name, _, _ in frames)
    require(names == expected_names,
            f"{label}: frames {names} differ from {expected_names}")
    if expected_pc is not None:
        require(frames[0][0] == expected_pc,
                f"{label}: stop PC {frames[0][0]:#x} is not {expected_pc:#x}")
    codes = {name: disassembly(executable, image, name) for name in names}
    for index in range(len(frames) - 1):
        pc, name, sp, r3 = frames[index]
        callee_code = codes[name]
        caller_pc, caller_name, _, _ = frames[index + 1]
        entry = (entered_by or {}).get(name, name)
        callee_start = disassembly(executable, image, entry)[0][0]
        require(caller_pc in return_addresses(codes[caller_name], callee_start),
                f"{label}: {caller_name} PC {caller_pc:#x} is not the return "
                f"address of a call to {name}")
        cfa, sp_known = caller_stack(callee_code, pc, sp, r3)
        require(sp_known == (name not in dynamic),
                f"{label}: {name} at {pc:#x} is "
                f"{'SP' if sp_known else 'r3'}-based, not as expected")
        require(frames[index + 1][2] == cfa,
                f"{label}: caller {caller_name} SP {frames[index + 1][2]:#x}"
                f" differs from CFA {cfa:#x} of {name}")
    return frames


def unwind_checks(executable, unwind_dir, work):
    """Checks LLDB's stack unwinding on the deterministic unwind fixtures."""
    o0 = unwind_dir / "O0" / "fixture.elf"
    o2 = unwind_dir / "O2" / "fixture.elf"
    nodebug = unwind_dir / "O2-nodebug" / "fixture.elf"
    fp = unwind_dir / "O2-fp" / "fixture.elf"
    for image in (o0, o2, nodebug, fp):
        require(image.is_file(), f"missing unwind fixture {image}")

    dynamic_fn = "unwind_chain_dynamic"
    dynamic_code = disassembly(executable, o0, dynamic_fn)
    addresses = [address for address, _, _ in dynamic_code]
    index_of = {(mnemonic, operands): index for index, (_, mnemonic, operands)
                in enumerate(dynamic_code)}
    after_push = addresses[1]
    after_fp = addresses[index_of[("getsp", "r3")] + 1]
    setsp_index = next(index for index, (_, mnemonic, operands)
                       in enumerate(dynamic_code)
                       if mnemonic == "setsp" and operands != "r3")
    after_alloc = addresses[setsp_index + 1]
    after_restore = addresses[index_of[("setsp", "r3")] + 1]
    ret_address = addresses[index_of[("ret", "")]]
    call_index = next(index for index, (_, mnemonic, _) in enumerate(dynamic_code)
                      if mnemonic.startswith("call"))
    after_call = addresses[call_index + 1]
    require(dynamic_code[0][1] == "push16" and after_fp > after_push,
            "dynamic function does not start with its frame-pointer prologue")

    def breakpoint_at(address):
        return f"breakpoint set --address 0x{address:x}"

    dynamic_tail = ("unwind_chain_dynamic", "unwind_chain_top", "main",
                    "_start")
    for label, address in (
            ("after first push", after_push),
            ("after frame pointer", after_fp),
            ("after stack allocation", after_alloc),
            ("after SP restoration", after_restore),
            ("before return", ret_address),
            ("after call returns", after_call)):
        check_stop(executable, o0, f"O0 {label}",
                   (breakpoint_at(address), "run"),
                   dynamic_tail, expected_pc=address,
                   dynamic=(dynamic_fn,)
                   if label in ("after stack allocation", "after call returns")
                   else ())

    # Function entry of the leaf, then the nested chain for each variant.
    for image, label in ((o0, "O0"), (o2, "O2"), (nodebug, "O2-nodebug"),
                         (fp, "O2-fp")):
        entry = disassembly(executable, image, "unwind_chain_leaf")[0][0]
        check_stop(executable, image, f"{label} leaf entry",
                   (breakpoint_at(entry), "run"), UNWIND_CHAIN,
                   expected_pc=entry, dynamic=(dynamic_fn,))

    # Dynamic-SP stop: the caller of the dynamic frame is recovered through r3.
    entry = disassembly(executable, o0, "unwind_chain_args")[0][0]
    check_stop(executable, o0, "dynamic caller", (breakpoint_at(entry), "run"),
               UNWIND_CHAIN[1:], expected_pc=entry, dynamic=(dynamic_fn,))

    # Trap stop: the leaf executes SYS debug_break inside the nested chain. The
    # O2 build inlines the service, so the leaf is the innermost frame.
    leaf = disassembly(executable, o2, "unwind_chain_leaf")
    service = next(index for index, (_, mnemonic, operands) in enumerate(leaf)
                   if mnemonic == "sys" and operands == "debug_break")
    output, records = lldb(executable, o2, "run", on_crash=("avm stop",))
    require(records[-1]["reason"] == "debug_break",
            f"trap stop reason was {records[-1]['reason']}")
    check_stop(executable, o2, "trap stop", ("run",), UNWIND_CHAIN,
               expected_pc=leaf[service + 1][0], dynamic=(dynamic_fn,))

    # Tail call: unwind_tail_select jumps to unwind_tail_direct, which has no
    # caller of its own, so only main and _start remain as physical frames.
    tail = disassembly(executable, o2, "unwind_tail_direct")[0][0]
    check_stop(executable, o2, "tail call", (breakpoint_at(tail), "run"),
               ("unwind_tail_direct", "main", "_start"), expected_pc=tail,
               entered_by={"unwind_tail_direct": "unwind_tail_select"})
    print("AVM LLDB unwind: deterministic chain, dynamic-SP, trap, boundary, "
          "and tail-call stops verified")


def source_line(source, marker):
    matches = [number for number, text in
               enumerate(source.read_text().splitlines(), 1) if marker in text]
    require(len(matches) == 1, f"marker {marker!r} is not unique in {source.name}")
    return matches[0]


def relax_debug_checks(executable, relax_image):
    # The relaxed fixture stops inside an inlined body, after a relaxed call, and
    # inside a callee, so each stop must name the physical and inlined frames.
    source = Path(__file__).resolve().parent / "relax_debug_info_fixture.cpp"
    require(source.is_file(), "missing relaxation fixture source")
    mix_line = source_line(source, "if (result & 1) relax_debug_step(result);")
    tail_line = source_line(source, "relax_debug_step(tail);")

    output, _ = lldb(
        executable, relax_image,
        f"breakpoint set --file relax_debug_info_fixture.cpp --line {mix_line}",
        "run", "thread backtrace", "avm stop")
    require(f"relax_debug_info_fixture.cpp:{mix_line}" in output and
            "relax_debug_mix" in output and "relax_debug_outer" in output,
            "breakpoint inside an inlined relaxed range lost its scope")

    output, _ = lldb(
        executable, relax_image,
        f"breakpoint set --file relax_debug_info_fixture.cpp --line {tail_line}",
        "run", "thread backtrace", "avm stop")
    require(f"relax_debug_info_fixture.cpp:{tail_line}" in output and
            "relax_debug_outer" in output,
            "breakpoint after relaxed calls resolved to the wrong line")

    output, _ = lldb(
        executable, relax_image,
        "breakpoint set --name relax_debug_step", "run", "thread backtrace",
        "avm stop")
    require("relax_debug_step" in output and "relax_debug_outer" in output
            and "`main" in output,
            "callee of a relaxed call lost its physical backtrace")
    print("AVM LLDB relaxation: inlined, post-call, and callee stops verified")


# Each stop reads variables whose location list entry covers the stop address.
# The fixture's input is the volatile 6 that main stores, so every expected value
# is what the source computes: mixed = 6 ^ 3, scaled = 6 << 1, total = 5 + 12,
# tail = 17 ^ 6, first = 6 + 1, second = 7 + 6, and the inlined fold results.
RELAX_VARIABLE_STOPS = (
    (0xe04, (("input", 6, "0x"),
             ("*(volatile unsigned char *)$sp", 6, None))),
    (0xe1c, (("seed", 6, "r0"),)),
    (0xe48, (("seed", 6, "r0"), ("mixed", 5, "r1"))),
    (0xe5c, (("scaled", 12, "r3"),)),
    (0xe69, (("a", 17, "r1"), ("b", 6, "r0"))),
    (0xe7a, (("total", 17, "r1"), ("tail", 23, "r0"))),
    (0xe88, (("seed", 6, "r4"),)),
    (0xe8e, (("seed", 6, "r0"),)),
    (0xe97, (("folded", 7, "r2"), ("a", 6, "r0"))),
    (0xea4, (("seed", 6, "r0"), ("first", 7, "r2"))),
    (0xeab, (("folded", 13, "r0"),)),
    (0xeba, (("second", 13, "r0"),)),
)


def relax_variable_checks(executable, relax_image):
    """Reads known values from location lists, a stack slot, and inlined scopes."""
    commands = [f"breakpoint set --address {address:#x}"
                for address, _ in RELAX_VARIABLE_STOPS]
    commands.append("run")
    for index, (_, reads) in enumerate(RELAX_VARIABLE_STOPS):
        commands.append("frame variable -L")
        commands.extend(f"expr -- (unsigned){name}" for name, _, _ in reads)
        if index + 1 < len(RELAX_VARIABLE_STOPS):
            commands.append("continue")
    output, _ = lldb(executable, relax_image, *commands)

    # Each stop begins with its breakpoint report, so split the output per stop.
    stops = re.split(r"(?=\* thread #1, stop reason = breakpoint )", output)[1:]
    require(len(stops) == len(RELAX_VARIABLE_STOPS),
            f"expected {len(RELAX_VARIABLE_STOPS)} variable stops, got {len(stops)}")
    for index, ((address, reads), block) in enumerate(
            zip(RELAX_VARIABLE_STOPS, stops)):
        require(f"stop reason = breakpoint {index + 1}.1" in block,
                f"variable stop {index + 1} was not breakpoint {index + 1}")
        require(re.search(rf"frame #0: 0x0*{address:x} ", block),
                f"variable stop at {address:#x} stopped elsewhere")
        values = [int(value) for value in
                  re.findall(r"\(unsigned int\) \$\d+ = (\d+)", block)]
        require(values == [expected for _, expected, _ in reads],
                f"values at {address:#x} were {values}, expected "
                f"{[expected for _, expected, _ in reads]}")
        for name, _, location in reads:
            if location is None:
                continue
            match = re.search(rf"^(\S*): .*\) {re.escape(name)} = ", block,
                              re.MULTILINE)
            require(match is not None and match.group(1).startswith(location),
                    f"{name} at {address:#x} is not located at {location}")

    # Stop at the entry of relax_debug_outer, where seed starts in r4 and moves.
    output, _ = lldb(executable, relax_image, "breakpoint set --address 0xe16",
                     "run", "frame variable -L", "expr -- (unsigned)seed")
    require("r4: (uint8_t) seed" in output and "(unsigned int) $0 = 6" in output,
            "seed at relax_debug_outer entry was not in r4 with value 6")
    print("AVM LLDB relaxation: location-list, stack, and inlined values verified")


def main():
    executable, c_image, cpp_image, unwind_dir, work, relax_image = map(
        Path, sys.argv[1:7])
    require(executable.is_file() and c_image.is_file() and cpp_image.is_file()
            and relax_image.is_file(),
            "missing debugger or debug fixture")
    work.mkdir(parents=True, exist_ok=True)

    launch_route_checks(executable, c_image, work)
    unwind_checks(executable, unwind_dir, work)
    relax_debug_checks(executable, relax_image)
    relax_variable_checks(executable, relax_image)

    output, records = lldb(
        executable, c_image,
        "breakpoint set --name debug_leaf", "run", "thread backtrace",
        "frame variable", "target variable debug_counter", "disassemble --frame",
        "avm stop", "avm time")
    require("debug_leaf(argument=10" in output, "leaf parameters unavailable")
    require("debug_middle(argument=7" in output and "`main" in output,
            "nested AVM backtrace unavailable")
    require("debug_counter = 4660" in output, "global DWARF value is wrong")
    require("local = 0" in output, "local DWARF value is wrong")
    require("ldp8u" in output, "AVM disassembler was not selected")
    require(records[-2]["reason"] == "breakpoint", "breakpoint stop missing")
    require(records[-1]["cycles_since_entry"] > 0, "entry time missing")

    with tempfile.TemporaryDirectory(prefix="lldb-command-file-", dir=work) as raw:
        script = Path(raw) / "commands with spaces.lldb"
        script.write_text("breakpoint set --name main\nrun\navm stop\n",
                          encoding="utf-8")
        scripted = subprocess.run(
            [str(executable), "--batch", "--source", str(script), str(c_image)],
            text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
            timeout=15)
        require(scripted.returncode == 0 and
                any('"reason":"breakpoint"' in line
                    for line in scripted.stdout.splitlines()),
                f"LLDB command-file mode failed: {scripted.stdout}")

        missing = subprocess.run(
            [str(executable), "--batch", "-o", "run", str(c_image)],
            text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
            env={**os.environ, "AVM_LLDB_INTERP": str(Path(raw) / "missing.hex")},
            timeout=15)
        require(missing.returncode != 0 and "cannot open" in missing.stdout and
                "missing.hex" in missing.stdout,
                f"missing interpreter did not give an actionable error: {missing.stdout}")
    leaf_address = re.search(r"Breakpoint 1:.*address = 0x([0-9a-fA-F]+)",
                             output)
    require(leaf_address is not None, "leaf address was not resolved")
    lookup, _ = lldb(executable, c_image, "image lookup -n debug_leaf")
    function_start = re.search(r"Address: fixture\.elf\[0x([0-9a-fA-F]+)\]", lookup)
    require(function_start is not None, "leaf function entry was not resolved")
    for offset in (0, 2):
        entry = int(function_start.group(1), 16) + offset
        unwind, _ = lldb(
            executable, c_image,
            f"breakpoint set --address 0x{entry:x}", "run", "thread backtrace")
        require("`debug_leaf" in unwind and "`debug_middle" in unwind and
                "`main" in unwind,
                f"AVM unwind failed at function prologue +{offset}")
    output, records = lldb(
        executable, c_image,
        f"breakpoint set --address 0x{leaf_address.group(1)}", "run",
        "avm stop")
    require(records[-1]["reason"] == "breakpoint" and
            records[-1]["pc"] == int(leaf_address.group(1), 16),
            "numeric AVM address breakpoint failed")

    output, records = lldb(
        executable, c_image,
        "breakpoint set --name main", "run", "avm stop", "process kill",
        "run", "avm stop")
    require(records[0]["reason"] == "breakpoint" and
            records[0]["pc"] == records[1]["pc"] and
            records[0]["cycles"] == records[1]["cycles"],
            "AVM relaunch did not reset deterministically")

    output, records = lldb(
        executable, c_image,
        "breakpoint set --name main", "run",
        "avm button set UP RIGHT LEFT DOWN A B", "avm button status",
        "avm button set", "avm button status", "avm run-for 0cycles")
    require(records[0]["pressed_mask"] == 63 and
            records[1]["pressed_mask"] == 63 and
            records[2]["pressed_mask"] == 0 and
            records[3]["pressed_mask"] == 0 and
            records[4]["reason"] == "deadline" and
            records[4]["requested_cycles"] == 0,
            "six-button combinations or zero-duration run failed")

    output, records = lldb(
        executable, c_image,
        "breakpoint set --name debug_leaf", "run", "thread step-inst",
        "avm stop", "step", "next", "finish", "avm stop")
    require("instruction step into" in output and "step over" in output and
            "step out" in output and "debug_middle(argument=7" in output,
            "AVM instruction/source step, next, or finish failed")
    require(records[0]["reason"] == "step", "instruction step reason missing")

    output, _ = lldb(
        executable, c_image,
        "breakpoint set --name debug_leaf", "run", "register write r0 0x1234",
        "register read r0", "memory write --size 1 0x01000100 0x44",
        "memory read --size 1 --count 2 0x01000100")
    require("r0 = 0x1234" in output and "0x01000100: 44 12" in output,
            "AVM register or data-memory mutation failed")

    output, _ = lldb(
        executable, c_image,
        "breakpoint set --file fixture.c --line 12", "run")
    require("stop reason = breakpoint" in output and "fixture.c:12" in output,
            "AVM source-line breakpoint failed")

    output, _ = lldb(
        executable, c_image,
        "breakpoint set --name debug_leaf --ignore-count 1",
        "breakpoint set --file fixture.c --line 27", "run",
        "breakpoint list")
    require("stop reason = breakpoint 2.1" in output and
            "name = 'debug_leaf', locations = 1, resolved = 1, hit count = 1"
            in output,
            "AVM breakpoint ignore or hit count failed")

    optimized = c_image.parent.parent / "O2" / "fixture.elf"
    require(optimized.is_file(), "missing optimized DWARF fixture")
    output, _ = lldb(
        executable, optimized,
        "breakpoint set --name debug_leaf", "run", "frame variable")
    require("argument = 10" in output and
            "<no location, value may have been optimized out>" in output,
            "optimized AVM variable locations were misreported")

    output, _ = lldb(
        executable, c_image,
        "breakpoint set --name debug_leaf",
        "breakpoint set --file fixture.c --line 27", "run", "expr 1+2",
        "expr $0+4", "expr argument+2",
        "expr (unsigned)program_pointer[0]",
        "expr *((uint16_t*)0x100)", "expr debug_counter=0x4321",
        "frame variable debug_counter", "continue",
        "frame variable debug_counter")
    require("$0 = 3" in output and "$1 = 7" in output and
            "$2 = 12" in output and "$3 = 165" in output and
            "$4 = 4660" in output and "$5 = 17185" in output and
            "debug_counter = 17185" in output and
            "debug_counter = 17360" in output,
            f"host-only AVM expressions or guest assignment failed: {output}")

    output, _ = lldb(
        executable, c_image,
        "breakpoint set --name debug_leaf --condition argument==10", "run")
    require("stop reason = breakpoint 1.1" in output,
            "true AVM breakpoint condition did not stop")
    output, _ = lldb(
        executable, c_image,
        "breakpoint set --name debug_leaf --condition argument==11",
        "breakpoint set --file fixture.c --line 27", "run")
    require("stop reason = breakpoint 2.1" in output,
            "false AVM breakpoint condition did not continue")

    rejected = subprocess.run(
        [str(executable), "--batch", "-o", "breakpoint set --name debug_leaf",
         "-o", "run", "-o", "expr debug_leaf(3, program_pointer)",
         str(c_image)],
        text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
        timeout=15)
    require(rejected.returncode != 0 and
            "Interpreter cannot execute function calls" in rejected.stdout,
            f"AVM guest function call unexpectedly ran: {rejected.stdout}")

    rejected = subprocess.run(
        [str(executable), "--batch", "-o", "breakpoint set --name main",
         "-o", "run", "-o", "avm watch read 0x50", str(c_image)],
        text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
        timeout=15)
    failures = [json.loads(line) for line in rejected.stdout.splitlines()
                if line.startswith('{') and line.endswith('}')]
    require(rejected.returncode != 0 and len(failures) == 1 and
            failures[0] == {"ok": False,
                            "error": "AVM watchpoint must be within data RAM 0x100-0x9ff"},
            f"AVM command error was not machine-readable: {rejected.stdout}")

    with tempfile.TemporaryDirectory(prefix="lldb-invalid-", dir=work) as raw:
        incompatible = Path(raw) / "wrong-abi.elf"
        contents = bytearray(c_image.read_bytes())
        contents[36] = 1  # ELF e_flags, incompatible AVM ABI version.
        incompatible.write_bytes(contents)
        rejected = subprocess.run(
            [str(executable), "--batch", "-o", "run", str(incompatible)],
            text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
            timeout=15)
        require(rejected.returncode != 0 and
                "not a valid executable" in rejected.stdout,
                "LLDB accepted an incompatible AVM ELF ABI")

    output, records = lldb(
        executable, c_image,
        "breakpoint set --name debug_leaf", "run",
        "watchpoint set variable -w read debug_counter", "continue", "avm stop")
    require(records[-1]["reason"] == "watchpoint" and
            records[-1]["access"]["kind"] == "read" and
            records[-1]["access"]["address"] in (0x100, 0x101),
            "read watchpoint missed guest access")

    output, _ = lldb(
        executable, c_image,
        "breakpoint set --name debug_leaf", "run",
        "frame variable -L argument")
    argument_location = re.search(r"0x([0-9a-fA-F]+): \(uint16_t\) argument", output)
    require(argument_location is not None, "stack argument location unavailable")
    argument_address = 0x01000000 + int(argument_location.group(1), 16)
    output, records = lldb(
        executable, c_image,
        "breakpoint set --name debug_leaf", "run",
        f"memory write --size 2 0x{argument_address:x} 0xff5b",
        "watchpoint set variable -w write debug_counter", "continue",
        "avm stop", "target variable debug_counter")
    require(records[-1]["reason"] == "watchpoint" and
            records[-1]["access"]["kind"] == "write" and
            "old value: 4660" in output and "new value: 4660" in output and
            "debug_counter = 4660" in output,
            "same-value guest store did not trigger a write watchpoint")

    output, records = lldb(
        executable, c_image,
        "breakpoint set --name main", "run", "avm watch write 0x500 1",
        "avm run-for 20000cycles", "avm run-for 20000cycles", "avm stop")
    hits = [record for record in records if record.get("reason") == "watchpoint"]
    require(len(hits) == 3, "expected two framebuffer write stops")
    require(hits[0]["access"]["address"] == 0x500 and
            hits[1]["access"]["address"] == 0x500 and
            hits[0]["access"]["instruction_pc"] !=
            hits[1]["access"]["instruction_pc"],
            "guest store and system-service store were not distinguished")
    require(hits[1]["access"]["kind"] == "write", "service write kind wrong")

    with tempfile.TemporaryDirectory(prefix="lldb-display-", dir=work) as raw:
        directory = Path(raw)
        output, records = lldb(
            executable, c_image,
            "breakpoint set --name main", "run", "avm watch write 0x500 1",
            "avm run-for 20000cycles",
            f"avm display save {directory / 'logical.pgm'} --mode logical",
            f"avm display save {directory / 'visible.pgm'} --mode visible",
            f"avm display capture {directory / 'controller.pgm'} --mode controller")
        captures = [r for r in records if "pixel_format" in r]
        require(len(captures) == 3 and
                captures[0]["sha256"] != captures[1]["sha256"],
                "logical and physical display states did not diverge")
        for record in captures:
            capture_matches(record)

    output, records = lldb(
        executable, cpp_image,
        "breakpoint set --name debug_far", "run", "thread backtrace",
        "frame variable", "disassemble --frame",
        "frame variable --no-summary -f x program_pointer",
        "frame variable -f x program_pointer[0]",
        "frame variable -f x pair.left", "frame variable -f x pair.right",
        "expr pair.left + pair.right", "expr (unsigned)program_pointer[0]",
        "continue", on_crash=("avm stop",))
    require("0x00010108" in output and "DebugPair" in output and
            "`main" in output and "ldp8u" in output,
            "far C++ code, types, or unwind unavailable")
    require("program_pointer = 0x011000" in output and
            "program_pointer[0] = 0x05" in output and
            "pair.left = 0x0003" in output and "pair.right = 0x04" in output and
            re.search(r"\$\d+ = 7\b", output) and
            re.search(r"\$\d+ = 5\b", output),
            "16-bit data or far 24-bit program pointer dereference failed")
    require(records[-1]["reason"] == "debug_break",
            "AVM SYS debug_break stop reason missing")

    with tempfile.TemporaryDirectory(prefix="lldb-integration-", dir=work) as raw:
        directory = Path(raw)
        replay = directory / "buttons.json"
        replay.write_text(json.dumps({"version": 1, "events": [
            {"cycle": 0, "pressed": ["DOWN", "A"]},
            {"cycle": 50000, "pressed": []}]}), encoding="utf-8")

        output, records = lldb(
            executable, c_image,
            "breakpoint set --name main", "breakpoint set --name debug_leaf",
            "run", f"avm replay load {replay}", "avm replay run",
            "avm replay status", "breakpoint disable 2", "avm replay resume",
            "avm replay status", "avm button status", "avm time",
            f"avm display save {directory / 'visible.pgm'} --mode visible",
            f"avm display save {directory / 'logical.pgm'} --mode logical")
        stops = [r for r in records if "reason" in r]
        require(stops[0]["reason"] == "breakpoint" and
                stops[0]["pending_events"] == 1,
                "breakpoint discarded replay release event")
        require(stops[1]["reason"] == "deadline" and
                stops[1]["pending_events"] == 0,
                "replay did not complete after breakpoint")
        require(any(r.get("pressed_mask") == 0 for r in records),
                "replay did not release buttons")
        captures = [r for r in records if "pixel_format" in r]
        require({r["mode"] for r in captures} == {"visible", "logical"},
                "capture modes missing")
        for record in captures:
            capture_matches(record)

        paced = []
        for mode in ("off", "on"):
            output, records = lldb(
                executable, c_image,
                "breakpoint set --name main", "run", f"avm realtime {mode}",
                f"avm replay load {replay}", "avm replay run", "avm time",
                f"avm display save {directory / (mode + '.pgm')} --mode visible")
            require(any(r.get("realtime") is (mode == "on") for r in records),
                    "realtime control failed")
            paced.append((next(r["cycles"] for r in records if "reason" in r),
                          next(r["sha256"] for r in records if "sha256" in r)))
        require(paced[0] == paced[1],
                "paced and unpaced replay diverged in cycle or display hash")

        exported = directory / "exported.json"
        output, records = lldb(
            executable, c_image,
            "breakpoint set --name main", "run", "avm button set DOWN A",
            "avm run-for 100cycles", "avm button set",
            f"avm replay export {exported}")
        require(records[-1]["events"] == 2, "manual button history not exported")
        document = json.loads(exported.read_text(encoding="utf-8"))
        require(document["events"][0] ==
                {"cycle": 0, "pressed": ["DOWN", "A"]} and
                document["events"][1]["pressed"] == [],
                "exported replay event ordering is wrong")
        require(all(document["identity"].get(field) for field in
                    ("elf_sha256", "image_sha256", "interpreter_sha256",
                     "eeprom_sha256", "fxsave_sha256")),
                "replay export lacks launch identity")
        output, records = lldb(
            executable, c_image,
            "breakpoint set --name main", "run", f"avm replay load {exported}",
            "avm replay pause", "avm replay status", "avm replay resume",
            "avm button status")
        require(records[-4]["paused"] is True and
                records[-3]["paused"] is True and
                records[-2]["reason"] == "deadline" and
                records[-1]["pressed_mask"] == 0,
                "exported replay pause/resume did not round-trip")

    print("AVM LLDB integration: source stepping, pointers, DWARF, unwind, "
          "watchpoints, far C++, debug break, replay export, display, and "
          "pacing passed")


if __name__ == "__main__":
    main()
