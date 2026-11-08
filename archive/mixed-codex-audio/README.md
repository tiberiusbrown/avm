# Mixed one/two-bit AVM music: archived implementation

**Status: withdrawn from the live runtime on 2026-10-20.** The user reported
that the recordings sounded great in the emulator but sounded “pretty terrible”
on the hardware's piezo speaker, and requested documentation followed by a
complete rollback of this integration. That hardware listening result is the
reason for withdrawal, despite the successful numerical and emulator tests.

The implementation streamed signed PCM8 at 15,625 Hz using independent
256-sample frames. Each frame selected hold, one-bit prediction, or two-bit
prediction. It replaced AVM's oscillator sequencer and removed SFX, direct
tones, and rate selection. The RPG's six synthesized songs were temporarily
replaced with TownTheme at 1.75 bits/sample and determined_pursuit_loop at
1.25 bits/sample. Both recordings looped at unity gain. The rate menu became
pause/resume. All of those active changes are reverted; this directory is a
historical record, not a supported alternative runtime or SDK component.

## Reading guide

- [Format and reconstruction](FORMAT.md): exact headers, packing, prediction,
  rounding, clamping, frame endings, and worked examples.
- [Native runtime](RUNTIME.md): ISR, foreground refill, 64-byte ring,
  SRAM layout, ABI, timers, gain, looping, and failure behavior.
- [Encoder and assets](ENCODING.md): search/allocator, actual operating points,
  preprocessing, provenance, quality results, and reproduction commands.
- [Validation and hardware outcome](VALIDATION.md): measured results, what
  each test established, what it did not establish, and the hardware rejection.
- [Recovery and rollback](RECOVERY.md): exact source snapshots, base revisions,
  patch limitations, and how to inspect or recover the experiment separately.

## Preserved implementation

| Item | Contents |
|---|---|
| [implementation.zip](implementation.zip) | Exact contents of every existing file changed or added by the integration, including firmware, both RPG packages, generated headers, API, CMake wiring, tests and relevant host codec sources; paths start with `root/` or `rpg/` |
| [root.patch](root.patch) | Full-index binary Git diff of tracked root-repository changes against the recorded baseline |
| [rpg.patch](rpg.patch) | Equivalent tracked diff for the RPG submodule, including the six deleted scores |
| [manifest.json](manifest.json) | Both base commits, every changed/added/deleted path, SHA-256 hashes, ZIP entry inventory and evidence hashes |
| [reference/avr_audio.asm](reference/avr_audio.asm) | Actual archived assembly excerpts: state, table, interpreter hook, foreground service, API dispatch, ISR and hardware initialization |
| [reference/avm_audio_pack.py](reference/avm_audio_pack.py) | Standalone standard-library AVAX-to-AVM1 packer and scalar validator |
| [reference/audio.h](reference/audio.h), [reference/audio_api.asm](reference/audio_api.asm) | Historical public API and guest ABI wrappers |
| [reference/native_tests.cpp](reference/native_tests.cpp) | Native Ardens tests used for the archived implementation |
| [assets/](assets/) | The two exact evaluated `.avax` streams and their original/source hash manifest |
| [evidence/](evidence/) | Original test logs, calibrated timing histograms, quality metrics, allocator details and build resource checks |
| [verify_archive.py](verify_archive.py) | Read-only integrity, payload, decoded-sample hash and embedded-package verification |

Run `python docs/mixed-codex-audio/verify_archive.py` from the repository root
with Python 3.10 or later (verified with 3.12). It uses only the standard library
and does not enable the codec or edit
the working tree. The archive contains the exact encoded payloads, so future
inspection does not depend on ignored build outputs or the original Downloads
files. Raw source recordings, reference WAVs, candidate-bank caches, and the
compiler/emulator binaries are not embedded. The host codec sources and package
binaries needed to understand the implementation are preserved.

## Decision and limits

The decoder reproduced the expected samples, fit the CPU/firmware/SRAM budgets,
and sustained gameplay without observed underruns in the tested emulator
scenarios. Those results did **not** establish acceptable piezo playback. No
oscilloscope, pin waveform, analog transfer, physical underrun, loudness-matched
hardware comparison, or speaker frequency-response measurement was collected.
The root cause of the bad hardware sound is therefore **unknown**. This archive
does not attribute it to the codec, PWM, piezo response, sample rate, gain,
power supply, or any other specific cause without evidence.

The restored production audio system is the preceding A4/C1..C3 synthesizer,
including its SFX/tone APIs, 8/16 kHz selection and six-song RPG bank. The older
host-only compression experiments already present at the baseline remain
untouched. The experimental code and results live here for study; they are no
longer installed, compiled, or selected by the live project.
