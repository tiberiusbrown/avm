#!/usr/bin/env python3
"""Compile, link, and package an AVM program with the staged SDK."""

import os
from pathlib import Path
import subprocess
import sys
import tempfile


TRIPLE = "avm-unknown-arduboyfx"
SOURCE_SUFFIXES = {".c", ".cc", ".cpp", ".cxx", ".s", ".S"}
LINK_SUFFIXES = {".o", ".obj", ".a", ".lib"}
COMPILE_OPTIONS_WITH_VALUE = {"-I", "-isystem", "-iquote", "-D", "-U", "-include", "-x"}
LINK_OPTIONS_WITH_VALUE = {"-L", "-l", "-u", "-T", "-e", "--entry", "-Xlinker"}


def fail(message):
    raise ValueError(message)


def tool(directory, name):
    path = directory / (name + (".exe" if os.name == "nt" else ""))
    if not path.is_file():
        fail(f"missing {path}; build avm_sdk before using the wrapper")
    return str(path)


def sdk_paths():
    bin_dir = Path(__file__).resolve().parent
    for candidate in (bin_dir.parent / "sysroot", bin_dir.parent.parent / "avm-sysroot"):
        if (candidate / "lib" / "crt0.o").is_file():
            return bin_dir, candidate
    fail("AVM sysroot not found beside the SDK or in the AVM build tree; build avm_sdk")


def run(command, verbose):
    if verbose:
        print("+ " + subprocess.list2cmdline(command), file=sys.stderr)
    return subprocess.run(command, check=False).returncode


def parse(args):
    compile_args = []
    link_args = []
    inputs = []
    output = None
    image = None
    startup = "crt0.o"
    entry = "_start"
    no_image = False
    no_startup = False
    no_libraries = False
    verbose = False
    compile_only = False

    index = 0
    while index < len(args):
        arg = args[index]
        index += 1
        if arg in ("-h", "--help"):
            print("Usage: avm-clang [Clang options] file.c [file.o ...] -o app.elf\n"
                  "Links with the AVM runtime and writes app.bin beside app.elf.\n"
                  "AVM options: --avm-startup=crt0.o|crt0_sketch.o|none|PATH,\n"
                  "  --avm-entry=SYMBOL, --avm-image=PATH, --avm-no-image\n"
                  "Compile-only options such as -c and -S are forwarded to Clang.")
            return None
        if arg.startswith("--avm-startup="):
            startup = arg.split("=", 1)[1]
        elif arg.startswith("--avm-entry="):
            entry = arg.split("=", 1)[1]
        elif arg.startswith("--avm-image="):
            image = arg.split("=", 1)[1]
        elif arg == "--avm-no-image":
            no_image = True
        elif arg in ("-o", "--output"):
            if index == len(args):
                fail(f"{arg} requires a path")
            output = args[index]
            index += 1
        elif arg.startswith("-o") and len(arg) > 2:
            output = arg[2:]
        elif arg in ("--target", "-target"):
            if index == len(args):
                fail(f"{arg} requires a target")
            if args[index] != TRIPLE:
                fail(f"this SDK only supports {TRIPLE}")
            index += 1
        elif arg.startswith("--target="):
            if arg.split("=", 1)[1] != TRIPLE:
                fail(f"this SDK only supports {TRIPLE}")
        elif arg in ("-c", "-S", "-E", "-fsyntax-only", "-M", "-MM"):
            compile_args.append(arg)
            compile_only = True
        elif arg == "-v":
            verbose = True
            compile_args.append(arg)
        elif arg in ("-nostdlib", "-nostartfiles", "-nodefaultlibs"):
            no_startup |= arg != "-nodefaultlibs"
            no_libraries |= arg != "-nostartfiles"
        elif arg in COMPILE_OPTIONS_WITH_VALUE | LINK_OPTIONS_WITH_VALUE:
            if index == len(args):
                fail(f"{arg} requires a value")
            value = args[index]
            index += 1
            if arg in COMPILE_OPTIONS_WITH_VALUE:
                compile_args.extend((arg, value))
            else:
                link_args.extend((arg, value))
        elif arg.startswith("-Wl,"):
            link_args.extend(arg[4:].split(","))
        elif arg.startswith(("-L", "-l", "-u", "-T")) and len(arg) > 2:
            link_args.append(arg)
        elif arg.startswith(("-I", "-D", "-U", "-O", "-g", "-W", "-f", "-m",
                             "-std=", "-iquote", "-isystem")):
            compile_args.append(arg)
        elif arg.startswith("-"):
            fail(f"unsupported option {arg}; use -Wl, for linker options")
        elif Path(arg).suffix in SOURCE_SUFFIXES | LINK_SUFFIXES:
            inputs.append(arg)
        else:
            fail(f"unrecognized input {arg}")

    if not inputs:
        fail("no input files")
    if no_image and image:
        fail("--avm-image and --avm-no-image cannot be combined")
    if compile_only and any(Path(arg).suffix in LINK_SUFFIXES for arg in inputs):
        fail("object and archive inputs require a link step")
    if compile_only and (image or no_image or startup != "crt0.o" or entry != "_start"):
        fail("AVM link options require a link step")
    if not compile_only and output is None:
        output = "a.elf"
    return (compile_args, link_args, inputs, output, image, startup, entry,
            no_image, no_startup, no_libraries, verbose, compile_only)


def main(argv):
    parsed = parse(argv)
    if parsed is None:
        return 0
    (compile_args, link_args, inputs, output, image, startup, entry,
     no_image, no_startup, no_libraries, verbose, compile_only) = parsed
    bin_dir, sysroot = sdk_paths()
    clang = tool(bin_dir, "clang")
    common = [f"--target={TRIPLE}", "-ffreestanding", "-fomit-frame-pointer",
              "-fno-stack-protector", "-O2",
              "-fno-unwind-tables", "-fno-asynchronous-unwind-tables",
              "-ffunction-sections", "-fdata-sections", "-nostdlibinc",
              "-isystem", str(sysroot / "include")]
    if compile_only:
        command = [clang, *common, *compile_args, *inputs]
        if output is not None:
            command.extend(("-o", output))
        return run(command, verbose)

    linker = tool(bin_dir, "lld")
    packer = tool(bin_dir, "llvm-avm-image") if not no_image else None
    library_dir = sysroot / "lib"
    if startup != "none" and not no_startup:
        startup_path = (library_dir / startup
                        if startup in ("crt0.o", "crt0_sketch.o", "crt0_test.o")
                        else Path(startup))
        if not startup_path.is_file():
            fail(f"startup object not found: {startup_path}")
    else:
        startup_path = None

    with tempfile.TemporaryDirectory(prefix="avm-clang-") as temporary:
        objects = []
        for number, input_name in enumerate(inputs):
            if Path(input_name).suffix in LINK_SUFFIXES:
                objects.append(input_name)
                continue
            object_name = str(Path(temporary) / f"input-{number}.o")
            command = [clang, *common, *compile_args, "-c", input_name, "-o", object_name]
            if Path(input_name).suffix.lower() in (".cc", ".cpp", ".cxx"):
                command.extend(("-fno-exceptions", "-fno-rtti",
                                "-fno-threadsafe-statics", "-fno-use-cxa-atexit"))
            status = run(command, verbose)
            if status:
                return status
            objects.append(object_name)

        command = [linker, "-flavor", "gnu", f"--entry={entry}", "--gc-sections",
                   "-o", output]
        if startup_path is not None:
            command.append(str(startup_path))
        command.extend(objects)
        command.extend(link_args)
        if not no_libraries:
            command.extend((f"-L{library_dir}", "-lavm", "-lavm-builtins"))
        status = run(command, verbose)
        if status or no_image:
            return status

        image_path = image or str(Path(output).with_suffix(".bin"))
        return run([packer, "--development", output, "-o", image_path], verbose)


if __name__ == "__main__":
    try:
        sys.exit(main(sys.argv[1:]))
    except ValueError as error:
        print(f"avm-clang: {error}", file=sys.stderr)
        sys.exit(2)
