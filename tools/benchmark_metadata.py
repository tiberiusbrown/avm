"""Record reproducible identities beside benchmark measurements."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess


def digest(path):
    value = hashlib.sha256()
    with path.open("rb") as source:
        for block in iter(lambda: source.read(1024 * 1024), b""):
            value.update(block)
    return value.hexdigest()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--compiler", type=Path, required=True)
    parser.add_argument("--interpreter", type=Path, required=True)
    parser.add_argument("--workloads", type=Path, required=True)
    parser.add_argument("--optimization", required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    report = {
        "configuration": "RelWithDebInfo",
        "optimization": args.optimization,
        "compiler_version": subprocess.check_output(
            [str(args.compiler), "--version"], text=True).splitlines()[0],
        "target_triple": "avm-unknown-arduboyfx",
        "compiler_sha256": digest(args.compiler),
        "interpreter_sha256": digest(args.interpreter),
        "workloads": {
            path.relative_to(args.workloads).as_posix(): digest(path)
            for path in sorted(args.workloads.rglob("*"))
            if path.suffix in (".c", ".cpp", ".h")
        },
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")


if __name__ == "__main__":
    main()
