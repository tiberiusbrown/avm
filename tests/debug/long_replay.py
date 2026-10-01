"""Repeat a three-second AVM input replay through an LLDB breakpoint."""

import json
from pathlib import Path
import subprocess
import sys
import tempfile


def run(executable, image, replay, capture):
    commands = [
        "breakpoint set --name main",
        "breakpoint set --name debug_leaf",
        "run",
        f"avm replay load {replay}",
        "avm replay run",
        "avm replay status",
        "breakpoint disable 2",
        "avm replay resume",
        "avm button status",
        "avm time",
        f"avm display capture {capture} --mode visible",
    ]
    argv = [str(executable), "--batch"]
    for command in commands:
        argv.extend(("-o", command))
    argv.append(str(image))
    completed = subprocess.run(
        argv, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
        timeout=120)
    if completed.returncode:
        raise AssertionError(completed.stdout)
    records = [json.loads(line) for line in completed.stdout.splitlines()
               if line.startswith("{") and line.endswith("}")]
    stops = [record for record in records if "reason" in record]
    assert len(stops) == 2, completed.stdout
    assert stops[0]["reason"] == "breakpoint" and \
        stops[0]["pending_events"] == 1, completed.stdout
    assert stops[1]["reason"] == "deadline" and \
        stops[1]["pending_events"] == 0, completed.stdout
    assert any(record.get("pressed_mask") == 0 for record in records)
    assert any(record.get("cycles_since_entry", 0) >= 48000000
               for record in records)
    capture_record = next(record for record in records if "sha256" in record)
    assert capture.is_file() and capture_record["path"] == capture.as_posix()
    return ([(stop["reason"], stop["pc"], stop["cycles"])
             for stop in stops], capture_record["sha256"])


def main():
    executable, image, work = map(Path, sys.argv[1:4])
    work.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="lldb-long-replay-", dir=work) as raw:
        directory = Path(raw).resolve()
        replay = directory / "three-seconds.json"
        replay.write_text(json.dumps({"version": 1, "events": [
            {"cycle": 0, "pressed": ["DOWN"]},
            {"cycle": 48000000, "pressed": []}]}), encoding="utf-8")
        first = run(executable, image, replay, directory / "first.pgm")
        second = run(executable, image, replay, directory / "second.pgm")
        assert first == second, f"three-second replay diverged: {first} != {second}"
        print("Three-second AVM replay reproduced stop trace and display hash:")
        print(json.dumps({"stops": first[0], "visible_sha256": first[1]}))


if __name__ == "__main__":
    main()
