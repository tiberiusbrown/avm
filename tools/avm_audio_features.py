"""WAV preparation and phase-insensitive, MIDI-informed Stage 2 features."""
import math
import warnings
from dataclasses import dataclass
from fractions import Fraction
from functools import lru_cache

import numpy as np
from scipy import signal
from scipy.io import wavfile
from scipy.sparse import csr_matrix


@dataclass
class Reference:
    audio: np.ndarray
    rate: float
    metadata: dict


def load_reference(path, rate=15625.):
    with warnings.catch_warnings(record=True) as caught:
        source_rate, raw = wavfile.read(path)
    if raw.ndim not in (1, 2) or not len(raw):
        raise ValueError("WAV must contain mono or multichannel samples")
    channels = 1 if raw.ndim == 1 else raw.shape[1]
    if np.issubdtype(raw.dtype, np.unsignedinteger):
        audio = (raw.astype(np.float64)-128)/128
    elif np.issubdtype(raw.dtype, np.signedinteger):
        audio = raw.astype(np.float64)/float(2**(raw.dtype.itemsize*8-1))
    elif np.issubdtype(raw.dtype, np.floating):
        audio = raw.astype(np.float64)
    else:
        raise ValueError(f"Unsupported WAV sample type {raw.dtype}")
    if not np.all(np.isfinite(audio)):
        raise ValueError("Reference contains non-finite samples")
    messages = [str(w.message) for w in caught]
    peak = float(np.max(np.abs(audio)))
    original_rms = float(np.sqrt(np.mean(audio**2)))
    clipping = float(np.mean(np.abs(audio) >= .999))
    mono_method = "mono"
    if audio.ndim == 2:
        mono = audio.mean(axis=1)
        mono_method = "channel mean"
        if np.sqrt(np.mean(mono**2)) < original_rms * .1 and original_rms > 1e-8:
            mono = audio[:, np.argmax(np.mean(audio**2, axis=0))]
            mono_method = "highest-energy channel (opposed stereo phases)"
            messages.append("Stereo mean cancels; analyzed highest-energy channel")
        audio = mono
    ratio = Fraction(rate/source_rate).limit_denominator(100000)
    audio = signal.resample_poly(audio, ratio.numerator, ratio.denominator)
    block = max(1, round(rate*.01))
    energy = np.sqrt(np.mean(np.pad(audio, (0, (-len(audio)) % block)).reshape(-1, block)**2, axis=1))
    active = np.flatnonzero(energy > max(1e-5, float(energy.max(initial=0))*.01))
    leading = float(active[0]*block/rate) if len(active) else len(audio)/rate
    trailing = max(0., len(audio)/rate-float((active[-1]+1)*block/rate)) if len(active) else len(audio)/rate
    return Reference(audio, rate, {"path": str(path), "source_rate": source_rate,
                     "channels": channels, "sample_type": str(raw.dtype), "duration": len(raw)/source_rate,
                     "peak": peak, "rms": original_rms, "possible_clipping_fraction": clipping,
                     "leading_silence_seconds": leading, "trailing_silence_seconds": trailing,
                     "mono_method": mono_method, "analysis_rate": rate,
                     "resampling": f"polyphase {ratio.numerator}/{ratio.denominator}",
                     "trimmed": False, "warnings": messages})


def activity(audio, rate, fps=250):
    # Short-time energy and positive energy novelty on a fixed 4ms clock.
    edges = np.minimum(np.rint(np.arange(math.ceil(len(audio)/rate*fps)+1)*rate/fps).astype(int), len(audio))
    power = np.r_[0., np.cumsum(np.asarray(audio, dtype=float)**2)]
    rms = np.sqrt(np.diff(power[edges])/np.maximum(1, np.diff(edges)))
    smooth = signal.convolve(rms, np.ones(3)/3, mode="same")
    return rms, np.maximum(0., np.diff(smooth, prepend=0))


def estimate_alignment(reference, song, max_latency=2.):
    """One bounded global latency, guided by original MIDI onset times.

    Positive offset means the recording is later than the MIDI. Local block
    diagnostics detect drift; no time warping or removal of MIDI rests occurs.
    """
    fps = 250
    _, observed = activity(reference.audio, reference.rate, fps)
    midi = np.zeros(max(len(observed), math.ceil(song.duration*fps)+1))
    for note in song.notes:
        index = round(note.start*fps)
        if index < len(midi):
            midi[index] += np.sqrt(note.velocity/127)
    midi = signal.convolve(midi, signal.windows.gaussian(9, 1.3), mode="same")
    observed = np.pad(observed, (0, max(0, len(midi)-len(observed))))

    def lag_for(a, b, bound, preferred=None):
        if np.linalg.norm(a)*np.linalg.norm(b) < 1e-12:
            return 0, 0., 0.
        correlation = signal.correlate(a, b, mode="full", method="fft")
        lags = signal.correlation_lags(len(a), len(b))
        valid = np.abs(lags) <= bound
        values, offsets = correlation[valid], lags[valid]
        index = int(np.argmax(values))
        if preferred is not None:
            nearby = np.abs(offsets-preferred) <= 10  # 40ms attack tolerance
            if nearby.any():
                local = np.flatnonzero(nearby)[np.argmax(values[nearby])]
                # Repeating music often has nearly equal peaks one beat apart.
                # Resolve that ambiguity with observed first activity vs MIDI
                # first attack, never by trimming away a legitimate MIDI rest.
                if values[local] >= values[index]*.9:
                    index = local
        score = float(values[index]/(np.linalg.norm(a)*np.linalg.norm(b)))
        distant = np.abs(offsets-offsets[index]) > 12
        runner = float(np.max(values[distant], initial=0)/(np.linalg.norm(a)*np.linalg.norm(b)))
        return int(offsets[index]), score, score-runner

    unanchored, _, _ = lag_for(observed, midi, round(max_latency*fps))
    rms, _ = activity(reference.audio, reference.rate, fps)
    active = np.flatnonzero(rms > max(1e-5, rms.max(initial=0)*.01))
    first_audio = active[0]/fps if len(active) else 0.
    first_midi = min((n.start for n in song.notes), default=0.)
    anchor = round((first_audio-first_midi)*fps)
    lag, confidence, margin = lag_for(observed, midi, round(max_latency*fps), anchor)
    blocks = []
    # Inspect residual offsets after global alignment, without fitting a warp.
    for start in np.arange(0, max(0., song.duration-4), 8.):
        lo, hi = round(start*fps), round(min(start+8, song.duration)*fps)
        indices = np.arange(lo, hi)+lag
        a = np.zeros(hi-lo)
        valid = (indices >= 0) & (indices < len(observed))
        a[valid] = observed[indices[valid]]
        residual, score, _ = lag_for(a, midi[lo:hi], 63, 0)
        if score > .15:
            blocks.append({"start": float(start), "residual_seconds": residual/fps, "correlation": score})
    messages = []
    if confidence < .15 or margin < .01:
        messages.append("Weak/ambiguous global onset alignment; inspect previews")
    if blocks and max(abs(b["residual_seconds"]) for b in blocks) > .08:
        messages.append("Local timing mismatch exceeds 80ms; timbre optimization cannot fix source timing")
    return {"reference_offset_seconds": lag/fps, "avm_initial_delay_seconds": .004,
            "unanchored_offset_seconds": unanchored/fps, "first_activity_anchor_seconds": anchor/fps,
            "correlation": confidence, "peak_margin": margin, "local_timing": blocks,
            "method": "bounded MIDI-onset/energy-novelty cross-correlation; no time warp", "warnings": messages}


def aligned_audio(reference, duration, offset):
    # Reference at MIDI time t is recording[t+offset]; compensate AVM's first
    # 4ms event delay once, identically for every candidate.
    count = math.ceil(duration*reference.rate-1e-9)
    indices = np.arange(count)+round((offset-.004)*reference.rate)
    result = np.zeros(count)
    valid = (indices >= 0) & (indices < len(reference.audio))
    result[valid] = reference.audio[indices[valid]]
    return result


@dataclass
class Features:
    spectra: tuple
    magnitude: np.ndarray
    frequencies: np.ndarray
    times: np.ndarray
    rms: np.ndarray
    onset: np.ndarray
    centroid: np.ndarray
    rolloff: np.ndarray
    pitch: np.ndarray
    chroma: np.ndarray
    harmonics: np.ndarray


@lru_cache(maxsize=4)
def _dc_filter(rate):
    return signal.butter(2, 10, fs=rate, btype="highpass", output="sos")


def comparison_signal(audio, rate):
    """Reject DC/subsonic energy as an inaudible recording-level shortcut.

    A zero-phase 10Hz high-pass retains C1 (32.7Hz) and musical timing. This
    is analysis preparation, not an asserted piezo response or preview effect.
    """
    audio = np.asarray(audio, dtype=np.float64)
    if len(audio) <= 12:
        return audio-audio.mean() if len(audio) else audio
    return signal.sosfiltfilt(_dc_filter(rate), audio)


@lru_cache(maxsize=8)
def _pitch_kernels(rate):
    frequencies = np.fft.rfftfreq(2048, 1/rate)
    fundamentals = 440*2**((np.arange(24, 108)-69)/12)
    kernels = []
    for harmonic in (1, 2, 3, 4):
        target = fundamentals*harmonic
        width = np.maximum(rate/2048*.8, target*.012)
        kernel = np.exp(-.5*((frequencies[None, :]-target[:, None])/width[:, None])**2)
        kernel[:, frequencies < 30] = 0
        kernel[kernel < .01] = 0
        kernels.append(csr_matrix(kernel))
    return kernels


def extract(audio, rate, *, prepared=False):
    """Three STFT resolutions, compressed log bands, chroma and harmonic combs."""
    audio = np.asarray(audio, dtype=np.float64)
    if not len(audio) or not np.all(np.isfinite(audio)):
        raise ValueError("Feature audio must be finite and nonempty")
    if not prepared:
        audio = comparison_signal(audio, rate)
    hop = max(1, round(rate*.008))
    spectra = []
    for size in (256, 512, 2048):
        padded = np.pad(audio, (0, max(0, size-len(audio))))
        frequencies, times, stft = signal.stft(padded, fs=rate, nperseg=size, noverlap=size-hop,
                                             boundary="zeros", padded=True)
        magnitude = np.abs(stft)
        # Perceptual bands avoid a large empty high-frequency region dominating.
        edges = np.geomspace(30, rate/2+1, 65)
        bands = np.zeros((64, magnitude.shape[1]))
        for i in range(64):
            selected = (frequencies >= edges[i]) & (frequencies < edges[i+1])
            if selected.any():
                bands[i] = np.sqrt(np.mean(magnitude[selected]**2, axis=0))
        spectra.append(bands)
    power = magnitude**2
    total = magnitude.sum(axis=0)+1e-12
    centroid = (magnitude*frequencies[:, None]).sum(axis=0)/total
    cumulative = np.cumsum(power, axis=0)
    rolloff = frequencies[np.argmax(cumulative >= cumulative[-1]*.85, axis=0)]
    # Harmonic salience retains pitch register; chroma alone would hide lost bass.
    notes = np.arange(24, 108)
    pitch = np.zeros((len(notes), magnitude.shape[1]))
    harmonic_distribution = []
    for harmonic, kernel in enumerate(_pitch_kernels(rate), 1):
        energy = kernel.dot(magnitude)
        pitch += energy/harmonic
        harmonic_distribution.append(energy)
    chroma = np.array([pitch[np.arange(len(notes)) % 12 == pc].sum(axis=0) for pc in range(12)])
    # Centered RMS windows on the same frame clock as spectral features.
    squared = np.r_[0., np.cumsum(audio**2)]
    centers = np.rint(times*rate).astype(int)
    lo, hi = np.clip(centers-128, 0, len(audio)), np.clip(centers+128, 0, len(audio))
    rms = np.sqrt((squared[hi]-squared[lo])/np.maximum(1, hi-lo))
    onset = np.maximum(0., np.diff(rms, prepend=0))
    flux = np.maximum(0., np.diff(magnitude, axis=1, prepend=magnitude[:, :1])).sum(axis=0)
    onset = .5*onset/(onset.max(initial=0)+1e-12)+.5*flux/(flux.max(initial=0)+1e-12)
    return Features(tuple(spectra), magnitude, frequencies, times, rms, onset, centroid, rolloff,
                    pitch, chroma, np.array(harmonic_distribution))


def role_masks(features, arrangement, song=None, start=0.):
    """Pitch/time masks using note provenance; shared bins are apportioned.

    No separated stems are asserted. Source masks use original source pitches,
    candidate masks use the preserved Stage 1 register and chord identities.
    """
    masks = np.zeros((3, *features.pitch.shape))
    source = {n.id: n for n in song.notes} if song else {}
    for ch in (0, 1, 2):
        for note in arrangement.voices.get(ch, []):
            active = (features.times+start >= note.start+.004) & (features.times+start < note.end+.004)
            pitches = [source[s].pitch for s in note.sources if s in source] if song else [note.pitch]
            if not song:
                pitches += [note.pitch+v for e in note.effects if e.kind == "arpeggio" for v in e.parameters["offsets"]]
            for pitch in pitches:
                if 24 <= pitch <= 107:
                    masks[ch, pitch-24, active] = 1
    # Mask overlap is acknowledged instead of assigning the whole mix to a role.
    masks /= np.maximum(1, masks.sum(axis=0))[None, :, :]
    return masks
