"""Installed-style AVM profiler and LLDB integration acceptance checks."""

import json
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile


def require(value, message):
    if not value:
        raise AssertionError(message)


def run(argv, expected=0):
    result = subprocess.run([str(x) for x in argv], text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                            timeout=90)
    require(result.returncode == expected,
            f"command returned {result.returncode}, expected {expected}:\n"
            f"{' '.join(map(str, argv))}\n{result.stdout}")
    return result.stdout


def lldb(exe, elf, *commands):
    argv = [exe, "--batch"]
    for command in commands:
        argv.extend(("-o", command))
    argv.append(elf)
    output = run(argv)
    records = []
    for line in output.splitlines():
        if line.startswith("{") and line.endswith("}"):
            records.append(json.loads(line))
    return output, records


def profile(path):
    value = json.loads(path.read_text(encoding="utf-8"))
    require(value["version"] == 1 and
            value["metric"] == "elapsed emulated cycles", "wrong profile header")
    window = value["window"]
    completed = sum(int(row["cycles"]) for row in value["pcs"])
    require(completed == int(window["completed_cycles"]),
            "per-PC elapsed cycles do not reconcile")
    require(completed + int(window["partial_cycles"]) ==
            int(window["end_cycle"]) - int(window["start_cycle"]),
            "window elapsed cycles do not reconcile")
    require(all(row["pc"] <= 0xFFFFFF and int(row["count"]) > 0
                for row in value["pcs"]), "invalid AVM PC or count")
    return value


def pc_costs(value):
    return {row["pc"]: (row["cycles"], row["count"])
            for row in value["pcs"]}


def main():
    profiler, debugger, c_elf, cpp_elf, nodebug_elf, o2_elf, asm_elf, work = \
        map(Path, sys.argv[1:9])
    for path in (profiler, debugger, c_elf, cpp_elf, nodebug_elf, o2_elf,
                 asm_elf):
        require(path.is_file(), f"missing test input: {path}")
    work.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="avm-prof-", dir=work) as raw:
        tmp = Path(raw)
        plain_file = tmp / "plain.avmp"
        run((profiler, "record", c_elf, "--for", "50000cycles",
             "-o", plain_file))
        plain = profile(plain_file)
        require(plain["window"]["complete"] and
                plain["window"]["stop_reason"] == "deadline",
                "plain record did not complete")
        require(plain["window"]["start_cycle"] == "8461621" and
                plain["window"]["end_cycle"] == "8530006" and
                plain["window"]["requested_end_cycle"] == "8511621",
                "fixture boundary contract changed")
        require(any(row["function"] == "debug_leaf" and
                    row["file"].endswith("fixture.c") and row["line"]
                    for row in plain["pcs"]), "C source/function lookup failed")
        require(any(row["bytes"] and row["assembly"] for row in plain["pcs"]),
                "AVM instruction drill-down missing")

        match_file = tmp / "cli-match.avmp"
        run((profiler, "record", c_elf, "--warmup", "1042cycles",
             "--for", "50000cycles", "-o", match_file))
        cli_match = profile(match_file)
        require(cli_match["window"]["start_pc"] == 695 and
                pc_costs(cli_match)[695] == ("38", "1") and
                pc_costs(cli_match)[699] == ("128", "1") and
                pc_costs(cli_match)[822] == ("55854", "3"),
                "known AVM PC/count/cycle fixture changed")
        lldb_file = tmp / "lldb-match.avmp"
        _, records = lldb(debugger, c_elf, "breakpoint set --name main", "run",
                          "avm profile start", "avm run-for 50000cycles",
                          "avm profile status", "avm profile stop",
                          "avm profile report --top 3",
                          f"avm profile save {lldb_file}")
        require(records[0]["running"] and records[2]["running"] and
                not records[3]["running"] and "report" in records[4] and
                records[5]["saved"], "LLDB profile command lifecycle failed")
        lldb_match = profile(lldb_file)
        require(pc_costs(cli_match) == pc_costs(lldb_match) and
                cli_match["window"]["start_cycle"] ==
                lldb_match["window"]["start_cycle"] and
                cli_match["window"]["end_cycle"] ==
                lldb_match["window"]["end_cycle"],
                "CLI and LLDB collector results differ")

        native_file = tmp / "native.avmp"
        run((profiler, "record", c_elf, "--for", "50000cycles",
             "--native", "-o", native_file))
        native = profile(native_file)
        require(pc_costs(native) == pc_costs(plain) and
                native["end_display_hash"] == plain["end_display_hash"],
                "native collection changed AVM execution or display")
        require(native["native_pcs"] and
                sum(int(row["cycles"]) for row in native["native_pcs"]) <=
                int(native["window"]["native_active_cycles"]) <=
                int(native["window"]["native_elapsed_cycles"]),
                "native profiler totals are invalid")
        require(native["interpreter_elf_sha256"] and
                any(row["symbol"] for row in native["native_pcs"]),
                "matching interpreter symbols were not loaded")
        lldb_native_file = tmp / "lldb-native.avmp"
        _, native_records = lldb(debugger, c_elf,
            "breakpoint set --name main", "run",
            "avm profile start --native", "avm run-for 1000cycles",
            "avm profile stop", "avm profile report --top 2",
            f"avm profile save {lldb_native_file}")
        lldb_native = profile(lldb_native_file)
        require(native_records[0]["native"] and
                "Native interpreter" in native_records[-2]["report"] and
                lldb_native["window"]["native"] and
                lldb_native["native_pcs"],
                "LLDB native profiling or interpreter report failed")

        o2_file = tmp / "optimized.avmp"
        run((profiler, "record", o2_elf, "--for", "50000cycles",
             "-o", o2_file))
        optimized = profile(o2_file)
        require(any(row["inline_chain"] for row in optimized["pcs"]),
                "optimized inline chain lookup failed")

        cpp_file = tmp / "cpp.avmp"
        output = run((profiler, "record", cpp_elf, "--for", "200000cycles",
                      "-o", cpp_file), expected=2)
        cpp = profile(cpp_file)
        require("INCOMPLETE" in output and not cpp["window"]["complete"] and
                cpp["window"]["stop_reason"] == "debug_break" and
                any(row["pc"] > 0xFFFF and row["file"].endswith("fixture.cpp")
                    for row in cpp["pcs"]),
                "high 24-bit C++ PC or early-stop marking failed")

        fallback_file = tmp / "fallback.avmp"
        run((profiler, "record", nodebug_elf, "--for", "50000cycles",
             "-o", fallback_file))
        fallback = profile(fallback_file)
        require(any(not row["file"] and row["function"] != "<unmapped>"
                    for row in fallback["pcs"]),
                "source-free symbol fallback missing")

        asm_file = tmp / "assembly.avmp"
        run((profiler, "record", asm_elf, "--for", "10000cycles",
             "-o", asm_file), expected=2)
        assembly = profile(asm_file)
        asm_counts = [int(row["count"]) for row in assembly["pcs"]]
        require(assembly["window"]["stop_reason"] == "debug_break" and
                sorted(asm_counts) == [1, 1, 1, 3, 3, 3] and
                any(row["function"] == "_start" for row in assembly["pcs"]),
                "assembly loop/branch execution contract failed")

        html = tmp / "profile.html"
        run((profiler, "report", plain_file, "--html", html))
        page = html.read_text(encoding="utf-8")
        require("Source heat map" in page and "AVM instruction costs" in page
                and "Functions" in page and "<script>" in page,
                "self-contained report views missing")
        mapped_dir = tmp / "mapped"
        mapped_dir.mkdir()
        shutil.copyfile(c_elf.parents[4] / "tests/debug/fixture.c",
                        mapped_dir / "fixture.c")
        remapped_data = json.loads(plain_file.read_text(encoding="utf-8"))
        original_source = next(row["file"] for row in remapped_data["pcs"]
                               if row["file"].endswith("fixture.c"))
        for row in remapped_data["pcs"]:
            if row["file"] == original_source:
                row["source_text"] = ""
        remapped_file = tmp / "remapped.avmp"
        remapped_file.write_text(json.dumps(remapped_data), encoding="utf-8")
        mapped_html = tmp / "mapped.html"
        run((profiler, "report", remapped_file,
             "--source-map", f"{Path(original_source).parent}={mapped_dir}",
             "--html", mapped_html))
        require("uint16_t local = 7u" in mapped_html.read_text(encoding="utf-8"),
                "source path remapping did not restore source text")
        copied_elf = tmp / "removed.elf"
        shutil.copyfile(c_elf, copied_elf)
        copied_profile = tmp / "removed.avmp"
        run((profiler, "record", copied_elf, "--for", "1000cycles",
             "-o", copied_profile))
        copied_elf.unlink()
        run((profiler, "report", copied_profile), expected=0)

        bad = tmp / "bad.avmp"
        bad.write_text(plain_file.read_text(encoding="utf-8").replace(
            '"version": 1', '"version": 2', 1), encoding="utf-8")
        run((profiler, "report", bad), expected=1)
        bad.write_text(plain_file.read_text(encoding="utf-8").replace(
            '"count": "1"', '"count": "18446744073709551616"', 1),
            encoding="utf-8")
        run((profiler, "report", bad), expected=1)

        exported = tmp / "exported.json"
        exported.write_text(json.dumps({"version": 1,
            "identity": plain["identity"],
            "events": [{"cycle": 0, "pressed": ["DOWN"]},
                       {"cycle": 50000, "pressed": []}]}), encoding="utf-8")
        strict_file = tmp / "strict.avmp"
        run((profiler, "record", c_elf, "--for", "10000cycles", "--replay",
             exported, "-o", strict_file))
        wrong = tmp / "wrong.json"
        wrong_data = json.loads(exported.read_text(encoding="utf-8"))
        wrong_data["identity"]["elf_sha256"] = "0" * 64
        wrong.write_text(json.dumps(wrong_data), encoding="utf-8")
        run((profiler, "record", c_elf, "--for", "10000cycles", "--replay",
             wrong, "-o", tmp / "must-not-exist.avmp"), expected=1)
        portable = tmp / "portable.json"
        run((profiler, "inputs", "portable", exported, "-o", portable))
        converted = json.loads(portable.read_text(encoding="utf-8"))
        require("identity" not in converted and
                converted["provenance"] == plain["identity"],
                "portable conversion lost provenance or kept identity binding")
        portable_cpp = tmp / "portable-cpp.avmp"
        run((profiler, "record", cpp_elf, "--for", "200000cycles",
             "--replay", portable, "-o", portable_cpp), expected=2)
        diff_html = tmp / "diff.html"
        diff_output = run((profiler, "diff", plain_file, portable_cpp,
                           "--html", diff_html))
        require("WARNING: AVM ELF differs" in diff_output and
                "replay schedule differs" in diff_output and
                "Functions" in diff_html.read_text(encoding="utf-8"),
                "diff workload warnings or HTML missing")

        discontinuity = tmp / "pc-write.avmp"
        _, pc_records = lldb(debugger, c_elf,
            "breakpoint set --name main", "run", "avm profile start",
            "register write pc 0x2b7", "avm run-for 100cycles",
            "avm profile stop", f"avm profile save {discontinuity}")
        require(pc_records[0]["running"] and
                profile(discontinuity)["window"]["discontinuities"] == "1",
                "PC write was not accounted as a discontinuity")

        immediate_write = tmp / "pc-write-immediate.avmp"
        lldb(debugger, c_elf,
             "breakpoint set --name main", "run", "avm profile start",
             "register write pc 0x2bb", "avm profile stop",
             f"avm profile save {immediate_write}")
        written_window = profile(immediate_write)["window"]
        require(written_window["start_pc"] == 695 and
                written_window["end_pc"] == 699 and
                written_window["completed_cycles"] == "0" and
                written_window["partial_cycles"] == "0" and
                written_window["discontinuities"] == "1",
                "profile stop did not use the current PC after a register write")

        fault_file = tmp / "fault.avmp"
        _, fault_records = lldb(debugger, asm_elf,
            "breakpoint set --address 0x103", "run", "avm profile start",
            "avm run-for 10000cycles", "avm run-for 1cycles",
            "avm profile stop", f"avm profile save {fault_file}")
        fault = profile(fault_file)
        require(fault_records[2]["reason"] == "fault" and
                fault_records[2]["detail"] == "boundary_timeout" and
                not fault["window"]["complete"] and
                int(fault["window"]["partial_cycles"]) > 0,
                "early native fault was counted as a completed instruction")

        unprofiled_capture = tmp / "unprofiled.pgm"
        profiled_capture = tmp / "profiled.pgm"
        stepped_profile = tmp / "stepped.avmp"
        _, baseline_records = lldb(debugger, c_elf,
            "breakpoint set --name main", "run", "thread step-inst",
            "avm run-for 100cycles", "avm run-for 200cycles", "avm stop",
            f"avm display save {unprofiled_capture}")
        _, stepped_records = lldb(debugger, c_elf,
            "breakpoint set --name main", "run", "avm realtime on",
            "avm profile start", "thread step-inst", "avm run-for 100cycles",
            "avm run-for 200cycles", "avm profile stop", "avm stop",
            f"avm display save {profiled_capture}",
            f"avm profile save {stepped_profile}")
        require(baseline_records[-2]["pc"] == stepped_records[-3]["pc"] and
                baseline_records[-2]["cycles"] ==
                stepped_records[-3]["cycles"] and
                baseline_records[-1]["sha256"] ==
                stepped_records[-2]["sha256"],
                "profiling or pacing changed step/repeated-run behavior")
        profile(stepped_profile)

        watched = tmp / "watched.avmp"
        _, watch_records = lldb(debugger, c_elf,
            "breakpoint set --name main", "run", "avm watch write 0x500",
            "avm profile start", "avm run-for 100000cycles",
            "avm profile status", "avm run-for 1000cycles",
            "avm profile stop", f"avm profile save {watched}")
        require(any(r.get("reason") == "watchpoint" for r in watch_records) and
                any(r.get("running") for r in watch_records) and
                int(profile(watched)["window"]["completed_cycles"]) > 0,
                "profile did not survive watchpoint stop and resume")

        resumed = tmp / "breakpoint.avmp"
        _, break_records = lldb(debugger, c_elf,
            "breakpoint set --name main", "breakpoint set --name debug_leaf",
            "run", "avm profile start", "continue", "avm profile status",
            "avm run-for 100cycles", "avm profile stop",
            f"avm profile save {resumed}")
        require(any(r.get("running") for r in break_records) and
                int(profile(resumed)["window"]["completed_cycles"]) > 0,
                "profile did not survive breakpoint stop and resume")

        _, relaunch_records = lldb(debugger, c_elf,
            "breakpoint set --name main", "run", "avm profile start",
            "process kill", "run", "avm profile status")
        require(relaunch_records[-1]["running"] is False and
                relaunch_records[-1]["start_cycle"] == 0,
                "relaunch did not reset the collector")

        replay_baseline_capture = tmp / "replay-off.pgm"
        replay_profile_capture = tmp / "replay-on.pgm"
        replay_profile_file = tmp / "replay-lldb.avmp"
        _, replay_baseline = lldb(debugger, c_elf,
            "breakpoint set --name main", "run",
            f"avm replay load {portable}", "avm run-for 50000cycles",
            "avm stop", f"avm display save {replay_baseline_capture}")
        _, replay_on = lldb(debugger, c_elf,
            "breakpoint set --name main", "run",
            f"avm replay load {portable}", "avm profile start",
            "avm run-for 50000cycles", "avm profile stop", "avm stop",
            f"avm display save {replay_profile_capture}",
            f"avm profile save {replay_profile_file}")
        require(replay_baseline[-2]["pc"] == replay_on[-3]["pc"] and
                replay_baseline[-2]["cycles"] == replay_on[-3]["cycles"] and
                replay_baseline[-1]["sha256"] == replay_on[-2]["sha256"],
                "profiling changed LLDB replay timing or display")
        profile(replay_profile_file)

    print("AVM profiler integration passed: exact PCs, source/inline/high PC, "
          "CLI/LLDB equivalence, native, replay, stops, faults, reports, "
          "and validation")


if __name__ == "__main__":
    main()
