"""Batch-mode acceptance checks for the built or installed AVM LLDB SDK."""

import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys
import tempfile


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def lldb(executable, image, *commands, on_crash=None):
    argv = [str(executable), "--batch"]
    for command in commands:
        argv.extend(("-o", command))
    if on_crash:
        argv.extend(("-k", on_crash))
    argv.append(str(image))
    completed = subprocess.run(argv, text=True, stdout=subprocess.PIPE,
                               stderr=subprocess.STDOUT, timeout=90)
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


def main():
    executable, c_image, cpp_image, work = map(Path, sys.argv[1:5])
    require(executable.is_file() and c_image.is_file() and cpp_image.is_file(),
            "missing debugger or debug fixture")
    work.mkdir(parents=True, exist_ok=True)

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

    for commands, diagnostic in (
            (["breakpoint set --name debug_leaf", "run", "expr 1+2"],
             "AVM expression execution is unsupported"),
            (["breakpoint set --name debug_leaf --condition argument==11",
              "run"],
             "AVM breakpoint conditions require unsupported expression execution")):
        argv = [str(executable), "--batch"]
        for command in commands:
            argv.extend(("-o", command))
        argv.append(str(c_image))
        rejected = subprocess.run(
            argv, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
            timeout=15)
        require(rejected.returncode != 0 and diagnostic in rejected.stdout,
                f"unsupported AVM expression was not rejected: {rejected.stdout}")

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
        contents[36] = 2  # ELF e_flags, incompatible AVM ABI version.
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
        "continue", on_crash="avm stop")
    require("0x00010108" in output and "DebugPair" in output and
            "`main" in output and "ldp8u" in output,
            "far C++ code, types, or unwind unavailable")
    require("program_pointer = 0x011000" in output and
            "program_pointer[0] = 0x05" in output and
            "pair.left = 0x0003" in output and "pair.right = 0x04" in output,
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
