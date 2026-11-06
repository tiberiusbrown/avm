"""Regressions for focused listings and the unchanged full-disassembly mode."""

import argparse
import hashlib
import importlib.util
from pathlib import Path
import re
import subprocess
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location("disassemble_avm", ROOT / "tools/disassemble_avm.py")
disassemble = importlib.util.module_from_spec(spec)
spec.loader.exec_module(disassemble)


def map_row(address, size, entry):
    return f"{address:8x} {address:8x} {size:8x} {1:5d} {entry}\n"


class FocusedListingTests(unittest.TestCase):
    def test_provenance_and_sections(self):
        link_map = "     VMA      LMA     Size Align Out     In      Symbol\n"
        for address, size, entry in [
            (0x200, 0x100, ".text"),
            (0x200, 8, "        /sdk/lib/crt0_test.o:(.text._start)"),
            (0x208, 8, "        /sdk/lib/libavm.a(trap_lookup.o):(.text.open_section)"),
            (0x208, 8, "                open_section"),
            (0x210, 8, "        /test/fixture.o:(.text.open_section)"),
            (0x218, 8, "        /sdk/lib/libavm-builtins.a(integer.o):(.text.__avm_mulsi3)"),
            (0x220, 8, "        /sdk/lib/libavm.a(string.o):(.text.memset)"),
            (0x228, 0, "        /sdk/lib/libavm.a(trap_report.o):(.text)"),
            (0x200, 8, ".other_text"),
            (0x200, 8, "        /test/fixture.o:(.other_text)"),
        ]:
            link_map += map_row(address, size, entry)
        ranges = disassemble.excluded_ranges(link_map, "/sdk/lib/crt0_test.o")
        self.assertEqual(ranges, {".text": [(0x200, 0x208), (0x208, 0x210)]})

    def test_windows_paths_and_all_infrastructure_members(self):
        link_map = "VMA LMA Size Align Out In Symbol\n" + map_row(0, 0x100, ".text")
        link_map += map_row(0, 1, r"        C:\sdk\lib\crt0.o:(.text)")
        for i, member in enumerate(("runtime", "termination", "trap_entry", "trap_report", "trap_lookup"), 1):
            link_map += map_row(i, 1, f"        C:/sdk/lib/libavm.a({member}.o):(.text)")
        self.assertEqual(
            disassemble.excluded_ranges(link_map, "C:/sdk/lib/crt0.o"),
            {".text": [(i, i + 1) for i in range(6)]},
        )

    def test_duplicate_names_source_labels_and_template_names(self):
        listing = """\nfixture.elf:\tfile format elf32-avm

Disassembly of section .text:

00000200 <open_section>:
; hidden source
     200: ef           ret
<L0>:
     201: ef           ret

00000202 <open_section>:
; retained source
     202: d0 00        breq8\t0x0 <L0>
<L0>:
     204: e1 00 00     call16\t__avm_terminate
00000207 <int helper<2>(int)>:
     207: ef           ret
00000208 <__avm_mulsi3>:
     208: ef           ret

Disassembly of section .other_text:

00000200 <other>:
     200: ef           ret

Disassembly of section .hidden:

00000200 <hidden>:
     200: ef           ret
"""
        output = disassemble.focused_listing(listing, {".text": [(0x200, 0x202)], ".hidden": [(0x200, 0x201)]})
        self.assertEqual(output.count("<open_section>:"), 1)
        self.assertNotIn("hidden", output)
        self.assertIn("; retained source\n", output)
        self.assertIn("<L0>:\n", output)
        self.assertIn("call16\t__avm_terminate", output)
        self.assertIn("<int helper<2>(int)>:", output)
        self.assertIn("<__avm_mulsi3>:", output)
        self.assertIn("<other>:", output)
        self.assertIn(" ef                    ret\n", output)
        self.assertNotRegex(output, r"(?m)^\s*[0-9a-f]+(?::| <)")

    def test_invalid_map(self):
        for link_map in ("", "not a link map\n"):
            with self.assertRaises(ValueError):
                disassemble.excluded_ranges(link_map, "")

    def test_long_instruction_bytes(self):
        raw = "ff 15 05 " + "00 " * 20
        listing = "Disassembly of section .text:\n\n00000200 <polynomial>:\n"
        listing += f"     200: {raw} fpoly\t5, 0, 0, 0, 0, 0\n"
        output = disassemble.focused_listing(listing, {})
        instruction = output.splitlines()[-1]
        self.assertEqual(instruction, " " + raw + " fpoly\t5, 0, 0, 0, 0, 0")
        self.assertEqual(instruction.index("fpoly"), 71)


class LinkedListingTests(unittest.TestCase):
    def test_full_and_focused_modes(self):
        objdump = BUILD / "llvm-build/bin" / ("llvm-objdump.exe" if sys.platform == "win32" else "llvm-objdump")
        for relative in ("bench/c/constant_arith", "bench/cpp/aggregate_byte_dispatch", "bench/c/complex_cacosh"):
            elf = BUILD / (relative + ".elf")
            image = BUILD / (relative + ".bin")
            hashes = [hashlib.sha256(path.read_bytes()).digest() for path in (elf, image)]
            with tempfile.TemporaryDirectory(dir=BUILD) as directory:
                output = Path(directory) / "listing.asm"
                command = ["cmake", f"-DAVM_OBJDUMP={objdump}", f"-DAVM_INPUT={elf}", f"-DAVM_OUTPUT={output}"]
                script = ["-P", str(ROOT / "cmake/DisassembleAvm.cmake")]
                subprocess.run(command + script, check=True)
                full = output.read_text()
                expected = subprocess.check_output(
                    [str(objdump), "--disassemble", "--source", "--syms", "--symbolize-operands",
                     "--demangle", "--print-imm-hex", "--no-addresses", str(elf)], text=True,
                ).replace(str(elf), elf.name)
                self.assertEqual(full, expected)
                focused_options = ["-DAVM_FOCUSED=ON", f"-DAVM_PYTHON={sys.executable}",
                                   f"-DAVM_FOCUSED_SCRIPT={ROOT / 'tools/disassemble_avm.py'}",
                                   f"-DAVM_LINK_MAP={elf}.map", f"-DAVM_STARTUP={STARTUP}"]
                subprocess.run(command + focused_options + script, check=True)
                focused = output.read_text()
                for name in ("_start", "__avm_run_constructors", "__avm_terminate", "avm_halt",
                             "__avm_trap_entry", "__avm_trap_report", "__avm_trap_lookup", "open_section", "read_uleb128"):
                    self.assertIn(f"<{name}>:", full)
                    self.assertNotIn(f"<{name}>:", focused)
                self.assertNotIn("SYMBOL TABLE:", focused)
                self.assertIn("<avm_test_main>:", focused)
                if relative.endswith("constant_arith"):
                    self.assertIn("<__avm_mulsi3>:", focused)
                    self.assertLess(len(focused.splitlines()), len(full.splitlines()) // 4)
                # Every retained line must be an unchanged line from the full
                # dump, in order (instruction bytes, source and local labels).
                lines = iter(full.splitlines())
                for line in focused.splitlines():
                    self.assertTrue(any(candidate == line for candidate in lines), repr(line))
                bad_options = focused_options + [f"-DAVM_LINK_MAP={output}.missing"]
                result = subprocess.run(command + bad_options + script, capture_output=True)
                self.assertNotEqual(result.returncode, 0)
                self.assertFalse(output.exists(), "failed generation retained a stale listing")
            self.assertEqual(hashes, [hashlib.sha256(path.read_bytes()).digest() for path in (elf, image)])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--build", type=Path, required=True)
    parser.add_argument("--startup", required=True)
    args, remaining = parser.parse_known_args()
    BUILD = args.build.resolve()
    STARTUP = args.startup
    unittest.main(argv=[sys.argv[0], *remaining])
