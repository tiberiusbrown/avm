#!/usr/bin/env python3
"""Fuzzes the AVM code generator with llvm-isel-fuzzer and reduces the findings.

The tools come from an instrumented LLVM with assertions, sanitizers and
libFuzzer coverage. It lives in build/fuzz and is separate from the normal
build, so CI never builds it. Build it once:

  cmake --preset fuzz -G Ninja
  cmake --build --preset fuzz-tools --parallel

Then:

  fuzz_backend.py seeds               write the starting corpus
  fuzz_backend.py run --time 1800     fuzz for half an hour, then triage
  fuzz_backend.py triage              bucket and reduce the saved crashes

`run` starts one libFuzzer process group for each optimization level.
libFuzzer mutates the IR (tools/fuzz_seed_ir.py supplies the seeds) and runs
the code generator on it with -verify-machineinstrs. It keeps going after a
crash and saves each crashing input. `triage` replays every saved input,
groups the failures by what went wrong and where, and runs llvm-reduce on the
smallest input of each group. Everything lands under build/fuzz/work:

  corpus/O2/  artifacts/O2/  logs/       fuzzer state and raw crashing inputs
  findings/NN-kind/                      one directory per distinct failure:
      summary.txt    what failed and how often
      artifact.bc    the smallest crashing input (llvm-dis: original.ll)
      reduced.ll     the reduced reproducer
      replay.log     the failing output
      interesting.sh the llvm-reduce test, which also replays the failure
  findings.json                          the same information for scripts

Failures that are already understood can be skipped with --ignore REGEX, which
is matched against "<kind> <summary>", or by listing one regex per line in
work/known-issues.txt. Ignored failures are still counted.
"""

import argparse
import collections
import concurrent.futures
import dataclasses
import json
import os
import re
import shlex
import shutil
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(Path(__file__).resolve().parent))
from fuzz_seed_ir import generate

DEFAULT_BUILD = ROOT / "build" / "fuzz"
TRIPLE = "avm"
ARTIFACT_PREFIXES = ("crash-", "timeout-", "oom-", "leak-", "slow-unit-")
SYMBOLIZER = "/usr/bin/llvm-symbolizer-18"


# Failure signatures ------------------------------------------------------

@dataclasses.dataclass(frozen=True)
class Signature:
    """What went wrong and where, in a form that groups equal failures."""
    kind: str  # asan, ubsan, assert, verifier, fatal, error, timeout, ...
    summary: str  # one line, without addresses or counts
    frames: tuple  # the innermost LLVM frames, if the output has a stack
    needles: tuple  # strings that identify the failure in a replay's output

    @property
    def key(self):
        return " | ".join((self.kind, self.summary) + self.frames)

    @property
    def title(self):
        return "%s %s" % (self.kind, self.summary)


FRAME = re.compile(
    r"^\s*#\d+\s+0x[0-9a-f]+\s+in\s+(?P<name>.+?)"
    r"(?:\s+(?:/\S+|\(\S+\)))?\s*$")
# Frames that only report or unwind the failure say nothing about its cause.
UNINTERESTING_FRAME = re.compile(
    r"^(?:llvm::sys::|llvm::report_|llvm::llvm_unreachable_internal|"
    r"llvm::LLVMContext::diagnose|llvm::DiagnosticInfo|handleLLVMFatalError|"
    r"llvm::install_|llvm::fatal_error)")
ASAN = re.compile(r"ERROR: AddressSanitizer: (\S+)")
UBSAN = re.compile(r"(?P<where>[^\s:]+:\d+):\d+: runtime error: (?P<what>.*)")
ASSERT = re.compile(
    r"(?P<where>[^\s:/]+:\d+): .*?Assertion [`'\"](?P<expr>.*?)['\"] failed")
BAD_MACHINE_CODE = re.compile(r"\*\*\* Bad machine code: (.*?) \*\*\*")
BAD_INSTRUCTION = re.compile(r"^- instruction:\s+(?:.*?=\s*)?(\S+)", re.M)
FATAL = re.compile(r"LLVM ERROR: (.*)")
DIAGNOSTIC = re.compile(r"^error: (?:<unknown>:0:0: )?(.*)$", re.M)
TIMEOUT = re.compile(r"ERROR: libFuzzer: timeout")
OOM = re.compile(r"ERROR: libFuzzer: out-of-memory")
SIGNAL = re.compile(r"ERROR: libFuzzer: deadly signal")
EXITED = re.compile(r"ERROR: libFuzzer: fuzz target exited")
# An input that is not valid IR is not a failure of the code generator.
IGNORED_DIAGNOSTICS = ("input module is broken",)


def normalize(text):
    """Removes what differs between equal failures: values, names, counts."""
    text = re.sub(r"0x[0-9a-fA-F]+", "<hex>", text)
    text = re.sub(r"'[^']*'", "'_'", text)
    text = re.sub(r"\bt\d+\b", "tN", text)
    return re.sub(r"\d+", "N", text).strip()


def stable_prefix(text):
    """The part of a message that precedes anything that varies, to look for
    in a replay's output."""
    match = re.search(r"[\d'`]", text)
    prefix = text[:match.start()] if match else text
    return prefix.strip() if len(prefix.strip()) >= 12 else text.strip()


def interesting_frames(lines, limit=3):
    frames = []
    for line in lines:
        match = FRAME.match(line)
        if not match:
            continue
        name = match.group("name")
        name = name.split("(")[0].strip()
        if UNINTERESTING_FRAME.match(name):
            continue
        if name.startswith("llvm::") or "AVM" in name:
            frames.append(name)
            if len(frames) == limit:
                break
    return tuple(frames)


# ASan reports a crash that is not a memory error, such as an abort from a
# failed assertion, under the signal's name. The real cause is elsewhere in
# the output.
ASAN_SIGNALS = ("ABRT", "SEGV", "FPE", "ILL", "BUS", "TRAP")
# Not bugs in the code generator: AVM has no f64, no vectors and a 256-byte
# stack, and says so with an error that the fuzzer's inputs often provoke.
EXPECTED_ERRORS = (
    r"^error .*no libcall available",
    r"^error .*stack frame size .* exceeds limit",
    r"^fatal AVM fixed-frame offset exceeds the data address space",
)


def signature(text):
    """Classifies the first failure in the output of one run, or returns None
    if the run did not fail."""
    lines = text.splitlines()
    frames = interesting_frames(lines)

    asan = ASAN.search(text)
    if asan and asan.group(1) in ASAN_SIGNALS:
        asan = None
    if asan:
        needles = ["ERROR: AddressSanitizer: " + asan.group(1)]
        if frames:
            needles.append(" in " + frames[0])
        return Signature("asan", asan.group(1), frames, tuple(needles))

    ubsan = UBSAN.search(text)
    if ubsan:
        where = ubsan.group("where").rsplit("/", 1)[-1]
        return Signature("ubsan", "%s %s" % (
            where, normalize(ubsan.group("what"))), frames,
            ("runtime error: " + stable_prefix(ubsan.group("what")),))

    # The code generator reports a problem it cannot handle as an error and
    # keeps going, so a later assertion or crash is usually a consequence of
    # it. The first error is the cause. This also covers "ran out of
    # registers", which ends the run with libFuzzer's exit report.
    diagnostics = [m.group(1).strip() for m in DIAGNOSTIC.finditer(text)
                   if not any(i in m.group(1) for i in IGNORED_DIAGNOSTICS)]
    crashed = any(r.search(text) for r in (ASSERT, FATAL, TIMEOUT, OOM, SIGNAL,
                                           EXITED, BAD_MACHINE_CODE)) or asan
    if diagnostics and crashed:
        return Signature("error", normalize(diagnostics[0]), (),
                         ("error: ", stable_prefix(diagnostics[0])))

    match = ASSERT.search(text)
    if match:
        expr = match.group("expr")
        return Signature("assert", "%s %s" % (match.group("where"), expr),
                         frames, ("Assertion `%s' failed" % expr,))

    match = BAD_MACHINE_CODE.search(text)
    if match:
        instruction = BAD_INSTRUCTION.search(text)
        opcode = instruction.group(1) if instruction else "?"
        return Signature("verifier", "%s (%s)" % (match.group(1), opcode),
                         (), ("*** Bad machine code: " + match.group(1),))

    match = FATAL.search(text)
    if match:
        message = match.group(1).strip()
        return Signature("fatal", normalize(message), frames,
                         ("LLVM ERROR: " + stable_prefix(message),))

    if TIMEOUT.search(text):
        return Signature("timeout", "timeout", frames, ())
    if OOM.search(text):
        return Signature("oom", "out of memory", frames, ())
    if SIGNAL.search(text):
        return Signature("signal", "deadly signal", frames,
                         ("ERROR: libFuzzer: deadly signal",))
    if EXITED.search(text):
        return Signature("exit", "fuzz target exited", frames, ())
    return None


# Running the tools -------------------------------------------------------

def die(message):
    sys.exit("fuzz_backend.py: " + message)


def tool(build, name):
    path = build / "llvm-build" / "bin" / name
    if not path.exists():
        die("%s is missing. Build it first:\n"
            "  cmake --preset fuzz -G Ninja\n"
            "  cmake --build --preset fuzz-tools --parallel" % path)
    return path


def environment():
    env = dict(os.environ)
    asan = ["detect_leaks=0", "symbolize=1", "allocator_may_return_null=1",
            "handle_abort=1"]
    if Path(SYMBOLIZER).exists():
        asan.append("external_symbolizer_path=" + SYMBOLIZER)
    env["ASAN_OPTIONS"] = ":".join(asan)
    env["UBSAN_OPTIONS"] = "halt_on_error=1:print_stacktrace=1"
    return env


def fuzzer_flags(level, verify):
    """The code generator's options. libFuzzer hands everything after
    -ignore_remaining_args=1 to the target, so these go after the inputs."""
    flags = ["-ignore_remaining_args=1", "-mtriple=" + TRIPLE, "-O" + level]
    if verify:
        flags.append("-verify-machineinstrs")
    return flags


def work_paths(work):
    return {name: work / name for name in
            ("seeds", "corpus", "artifacts", "logs", "findings")}


def command_seeds(args):
    assembler = tool(args.build, "llvm-as")
    seeds = work_paths(args.work)["seeds"]
    seeds.mkdir(parents=True, exist_ok=True)

    def make(number):
        # Alternate straight-line and branching functions.
        text = generate(number, flow=bool(number % 2))
        output = seeds / ("seed-%05d.bc" % number)
        subprocess.run([str(assembler), "-o", str(output), "-"],
                       input=text.encode(), check=True)

    with concurrent.futures.ThreadPoolExecutor(args.jobs) as pool:
        list(pool.map(make, range(args.first, args.first + args.count)))
    print("wrote %d seeds to %s" % (args.count, seeds))


STATS = re.compile(r"#(\d+).*?cov: (\d+) ft: (\d+) corp: (\d+)")


def last_stats(log):
    """The newest coverage line libFuzzer wrote to `log`, or None."""
    if not log.exists():
        return None
    for line in reversed(log.read_text(errors="replace").splitlines()[-200:]):
        match = STATS.search(line)
        if match:
            return match.groups()
    return None


def progress(logs, paths, started):
    """One line: elapsed time, coverage per level and the crashes so far."""
    parts = []
    for level, log in logs.items():
        stats = last_stats(log)
        parts.append("O%s %s" % (level, "cov=%s corp=%s" % (stats[1], stats[3])
                                 if stats else "starting"))
    crashes = sum(1 for p in paths["artifacts"].rglob("*")
                  if p.name.startswith(ARTIFACT_PREFIXES))
    return "%4ds  %s  crashing inputs: %d" % (
        time.time() - started, "  ".join(parts), crashes)


def command_run(args):
    fuzzer = tool(args.build, "llvm-isel-fuzzer")
    paths = work_paths(args.work)
    seeds = sorted(paths["seeds"].glob("*.bc"))
    if not seeds:
        die("no seeds in %s; run `fuzz_backend.py seeds` first"
            % paths["seeds"])
    levels = args.levels.split(",")
    workers = max(1, args.workers // len(levels))
    logs, processes = {}, []
    started = time.time()
    for level in levels:
        corpus = paths["corpus"] / ("O" + level)
        artifacts = paths["artifacts"] / ("O" + level)
        corpus.mkdir(parents=True, exist_ok=True)
        artifacts.mkdir(parents=True, exist_ok=True)
        paths["logs"].mkdir(parents=True, exist_ok=True)
        for seed in seeds:
            shutil.copy2(seed, corpus / seed.name)
        log = paths["logs"] / ("fuzz-O%s.log" % level)
        logs[level] = log
        command = [str(fuzzer),
                   "-fork=%d" % workers, "-ignore_crashes=1",
                   "-ignore_timeouts=1", "-ignore_ooms=1",
                   "-max_total_time=%d" % args.time,
                   "-artifact_prefix=%s/" % artifacts, "-max_len=%d" %
                   args.max_len, "-timeout=%d" % args.input_timeout,
                   "-rss_limit_mb=%d" % args.rss_limit_mb,
                   "-detect_leaks=0", str(corpus),
                   *fuzzer_flags(level, not args.no_verify)]
        print("O%s: %s" % (level, " ".join(shlex.quote(c) for c in command)))
        processes.append(subprocess.Popen(
            command, cwd=paths["logs"], env=environment(),
            stdout=open(log, "wb"), stderr=subprocess.STDOUT))
    try:
        while any(p.poll() is None for p in processes):
            time.sleep(min(args.status, 30))
            print(progress(logs, paths, started), flush=True)
    except KeyboardInterrupt:
        print("interrupted; stopping the fuzzers")
        for p in processes:
            p.terminate()
    for p in processes:
        p.wait()
    print(progress(logs, paths, started))
    if not args.no_triage:
        command_triage(args)


def replay(fuzzer, flags, artifact, timeout):
    try:
        run = subprocess.run([str(fuzzer), str(artifact), *flags],
                             stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                             env=environment(), timeout=timeout)
    except subprocess.TimeoutExpired as expired:
        return (expired.output or b"").decode(errors="replace") + (
            "\nERROR: libFuzzer: timeout (replay)\n")
    return run.stdout.decode(errors="replace")


def level_of(artifact):
    match = re.fullmatch(r"O(\d)", artifact.parent.name)
    return match.group(1) if match else "2"


def interesting_script(fuzzer, flags, needles):
    """The llvm-reduce test: the input must still fail the same way."""
    asan = environment()
    lines = ["#!/bin/sh",
             "export ASAN_OPTIONS=%s" % shlex.quote(asan["ASAN_OPTIONS"]),
             "export UBSAN_OPTIONS=%s" % shlex.quote(asan["UBSAN_OPTIONS"]),
             'out=$(%s "$1" %s 2>&1)' % (
                 shlex.quote(str(fuzzer)),
                 " ".join(shlex.quote(f) for f in flags))]
    for needle in needles:
        lines.append('printf "%%s\\n" "$out" | grep -qF -- %s || exit 1'
                     % shlex.quote(needle))
    lines.append("exit 0")
    return "\n".join(lines) + "\n"


def slug(text):
    return re.sub(r"[^a-z0-9]+", "-", text.lower()).strip("-")[:40]


def read_ignores(args):
    patterns = list(EXPECTED_ERRORS) + list(args.ignore or [])
    known = args.work / "known-issues.txt"
    if known.exists():
        patterns += [line.strip() for line in known.read_text().splitlines()
                     if line.strip() and not line.startswith("#")]
    return [re.compile(p) for p in patterns]


def reduce_finding(build, directory, flags, sig, args):
    """Runs llvm-reduce on the finding's input. Returns "yes" or "partial"
    (the time ran out, but llvm-reduce keeps its best result so far), or "no"
    if nothing was saved."""
    fuzzer = tool(build, "llvm-isel-fuzzer")
    script = directory / "interesting.sh"
    script.write_text(interesting_script(fuzzer, flags, sig.needles))
    script.chmod(0o755)
    reduced = directory / "reduced.bc"
    started = time.time()
    outcome = "yes"
    try:
        subprocess.run(
            [str(tool(build, "llvm-reduce")), "--test=" + str(script),
             "-o", str(reduced), "-j", str(args.jobs),
             str(directory / "artifact.bc")],
            stdout=(directory / "reduce.log").open("w"),
            stderr=subprocess.STDOUT, env=environment(),
            timeout=args.reduce_timeout, check=True)
    except subprocess.TimeoutExpired:
        outcome = "partial"
    except subprocess.CalledProcessError:
        outcome = "no"
    if not reduced.exists():
        print("  not reduced")
        return "no"
    subprocess.run([str(tool(build, "llvm-dis")), "-o",
                    str(directory / "reduced.ll"), str(reduced)], check=True)
    print("  reduced in %.0fs%s" % (
        time.time() - started, " (stopped early)" if outcome == "partial"
        else ""))
    return outcome


def command_triage(args):
    fuzzer = tool(args.build, "llvm-isel-fuzzer")
    paths = work_paths(args.work)
    artifacts = sorted(p for p in paths["artifacts"].rglob("*")
                       if p.is_file() and p.name.startswith(ARTIFACT_PREFIXES))
    cache_path = args.work / "triage-cache.json"
    cache = json.loads(cache_path.read_text()) if cache_path.exists() else {}

    def classify(artifact):
        # Artifact names are content hashes, so a cached result stays valid
        # for as long as the same tools produced it.
        name = "%s/%s" % (artifact.parent.name, artifact.name)
        if name not in cache:
            flags = fuzzer_flags(level_of(artifact), not args.no_verify)
            text = replay(fuzzer, flags, artifact, args.input_timeout * 4)
            sig = signature(text)
            cache[name] = dataclasses.asdict(sig) if sig else None
            cache[name + "#log"] = text[-20000:]
        return artifact, cache[name]

    with concurrent.futures.ThreadPoolExecutor(args.jobs) as pool:
        results = list(pool.map(classify, artifacts))
    cache_path.write_text(json.dumps(cache))

    buckets = {}  # signature key -> (signature, crashing inputs)
    vanished = 0
    for artifact, data in results:
        if data is None:
            vanished += 1
            continue
        sig = Signature(data["kind"], data["summary"], tuple(data["frames"]),
                        tuple(data["needles"]))
        buckets.setdefault(sig.key, (sig, []))[1].append(artifact)
    ignores = read_ignores(args)

    findings = []
    shutil.rmtree(paths["findings"], ignore_errors=True)
    ordered = sorted(buckets.values(), key=lambda item: -len(item[1]))
    for number, (sig, members) in enumerate(ordered, 1):
        smallest = min(members, key=lambda p: p.stat().st_size)
        ignored = any(p.search(sig.title) for p in ignores)
        entry = {"id": number, "kind": sig.kind, "summary": sig.summary,
                 "frames": list(sig.frames), "inputs": len(members),
                 "ignored": ignored,
                 "level": level_of(smallest), "reduced": "no"}
        print("%2d. [%d] %s%s" % (number, len(members), sig.title,
                                  "  (ignored)" if ignored else ""))
        for frame in sig.frames:
            print("      at " + frame)
        findings.append(entry)
        if ignored:
            continue
        directory = paths["findings"] / ("%02d-%s" % (number, slug(sig.title)))
        directory.mkdir(parents=True)
        entry["directory"] = str(directory)
        shutil.copy2(smallest, directory / "artifact.bc")
        flags = fuzzer_flags(entry["level"], not args.no_verify)
        entry["replay"] = " ".join(
            shlex.quote(c) for c in [str(fuzzer), str(smallest), *flags])
        (directory / "replay.log").write_text(
            cache["%s/%s" % (smallest.parent.name, smallest.name) + "#log"])
        (directory / "summary.txt").write_text(
            "%s\ninputs: %d\nreplay: %s\n" % (
                sig.title, len(members), entry["replay"]))
        subprocess.run([str(tool(args.build, "llvm-dis")), "-o",
                        str(directory / "original.ll"),
                        str(directory / "artifact.bc")], check=False)
        if not args.no_reduce and sig.kind not in ("timeout", "oom"):
            entry["reduced"] = reduce_finding(args.build, directory, flags,
                                              sig, args)
    (args.work / "findings.json").write_text(json.dumps(findings, indent=2))
    print("\n%d crashing inputs: %d distinct failures, %d did not reproduce"
          % (len(artifacts), len(buckets), vanished))
    print("results: %s" % (args.work / "findings"))
    return findings


def main():
    parser = argparse.ArgumentParser(
        description=__doc__.split("\n\n")[0],
        epilog="See the module docstring for the workflow.")
    parser.add_argument("--build", type=Path, default=DEFAULT_BUILD,
                        help="the fuzz build tree (default: build/fuzz)")
    parser.add_argument("--work", type=Path,
                        help="where state is kept (default: BUILD/work)")
    parser.add_argument("--jobs", type=int,
                        default=os.cpu_count() or 4,
                        help="parallel replays, reductions and assemblies")
    commands = parser.add_subparsers(dest="command", required=True)

    seeds = commands.add_parser("seeds", help="write the starting corpus")
    seeds.add_argument("--count", type=int, default=400)
    seeds.add_argument("--first", type=int, default=1,
                       help="first generator seed")

    def common(command):
        command.add_argument("--no-verify", action="store_true",
                             help="do not run the machine verifier")
        command.add_argument("--no-reduce", action="store_true")
        command.add_argument("--reduce-timeout", type=int, default=900,
                             help="seconds allowed per reduction")
        command.add_argument("--ignore", action="append", metavar="REGEX",
                             help="skip failures whose '<kind> <summary>' "
                                  "matches")
        command.add_argument("--input-timeout", type=int, default=30,
                             help="seconds before one input counts as a hang")

    run = commands.add_parser("run", help="fuzz, then triage")
    common(run)
    run.add_argument("--time", type=int, default=600, help="seconds to fuzz")
    run.add_argument("--workers", type=int,
                     default=max(1, min(10, (os.cpu_count() or 4) - 2)),
                     help="fuzzing processes, shared by the levels")
    run.add_argument("--levels", default="2,0",
                     help="optimization levels to fuzz, e.g. 2,0")
    run.add_argument("--max-len", type=int, default=16384,
                     help="largest input, in bytes of bitcode")
    run.add_argument("--rss-limit-mb", type=int, default=4096)
    run.add_argument("--status", type=int, default=30,
                     help="seconds between progress lines")
    run.add_argument("--no-triage", action="store_true")

    triage = commands.add_parser("triage",
                                 help="bucket and reduce saved crashes")
    common(triage)

    args = parser.parse_args()
    args.build = args.build.resolve()
    args.work = (args.work or args.build / "work").resolve()
    {"seeds": command_seeds, "run": command_run,
     "triage": command_triage}[args.command](args)


if __name__ == "__main__":
    main()
