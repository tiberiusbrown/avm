"""Exercise installed debugger tools after relocating the SDK, without loader overrides."""

import argparse
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile


def run(argv, env, cwd):
    result = subprocess.run([str(arg) for arg in argv], env=env, cwd=cwd,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                            text=True, timeout=120)
    if result.returncode:
        raise RuntimeError(f"{argv[0]} failed ({result.returncode}):\n{result.stdout}")
    return result.stdout


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cmake", required=True)
    parser.add_argument("--build", type=Path, required=True)
    parser.add_argument("--fixture", type=Path, required=True)
    args = parser.parse_args()
    build, fixture = args.build.resolve(), args.fixture.resolve()
    env = {key: value for key, value in os.environ.items()
           if not key.startswith(("LD_", "DYLD_", "AVM_PROF_", "AVM_LLDB_"))}
    suffix = ".exe" if sys.platform == "win32" else ""
    with tempfile.TemporaryDirectory(prefix="sdk-relocation-", dir=build) as raw:
        work = Path(raw)
        staged, relocated = work / "staged", work / "relocated SDK"
        run([args.cmake, "--install", build, "--config", "RelWithDebInfo",
             "--component", "avm-sdk", "--prefix", staged], env, work)
        staged.rename(relocated)
        tools = relocated / "bin"
        # Child tools must also come from the relocated SDK.
        env["PATH"] = str(tools) + os.pathsep + env.get("PATH", "")
        for name in ("avm-prof", "avm-lldb"):
            exe = tools / (name + suffix)
            if sys.platform.startswith("linux"):
                # Executing successfully is insufficient: a leaked build RPATH
                # could silently supply liblldb from the original checkout.
                trace = run([exe], dict(env, LD_TRACE_LOADED_OBJECTS="1"), work)
                loaded = [line for line in trace.splitlines() if "liblldb" in line]
                if len(loaded) != 1 or str(tools / "liblldb") not in loaded[0]:
                    raise AssertionError(f"{name} did not load the relocated liblldb:\n{trace}")
            run([exe, "--help" if name == "avm-prof" else "--version"], env, work)
        profile = work / "fixture.avmp"
        run([tools / ("avm-prof" + suffix), "record", fixture,
             "--for", "50000cycles", "--native", "-o", profile], env, work)
        value = json.loads(profile.read_text())
        assert value["window"]["complete"] and value["native_pcs"]
        run([tools / ("avm-prof" + suffix), "report", profile,
             "--html", work / "fixture.html"], env, work)
        output = run([tools / ("avm-lldb" + suffix), "--no-lldbinit", "--batch",
                      "-o", "breakpoint set --name main", "-o", "run",
                      "-o", "avm run-for 1000cycles", fixture], env, work)
        assert "stop reason = breakpoint" in output and '"reason":"deadline"' in output
    print("Installed SDK relocation passed: local liblldb, debugger, native profile and HTML")


if __name__ == "__main__":
    main()
