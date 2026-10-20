#!/usr/bin/env python3
"""Read-only integrity and sample verification of the withdrawn music archive."""

import hashlib
import io
import json
import runpy
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def main():
    manifest = json.loads((ROOT / "manifest.json").read_text(encoding="utf-8"))
    for name, expected in manifest["files"].items():
        path = (ROOT / name).resolve()
        if not path.is_relative_to(ROOT) or not path.is_file():
            raise ValueError(f"missing or unsafe archive path: {name}")
        data = path.read_bytes()
        if len(data) != expected["bytes"] or sha256(data) != expected["sha256"]:
            raise ValueError(f"archive hash mismatch: {name}")

    packer = runpy.run_path(str(ROOT / "reference/avm_audio_pack.py"))
    packed_tracks = []
    provenance = json.loads((ROOT / "assets/manifest.json").read_text(encoding="utf-8"))
    for track in provenance:
        name = track["name"]
        data = (ROOT / f"assets/{name}.avax").read_bytes()
        if sha256(data) != track["avax_sha256"]:
            raise ValueError(f"asset provenance mismatch: {name}")
        packed = packer["pack_avax"](data, loop=True)
        if packed[12:] != data[34:] or len(packed) != track["native_bytes"]:
            raise ValueError(f"native payload mismatch: {name}")
        metrics = json.loads(
            (ROOT / f"evidence/{name}/metrics.json").read_text(encoding="utf-8")
        )
        row = next(
            r
            for r in metrics["measurements"]
            if r["name"] == f"mixed_f256_target{track['target_bits_per_sample']:.2f}"
        )
        decoded_hash = hashlib.sha256()
        samples = 0
        for value in packer["decode_payload"](packed[12:], track["samples"]):
            decoded_hash.update(bytes([value & 255]))
            samples += 1
        if (
            samples != track["samples"]
            or decoded_hash.hexdigest() != row["decoded_pcm8_sha256"]
        ):
            raise ValueError(f"decoded PCM8 mismatch: {name}")
        offset = 12
        counts = {"hold": 0, "one": 0, "two": 0}
        for start in range(0, samples, 256):
            width = packed[offset + 1] >> 6
            counts[("hold", "one", "two")[width]] += 1
            count = min(256, samples - start)
            offset += 2 + ((count - 1) * width + 7) // 8
        if counts != row["frame_type_counts"] or offset != len(packed):
            raise ValueError(f"frame allocation mismatch: {name}")
        packed_tracks.append(packed)
        print(f"{name}: {samples} samples, exact PCM8 hash and native payload verified")

    with zipfile.ZipFile(ROOT / "implementation.zip") as snapshot:
        if len(snapshot.namelist()) != len(set(snapshot.namelist())):
            raise ValueError("duplicate source snapshot entries")
        if set(snapshot.namelist()) != set(manifest["snapshot_entries"]):
            raise ValueError("source snapshot entry list changed")
        for name, expected in manifest["snapshot_entries"].items():
            data = snapshot.read(name)
            if len(data) != expected["bytes"] or sha256(data) != expected["sha256"]:
                raise ValueError(f"snapshot hash mismatch: {name}")
        firmware = {
            "rpg/rpg.arduboy": snapshot.read("root/interp/build/interp.hex"),
            # FX-C firmware was archived inside the package and timing identity.
            "rpg/rpg.fxc.arduboy": None,
        }
        timing = json.loads(
            (ROOT / "evidence/timing/summary.json").read_text(encoding="utf-8")
        )
        recorded_packages = json.loads(
            (ROOT / "evidence/package-identities.json").read_text(encoding="utf-8")
        )
        for path, expected_firmware in firmware.items():
            package_bytes = snapshot.read(path)
            variant = "fxc" if ".fxc." in path else "normal"
            identity = timing["identity"][variant]
            recorded = recorded_packages[variant]
            if sha256(package_bytes) != recorded["archived_package_sha256"]:
                raise ValueError(f"archived package identity mismatch: {path}")
            with zipfile.ZipFile(io.BytesIO(package_bytes)) as package:
                hex_bytes = package.read("interp.hex")
                guest = package.read("fxdata.bin")
                if expected_firmware is not None and hex_bytes != expected_firmware:
                    raise ValueError(f"package/firmware mismatch: {path}")
                if sha256(hex_bytes) != identity["firmware_sha256"]:
                    raise ValueError(f"firmware hash mismatch: {path}")
                if sha256(guest) != recorded["archived_guest_image_sha256"]:
                    raise ValueError(f"guest image hash mismatch: {path}")
                if any(guest.count(track) != 1 for track in packed_tracks):
                    raise ValueError(f"embedded track mismatch: {path}")
            print(f"{path}: firmware, guest image and both full tracks verified")
            if not recorded["same_guest_as_timing_window"]:
                print(
                    "  Preserved timing evidence refers to an earlier guest image; "
                    "firmware matches, package/guest hashes differ (documented)."
                )
    print(
        f"Archive verified: {len(manifest['files'])} files and "
        f"{len(manifest['snapshot_entries'])} exact source/artifact entries"
    )


if __name__ == "__main__":
    main()
