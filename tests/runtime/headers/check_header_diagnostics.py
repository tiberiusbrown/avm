#!/usr/bin/env python3
"""Check that AVM library headers accept or reject the diagnostic inputs they must.

Each case is compiled with the AVM clang driver and the SDK include directory,
using the same warning and freestanding options as the test images. A case
that must compile is accepted only without any error. A case that must be
rejected fails with a diagnostic containing the phrase in its entry.
"""

import argparse
import pathlib
import subprocess
import sys

# File name, whether it must compile, and the phrase required in the diagnostic.
CASES = [
    ("assert_one_expression.c", True, None),
    ("assert_ndebug_two_expressions.c", True, None),
    ("assert_two_expressions.c", False, "too many arguments"),
    ("assert_no_expression.c", False, "expected expression"),
]


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--clang", required=True, type=pathlib.Path)
    parser.add_argument("--sysroot-include", required=True, type=pathlib.Path)
    parser.add_argument("--source-dir", required=True, type=pathlib.Path)
    args = parser.parse_args()

    failures = []
    for name, must_compile, phrase in CASES:
        source = args.source_dir / name
        command = [
            str(args.clang),
            "--target=avm-unknown-arduboyfx",
            "-ffreestanding",
            "-O2",
            "-Wall",
            "-Wextra",
            "-Werror",
            "-std=c11",
            "-isystem",
            str(args.sysroot_include),
            "-fsyntax-only",
            str(source),
        ]
        result = subprocess.run(command, capture_output=True, text=True)
        diagnostics = result.stderr + result.stdout
        if must_compile:
            if result.returncode != 0:
                failures.append(f"{name}: expected success\n{diagnostics}")
                print(f"FAIL {name}")
            else:
                print(f"PASS {name}")
        elif result.returncode == 0 or phrase not in diagnostics:
            failures.append(f"{name}: expected an error containing {phrase!r}\n{diagnostics}")
            print(f"FAIL {name}")
        else:
            print(f"PASS {name}")

    for failure in failures:
        print(failure, file=sys.stderr)
    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
