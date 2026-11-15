"""Create the >64 KB exporter fixture used by the native audio tests."""
from pathlib import Path
import runpy
import sys

compiler = runpy.run_path(str(Path(__file__).resolve().parents[2] / "tools/avm_music.py"))
# A terminal rest leaves room for every onset before the fixed music end.
data = compiler["compile_source"]("channel 0 { repeat 22000 { c:4ms } r:4ms }")
assert len(data) > 65535
output = Path(sys.argv[1])
output.parent.mkdir(parents=True, exist_ok=True)
header = compiler["c_array"](data, "long_song")
# Also exercise inferred element counts beyond 16 bits in C and C++.
values = bytes(i % 251 for i in range(65539))
header += "\nstatic const uint8_t AVM_PROGMEM large_bytes[] = {\n"
header += "\n".join("    " + ", ".join(str(value) for value in values[i:i + 16]) + ","
                    for i in range(0, len(values), 16))
header += "\n};\n"
output.write_text(header, encoding="utf-8")
