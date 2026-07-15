#!/usr/bin/env python3
"""Build, link, and run the AVM assembly and freestanding C test suites.

Each ``name.asm`` file must have a sibling ``name_output.txt`` file containing
the expected serial output. The restricted ``llvm-avm-image create`` operation
is the link/image-layout step for the current AVM toolchain.
"""

from __future__ import annotations

import argparse
import difflib
import os
from pathlib import Path
import shlex
import subprocess
import sys
from typing import List, Sequence, Tuple


FAIL_BANNER = (
    "#####    ###    #####  #      ",
    "#       #   #     #    #      ",
    "####    #####     #    #      ",
    "#       #   #     #    #      ",
    "#       #   #   #####  #####  ",
)


class TestCommandError(RuntimeError):
    """Raised when one stage of an AVM test fails."""


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--llvm-mc", required=True, type=Path)
    parser.add_argument("--clang", required=True, type=Path)
    parser.add_argument("--llvm-avm-image", required=True, type=Path)
    parser.add_argument("--ardens", required=True, type=Path)
    parser.add_argument("--interpreter", required=True, type=Path)
    parser.add_argument("--asm-dir", required=True, type=Path)
    parser.add_argument("--c-dir", required=True, type=Path)
    parser.add_argument("--work-dir", required=True, type=Path)
    parser.add_argument(
        "--headless-ms",
        type=int,
        default=5000,
        help="Simulated milliseconds to run each test in Ardens (default: 5000)",
    )
    parser.add_argument(
        "--timeout-seconds",
        type=float,
        default=30.0,
        help="Host wall-clock timeout for each tool invocation (default: 30)",
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Print every command before executing it",
    )
    return parser.parse_args()


def command_text(command: Sequence[str]) -> str:
    if os.name == "nt":
        return subprocess.list2cmdline(list(command))
    return shlex.join(command)


def require_file(path: Path, description: str) -> Path:
    path = path.resolve()
    if not path.is_file():
        raise FileNotFoundError(f"{description} does not exist: {path}")
    return path


def run_command(
    command: Sequence[str],
    *,
    timeout_seconds: float,
    verbose: bool,
) -> subprocess.CompletedProcess:
    command = [str(arg) for arg in command]
    if verbose:
        print(f"    $ {command_text(command)}")
    try:
        result = subprocess.run(
            command,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            timeout=timeout_seconds,
            check=False,
        )
    except subprocess.TimeoutExpired as exc:
        raise TestCommandError(
            f"command timed out after {timeout_seconds:g} seconds:\n"
            f"    {command_text(command)}"
        ) from exc
    except OSError as exc:
        raise TestCommandError(
            f"could not execute command:\n"
            f"    {command_text(command)}\n"
            f"{exc}"
        ) from exc

    if result.returncode != 0:
        stdout = result.stdout.decode("utf-8", errors="backslashreplace")
        stderr = result.stderr.decode("utf-8", errors="backslashreplace")
        message = [
            f"command exited with status {result.returncode}:",
            f"    {command_text(command)}",
        ]
        if stdout:
            message.extend(("stdout:", stdout.rstrip("\n")))
        if stderr:
            message.extend(("stderr:", stderr.rstrip("\n")))
        raise TestCommandError("\n".join(message))
    return result


def normalize_newlines(data: bytes) -> bytes:
    """Discard carriage returns so host line-ending conventions are irrelevant."""
    return data.replace(b"\r", b"")


def output_diff(expected: bytes, actual: bytes, expected_path: Path) -> str:
    expected_text = normalize_newlines(expected).decode(
        "utf-8", errors="backslashreplace"
    )
    actual_text = normalize_newlines(actual).decode(
        "utf-8", errors="backslashreplace"
    )
    return "".join(
        difflib.unified_diff(
            expected_text.splitlines(keepends=True),
            actual_text.splitlines(keepends=True),
            fromfile=str(expected_path),
            tofile="actual serial output",
        )
    )


def link_and_run(
    object_path: Path,
    expected_path: Path,
    artifact_dir: Path,
    artifact_name: str,
    *,
    llvm_avm_image: Path,
    ardens: Path,
    interpreter: Path,
    headless_ms: int,
    timeout_seconds: float,
    verbose: bool,
) -> None:
    if not expected_path.is_file():
        raise TestCommandError(f"missing expected-output file: {expected_path}")

    artifact_dir.mkdir(parents=True, exist_ok=True)
    image_path = artifact_dir / f"{artifact_name}.bin"
    serial_path = artifact_dir / f"{artifact_name}_actual.txt"

    for path in (image_path, serial_path):
        path.unlink(missing_ok=True)

    # Restricted single-object link and image-layout step.
    run_command(
        (
            llvm_avm_image,
            "create",
            object_path,
            "-o",
            image_path,
        ),
        timeout_seconds=timeout_seconds,
        verbose=verbose,
    )

    # Validate the generated image before passing it to the emulator.
    run_command(
        (
            llvm_avm_image,
            "validate",
            image_path,
        ),
        timeout_seconds=timeout_seconds,
        verbose=verbose,
    )

    # Ardens loads the interpreter as the Arduboy program and the AVM image as
    # FX data. In headless mode stdout consists only of emulated serial bytes.
    result = run_command(
        (
            ardens,
            f"headless={headless_ms}",
            f"file={interpreter}",
            f"file={image_path}",
        ),
        timeout_seconds=timeout_seconds,
        verbose=verbose,
    )
    serial_path.write_bytes(result.stdout)

    expected = expected_path.read_bytes()
    if normalize_newlines(result.stdout) != normalize_newlines(expected):
        diff = output_diff(expected, result.stdout, expected_path)
        details = [
            "serial output did not match",
            f"expected: {expected_path}",
            f"actual:   {serial_path}",
            f"expected bytes: {len(expected)}",
            f"actual bytes:   {len(result.stdout)}",
        ]
        if result.stderr:
            details.extend(
                (
                    "Ardens stderr:",
                    result.stderr.decode(
                        "utf-8", errors="backslashreplace"
                    ).rstrip("\n"),
                )
            )
        if diff:
            details.extend(("diff:", diff.rstrip("\n")))
        raise TestCommandError("\n".join(details))


def run_asm_test(asm_path: Path, **kwargs) -> None:
    work_dir = kwargs.pop("work_dir") / "asm"
    work_dir.mkdir(parents=True, exist_ok=True)
    object_path = work_dir / f"{asm_path.stem}.o"
    object_path.unlink(missing_ok=True)
    run_command(
        (
            kwargs.pop("llvm_mc"),
            "-triple=avm-unknown-arduboyfx",
            "-filetype=obj",
            asm_path,
            "-o",
            object_path,
        ),
        timeout_seconds=kwargs["timeout_seconds"],
        verbose=kwargs["verbose"],
    )
    link_and_run(
        object_path,
        asm_path.with_name(f"{asm_path.stem}_output.txt"),
        work_dir,
        asm_path.stem,
        **kwargs,
    )


def run_c_test(c_path: Path, optimization: str, *, clang: Path, **kwargs) -> None:
    work_dir = kwargs.pop("work_dir") / "c" / optimization
    work_dir.mkdir(parents=True, exist_ok=True)
    object_path = work_dir / f"{c_path.stem}.o"
    object_path.unlink(missing_ok=True)
    run_command(
        (
            clang,
            "--target=avm-unknown-arduboyfx",
            "-std=c11",
            "-ffreestanding",
            "-fno-builtin",
            f"-{optimization}",
            "-c",
            c_path,
            "-o",
            object_path,
        ),
        timeout_seconds=kwargs["timeout_seconds"],
        verbose=kwargs["verbose"],
    )
    link_and_run(
        object_path,
        c_path.with_name(f"{c_path.stem}_output.txt"),
        work_dir,
        c_path.stem,
        **kwargs,
    )


def main() -> int:
    args = parse_args()

    if args.headless_ms < 0:
        print("error: --headless-ms must be non-negative", file=sys.stderr)
        return 2
    if args.timeout_seconds <= 0:
        print("error: --timeout-seconds must be positive", file=sys.stderr)
        return 2

    try:
        llvm_mc = require_file(args.llvm_mc, "llvm-mc")
        clang = require_file(args.clang, "clang")
        llvm_avm_image = require_file(
            args.llvm_avm_image, "llvm-avm-image"
        )
        ardens = require_file(args.ardens, "Ardens debugger")
        interpreter = require_file(
            args.interpreter, "AVM interpreter HEX image"
        )
    except FileNotFoundError as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 2

    asm_dir = args.asm_dir.resolve()
    if not asm_dir.is_dir():
        print(
            f"error: assembly test directory does not exist: {asm_dir}",
            file=sys.stderr,
        )
        return 2

    tests = sorted(asm_dir.glob("*.asm"), key=lambda path: path.name.lower())

    c_dir = args.c_dir.resolve()
    if not c_dir.is_dir():
        print(f"error: C test directory does not exist: {c_dir}", file=sys.stderr)
        return 2
    c_tests = sorted(c_dir.glob("*.c"), key=lambda path: path.name.lower())

    work_dir = args.work_dir.resolve()
    work_dir.mkdir(parents=True, exist_ok=True)

    failures: List[Tuple[str, str]] = []
    configurations = [
        (f"[ASM] {path.name}", path, None) for path in tests
    ] + [
        (f"[C {opt}] {path.name}", path, opt)
        for path in c_tests
        for opt in ("O0", "O2")
    ]
    test_labels = [label for label, _, _ in configurations]
    result_column = max((len(label) for label in test_labels), default=0) + 2

    print(
        f"Running {len(tests)} AVM assembly test(s) and "
        f"{len(c_tests) * 2} C configuration(s)"
    )
    for test_label, source_path, optimization in configurations:
        try:
            common = dict(
                llvm_avm_image=llvm_avm_image, ardens=ardens,
                interpreter=interpreter, work_dir=work_dir,
                headless_ms=args.headless_ms,
                timeout_seconds=args.timeout_seconds, verbose=args.verbose,
            )
            if optimization is None:
                run_asm_test(source_path, llvm_mc=llvm_mc, **common)
            else:
                run_c_test(source_path, optimization, clang=clang, **common)
        except TestCommandError as exc:
            failures.append((test_label, str(exc)))
            print(f"{test_label:<{result_column}}FAIL")
            print()
            for line in FAIL_BANNER:
                print(f"    {line}")
            print(flush=True)
        else:
            print(f"{test_label:<{result_column}}PASS", flush=True)

    if failures:
        print()
        print(f"{len(failures)} of {len(configurations)} test(s) failed:")
        for test_label, message in failures:
            print()
            print(f"--- {test_label} ---")
            encoding = sys.stdout.encoding or "utf-8"
            print(
                message.encode(encoding, errors="backslashreplace").decode(
                    encoding
                )
            )
        return 1

    print()
    print(f"All {len(configurations)} AVM test configuration(s) passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
