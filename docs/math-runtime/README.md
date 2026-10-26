# Math runtime accuracy and performance study

The [phase 3–4 report](phase34/report.md) records the current power, hypot,
trig, inverse-trig and shared sine/cosine replacements. The phase 1–2 reports
below remain the historical record for the unchanged exp/log/sqrt kernels.

The generated [accuracy report](accuracy.md) and its JSON inputs are intended to
be committed. `report.md` combines the numerical results with actual AVR cycle,
stack, image-size and algorithm-comparison measurements. Build-only experiments
and preserved source/archive snapshots live in `build/math-policy/`.

## Acceptance policy

The runtime uses binary32, round-to-nearest/ties-to-even, gradual underflow, and
no errno/fenv state. These are maximum acceptance errors, not instructions to
remove accuracy at equal cost. No global fast-math options are used.

For finite results, `error = abs(actual - high_precision_reference)`. A hybrid
budget is `abs_tol + rel_tol * abs(reference)`.

| Functions | Domain | Acceptance budget |
|---|---|---|
| sinf, cosf | Ordinary angles: finite `abs(x) <= 2^20`; the same bound is tested for sampled larger finite angles | Absolute `1e-5` |
| tanf | Finite inputs, including pole neighbors | Hybrid `1e-4 + 1e-4*abs(reference)`; signs/classifications exact; no four-ULP pole promise |
| atanf, atan2f | All finite inputs, including axes and quadrant boundaries | Absolute `1e-6` radians |
| expf | Finite inputs whose correctly rounded result is finite and normal | Relative `1e-5` |
| logf, log2f, log10f | Every positive finite binary32 input, including subnormals and neighbors of one | Hybrid `1e-6 + 1e-6*abs(reference)` |
| powf | Real-valued results for finite binary32 inputs, with finite normal output | Relative `5e-5` |
| sqrtf | All nonnegative finite binary32 inputs | At most 2 ULP from the correctly rounded binary32 root |
| hypotf | All finite binary32 pairs | At most 4 ULP from the correctly rounded binary32 norm |
| fmodf, rounding, classification, sign operations | All binary32 inputs | Exact behavior; NaN payloads are not specified |

For exp/pow outputs below the normal threshold, use absolute tolerance
`rel_tol*2^-126 + 2^-149`, plus the relative term. This defines a useful absolute
budget in gradual underflow, including the final subnormal rounding quantum.
Values that correctly round to infinity must remain infinity. The overflow and
zero-underflow classification cutoffs are preserved. Tiny nonzero outputs may
round to zero within the documented subnormal budget; zero signs remain exact.
Relative-error statistics exclude references smaller than `2^-126`.

NaNs compare by classification. Infinity signs, zero signs, domain errors,
and inexpensive identities (sqrt of exact powers of four, log(1), exp(0), exact
log2 powers of two) have separate exact fixtures. Tests never relax exact
arithmetic, rounding, remainder or classification checks. Replaced trig/atan
vectors use the function-specific budgets above. Tangent pole neighbors now use
that same hybrid budget, explicitly replacing the former four-ULP requirement.
Existing entries marked exact remain exact. The internal reducer returns one
float plus quadrant bits. Up to 100,000 radians it uses an exact high product
and a rounded low product; cancellation goes to a compact split or window path.
Larger inputs use exponent-indexed 32-bit fractional windows, extended to 48 bits
near cancellation. The ordinary sine/cosine contract remains absolute 1e-5
through 2^20. Larger finite inputs are approximate: the same bound is tested on
stratified samples, without claiming exhaustive correct quadrants over all
binary32 inputs. Sine/cosine remain bounded (within the approximation budget),
and infinities/NaNs produce NaNs. Finite binary32 inputs cannot be exact irrational
pi/2 poles; tangent should retain a finite value and the correct sign at tested
neighbors. The selected window's independent product/quality tests replace the
obsolete all-column 280-bit acceptance test; full mode retains dense coverage.

There is no public `exp2f` in this runtime. The base-two exponential candidate
uses a reusable direct `2^r` polynomial, now also used by the private pow exp2
kernel; the same normal/subnormal accuracy budgets would apply to a future
public exp2f. The phase 3–4 runtime adds `sincosf` for paired evaluation.

## Reproduction

For ordinary development use the fast profile; it builds only 42 math fixtures
at O0/O2, native quick checks, a deterministic 100-digit corpus, and FPOLY/SPI
hardware checks. It excludes the full image target and audio/display/timer suites.
The full profile retains all six optimization levels, all 856 AVM cases, dense
native sweeps, existing hardware suites, and the larger adaptive reference search.
`avm_math_full` is a math-only full alternative. Run these from the configured
compiler developer environment:

```sh
python tests/math/run_profile.py --profile fast
python tests/math/run_profile.py --profile math-full
python tests/math/run_profile.py --profile full
python tests/math/run_profile.py --profile bench
cmake --build build --config RelWithDebInfo --target avm_tests --parallel 8
build/avm_tests --filter 'math_(sinf|cosf|tanf|sincos)' --opt O0,O2 --list
```

The timing driver includes image build and execution and writes elapsed seconds
and exit status to `build/math-profile-*.json`. Quick reports stay in `build/`;
they never overwrite the committed long-run reports. Runners build independently
of images; the existing `avm_tests_run` and `avm_bench_run` remain full compatible
build/run commands. Test filters search source stems; optimization selection
affects C/C++ fixtures, while assembly cases run once. Empty matches and invalid
regexes/levels fail clearly. `--list` does not need built images.

The reference driver supports `--functions sinf cosf tanf`, `--samples N`,
`--rounds N` (adaptive rounds after the initial corpus), and `--profile fast`.
It always retains exponent boundaries, exceptional cases and previous worst
fixtures. See the [current measurement report](trig-fast/report.md) for timings
and accuracy details.

Use the existing CMake generator/compiler and RelWithDebInfo. On Windows,
initialize the MSVC developer environment matching `build/CMakeCache.txt` first.
If mpmath is installed in a different Python, set
`-DAVM_MATH_PYTHON_EXECUTABLE=/path/to/python` when configuring CMake; this leaves
the interpreter used by unrelated tests unchanged.
Install the reference dependency with
`python -m pip install -r tests/math/requirements.txt`. The CMake build, native
probes and AVR interpreter all use the production kernels.

```sh
cmake --build build --config RelWithDebInfo --target avm_math_accuracy_probe avm_math_bench_images avm_bench --parallel 8
python tests/math/accuracy_reference.py --output docs/math-runtime/accuracy.json --samples 10000 --fixtures
python tests/math/render_report.py
cmake --build build --config RelWithDebInfo --target avm_tests_run --parallel 8
python tests/math/generate_sqrt_table.py --check
```

`accuracy_reference.py` uses mpmath at 100 decimal digits, seed `0x41564d26`,
every binary32 exponent, representative interval edges and adjacent floats,
random binary32 patterns, ordinary arguments, log/pow near one, exp reduction
boundaries, subnormals, special values, and three local search rounds around
large errors. JSON retains error maxima with worst input bits, failure counts
and percentages, exceptional changes, ULP distributions, and input-range
breakdowns. This is a high-precision search, not an exhaustive proof for all
functions. The existing dense native tests supply much larger coverage; square
root still exhausts both exponent parities and every positive subnormal.

The quick dense checks use independent host double libm, report all failures,
and retain their original input domains. High-precision checks independently
verify the same production objects, including the existing FPOLY host model.
The model itself is checked against the native instruction by interpreter tests.
Worst-case high-precision inputs are exported as C fixtures at all six guest
optimization levels. Original special-value and exact-identity fixtures remain.

The unchanged baseline was repository revision `5f4ddddaa1f11873659a8c99fa38d5f76849c2ab`.
Before changing an algorithm:

```sh
python tests/math/experiment.py --save build/math-policy/baseline
```

Also preserve `build/runtime/libavm.a`, `build/tests/avm_math_accuracy_probe.exe`,
`build/bench/c/`, and the interpreter hex. Baseline and candidate callers are
identical (`-O2`); runtime math uses `-O3 -ffp-contract=off`. For a candidate:

```sh
python tests/math/experiment.py --exp-degree 4 --exp-reduction base2 --log-degree 7 --log-pieces 1 --sqrt-intervals 512 --sqrt-degree 1
python tests/math/run_candidate.py --label trial --sqrt-exhaustive --stack
```

`compare_candidates.py` sweeps the documented degrees, piece counts, Horner and
FPOLY evaluations, near-one specialization, and square-root table alternatives.
It assumes the replacement source is installed and the unchanged baseline has
already been preserved. Coefficients use the generalized existing 80-digit Remez
exchange generator; only the chosen coefficient headers remain in production.
Rejected fits, source/table snapshots, resources and disassemblies stay in the
build tree. `experiment.py --restore DIR` restores a saved source snapshot.

`avm_math_bench_images` avoids unrelated diagnostic MIR builds during iteration.
`run_candidate.py` runs the existing `avm_bench` on identical deterministic
workloads. Cycles include caller loops/accumulation and subtract the adjacent
DEBUG_BREAK baseline. Every workload has 32 calls except sqrt_random (256).
`--stack-output FILE` adds an independent instruction-stepped measurement of
minimum guest Y/SP and extra native stack depth; it leaves cycle timing intact.
Guest stack figures include caller frames and return records, measured from
`0x0a00`, with a 256-byte limit. Resource JSON records linked image bytes,
per-object defined/undefined symbols, and the interpreter SHA-256.
