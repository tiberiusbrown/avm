import re
import sys
from pathlib import Path

sys.path.insert(0, str((Path(__file__).resolve().parents[2] / "tools")))
from fuzz_backend import (EXPECTED_ERRORS, interesting_frames, normalize,
                          signature, stable_prefix)
from fuzz_seed_ir import generate

ASAN_LOG = """\
Running: crash-1
==1==ERROR: AddressSanitizer: heap-use-after-free on address 0x60b000001234
READ of size 8 at 0x60b000001234 thread T0
    #0 0x55d5b45f3e0f in llvm::LiveInterval::weight() const /llvm/LiveInterval.h:7
    #1 0x55d5b45f3e10 in llvm::RAGreedy::tryHintsRecoloring() /llvm/RegAllocGreedy.cpp:2811:5
    #2 0x55d5b45f3e11 in llvm::RAGreedy::runOnMachineFunction(llvm::MachineFunction&) /llvm/RegAllocGreedy.cpp:3300
    #3 0x55d5b45f3e12 in LLVMFuzzerTestOneInput /llvm/llvm-isel-fuzzer.cpp:96
"""
ASSERT_LOG = """\
llvm-isel-fuzzer: /llvm/lib/CodeGen/RegAllocGreedy.cpp:2181: llvm::MCRegister llvm::RAGreedy::tryLastChanceRecoloring(): Assertion `(ExtraInfo->getStage(VirtReg) >= RS_Done || !VirtReg.isSpillable()) && "Last chance recoloring should really be last chance"' failed.
    #0 0x1 in __assert_fail
    #1 0x2 in llvm::RAGreedy::tryLastChanceRecoloring(llvm::LiveInterval const&) /llvm/RegAllocGreedy.cpp:2181
"""
VERIFIER_LOG = """\
*** Bad machine code: Using an undefined physical register ***
- function:    test
- basic block: %bb.0 entry (0x5b215a712e60)
- instruction: $r4 = XOR $r4(tied-def 0), $r5
- operand 1:   $r4(tied-def 0)
LLVM ERROR: Found 1 machine code errors.
Aborting to trigger fuzzer exit handling.
"""
REGISTERS_LOG = """\
error: <unknown>:0:0: ran out of registers during register allocation in function 'draw_quest_arrow'
==2==ERROR: libFuzzer: fuzz target exited
"""
UBSAN_LOG = """\
/llvm/include/llvm/ADT/APInt.h:1021:40: runtime error: shift exponent 70 is too large for 64-bit type 'uint64_t'
    #0 0x1 in llvm::APInt::lshr(unsigned int) /llvm/APInt.h:1021
"""


def test_asan_failures_are_grouped_by_error_and_innermost_llvm_frames():
    sig = signature(ASAN_LOG)
    assert sig.kind == "asan"
    assert sig.summary == "heap-use-after-free"
    assert sig.frames == (
        "llvm::LiveInterval::weight",
        "llvm::RAGreedy::tryHintsRecoloring",
        "llvm::RAGreedy::runOnMachineFunction")
    assert "ERROR: AddressSanitizer: heap-use-after-free" in sig.needles
    assert " in llvm::LiveInterval::weight" in sig.needles


def test_assertion_is_identified_by_location_and_expression():
    sig = signature(ASSERT_LOG)
    assert sig.kind == "assert"
    assert sig.summary.startswith("RegAllocGreedy.cpp:2181 (ExtraInfo")
    assert sig.frames == ("llvm::RAGreedy::tryLastChanceRecoloring",)
    assert sig.needles[0].startswith("Assertion `(ExtraInfo")


def test_machine_verifier_failures_are_split_by_message_and_opcode():
    sig = signature(VERIFIER_LOG)
    assert sig.kind == "verifier"
    assert sig.summary == "Using an undefined physical register (XOR)"
    other = signature(VERIFIER_LOG.replace("= XOR", "= ADD"))
    assert other.key != sig.key


def test_diagnostic_errors_ignore_the_function_name():
    sig = signature(REGISTERS_LOG)
    assert sig.kind == "error"
    assert sig.summary == (
        "ran out of registers during register allocation in function '_'")
    renamed = signature(REGISTERS_LOG.replace("draw_quest_arrow", "other"))
    assert renamed.key == sig.key


def test_undefined_behavior_report_keeps_the_source_line():
    sig = signature(UBSAN_LOG)
    assert sig.kind == "ubsan"
    assert sig.summary == (
        "APInt.h:1021 shift exponent N is too large for N-bit type '_'")
    assert sig.frames == ("llvm::APInt::lshr",)


def test_runs_that_do_not_fail_have_no_signature():
    assert signature("Running: seed\nExecuted seed in 3 ms\n") is None
    # An input that is not valid IR is not a code generator failure.
    assert signature("error: input module is broken!\n") is None


def test_normalize_and_prefix():
    assert normalize("Cannot select: t12: i16 = add t3, 0x1f") == (
        "Cannot select: tN: iN = add tN, <hex>")
    # The prefix stops before the first thing that varies.
    assert stable_prefix("Cannot select: t12: i16 = add") == "Cannot select: t"
    assert stable_prefix("short 12") == "short 12"


def test_reporting_frames_are_skipped():
    lines = ["    #0 0x1 in llvm::sys::PrintStackTrace(int) /a:1",
             "    #1 0x2 in llvm::report_fatal_error(char const*) /a:2",
             "    #2 0x3 in llvm::AVMInstrInfo::foo(int) /a:3"]
    assert interesting_frames(lines) == ("llvm::AVMInstrInfo::foo",)


def test_seed_modules_are_deterministic_and_well_formed():
    for flow in (False, True):
        for seed in range(25):
            text = generate(seed, flow)
            assert text == generate(seed, flow)
            assert text.count("{") == 1 and text.rstrip().endswith("}")
            assert re.search(r"^  ret i1 %t\d+$", text, re.M)
            names = re.findall(r"^  (%\w+) = ", text, re.M)
            assert len(names) == len(set(names))
    assert "br i1" in "".join(generate(s, True) for s in range(25))
    assert "br i1" not in "".join(generate(s, False) for s in range(25))


ABORTED_ASSERT_LOG = ASSERT_LOG + """\
==3==ERROR: AddressSanitizer: ABRT on unknown address 0x03e800000003 (pc 0x1)
    #8 0x1 in abort stdlib/abort.c:79:7
    #9 0x2 in __assert_fail assert/assert.c:105:3
    #10 0x3 in llvm::RAGreedy::tryLastChanceRecoloring(llvm::LiveInterval const&) /llvm/RegAllocGreedy.cpp:2181
"""
CONSEQUENCE_LOG = """\
error: no libcall available to soften floating-point setule compare with type f64
llvm-isel-fuzzer: /llvm/include/llvm/ADT/APInt.h:128: llvm::APInt::APInt(unsigned int, unsigned long, bool, bool): Assertion `llvm::isUIntN(BitWidth, val) && "Value is not an N-bit unsigned value"' failed.
==4==ERROR: AddressSanitizer: ABRT on unknown address 0x03e800000004 (pc 0x1)
"""


def test_an_abort_is_classified_by_its_cause_not_by_the_signal():
    sig = signature(ABORTED_ASSERT_LOG)
    assert sig.kind == "assert"
    assert sig.summary.startswith("RegAllocGreedy.cpp:2181")
    verifier = signature(VERIFIER_LOG + "==5==ERROR: AddressSanitizer: ABRT "
                         "on unknown address 0x1\n")
    assert verifier.kind == "verifier"


def test_the_first_error_is_the_cause_of_a_later_crash():
    sig = signature(CONSEQUENCE_LOG)
    assert sig.kind == "error"
    assert sig.summary == (
        "no libcall available to soften floating-point setule compare with "
        "type fN")
    assert sig.frames == ()


def test_memory_errors_are_not_hidden_by_an_earlier_error():
    assert signature("error: something unsupported\n" + ASAN_LOG).kind == (
        "asan")
    assert signature(ASAN_LOG).kind == "asan"


def test_an_error_without_a_crash_is_not_a_failure():
    assert signature("error: no libcall available\nExecuted in 3 ms\n") is None


def test_expected_errors_match_the_titles_of_unsupported_features():
    expected = [re.compile(p) for p in EXPECTED_ERRORS]
    for log in (CONSEQUENCE_LOG,
                "error: <unknown>:0:0: AVM stack frame size (270) exceeds "
                "limit (256) in function 'test'\n"
                "==1==ERROR: libFuzzer: fuzz target exited\n"):
        title = signature(log).title
        assert any(p.search(title) for p in expected), title
    assert not any(p.search(signature(REGISTERS_LOG).title) for p in expected)
