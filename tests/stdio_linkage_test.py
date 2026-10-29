"""Inspect final ELF data sections and defined symbols, without optional packages."""
import argparse
from pathlib import Path
import struct

def inspect(path):
    data = path.read_bytes()
    assert data[:6] == b"\x7fELF\x01\x01", path
    off = struct.unpack_from("<I", data, 32)[0]
    entsize, count = struct.unpack_from("<HH", data, 46)
    sections = [struct.unpack_from("<10I", data, off + i * entsize) for i in range(count)]
    ram = sum(s[5] for s in sections if s[2] & 2 and s[2] & 0x20000000)
    code = sum(s[5] for s in sections if s[2] & 4)
    symbols = {}
    for s in sections:
        if s[1] != 2:
            continue
        strings = sections[s[6]]
        names = data[strings[4]:strings[4]+strings[5]]
        for i in range(s[4], s[4]+s[5], s[9]):
            name, value, size, info, other, index = struct.unpack_from("<IIIBBH", data, i)
            if not index or index >= len(sections):
                continue
            text = names[name:names.index(0, name)].decode()
            symbols[text] = (size, sections[index][2])
    return ram, code, symbols

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("directory", type=Path)
    args = parser.parse_args()
    expected = {"none": set(), "debug": set(), "include": set(), "snprintf": set(), "vsnprintf": set(),
                "printf": {"stdout"}, "fprintf": {"stdout"}, "fputs": {"stdout"},
                "perror": {"stderr"}, "getchar": {"stdin"}, "stderr": {"stderr"},
                "generic": set(), "one": {"stdout"}, "two": {"stdout", "stderr"},
                "three": {"stdin", "stdout", "stderr"}}
    baseline = inspect(args.directory / "none.elf")[0]
    for name, streams in expected.items():
        ram, code, symbols = inspect(args.directory / (name + ".elf"))
        retained = {s for s in ("stdin", "stdout", "stderr") if "__avm_"+s in symbols}
        assert retained == streams, (name, retained, streams)
        for stream in streams:
            size, flags = symbols["__avm_"+stream]
            assert size == 2 and flags & 2 and flags & 0x20000000, (name, stream, size, flags)
        if name in {"none", "debug", "include", "snprintf", "vsnprintf", "one", "two", "three"}:
            assert ram == baseline + 2 * len(streams), (name, ram, baseline)
        print(f"{name}: streams={','.join(sorted(streams)) or 'none'}, stream RAM={2*len(streams)}, total RAM={ram}, code={code}")

if __name__ == "__main__":
    main()
