# Completed rollback validation

Completed 2026-10-20, after preserving and verifying the withdrawn implementation.

The root repository and RPG submodule have **no tracked content differences**
from their recorded pre-integration commits. No commits, pushes, index content
edits or history rewrites were made. The new archive remains under
`docs/mixed-codex-audio/`. A fresh copy of the restored legacy RPG package is
also kept at the repository root as required by the repository instructions.

## Restored behavior

- A4 music and C1..C3 SFX sequencing, oscillator synthesis and direct-tone APIs.
- Previous master-gain convention and selectable 7,812.5/15,625 Hz rates.
- The six original RPG scores, with Dewlight Grove as the default.
- The RPG audio-rate menu, previous generated assets, tests and documentation.
- Matching legacy firmware, SDK headers/libraries, demo and FX/FX-C packages.
- No installed `avm_audio_pack.py` or live mixed-codec asset/generator/test.
  The archival reference packer is deliberately retained inside this directory.

The preceding host-only compression harness and its reports were already part
of the baseline and remain available. Ignored historical build results do not
select an active runtime.

## Checks performed on the restored tree

| Check | Result |
|---|---|
| Full root RelWithDebInfo CMake regression | All 471 AVM guest cases pass |
| Restored native audio suite | All 41 cases pass; observed Timer1 186–193 cycles including entry/vector |
| Legacy animated demo | SFX, pause/resume and both rate transitions pass |
| Host harness and original score compiler | 588 Python tests pass |
| Restored RPG RelWithDebInfo build / CTest | All 10 checks pass, including original six-song bank and FX/FX-C timing |
| Direct restored full-device QA, FX and FX-C | Both pass title/start, six-song switching, dialogue, menus, rate changes, save/restart, scrolling and collision |
| Guest resources | 268 static bytes, complete 171-byte guest stack bound |
| Existing full-LTO checks | Single global game, eliminated game-reference arguments and map tile-position storage pass |
| Root and submodule tracked diff | Empty against the preserved base revisions |
| Playable package identity | Root copy equals restored RPG package; ordinary and FX-C packages equal their baseline versions |
| Firmware/runtime/asset checks | Previous firmware and SFX APIs restored; mixed tracks absent from live packages |
| Archive integrity | Hashes, both decoded PCM8 streams, native payloads, source snapshots and archived package contents pass |
| Recovery patches | Both archived patches pass `git apply --check` against the restored baseline repositories |

Exact command output is preserved in [evidence/rollback/](evidence/rollback/).
The final [package and source check](evidence/rollback/package-source-check.json)
records baseline revisions, package hashes, resource checks and cleanup results.

Builds used the existing Ninja generator and cached MSVC toolset, initialized
through the matching Visual Studio environment. The invocation-local `/Z7`
debug-information workaround retained RelWithDebInfo and avoided the known
program-database manager mismatch; no compiler/generator setting was changed.

These are software/emulator rollback checks. They do not claim a new physical
listening test or overturn the user's report that mixed-codec playback was
unsuitable for the hardware piezo. The mixed implementation remains withdrawn.
