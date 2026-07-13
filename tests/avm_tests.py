#!/usr/bin/env python3
"""Assemble, link, and run every AVM assembly test in tests/asm/.

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
    """Raised when one stage of an assembly test fails."""


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--llvm-mc", required=True, type=Path)
    parser.add_argument("--llvm-avm-image", required=True, type=Path)
    parser.add_argument("--ardens", required=True, type=Path)
    parser.add_argument("--interpreter", required=True, type=Path)
    parser.add_argument("--asm-dir", required=True, type=Path)
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


def run_test(
    asm_path: Path,
    *,
    llvm_mc: Path,
    llvm_avm_image: Path,
    ardens: Path,
    interpreter: Path,
    work_dir: Path,
    headless_ms: int,
    timeout_seconds: float,
    verbose: bool,
) -> None:
    expected_path = asm_path.with_name(f"{asm_path.stem}_output.txt")
    if not expected_path.is_file():
        raise TestCommandError(f"missing expected-output file: {expected_path}")

    object_path = work_dir / f"{asm_path.stem}.o"
    image_path = work_dir / f"{asm_path.stem}.bin"
    serial_path = work_dir / f"{asm_path.stem}_actual.txt"

    for path in (object_path, image_path, serial_path):
        path.unlink(missing_ok=True)

    # Assemble AVM source into an AVM ELF relocatable object.
    run_command(
        (
            llvm_mc,
            "-triple=avm-unknown-arduboyfx",
            "-filetype=obj",
            asm_path,
            "-o",
            object_path,
        ),
        timeout_seconds=timeout_seconds,
        verbose=verbose,
    )

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
    if not tests:
        print(f"error: no *.asm tests found in {asm_dir}", file=sys.stderr)
        return 2

    work_dir = args.work_dir.resolve()
    work_dir.mkdir(parents=True, exist_ok=True)

    failures: List[Tuple[Path, str]] = []
    test_labels = [
        f"[{index:>2}/{len(tests)}] {asm_path.name}"
        for index, asm_path in enumerate(tests, start=1)
    ]
    result_column = max(len(label) for label in test_labels) + 2

    print(f"Running {len(tests)} AVM assembly test(s)")
    for asm_path, test_label in zip(tests, test_labels):
        try:
            run_test(
                asm_path,
                llvm_mc=llvm_mc,
                llvm_avm_image=llvm_avm_image,
                ardens=ardens,
                interpreter=interpreter,
                work_dir=work_dir,
                headless_ms=args.headless_ms,
                timeout_seconds=args.timeout_seconds,
                verbose=args.verbose,
            )
        except TestCommandError as exc:
            failures.append((asm_path, str(exc)))
            print(f"{test_label:<{result_column}}FAIL")
            print()
            for line in FAIL_BANNER:
                print(f"    {line}")
            print()
        else:
            print(f"{test_label:<{result_column}}PASS")

    if failures:
        print()
        print(f"{len(failures)} of {len(tests)} test(s) failed:")
        for asm_path, message in failures:
            print()
            print(f"--- {asm_path.name} ---")
            print(message)
        return 1

    print()
    print(f"All {len(tests)} AVM assembly test(s) passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())