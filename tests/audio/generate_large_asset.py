"""Create the >64 KB exporter fixture used by the native audio tests."""
from pathlib import Path
import runpy
import sys

compiler = runpy.run_path(str(Path(__file__).resolve().parents[2] / "tools/avm_music.py"))
# Every note must retrigger, even though all pitches are the same.
data = compiler["compile_source"]("channel 0 { repeat 22000 { c:4ms } }")
assert len(data) > 65535
output = Path(sys.argv[1])
output.parent.mkdir(parents=True, exist_ok=True)
output.write_text(compiler["c_array"](data, "long_song"), encoding="utf-8")
