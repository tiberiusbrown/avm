# Inspecting, recovering and reverting the experiment

## Recorded baselines

| Repository | Base commit |
|---|---|
| AVM root | `0d3ab91d825bc9f324da44d59f8200f8d36de5ee` |
| `projects/avm_rpg` submodule | `6485990963d692bd28fada60d5b32e6f564a2665` |

No commits, pushes or history rewrites were made. The native codec integration
was an uncommitted working-tree change. These are the versions immediately
before it, including the host-only codec experiments already present then.
The preservation manifest records every modified/deleted/new file at capture,
so rollback can be scoped to the integration and leave unrelated files alone.

## Read-only verification

```powershell
python docs/mixed-codex-audio/verify_archive.py
```

This checks the archived files and ZIP entry hashes, both exact encoded streams,
native container payload equality, decoded PCM8 hashes, mode counts and sample
counts. It also checks that the archived packaged games contain the complete
native assets and expected firmware. No build toolchain, source recording,
NumPy, emulator or filesystem write is required.

The verifier reports the documented package/guest identity difference between
the earlier timing window and the packages present at archival time. It checks
each against its own preserved hashes; it does not silently equate the builds.

## Exact source and packages

`implementation.zip` uses two prefixes: `root/` for paths relative to the AVM
checkout, `rpg/` for paths relative to the RPG submodule. It contains exact
contents, not reconstructions from documentation. It includes the then-built
ordinary and FX-C RPG packages, the demo package, native HEX/listing/map,
generated music header and catalog, interpreter source, ABI/runtime changes,
CMake wiring, and test changes. It additionally contains the host codec modules,
requirements, relevant Python tests and preceding experiment documentation.

Deleted baseline files are intentionally absent from the ZIP and listed as
`deleted` in the manifest. The binary patches encode their removal. Files
listed as `untracked` are preserved in the ZIP but are **not** in an ordinary
tracked Git diff. Do not assume applying only the two patches recovers them.

Extract into a separate inspection directory, never over the restored live
working tree. A standard ZIP tool or Python's `zipfile` module is sufficient:

```powershell
python -m zipfile -e docs/mixed-codex-audio/implementation.zip build/mixed-audio-inspect
```

The archived packages are under the corresponding `root/` and `rpg/` prefixes.
They are historical rejected versions, not the restored playable packages in
the live checkout. The standalone native packer is also directly inspectable
under `reference/`, without extracting the ZIP.

## Rebuilding separately, if deliberately requested later

Use disposable checkouts at the two base commits. Check each patch with
`git apply --check` in its own repository, apply it there, and restore every
manifest entry marked `untracked` from the appropriate ZIP prefix. A root
patch alone cannot update an independent submodule. Read the manifest's
deletion list when inspecting an extracted overlay; extraction does not delete
the old six scores or old tone source. Do not apply these patches on top of
the restored live tree merely to inspect this archive.

Match the existing generator/compiler and use RelWithDebInfo. For the original
Windows Ninja/MSVC environment, initialize the Visual Studio toolset recorded
in that checkout's CMake cache. The original build encountered C1902 from the
MSVC program-database manager; setting `_CL_=/Z7` for that build invocation
retained RelWithDebInfo while embedding compile debug information. This was
an environment workaround, not a persisted compiler change or codec requirement.

After restoring the archived integration in those separate checkouts:

```powershell
cmake --build build --config RelWithDebInfo --parallel 8 --target avm_tests_run
python -m pytest tools/tests tests/audio/test_score.py -q
cmake --build projects/avm_rpg/build --config RelWithDebInfo --parallel 8
ctest --test-dir projects/avm_rpg/build -C RelWithDebInfo --output-on-failure
```

The root build stages/installs its runtime and packages the demo; use the
matching SDK when building the RPG. The archived `tools/generate_music.py`
packages the `.avax` files through `avm_audio_pack.py` without re-encoding.
The optional `rpg_integration` LLDB runner had the recorded permission failure;
the direct RPG device tests were used for full-device verification instead.
See the captured source/logs for their exact symbol arguments and package paths.

## Rollback performed for this request

The archive was captured and integrity checked **before** restoring any live
file. Only the recorded integration changes were reverted to their recorded
base versions. Newly added packer/demo-generator/test and active `.avax` files
were removed from the live tree after preservation; deleted synthesizer/SFX
code and the six score files were restored. The changed live documentation,
runtime/build wiring, generated headers, tests and packaged artifacts returned
to the preceding system. The added SDK packer copy was removed from the build's
installed SDK, while normal runtime/header/library installation was rebuilt.

The restored system again uses A4 music and C1..C3 effects, SFX/tone APIs,
the previous gain convention and 8/16 kHz selection. The RPG again defaults to
Dewlight Grove and switches among its six original songs. Its pause/rate-menu
experiment is reverted. Fresh legacy packages are verified and the playable
root `rpg.arduboy` is refreshed from the restored RPG, per repository instructions.

The retained host-only experiments were already part of the baseline and are
not deleted. Ignored old experiment outputs may remain under `build/` as
historical data, but no active build target or installed runtime selects this
mixed codec. Rollback validation results are recorded in
[ROLLBACK.md](ROLLBACK.md) after the restored builds finish.
